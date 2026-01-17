program project1;

uses
  fp_gsl;

  procedure PrintGslMat(m: Pgsl_matrix);
  var
    i, j: integer;
  begin
    for i := 0 to m^.size1 - 1 do begin
      for j := 0 to m^.size2 - 1 do begin
        Write(gsl_matrix_get(m, i, j): 2: 1, '   ');
      end;
      WriteLn();
    end;
  end;

  procedure main;
  var
    mat: Pgsl_matrix;
    i, j: integer;
    col: Tgsl_vector_view;
    norm: double;
  begin
    WriteLn('Version: ', gsl_version);
    WriteLn();

    mat := gsl_matrix_alloc(3, 4);

    for i := 0 to mat^.size1 - 1 do begin
      for j := 0 to mat^.size2 - 1 do begin
        gsl_matrix_set(mat, i, j, Random * 4);
      end;
    end;

    WriteLn('Original matrix');
    PrintGslMat(mat);

    for j := 0 to mat^.size2 - 1 do begin
      col := gsl_matrix_column(mat, j);
      norm := gsl_blas_dasum(@col.vector);    // L1-Norm (Summe)
      gsl_blas_dscal(1 / norm, @col.vector);  // Skaliere Spalte
    end;

    WriteLn();
    WriteLn('Normalized matrix');
    PrintGslMat(mat);

    gsl_matrix_free(mat);
  end;

begin
  main;
end.
