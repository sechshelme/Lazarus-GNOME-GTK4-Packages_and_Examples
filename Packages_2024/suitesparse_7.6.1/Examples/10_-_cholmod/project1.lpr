program project1;

uses
  fp_suitesparse;

  procedure main1;
  const
    n: integer = 4;

    Ap: array of integer = (0, 1, 2, 3, 4);
    Ai: array of integer = (0, 1, 2, 3);
    Ax: array of double = (1.1, 2.2, 3.3, 4.4);
  var
    L: Pcholmod_factor;
    A: Tcholmod_sparse;
    c: Tcholmod_common;
  begin
    cholmod_start(@c);

    A.nrow := n;
    A.ncol := n;
    A.nzmax := n;
    A.p := PInteger(Ap);
    A.i := PInteger(Ai);
    A.x := PDouble(Ax);
    A.z := nil;
    A.sorted := 1;
    A.packed_ := 1;
    A.stype := 1;
    A.xtype := CHOLMOD_REAL;
    A.dtype := CHOLMOD_DOUBLE;


    L := cholmod_analyze(@A, @c);
    cholmod_factorize(@A, L, @c);

    if c.status = CHOLMOD_OK then begin
      WriteLn('Cholesky-Faktorisierung erfolgreich.');
    end else begin
      WriteLn('Fehler bei der Cholesky-Faktorisierung.');
    end;

    cholmod_free_factor(@L, @c);
    cholmod_finish(@c);
  end;


  procedure main2;
  const
    n: integer = 4;

    Ax: array[0..15] of double = (
      1.1, 2.1, 3.1, 4.1,
      1.2, 2.2, 3.2, 4.2,
      1.3, 2.3, 3.3, 4.3,
      1.4, 2.4, 3.4, 4.4);
  var
    c: Tcholmod_common;
    A_dense_src, A_dense_des: Pcholmod_dense;
    A_sparse: Pcholmod_sparse;
    vals, dense_vals: PDouble;
    i, col, row: integer;
  begin
    cholmod_start(@c);

    A_dense_src := cholmod_allocate_dense(n, n, n, CHOLMOD_REAL, @c);
    Move(Ax[0], A_dense_src^.x^, SizeOf(double) * Length(Ax));

    A_sparse := cholmod_dense_to_sparse(A_dense_src, 1, @c);
    cholmod_free_dense(@A_dense_src, @c);

    WriteLn('Urspruengliche Sparse Matrix (CSC):');
    cholmod_print_sparse(A_sparse, 'A_sparse', @c);

    WriteLn('Matrix Size; ', A_sparse^.nzmax);
    vals := Pdouble(A_sparse^.x);
    for  i := 0 to A_sparse^.nzmax - 1 do begin
      vals[i] *= 2.0;
    end;

    WriteLn('Skalierte Sparse Matrix (Werte * 2):');
    cholmod_print_sparse(A_sparse, 'A_sparse_scaled', @c);

    A_dense_des := cholmod_sparse_to_dense(A_sparse, @c);
    cholmod_free_sparse(@A_sparse, @c);

    WriteLn('Skalierte dichte Matrix:');
    dense_vals := Pdouble(A_dense_des^.x);
    for col := 0 to n - 1 do begin
      Write('[ ');
      for row := 0 to n - 1 do begin
        Write(dense_vals[col * n + row]: 4: 2, ' ');
      end;
      WriteLn(' ]');
    end;
    cholmod_free_dense(@A_dense_des, @c);

    cholmod_finish(@c);
  end;

begin
  WriteLn(#10);
  main1;
  WriteLn(#10);
  main2;
end.
