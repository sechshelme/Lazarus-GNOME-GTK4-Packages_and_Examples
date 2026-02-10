unit draw_gl;

interface

uses
  gl,
  fp_manifold_obj,
  fp_manifoldc;

const
  MAX_RAYS = 200;

procedure draw;

const
  {$IFDEF linux}
  libc = 'c';
  {$ENDIF}

  {$IFDEF windows}
  libc = 'msvcrt.dll';
  {$ENDIF}

type
  TVector3f = array[0..2] of single;
  TVector4f = array[0..3] of single;

  //  OpenSCAD

implementation

type
  TMMGLdata = record
    o: PManifoldManifold;
    m: array[0..231] of byte;
  end;

procedure draw;
var
  mesh: TMMGLdata;

  n_verts, n_tris, n_props: longint;
  verts_data: array of single = nil;
  tris_data: array of Tuint32_t = nil;
  x, y, z, nx, ny, nz: single;
  i: integer;
  a, b, c: Tuint32_t;

  v: TVector3f;
  vectors: array of record
    v, n: TVector3f;
    end
  = nil;
  er: TManifoldError;

  cube, hole: TManifold;

begin
  cube := TManifold.cube(10.0, 10.0, 10.0, 1);

  hole := TManifold.cube(20.0, 6.0, 6.0, 1);
  hole := TManifold.rotate(hole, 10.0, 0.0, 0.0, True);
  cube := TManifold.difference(cube, hole, True, True);

  hole := TManifold.cube(6.0, 20.0, 6.0, 1);
  cube := TManifold.difference(cube, hole, True, True);

  hole := TManifold.cylinder(20.0, 4.5, 4.5, 32, 1);
  cube := TManifold.difference(cube, hole, True, True);


  // --- 4. DATEN-EXTRAKTION ---

  cube := TManifold.calculate_normals(cube, 3, 60.0, True);

  er := manifold_status(cube.obj);
  if er <> MANIFOLD_NO_ERROR then begin
    WriteLn('Fehler in Manifold Geometrie!  (', er, ')');
  end;

  mesh.o := manifold_get_meshgl(@mesh.m, cube.obj);

  n_verts := manifold_meshgl_num_vert(mesh.o);
  n_tris := manifold_meshgl_num_tri(mesh.o);
  n_props := manifold_meshgl_num_prop(mesh.o);

  SetLength(verts_data, n_verts * n_props);
  SetLength(tris_data, n_tris * 3);

  manifold_meshgl_vert_properties(PSingle(verts_data), mesh.o);
  manifold_meshgl_tri_verts(Puint32_t(tris_data), mesh.o);



  WriteLn('--- MANIFOLD CSG ERGEBNIS ---');
  WriteLn('n_verts: ', n_verts);
  WriteLn('n_tris: ', n_tris);
  WriteLn('n_props: ', n_props);


  WriteLn(#10'Liste aller Eckpunkte (Vertices):');

  SetLength(vectors, n_verts);

  for  i := 0 to n_verts - 1 do begin
    x := verts_data[i * n_props + 0];
    y := verts_data[i * n_props + 1];
    z := verts_data[i * n_props + 2];

    nx := verts_data[i * n_props + 6];
    ny := verts_data[i * n_props + 7];
    nz := verts_data[i * n_props + 8];

    //    WriteLn(i: 3, '  ', x: 4: 2, '/', y: 4: 2, '/', z: 4: 2, ' - ', nx: 4: 2, '/', ny: 4: 2, '/', nz: 4: 2);

    vectors[i].v[0] := x;
    vectors[i].v[1] := y;
    vectors[i].v[2] := z;

    vectors[i].n[0] := nx;
    vectors[i].n[1] := ny;
    vectors[i].n[2] := nz;
  end;

  WriteLn(#10'Liste aller Dreiecke (Indices):');
  glBegin(GL_TRIANGLES);
  for  i := 0 to n_tris - 1 do begin
    a := tris_data[i * 3 + 0];
    b := tris_data[i * 3 + 1];
    c := tris_data[i * 3 + 2];
    //    WriteLn(i: 3, '  ', a: 2, '/', b: 2, '/', c: 2);

    v := vectors[a].n;
    glNormal3fv(@v);
    v := vectors[a].v;
    glVertex3fv(@v);

    v := vectors[b].n;
    glNormal3fv(@v);
    v := vectors[b].v;
    glVertex3fv(@v);

    v := vectors[c].n;
    glNormal3fv(@v);
    v := vectors[c].v;
    glVertex3fv(@v);

  end;
  glEnd;

  manifold_destruct_meshgl(mesh.o);
end;

end.
