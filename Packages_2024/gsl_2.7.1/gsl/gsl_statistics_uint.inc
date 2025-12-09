{$IFDEF read_interface}



function gsl_stats_uint_mean(data: Pdword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_variance(data: Pdword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_sd(data: Pdword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_variance_with_fixed_mean(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_uint_sd_with_fixed_mean(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_uint_tss(data: Pdword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_tss_m(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_uint_absdev(data: Pdword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_skew(data: Pdword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_kurtosis(data: Pdword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_lag1_autocorrelation(data: Pdword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_covariance(data1: Pdword; stride1: Tsize_t; data2: Pdword; stride2: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_correlation(data1: Pdword; stride1: Tsize_t; data2: Pdword; stride2: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_spearman(data1: Pdword; stride1: Tsize_t; data2: Pdword; stride2: Tsize_t; n: Tsize_t;
  work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_uint_variance_m(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_uint_sd_m(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_uint_absdev_m(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_uint_skew_m_sd(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: double; sd: double): double; cdecl; external libgsl;
function gsl_stats_uint_kurtosis_m_sd(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: double; sd: double): double; cdecl; external libgsl;
function gsl_stats_uint_lag1_autocorrelation_m(data: Pdword; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_uint_covariance_m(data1: Pdword; stride1: Tsize_t; data2: Pdword; stride2: Tsize_t; n: Tsize_t;
  mean1: double; mean2: double): double; cdecl; external libgsl;
function gsl_stats_uint_pvariance(data1: Pdword; stride1: Tsize_t; n1: Tsize_t; data2: Pdword; stride2: Tsize_t;
  n2: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_ttest(data1: Pdword; stride1: Tsize_t; n1: Tsize_t; data2: Pdword; stride2: Tsize_t;
  n2: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_max(data: Pdword; stride: Tsize_t; n: Tsize_t): dword; cdecl; external libgsl;
function gsl_stats_uint_min(data: Pdword; stride: Tsize_t; n: Tsize_t): dword; cdecl; external libgsl;
procedure gsl_stats_uint_minmax(min: Pdword; max: Pdword; data: Pdword; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_uint_max_index(data: Pdword; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_stats_uint_min_index(data: Pdword; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
procedure gsl_stats_uint_minmax_index(min_index: Psize_t; max_index: Psize_t; data: Pdword; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_uint_select(data: Pdword; stride: Tsize_t; n: Tsize_t; k: Tsize_t): dword; cdecl; external libgsl;
function gsl_stats_uint_median_from_sorted_data(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_median(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_quantile_from_sorted_data(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t; f: double): double; cdecl; external libgsl;
function gsl_stats_uint_trmean_from_sorted_data(trim: double; sorted_data: Pdword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_gastwirth_from_sorted_data(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_uint_mad0(data: Pdword; stride: Tsize_t; n: Tsize_t; work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_uint_mad(data: Pdword; stride: Tsize_t; n: Tsize_t; work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_uint_Sn0_from_sorted_data(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t; work: Pdword): dword; cdecl; external libgsl;
function gsl_stats_uint_Sn_from_sorted_data(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t; work: Pdword): double; cdecl; external libgsl;
function gsl_stats_uint_Qn0_from_sorted_data(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t; work: Pdword; work_int: Plongint): dword; cdecl; external libgsl;
function gsl_stats_uint_Qn_from_sorted_data(sorted_data: Pdword; stride: Tsize_t; n: Tsize_t; work: Pdword; work_int: Plongint): double; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:20:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
