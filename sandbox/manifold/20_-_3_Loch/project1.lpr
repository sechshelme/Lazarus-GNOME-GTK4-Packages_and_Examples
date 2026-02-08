program project1;

uses
  fp_manifoldc;

const
  {$IFDEF linux}
  libc = 'c';
  {$ENDIF}

  {$IFDEF windows}
  libc = 'msvcrt.dll';
  {$ENDIF}
function malloc(__size: Tsize_t): pointer; cdecl; external libc;
  procedure free(__ptr: pointer); cdecl; external libc;



  procedure main;
  var
    m_size: Tsize_t;
    cube_mem, holeX_mem, holeY_mem, holeZ_mem, diff1_mem, diff2_mem,
    final_mem, mesh_mem: Pointer;
    cube, holeX, holeY, holeZ, res1, res2, final_res: PManifoldManifold;
    mesh: PManifoldMeshGL;
    n_verts, n_tris, n_props: longint;
    verts_data: PSingle;
    tris_data: Puint32_t;
    x, y, z: single;
    i: integer;
    a, b, c: Tuint32_t;
  begin
    m_size := manifold_manifold_size();
    WriteLn(m_size);

    cube_mem := malloc(m_size);
    holeX_mem := malloc(m_size);
    holeY_mem := malloc(m_size);
    holeZ_mem := malloc(m_size);
    diff1_mem := malloc(m_size);
    diff2_mem := malloc(m_size);
    final_mem := malloc(m_size);
    mesh_mem := malloc(manifold_meshgl_size);

    cube := manifold_cube(cube_mem, 10.0, 10.0, 10.0, 1);

    holeX := manifold_cube(holeX_mem, 20.0, 4.0, 4.0, 1);
    holeY := manifold_cube(holeY_mem, 4.0, 20.0, 4.0, 1);
    holeZ := manifold_cube(holeZ_mem, 4.0, 4.0, 20.0, 1);

    res1 := manifold_difference(diff1_mem, cube, holeX);
    res2 := manifold_difference(diff2_mem, res1, holeY);
    final_res := manifold_difference(final_mem, res2, holeZ);

    // --- 4. DATEN-EXTRAKTION ---
    mesh := manifold_get_meshgl(mesh_mem, final_res);

    n_verts := manifold_meshgl_num_vert(mesh);
    n_tris := manifold_meshgl_num_tri(mesh);
    n_props := manifold_meshgl_num_prop(mesh);

    verts_data := PSingle(malloc(n_verts * n_props * sizeof(single)));
    tris_data := Puint32_t(malloc(n_tris * 3 * sizeof(Tuint32_t)));

    manifold_meshgl_vert_properties(verts_data, mesh);
    manifold_meshgl_tri_verts(tris_data, mesh);

    WriteLn('--- MANIFOLD CSG ERGEBNIS ---');
    WriteLn('Objekt: Würfel mit 3 Achsen-Bohrungen (Menger Stufe 1)');
    WriteLn('Stats: %zu Vertices, %zu Dreiecke', n_verts, '  ', n_tris);

    WriteLn(#10'Liste aller Eckpunkte (Vertices):');
    for  i := 0 to n_verts - 1 do begin
      x := verts_data[i * n_props + 0];
      y := verts_data[i * n_props + 1];
      z := verts_data[i * n_props + 2];
      WriteLn(i: 3, '  ', x: 4: 2, '/', y: 4: 2, '/', z: 4: 2);
    end;

    WriteLn(#10'Liste aller Dreiecke (Indices):');
    for  i := 0 to n_tris - 1 do begin
      a := tris_data[i * 3 + 0];
      b := tris_data[i * 3 + 1];
      c := tris_data[i * 3 + 2];
      WriteLn(i: 3, '  ', a: 2, '/', b: 2, '/', c: 2);
    end;

    manifold_delete_manifold(cube);
    manifold_delete_manifold(holeX);
    manifold_delete_manifold(holeY);
    manifold_delete_manifold(holeZ);
    manifold_delete_manifold(res1);
    manifold_delete_manifold(res2);
    manifold_delete_manifold(final_res);
    manifold_delete_meshgl(mesh);

    // --- 6. CLEANUP ---
    free(verts_data);
    free(tris_data);
    //WriteLn(111111);
    //free(cube_mem);
    //WriteLn(111111);
    //free(holeX_mem);
    //free(holeY_mem);
    //free(holeZ_mem);
    //free(diff1_mem);
    //free(diff2_mem);
    //free(final_mem);
    //free(mesh_mem);
  end;

begin
  main;
end.
