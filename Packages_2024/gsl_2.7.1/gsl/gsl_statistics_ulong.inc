{$IFDEF read_interface}



function gsl_stats_ulong_mean(data: Pculong; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_variance(data: Pculong; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_sd(data: Pculong; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_variance_with_fixed_mean(data: Pculong; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_sd_with_fixed_mean(data: Pculong; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_tss(data: Pculong; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_tss_m(data: Pculong; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_absdev(data: Pculong; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_skew(data: Pculong; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_kurtosis(data: Pculong; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_lag1_autocorrelation(data: Pculong; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_covariance(data1: Pculong; stride1: Tsize_t; data2: Pculong; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_correlation(data1: Pculong; stride1: Tsize_t; data2: Pculong; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_spearman(data1: Pculong; stride1: Tsize_t; data2: Pculong; stride2: Tsize_t; n: Tsize_t;
  work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_variance_m(data: Pculong; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_sd_m(data: Pculong; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_absdev_m(data: Pculong; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_skew_m_sd(data: Pculong; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_kurtosis_m_sd(data: Pculong; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_lag1_autocorrelation_m(data: Pculong; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_covariance_m(data1: Pculong; stride1: Tsize_t; data2: Pculong; stride2: Tsize_t; n: Tsize_t;
  mean1: Tdouble; mean2: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_pvariance(data1: Pculong; stride1: Tsize_t; n1: Tsize_t; data2: Pculong; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_ttest(data1: Pculong; stride1: Tsize_t; n1: Tsize_t; data2: Pculong; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_max(data: Pculong; stride: Tsize_t; n: Tsize_t): Tculong; cdecl; external libgsl;
function gsl_stats_ulong_min(data: Pculong; stride: Tsize_t; n: Tsize_t): Tculong; cdecl; external libgsl;
procedure gsl_stats_ulong_minmax(min: Pclong; max: Pclong; data: Pculong; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_ulong_max_index(data: Pculong; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_stats_ulong_min_index(data: Pculong; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
procedure gsl_stats_ulong_minmax_index(min_index: Psize_t; max_index: Psize_t; data: Pculong; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_ulong_select(data: Pculong; stride: Tsize_t; n: Tsize_t; k: Tsize_t): Tculong; cdecl; external libgsl;
function gsl_stats_ulong_median_from_sorted_data(sorted_data: Pculong; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_median(sorted_data: Pculong; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_quantile_from_sorted_data(sorted_data: Pculong; stride: Tsize_t; n: Tsize_t; f: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_trmean_from_sorted_data(trim: Tdouble; sorted_data: Pculong; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_gastwirth_from_sorted_data(sorted_data: Pculong; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_mad0(data: Pculong; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_mad(data: Pculong; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_Sn0_from_sorted_data(sorted_data: Pculong; stride: Tsize_t; n: Tsize_t; work: Pculong): Tculong; cdecl; external libgsl;
function gsl_stats_ulong_Sn_from_sorted_data(sorted_data: Pculong; stride: Tsize_t; n: Tsize_t; work: Pculong): Tdouble; cdecl; external libgsl;
function gsl_stats_ulong_Qn0_from_sorted_data(sorted_data: Pculong; stride: Tsize_t; n: Tsize_t; work: Pculong; work_int: Plongint): Tculong; cdecl; external libgsl;
function gsl_stats_ulong_Qn_from_sorted_data(sorted_data: Pculong; stride: Tsize_t; n: Tsize_t; work: Pculong; work_int: Plongint): Tdouble; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:20:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
