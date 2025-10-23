{$IFDEF read_interface}


function gsl_poly_eval(c: Pdouble; len: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_poly_complex_eval(c: Pdouble; len: longint; z: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_complex_poly_complex_eval(c: Pgsl_complex; len: longint; z: Tgsl_complex): Tgsl_complex; cdecl; external libgsl;
function gsl_poly_eval_derivs(c: Pdouble; lenc: Tsize_t; x: Tdouble; res: Pdouble; lenres: Tsize_t): longint; cdecl; external libgsl;
function gsl_poly_dd_taylor(c: Pdouble; xp: Tdouble; dd: Pdouble; x: Pdouble; size: Tsize_t;
  w: Pdouble): longint; cdecl; external libgsl;
function gsl_poly_dd_hermite_init(dd: Pdouble; z: Pdouble; xa: Pdouble; ya: Pdouble; dya: Pdouble;
  size: Tsize_t): longint; cdecl; external libgsl;
function gsl_poly_solve_quadratic(a: Tdouble; b: Tdouble; c: Tdouble; x0: Pdouble; x1: Pdouble): longint; cdecl; external libgsl;
function gsl_poly_complex_solve_quadratic(a: Tdouble; b: Tdouble; c: Tdouble; z0: Pgsl_complex; z1: Pgsl_complex): longint; cdecl; external libgsl;
function gsl_poly_solve_cubic(a: Tdouble; b: Tdouble; c: Tdouble; x0: Pdouble; x1: Pdouble;
  x2: Pdouble): longint; cdecl; external libgsl;
function gsl_poly_complex_solve_cubic(a: Tdouble; b: Tdouble; c: Tdouble; z0: Pgsl_complex; z1: Pgsl_complex;
  z2: Pgsl_complex): longint; cdecl; external libgsl;

type
  Tgsl_poly_complex_workspace = record
    nc: Tsize_t;
    matrix: Pdouble;
  end;
  Pgsl_poly_complex_workspace = ^Tgsl_poly_complex_workspace;

function gsl_poly_complex_workspace_alloc(n: Tsize_t): Pgsl_poly_complex_workspace; cdecl; external libgsl;
procedure gsl_poly_complex_workspace_free(w: Pgsl_poly_complex_workspace); cdecl; external libgsl;
function gsl_poly_complex_solve(a: Pdouble; n: Tsize_t; w: Pgsl_poly_complex_workspace; z: Tgsl_complex_packed_ptr): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:19:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
