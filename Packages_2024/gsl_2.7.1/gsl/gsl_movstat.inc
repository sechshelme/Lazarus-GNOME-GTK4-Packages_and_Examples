{$IFDEF read_interface}


type
  Pgsl_movstat_end_t = ^Tgsl_movstat_end_t;
  Tgsl_movstat_end_t = longint;

const
  GSL_MOVSTAT_END_PADZERO = 0;
  GSL_MOVSTAT_END_PADVALUE = 1;
  GSL_MOVSTAT_END_TRUNCATE = 2;

type
  Tgsl_movstat_accum = record
    size: function(n: Tsize_t): Tsize_t; cdecl;
    init: function(n: Tsize_t; vstate: pointer): longint; cdecl;
    insert: function(x: double; vstate: pointer): longint; cdecl;
    delete_oldest: function(vstate: pointer): longint; cdecl;
    get: function(params: pointer; result: Pdouble; vstate: pointer): longint; cdecl;
  end;
  Pgsl_movstat_accum = ^Tgsl_movstat_accum;

  Tgsl_movstat_function = record
    _function: function(n: Tsize_t; x: Pdouble; params: pointer): double; cdecl;
    params: pointer;
  end;
  Pgsl_movstat_function = ^Tgsl_movstat_function;

type
  Tgsl_movstat_workspace = record
    H: Tsize_t;
    J: Tsize_t;
    K: Tsize_t;
    work: Pdouble;
    state: pointer;
    state_size: Tsize_t;
  end;
  Pgsl_movstat_workspace = ^Tgsl_movstat_workspace;

function gsl_movstat_alloc(K: Tsize_t): Pgsl_movstat_workspace; cdecl; external libgsl;
function gsl_movstat_alloc2(H: Tsize_t; J: Tsize_t): Pgsl_movstat_workspace; cdecl; external libgsl;
function gsl_movstat_alloc_with_size(accum_state_size: Tsize_t; H: Tsize_t; J: Tsize_t): Pgsl_movstat_workspace; cdecl; external libgsl;
procedure gsl_movstat_free(w: Pgsl_movstat_workspace); cdecl; external libgsl;
function gsl_movstat_apply_accum(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; accum: Pgsl_movstat_accum; accum_params: pointer; y: Pgsl_vector;
  z: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;
function gsl_movstat_apply(endtype: Tgsl_movstat_end_t; F: Pgsl_movstat_function; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;
function gsl_movstat_fill(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; idx: Tsize_t; H: Tsize_t; J: Tsize_t;
  window: Pdouble): Tsize_t; cdecl; external libgsl;
function gsl_movstat_mean(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;
function gsl_movstat_variance(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;
function gsl_movstat_sd(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;
function gsl_movstat_median(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;
function gsl_movstat_min(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;
function gsl_movstat_max(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;
function gsl_movstat_minmax(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; y_min: Pgsl_vector; y_max: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;
function gsl_movstat_mad0(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; xmedian: Pgsl_vector; xmad: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;
function gsl_movstat_mad(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; xmedian: Pgsl_vector; xmad: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;
function gsl_movstat_qqr(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; q: double; xqqr: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;
function gsl_movstat_Sn(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; xscale: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;
function gsl_movstat_Qn(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; xscale: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;
function gsl_movstat_sum(endtype: Tgsl_movstat_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): longint; cdecl; external libgsl;

var
  gsl_movstat_accum_mad: Pgsl_movstat_accum; cvar;external libgsl;
  gsl_movstat_accum_max: Pgsl_movstat_accum; cvar;external libgsl;
  gsl_movstat_accum_mean: Pgsl_movstat_accum; cvar;external libgsl;
  gsl_movstat_accum_median: Pgsl_movstat_accum; cvar;external libgsl;
  gsl_movstat_accum_min: Pgsl_movstat_accum; cvar;external libgsl;
  gsl_movstat_accum_minmax: Pgsl_movstat_accum; cvar;external libgsl;
  gsl_movstat_accum_sd: Pgsl_movstat_accum; cvar;external libgsl;
  gsl_movstat_accum_Sn: Pgsl_movstat_accum; cvar;external libgsl;
  gsl_movstat_accum_sum: Pgsl_movstat_accum; cvar;external libgsl;
  gsl_movstat_accum_Qn: Pgsl_movstat_accum; cvar;external libgsl;
  gsl_movstat_accum_qqr: Pgsl_movstat_accum; cvar;external libgsl;
  gsl_movstat_accum_userfunc: Pgsl_movstat_accum; cvar;external libgsl;
  gsl_movstat_accum_variance: Pgsl_movstat_accum; cvar;external libgsl;

  // === Konventiert am: 21-8-25 19:31:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}




{$ENDIF read_implementation}
