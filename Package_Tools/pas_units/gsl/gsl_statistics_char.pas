unit gsl_statistics_char;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_stats_char_mean(data: pchar; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_variance(data: pchar; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_sd(data: pchar; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_variance_with_fixed_mean(data: pchar; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_sd_with_fixed_mean(data: pchar; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_tss(data: pchar; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_tss_m(data: pchar; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_absdev(data: pchar; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_skew(data: pchar; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_kurtosis(data: pchar; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_lag1_autocorrelation(data: pchar; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_covariance(data1: pchar; stride1: Tsize_t; data2: pchar; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_correlation(data1: pchar; stride1: Tsize_t; data2: pchar; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_spearman(data1: pchar; stride1: Tsize_t; data2: pchar; stride2: Tsize_t; n: Tsize_t;
  work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_variance_m(data: pchar; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_sd_m(data: pchar; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_absdev_m(data: pchar; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_skew_m_sd(data: pchar; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_kurtosis_m_sd(data: pchar; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_lag1_autocorrelation_m(data: pchar; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_covariance_m(data1: pchar; stride1: Tsize_t; data2: pchar; stride2: Tsize_t; n: Tsize_t;
  mean1: Tdouble; mean2: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_pvariance(data1: pchar; stride1: Tsize_t; n1: Tsize_t; data2: pchar; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_ttest(data1: pchar; stride1: Tsize_t; n1: Tsize_t; data2: pchar; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_max(data: pchar; stride: Tsize_t; n: Tsize_t): char; cdecl; external libgsl;
function gsl_stats_char_min(data: pchar; stride: Tsize_t; n: Tsize_t): char; cdecl; external libgsl;
procedure gsl_stats_char_minmax(min: pchar; max: pchar; data: pchar; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_char_max_index(data: pchar; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_stats_char_min_index(data: pchar; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
procedure gsl_stats_char_minmax_index(min_index: Psize_t; max_index: Psize_t; data: pchar; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_char_select(data: pchar; stride: Tsize_t; n: Tsize_t; k: Tsize_t): char; cdecl; external libgsl;
function gsl_stats_char_median_from_sorted_data(sorted_data: pchar; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_median(sorted_data: pchar; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_quantile_from_sorted_data(sorted_data: pchar; stride: Tsize_t; n: Tsize_t; f: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_trmean_from_sorted_data(trim: Tdouble; sorted_data: pchar; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_gastwirth_from_sorted_data(sorted_data: pchar; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_mad0(data: pchar; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_mad(data: pchar; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_Sn0_from_sorted_data(sorted_data: pchar; stride: Tsize_t; n: Tsize_t; work: pchar): char; cdecl; external libgsl;
function gsl_stats_char_Sn_from_sorted_data(sorted_data: pchar; stride: Tsize_t; n: Tsize_t; work: pchar): Tdouble; cdecl; external libgsl;
function gsl_stats_char_Qn0_from_sorted_data(sorted_data: pchar; stride: Tsize_t; n: Tsize_t; work: pchar; work_int: Plongint): char; cdecl; external libgsl;
function gsl_stats_char_Qn_from_sorted_data(sorted_data: pchar; stride: Tsize_t; n: Tsize_t; work: pchar; work_int: Plongint): Tdouble; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:19:47 ===


implementation



end.
