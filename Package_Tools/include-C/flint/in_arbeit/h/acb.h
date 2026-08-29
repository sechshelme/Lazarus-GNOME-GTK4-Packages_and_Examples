/*
    Copyright (C) 2012 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
*/

extern void
acb_init(acb_t x)
;

void acb_clear(acb_t x);

acb_ptr _acb_vec_init(slong n);
void _acb_vec_clear(acb_ptr v, slong n);

extern arb_ptr acb_real_ptr(acb_t z) ;
extern arb_ptr acb_imag_ptr(acb_t z) ;

extern void
acb_get_real(arb_t re, const acb_t z)
;

extern void
acb_get_imag(arb_t im, const acb_t z)
;

extern void
acb_get_mid(acb_t res, const acb_t x)
;

extern int
acb_is_zero(const acb_t z)
;

extern int
acb_is_one(const acb_t z)
;

extern int
acb_is_exact(const acb_t z)
;

extern int
acb_is_int(const acb_t z)
;

extern int
acb_is_int_2exp_si(const acb_t z, slong e)
;

extern void
acb_zero(acb_t z)
;

extern void
acb_one(acb_t z)

;

extern void
acb_onei(acb_t z)
;

extern void
acb_set(acb_t z, const acb_t x)
;

extern void
acb_set_round(acb_t z, const acb_t x, slong prec)
;

extern void
acb_neg_round(acb_t z, const acb_t x, slong prec)
;

extern void
acb_swap(acb_t z, acb_t x)
;

extern int
acb_equal(const acb_t x, const acb_t y)
;

extern int
acb_equal_si(const acb_t x, slong y)
;

extern int
acb_eq(const acb_t x, const acb_t y)
;

extern int
acb_ne(const acb_t x, const acb_t y)
;

extern int
acb_overlaps(const acb_t x, const acb_t y)
;

extern int
acb_contains_zero(const acb_t x)
;

extern int
acb_contains_fmpq(const acb_t x, const fmpq_t y)
;

extern int
acb_contains_fmpz(const acb_t x, const fmpz_t y)
;

extern int
acb_contains(const acb_t x, const acb_t y)
;

extern int
acb_contains_interior(const acb_t x, const acb_t y)
;

extern void
acb_set_ui(acb_t z, ulong c)
;

extern void
acb_set_d(acb_t z, double c)
;

extern void
acb_set_si(acb_t z, slong c)
;

extern void
acb_set_si_si(acb_t z, slong x, slong y)
;

extern void
acb_set_d_d(acb_t z, double x, double y)
;

extern void
acb_set_fmpz(acb_t z, const fmpz_t c)
;

extern void
acb_set_fmpz_fmpz(acb_t z, const fmpz_t x, const fmpz_t y)
;

extern void
acb_set_round_fmpz(acb_t z, const fmpz_t y, slong prec)
;

int acb_contains_int(const acb_t x);

int acb_get_unique_fmpz(fmpz_t z, const acb_t x);

extern void
acb_set_fmpq(acb_t z, const fmpq_t c, slong prec)
;

extern void
acb_set_arb(acb_t z, const arb_t c)
;

extern void
acb_set_arb_arb(acb_t z, const arb_t x, const arb_t y)
;

extern void
acb_set_round_arb(acb_t z, const arb_t x, slong prec)
;

extern void
acb_trim(acb_t z, const acb_t x)

;

extern void
acb_add_error_arf(acb_t x, const arf_t err)
;

extern void
acb_add_error_mag(acb_t x, const mag_t err)
;

extern void
acb_add_error_arb(acb_t x, const arb_t err)
;

void acb_get_mag(mag_t z, const acb_t x);

void acb_get_mag_lower(mag_t z, const acb_t x);

void acb_get_abs_ubound_arf(arf_t u, const acb_t z, slong prec);
void acb_get_abs_lbound_arf(arf_t u, const acb_t z, slong prec);
void acb_get_rad_ubound_arf(arf_t u, const acb_t z, slong prec);

extern void
acb_union(acb_t res, const acb_t x, const acb_t y, slong prec)
;

void acb_arg(arb_t r, const acb_t z, slong prec);

void acb_sgn(acb_t res, const acb_t z, slong prec);

void acb_csgn(arb_t res, const acb_t z);

void acb_real_abs(acb_t res, const acb_t z, int analytic, slong prec);
void acb_real_sgn(acb_t res, const acb_t z, int analytic, slong prec);
void acb_real_heaviside(acb_t res, const acb_t z, int analytic, slong prec);
void acb_real_floor(acb_t res, const acb_t z, int analytic, slong prec);
void acb_real_ceil(acb_t res, const acb_t z, int analytic, slong prec);
void acb_real_max(acb_t res, const acb_t x, const acb_t y, int analytic, slong prec);
void acb_real_min(acb_t res, const acb_t x, const acb_t y, int analytic, slong prec);
void acb_real_sqrtpos(acb_t res, const acb_t z, int analytic, slong prec);

void acb_sqrt_analytic(acb_t res, const acb_t z, int analytic, slong prec);
void acb_rsqrt_analytic(acb_t res, const acb_t z, int analytic, slong prec);
void acb_log_analytic(acb_t res, const acb_t z, int analytic, slong prec);
void acb_pow_analytic(acb_t res, const acb_t z, const acb_t w, int analytic, slong prec);

extern void
acb_add(acb_t z, const acb_t x, const acb_t y, slong prec)
;

extern void
acb_sub(acb_t z, const acb_t x, const acb_t y, slong prec)
;

extern void
acb_add_si(acb_t z, const acb_t x, slong c, slong prec)
;

extern void
acb_add_ui(acb_t z, const acb_t x, ulong c, slong prec)
;

extern void
acb_sub_si(acb_t z, const acb_t x, slong c, slong prec)
;

extern void
acb_sub_ui(acb_t z, const acb_t x, ulong c, slong prec)
;

extern void
acb_add_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec)
;

extern void
acb_add_arb(acb_t z, const acb_t x, const arb_t y, slong prec)
;

extern void
acb_sub_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec)
;

extern void
acb_sub_arb(acb_t z, const acb_t x, const arb_t y, slong prec)
;

extern void
acb_neg(acb_t z, const acb_t x)
;

extern void
acb_conj(acb_t z, const acb_t x)
;

extern void
acb_abs(arb_t u, const acb_t z, slong prec)
;

extern void
acb_mul_ui(acb_t z, const acb_t x, ulong y, slong prec)
;

extern void
acb_mul_si(acb_t z, const acb_t x, slong y, slong prec)
;

extern void
acb_mul_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec)
;

extern void
acb_mul_arb(acb_t z, const acb_t x, const arb_t y, slong prec)
;

extern void
acb_mul_onei(acb_t z, const acb_t x)
;

extern void
acb_div_onei(acb_t z, const acb_t x)
;

void acb_mul(acb_t z, const acb_t x, const acb_t y, slong prec);

void acb_mul_naive(acb_t z, const acb_t x, const acb_t y, slong prec);

extern void
acb_mul_2exp_si(acb_t z, const acb_t x, slong e)
;

extern void
acb_mul_2exp_fmpz(acb_t z, const acb_t x, const fmpz_t c)
;

void acb_addmul(acb_t z, const acb_t x, const acb_t y, slong prec);

void acb_submul(acb_t z, const acb_t x, const acb_t y, slong prec);

extern void
acb_addmul_ui(acb_t z, const acb_t x, ulong y, slong prec)
;

extern void
acb_addmul_si(acb_t z, const acb_t x, slong y, slong prec)
;

extern void
acb_submul_ui(acb_t z, const acb_t x, ulong y, slong prec)
;

extern void
acb_submul_si(acb_t z, const acb_t x, slong y, slong prec)
;

extern void
acb_addmul_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec)
;

extern void
acb_submul_fmpz(acb_t z, const acb_t x, const fmpz_t y, slong prec)
;

extern void
acb_addmul_arb(acb_t z, const acb_t x, const arb_t y, slong prec)
;

extern void
acb_submul_arb(acb_t z, const acb_t x, const arb_t y, slong prec)
;

void acb_dot_simple(acb_t res, const acb_t initial, int subtract,
    acb_srcptr x, slong xstep, acb_srcptr y, slong ystep, slong len, slong prec);
void acb_dot_precise(acb_t res, const acb_t initial, int subtract,
    acb_srcptr x, slong xstep, acb_srcptr y, slong ystep, slong len, slong prec);
void acb_dot(acb_t res, const acb_t initial, int subtract,
    acb_srcptr x, slong xstep, acb_srcptr y, slong ystep, slong len, slong prec);

void acb_approx_dot(acb_t res, const acb_t initial, int subtract,
    acb_srcptr x, slong xstep, acb_srcptr y, slong ystep, slong len, slong prec);

void acb_dot_ui(acb_t res, const acb_t initial, int subtract,
    acb_srcptr x, slong xstep, const ulong * y, slong ystep, slong len, slong prec);
void acb_dot_si(acb_t res, const acb_t initial, int subtract,
    acb_srcptr x, slong xstep, const slong * y, slong ystep, slong len, slong prec);
void acb_dot_uiui(acb_t res, const acb_t initial, int subtract,
    acb_srcptr x, slong xstep, const ulong * y, slong ystep, slong len, slong prec);
void acb_dot_siui(acb_t res, const acb_t initial, int subtract,
    acb_srcptr x, slong xstep, const ulong * y, slong ystep, slong len, slong prec);
void acb_dot_fmpz(acb_t res, const acb_t initial, int subtract,
    acb_srcptr x, slong xstep, const fmpz * y, slong ystep, slong len, slong prec);

void acb_inv(acb_t z, const acb_t x, slong prec);

void acb_div(acb_t z, const acb_t x, const acb_t y, slong prec);

extern void
acb_div_ui(acb_t z, const acb_t x, ulong c, slong prec)
;

extern void
acb_div_si(acb_t z, const acb_t x, slong c, slong prec)
;

extern void
acb_div_arb(acb_t z, const acb_t x, const arb_t c, slong prec)
;

extern void
acb_div_fmpz(acb_t z, const acb_t x, const fmpz_t c, slong prec)
;

void acb_cube(acb_t y, const acb_t x, slong prec);
void acb_pow_fmpz(acb_t y, const acb_t b, const fmpz_t e, slong prec);
void acb_pow_ui(acb_t y, const acb_t b, ulong e, slong prec);
void acb_pow_si(acb_t y, const acb_t b, slong e, slong prec);

extern void
acb_const_pi(acb_t x, slong prec)
;

void acb_log(acb_t r, const acb_t z, slong prec);
void acb_log1p(acb_t r, const acb_t z, slong prec);

void acb_exp(acb_t r, const acb_t z, slong prec);
void acb_exp_pi_i(acb_t r, const acb_t z, slong prec);
void acb_exp_invexp(acb_t r, acb_t s, const acb_t z, slong prec);
void acb_expm1(acb_t r, const acb_t z, slong prec);

void acb_sin(acb_t r, const acb_t z, slong prec);
void acb_cos(acb_t r, const acb_t z, slong prec);
void acb_sin_cos(acb_t s, acb_t c, const acb_t z, slong prec);
void acb_tan(acb_t r, const acb_t z, slong prec);
void acb_cot(acb_t r, const acb_t z, slong prec);

void acb_asin(acb_t r, const acb_t z, slong prec);
void acb_acos(acb_t r, const acb_t z, slong prec);
void acb_atan(acb_t r, const acb_t z, slong prec);
void acb_asinh(acb_t r, const acb_t z, slong prec);
void acb_acosh(acb_t r, const acb_t z, slong prec);
void acb_atanh(acb_t r, const acb_t z, slong prec);

extern void
acb_sinh(acb_t y, const acb_t x, slong prec)
;

extern void
acb_cosh(acb_t y, const acb_t x, slong prec)
;

extern void
acb_sinh_cosh(acb_t y, acb_t z, const acb_t x, slong prec)
;

extern void
acb_tanh(acb_t y, const acb_t x, slong prec)
;

extern void
acb_coth(acb_t y, const acb_t x, slong prec)
;

void acb_sech(acb_t r, const acb_t z, slong prec);
void acb_csch(acb_t r, const acb_t z, slong prec);

extern void
acb_sec(acb_t y, const acb_t x, slong prec)
;

extern void
acb_csc(acb_t y, const acb_t x, slong prec)
;

void acb_sin_pi(acb_t r, const acb_t z, slong prec);
void acb_cos_pi(acb_t r, const acb_t z, slong prec);
void acb_sin_cos_pi(acb_t s, acb_t c, const acb_t z, slong prec);
void acb_tan_pi(acb_t r, const acb_t z, slong prec);
void acb_cot_pi(acb_t r, const acb_t z, slong prec);
void acb_csc_pi(acb_t y, const acb_t x, slong prec);

void acb_sinc(acb_t res, const acb_t z, slong prec);
void acb_sinc_pi(acb_t res, const acb_t z, slong prec);

void acb_pow_arb(acb_t z, const acb_t x, const arb_t y, slong prec);
void acb_pow(acb_t r, const acb_t x, const acb_t y, slong prec);

void acb_sqrt(acb_t y, const acb_t x, slong prec);
void acb_rsqrt(acb_t y, const acb_t x, slong prec);

void acb_root_ui(acb_t y, const acb_t x, ulong k, slong prec);

void acb_quadratic_roots_fmpz(acb_t r1, acb_t r2,
    const fmpz_t a, const fmpz_t b, const fmpz_t c, slong prec);

void acb_chebyshev_t_ui(acb_t a, ulong n, const acb_t x, slong prec);
void acb_chebyshev_t2_ui(acb_t a, acb_t b, ulong n, const acb_t x, slong prec);
void acb_chebyshev_u_ui(acb_t a, ulong n, const acb_t x, slong prec);
void acb_chebyshev_u2_ui(acb_t a, acb_t b, ulong n, const acb_t x, slong prec);

void acb_rising_ui(acb_t z, const acb_t x, ulong n, slong prec);
void acb_rising(acb_t z, const acb_t x, const acb_t n, slong prec);
void acb_rising2_ui(acb_t u, acb_t v, const acb_t x, ulong n, slong prec);

void acb_rising_ui_get_mag(mag_t bound, const acb_t s, ulong n);

void acb_gamma(acb_t y, const acb_t x, slong prec);
void acb_rgamma(acb_t y, const acb_t x, slong prec);
void acb_lgamma(acb_t y, const acb_t x, slong prec);
void acb_log_sin_pi(acb_t res, const acb_t z, slong prec);
void acb_digamma(acb_t y, const acb_t x, slong prec);
void acb_zeta(acb_t z, const acb_t s, slong prec);
void acb_hurwitz_zeta(acb_t z, const acb_t s, const acb_t a, slong prec);
void acb_polygamma(acb_t res, const acb_t s, const acb_t z, slong prec);

void acb_bernoulli_poly_ui(acb_t res, ulong n, const acb_t x, slong prec);

void acb_log_barnes_g(acb_t res, const acb_t z, slong prec);
void acb_barnes_g(acb_t res, const acb_t z, slong prec);

void acb_polylog(acb_t w, const acb_t s, const acb_t z, slong prec);
void acb_polylog_si(acb_t w, slong s, const acb_t z, slong prec);

void acb_agm1(acb_t m, const acb_t z, slong prec);
void acb_agm1_cpx(acb_ptr m, const acb_t z, slong len, slong prec);
void acb_agm(acb_t res, const acb_t a, const acb_t b, slong prec);

#define ACB_LAMBERTW_LEFT 2
#define ACB_LAMBERTW_MIDDLE 4

void acb_lambertw_asymp(acb_t res, const acb_t z, const fmpz_t k, slong L, slong M, slong prec);
int acb_lambertw_check_branch(const acb_t w, const fmpz_t k, slong prec);
void acb_lambertw_bound_deriv(mag_t res, const acb_t z, const acb_t ez1, const fmpz_t k);
void acb_lambertw(acb_t res, const acb_t z, const fmpz_t k, int flags, slong prec);

extern void
acb_sqr(acb_t res, const acb_t val, slong prec)
;

extern int
acb_is_finite(const acb_t x)
;

extern void
acb_indeterminate(acb_t x)
;

extern acb_ptr
_acb_vec_entry_ptr(acb_ptr vec, slong i)
;

extern void
_acb_vec_zero(acb_ptr A, slong n)
;

extern int
_acb_vec_is_zero(acb_srcptr vec, slong len)
;

extern void
_acb_vec_set(acb_ptr res, acb_srcptr vec, slong len)
;

extern void
_acb_vec_set_round(acb_ptr res, acb_srcptr vec, slong len, slong prec)
;

extern void
_acb_vec_swap(acb_ptr res, acb_ptr vec, slong len)
;

extern void
_acb_vec_neg(acb_ptr res, acb_srcptr vec, slong len)
;

extern void
_acb_vec_add(acb_ptr res, acb_srcptr vec1, acb_srcptr vec2, slong len, slong prec)
;

extern void
_acb_vec_sub(acb_ptr res, acb_srcptr vec1, acb_srcptr vec2, slong len, slong prec)
;

extern void
_acb_vec_scalar_submul(acb_ptr res, acb_srcptr vec, slong len, const acb_t c, slong prec)
;

extern void
_acb_vec_scalar_addmul(acb_ptr res, acb_srcptr vec, slong len, const acb_t c, slong prec)

;

extern void
_acb_vec_scalar_mul(acb_ptr res, acb_srcptr vec, slong len, const acb_t c, slong prec)
;

extern void
_acb_vec_scalar_mul_ui(acb_ptr res, acb_srcptr vec, slong len, ulong c, slong prec)
;

extern void
_acb_vec_scalar_mul_2exp_si(acb_ptr res, acb_srcptr vec, slong len, slong c)
;

extern void
_acb_vec_scalar_mul_onei(acb_ptr res, acb_srcptr vec, slong len)
;

extern void
_acb_vec_scalar_div_ui(acb_ptr res, acb_srcptr vec, slong len, ulong c, slong prec)
;

extern void
_acb_vec_scalar_div(acb_ptr res, acb_srcptr vec, slong len, const acb_t c, slong prec)
;

extern void
_acb_vec_scalar_mul_arb(acb_ptr res, acb_srcptr vec, slong len, const arb_t c, slong prec)
;

extern void
_acb_vec_scalar_div_arb(acb_ptr res, acb_srcptr vec, slong len, const arb_t c, slong prec)
;

extern void
_acb_vec_scalar_mul_fmpz(acb_ptr res, acb_srcptr vec, slong len, const fmpz_t c, slong prec)
;

extern void
_acb_vec_scalar_div_fmpz(acb_ptr res, acb_srcptr vec, slong len, const fmpz_t c, slong prec)
;

void acb_fprint(FILE * file, const acb_t x);
void acb_fprintd(FILE * file, const acb_t z, slong digits);
void acb_fprintn(FILE * fp, const acb_t z, slong digits, ulong flags);

void acb_print(const acb_t x);
void acb_printd(const acb_t z, slong digits);
void acb_printn(const acb_t x, slong digits, ulong flags);

void _acb_vec_printn(acb_srcptr vec, slong len, slong ndigits, ulong flags);

void acb_randtest(acb_t z, flint_rand_t state, slong prec, slong mag_bits);

void acb_randtest_special(acb_t z, flint_rand_t state, slong prec, slong mag_bits);

void acb_randtest_precise(acb_t z, flint_rand_t state, slong prec, slong mag_bits);

void acb_randtest_param(acb_t z, flint_rand_t state, slong prec, slong mag_bits);

slong acb_rel_error_bits(const acb_t x);

extern slong
acb_rel_accuracy_bits(const acb_t x)
;

slong acb_rel_one_accuracy_bits(const acb_t x);

extern slong
acb_bits(const acb_t x)
;

extern int
acb_is_real(const acb_t x)
;

extern int
_acb_vec_is_real(acb_srcptr v, slong len)
;

extern int
_acb_vec_is_finite(acb_srcptr vec, slong len)
;

extern slong
_acb_vec_bits(acb_srcptr vec, slong len)
;

void _acb_vec_set_powers(acb_ptr xs, const acb_t x, slong len, slong prec);

extern void
_acb_vec_add_error_arf_vec(acb_ptr res, arf_srcptr err, slong len)
;

extern void
_acb_vec_add_error_mag_vec(acb_ptr res, mag_srcptr err, slong len)
;

extern void
_acb_vec_indeterminate(acb_ptr vec, slong len)
;

extern void
_acb_vec_trim(acb_ptr res, acb_srcptr vec, slong len)
;

extern int
_acb_vec_get_unique_fmpz_vec(fmpz * res,  acb_srcptr vec, slong len)
;

/* sort complex numbers in a nice-to-display order */
void _acb_vec_sort_pretty(acb_ptr vec, slong len);

/* roots of unity */
void acb_unit_root(acb_t res, ulong order, slong prec);
void _acb_vec_unit_roots(acb_ptr z, slong order, slong len, slong prec);

extern slong
acb_allocated_bytes(const acb_t x)
;

extern slong
_acb_vec_allocated_bytes(acb_srcptr vec, slong len)
;

extern double
_acb_vec_estimate_allocated_bytes(slong len, slong prec)
;


