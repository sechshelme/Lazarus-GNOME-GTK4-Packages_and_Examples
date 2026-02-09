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

  //function malloc(__size: Tsize_t): pointer; cdecl; external libc;
  //procedure free(__ptr: pointer); cdecl; external libc;

type
  TVector3f = array[0..2] of single;
  TVector4f = array[0..3] of single;


  //  OpenSCAD

implementation

type
  Tbuf = array[0..15] of byte;

procedure draw;
var
  m_size: Tsize_t;
  cube_mem, holeX_mem, holeY_mem, holeZ_mem, diff1_mem, diff2_mem, final_mem: Tbuf;
  cube, holeX, holeY, holeZ, res1, res2, final_res, final_w_normals: PManifoldManifold;
  mesh_mem, normal_mem: Pointer;

  mesh: PManifoldMeshGL;
  n_verts, n_tris, n_props: longint;
  verts_data: array of single;
  tris_data: array of Tuint32_t;
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
  m_size := manifold_manifold_size();

  //  WriteLn(manifold_meshgl_size);

  cube := manifold_cube(@cube_mem, 10.0, 10.0, 10.0, 1);

  holeX := manifold_cube(@holeX_mem, 20.0, 6.0, 6.0, 1);

  holeY := manifold_cube(@holeY_mem, 6.0, 20.0, 6.0, 1);
  //  holeZ := manifold_cube(@holeZ_mem, 4.0, 4.0, 20.0, 1);

  holeZ := manifold_cylinder(@holeZ_mem, 20.0, 4.5, 4.5, 32, 1);


  res1 := manifold_difference(@diff1_mem, cube, holeX);
  res2 := manifold_difference(@diff2_mem, res1, holeY);
  final_res := manifold_difference(@final_mem, res2, holeZ);


  // --- 4. DATEN-EXTRAKTION ---


  normal_mem := GetMem(manifold_manifold_size());
  final_w_normals := manifold_calculate_normals(normal_mem, final_res, 3, 60.0);

  er := manifold_status(final_w_normals);
  if er <> MANIFOLD_NO_ERROR then begin
    WriteLn('Fehler in Manifold Geometrie!  (', er, ')');
  end;

  mesh_mem := GetMem(manifold_meshgl_size);
  mesh := manifold_get_meshgl(mesh_mem, final_w_normals);


  n_verts := manifold_meshgl_num_vert(mesh);
  n_tris := manifold_meshgl_num_tri(mesh);
  n_props := manifold_meshgl_num_prop(mesh);

  SetLength(verts_data, n_verts * n_props);
  SetLength(tris_data, n_tris * 3);

  manifold_meshgl_vert_properties(PSingle(verts_data), mesh);
  manifold_meshgl_tri_verts(Puint32_t(tris_data), mesh);


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


    //    glColor3f(1, 1, 1);
    v := vectors[a].n;
    glNormal3fv(@v);
    v := vectors[a].v;
    glVertex3fv(@v);

    //    glColor3f(0, 1, 0);
    v := vectors[b].n;
    glNormal3fv(@v);
    v := vectors[b].v;
    glVertex3fv(@v);

    //    glColor3f(0, 0, 1);
    v := vectors[c].n;
    glNormal3fv(@v);
    v := vectors[c].v;
    glVertex3fv(@v);

  end;
  glEnd;

  manifold_destruct_manifold(cube);
  manifold_destruct_manifold(holeX);
  manifold_destruct_manifold(holeY);
  manifold_destruct_manifold(holeZ);
  manifold_destruct_manifold(res1);
  manifold_destruct_manifold(res2);
  manifold_destruct_manifold(final_res);
  manifold_destruct_meshgl(mesh);

  Freemem(mesh_mem);
  Freemem(normal_mem);
end;

end.
