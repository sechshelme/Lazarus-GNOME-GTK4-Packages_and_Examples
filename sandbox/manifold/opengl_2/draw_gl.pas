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

procedure draw;
var
  mesh: TMeshGL;

  n_verts, n_tris, n_props: longint;
  verts_data: Psingle = nil;
  tris_data: Puint32_t = nil;
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

  cube := TManifold.calculate_normals(cube, 3, 60.0, True);

  er := manifold_status(cube.obj);
  if er <> MANIFOLD_NO_ERROR then begin
    WriteLn('Fehler in Manifold Geometrie!  (', er, ')');
  end;

  mesh := TMeshGL.get_meshgl(cube, True);

    n_verts := mesh.meshgl_num_vert;
  n_tris := mesh.meshgl_num_tri;
  n_props :=mesh.meshgl_num_prop;


  WriteLn('--- MANIFOLD CSG ERGEBNIS ---');
  WriteLn('n_verts: ', n_verts);
  WriteLn('n_tris: ', n_tris);
  WriteLn('n_props: ', n_props);

   tris_data:= mesh.meshgl_tri_verts;
    verts_data:=  mesh.meshgl_vert_properties;

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

  mesh.Free;

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
end;


end.
