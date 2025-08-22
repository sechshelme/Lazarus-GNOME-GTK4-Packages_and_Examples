{$IFDEF read_interface}



function gsl_spblas_dgemv(TransA: TCBLAS_TRANSPOSE_t; alpha: Tdouble; A: Pgsl_spmatrix; x: Pgsl_vector; beta: Tdouble;
  y: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_spblas_dgemm(alpha: Tdouble; A: Pgsl_spmatrix; B: Pgsl_spmatrix; C: Pgsl_spmatrix): longint; cdecl; external libgsl;
function gsl_spblas_scatter(A: Pgsl_spmatrix; j: Tsize_t; alpha: Tdouble; w: Plongint; x: Pdouble;
  mark: longint; C: Pgsl_spmatrix; nz: Tsize_t): Tsize_t; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:41:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
