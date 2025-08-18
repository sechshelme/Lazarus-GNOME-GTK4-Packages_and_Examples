/* wavelet/gsl_wavelet.h
 * 
 * Copyright (C) 2004 Ivo Alxneit
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

#ifndef __GSL_WAVELET2D_H__
#define __GSL_WAVELET2D_H__
#include <stdlib.h>
#include <gsl/gsl_errno.h>
#include <gsl/gsl_vector_double.h>
#include <gsl/gsl_matrix_double.h>
#include <gsl/gsl_wavelet.h>

#undef 
#undef 
#ifdef __cplusplus
# define  extern "C" {
# define  }
#else
# define           /* empty */
# define             /* empty */
#endif



int gsl_wavelet2d_transform (const gsl_wavelet * w, 
                             double *data, 
                             size_t tda, size_t size1, size_t size2,
                             gsl_wavelet_direction dir, 
                             gsl_wavelet_workspace * work);

int gsl_wavelet2d_transform_forward (const gsl_wavelet * w, 
                                     double *data,
                                     size_t tda, size_t size1, size_t size2, 
                                     gsl_wavelet_workspace * work);

int gsl_wavelet2d_transform_inverse (const gsl_wavelet * w, 
                                     double *data, 
                                     size_t tda, size_t size1, size_t size2, 
                                     gsl_wavelet_workspace * work);

int gsl_wavelet2d_nstransform (const gsl_wavelet * w, 
                               double *data, 
                               size_t tda, size_t size1, size_t size2, 
                               gsl_wavelet_direction dir,
                               gsl_wavelet_workspace * work);

int gsl_wavelet2d_nstransform_forward (const gsl_wavelet * w, 
                                       double *data, 
                                       size_t tda, size_t size1, size_t size2,
                                       gsl_wavelet_workspace * work);

int gsl_wavelet2d_nstransform_inverse (const gsl_wavelet * w, 
                                       double *data, 
                                       size_t tda, size_t size1, size_t size2, 
                                       gsl_wavelet_workspace * work);

int
gsl_wavelet2d_transform_matrix (const gsl_wavelet * w, 
                                gsl_matrix * a, 
                                gsl_wavelet_direction dir, 
                                gsl_wavelet_workspace * work);

int
gsl_wavelet2d_transform_matrix_forward (const gsl_wavelet * w, 
                                        gsl_matrix * a, 
                                        gsl_wavelet_workspace * work);

int
gsl_wavelet2d_transform_matrix_inverse (const gsl_wavelet * w, 
                                        gsl_matrix * a, 
                                        gsl_wavelet_workspace * work);


int
gsl_wavelet2d_nstransform_matrix (const gsl_wavelet * w, 
                                  gsl_matrix * a, 
                                  gsl_wavelet_direction dir, 
                                  gsl_wavelet_workspace * work);

int
gsl_wavelet2d_nstransform_matrix_forward (const gsl_wavelet * w, 
                                          gsl_matrix * a, 
                                          gsl_wavelet_workspace * work);

int
gsl_wavelet2d_nstransform_matrix_inverse (const gsl_wavelet * w, 
                                          gsl_matrix * a, 
                                          gsl_wavelet_workspace * work);



#endif /* __GSL_WAVELET2D_H__ */
