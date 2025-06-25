/***************************************************************************
 * abstract.h is part of Math Graphic Library
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
#ifndef _MGL_ABSTRACT_H_
#define _MGL_ABSTRACT_H_

#include "mgl2/define.h"
//-----------------------------------------------------------------------------
//?????????????????
#define mglDataA void
#define mglNum void
typedef void *HMGL;
typedef void *HMDT;
typedef void *HADT;
typedef void *HMEX;
typedef void *HAEX;
typedef void *HMPR;
typedef const void *HCDT;

/// Set buffer size for number of primitives as (1<<bsize)^2.
/** I.e. as 10^12 for bsize=20 or 4*10^9 for bsize=16 (default). NOTE: you set it only once. The current value is returned. */
unsigned  mgl_bsize(unsigned bsize);
unsigned  mgl_bsize_(unsigned *bsize);

/// Set seed for random numbers
void  mgl_srnd(long seed);
void  mgl_srnd_(int *seed);
/// Get random number
double  mgl_rnd();
double  mgl_rnd_();

/// Set name for data variable (can be used in mgl_formula_calc() or in MGL scripts)
void  mgl_data_set_name(mglDataA *dat, const char *name);
void  mgl_data_set_name_(uintptr_t *dat, const char *name,int);
void  mgl_data_set_name_w(mglDataA *dat, const wchar_t *name);
/// Get name of data variable
 const wchar_t *mgl_data_get_name_w(HCDT dat);
/// Set callback function which is called at deleting variable
void  mgl_data_set_func(mglDataA *dat, void (*func)(void *), void *par);

#define mgl_datac_set_id	mgl_data_set_id
#define mgl_datac_set_id_	mgl_data_set_id_
/// Set names for columns (slices)
void  mgl_data_set_id(mglDataA *d, const char *ids);
void  mgl_datac_set_id_(uintptr_t *d, const char *eq,int );
/// Get names for columns (slices)
 const char *mgl_data_get_id(HCDT d);

/// Save whole data array (for ns=-1) or only ns-th slice to text file
void  mgl_data_save(HCDT dat, const char *fname,long ns);
void  mgl_data_save_(uintptr_t *dat, const char *fname,int *ns,int);
/// Export data array (for ns=-1) or only ns-th slice to PNG file according color scheme
void  mgl_data_export(HCDT dat, const char *fname, const char *scheme, double v1, double v2, long ns);
void  mgl_data_export_(uintptr_t *dat, const char *fname, const char *scheme, mreal *v1, mreal *v2, int *ns,int,int);
/// Save data to HDF file
void  mgl_data_save_hdf(HCDT d,const char *fname,const char *data,int rewrite);
void  mgl_data_save_hdf_(uintptr_t *d, const char *fname, const char *data, int *rewrite,int l,int n);
/// Save value to HDF file
void  mgl_dual_save_hdf(mdual val,const char *fname,const char *data,int rewrite);
void  mgl_real_save_hdf(double val,const char *fname,const char *data,int rewrite);
void  mgl_int_save_hdf(long val,const char *fname,const char *data,int rewrite);
void  mgl_real_save_hdf_(double *val,const char *fname,const char *data,int *rewrite,int,int);
void  mgl_int_save_hdf_(long *val, const char *fname, const char *data, int *rewrite, int, int);
/// Get information about the data (sizes and momentum) to string
 const char *mgl_data_info(HCDT dat);
int  mgl_data_info_(uintptr_t *dat, char *out, int len);
/// Put HDF data names into buf as '\t' separated.
long  mgl_datas_hdf(const char *fname, char *buf, long size);
long  mgl_datas_hdf_(const char *fname, char *buf, int l, int size);
/// Put HDF data names as list of strings (last one is "").
 const char * const * mgl_datas_hdf_str(const char *fname);

/// Get maximal value of the data
mreal  mgl_data_max(HCDT dat);
mreal  mgl_data_max_(uintptr_t *dat);
/// Get maximal value of the data which is less than 0
mreal  mgl_data_neg_max(HCDT dat);
mreal  mgl_data_neg_max_(uintptr_t *dat);
/// Get minimal value of the data
mreal  mgl_data_min(HCDT dat);
mreal  mgl_data_min_(uintptr_t *dat);
/// Get minimal value of the data which is larger than 0
mreal  mgl_data_pos_min(HCDT dat);
mreal  mgl_data_pos_min_(uintptr_t *dat);
/// Find position (after specified in i,j,k) of first nonzero value of formula
mreal  mgl_data_first(HCDT dat, const char *cond, long *i, long *j, long *k);
mreal  mgl_data_first_(uintptr_t *dat, const char *cond, int *i, int *j, int *k, int);
/// Find position (before specified in i,j,k) of last nonzero value of formula
mreal  mgl_data_last(HCDT dat, const char *cond, long *i, long *j, long *k);
mreal  mgl_data_last_(uintptr_t *dat, const char *cond, int *i, int *j, int *k, int);
/// Find position of first in direction 'dir' nonzero value of formula
long  mgl_data_find(HCDT dat, const char *cond, char dir, long i, long j, long k);
int  mgl_data_find_(uintptr_t *dat, const char *cond, char *dir, int *i, int *j, int *k, int,int);
/// Find if any nonzero value of formula
int  mgl_data_find_any(HCDT dat, const char *cond);
int  mgl_data_find_any_(uintptr_t *dat, const char *cond, int);
/// Get maximal value of the data and its position
mreal  mgl_data_max_int(HCDT dat, long *i, long *j, long *k);
mreal  mgl_data_max_int_(uintptr_t *dat, int *i, int *j, int *k);
/// Get maximal value of the data and its approximated position
mreal  mgl_data_max_real(HCDT dat, mreal *x, mreal *y, mreal *z);
mreal  mgl_data_max_real_(uintptr_t *dat, mreal *x, mreal *y, mreal *z);
/// Get minimal value of the data and its position
mreal  mgl_data_min_int(HCDT dat, long *i, long *j, long *k);
mreal  mgl_data_min_int_(uintptr_t *dat, int *i, int *j, int *k);
/// Get minimal value of the data and its approximated position
mreal  mgl_data_min_real(HCDT dat, mreal *x, mreal *y, mreal *z);
mreal  mgl_data_min_real_(uintptr_t *dat, mreal *x, mreal *y, mreal *z);
/// Get "energy and find 4 momenta of data: median, width, skewness, kurtosis
mreal  mgl_data_momentum_val(HCDT d, char dir, mreal *m, mreal *w, mreal *s, mreal *k);
mreal  mgl_data_momentum_val_(uintptr_t *dat, char *dir, mreal *m, mreal *w, mreal *s, mreal *k,int);
/// Get first (last if from<0) maximum along direction dir, and save its orthogonal coordinates in p1, p2
long  mgl_data_max_first(HCDT d, char dir, long from, long *p1, long *p2);
long  mgl_data_max_first_(uintptr_t *d, const char *dir, long *from, long *p1, long *p2,int);

/// Interpolate by linear function the data to given point x=[0...nx-1], y=[0...ny-1], z=[0...nz-1]
mreal  mgl_data_linear(HCDT dat, mreal x,mreal y,mreal z);
mreal  mgl_data_linear_(uintptr_t *dat, mreal *x,mreal *y,mreal *z);
/// Interpolate by linear function the data and return its derivatives at given point x=[0...nx-1], y=[0...ny-1], z=[0...nz-1]
mreal  mgl_data_linear_ext(HCDT dat, mreal x,mreal y,mreal z, mreal *dx,mreal *dy,mreal *dz);
mreal  mgl_data_linear_ext_(uintptr_t *dat, mreal *x,mreal *y,mreal *z, mreal *dx,mreal *dy,mreal *dz);

/// Internal function for (un-)locking mutex in mglStack
void  mgl_mutex_lock(void *);
void  mgl_mutex_unlock(void *);

//-----------------------------------------------------------------------------
/// Create HMEX object for expression evaluating
HMEX  mgl_create_expr(const char *expr);
uintptr_t  mgl_create_expr_(const char *expr, int);
/// Delete HMEX object
void  mgl_delete_expr(HMEX ex);
void  mgl_delete_expr_(uintptr_t *ex);
/// Return value of expression for given x,y,z variables
double  mgl_expr_eval(HMEX ex, double x, double y,double z);
double  mgl_expr_eval_(uintptr_t *ex, mreal *x, mreal *y, mreal *z);
/// Return value of expression for given variables
double  mgl_expr_eval_v(HMEX ex, mreal *vars);
/// Return value of expression differentiation over variable dir for given x,y,z variables
double  mgl_expr_diff(HMEX ex, char dir, double x, double y,double z);
double  mgl_expr_diff_(uintptr_t *ex, const char *dir, mreal *x, mreal *y, mreal *z, int);
/// Return value of expression differentiation over variable dir for given variables
double  mgl_expr_diff_v(HMEX ex, char dir, mreal *vars);
//-----------------------------------------------------------------------------
/// Create HAEX object for expression evaluating
HAEX  mgl_create_cexpr(const char *expr);
uintptr_t  mgl_create_cexpr_(const char *expr, int);
/// Delete HAEX object
void  mgl_delete_cexpr(HAEX ex);
void  mgl_delete_cexpr_(uintptr_t *ex);
/// Return value of expression for given x,y,z variables
cmdual  mgl_cexpr_eval(HAEX ex, mdual x, mdual y, mdual z);
cmdual  mgl_cexpr_eval_(uintptr_t *ex, mdual *x, mdual *y, mdual *z);
/// Return value of expression for given variables
cmdual  mgl_cexpr_eval_v(HAEX ex, mdual *vars);

//-----------------------------------------------------------------------------
/// Callback function for asking user a question. Result shouldn't exceed 1024.
extern  void (*mgl_ask_func)(const wchar_t *quest, wchar_t *res);
/// Console function for asking user a question. Result shouldn't exceed 1024.
void  mgl_ask_gets(const wchar_t *quest, wchar_t *res);
/// Callback function for displaying progress of something.
extern  void (*mgl_progress_func)(int value, int maximal, HMGL gr);
/// Console function for displaying progress of something.
void  mgl_progress_txt(int value, int maximal, HMGL gr);
/// Display progress of something.
void  mgl_progress(int value, int maximal, HMGL gr);
//-----------------------------------------------------------------------------


#endif
