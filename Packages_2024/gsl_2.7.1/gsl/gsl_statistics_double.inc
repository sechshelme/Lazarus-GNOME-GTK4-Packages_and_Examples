{$IFDEF read_interface}



function gsl_stats_mean(data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_variance(data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_sd(data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_variance_with_fixed_mean(data: Pdouble; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_sd_with_fixed_mean(data: Pdouble; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_tss(data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_tss_m(data: Pdouble; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_absdev(data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_skew(data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_kurtosis(data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_lag1_autocorrelation(data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_covariance(data1: Pdouble; stride1: Tsize_t; data2: Pdouble; stride2: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_correlation(data1: Pdouble; stride1: Tsize_t; data2: Pdouble; stride2: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_spearman(data1: Pdouble; stride1: Tsize_t; data2: Pdouble; stride2: Tsize_t; n: Tsize_t;
  work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_variance_m(data: Pdouble; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_sd_m(data: Pdouble; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_absdev_m(data: Pdouble; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_skew_m_sd(data: Pdouble; stride: Tsize_t; n: Tsize_t; mean: double; sd: double): double; cdecl; external libgsl;
function gsl_stats_kurtosis_m_sd(data: Pdouble; stride: Tsize_t; n: Tsize_t; mean: double; sd: double): double; cdecl; external libgsl;
function gsl_stats_lag1_autocorrelation_m(data: Pdouble; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_covariance_m(data1: Pdouble; stride1: Tsize_t; data2: Pdouble; stride2: Tsize_t; n: Tsize_t;
  mean1: double; mean2: double): double; cdecl; external libgsl;

function gsl_stats_wmean(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_wvariance(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_wsd(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_wvariance_with_fixed_mean(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t;
  mean: double): double; cdecl; external libgsl;
function gsl_stats_wsd_with_fixed_mean(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t;
  mean: double): double; cdecl; external libgsl;
function gsl_stats_wtss(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_wtss_m(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t;
  wmean: double): double; cdecl; external libgsl;
function gsl_stats_wabsdev(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_wskew(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_wkurtosis(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_wvariance_m(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t;
  wmean: double): double; cdecl; external libgsl;
function gsl_stats_wsd_m(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t;
  wmean: double): double; cdecl; external libgsl;
function gsl_stats_wabsdev_m(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t;
  wmean: double): double; cdecl; external libgsl;
function gsl_stats_wskew_m_sd(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t;
  wmean: double; wsd: double): double; cdecl; external libgsl;
function gsl_stats_wkurtosis_m_sd(w: Pdouble; wstride: Tsize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t;
  wmean: double; wsd: double): double; cdecl; external libgsl;

function gsl_stats_pvariance(data1: Pdouble; stride1: Tsize_t; n1: Tsize_t; data2: Pdouble; stride2: Tsize_t;
  n2: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ttest(data1: Pdouble; stride1: Tsize_t; n1: Tsize_t; data2: Pdouble; stride2: Tsize_t;
  n2: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_max(data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_min(data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
procedure gsl_stats_minmax(min: Pdouble; max: Pdouble; data: Pdouble; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_max_index(data: Pdouble; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_stats_min_index(data: Pdouble; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
procedure gsl_stats_minmax_index(min_index: Psize_t; max_index: Psize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_select(data: Pdouble; stride: Tsize_t; n: Tsize_t; k: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_median_from_sorted_data(sorted_data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_median(sorted_data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_quantile_from_sorted_data(sorted_data: Pdouble; stride: Tsize_t; n: Tsize_t; f: double): double; cdecl; external libgsl;
function gsl_stats_trmean_from_sorted_data(trim: double; sorted_data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_gastwirth_from_sorted_data(sorted_data: Pdouble; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_mad0(data: Pdouble; stride: Tsize_t; n: Tsize_t; work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_mad(data: Pdouble; stride: Tsize_t; n: Tsize_t; work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_Sn0_from_sorted_data(sorted_data: Pdouble; stride: Tsize_t; n: Tsize_t; work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_Sn_from_sorted_data(sorted_data: Pdouble; stride: Tsize_t; n: Tsize_t; work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_Qn0_from_sorted_data(sorted_data: Pdouble; stride: Tsize_t; n: Tsize_t; work: Pdouble; work_int: Plongint): double; cdecl; external libgsl;
function gsl_stats_Qn_from_sorted_data(sorted_data: Pdouble; stride: Tsize_t; n: Tsize_t; work: Pdouble; work_int: Plongint): double; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:19:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
