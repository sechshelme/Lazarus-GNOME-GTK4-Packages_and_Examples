unit gsl_statistics_short;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_stats_short_mean(data: Psmallint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_variance(data: Psmallint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_sd(data: Psmallint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_variance_with_fixed_mean(data: Psmallint; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_short_sd_with_fixed_mean(data: Psmallint; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_short_tss(data: Psmallint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_tss_m(data: Psmallint; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_short_absdev(data: Psmallint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_skew(data: Psmallint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_kurtosis(data: Psmallint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_lag1_autocorrelation(data: Psmallint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_covariance(data1: Psmallint; stride1: Tsize_t; data2: Psmallint; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_correlation(data1: Psmallint; stride1: Tsize_t; data2: Psmallint; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_spearman(data1: Psmallint; stride1: Tsize_t; data2: Psmallint; stride2: Tsize_t; n: Tsize_t;
  work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_short_variance_m(data: Psmallint; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_short_sd_m(data: Psmallint; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_short_absdev_m(data: Psmallint; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_short_skew_m_sd(data: Psmallint; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_short_kurtosis_m_sd(data: Psmallint; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_short_lag1_autocorrelation_m(data: Psmallint; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_short_covariance_m(data1: Psmallint; stride1: Tsize_t; data2: Psmallint; stride2: Tsize_t; n: Tsize_t;
  mean1: Tdouble; mean2: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_short_pvariance(data1: Psmallint; stride1: Tsize_t; n1: Tsize_t; data2: Psmallint; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_ttest(data1: Psmallint; stride1: Tsize_t; n1: Tsize_t; data2: Psmallint; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_max(data: Psmallint; stride: Tsize_t; n: Tsize_t): smallint; cdecl; external libgsl;
function gsl_stats_short_min(data: Psmallint; stride: Tsize_t; n: Tsize_t): smallint; cdecl; external libgsl;
procedure gsl_stats_short_minmax(min: Psmallint; max: Psmallint; data: Psmallint; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_short_max_index(data: Psmallint; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_stats_short_min_index(data: Psmallint; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
procedure gsl_stats_short_minmax_index(min_index: Psize_t; max_index: Psize_t; data: Psmallint; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_short_select(data: Psmallint; stride: Tsize_t; n: Tsize_t; k: Tsize_t): smallint; cdecl; external libgsl;
function gsl_stats_short_median_from_sorted_data(sorted_data: Psmallint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_median(sorted_data: Psmallint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_quantile_from_sorted_data(sorted_data: Psmallint; stride: Tsize_t; n: Tsize_t; f: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_short_trmean_from_sorted_data(trim: Tdouble; sorted_data: Psmallint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_gastwirth_from_sorted_data(sorted_data: Psmallint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_short_mad0(data: Psmallint; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_short_mad(data: Psmallint; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_short_Sn0_from_sorted_data(sorted_data: Psmallint; stride: Tsize_t; n: Tsize_t; work: Psmallint): smallint; cdecl; external libgsl;
function gsl_stats_short_Sn_from_sorted_data(sorted_data: Psmallint; stride: Tsize_t; n: Tsize_t; work: Psmallint): Tdouble; cdecl; external libgsl;
function gsl_stats_short_Qn0_from_sorted_data(sorted_data: Psmallint; stride: Tsize_t; n: Tsize_t; work: Psmallint; work_int: Plongint): smallint; cdecl; external libgsl;
function gsl_stats_short_Qn_from_sorted_data(sorted_data: Psmallint; stride: Tsize_t; n: Tsize_t; work: Psmallint; work_int: Plongint): Tdouble; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:20:03 ===


implementation



end.
