/* sort/gsl_sort_double.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Thomas Walter, Brian Gough
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

#ifndef __GSL_SORT_DOUBLE_H__
#define __GSL_SORT_DOUBLE_H__

#include <stdlib.h>
#include <gsl/gsl_errno.h>
#include <gsl/gsl_permutation.h>

#undef 
#undef 
#ifdef __cplusplus
# define  extern "C" {
# define  }
#else
# define  /* empty */
# define  /* empty */
#endif



void gsl_sort (double * data, const size_t stride, const size_t n);
void gsl_sort2 (double * data1, const size_t stride1, double * data2, const size_t stride2, const size_t n);
void gsl_sort_index (size_t * p, const double * data, const size_t stride, const size_t n);

int gsl_sort_smallest (double * dest, const size_t k, const double * src, const size_t stride, const size_t n);
int gsl_sort_smallest_index (size_t * p, const size_t k, const double * src, const size_t stride, const size_t n);

int gsl_sort_largest (double * dest, const size_t k, const double * src, const size_t stride, const size_t n);
int gsl_sort_largest_index (size_t * p, const size_t k, const double * src, const size_t stride, const size_t n);



#endif /* __GSL_SORT_DOUBLE_H__ */
