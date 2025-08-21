program project1;

uses
  gsl_version_,       // underline

  gsl_const_cgs,
  gsl_const_cgsm,
  gsl_const_mks,
  gsl_const_mksa,
  gsl_const_num,

  gsl_cblas,
  gsl_blas_types,
  gsl_complex,

  gsl_block_char,
  gsl_block_short,
  gsl_block_int,
  gsl_block_long,
  gsl_block_uchar,
  gsl_block_ushort,
  gsl_block_uint,
  gsl_block_ulong,
  gsl_block_double,
  gsl_block_float,
  gsl_block_long_double,

  gsl_block_complex_double,
  gsl_block_complex_float,
  gsl_block_complex_long_double,

  gsl_vector_char,
  gsl_vector_short,
  gsl_vector_int,
  gsl_vector_long,
  gsl_vector_uchar,
  gsl_vector_ushort,
  gsl_vector_uint,
  gsl_vector_ulong,
  gsl_vector_double,
  gsl_vector_float,
  gsl_vector_long_double,

  gsl_vector_complex,
  gsl_vector_complex_double,
  gsl_vector_complex_float,
  gsl_vector_complex_long_double,

  gsl_matrix_char,
  gsl_matrix_short,
  gsl_matrix_int,
  gsl_matrix_long,
  gsl_matrix_uchar,
  gsl_matrix_ushort,
  gsl_matrix_uint,
  gsl_matrix_ulong,
  gsl_matrix_double,
  gsl_matrix_float,
  gsl_matrix_long_double,

  gsl_matrix_complex_double,
  gsl_matrix_complex_float,
  gsl_matrix_complex_long_double,

  gsl_statistics_char,
  gsl_statistics_short,
  gsl_statistics_int,
  gsl_statistics_long,
  gsl_statistics_uchar,
  gsl_statistics_ushort,
  gsl_statistics_uint,
  gsl_statistics_ulong,
  gsl_statistics_double,
  gsl_statistics_float,
  gsl_statistics_long_double,

  gsl_bst_types,
  gsl_bst_avl_,
  gsl_bst_rb_,
  gsl_bst,

  gsl_spmatrix,       // makro
  gsl_spmatrix_char,
  gsl_spmatrix_short,
  gsl_spmatrix_int,
  gsl_spmatrix_long,
  gsl_spmatrix_uchar,
  gsl_spmatrix_ushort,
  gsl_spmatrix_uint,
  gsl_spmatrix_ulong,
  gsl_spmatrix_double,
  gsl_spmatrix_float,
  gsl_spmatrix_long_double,
  gsl_spmatrix_complex_double,
  gsl_spmatrix_complex_float,
  gsl_spmatrix_complex_long_double,

  gsl_permutation,
  gsl_permute_char,
  gsl_permute_short,
  gsl_permute_int,
  gsl_permute_long,
  gsl_permute_uchar,
  gsl_permute_ushort,
  gsl_permute_uint,
  gsl_permute_ulong,
  gsl_permute_double,
  gsl_permute_float,
  gsl_permute_long_double,
  gsl_permute_complex_double,
  gsl_permute_complex_float,
  gsl_permute_complex_long_double,
  gsl_permute_vector_char,
  gsl_permute_vector_short,
  gsl_permute_vector_int,
  gsl_permute_vector_long,
  gsl_permute_vector_uchar,
  gsl_permute_vector_ushort,
  gsl_permute_vector_uint,
  gsl_permute_vector_ulong,
  gsl_permute_vector_double,
  gsl_permute_vector_float,
  gsl_permute_vector_long_double,
  gsl_permute_vector_complex_double,
  gsl_permute_vector_complex_float,
  gsl_permute_vector_complex_long_double,
  gsl_permute_matrix_char,
  gsl_permute_matrix_short,
  gsl_permute_matrix_int,
  gsl_permute_matrix_long,
  gsl_permute_matrix_uchar,
  gsl_permute_matrix_ushort,
  gsl_permute_matrix_uint,
  gsl_permute_matrix_ulong,
  gsl_permute_matrix_double,
  gsl_permute_matrix_float,
  gsl_permute_matrix_long_double,
  gsl_permute_matrix_complex_double,
  gsl_permute_matrix_complex_float,
  gsl_permute_matrix_complex_long_double,

  gsl_sort_char,
  gsl_sort_short,
  gsl_sort_int,
  gsl_sort_long,
  gsl_sort_uchar,
  gsl_sort_ushort,
  gsl_sort_uint,
  gsl_sort_ulong,
  gsl_sort_double,
  gsl_sort_float,
  gsl_sort_long_double,
  gsl_sort_vector_char,
  gsl_sort_vector_short,
  gsl_sort_vector_int,
  gsl_sort_vector_long,
  gsl_sort_vector_uchar,
  gsl_sort_vector_ushort,
  gsl_sort_vector_uint,
  gsl_sort_vector_ulong,
  gsl_sort_vector_double,
  gsl_sort_vector_float,
  gsl_sort_vector_long_double,

  gsl_fft,
  gsl_fft_real,
  gsl_fft_real_float,
  gsl_fft_complex,
  gsl_fft_complex_float,
  gsl_fft_halfcomplex,
  gsl_fft_halfcomplex_float,

  gsl_math,
  gsl_complex_math,
  gsl_mode,

  gsl_bspline,
  gsl_cdf,
  gsl_chebyshev,
  gsl_check_range_,
  gsl_combination,
  gsl_deriv,
  gsl_dft_complex,
  gsl_dft_complex_float,
  gsl_dht,
  gsl_diff,
  gsl_eigen,
  gsl_errno,




  gsl_blas,
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
      norm := gsl_blas_dasum(@col.vector); // L1-Norm (Summe)
      gsl_blas_dscal(1 / norm, @col.vector);     // Skaliere Spalte
    end;

    WriteLn();
    WriteLn('Normalized matrix');
    PrintGslMat(mat);

    gsl_matrix_free(mat);
  end;

begin
  main;
end.
