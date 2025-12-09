{$IFDEF read_interface}


type
  Tgsl_sum_levin_u_workspace = record
    size: Tsize_t;
    i: Tsize_t;
    terms_used: Tsize_t;
    sum_plain: double;
    q_num: Pdouble;
    q_den: Pdouble;
    dq_num: Pdouble;
    dq_den: Pdouble;
    dsum: Pdouble;
  end;
  Pgsl_sum_levin_u_workspace = ^Tgsl_sum_levin_u_workspace;

function gsl_sum_levin_u_alloc(n: Tsize_t): Pgsl_sum_levin_u_workspace; cdecl; external libgsl;
procedure gsl_sum_levin_u_free(w: Pgsl_sum_levin_u_workspace); cdecl; external libgsl;
function gsl_sum_levin_u_accel(arr: Pdouble; n: Tsize_t; w: Pgsl_sum_levin_u_workspace; sum_accel: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_sum_levin_u_minmax(arr: Pdouble; n: Tsize_t; min_terms: Tsize_t; max_terms: Tsize_t; w: Pgsl_sum_levin_u_workspace;
  sum_accel: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_sum_levin_u_step(term: double; n: Tsize_t; nmax: Tsize_t; w: Pgsl_sum_levin_u_workspace; sum_accel: Pdouble): longint; cdecl; external libgsl;

type
  Tgsl_sum_levin_utrunc_workspace = record
    size: Tsize_t;
    i: Tsize_t;
    terms_used: Tsize_t;
    sum_plain: double;
    q_num: Pdouble;
    q_den: Pdouble;
    dsum: Pdouble;
  end;
  Pgsl_sum_levin_utrunc_workspace = ^Tgsl_sum_levin_utrunc_workspace;

function gsl_sum_levin_utrunc_alloc(n: Tsize_t): Pgsl_sum_levin_utrunc_workspace; cdecl; external libgsl;
procedure gsl_sum_levin_utrunc_free(w: Pgsl_sum_levin_utrunc_workspace); cdecl; external libgsl;
function gsl_sum_levin_utrunc_accel(arr: Pdouble; n: Tsize_t; w: Pgsl_sum_levin_utrunc_workspace; sum_accel: Pdouble; abserr_trunc: Pdouble): longint; cdecl; external libgsl;
function gsl_sum_levin_utrunc_minmax(arr: Pdouble; n: Tsize_t; min_terms: Tsize_t; max_terms: Tsize_t; w: Pgsl_sum_levin_utrunc_workspace;
  sum_accel: Pdouble; abserr_trunc: Pdouble): longint; cdecl; external libgsl;
function gsl_sum_levin_utrunc_step(term: double; n: Tsize_t; w: Pgsl_sum_levin_utrunc_workspace; sum_accel: Pdouble): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:41:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
