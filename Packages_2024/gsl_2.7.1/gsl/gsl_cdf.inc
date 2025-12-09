{$IFDEF read_interface}



function gsl_cdf_ugaussian_P(x: double): double; cdecl; external libgsl;
function gsl_cdf_ugaussian_Q(x: double): double; cdecl; external libgsl;
function gsl_cdf_ugaussian_Pinv(P: double): double; cdecl; external libgsl;
function gsl_cdf_ugaussian_Qinv(Q: double): double; cdecl; external libgsl;
function gsl_cdf_gaussian_P(x: double; sigma: double): double; cdecl; external libgsl;
function gsl_cdf_gaussian_Q(x: double; sigma: double): double; cdecl; external libgsl;
function gsl_cdf_gaussian_Pinv(P: double; sigma: double): double; cdecl; external libgsl;
function gsl_cdf_gaussian_Qinv(Q: double; sigma: double): double; cdecl; external libgsl;
function gsl_cdf_gamma_P(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_gamma_Q(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_gamma_Pinv(P: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_gamma_Qinv(Q: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_cauchy_P(x: double; a: double): double; cdecl; external libgsl;
function gsl_cdf_cauchy_Q(x: double; a: double): double; cdecl; external libgsl;
function gsl_cdf_cauchy_Pinv(P: double; a: double): double; cdecl; external libgsl;
function gsl_cdf_cauchy_Qinv(Q: double; a: double): double; cdecl; external libgsl;
function gsl_cdf_laplace_P(x: double; a: double): double; cdecl; external libgsl;
function gsl_cdf_laplace_Q(x: double; a: double): double; cdecl; external libgsl;
function gsl_cdf_laplace_Pinv(P: double; a: double): double; cdecl; external libgsl;
function gsl_cdf_laplace_Qinv(Q: double; a: double): double; cdecl; external libgsl;
function gsl_cdf_rayleigh_P(x: double; sigma: double): double; cdecl; external libgsl;
function gsl_cdf_rayleigh_Q(x: double; sigma: double): double; cdecl; external libgsl;
function gsl_cdf_rayleigh_Pinv(P: double; sigma: double): double; cdecl; external libgsl;
function gsl_cdf_rayleigh_Qinv(Q: double; sigma: double): double; cdecl; external libgsl;
function gsl_cdf_chisq_P(x: double; nu: double): double; cdecl; external libgsl;
function gsl_cdf_chisq_Q(x: double; nu: double): double; cdecl; external libgsl;
function gsl_cdf_chisq_Pinv(P: double; nu: double): double; cdecl; external libgsl;
function gsl_cdf_chisq_Qinv(Q: double; nu: double): double; cdecl; external libgsl;
function gsl_cdf_exponential_P(x: double; mu: double): double; cdecl; external libgsl;
function gsl_cdf_exponential_Q(x: double; mu: double): double; cdecl; external libgsl;
function gsl_cdf_exponential_Pinv(P: double; mu: double): double; cdecl; external libgsl;
function gsl_cdf_exponential_Qinv(Q: double; mu: double): double; cdecl; external libgsl;
function gsl_cdf_exppow_P(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_exppow_Q(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_tdist_P(x: double; nu: double): double; cdecl; external libgsl;
function gsl_cdf_tdist_Q(x: double; nu: double): double; cdecl; external libgsl;
function gsl_cdf_tdist_Pinv(P: double; nu: double): double; cdecl; external libgsl;
function gsl_cdf_tdist_Qinv(Q: double; nu: double): double; cdecl; external libgsl;
function gsl_cdf_fdist_P(x: double; nu1: double; nu2: double): double; cdecl; external libgsl;
function gsl_cdf_fdist_Q(x: double; nu1: double; nu2: double): double; cdecl; external libgsl;
function gsl_cdf_fdist_Pinv(P: double; nu1: double; nu2: double): double; cdecl; external libgsl;
function gsl_cdf_fdist_Qinv(Q: double; nu1: double; nu2: double): double; cdecl; external libgsl;
function gsl_cdf_beta_P(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_beta_Q(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_beta_Pinv(P: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_beta_Qinv(Q: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_flat_P(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_flat_Q(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_flat_Pinv(P: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_flat_Qinv(Q: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_lognormal_P(x: double; zeta: double; sigma: double): double; cdecl; external libgsl;
function gsl_cdf_lognormal_Q(x: double; zeta: double; sigma: double): double; cdecl; external libgsl;
function gsl_cdf_lognormal_Pinv(P: double; zeta: double; sigma: double): double; cdecl; external libgsl;
function gsl_cdf_lognormal_Qinv(Q: double; zeta: double; sigma: double): double; cdecl; external libgsl;
function gsl_cdf_gumbel1_P(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_gumbel1_Q(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_gumbel1_Pinv(P: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_gumbel1_Qinv(Q: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_gumbel2_P(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_gumbel2_Q(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_gumbel2_Pinv(P: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_gumbel2_Qinv(Q: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_weibull_P(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_weibull_Q(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_weibull_Pinv(P: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_weibull_Qinv(Q: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_pareto_P(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_pareto_Q(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_pareto_Pinv(P: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_pareto_Qinv(Q: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_cdf_logistic_P(x: double; a: double): double; cdecl; external libgsl;
function gsl_cdf_logistic_Q(x: double; a: double): double; cdecl; external libgsl;
function gsl_cdf_logistic_Pinv(P: double; a: double): double; cdecl; external libgsl;
function gsl_cdf_logistic_Qinv(Q: double; a: double): double; cdecl; external libgsl;
function gsl_cdf_binomial_P(k: dword; p: double; n: dword): double; cdecl; external libgsl;
function gsl_cdf_binomial_Q(k: dword; p: double; n: dword): double; cdecl; external libgsl;
function gsl_cdf_poisson_P(k: dword; mu: double): double; cdecl; external libgsl;
function gsl_cdf_poisson_Q(k: dword; mu: double): double; cdecl; external libgsl;
function gsl_cdf_geometric_P(k: dword; p: double): double; cdecl; external libgsl;
function gsl_cdf_geometric_Q(k: dword; p: double): double; cdecl; external libgsl;
function gsl_cdf_negative_binomial_P(k: dword; p: double; n: double): double; cdecl; external libgsl;
function gsl_cdf_negative_binomial_Q(k: dword; p: double; n: double): double; cdecl; external libgsl;
function gsl_cdf_pascal_P(k: dword; p: double; n: dword): double; cdecl; external libgsl;
function gsl_cdf_pascal_Q(k: dword; p: double; n: dword): double; cdecl; external libgsl;
function gsl_cdf_hypergeometric_P(k: dword; n1: dword; n2: dword; t: dword): double; cdecl; external libgsl;
function gsl_cdf_hypergeometric_Q(k: dword; n1: dword; n2: dword; t: dword): double; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:51:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
