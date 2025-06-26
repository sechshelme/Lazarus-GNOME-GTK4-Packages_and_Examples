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
#ifndef _MGL_DATA_CF_H_
#define _MGL_DATA_CF_H_
//-----------------------------------------------------------------------------
#include "mgl2/abstract.h"
//-----------------------------------------------------------------------------
#if MGL_HAVE_GSL
#include <gsl/gsl_vector.h>
#include <gsl/gsl_matrix.h>
#else
typedef void gsl_vector;
typedef void gsl_matrix;
#endif
//-----------------------------------------------------------------------------
#ifdef __cplusplus
extern "C" {
#endif
double  mgl_ipow(double x,int n);
double  mgl_get_time(const char *time, const char *fmt);

HMDT  mgl_create_data();
HMDT  mgl_create_data_size(long nx, long ny, long nz);
HMDT  mgl_create_data_file(const char *fname);
void  mgl_delete_data(HMDT dat);

void  mgl_data_rearrange(HMDT dat, long mx,long my,long mz);
void  mgl_data_link(HMDT dat, mreal *A,long mx,long my,long mz);
void  mgl_data_set_float(HMDT dat, const float *A,long mx,long my,long mz);
void  mgl_data_set_double(HMDT dat, const double *A,long mx,long my,long mz);
void  mgl_data_set_float2(HMDT d, float const * const *A,long N1,long N2);
void  mgl_data_set_double2(HMDT d, double const * const *A,long N1,long N2);
void  mgl_data_set_float3(HMDT d, float const * const * const *A,long N1,long N2,long N3);
void  mgl_data_set_double3(HMDT d, double const * const * const *A,long N1,long N2,long N3);
void  mgl_data_set(HMDT dat, HCDT a);
void  mgl_data_set_vector(HMDT dat, gsl_vector *v);
void  mgl_data_set_matrix(HMDT dat, gsl_matrix *m);
void  mgl_data_set_value(HMDT dat, mreal v, long i, long j, long k);
mreal  mgl_data_get_value(HCDT dat, long i, long j, long k);
void  mgl_data_set_values(HMDT dat, const char *val, long nx, long ny, long nz);

int  mgl_data_read_hdf(HMDT d,const char *fname,const char *data);
int  mgl_data_read(HMDT dat, const char *fname);
int  mgl_data_read_mat(HMDT dat, const char *fname, long dim);
int  mgl_data_read_dim(HMDT dat, const char *fname,long mx,long my,long mz);
int  mgl_data_read_range(HMDT d, const char *templ, double n1, double n2, double step, int as_slice);
int  mgl_data_read_all(HMDT dat, const char *templ, int as_slice);
int  mgl_data_read_bin(HMDT dat, const char *fname, int type);
void  mgl_data_import(HMDT dat, const char *fname, const char *scheme,mreal v1,mreal v2);
int  mgl_data_scan_file(HMDT dat,const char *fname, const char *templ);
int  mgl_data_read_wfm(HMDT d,const char *fname, long num, long step, long start);
int  mgl_data_read_matlab(HMDT d,const char *fname,const char *data);

void  mgl_data_create(HMDT dat, long nx,long ny,long nz);
void  mgl_data_transpose(HMDT dat, const char *dim);
void  mgl_data_norm(HMDT dat, mreal v1,mreal v2,int sym,long dim);
void  mgl_data_norm_slice(HMDT dat, mreal v1,mreal v2,char dir,long keep_en,long sym);
void  mgl_data_limit(HMDT dat, mreal v);
void  mgl_data_coil(HMDT dat, mreal v1, mreal v2, int sep);
void  mgl_data_keep(HMDT dat, const char *how, long i, long j);

HMDT  mgl_data_subdata(HCDT dat, long xx,long yy,long zz);
HMDT  mgl_data_subdata_ext(HCDT dat, HCDT xx, HCDT yy, HCDT zz);
HMDT  mgl_data_column(HCDT dat, const char *eq);
HMDT  mgl_data_section(HCDT dat, HCDT ids, char dir, mreal val);
HMDT  mgl_data_section_val(HCDT dat, long id, char dir, mreal val);
HMDT  mgl_data_conts(mreal val, HCDT dat);
HMDT  mgl_formula_calc(const char *str, long n, ...);

/// Equidistantly fill the data to range [x1,x2] in direction dir
void  mgl_data_fill(HMDT dat, mreal x1,mreal x2,char dir);
void  mgl_data_fill_eq(HMGL gr, HMDT dat, const char *eq, HCDT vdat, HCDT wdat,const char *opt);
void  mgl_data_refill_gs(HMDT dat, HCDT xdat, HCDT vdat, mreal x1, mreal x2, long sl);
void  mgl_data_refill_x(HMDT dat, HCDT xdat, HCDT vdat, mreal x1, mreal x2, long sl);
void  mgl_data_refill_xy(HMDT dat, HCDT xdat, HCDT ydat, HCDT vdat, mreal x1, mreal x2, mreal y1, mreal y2, long sl);
void  mgl_data_refill_xyz(HMDT dat, HCDT xdat, HCDT ydat, HCDT zdat, HCDT vdat, mreal x1, mreal x2, mreal y1, mreal y2, mreal z1, mreal z2);
void  mgl_data_refill_gr(HMGL gr, HMDT dat, HCDT xdat, HCDT ydat, HCDT zdat, HCDT vdat, long sl, const char *opt);
void  mgl_data_grid(HMGL gr, HMDT d, HCDT xdat, HCDT ydat, HCDT zdat,const char *opt);
void  mgl_data_grid_xy(HMDT d, HCDT xdat, HCDT ydat, HCDT zdat, mreal x1, mreal x2, mreal y1, mreal y2);
void  mgl_data_put_val(HMDT dat, mreal val, long i, long j, long k);
void  mgl_data_put_dat(HMDT dat, HCDT val, long i, long j, long k);
void  mgl_data_modify(HMDT dat, const char *eq,long dim);
void  mgl_data_modify_vw(HMDT dat, const char *eq,HCDT vdat,HCDT wdat);
void  mgl_data_squeeze(HMDT dat, long rx,long ry,long rz,long smooth);

HMDT  mgl_data_ifs_2d(HCDT A, long n, long skip);
HMDT  mgl_data_ifs_3d(HCDT A, long n, long skip);
HMDT  mgl_data_ifs_file(const char *fname, const char *name, long n, long skip);
typedef enum {
	mglFlame2d_linear=0,	mglFlame2d_sinusoidal,	mglFlame2d_spherical,	mglFlame2d_swirl,		mglFlame2d_horseshoe,
	mglFlame2d_polar,		mglFlame2d_handkerchief,mglFlame2d_heart,		mglFlame2d_disc,		mglFlame2d_spiral,
	mglFlame2d_hyperbolic,	mglFlame2d_diamond,		mglFlame2d_ex,			mglFlame2d_julia,		mglFlame2d_bent,
	mglFlame2d_waves,		mglFlame2d_fisheye,		mglFlame2d_popcorn,		mglFlame2d_exponential,	mglFlame2d_power,
	mglFlame2d_cosine,		mglFlame2d_rings,		mglFlame2d_fan,			mglFlame2d_blob,		mglFlame2d_pdj,
	mglFlame2d_fan2,		mglFlame2d_rings2,		mglFlame2d_eyefish,		mglFlame2d_bubble,		mglFlame2d_cylinder,
	mglFlame2d_perspective,	mglFlame2d_noise,		mglFlame2d_juliaN,		mglFlame2d_juliaScope,	mglFlame2d_blur,
	mglFlame2d_gaussian,	mglFlame2d_radialBlur,	mglFlame2d_pie,			mglFlame2d_ngon,		mglFlame2d_curl,
	mglFlame2d_rectangles,	mglFlame2d_arch,		mglFlame2d_tangent,		mglFlame2d_square,		mglFlame2d_blade,
	mglFlame2d_secant,		mglFlame2d_rays,		mglFlame2d_twintrian,	mglFlame2d_cross,		mglFlame2d_disc2,
	mglFlame2d_supershape,	mglFlame2d_flower,		mglFlame2d_conic,		mglFlame2d_parabola,	mglFlame2d_bent2,
	mglFlame2d_bipolar,		mglFlame2d_boarders,	mglFlame2d_butterfly,	mglFlame2d_cell,		mglFlame2d_cpow,
	mglFlame2d_curve,		mglFlame2d_edisc,		mglFlame2d_elliptic,	mglFlame2d_escher,		mglFlame2d_foci,
	mglFlame2d_lazySusan,	mglFlame2d_loonie,		mglFlame2d_preBlur,		mglFlame2d_modulus,		mglFlame2d_oscope,
	mglFlame2d_polar2,		mglFlame2d_popcorn2,	mglFlame2d_scry,		mglFlame2d_separation,	mglFlame2d_split,
	mglFlame2d_splits,		mglFlame2d_stripes,		mglFlame2d_wedge,		mglFlame2d_wedgeJulia,	mglFlame2d_wedgeSph,
	mglFlame2d_whorl,		mglFlame2d_waves2,		mglFlame2d_exp,			mglFlame2d_log,			mglFlame2d_sin,
	mglFlame2d_cos,			mglFlame2d_tan,			mglFlame2d_sec,			mglFlame2d_csc,			mglFlame2d_cot,
	mglFlame2d_sinh,		mglFlame2d_cosh,		mglFlame2d_tanh,		mglFlame2d_sech,		mglFlame2d_csch,
	mglFlame2d_coth,		mglFlame2d_auger,		mglFlame2d_flux,		mglFlame2dLAST
}xxxxxxxxx;
HMDT  mgl_data_flame_2d(HCDT A, HCDT F, long n, long skip);

HMDT  mgl_data_detect(HCDT d, mreal lvl, mreal dj, mreal di, mreal min_len);

HMDT  mgl_data_tridmat(HCDT A, HCDT B, HCDT C, HCDT D, const char *how);

 mreal *mgl_data_value(HMDT dat, long i,long j,long k);
 mreal *mgl_data_data(HMDT dat);

long  mgl_data_get_nx(HCDT d);
long  mgl_data_get_ny(HCDT d);
long  mgl_data_get_nz(HCDT d);

HMDT  mgl_data_combine(HCDT dat1, HCDT dat2);
void  mgl_data_extend(HMDT dat, long n1, long n2);
void  mgl_data_insert(HMDT dat, char dir, long at, long num);
void  mgl_data_delete(HMDT dat, char dir, long at, long num);
void  mgl_data_join(HMDT dat, HCDT d);

void  mgl_data_smooth(HMDT d, const char *dirs, mreal delta);
HMDT  mgl_data_sum(HCDT dat, const char *dir);
HMDT  mgl_data_first_dir(HCDT dat, const char *dir, double val);
HMDT  mgl_data_last_dir(HCDT dat, const char *dir, double val);
HMDT  mgl_data_max_dir(HCDT dat, const char *dir);
HMDT  mgl_data_min_dir(HCDT dat, const char *dir);
HMDT  mgl_data_minmax(HCDT dat);
HMDT  mgl_data_connect(HCDT a, HCDT b);
void  mgl_data_connect_r(HMDT a, HMDT b);

void  mgl_data_cumsum(HMDT dat, const char *dir);
void  mgl_data_integral(HMDT dat, const char *dir);
void  mgl_data_diff(HMDT dat, const char *dir);
void  mgl_data_diff_par(HMDT dat, HCDT v1, HCDT v2, HCDT v3);
void  mgl_data_diff2(HMDT dat, const char *dir);
void  mgl_data_swap(HMDT dat, const char *dir);
void  mgl_data_roll(HMDT dat, char dir, long num);
void  mgl_data_mirror(HMDT dat, const char *dir);
void  mgl_data_sort(HMDT dat, long idx, long idy);
void  mgl_data_dilate(HMDT dat, mreal val, long step);
void  mgl_data_erode(HMDT dat, mreal val, long step);

void  mgl_data_hankel(HMDT dat, const char *dir);
void  mgl_data_sinfft(HMDT dat, const char *dir);
void  mgl_data_cosfft(HMDT dat, const char *dir);
void  mgl_data_fill_sample(HMDT dat, const char *how);
HMDT  mgl_data_correl(HCDT dat1, HCDT dat2, const char *dir);
void  mgl_data_wavelet(HMDT dat, const char *how, int k);

 void *mgl_fft_alloc(long n, void **space, long nthr);
 void *mgl_fft_alloc_thr(long n);
void  mgl_fft_free(void *wt, void **ws, long nthr);
void  mgl_fft_free_thr(void *wt);
void  mgl_fft(double *x, long s, long n, const void *wt, void *ws, int inv);
void  mgl_clear_fft();

mreal  mgl_data_spline(HCDT dat, mreal x,mreal y,mreal z);
mreal  mgl_data_spline_ext(HCDT dat, mreal x,mreal y,mreal z, mreal *dx,mreal *dy,mreal *dz);
HMDT  mgl_gspline_init(HCDT x, HCDT v);
mreal  mgl_gspline(HCDT coef, mreal dx, mreal *d1, mreal *d2);
mreal  mgl_data_solve_1d(HCDT dat, mreal val, int spl, long i0);
HMDT  mgl_data_solve(HCDT dat, mreal val, char dir, HCDT i0, int norm);

HMDT  mgl_data_trace(HCDT d);
HMDT  mgl_data_resize(HCDT dat, long mx,long my,long mz);
HMDT  mgl_data_resize_box(HCDT dat, long mx,long my,long mz,mreal x1,mreal x2,mreal y1,mreal y2,mreal z1,mreal z2);
HMDT  mgl_data_hist(HCDT dat, long n, mreal v1, mreal v2, long nsub);
HMDT  mgl_data_hist_w(HCDT dat, HCDT weight, long n, mreal v1, mreal v2, long nsub);
HMDT  mgl_data_momentum(HCDT dat, char dir, const char *how);
HMDT  mgl_data_pulse(HCDT dat, char dir);
HMDT  mgl_data_evaluate(HCDT dat, HCDT idat, HCDT jdat, HCDT kdat, int norm);
void  mgl_data_envelop(HMDT dat, char dir);
void  mgl_data_sew(HMDT dat, const char *dirs, mreal da);
void  mgl_data_crop(HMDT dat, long n1, long n2, char dir);
void  mgl_data_crop_opt(HMDT dat, const char *how);
void  mgl_data_clean(HMDT dat, long id);

void  mgl_data_mul_dat(HMDT dat, HCDT d);
void  mgl_data_div_dat(HMDT dat, HCDT d);
void  mgl_data_add_dat(HMDT dat, HCDT d);
void  mgl_data_sub_dat(HMDT dat, HCDT d);
void  mgl_data_mul_num(HMDT dat, mreal d);
void  mgl_data_div_num(HMDT dat, mreal d);
void  mgl_data_add_num(HMDT dat, mreal d);
void  mgl_data_sub_num(HMDT dat, mreal d);

HMDT  mgl_transform_a(HCDT am, HCDT ph, const char *tr);
HMDT  mgl_transform(HCDT re, HCDT im, const char *tr);
void  mgl_data_fourier(HMDT re, HMDT im, const char *dir);
HMDT  mgl_data_stfa(HCDT re, HCDT im, long dn, char dir);

HMDT  mgl_triangulation_3d(HCDT x, HCDT y, HCDT z);
HMDT  mgl_triangulation_2d(HCDT x, HCDT y);

mreal  mgl_find_root(mreal (*func)(mreal val, void *par), mreal ini, void *par);
mreal  mgl_find_root_txt(const char *func, mreal ini, char var_id);
HMDT  mgl_data_roots(const char *func, HCDT ini, char var_id);
HMDT  mgl_find_roots_txt(const char *func, const char *vars, HCDT ini);
int  mgl_find_roots(size_t n, void (*func)(const mreal *x, mreal *f, void *par), mreal *x0, void *par);

mreal  mgl_rnd_integer(long lo, long hi);
mreal  mgl_rnd_uniform(mreal lo, mreal hi);
mreal  mgl_rnd_bernoulli(mreal p);
long  mgl_rnd_binomial(long trials, mreal p);
mreal  mgl_rnd_gaussian(mreal mu, mreal sigma);
mreal  mgl_rnd_exponential(mreal lambda);
long  mgl_rnd_discrete(HCDT A);

void  mgl_data_rnd_integer(HMDT d, long lo, long hi);
void  mgl_data_rnd_uniform(HMDT d, mreal lo, mreal hi);
void  mgl_data_rnd_bernoulli(HMDT d, mreal p);
void  mgl_data_rnd_binomial(HMDT d, long trials, mreal p);
void  mgl_data_rnd_gaussian(HMDT d, mreal mu, mreal sigma);
void  mgl_data_rnd_exponential(HMDT d, mreal lambda);
void  mgl_data_rnd_discrete(HMDT d, HCDT A);
void  mgl_shuffle(HMDT d, char dir);
void  mgl_data_brownian(HMDT d, mreal y1, mreal y2, mreal sigma, mreal alpha);
void  mgl_data_brownian_(uintptr_t *d, double *y1, double *y2, double *sigma, double *alpha);



