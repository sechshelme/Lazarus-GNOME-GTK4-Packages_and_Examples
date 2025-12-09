{$IFDEF read_interface}



function gsl_ran_bernoulli(r: Pgsl_rng; p: double): dword; cdecl; external libgsl;
function gsl_ran_bernoulli_pdf(k: dword; p: double): double; cdecl; external libgsl;
function gsl_ran_beta(r: Pgsl_rng; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_beta_pdf(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_binomial(r: Pgsl_rng; p: double; n: dword): dword; cdecl; external libgsl;
function gsl_ran_binomial_knuth(r: Pgsl_rng; p: double; n: dword): dword; cdecl; external libgsl;
function gsl_ran_binomial_tpe(r: Pgsl_rng; p: double; n: dword): dword; cdecl; external libgsl;
function gsl_ran_binomial_pdf(k: dword; p: double; n: dword): double; cdecl; external libgsl;
function gsl_ran_exponential(r: Pgsl_rng; mu: double): double; cdecl; external libgsl;
function gsl_ran_exponential_pdf(x: double; mu: double): double; cdecl; external libgsl;
function gsl_ran_exppow(r: Pgsl_rng; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_exppow_pdf(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_cauchy(r: Pgsl_rng; a: double): double; cdecl; external libgsl;
function gsl_ran_cauchy_pdf(x: double; a: double): double; cdecl; external libgsl;
function gsl_ran_chisq(r: Pgsl_rng; nu: double): double; cdecl; external libgsl;
function gsl_ran_chisq_pdf(x: double; nu: double): double; cdecl; external libgsl;
procedure gsl_ran_dirichlet(r: Pgsl_rng; K: Tsize_t; alpha: Pdouble; theta: Pdouble); cdecl; external libgsl;
function gsl_ran_dirichlet_pdf(K: Tsize_t; alpha: Pdouble; theta: Pdouble): double; cdecl; external libgsl;
function gsl_ran_dirichlet_lnpdf(K: Tsize_t; alpha: Pdouble; theta: Pdouble): double; cdecl; external libgsl;
function gsl_ran_erlang(r: Pgsl_rng; a: double; n: double): double; cdecl; external libgsl;
function gsl_ran_erlang_pdf(x: double; a: double; n: double): double; cdecl; external libgsl;
function gsl_ran_fdist(r: Pgsl_rng; nu1: double; nu2: double): double; cdecl; external libgsl;
function gsl_ran_fdist_pdf(x: double; nu1: double; nu2: double): double; cdecl; external libgsl;
function gsl_ran_flat(r: Pgsl_rng; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_flat_pdf(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_gamma(r: Pgsl_rng; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_gamma_int(r: Pgsl_rng; a: dword): double; cdecl; external libgsl;
function gsl_ran_gamma_pdf(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_gamma_mt(r: Pgsl_rng; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_gamma_knuth(r: Pgsl_rng; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_gaussian(r: Pgsl_rng; sigma: double): double; cdecl; external libgsl;
function gsl_ran_gaussian_ratio_method(r: Pgsl_rng; sigma: double): double; cdecl; external libgsl;
function gsl_ran_gaussian_ziggurat(r: Pgsl_rng; sigma: double): double; cdecl; external libgsl;
function gsl_ran_gaussian_pdf(x: double; sigma: double): double; cdecl; external libgsl;
function gsl_ran_ugaussian(r: Pgsl_rng): double; cdecl; external libgsl;
function gsl_ran_ugaussian_ratio_method(r: Pgsl_rng): double; cdecl; external libgsl;
function gsl_ran_ugaussian_pdf(x: double): double; cdecl; external libgsl;
function gsl_ran_gaussian_tail(r: Pgsl_rng; a: double; sigma: double): double; cdecl; external libgsl;
function gsl_ran_gaussian_tail_pdf(x: double; a: double; sigma: double): double; cdecl; external libgsl;
function gsl_ran_ugaussian_tail(r: Pgsl_rng; a: double): double; cdecl; external libgsl;
function gsl_ran_ugaussian_tail_pdf(x: double; a: double): double; cdecl; external libgsl;
procedure gsl_ran_bivariate_gaussian(r: Pgsl_rng; sigma_x: double; sigma_y: double; rho: double; x: Pdouble;
  y: Pdouble); cdecl; external libgsl;
function gsl_ran_bivariate_gaussian_pdf(x: double; y: double; sigma_x: double; sigma_y: double; rho: double): double; cdecl; external libgsl;
function gsl_ran_multivariate_gaussian(r: Pgsl_rng; mu: Pgsl_vector; L: Pgsl_matrix; result: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_ran_multivariate_gaussian_log_pdf(x: Pgsl_vector; mu: Pgsl_vector; L: Pgsl_matrix; result: Pdouble; work: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_ran_multivariate_gaussian_pdf(x: Pgsl_vector; mu: Pgsl_vector; L: Pgsl_matrix; result: Pdouble; work: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_ran_multivariate_gaussian_mean(X: Pgsl_matrix; mu_hat: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_ran_multivariate_gaussian_vcov(X: Pgsl_matrix; sigma_hat: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_ran_wishart(r: Pgsl_rng; df: double; L: Pgsl_matrix; result: Pgsl_matrix; work: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_ran_wishart_log_pdf(X: Pgsl_matrix; L_X: Pgsl_matrix; df: double; L: Pgsl_matrix; result: Pdouble;
  work: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_ran_wishart_pdf(X: Pgsl_matrix; L_X: Pgsl_matrix; df: double; L: Pgsl_matrix; result: Pdouble;
  work: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_ran_landau(r: Pgsl_rng): double; cdecl; external libgsl;
function gsl_ran_landau_pdf(x: double): double; cdecl; external libgsl;
function gsl_ran_geometric(r: Pgsl_rng; p: double): dword; cdecl; external libgsl;
function gsl_ran_geometric_pdf(k: dword; p: double): double; cdecl; external libgsl;
function gsl_ran_hypergeometric(r: Pgsl_rng; n1: dword; n2: dword; t: dword): dword; cdecl; external libgsl;
function gsl_ran_hypergeometric_pdf(k: dword; n1: dword; n2: dword; t: dword): double; cdecl; external libgsl;
function gsl_ran_gumbel1(r: Pgsl_rng; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_gumbel1_pdf(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_gumbel2(r: Pgsl_rng; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_gumbel2_pdf(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_logistic(r: Pgsl_rng; a: double): double; cdecl; external libgsl;
function gsl_ran_logistic_pdf(x: double; a: double): double; cdecl; external libgsl;
function gsl_ran_lognormal(r: Pgsl_rng; zeta: double; sigma: double): double; cdecl; external libgsl;
function gsl_ran_lognormal_pdf(x: double; zeta: double; sigma: double): double; cdecl; external libgsl;
function gsl_ran_logarithmic(r: Pgsl_rng; p: double): dword; cdecl; external libgsl;
function gsl_ran_logarithmic_pdf(k: dword; p: double): double; cdecl; external libgsl;
procedure gsl_ran_multinomial(r: Pgsl_rng; K: Tsize_t; N: dword; p: Pdouble; n2: Pdword); cdecl; external libgsl;
function gsl_ran_multinomial_pdf(K: Tsize_t; p: Pdouble; n: Pdword): double; cdecl; external libgsl;
function gsl_ran_multinomial_lnpdf(K: Tsize_t; p: Pdouble; n: Pdword): double; cdecl; external libgsl;
function gsl_ran_negative_binomial(r: Pgsl_rng; p: double; n: double): dword; cdecl; external libgsl;
function gsl_ran_negative_binomial_pdf(k: dword; p: double; n: double): double; cdecl; external libgsl;
function gsl_ran_pascal(r: Pgsl_rng; p: double; n: dword): dword; cdecl; external libgsl;
function gsl_ran_pascal_pdf(k: dword; p: double; n: dword): double; cdecl; external libgsl;
function gsl_ran_pareto(r: Pgsl_rng; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_pareto_pdf(x: double; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_poisson(r: Pgsl_rng; mu: double): dword; cdecl; external libgsl;
procedure gsl_ran_poisson_array(r: Pgsl_rng; n: Tsize_t; arr: Pdword; mu: double); cdecl; external libgsl;
function gsl_ran_poisson_pdf(k: dword; mu: double): double; cdecl; external libgsl;
function gsl_ran_rayleigh(r: Pgsl_rng; sigma: double): double; cdecl; external libgsl;
function gsl_ran_rayleigh_pdf(x: double; sigma: double): double; cdecl; external libgsl;
function gsl_ran_rayleigh_tail(r: Pgsl_rng; a: double; sigma: double): double; cdecl; external libgsl;
function gsl_ran_rayleigh_tail_pdf(x: double; a: double; sigma: double): double; cdecl; external libgsl;
function gsl_ran_tdist(r: Pgsl_rng; nu: double): double; cdecl; external libgsl;
function gsl_ran_tdist_pdf(x: double; nu: double): double; cdecl; external libgsl;
function gsl_ran_laplace(r: Pgsl_rng; a: double): double; cdecl; external libgsl;
function gsl_ran_laplace_pdf(x: double; a: double): double; cdecl; external libgsl;
function gsl_ran_levy(r: Pgsl_rng; c: double; alpha: double): double; cdecl; external libgsl;
function gsl_ran_levy_skew(r: Pgsl_rng; c: double; alpha: double; beta: double): double; cdecl; external libgsl;
function gsl_ran_weibull(r: Pgsl_rng; a: double; b: double): double; cdecl; external libgsl;
function gsl_ran_weibull_pdf(x: double; a: double; b: double): double; cdecl; external libgsl;
procedure gsl_ran_dir_2d(r: Pgsl_rng; x: Pdouble; y: Pdouble); cdecl; external libgsl;
procedure gsl_ran_dir_2d_trig_method(r: Pgsl_rng; x: Pdouble; y: Pdouble); cdecl; external libgsl;
procedure gsl_ran_dir_3d(r: Pgsl_rng; x: Pdouble; y: Pdouble; z: Pdouble); cdecl; external libgsl;
procedure gsl_ran_dir_nd(r: Pgsl_rng; n: Tsize_t; x: Pdouble); cdecl; external libgsl;
procedure gsl_ran_shuffle(r: Pgsl_rng; base: pointer; nmembm: Tsize_t; size: Tsize_t); cdecl; external libgsl;
function gsl_ran_choose(r: Pgsl_rng; dest: pointer; k: Tsize_t; src: pointer; n: Tsize_t;
  size: Tsize_t): longint; cdecl; external libgsl;
procedure gsl_ran_sample(r: Pgsl_rng; dest: pointer; k: Tsize_t; src: pointer; n: Tsize_t;
  size: Tsize_t); cdecl; external libgsl;

type
  Tgsl_ran_discrete_t = record
    K: Tsize_t;
    A: Psize_t;
    F: Pdouble;
  end;
  Pgsl_ran_discrete_t = ^Tgsl_ran_discrete_t;

function gsl_ran_discrete_preproc(K: Tsize_t; P: Pdouble): Pgsl_ran_discrete_t; cdecl; external libgsl;
procedure gsl_ran_discrete_free(g: Pgsl_ran_discrete_t); cdecl; external libgsl;
function gsl_ran_discrete(r: Pgsl_rng; g: Pgsl_ran_discrete_t): Tsize_t; cdecl; external libgsl;
function gsl_ran_discrete_pdf(k: Tsize_t; g: Pgsl_ran_discrete_t): double; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:19:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
