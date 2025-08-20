unit gsl_statistics_ulong;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_stats_ulong_mean(data: Pdword; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_variance(data: Pdword; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_sd(data: Pdword; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_variance_with_fixed_mean(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_sd_with_fixed_mean(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_tss(data: Pdword; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_tss_m(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_absdev(data: Pdword; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_skew(data: Pdword; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_kurtosis(data: Pdword; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_lag1_autocorrelation(data: Pdword; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_covariance(data1: Pdword; stride1: Tsize_t; data2: Pdword; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_correlation(data1: Pdword; stride1: Tsize_t; data2: Pdword; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_spearman(data1: Pdword; stride1: Tsize_t; data2: Pdword; stride2: Tsize_t; n: Tsize_t;
  work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_variance_m(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_sd_m(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_absdev_m(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_skew_m_sd(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_kurtosis_m_sd(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_lag1_autocorrelation_m(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_covariance_m(data1: Pdword; stride1: Tsize_t; data2: Pdword; stride2: Tsize_t; n: Tsize_t;
  mean1: Tdouble; mean2: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_pvariance(data1: Pdword; stride1: Tsize_t; n1: Tsize_t; data2: Pdword; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_ttest(data1: Pdword; stride1: Tsize_t; n1: Tsize_t; data2: Pdword; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_max(data: Pdword; stride: Tsize_t; n: Tsize_t): dword; cdecl; external libgsl;
function gsl_stats_ulong_min(data: Pdword; stride: Tsize_t; n: Tsize_t): dword; cdecl; external libgsl;
procedure gsl_stats_ulong_minmax(min: Pdword; max: Pdword; data: Pdword; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_ulong_max_index(data: Pdword; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_stats_ulong_min_index(data: Pdword; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
procedure gsl_stats_ulong_minmax_index(min_index: Psize_t; max_index: Psize_t; data: Pdword; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_ulong_select(data: Pdword; stride: Tsize_t; n: Tsize_t; k: Tsize_t): dword; cdecl; external libgsl;
function gsl_stats_ulong_median_from_sorted_data(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_median(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_quantile_from_sorted_data(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t; f: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_trmean_from_sorted_data(trim: Tdouble; sorted_data: Pdword; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_gastwirth_from_sorted_data(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_mad0(data: Pdword; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_mad(data: Pdword; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_Sn0_from_sorted_data(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t; work: Pdword): dword; cdecl; external libgsl;
function gsl_stats_ulong_Sn_from_sorted_data(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t; work: Pdword): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_Qn0_from_sorted_data(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t; work: Pdword; work_int: Plongint): dword; cdecl; external libgsl;
function gsl_stats_ulong_Qn_from_sorted_data(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t; work: Pdword; work_int: Plongint): Tdouble; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:20:10 ===


implementation



end.
