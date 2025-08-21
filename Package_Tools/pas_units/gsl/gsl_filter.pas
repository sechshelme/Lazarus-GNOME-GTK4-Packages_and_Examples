unit gsl_filter;

interface

uses
  fp_gsl, gsl_movstat, gsl_vector_double, gsl_vector_int;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pgsl_filter_end_t = ^Tgsl_filter_end_t;
  Tgsl_filter_end_t = longint;

const
  GSL_FILTER_END_PADZERO = GSL_MOVSTAT_END_PADZERO;
  GSL_FILTER_END_PADVALUE = GSL_MOVSTAT_END_PADVALUE;
  GSL_FILTER_END_TRUNCATE = GSL_MOVSTAT_END_TRUNCATE;

type
  Pgsl_filter_scale_t = ^Tgsl_filter_scale_t;
  Tgsl_filter_scale_t = longint;

const
  GSL_FILTER_SCALE_MAD = 0;
  GSL_FILTER_SCALE_IQR = 1;
  GSL_FILTER_SCALE_SN = 2;
  GSL_FILTER_SCALE_QN = 3;

type
  Tgsl_filter_gaussian_workspace = record
    K: Tsize_t;
    kernel: Pdouble;
    movstat_workspace_p: Pgsl_movstat_workspace;
  end;
  Pgsl_filter_gaussian_workspace = ^Tgsl_filter_gaussian_workspace;

function gsl_filter_gaussian_alloc(K: Tsize_t): Pgsl_filter_gaussian_workspace; cdecl; external libgsl;
procedure gsl_filter_gaussian_free(w: Pgsl_filter_gaussian_workspace); cdecl; external libgsl;
function gsl_filter_gaussian(endtype: Tgsl_filter_end_t; alpha: Tdouble; order: Tsize_t; x: Pgsl_vector; y: Pgsl_vector;
  w: Pgsl_filter_gaussian_workspace): longint; cdecl; external libgsl;
function gsl_filter_gaussian_kernel(alpha: Tdouble; order: Tsize_t; normalize: longint; kernel: Pgsl_vector): longint; cdecl; external libgsl;

type
  Tgsl_filter_median_workspace = record
    movstat_workspace_p: Pgsl_movstat_workspace;
  end;
  Pgsl_filter_median_workspace = ^Tgsl_filter_median_workspace;

function gsl_filter_median_alloc(K: Tsize_t): Pgsl_filter_median_workspace; cdecl; external libgsl;
procedure gsl_filter_median_free(w: Pgsl_filter_median_workspace); cdecl; external libgsl;
function gsl_filter_median(endtype: Tgsl_filter_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_filter_median_workspace): longint; cdecl; external libgsl;

type
  Tgsl_filter_rmedian_workspace = record
    H: Tsize_t;
    K: Tsize_t;
    state: pointer;
    window: Pdouble;
    minmaxacc: Pgsl_movstat_accum;
    movstat_workspace_p: Pgsl_movstat_workspace;
  end;
  Pgsl_filter_rmedian_workspace = ^Tgsl_filter_rmedian_workspace;

function gsl_filter_rmedian_alloc(K: Tsize_t): Pgsl_filter_rmedian_workspace; cdecl; external libgsl;
procedure gsl_filter_rmedian_free(w: Pgsl_filter_rmedian_workspace); cdecl; external libgsl;
function gsl_filter_rmedian(para1: Tgsl_filter_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_filter_rmedian_workspace): longint; cdecl; external libgsl;

type
  Tgsl_filter_impulse_workspace = record
    movstat_workspace_p: Pgsl_movstat_workspace;
  end;
  Pgsl_filter_impulse_workspace = ^Tgsl_filter_impulse_workspace;

function gsl_filter_impulse_alloc(K: Tsize_t): Pgsl_filter_impulse_workspace; cdecl; external libgsl;
procedure gsl_filter_impulse_free(w: Pgsl_filter_impulse_workspace); cdecl; external libgsl;
function gsl_filter_impulse(endtype: Tgsl_filter_end_t; scale_type: Tgsl_filter_scale_t; t: Tdouble; x: Pgsl_vector; y: Pgsl_vector;
  xmedian: Pgsl_vector; xsigma: Pgsl_vector; noutlier: Psize_t; ioutlier: Pgsl_vector_int; w: Pgsl_filter_impulse_workspace): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:09:44 ===


implementation



end.
