{$IFDEF read_interface}


type
  Tgsl_rstat_quantile_workspace = record
    p: double;
    q: array[0..4] of double;
    npos: array[0..4] of longint;
    np: array[0..4] of double;
    dnp: array[0..4] of double;
    n: Tsize_t;
  end;
  Pgsl_rstat_quantile_workspace = ^Tgsl_rstat_quantile_workspace;

function gsl_rstat_quantile_alloc(p: double): Pgsl_rstat_quantile_workspace; cdecl; external libgsl;
procedure gsl_rstat_quantile_free(w: Pgsl_rstat_quantile_workspace); cdecl; external libgsl;
function gsl_rstat_quantile_reset(w: Pgsl_rstat_quantile_workspace): longint; cdecl; external libgsl;
function gsl_rstat_quantile_add(x: double; w: Pgsl_rstat_quantile_workspace): longint; cdecl; external libgsl;
function gsl_rstat_quantile_get(w: Pgsl_rstat_quantile_workspace): double; cdecl; external libgsl;

type
  Tgsl_rstat_workspace = record
    min: double;
    max: double;
    mean: double;
    M2: double;
    M3: double;
    M4: double;
    n: Tsize_t;
    median_workspace_p: Pgsl_rstat_quantile_workspace;
  end;
  Pgsl_rstat_workspace = ^Tgsl_rstat_workspace;

function gsl_rstat_alloc: Pgsl_rstat_workspace; cdecl; external libgsl;
procedure gsl_rstat_free(w: Pgsl_rstat_workspace); cdecl; external libgsl;
function gsl_rstat_n(w: Pgsl_rstat_workspace): Tsize_t; cdecl; external libgsl;
function gsl_rstat_add(x: double; w: Pgsl_rstat_workspace): longint; cdecl; external libgsl;
function gsl_rstat_min(w: Pgsl_rstat_workspace): double; cdecl; external libgsl;
function gsl_rstat_max(w: Pgsl_rstat_workspace): double; cdecl; external libgsl;
function gsl_rstat_mean(w: Pgsl_rstat_workspace): double; cdecl; external libgsl;
function gsl_rstat_variance(w: Pgsl_rstat_workspace): double; cdecl; external libgsl;
function gsl_rstat_sd(w: Pgsl_rstat_workspace): double; cdecl; external libgsl;
function gsl_rstat_rms(w: Pgsl_rstat_workspace): double; cdecl; external libgsl;
function gsl_rstat_sd_mean(w: Pgsl_rstat_workspace): double; cdecl; external libgsl;
function gsl_rstat_median(w: Pgsl_rstat_workspace): double; cdecl; external libgsl;
function gsl_rstat_skew(w: Pgsl_rstat_workspace): double; cdecl; external libgsl;
function gsl_rstat_kurtosis(w: Pgsl_rstat_workspace): double; cdecl; external libgsl;
function gsl_rstat_reset(w: Pgsl_rstat_workspace): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:19:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
