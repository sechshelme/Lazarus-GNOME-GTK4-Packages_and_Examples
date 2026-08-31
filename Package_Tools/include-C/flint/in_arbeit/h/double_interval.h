/*
    Copyright (C) 2021 Fredrik Johansson

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
*/


typedef struct
{
    double a;
    double b;
}
di_t;


extern
di_t di_interval(double a, double b)
;

extern
double _di_below(double x)
;

extern
double _di_above(double x)

;

extern
di_t di_neg(di_t x)
;

extern
di_t di_fast_add(di_t x, di_t y)
;

extern
di_t di_fast_sub(di_t x, di_t y)
;

di_t di_fast_mul(di_t x, di_t y);
di_t di_fast_sqr(di_t x);
di_t di_fast_div(di_t x, di_t y);

extern
di_t di_fast_add_d(di_t x, double y)
;

extern
di_t di_fast_sub_d(di_t x, double y)
;

extern
di_t di_fast_mul_d(di_t x, double y)
;

extern
di_t di_fast_div_d(di_t x, double y)
;

di_t di_fast_log_nonnegative(di_t x);

extern
di_t di_fast_mid(di_t x)
;

extern
double di_fast_ubound_radius(di_t x)
;

extern
void di_print(di_t x)
;

di_t arb_get_di(const arb_t x);
void arb_set_di(arb_t res, di_t x, slong prec);

extern
double d_randtest2(flint_rand_t state)
;

extern
di_t di_randtest(flint_rand_t state)
;

#ifdef __cplusplus
;
#endif

#endif

