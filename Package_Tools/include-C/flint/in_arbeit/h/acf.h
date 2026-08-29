/*
    Copyright (C) 2022 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
*/


#define acf_realref(x) (&(x)->real)
#define acf_imagref(x) (&(x)->imag)

extern void
acf_init(acf_t x)
;

extern void
acf_clear(acf_t x)
;

extern acf_ptr _acf_vec_init(slong n);
extern void _acf_vec_clear(acf_ptr v, slong n) ;

extern arf_ptr acf_real_ptr(acf_t z);
extern arf_ptr acf_imag_ptr(acf_t z);

extern void
acf_set(acf_t z, const acf_t x)
;

extern void
acf_swap(acf_t z, acf_t x)
;

extern int
acf_equal(const acf_t x, const acf_t y)
;

/* todo: document */
extern void
acf_printd(const acf_t x, slong n)
;

/* todo: document */
extern slong
acf_bits(const acf_t x)
;

extern slong
acf_allocated_bytes(const acf_t x)
;

/* todo: document */
extern void acf_randtest(acf_t x, flint_rand_t state, slong bits, slong mag_bits)
;

/* todo: document */
extern void
acf_get_mag(mag_t res, const acf_t x)
;

/* todo: document */
extern void
acf_neg(acf_t z, const acf_t x)
;

/* todo: document */
extern int
acf_set_round(acf_t res, const acf_t x, slong prec, arf_rnd_t rnd)
;

/* todo: document */
extern int
acf_neg_round(acf_t res, const acf_t x, slong prec, arf_rnd_t rnd)
;

extern int
acf_add(acf_t res, const acf_t x, const acf_t y, slong prec, arf_rnd_t rnd)
;

extern int
acf_sub(acf_t res, const acf_t x, const acf_t y, slong prec, arf_rnd_t rnd)
;

extern int
acf_mul(acf_t res, const acf_t x, const acf_t y, slong prec, arf_rnd_t rnd)
;

void acf_approx_inv(acf_t res, const acf_t x, slong prec, arf_rnd_t rnd);
void acf_approx_div(acf_t res, const acf_t x, const acf_t y, slong prec, arf_rnd_t rnd);
void acf_approx_sqrt(acf_t res, const acf_t x, slong prec, arf_rnd_t rnd);

void acf_approx_dot(acf_t res, const acf_t initial, int subtract, acf_srcptr x, slong xstep, acf_srcptr y, slong ystep, slong len, slong prec, arf_rnd_t rnd);

#ifdef __cplusplus
;
#endif

#endif
