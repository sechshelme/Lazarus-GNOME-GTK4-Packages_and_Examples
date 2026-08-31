/*
    Copyright (C) 2010 William Hart
    Copyright (C) 2010 Fredrik Johansson
    Copyright (C) 2014 Abhinav Baid

    This file is part of FLINT.

    FLINT is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <https://www.gnu.org/licenses/>.
*/

#ifndef D_MAT_H
#define D_MAT_H



#include "flint.h"

#ifdef __cplusplus
 extern "C" {
#endif

typedef struct
{
    double * entries;
    slong r;
    slong c;
    double ** rows;
} d_mat_struct;

typedef d_mat_struct d_mat_t[1];

//xxxxxxx #define d_mat_entry(mat,i,j) (*((mat)->rows[i] + (j)))

double * d_mat_entry_ptr(const d_mat_t mat, slong i, slong j)
;

extern
double d_mat_get_entry(const d_mat_t mat, slong i, slong j)
;

extern
slong d_mat_nrows(const d_mat_t mat)
;

extern
slong d_mat_ncols(const d_mat_t mat)
;

/* Memory management  ********************************************************/

void d_mat_init(d_mat_t mat, slong rows, slong cols);

void d_mat_swap(d_mat_t mat1, d_mat_t mat2);

extern void
d_mat_swap_entrywise(d_mat_t mat1, d_mat_t mat2)
;

void d_mat_set(d_mat_t mat1, const d_mat_t mat2);

void d_mat_clear(d_mat_t mat);

int d_mat_equal(const d_mat_t mat1, const d_mat_t mat2);

int d_mat_approx_equal(const d_mat_t mat1, const d_mat_t mat2, double eps);

int d_mat_is_zero(const d_mat_t mat);

int d_mat_is_approx_zero(const d_mat_t mat, double eps);

extern
int d_mat_is_empty(const d_mat_t mat)
;

extern
int d_mat_is_square(const d_mat_t mat)
;

void d_mat_zero(d_mat_t mat);

void d_mat_one(d_mat_t mat);


/* Input and output  *********************************************************/

void d_mat_print(const d_mat_t mat);

/* Random matrix generation  *************************************************/

void d_mat_randtest(d_mat_t mat, flint_rand_t state, slong minexp,
                    slong maxexp);

/* Transpose */

void d_mat_transpose(d_mat_t B, const d_mat_t A);

/* Multiplication */

void d_mat_mul_classical(d_mat_t C, const d_mat_t A, const d_mat_t B);

/* Permutations */

extern
void d_mat_swap_rows(d_mat_t mat, slong r, slong s)
;

/* Gram-Schmidt Orthogonalisation and QR Decomposition  ********************************************************/

void d_mat_gso(d_mat_t B, const d_mat_t A);

void d_mat_qr(d_mat_t Q, d_mat_t R, const d_mat_t A);

#ifdef __cplusplus
;
#endif

#endif

