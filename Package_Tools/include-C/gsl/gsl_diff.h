/* diff/gsl_diff.h
 * 
 * Copyright (C) 2000 David Morrison
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

#ifndef __GSL_DIFF_H__
#define __GSL_DIFF_H__
#include <gsl/gsl_math.h>

#undef 
#undef 
#ifdef __cplusplus
# define  extern "C" {
# define  }
#else
# define  /* empty */
# define  /* empty */
#endif



#ifndef GSL_DISABLE_DEPRECATED
int gsl_diff_central (const gsl_function *f,
                      double x,
                      double *result, double *abserr);

int gsl_diff_backward (const gsl_function *f,
                       double x,
                       double *result, double *abserr);

int gsl_diff_forward (const gsl_function *f,
                      double x,
                      double *result, double *abserr);
#endif



#endif /* __GSL_DIFF_H__ */
