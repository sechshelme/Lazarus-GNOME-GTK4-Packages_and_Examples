{$IFDEF read_interface}



function gsl_stats_ushort_mean(data: Pword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_variance(data: Pword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_sd(data: Pword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_variance_with_fixed_mean(data: Pword; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_ushort_sd_with_fixed_mean(data: Pword; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_ushort_tss(data: Pword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_tss_m(data: Pword; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_ushort_absdev(data: Pword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_skew(data: Pword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_kurtosis(data: Pword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_lag1_autocorrelation(data: Pword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_covariance(data1: Pword; stride1: Tsize_t; data2: Pword; stride2: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_correlation(data1: Pword; stride1: Tsize_t; data2: Pword; stride2: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_spearman(data1: Pword; stride1: Tsize_t; data2: Pword; stride2: Tsize_t; n: Tsize_t;
  work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_ushort_variance_m(data: Pword; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_ushort_sd_m(data: Pword; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_ushort_absdev_m(data: Pword; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_ushort_skew_m_sd(data: Pword; stride: Tsize_t; n: Tsize_t; mean: double; sd: double): double; cdecl; external libgsl;
function gsl_stats_ushort_kurtosis_m_sd(data: Pword; stride: Tsize_t; n: Tsize_t; mean: double; sd: double): double; cdecl; external libgsl;
function gsl_stats_ushort_lag1_autocorrelation_m(data: Pword; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_ushort_covariance_m(data1: Pword; stride1: Tsize_t; data2: Pword; stride2: Tsize_t; n: Tsize_t;
  mean1: double; mean2: double): double; cdecl; external libgsl;
function gsl_stats_ushort_pvariance(data1: Pword; stride1: Tsize_t; n1: Tsize_t; data2: Pword; stride2: Tsize_t;
  n2: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_ttest(data1: Pword; stride1: Tsize_t; n1: Tsize_t; data2: Pword; stride2: Tsize_t;
  n2: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_max(data: Pword; stride: Tsize_t; n: Tsize_t): word; cdecl; external libgsl;
function gsl_stats_ushort_min(data: Pword; stride: Tsize_t; n: Tsize_t): word; cdecl; external libgsl;
procedure gsl_stats_ushort_minmax(min: Pword; max: Pword; data: Pword; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_ushort_max_index(data: Pword; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_stats_ushort_min_index(data: Pword; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
procedure gsl_stats_ushort_minmax_index(min_index: Psize_t; max_index: Psize_t; data: Pword; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_ushort_select(data: Pword; stride: Tsize_t; n: Tsize_t; k: Tsize_t): word; cdecl; external libgsl;
function gsl_stats_ushort_median_from_sorted_data(sorted_data: Pword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_median(sorted_data: Pword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_quantile_from_sorted_data(sorted_data: Pword; stride: Tsize_t; n: Tsize_t; f: double): double; cdecl; external libgsl;
function gsl_stats_ushort_trmean_from_sorted_data(trim: double; sorted_data: Pword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_gastwirth_from_sorted_data(sorted_data: Pword; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_ushort_mad0(data: Pword; stride: Tsize_t; n: Tsize_t; work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_ushort_mad(data: Pword; stride: Tsize_t; n: Tsize_t; work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_ushort_Sn0_from_sorted_data(sorted_data: Pword; stride: Tsize_t; n: Tsize_t; work: Pword): word; cdecl; external libgsl;
function gsl_stats_ushort_Sn_from_sorted_data(sorted_data: Pword; stride: Tsize_t; n: Tsize_t; work: Pword): double; cdecl; external libgsl;
function gsl_stats_ushort_Qn0_from_sorted_data(sorted_data: Pword; stride: Tsize_t; n: Tsize_t; work: Pword; work_int: Plongint): word; cdecl; external libgsl;
function gsl_stats_ushort_Qn_from_sorted_data(sorted_data: Pword; stride: Tsize_t; n: Tsize_t; work: Pword; work_int: Plongint): double; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:20:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
