{$IFDEF read_interface}



function gsl_cdf_ugaussian_P(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_ugaussian_Q(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_ugaussian_Pinv(P: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_ugaussian_Qinv(Q: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gaussian_P(x: Tdouble; sigma: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gaussian_Q(x: Tdouble; sigma: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gaussian_Pinv(P: Tdouble; sigma: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gaussian_Qinv(Q: Tdouble; sigma: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gamma_P(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gamma_Q(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gamma_Pinv(P: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gamma_Qinv(Q: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_cauchy_P(x: Tdouble; a: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_cauchy_Q(x: Tdouble; a: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_cauchy_Pinv(P: Tdouble; a: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_cauchy_Qinv(Q: Tdouble; a: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_laplace_P(x: Tdouble; a: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_laplace_Q(x: Tdouble; a: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_laplace_Pinv(P: Tdouble; a: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_laplace_Qinv(Q: Tdouble; a: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_rayleigh_P(x: Tdouble; sigma: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_rayleigh_Q(x: Tdouble; sigma: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_rayleigh_Pinv(P: Tdouble; sigma: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_rayleigh_Qinv(Q: Tdouble; sigma: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_chisq_P(x: Tdouble; nu: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_chisq_Q(x: Tdouble; nu: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_chisq_Pinv(P: Tdouble; nu: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_chisq_Qinv(Q: Tdouble; nu: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_exponential_P(x: Tdouble; mu: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_exponential_Q(x: Tdouble; mu: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_exponential_Pinv(P: Tdouble; mu: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_exponential_Qinv(Q: Tdouble; mu: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_exppow_P(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_exppow_Q(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_tdist_P(x: Tdouble; nu: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_tdist_Q(x: Tdouble; nu: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_tdist_Pinv(P: Tdouble; nu: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_tdist_Qinv(Q: Tdouble; nu: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_fdist_P(x: Tdouble; nu1: Tdouble; nu2: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_fdist_Q(x: Tdouble; nu1: Tdouble; nu2: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_fdist_Pinv(P: Tdouble; nu1: Tdouble; nu2: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_fdist_Qinv(Q: Tdouble; nu1: Tdouble; nu2: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_beta_P(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_beta_Q(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_beta_Pinv(P: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_beta_Qinv(Q: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_flat_P(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_flat_Q(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_flat_Pinv(P: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_flat_Qinv(Q: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_lognormal_P(x: Tdouble; zeta: Tdouble; sigma: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_lognormal_Q(x: Tdouble; zeta: Tdouble; sigma: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_lognormal_Pinv(P: Tdouble; zeta: Tdouble; sigma: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_lognormal_Qinv(Q: Tdouble; zeta: Tdouble; sigma: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gumbel1_P(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gumbel1_Q(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gumbel1_Pinv(P: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gumbel1_Qinv(Q: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gumbel2_P(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gumbel2_Q(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gumbel2_Pinv(P: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_gumbel2_Qinv(Q: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_weibull_P(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_weibull_Q(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_weibull_Pinv(P: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_weibull_Qinv(Q: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_pareto_P(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_pareto_Q(x: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_pareto_Pinv(P: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_pareto_Qinv(Q: Tdouble; a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_logistic_P(x: Tdouble; a: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_logistic_Q(x: Tdouble; a: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_logistic_Pinv(P: Tdouble; a: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_logistic_Qinv(Q: Tdouble; a: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_binomial_P(k: dword; p: Tdouble; n: dword): Tdouble; cdecl; external libgsl;
function gsl_cdf_binomial_Q(k: dword; p: Tdouble; n: dword): Tdouble; cdecl; external libgsl;
function gsl_cdf_poisson_P(k: dword; mu: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_poisson_Q(k: dword; mu: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_geometric_P(k: dword; p: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_geometric_Q(k: dword; p: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_negative_binomial_P(k: dword; p: Tdouble; n: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_negative_binomial_Q(k: dword; p: Tdouble; n: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cdf_pascal_P(k: dword; p: Tdouble; n: dword): Tdouble; cdecl; external libgsl;
function gsl_cdf_pascal_Q(k: dword; p: Tdouble; n: dword): Tdouble; cdecl; external libgsl;
function gsl_cdf_hypergeometric_P(k: dword; n1: dword; n2: dword; t: dword): Tdouble; cdecl; external libgsl;
function gsl_cdf_hypergeometric_Q(k: dword; n1: dword; n2: dword; t: dword): Tdouble; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:51:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
