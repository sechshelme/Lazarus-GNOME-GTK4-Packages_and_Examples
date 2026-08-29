/*
    Copyright (C) 2020 Fredrik Johansson

    This file is part of Calcium.

    Calcium is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
*/


/* Vector object */

typedef struct
{
    ca_ptr entries;
    slong alloc;
    slong length;
}
ca_vec_struct;

typedef ca_vec_struct ca_vec_t[1];


extern ca_ptr
ca_vec_entry_ptr(ca_vec_t vec, slong i)
;

/* Memory management */

ca_ptr _ca_vec_init(slong len, ca_ctx_t ctx);
void ca_vec_init(ca_vec_t vec, slong len, ca_ctx_t ctx);

void _ca_vec_clear(ca_ptr v, slong len, ca_ctx_t ctx);
void ca_vec_clear(ca_vec_t vec, ca_ctx_t ctx);

void _ca_vec_swap(ca_ptr vec1, ca_ptr vec2, slong len, ca_ctx_t ctx);

extern void
ca_vec_swap(ca_vec_t vec1, ca_vec_t vec2, ca_ctx_t ctx)
;

/* Length */

extern
slong ca_vec_length(const ca_vec_t vec, ca_ctx_t ctx)
;

void _ca_vec_fit_length(ca_vec_t vec, slong len, ca_ctx_t ctx);
void ca_vec_set_length(ca_vec_t res, slong len, ca_ctx_t ctx);

/* Assignment */

void _ca_vec_set(ca_ptr res, ca_srcptr src, slong len, ca_ctx_t ctx);
void ca_vec_set(ca_vec_t res, const ca_vec_t src, ca_ctx_t ctx);

/* Special vectors */

void _ca_vec_zero(ca_ptr res, slong len, ca_ctx_t ctx);
void ca_vec_zero(ca_vec_t res, slong len, ca_ctx_t ctx);

extern
void _ca_vec_unknown(ca_ptr vec, slong len, ca_ctx_t ctx)
;

extern
void _ca_vec_undefined(ca_ptr vec, slong len, ca_ctx_t ctx)
;

/* Input and output */

void ca_vec_print(const ca_vec_t vec, ca_ctx_t ctx);
void ca_vec_printn(const ca_vec_t vec, slong digits, ca_ctx_t ctx);

/* List operations */

extern void
ca_vec_append(ca_vec_t vec, const ca_t f, ca_ctx_t ctx)
;

/* Arithmetic */

void _ca_vec_neg(ca_ptr res, ca_srcptr src, slong len, ca_ctx_t ctx);
void ca_vec_neg(ca_vec_t res, const ca_vec_t src, ca_ctx_t ctx);

void _ca_vec_add(ca_ptr res, ca_srcptr vec1, ca_srcptr vec2, slong len, ca_ctx_t ctx);
void _ca_vec_sub(ca_ptr res, ca_srcptr vec1, ca_srcptr vec2, slong len, ca_ctx_t ctx);
void _ca_vec_scalar_mul_ca(ca_ptr res, ca_srcptr src, slong len, const ca_t c, ca_ctx_t ctx);
void _ca_vec_scalar_div_ca(ca_ptr res, ca_srcptr src, slong len, const ca_t c, ca_ctx_t ctx);
void _ca_vec_scalar_addmul_ca(ca_ptr res, ca_srcptr vec, slong len, const ca_t c, ca_ctx_t ctx);
void _ca_vec_scalar_submul_ca(ca_ptr res, ca_srcptr vec, slong len, const ca_t c, ca_ctx_t ctx);

/* Comparisons and predicates */

truth_t _ca_vec_check_is_zero(ca_srcptr vec, slong len, ca_ctx_t ctx);

/* Internal representation */

extern int
_ca_vec_is_fmpq_vec(ca_srcptr vec, slong len, ca_ctx_t ctx)
;

extern int
_ca_vec_fmpq_vec_is_fmpz_vec(ca_srcptr vec, slong len, ca_ctx_t ctx)
;

extern void
_ca_vec_fmpq_vec_get_fmpz_vec_den(fmpz * c, fmpz_t den, ca_srcptr vec, slong len, ca_ctx_t ctx)
;

extern void
_ca_vec_set_fmpz_vec_div_fmpz(ca_ptr res, const fmpz * v, const fmpz_t den, slong len, ca_ctx_t ctx)
;

#ifdef __cplusplus
;
#endif

#endif
