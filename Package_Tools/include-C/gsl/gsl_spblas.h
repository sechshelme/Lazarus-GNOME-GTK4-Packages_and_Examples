/* gsl_spblas.h
 * 
 * Copyright (C) 2012-2014 Patrick Alken
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

#ifndef __GSL_SPBLAS_H__
#define __GSL_SPBLAS_H__

#include <stdlib.h>

#include <gsl/gsl_math.h>
#include <gsl/gsl_vector.h>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_spmatrix.h>
#include <gsl/gsl_blas.h>

#undef 
#undef 
#ifdef __cplusplus
# define  extern "C" {
# define  }
#else
# define  /* empty */
# define  /* empty */
#endif



/*
 * Prototypes
 */

int gsl_spblas_dgemv(const CBLAS_TRANSPOSE_t TransA, const double alpha,
                     const gsl_spmatrix *A, const gsl_vector *x,
                     const double beta, gsl_vector *y);
int gsl_spblas_dgemm(const double alpha, const gsl_spmatrix *A,
                     const gsl_spmatrix *B, gsl_spmatrix *C);
size_t gsl_spblas_scatter(const gsl_spmatrix *A, const size_t j,
                          const double alpha, int *w, double *x,
                          const int mark, gsl_spmatrix *C, size_t nz);



#endif /* __GSL_SPBLAS_H__ */
