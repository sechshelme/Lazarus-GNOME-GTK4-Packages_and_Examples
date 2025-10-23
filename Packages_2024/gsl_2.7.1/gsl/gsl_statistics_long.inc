{$IFDEF read_interface}



function gsl_stats_long_mean(data: Plongint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_variance(data: Plongint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_sd(data: Plongint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_variance_with_fixed_mean(data: Plongint; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_long_sd_with_fixed_mean(data: Plongint; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_long_tss(data: Plongint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_tss_m(data: Plongint; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_long_absdev(data: Plongint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_skew(data: Plongint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_kurtosis(data: Plongint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_lag1_autocorrelation(data: Plongint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_covariance(data1: Plongint; stride1: Tsize_t; data2: Plongint; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_correlation(data1: Plongint; stride1: Tsize_t; data2: Plongint; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_spearman(data1: Plongint; stride1: Tsize_t; data2: Plongint; stride2: Tsize_t; n: Tsize_t;
  work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_long_variance_m(data: Plongint; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_long_sd_m(data: Plongint; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_long_absdev_m(data: Plongint; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_long_skew_m_sd(data: Plongint; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_long_kurtosis_m_sd(data: Plongint; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_long_lag1_autocorrelation_m(data: Plongint; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_long_covariance_m(data1: Plongint; stride1: Tsize_t; data2: Plongint; stride2: Tsize_t; n: Tsize_t;
  mean1: Tdouble; mean2: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_long_pvariance(data1: Plongint; stride1: Tsize_t; n1: Tsize_t; data2: Plongint; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_ttest(data1: Plongint; stride1: Tsize_t; n1: Tsize_t; data2: Plongint; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_max(data: Plongint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_stats_long_min(data: Plongint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
procedure gsl_stats_long_minmax(min: Plongint; max: Plongint; data: Plongint; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_long_max_index(data: Plongint; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_stats_long_min_index(data: Plongint; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
procedure gsl_stats_long_minmax_index(min_index: Psize_t; max_index: Psize_t; data: Plongint; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_long_select(data: Plongint; stride: Tsize_t; n: Tsize_t; k: Tsize_t): longint; cdecl; external libgsl;
function gsl_stats_long_median_from_sorted_data(sorted_data: Plongint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_median(sorted_data: Plongint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_quantile_from_sorted_data(sorted_data: Plongint; stride: Tsize_t; n: Tsize_t; f: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_long_trmean_from_sorted_data(trim: Tdouble; sorted_data: Plongint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_gastwirth_from_sorted_data(sorted_data: Plongint; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_long_mad0(data: Plongint; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_long_mad(data: Plongint; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_long_Sn0_from_sorted_data(sorted_data: Plongint; stride: Tsize_t; n: Tsize_t; work: Plongint): longint; cdecl; external libgsl;
function gsl_stats_long_Sn_from_sorted_data(sorted_data: Plongint; stride: Tsize_t; n: Tsize_t; work: Plongint): Tdouble; cdecl; external libgsl;
function gsl_stats_long_Qn0_from_sorted_data(sorted_data: Plongint; stride: Tsize_t; n: Tsize_t; work: Plongint; work_int: Plongint): longint; cdecl; external libgsl;
function gsl_stats_long_Qn_from_sorted_data(sorted_data: Plongint; stride: Tsize_t; n: Tsize_t; work: Plongint; work_int: Plongint): Tdouble; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:19:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
