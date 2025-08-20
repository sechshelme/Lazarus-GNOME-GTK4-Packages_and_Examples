unit gsl_statistics_float;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_stats_float_mean(data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_variance(data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_sd(data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_variance_with_fixed_mean(data: Psingle; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_sd_with_fixed_mean(data: Psingle; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_tss(data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_tss_m(data: Psingle; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_absdev(data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_skew(data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_kurtosis(data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_lag1_autocorrelation(data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_covariance(data1: Psingle; stride1: Tsize_t; data2: Psingle; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_correlation(data1: Psingle; stride1: Tsize_t; data2: Psingle; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_spearman(data1: Psingle; stride1: Tsize_t; data2: Psingle; stride2: Tsize_t; n: Tsize_t;
  work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_variance_m(data: Psingle; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_sd_m(data: Psingle; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_absdev_m(data: Psingle; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_skew_m_sd(data: Psingle; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_kurtosis_m_sd(data: Psingle; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_lag1_autocorrelation_m(data: Psingle; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_covariance_m(data1: Psingle; stride1: Tsize_t; data2: Psingle; stride2: Tsize_t; n: Tsize_t;
  mean1: Tdouble; mean2: Tdouble): Tdouble; cdecl; external libgsl;

function gsl_stats_float_wmean(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_wvariance(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_wsd(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_wvariance_with_fixed_mean(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t;
  mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_wsd_with_fixed_mean(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t;
  mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_wtss(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_wtss_m(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t;
  wmean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_wabsdev(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_wskew(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_wkurtosis(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_wvariance_m(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t;
  wmean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_wsd_m(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t;
  wmean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_wabsdev_m(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t;
  wmean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_wskew_m_sd(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t;
  wmean: Tdouble; wsd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_wkurtosis_m_sd(w: Psingle; wstride: Tsize_t; data: Psingle; stride: Tsize_t; n: Tsize_t;
  wmean: Tdouble; wsd: Tdouble): Tdouble; cdecl; external libgsl;

function gsl_stats_float_pvariance(data1: Psingle; stride1: Tsize_t; n1: Tsize_t; data2: Psingle; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_ttest(data1: Psingle; stride1: Tsize_t; n1: Tsize_t; data2: Psingle; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_max(data: Psingle; stride: Tsize_t; n: Tsize_t): single; cdecl; external libgsl;
function gsl_stats_float_min(data: Psingle; stride: Tsize_t; n: Tsize_t): single; cdecl; external libgsl;
procedure gsl_stats_float_minmax(min: Psingle; max: Psingle; data: Psingle; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_float_max_index(data: Psingle; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_stats_float_min_index(data: Psingle; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
procedure gsl_stats_float_minmax_index(min_index: Psize_t; max_index: Psize_t; data: Psingle; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_float_select(data: Psingle; stride: Tsize_t; n: Tsize_t; k: Tsize_t): single; cdecl; external libgsl;
function gsl_stats_float_median_from_sorted_data(sorted_data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_median(sorted_data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_quantile_from_sorted_data(sorted_data: Psingle; stride: Tsize_t; n: Tsize_t; f: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_trmean_from_sorted_data(trim: Tdouble; sorted_data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_gastwirth_from_sorted_data(sorted_data: Psingle; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_float_mad0(data: Psingle; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_mad(data: Psingle; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_float_Sn0_from_sorted_data(sorted_data: Psingle; stride: Tsize_t; n: Tsize_t; work: Psingle): single; cdecl; external libgsl;
function gsl_stats_float_Sn_from_sorted_data(sorted_data: Psingle; stride: Tsize_t; n: Tsize_t; work: Psingle): Tdouble; cdecl; external libgsl;
function gsl_stats_float_Qn0_from_sorted_data(sorted_data: Psingle; stride: Tsize_t; n: Tsize_t; work: Psingle; work_int: Plongint): single; cdecl; external libgsl;
function gsl_stats_float_Qn_from_sorted_data(sorted_data: Psingle; stride: Tsize_t; n: Tsize_t; work: Psingle; work_int: Plongint): Tdouble; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:19:52 ===


implementation



end.
