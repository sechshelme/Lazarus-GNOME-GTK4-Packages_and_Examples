/*
    Copyright (C) 2014 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
*/

typedef enum
{
    ARF_RND_DOWN  = 0,
    ARF_RND_UP    = 1,
    ARF_RND_FLOOR = 2,
    ARF_RND_CEIL  = 3,
    ARF_RND_NEAR  = 4
}
arf_rnd_t;

extern int
arf_rounds_down(arf_rnd_t rnd, int sgnbit)
;

extern int
arf_rounds_up(arf_rnd_t rnd, int sgnbit)
;

#ifdef __MPFR_H
extern mpfr_rnd_t
arf_rnd_to_mpfr(arf_rnd_t rnd)
;
#endif

/* Allow 'infinite' precision for operations where a result can be computed exactly. */
#define ARF_PREC_EXACT WORD_MAX

#define ARF_PREC_ADD(prec,extra) ((prec) == ARF_PREC_EXACT ? ARF_PREC_EXACT : (prec) + (extra))

#define ARF_RESULT_EXACT 0
#define ARF_RESULT_INEXACT 1

/* Range where we can skip fmpz overflow checks for exponent manipulation. */
#define ARF_MAX_LAGOM_EXP MAG_MAX_LAGOM_EXP
#define ARF_MIN_LAGOM_EXP MAG_MIN_LAGOM_EXP

/* Exponent values used to encode special values. */
#define ARF_EXP_ZERO 0
#define ARF_EXP_NAN COEFF_MIN
#define ARF_EXP_POS_INF (COEFF_MIN+1)
#define ARF_EXP_NEG_INF (COEFF_MIN+2)

/* Direct access to the exponent. */
#define ARF_EXP(x) ((x)->exp)
#define ARF_EXPREF(x) (&(x)->exp)



void _arf_promote(arf_t x, mp_size_t n);

void _arf_demote(arf_t x);


extern void
arf_init(arf_t x)
;

void arf_clear(arf_t x);

arf_ptr _arf_vec_init(slong n);
void _arf_vec_clear(arf_ptr v, slong n);

extern void
arf_zero(arf_t x)
;

extern void
arf_pos_inf(arf_t x)
;

extern void
arf_neg_inf(arf_t x)
;

extern void
arf_nan(arf_t x)
;

extern int
arf_is_special(const arf_t x)
;

extern int
arf_is_zero(const arf_t x)
;

extern int
arf_is_pos_inf(const arf_t x)
;

extern int
arf_is_neg_inf(const arf_t x)
;

extern int
arf_is_nan(const arf_t x)
;

extern int
arf_is_normal(const arf_t x)
;

extern int
arf_is_finite(const arf_t x)
;

extern int
arf_is_inf(const arf_t x)
;

extern void
arf_one(arf_t x)
;

extern int
arf_is_one(const arf_t x)
;

extern int
arf_sgn(const arf_t x)
;

int arf_cmp(const arf_t x, const arf_t y);

int arf_cmpabs(const arf_t x, const arf_t y);

int arf_cmpabs_ui(const arf_t x, ulong y);

int arf_cmpabs_d(const arf_t x, double y);

int arf_cmp_si(const arf_t x, slong y);

int arf_cmp_ui(const arf_t x, ulong y);

int arf_cmp_d(const arf_t x, double y);

extern void
arf_swap(arf_t y, arf_t x)
;

void arf_set(arf_t y, const arf_t x);

extern void
arf_neg(arf_t y, const arf_t x)
;

extern void
arf_init_set_ui(arf_t x, ulong v)
;

/* FLINT_ABS is unsafe for x = WORD_MIN */
#define UI_ABS_SI(x) (((slong)(x) < 0) ? (-(ulong)(x)) : ((ulong)(x)))

extern void
arf_init_set_si(arf_t x, slong v)
;

extern void
arf_set_ui(arf_t x, ulong v)
;

extern void
arf_set_si(arf_t x, slong v)
;

extern void
arf_init_set_shallow(arf_t z, const arf_t x)
;

extern void
arf_init_neg_shallow(arf_t z, const arf_t x)

;

extern void
arf_init_set_mag_shallow(arf_t y, const mag_t x)
;

extern void
arf_init_neg_mag_shallow(arf_t z, const mag_t x)
;

extern int
arf_cmpabs_mag(const arf_t x, const mag_t y)
;

extern int
arf_mag_cmpabs(const mag_t x, const arf_t y)

;

/* Assumes xn > 0, x[xn-1] != 0. */
/* TBD: 1, 2 limb versions */
void arf_set_mpn(arf_t y, mp_srcptr x, mp_size_t xn, int sgnbit);

extern void
arf_set_mpz(arf_t y, const mpz_t x)

;

extern void
arf_set_fmpz(arf_t y, const fmpz_t x)
;

int _arf_set_round_ui(arf_t x, ulong v, int sgnbit, slong prec, arf_rnd_t rnd);

int _arf_set_round_uiui(arf_t z, slong * fix, mp_limb_t hi, mp_limb_t lo, int sgnbit, slong prec, arf_rnd_t rnd);

int
_arf_set_round_mpn(arf_t y, slong * exp_shift, mp_srcptr x, mp_size_t xn,
    int sgnbit, slong prec, arf_rnd_t rnd);

extern int
arf_set_round_ui(arf_t x, ulong v, slong prec, arf_rnd_t rnd)
;

extern int
arf_set_round_si(arf_t x, slong v, slong prec, arf_rnd_t rnd)
;

extern int
arf_set_round_mpz(arf_t y, const mpz_t x, slong prec, arf_rnd_t rnd)
;

extern int
arf_set_round_fmpz(arf_t y, const fmpz_t x, slong prec, arf_rnd_t rnd)
;

int arf_set_round(arf_t y, const arf_t x, slong prec, arf_rnd_t rnd);

int arf_neg_round(arf_t y, const arf_t x, slong prec, arf_rnd_t rnd);

#ifdef __MPFR_H
int arf_get_mpfr(mpfr_t x, const arf_t y, mpfr_rnd_t rnd);
void arf_set_mpfr(arf_t x, const mpfr_t y);
int _arf_call_mpfr_func(arf_ptr r1, arf_ptr r2, int (*func)(void), arf_srcptr x, arf_srcptr y, slong prec, arf_rnd_t rnd);
#endif

int arf_equal(const arf_t x, const arf_t y);
int arf_equal_si(const arf_t x, slong y);
int arf_equal_ui(const arf_t x, ulong y);
int arf_equal_d(const arf_t x, double y);

extern void
arf_min(arf_t z, const arf_t a, const arf_t b)
;

extern void
arf_max(arf_t z, const arf_t a, const arf_t b)
;

extern void
arf_abs(arf_t y, const arf_t x)
;

extern slong
arf_bits(const arf_t x)
;

extern void
arf_bot(fmpz_t e, const arf_t x)
;

int arf_is_int(const arf_t x);

int arf_is_int_2exp_si(const arf_t x, slong e);

int arf_cmp_2exp_si(const arf_t x, slong e);

int arf_cmpabs_2exp_si(const arf_t x, slong e);

extern void
arf_set_si_2exp_si(arf_t x, slong man, slong exp)
;

extern void
arf_set_ui_2exp_si(arf_t x, ulong man, slong exp)
;

extern void
arf_mul_2exp_si(arf_t y, const arf_t x, slong e)
;

extern void
arf_mul_2exp_fmpz(arf_t y, const arf_t x, const fmpz_t e)
;

extern int
arf_set_round_fmpz_2exp(arf_t y, const fmpz_t x, const fmpz_t exp, slong prec, arf_rnd_t rnd)
;

extern void
arf_abs_bound_lt_2exp_fmpz(fmpz_t b, const arf_t x)
;

extern void
arf_abs_bound_le_2exp_fmpz(fmpz_t b, const arf_t x)
;

slong arf_abs_bound_lt_2exp_si(const arf_t x);

void arf_frexp(arf_t man, fmpz_t exp, const arf_t x);

void arf_get_fmpz_2exp(fmpz_t man, fmpz_t exp, const arf_t x);

int _arf_get_integer_mpn(mp_ptr y, mp_srcptr x, mp_size_t xn, slong exp);

int _arf_set_mpn_fixed(arf_t z, mp_srcptr xp, mp_size_t xn,
        mp_size_t fixn, int negative, slong prec, arf_rnd_t rnd);

int arf_get_fmpz(fmpz_t z, const arf_t x, arf_rnd_t rnd);

slong arf_get_si(const arf_t x, arf_rnd_t rnd);

int arf_get_fmpz_fixed_fmpz(fmpz_t y, const arf_t x, const fmpz_t e);

int arf_get_fmpz_fixed_si(fmpz_t y, const arf_t x, slong e);

extern void
arf_set_fmpz_2exp(arf_t x, const fmpz_t man, const fmpz_t exp)
;

void arf_floor(arf_t z, const arf_t x);

void arf_ceil(arf_t z, const arf_t x);

void arf_debug(const arf_t x);

char * arf_get_str(const arf_t x, slong d);

#ifdef FLINT_HAVE_FILE
void arf_fprint(FILE * file, const arf_t x);
void arf_fprintd(FILE * file, const arf_t y, slong d);
#endif

void arf_print(const arf_t x);
void arf_printd(const arf_t y, slong d);

void arf_randtest(arf_t x, flint_rand_t state, slong bits, slong mag_bits);

void arf_randtest_not_zero(arf_t x, flint_rand_t state, slong bits, slong mag_bits);

void arf_randtest_special(arf_t x, flint_rand_t state, slong bits, slong mag_bits);

void arf_urandom(arf_t x, flint_rand_t state, slong bits, arf_rnd_t rnd);

#define MUL_MPFR_MIN_LIMBS 25

#ifdef FLINT_HAVE_FFT_SMALL
#define MUL_MPFR_MAX_LIMBS 800
#else
#define MUL_MPFR_MAX_LIMBS 10000
#endif

#define ARF_MUL_STACK_ALLOC 40
#define ARF_MUL_TLS_ALLOC 1000

extern  mp_ptr __arf_mul_tmp;
extern slong __arf_mul_alloc;

extern void _arf_mul_tmp_cleanup(void);


void arf_mul_special(arf_t z, const arf_t x, const arf_t y);

int arf_mul_via_mpfr(arf_t z, const arf_t x, const arf_t y, slong prec, arf_rnd_t rnd);

int arf_mul_rnd_any(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec, arf_rnd_t rnd);

int arf_mul_rnd_down(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec);

#define arf_mul(z, x, y, prec, rnd)              \
    ((rnd == ARF_RND_DOWN)                      \
        ? arf_mul_rnd_down(z, x, y, prec)        \
        : arf_mul_rnd_any(z, x, y, prec, rnd))

extern int
arf_neg_mul(arf_t z, const arf_t x, const arf_t y, slong prec, arf_rnd_t rnd)
;

extern int
arf_mul_ui(arf_ptr z, arf_srcptr x, ulong y, slong prec, arf_rnd_t rnd)
;

extern int
arf_mul_si(arf_ptr z, arf_srcptr x, slong y, slong prec, arf_rnd_t rnd)
;

int arf_mul_mpz(arf_ptr z, arf_srcptr x, const mpz_t y, slong prec, arf_rnd_t rnd);

extern int
arf_mul_fmpz(arf_ptr z, arf_srcptr x, const fmpz_t y, slong prec, arf_rnd_t rnd)
;

#define ARF_ADD_STACK_ALLOC 40
#define ARF_ADD_TLS_ALLOC 1000

extern  mp_ptr __arf_add_tmp;
extern  slong __arf_add_alloc;

extern void _arf_add_tmp_cleanup(void);


int _arf_add_mpn(arf_t z, mp_srcptr xp, mp_size_t xn, int xsgnbit,
    const fmpz_t xexp, mp_srcptr yp, mp_size_t yn, int ysgnbit,
    flint_bitcnt_t shift, slong prec, arf_rnd_t rnd);

int arf_add(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec, arf_rnd_t rnd);
int arf_add_si(arf_ptr z, arf_srcptr x, slong y, slong prec, arf_rnd_t rnd);
int arf_add_ui(arf_ptr z, arf_srcptr x, ulong y, slong prec, arf_rnd_t rnd);
int arf_add_fmpz(arf_ptr z, arf_srcptr x, const fmpz_t y, slong prec, arf_rnd_t rnd);

int arf_add_fmpz_2exp(arf_ptr z, arf_srcptr x, const fmpz_t y, const fmpz_t exp, slong prec, arf_rnd_t rnd);

int arf_sub(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec, arf_rnd_t rnd);
int arf_sub_si(arf_ptr z, arf_srcptr x, slong y, slong prec, arf_rnd_t rnd);
int arf_sub_ui(arf_ptr z, arf_srcptr x, ulong y, slong prec, arf_rnd_t rnd);
int arf_sub_fmpz(arf_ptr z, arf_srcptr x, const fmpz_t y, slong prec, arf_rnd_t rnd);

int arf_addmul(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec, arf_rnd_t rnd);

extern int
arf_addmul_ui(arf_ptr z, arf_srcptr x, ulong y, slong prec, arf_rnd_t rnd)
;

extern int
arf_addmul_si(arf_ptr z, arf_srcptr x, slong y, slong prec, arf_rnd_t rnd)
;

int arf_addmul_mpz(arf_ptr z, arf_srcptr x, const mpz_t y, slong prec, arf_rnd_t rnd);

extern int
arf_addmul_fmpz(arf_ptr z, arf_srcptr x, const fmpz_t y, slong prec, arf_rnd_t rnd)
;

int arf_submul(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec, arf_rnd_t rnd);

extern int
arf_submul_ui(arf_ptr z, arf_srcptr x, ulong y, slong prec, arf_rnd_t rnd)
;

extern int
arf_submul_si(arf_ptr z, arf_srcptr x, slong y, slong prec, arf_rnd_t rnd)
;

int arf_submul_mpz(arf_ptr z, arf_srcptr x, const mpz_t y, slong prec, arf_rnd_t rnd);

extern int
arf_submul_fmpz(arf_ptr z, arf_srcptr x, const fmpz_t y, slong prec, arf_rnd_t rnd)
;

int arf_fma(arf_ptr res, arf_srcptr x, arf_srcptr y, arf_srcptr z, slong prec, arf_rnd_t rnd);

int arf_sosq(arf_t z, const arf_t x, const arf_t y, slong prec, arf_rnd_t rnd);

int arf_div(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec, arf_rnd_t rnd);

extern int
arf_div_ui(arf_ptr z, arf_srcptr x, ulong y, slong prec, arf_rnd_t rnd)
;

extern int
arf_ui_div(arf_ptr z, ulong x, arf_srcptr y, slong prec, arf_rnd_t rnd)
;

extern int
arf_div_si(arf_ptr z, arf_srcptr x, slong y, slong prec, arf_rnd_t rnd)
;

extern int
arf_si_div(arf_ptr z, slong x, arf_srcptr y, slong prec, arf_rnd_t rnd)
;

extern int
arf_div_fmpz(arf_ptr z, arf_srcptr x, const fmpz_t y, slong prec, arf_rnd_t rnd)
;

extern int
arf_fmpz_div(arf_ptr z, const fmpz_t x, arf_srcptr y, slong prec, arf_rnd_t rnd)
;

extern int
arf_fmpz_div_fmpz(arf_ptr z, const fmpz_t x, const fmpz_t y, slong prec, arf_rnd_t rnd)
;

int arf_sqrt(arf_ptr z, arf_srcptr x, slong prec, arf_rnd_t rnd);

int arf_sqrt_ui(arf_t z, ulong x, slong prec, arf_rnd_t rnd);

int arf_sqrt_fmpz(arf_t z, const fmpz_t x, slong prec, arf_rnd_t rnd);

int arf_rsqrt(arf_ptr z, arf_srcptr x, slong prec, arf_rnd_t rnd);

int arf_root(arf_ptr z, arf_srcptr x, ulong k, slong prec, arf_rnd_t rnd);

/* Magnitude bounds */

void arf_get_mag(mag_t y, const arf_t x);

void arf_get_mag_lower(mag_t y, const arf_t x);

extern void
arf_set_mag(arf_t y, const mag_t x)
;

extern void
mag_init_set_arf(mag_t y, const arf_t x)
;

extern void
mag_fast_init_set_arf(mag_t y, const arf_t x)
;

extern void
arf_mag_fast_add_ulp(mag_t z, const mag_t x, const arf_t y, slong prec)
;

extern void
arf_mag_add_ulp(mag_t z, const mag_t x, const arf_t y, slong prec)
;

extern void
arf_mag_set_ulp(mag_t z, const arf_t y, slong prec)
;

void arf_get_fmpq(fmpq_t y, const arf_t x);

extern int
arf_set_fmpq(arf_t y, const fmpq_t x, slong prec, arf_rnd_t rnd)
;

int arf_complex_mul(arf_t e, arf_t f, const arf_t a, const arf_t b,
                                      const arf_t c, const arf_t d,
                                      slong prec, arf_rnd_t rnd);

int arf_complex_mul_fallback(arf_t e, arf_t f,
        const arf_t a, const arf_t b,
        const arf_t c, const arf_t d,
        slong prec, arf_rnd_t rnd);

int arf_complex_sqr(arf_t e, arf_t f, const arf_t a, const arf_t b,
                                      slong prec, arf_rnd_t rnd);

int arf_sum(arf_t s, arf_srcptr terms, slong len, slong prec, arf_rnd_t rnd);

double arf_get_d(const arf_t x, arf_rnd_t rnd);
void arf_set_d(arf_t x, double v);

extern slong
arf_allocated_bytes(const arf_t x)
;

int arf_load_str(arf_t res, const char * data);
char * arf_dump_str(const arf_t x);

#ifdef FLINT_HAVE_FILE
int arf_load_file(arf_t res, FILE *stream);
int arf_dump_file(FILE* stream, const arf_t x);
#endif

void arf_approx_dot(arf_t res, const arf_t initial, int subtract,
    arf_srcptr x, slong xstep, arf_srcptr y, slong ystep, slong len, slong prec, arf_rnd_t rnd);

#ifdef __cplusplus
;
#endif

#endif

