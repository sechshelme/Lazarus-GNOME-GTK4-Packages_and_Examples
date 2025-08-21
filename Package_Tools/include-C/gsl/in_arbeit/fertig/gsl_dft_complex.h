/* fft/gsl_dft_complex.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Brian Gough
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

#ifndef __GSL_DFT_COMPLEX_H__
#define __GSL_DFT_COMPLEX_H__

#include <stddef.h>

#include <gsl/gsl_math.h>
#include <gsl/gsl_complex.h>
#include <gsl/gsl_fft.h>




int gsl_dft_complex_forward (const double data[], const size_t stride, const size_t n,
                             double result[]);

int gsl_dft_complex_backward (const double data[], const size_t stride, const size_t n,
                              double result[]);

int gsl_dft_complex_inverse (const double data[], const size_t stride, const size_t n,
                             double result[]);

int gsl_dft_complex_transform (const double data[], const size_t stride, const size_t n,
                     double result[], const gsl_fft_direction sign);



#endif /* __GSL_DFT_COMPLEX_H__ */
