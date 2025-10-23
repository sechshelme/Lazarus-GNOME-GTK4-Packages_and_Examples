{$IFDEF read_interface}



function gsl_stats_char_mean(data: pint8; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_variance(data: pint8; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_sd(data: pint8; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_variance_with_fixed_mean(data: pint8; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_sd_with_fixed_mean(data: pint8; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_tss(data: pint8; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_tss_m(data: pint8; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_absdev(data: pint8; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_skew(data: pint8; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_kurtosis(data: pint8; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_lag1_autocorrelation(data: pint8; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_covariance(data1: pint8; stride1: Tsize_t; data2: pint8; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_correlation(data1: pint8; stride1: Tsize_t; data2: pint8; stride2: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_spearman(data1: pint8; stride1: Tsize_t; data2: pint8; stride2: Tsize_t; n: Tsize_t;
  work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_variance_m(data: pint8; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_sd_m(data: pint8; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_absdev_m(data: pint8; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_skew_m_sd(data: pint8; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_kurtosis_m_sd(data: pint8; stride: Tsize_t; n: Tsize_t; mean: Tdouble; sd: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_lag1_autocorrelation_m(data: pint8; stride: Tsize_t; n: Tsize_t; mean: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_covariance_m(data1: pint8; stride1: Tsize_t; data2: pint8; stride2: Tsize_t; n: Tsize_t;
  mean1: Tdouble; mean2: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_pvariance(data1: pint8; stride1: Tsize_t; n1: Tsize_t; data2: pint8; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_ttest(data1: pint8; stride1: Tsize_t; n1: Tsize_t; data2: pint8; stride2: Tsize_t;
  n2: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_max(data: pint8; stride: Tsize_t; n: Tsize_t): char; cdecl; external libgsl;
function gsl_stats_char_min(data: pint8; stride: Tsize_t; n: Tsize_t): char; cdecl; external libgsl;
procedure gsl_stats_char_minmax(min: pint8; max: pint8; data: pint8; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_char_max_index(data: pint8; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
function gsl_stats_char_min_index(data: pint8; stride: Tsize_t; n: Tsize_t): Tsize_t; cdecl; external libgsl;
procedure gsl_stats_char_minmax_index(min_index: Psize_t; max_index: Psize_t; data: pint8; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_stats_char_select(data: pint8; stride: Tsize_t; n: Tsize_t; k: Tsize_t): char; cdecl; external libgsl;
function gsl_stats_char_median_from_sorted_data(sorted_data: pint8; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_median(sorted_data: pint8; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_quantile_from_sorted_data(sorted_data: pint8; stride: Tsize_t; n: Tsize_t; f: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_trmean_from_sorted_data(trim: Tdouble; sorted_data: pint8; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_gastwirth_from_sorted_data(sorted_data: pint8; stride: Tsize_t; n: Tsize_t): Tdouble; cdecl; external libgsl;
function gsl_stats_char_mad0(data: pint8; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_mad(data: pint8; stride: Tsize_t; n: Tsize_t; work: Pdouble): Tdouble; cdecl; external libgsl;
function gsl_stats_char_Sn0_from_sorted_data(sorted_data: pint8; stride: Tsize_t; n: Tsize_t; work: pint8): char; cdecl; external libgsl;
function gsl_stats_char_Sn_from_sorted_data(sorted_data: pint8; stride: Tsize_t; n: Tsize_t; work: pint8): Tdouble; cdecl; external libgsl;
function gsl_stats_char_Qn0_from_sorted_data(sorted_data: pint8; stride: Tsize_t; n: Tsize_t; work: pint8; work_int: Plongint): char; cdecl; external libgsl;
function gsl_stats_char_Qn_from_sorted_data(sorted_data: pint8; stride: Tsize_t; n: Tsize_t; work: pint8; work_int: Plongint): Tdouble; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:19:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
