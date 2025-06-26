/***************************************************************************
 * data_cf.h is part of Math Graphic Library
 * Copyright (C) 2007-2016 Alexey Balakin <mathgl.abalakin@gmail.ru>       *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU Lesser General Public License  as       *
 *   published by the Free Software Foundation; either version 3 of the    *
 *   License, or (at your option) any later version.                       *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU Lesser General Public     *
 *   License along with this program; if not, write to the                 *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/
#ifndef _MGL_DATAC_CF_H_
#define _MGL_DATAC_CF_H_
//-----------------------------------------------------------------------------
#include "mgl2/abstract.h"
//-----------------------------------------------------------------------------
#if MGL_HAVE_GSL
#include <gsl/gsl_vector.h>
#include <gsl/gsl_matrix.h>
#else
struct gsl_vector;
struct gsl_matrix;
#endif
//-----------------------------------------------------------------------------
typedef void *HADT;
cmdual  mgl_ipowc(mdual x,int n);
cmdual  mgl_atoc(const char *s, int adv);
cmdual  mgl_expi(mdual a);

HADT  mgl_create_datac();
HADT  mgl_create_datac_size(long nx, long ny, long nz);
HADT  mgl_create_datac_file(const char *fname);
void  mgl_delete_datac(HADT dat);

void  mgl_datac_rearrange(HADT dat, long mx,long my,long mz);
void  mgl_datac_link(HADT dat, mdual *A,long mx,long my,long mz);
void  mgl_datac_set_float(HADT dat, const float *A,long mx,long my,long mz);
void  mgl_datac_set_double(HADT dat, const double *A,long mx,long my,long mz);
void  mgl_datac_set_complex(HADT dat, const mdual *A,long mx,long my,long mz);
void  mgl_datac_set(HADT dat, HCDT a);
void  mgl_datac_set_vector(HADT dat, gsl_vector *v);
void  mgl_datac_set_matrix(HADT dat, gsl_matrix *m);
void  mgl_datac_set_value(HADT dat, mdual v, long i, long j, long k);
cmdual  mgl_datac_get_value(HCDT dat, long i, long j, long k);
void  mgl_datac_set_values(HADT dat, const char *val, long nx, long ny, long nz);

HADT  mgl_datac_tridmat(HCDT A, HCDT B, HCDT C, HCDT D, const char *how);
uintptr_t  mgl_datac_tridmat_(uintptr_t *A, uintptr_t *B, uintptr_t *C, uintptr_t *D, const char *how, int);

 mdual *mgl_datac_data(HADT dat);
 mdual *mgl_datac_value(HADT dat, long i,long j,long k);

void  mgl_datac_set_ri(HADT dat, HCDT re, HCDT im);
void  mgl_datac_set_ap(HADT dat, HCDT abs, HCDT phi);

int  mgl_datac_read(HADT dat, const char *fname);
int  mgl_datac_read_mat(HADT dat, const char *fname, long dim);
int  mgl_datac_read_dim(HADT dat, const char *fname,long mx,long my,long mz);
int  mgl_datac_read_range(HADT d, const char *templ, double from, double to, double step, int as_slice);
int  mgl_datac_read_all(HADT dat, const char *templ, int as_slice);
void  mgl_datac_save(HCDT dat, const char *fname,long ns);

int  mgl_datac_read_hdf(HADT d,const char *fname,const char *data);
void  mgl_datac_save_hdf(HCDT d,const char *fname,const char *data,int rewrite);

void  mgl_datac_create(HADT dat, long nx,long ny,long nz);
void  mgl_datac_transpose(HADT dat, const char *dim);

HADT  mgl_datac_subdata(HCDT dat, long xx,long yy,long zz);
HADT  mgl_datac_subdata_ext(HCDT dat, HCDT xx, HCDT yy, HCDT zz);
HADT  mgl_datac_column(HCDT dat, const char *eq);
HADT  mgl_datac_trace(HCDT d);
HADT  mgl_datac_resize(HCDT dat, long mx,long my,long mz);
HADT  mgl_datac_resize_box(HCDT dat, long mx,long my,long mz,mreal x1,mreal x2,mreal y1,mreal y2,mreal z1,mreal z2);
HADT  mgl_datac_momentum(HCDT dat, char dir, const char *how);
HADT  mgl_datac_evaluate(HCDT dat, HCDT idat, HCDT jdat, HCDT kdat, int norm);
HADT  mgl_datac_sum(HCDT dat, const char *dir);
HADT  mgl_datac_combine(HCDT dat1, HCDT dat2);
HADT  mgl_datac_section(HCDT dat, HCDT ids, char dir, mreal val);
HADT  mgl_datac_section_val(HCDT dat, long id, char dir, mreal val);
HADT  mgl_formula_calc_c(const char *str, long n, ...);

void  mgl_datac_fill(HADT dat, mdual x1,mdual x2,char dir);
void  mgl_datac_fill_eq(HMGL gr, HADT dat, const char *eq, HCDT vdat, HCDT wdat,const char *opt);
void  mgl_datac_refill_gs(HADT dat, HCDT xdat, HCDT vdat, mreal x1, mreal x2, long sl);
void  mgl_datac_refill_x(HADT dat, HCDT xdat, HCDT vdat, mreal x1, mreal x2, long sl);
void  mgl_datac_refill_xy(HADT dat, HCDT xdat, HCDT ydat, HCDT vdat, mreal x1, mreal x2, mreal y1, mreal y2, long sl);
void  mgl_datac_refill_xyz(HADT dat, HCDT xdat, HCDT ydat, HCDT zdat, HCDT vdat, mreal x1, mreal x2, mreal y1, mreal y2, mreal z1, mreal z2);
void  mgl_datac_refill_gr(HMGL gr, HADT dat, HCDT xdat, HCDT ydat, HCDT zdat, HCDT vdat, long sl, const char *opt);

void  mgl_datac_modify(HADT dat, const char *eq,long dim);
void  mgl_datac_modify_vw(HADT dat, const char *eq,HCDT vdat,HCDT wdat);

void  mgl_datac_limit(HADT dat, mreal v);

void  mgl_datac_keep(HADT dat, const char *how, long i, long j);

void  mgl_datac_put_val(HADT dat, mdual val, long i, long j, long k);
void  mgl_datac_put_dat(HADT dat, HCDT val, long i, long j, long k);

void  mgl_datac_squeeze(HADT dat, long rx,long ry,long rz,long smooth);
void  mgl_datac_extend(HADT dat, long n1, long n2);
void  mgl_datac_insert(HADT dat, char dir, long at, long num);
void  mgl_datac_delete(HADT dat, char dir, long at, long num);
void  mgl_datac_join(HADT dat, HCDT d);

void  mgl_datac_smooth(HADT d, const char *dirs, mreal delta);
void  mgl_datac_cumsum(HADT dat, const char *dir);
void  mgl_datac_integral(HADT dat, const char *dir);
void  mgl_datac_diff(HADT dat, const char *dir);
void  mgl_datac_diff_par(HADT dat, HCDT v1, HCDT v2, HCDT v3);
void  mgl_datac_diff2(HADT dat, const char *dir);
void  mgl_datac_swap(HADT dat, const char *dir);
void  mgl_datac_roll(HADT dat, char dir, long num);
void  mgl_datac_mirror(HADT dat, const char *dir);
void  mgl_datac_crop(HADT dat, long n1, long n2, char dir);
void  mgl_datac_crop_opt(HADT dat, const char *how);

void  mgl_datac_mul_dat(HADT dat, HCDT d);
void  mgl_datac_div_dat(HADT dat, HCDT d);
void  mgl_datac_add_dat(HADT dat, HCDT d);
void  mgl_datac_sub_dat(HADT dat, HCDT d);
void  mgl_datac_mul_num(HADT dat, mdual d);
void  mgl_datac_div_num(HADT dat, mdual d);
void  mgl_datac_add_num(HADT dat, mdual d);
void  mgl_datac_sub_num(HADT dat, mdual d);

void  mgl_datac_hankel(HADT dat, const char *dir);
void  mgl_datac_sinfft(HADT dat, const char *dir);
void  mgl_datac_cosfft(HADT dat, const char *dir);
void  mgl_datac_fft(HADT dat, const char *dir);
HADT  mgl_datac_correl(HCDT dat1, HCDT dat2, const char *dir);
void  mgl_datac_diffr(HADT dat, const char *how, mreal q);
void  mgl_datac_wavelet(HADT dat, const char *how, int k);
void  mgl_datac_envelop(HADT dat, char dir);

HMDT  mgl_datac_real(HCDT dat);
HMDT  mgl_datac_imag(HCDT dat);
HMDT  mgl_datac_abs(HCDT dat);
HMDT  mgl_datac_arg(HCDT dat);
HMDT  mgl_datac_norm(HCDT dat);

cmdual  mgl_datac_linear(HCDT d, mreal x,mreal y,mreal z);
cmdual  mgl_datac_linear_ext(HCDT d, mreal x,mreal y,mreal z, mdual *dx,mdual *dy,mdual *dz);
cmdual  mgl_datac_spline(HCDT dat, mreal x,mreal y,mreal z);
cmdual  mgl_datac_spline_ext(HCDT dat, mreal x,mreal y,mreal z, mdual *dx,mdual *dy,mdual *dz);
HADT  mgl_gsplinec_init(HCDT x, HCDT v);
cmdual  mgl_gsplinec(HCDT coef, mreal dx, mdual *d1, mdual *d2);

HADT  mgl_find_roots_txt_c(const char *func, const char *vars, HCDT ini);

