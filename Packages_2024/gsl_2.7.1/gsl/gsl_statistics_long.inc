{$IFDEF read_interface}



function gsl_stats_long_mean(data: Pclong; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_variance(data: Pclong; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_sd(data: Pclong; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_variance_with_fixed_mean(data: Pclong; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_long_sd_with_fixed_mean(data: Pclong; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_long_tss(data: Pclong; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_tss_m(data: Pclong; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_long_absdev(data: Pclong; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_skew(data: Pclong; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_kurtosis(data: Pclong; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_lag1_autocorrelation(data: Pclong; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_covariance(data1: Pclong; stride1: Tsize_t; data2: Pclong; stride2: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_correlation(data1: Pclong; stride1: Tsize_t; data2: Pclong; stride2: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_spearman(data1: Pclong; stride1: Tsize_t; data2: Pclong; stride2: Tsize_t; n: Tsize_t;
  work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_long_variance_m(data: Pclong; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_long_sd_m(data: Pclong; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_long_absdev_m(data: Pclong; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_long_skew_m_sd(data: Pclong; stride: Tsize_t; n: Tsize_t; mean: double; sd: double): double; cdecl; external libgsl;
function gsl_stats_long_kurtosis_m_sd(data: Pclong; stride: Tsize_t; n: Tsize_t; mean: double; sd: double): double; cdecl; external libgsl;
function gsl_stats_long_lag1_autocorrelation_m(data: Pclong; stride: Tsize_t; n: Tsize_t; mean: double): double; cdecl; external libgsl;
function gsl_stats_long_covariance_m(data1: Pclong; stride1: Tsize_t; data2: Pclong; stride2: Tsize_t; n: Tsize_t;
  mean1: double; mean2: double): double; cdecl; external libgsl;
function gsl_stats_long_pvariance(data1: Pclong; stride1: Tsize_t; n1: Tsize_t; data2: Pclong; stride2: Tsize_t;
  n2: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_ttest(data1: Pclong; stride1: Tsize_t; n1: Tsize_t; data2: Pclong; stride2: Tsize_t;
  n2: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_max(data: Pclong; stride: Tsize_t; n: Tsize_t): Tclong; cdecl; external libgsl;
function gsl_stats_long_min(data: Pclong; stride: Tsize_t; n: Tsize_t): Tclong; cdecl; external libgsl;
procedure gsl_stats_long_minmax(min: Pclong; max: Pclong; data: Pclong; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_long_max_index(data: Pclong; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_stats_long_min_index(data: Pclong; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
procedure gsl_stats_long_minmax_index(min_index: Psize_t; max_index: Psize_t; data: Pclong; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_long_select(data: Pclong; stride: Tsize_t; n: Tsize_t; k: Tsize_t): Tclong; cdecl; external libgsl;
function gsl_stats_long_median_from_sorted_data(sorted_data: Pclong; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_median(sorted_data: Pclong; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_quantile_from_sorted_data(sorted_data: Pclong; stride: Tsize_t; n: Tsize_t; f: double): double; cdecl; external libgsl;
function gsl_stats_long_trmean_from_sorted_data(trim: double; sorted_data: Pclong; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_gastwirth_from_sorted_data(sorted_data: Pclong; stride: Tsize_t; n: Tsize_t): double; cdecl; external libgsl;
function gsl_stats_long_mad0(data: Pclong; stride: Tsize_t; n: Tsize_t; work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_long_mad(data: Pclong; stride: Tsize_t; n: Tsize_t; work: Pdouble): double; cdecl; external libgsl;
function gsl_stats_long_Sn0_from_sorted_data(sorted_data: Pclong; stride: Tsize_t; n: Tsize_t; work: Pclong): Tclong; cdecl; external libgsl;
function gsl_stats_long_Sn_from_sorted_data(sorted_data: Pclong; stride: Tsize_t; n: Tsize_t; work: Pclong): double; cdecl; external libgsl;
function gsl_stats_long_Qn0_from_sorted_data(sorted_data: Pclong; stride: Tsize_t; n: Tsize_t; work: Pclong; work_int: PInteger): Tculong; cdecl; external libgsl;
function gsl_stats_long_Qn_from_sorted_data(sorted_data: Pclong; stride: Tsize_t; n: Tsize_t; work: Pclong; work_int: PInteger): double; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:19:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
