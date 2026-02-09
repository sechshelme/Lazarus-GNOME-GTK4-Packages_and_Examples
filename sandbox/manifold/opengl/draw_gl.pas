unit draw_gl;

interface

uses
  gl,
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
  TMMdata = record
    o: PManifoldManifold;
    m: array[0..15] of byte;
  end;

  TMMGLdata = record
    o: PManifoldManifold;
    m: array[0..231] of byte;
  end;

procedure draw;
var
  cube, holeX, holeY, holeZ,
  res1, res2,
  final, normal: TMMdata;

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

begin

  //  WriteLn(manifold_meshgl_size);

  cube.o := manifold_cube(@cube.m, 10.0, 10.0, 10.0, 1);

  holeX.o := manifold_cube(@holeX.m, 20.0, 6.0, 6.0, 1);
  holeY.o := manifold_cube(@holeY.m, 6.0, 20.0, 6.0, 1);
  holeZ.o := manifold_cylinder(@holeZ.m, 20.0, 4.5, 4.5, 32, 1);

  res1.o := manifold_difference(@res1.m, cube.o, holeX.o);
  res2.o := manifold_difference(@res2.m, res1.o, holeY.o);
  final.o := manifold_difference(@final.m, res2.o, holeZ.o);


  // --- 4. DATEN-EXTRAKTION ---

  normal.o := manifold_calculate_normals(@normal.m, final.o, 3, 60.0);

  er := manifold_status(final.o);
  if er <> MANIFOLD_NO_ERROR then begin
    WriteLn('Fehler in Manifold Geometrie!  (', er, ')');
  end;

  mesh.o := manifold_get_meshgl(@mesh.m, normal.o);

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

  manifold_destruct_manifold(cube.o);
  manifold_destruct_manifold(holeX.o);
  manifold_destruct_manifold(holeY.o);
  manifold_destruct_manifold(holeZ.o);
  manifold_destruct_manifold(res1.o);
  manifold_destruct_manifold(res2.o);
  manifold_destruct_manifold(final.o);
  manifold_destruct_manifold(normal.o);
  manifold_destruct_meshgl(mesh.o);
end;

end.
