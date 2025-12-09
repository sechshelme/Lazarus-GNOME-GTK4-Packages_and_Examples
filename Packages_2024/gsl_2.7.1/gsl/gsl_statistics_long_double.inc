{$IFDEF read_interface}



function gsl_stats_long_double_mean(data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_variance(data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_sd(data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_variance_with_fixed_mean(data: Plong_double; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_long_double_sd_with_fixed_mean(data: Plong_double; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_long_double_tss(data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_tss_m(data: Plong_double; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_long_double_absdev(data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_skew(data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_kurtosis(data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_lag1_autocorrelation(data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_covariance(data1: Plong_double; stride1: Tsize_t; data2: Plong_double; stride2: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_correlation(data1: Plong_double; stride1: Tsize_t; data2: Plong_double; stride2: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_spearman(data1: Plong_double; stride1: Tsize_t; data2: Plong_double; stride2: Tsize_t; n: Tsize_t;
  work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_long_double_variance_m(data: Plong_double; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_long_double_sd_m(data: Plong_double; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_long_double_absdev_m(data: Plong_double; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_long_double_skew_m_sd(data: Plong_double; stride: Tsize_t; n: Tsize_t; mean: double; sd: double): double; cdecl; external libgsl;
function gsl_stats_long_double_kurtosis_m_sd(data: Plong_double; stride: Tsize_t; n: Tsize_t; mean: double; sd: double): double; cdecl; external libgsl;
function gsl_stats_long_double_lag1_autocorrelation_m(data: Plong_double; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_long_double_covariance_m(data1: Plong_double; stride1: Tsize_t; data2: Plong_double; stride2: Tsize_t; n: Tsize_t;
  mean1: double; mean2: double): double; cdecl; external libgsl;

function gsl_stats_long_double_wmean(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_wvariance(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_wsd(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_wvariance_with_fixed_mean(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t;
  mean: double): double; cdecl; external libgsl;
function gsl_stats_long_double_wsd_with_fixed_mean(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t;
  mean: double): double; cdecl; external libgsl;
function gsl_stats_long_double_wtss(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_wtss_m(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t;
  wmean: double): double; cdecl; external libgsl;
function gsl_stats_long_double_wabsdev(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_wskew(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_wkurtosis(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_wvariance_m(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t;
  wmean: double): double; cdecl; external libgsl;
function gsl_stats_long_double_wsd_m(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t;
  wmean: double): double; cdecl; external libgsl;
function gsl_stats_long_double_wabsdev_m(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t;
  wmean: double): double; cdecl; external libgsl;
function gsl_stats_long_double_wskew_m_sd(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t;
  wmean: double; wsd: double): double; cdecl; external libgsl;
function gsl_stats_long_double_wkurtosis_m_sd(w: Plong_double; wstride: Tsize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t;
  wmean: double; wsd: double): double; cdecl; external libgsl;

function gsl_stats_long_double_pvariance(data1: Plong_double; stride1: Tsize_t; n1: Tsize_t; data2: Plong_double; stride2: Tsize_t;
  n2: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_ttest(data1: Plong_double; stride1: Tsize_t; n1: Tsize_t; data2: Plong_double; stride2: Tsize_t;
  n2: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_max(data: Plong_double; stride: Tsize_t; n: Tsize_t): Tlong_double; cdecl; external libgsl;
function gsl_stats_long_double_min(data: Plong_double; stride: Tsize_t; n: Tsize_t): Tlong_double; cdecl; external libgsl;
procedure gsl_stats_long_double_minmax(min: Plong_double; max: Plong_double; data: Plong_double; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_long_double_max_index(data: Plong_double; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_stats_long_double_min_index(data: Plong_double; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
procedure gsl_stats_long_double_minmax_index(min_index: Psize_t; max_index: Psize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_long_double_select(data: Plong_double; stride: Tsize_t; n: Tsize_t; k: Tsize_t): Tlong_double; cdecl; external libgsl;
function gsl_stats_long_double_median_from_sorted_data(sorted_data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_median(sorted_data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_quantile_from_sorted_data(sorted_data: Plong_double; stride: Tsize_t; n: Tsize_t; f: double): double; cdecl; external libgsl;
function gsl_stats_long_double_trmean_from_sorted_data(trim: double; sorted_data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_gastwirth_from_sorted_data(sorted_data: Plong_double; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_double_mad0(data: Plong_double; stride: Tsize_t; n: Tsize_t; work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_long_double_mad(data: Plong_double; stride: Tsize_t; n: Tsize_t; work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_long_double_Sn0_from_sorted_data(sorted_data: Plong_double; stride: Tsize_t; n: Tsize_t; work: Plong_double): Tlong_double; cdecl; external libgsl;
function gsl_stats_long_double_Sn_from_sorted_data(sorted_data: Plong_double; stride: Tsize_t; n: Tsize_t; work: Plong_double): double; cdecl; external libgsl;
function gsl_stats_long_double_Qn0_from_sorted_data(sorted_data: Plong_double; stride: Tsize_t; n: Tsize_t; work: Plong_double; work_int: Plongint): Tlong_double; cdecl; external libgsl;
function gsl_stats_long_double_Qn_from_sorted_data(sorted_data: Plong_double; stride: Tsize_t; n: Tsize_t; work: Plong_double; work_int: Plongint): double; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:20:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
