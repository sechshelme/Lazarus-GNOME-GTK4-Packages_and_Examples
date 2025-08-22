{$IFDEF read_interface}



function gsl_stats_uchar_mean(data: pbyte; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_variance(data: pbyte; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_sd(data: pbyte; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_variance_with_fixed_mean(data: pbyte; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_sd_with_fixed_mean(data: pbyte; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_tss(data: pbyte; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_tss_m(data: pbyte; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_absdev(data: pbyte; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_skew(data: pbyte; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_kurtosis(data: pbyte; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_lag1_autocorrelation(data: pbyte; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_covariance(data1: pbyte; stride1: Tsize_t; data2: pbyte; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_correlation(data1: pbyte; stride1: Tsize_t; data2: pbyte; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_spearman(data1: pbyte; stride1: Tsize_t; data2: pbyte; stride2: Tsize_t; n: Tsize_t;
  work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_variance_m(data: pbyte; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_sd_m(data: pbyte; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_absdev_m(data: pbyte; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_skew_m_sd(data: pbyte; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_kurtosis_m_sd(data: pbyte; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_lag1_autocorrelation_m(data: pbyte; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_covariance_m(data1: pbyte; stride1: Tsize_t; data2: pbyte; stride2: Tsize_t; n: Tsize_t;
  mean1: Tdouble; mean2: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_pvariance(data1: pbyte; stride1: Tsize_t; n1: Tsize_t; data2: pbyte; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_ttest(data1: pbyte; stride1: Tsize_t; n1: Tsize_t; data2: pbyte; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_max(data: pbyte; stride: Tsize_t; n: Tsize_t): byte; cdecl; external libgsl;
function gsl_stats_uchar_min(data: pbyte; stride: Tsize_t; n: Tsize_t): byte; cdecl; external libgsl;
procedure gsl_stats_uchar_minmax(min: pbyte; max: pbyte; data: pbyte; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_uchar_max_index(data: pbyte; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_stats_uchar_min_index(data: pbyte; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
procedure gsl_stats_uchar_minmax_index(min_index: Psize_t; max_index: Psize_t; data: pbyte; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_uchar_select(data: pbyte; stride: Tsize_t; n: Tsize_t; k: Tsize_t): byte; cdecl; external libgsl;
function gsl_stats_uchar_median_from_sorted_data(sorted_data: pbyte; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_median(sorted_data: pbyte; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_quantile_from_sorted_data(sorted_data: pbyte; stride: Tsize_t; n: Tsize_t; f: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_trmean_from_sorted_data(trim: Tdouble; sorted_data: pbyte; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_gastwirth_from_sorted_data(sorted_data: pbyte; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_mad0(data: pbyte; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_mad(data: pbyte; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_Sn0_from_sorted_data(sorted_data: pbyte; stride: Tsize_t; n: Tsize_t; work: pbyte): byte; cdecl; external libgsl;
function gsl_stats_uchar_Sn_from_sorted_data(sorted_data: pbyte; stride: Tsize_t; n: Tsize_t; work: pbyte): Tdouble; cdecl; external libgsl;
function gsl_stats_uchar_Qn0_from_sorted_data(sorted_data: pbyte; stride: Tsize_t; n: Tsize_t; work: pbyte; work_int: Plongint): byte; cdecl; external libgsl;
function gsl_stats_uchar_Qn_from_sorted_data(sorted_data: pbyte; stride: Tsize_t; n: Tsize_t; work: pbyte; work_int: Plongint): Tdouble; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:20:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
