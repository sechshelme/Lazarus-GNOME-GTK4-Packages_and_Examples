program project1;

uses
  fp_polylib64;

const
  MAX_RAYS = 200;

  procedure print_opengl_indices(p: PPolyhedron);
  var
    face_indices: array of integer = nil;
    num_on_face, i, j, k: integer;
    res: int64;
    x, y, z: TValue;
  begin
    WriteLn('Vertex:');
    for i := 0 to p^.NbRays - 1 do begin
      if p^.Ray[i][0] > 0 then begin
        x := p^.Ray[i][1];
        y := p^.Ray[i][2];
        z := p^.Ray[i][3];

        WriteLn('  ', i: 3, '.  [', x: 4, ', ', y: 4, ', ', z: 4, ']');
      end;
    end;

    WriteLn('Indices:');
    for i := 0 to p^.NbConstraints - 1 do begin
      SetLength(face_indices, p^.NbRays);
      num_on_face := 0;

      for j := 0 to p^.NbRays - 1 do begin
        res := 0;
        res += p^.Constraint[i][1] * p^.Ray[j][1];
        res += p^.Constraint[i][2] * p^.Ray[j][2];
        res += p^.Constraint[i][3] * p^.Ray[j][3];
        res += p^.Constraint[i][4] * p^.Ray[j][0];

        if res = 0 then  begin
          face_indices[num_on_face] := j;
          inc(num_on_face);
        end;
      end;

      if num_on_face >= 3 then begin
        for  k := 1 to num_on_face - 1 - 1 do begin
          WriteLn('  ', i: 3, '.  ', face_indices[0], ' -> ', face_indices[k], ' -> ', face_indices[k + 1]);
        end;
      end;
    end;
  end;

  procedure extract_mesh_data(D: Ppolyhedron);
  var
    p_idx: integer = 0;
    p: Ppolyhedron;
  begin
    p := D;
    while p <> nil do begin
      WriteLn(#10'--- Teil-Polyeder ', p_idx, ' ---');

      if (p <> nil) and (p^.Ray <> nil) then begin
        print_opengl_indices(p);
      end;

      Inc(p_idx);
      p := p^.next;
    end;
  end;

  procedure main;
  const
    a_con: array [0..5, 0..4] of int64 = (
      (1, 1, 0, 0, 0),
      (1, -1, 0, 0, 10),
      (1, 0, 1, 0, 0),
      (1, 0, -1, 0, 10),
      (1, 0, 0, 1, 0),
      (1, 0, 0, -1, 10));

    b_con: array [0..3, 0..4] of int64 = (
      (1, 1, 0, 0, -2),
      (1, -1, 0, 0, 8),
      (1, 0, 1, 0, -2),
      (1, 0, -1, 0, 8));

  var
    A_mat, B_mat: Pmatrix;
    i, j: integer;
    A, B, C, p: Ppolyhedron;
    count: SizeInt;
  begin
    A_mat := Matrix_Alloc(6, 5);

    for  i := 0 to 5 do begin
      for  j := 0 to 4 do begin
        A_mat^.p[i][j] := a_con[i][j];
      end;
    end;

    B_mat := Matrix_Alloc(4, 5);
    for  i := 0 to 3 do begin
      for  j := 0 to 4 do begin
        B_mat^.p[i][j] := b_con[i][j];
      end;
    end;

    A := Constraints2Polyhedron(A_mat, MAX_RAYS);
    B := Constraints2Polyhedron(B_mat, MAX_RAYS);
    C := DomainDifference(A, B, MAX_RAYS);

    WriteLn('Das Objekt mit Loch besteht aus folgenden konvexen Teilen:');
    count := 0;
    p := C;

    while p <> nil do begin
      WriteLn(#10'Teil-Polyeder ', count);
      Polyhedron_Print(stdout, P_VALUE_FMT, p);
      p := p^.next;
      inc(count);
    end;

    extract_mesh_data(C);

    Domain_Free(C);
    Polyhedron_Free(A);
    Polyhedron_Free(B);
    Matrix_Free(A_mat);
    Matrix_Free(B_mat);
  end;

begin
  main;
end.
