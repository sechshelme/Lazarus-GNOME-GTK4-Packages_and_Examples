
unit data_cf;
interface

{
  Automatically converted by H2Pas 1.0.0 from data_cf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    data_cf.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pdouble  = ^double;
Pgsl_matrix  = ^gsl_matrix;
Pgsl_vector  = ^gsl_vector;
Pmreal  = ^mreal;
Psingle  = ^single;
Puintptr_t  = ^uintptr_t;
Pxxxxxxxxx  = ^xxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{**************************************************************************
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
 ************************************************************************** }
{$ifndef _MGL_DATA_CF_H_}
{$define _MGL_DATA_CF_H_}
{----------------------------------------------------------------------------- }
{$include "mgl2/abstract.h"}
{----------------------------------------------------------------------------- }
{$if MGL_HAVE_GSL}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
{$else}
type
  Pgsl_vector = ^Tgsl_vector;
  Tgsl_vector = pointer;

  Pgsl_matrix = ^Tgsl_matrix;
  Tgsl_matrix = pointer;
{$endif}
{----------------------------------------------------------------------------- }
{ C++ extern C conditionnal removed }

function mgl_ipow(x:Tdouble; n:longint):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_get_time(time:Pchar; fmt:Pchar):Tdouble;cdecl;external;
function mgl_create_data:THMDT;cdecl;external;
function mgl_create_data_size(nx:longint; ny:longint; nz:longint):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_create_data_file(fname:Pchar):THMDT;cdecl;external;
procedure mgl_delete_data(dat:THMDT);cdecl;external;
procedure mgl_data_rearrange(dat:THMDT; mx:longint; my:longint; mz:longint);cdecl;external;
procedure mgl_data_link(dat:THMDT; A:Pmreal; mx:longint; my:longint; mz:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_set_float(dat:THMDT; A:Psingle; mx:longint; my:longint; mz:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_set_double(dat:THMDT; A:Pdouble; mx:longint; my:longint; mz:longint);cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
procedure mgl_data_set_float2(d:THMDT; A:PPsingle; N1:longint; N2:longint);cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
procedure mgl_data_set_double2(d:THMDT; A:PPdouble; N1:longint; N2:longint);cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
(* Const before declarator ignored *)
procedure mgl_data_set_float3(d:THMDT; A:PPPsingle; N1:longint; N2:longint; N3:longint);cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
(* Const before declarator ignored *)
procedure mgl_data_set_double3(d:THMDT; A:PPPdouble; N1:longint; N2:longint; N3:longint);cdecl;external;
procedure mgl_data_set(dat:THMDT; a:THCDT);cdecl;external;
procedure mgl_data_set_vector(dat:THMDT; v:Pgsl_vector);cdecl;external;
procedure mgl_data_set_matrix(dat:THMDT; m:Pgsl_matrix);cdecl;external;
procedure mgl_data_set_value(dat:THMDT; v:Tmreal; i:longint; j:longint; k:longint);cdecl;external;
function mgl_data_get_value(dat:THCDT; i:longint; j:longint; k:longint):Tmreal;cdecl;external;
(* Const before type ignored *)
procedure mgl_data_set_values(dat:THMDT; val:Pchar; nx:longint; ny:longint; nz:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_data_read_hdf(d:THMDT; fname:Pchar; data:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mgl_data_read(dat:THMDT; fname:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mgl_data_read_mat(dat:THMDT; fname:Pchar; dim:longint):longint;cdecl;external;
(* Const before type ignored *)
function mgl_data_read_dim(dat:THMDT; fname:Pchar; mx:longint; my:longint; mz:longint):longint;cdecl;external;
(* Const before type ignored *)
function mgl_data_read_range(d:THMDT; templ:Pchar; n1:Tdouble; n2:Tdouble; step:Tdouble; 
           as_slice:longint):longint;cdecl;external;
(* Const before type ignored *)
function mgl_data_read_all(dat:THMDT; templ:Pchar; as_slice:longint):longint;cdecl;external;
(* Const before type ignored *)
function mgl_data_read_bin(dat:THMDT; fname:Pchar; _type:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_data_import(dat:THMDT; fname:Pchar; scheme:Pchar; v1:Tmreal; v2:Tmreal);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_data_scan_file(dat:THMDT; fname:Pchar; templ:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mgl_data_read_wfm(d:THMDT; fname:Pchar; num:longint; step:longint; start:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_data_read_matlab(d:THMDT; fname:Pchar; data:Pchar):longint;cdecl;external;
procedure mgl_data_create(dat:THMDT; nx:longint; ny:longint; nz:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_transpose(dat:THMDT; dim:Pchar);cdecl;external;
procedure mgl_data_norm(dat:THMDT; v1:Tmreal; v2:Tmreal; sym:longint; dim:longint);cdecl;external;
procedure mgl_data_norm_slice(dat:THMDT; v1:Tmreal; v2:Tmreal; dir:char; keep_en:longint; 
            sym:longint);cdecl;external;
procedure mgl_data_limit(dat:THMDT; v:Tmreal);cdecl;external;
procedure mgl_data_coil(dat:THMDT; v1:Tmreal; v2:Tmreal; sep:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_keep(dat:THMDT; how:Pchar; i:longint; j:longint);cdecl;external;
function mgl_data_subdata(dat:THCDT; xx:longint; yy:longint; zz:longint):THMDT;cdecl;external;
function mgl_data_subdata_ext(dat:THCDT; xx:THCDT; yy:THCDT; zz:THCDT):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_data_column(dat:THCDT; eq:Pchar):THMDT;cdecl;external;
function mgl_data_section(dat:THCDT; ids:THCDT; dir:char; val:Tmreal):THMDT;cdecl;external;
function mgl_data_section_val(dat:THCDT; id:longint; dir:char; val:Tmreal):THMDT;cdecl;external;
function mgl_data_conts(val:Tmreal; dat:THCDT):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_formula_calc(str:Pchar; n:longint; args:array of const):THMDT;cdecl;external;
function mgl_formula_calc(str:Pchar; n:longint):THMDT;cdecl;external;
{/ Equidistantly fill the data to range [x1,x2] in direction dir }
procedure mgl_data_fill(dat:THMDT; x1:Tmreal; x2:Tmreal; dir:char);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_data_fill_eq(gr:THMGL; dat:THMDT; eq:Pchar; vdat:THCDT; wdat:THCDT; 
            opt:Pchar);cdecl;external;
procedure mgl_data_refill_gs(dat:THMDT; xdat:THCDT; vdat:THCDT; x1:Tmreal; x2:Tmreal; 
            sl:longint);cdecl;external;
procedure mgl_data_refill_x(dat:THMDT; xdat:THCDT; vdat:THCDT; x1:Tmreal; x2:Tmreal; 
            sl:longint);cdecl;external;
procedure mgl_data_refill_xy(dat:THMDT; xdat:THCDT; ydat:THCDT; vdat:THCDT; x1:Tmreal; 
            x2:Tmreal; y1:Tmreal; y2:Tmreal; sl:longint);cdecl;external;
procedure mgl_data_refill_xyz(dat:THMDT; xdat:THCDT; ydat:THCDT; zdat:THCDT; vdat:THCDT; 
            x1:Tmreal; x2:Tmreal; y1:Tmreal; y2:Tmreal; z1:Tmreal; 
            z2:Tmreal);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_refill_gr(gr:THMGL; dat:THMDT; xdat:THCDT; ydat:THCDT; zdat:THCDT; 
            vdat:THCDT; sl:longint; opt:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_grid(gr:THMGL; d:THMDT; xdat:THCDT; ydat:THCDT; zdat:THCDT; 
            opt:Pchar);cdecl;external;
procedure mgl_data_grid_xy(d:THMDT; xdat:THCDT; ydat:THCDT; zdat:THCDT; x1:Tmreal; 
            x2:Tmreal; y1:Tmreal; y2:Tmreal);cdecl;external;
procedure mgl_data_put_val(dat:THMDT; val:Tmreal; i:longint; j:longint; k:longint);cdecl;external;
procedure mgl_data_put_dat(dat:THMDT; val:THCDT; i:longint; j:longint; k:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_modify(dat:THMDT; eq:Pchar; dim:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_modify_vw(dat:THMDT; eq:Pchar; vdat:THCDT; wdat:THCDT);cdecl;external;
procedure mgl_data_squeeze(dat:THMDT; rx:longint; ry:longint; rz:longint; smooth:longint);cdecl;external;
function mgl_data_ifs_2d(A:THCDT; n:longint; skip:longint):THMDT;cdecl;external;
function mgl_data_ifs_3d(A:THCDT; n:longint; skip:longint):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_data_ifs_file(fname:Pchar; name:Pchar; n:longint; skip:longint):THMDT;cdecl;external;
type
  Pxxxxxxxxx = ^Txxxxxxxxx;
  Txxxxxxxxx =  Longint;
  Const
    mglFlame2d_linear = 0;
    mglFlame2d_sinusoidal = 1;
    mglFlame2d_spherical = 2;
    mglFlame2d_swirl = 3;
    mglFlame2d_horseshoe = 4;
    mglFlame2d_polar = 5;
    mglFlame2d_handkerchief = 6;
    mglFlame2d_heart = 7;
    mglFlame2d_disc = 8;
    mglFlame2d_spiral = 9;
    mglFlame2d_hyperbolic = 10;
    mglFlame2d_diamond = 11;
    mglFlame2d_ex = 12;
    mglFlame2d_julia = 13;
    mglFlame2d_bent = 14;
    mglFlame2d_waves = 15;
    mglFlame2d_fisheye = 16;
    mglFlame2d_popcorn = 17;
    mglFlame2d_exponential = 18;
    mglFlame2d_power = 19;
    mglFlame2d_cosine = 20;
    mglFlame2d_rings = 21;
    mglFlame2d_fan = 22;
    mglFlame2d_blob = 23;
    mglFlame2d_pdj = 24;
    mglFlame2d_fan2 = 25;
    mglFlame2d_rings2 = 26;
    mglFlame2d_eyefish = 27;
    mglFlame2d_bubble = 28;
    mglFlame2d_cylinder = 29;
    mglFlame2d_perspective = 30;
    mglFlame2d_noise = 31;
    mglFlame2d_juliaN = 32;
    mglFlame2d_juliaScope = 33;
    mglFlame2d_blur = 34;
    mglFlame2d_gaussian = 35;
    mglFlame2d_radialBlur = 36;
    mglFlame2d_pie = 37;
    mglFlame2d_ngon = 38;
    mglFlame2d_curl = 39;
    mglFlame2d_rectangles = 40;
    mglFlame2d_arch = 41;
    mglFlame2d_tangent = 42;
    mglFlame2d_square = 43;
    mglFlame2d_blade = 44;
    mglFlame2d_secant = 45;
    mglFlame2d_rays = 46;
    mglFlame2d_twintrian = 47;
    mglFlame2d_cross = 48;
    mglFlame2d_disc2 = 49;
    mglFlame2d_supershape = 50;
    mglFlame2d_flower = 51;
    mglFlame2d_conic = 52;
    mglFlame2d_parabola = 53;
    mglFlame2d_bent2 = 54;
    mglFlame2d_bipolar = 55;
    mglFlame2d_boarders = 56;
    mglFlame2d_butterfly = 57;
    mglFlame2d_cell = 58;
    mglFlame2d_cpow = 59;
    mglFlame2d_curve = 60;
    mglFlame2d_edisc = 61;
    mglFlame2d_elliptic = 62;
    mglFlame2d_escher = 63;
    mglFlame2d_foci = 64;
    mglFlame2d_lazySusan = 65;
    mglFlame2d_loonie = 66;
    mglFlame2d_preBlur = 67;
    mglFlame2d_modulus = 68;
    mglFlame2d_oscope = 69;
    mglFlame2d_polar2 = 70;
    mglFlame2d_popcorn2 = 71;
    mglFlame2d_scry = 72;
    mglFlame2d_separation = 73;
    mglFlame2d_split = 74;
    mglFlame2d_splits = 75;
    mglFlame2d_stripes = 76;
    mglFlame2d_wedge = 77;
    mglFlame2d_wedgeJulia = 78;
    mglFlame2d_wedgeSph = 79;
    mglFlame2d_whorl = 80;
    mglFlame2d_waves2 = 81;
    mglFlame2d_exp = 82;
    mglFlame2d_log = 83;
    mglFlame2d_sin = 84;
    mglFlame2d_cos = 85;
    mglFlame2d_tan = 86;
    mglFlame2d_sec = 87;
    mglFlame2d_csc = 88;
    mglFlame2d_cot = 89;
    mglFlame2d_sinh = 90;
    mglFlame2d_cosh = 91;
    mglFlame2d_tanh = 92;
    mglFlame2d_sech = 93;
    mglFlame2d_csch = 94;
    mglFlame2d_coth = 95;
    mglFlame2d_auger = 96;
    mglFlame2d_flux = 97;
    mglFlame2dLAST = 98;
;

function mgl_data_flame_2d(A:THCDT; F:THCDT; n:longint; skip:longint):THMDT;cdecl;external;
function mgl_data_detect(d:THCDT; lvl:Tmreal; dj:Tmreal; di:Tmreal; min_len:Tmreal):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_data_tridmat(A:THCDT; B:THCDT; C:THCDT; D:THCDT; how:Pchar):THMDT;cdecl;external;
function mgl_data_value(dat:THMDT; i:longint; j:longint; k:longint):Pmreal;cdecl;external;
function mgl_data_data(dat:THMDT):Pmreal;cdecl;external;
function mgl_data_get_nx(d:THCDT):longint;cdecl;external;
function mgl_data_get_ny(d:THCDT):longint;cdecl;external;
function mgl_data_get_nz(d:THCDT):longint;cdecl;external;
function mgl_data_combine(dat1:THCDT; dat2:THCDT):THMDT;cdecl;external;
procedure mgl_data_extend(dat:THMDT; n1:longint; n2:longint);cdecl;external;
procedure mgl_data_insert(dat:THMDT; dir:char; at:longint; num:longint);cdecl;external;
procedure mgl_data_delete(dat:THMDT; dir:char; at:longint; num:longint);cdecl;external;
procedure mgl_data_join(dat:THMDT; d:THCDT);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_smooth(d:THMDT; dirs:Pchar; delta:Tmreal);cdecl;external;
(* Const before type ignored *)
function mgl_data_sum(dat:THCDT; dir:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_data_first_dir(dat:THCDT; dir:Pchar; val:Tdouble):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_data_last_dir(dat:THCDT; dir:Pchar; val:Tdouble):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_data_max_dir(dat:THCDT; dir:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_data_min_dir(dat:THCDT; dir:Pchar):THMDT;cdecl;external;
function mgl_data_minmax(dat:THCDT):THMDT;cdecl;external;
function mgl_data_connect(a:THCDT; b:THCDT):THMDT;cdecl;external;
procedure mgl_data_connect_r(a:THMDT; b:THMDT);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_cumsum(dat:THMDT; dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_integral(dat:THMDT; dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_diff(dat:THMDT; dir:Pchar);cdecl;external;
procedure mgl_data_diff_par(dat:THMDT; v1:THCDT; v2:THCDT; v3:THCDT);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_diff2(dat:THMDT; dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_swap(dat:THMDT; dir:Pchar);cdecl;external;
procedure mgl_data_roll(dat:THMDT; dir:char; num:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_mirror(dat:THMDT; dir:Pchar);cdecl;external;
procedure mgl_data_sort(dat:THMDT; idx:longint; idy:longint);cdecl;external;
procedure mgl_data_dilate(dat:THMDT; val:Tmreal; step:longint);cdecl;external;
procedure mgl_data_erode(dat:THMDT; val:Tmreal; step:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_hankel(dat:THMDT; dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_sinfft(dat:THMDT; dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_cosfft(dat:THMDT; dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_fill_sample(dat:THMDT; how:Pchar);cdecl;external;
(* Const before type ignored *)
function mgl_data_correl(dat1:THCDT; dat2:THCDT; dir:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
procedure mgl_data_wavelet(dat:THMDT; how:Pchar; k:longint);cdecl;external;
function mgl_fft_alloc(n:longint; space:Ppointer; nthr:longint):pointer;cdecl;external;
function mgl_fft_alloc_thr(n:longint):pointer;cdecl;external;
procedure mgl_fft_free(wt:pointer; ws:Ppointer; nthr:longint);cdecl;external;
procedure mgl_fft_free_thr(wt:pointer);cdecl;external;
(* Const before type ignored *)
procedure mgl_fft(x:Pdouble; s:longint; n:longint; wt:pointer; ws:pointer; 
            inv:longint);cdecl;external;
procedure mgl_clear_fft;cdecl;external;
function mgl_data_spline(dat:THCDT; x:Tmreal; y:Tmreal; z:Tmreal):Tmreal;cdecl;external;
function mgl_data_spline_ext(dat:THCDT; x:Tmreal; y:Tmreal; z:Tmreal; dx:Pmreal; 
           dy:Pmreal; dz:Pmreal):Tmreal;cdecl;external;
function mgl_gspline_init(x:THCDT; v:THCDT):THMDT;cdecl;external;
function mgl_gspline(coef:THCDT; dx:Tmreal; d1:Pmreal; d2:Pmreal):Tmreal;cdecl;external;
function mgl_data_solve_1d(dat:THCDT; val:Tmreal; spl:longint; i0:longint):Tmreal;cdecl;external;
function mgl_data_solve(dat:THCDT; val:Tmreal; dir:char; i0:THCDT; norm:longint):THMDT;cdecl;external;
function mgl_data_trace(d:THCDT):THMDT;cdecl;external;
function mgl_data_resize(dat:THCDT; mx:longint; my:longint; mz:longint):THMDT;cdecl;external;
function mgl_data_resize_box(dat:THCDT; mx:longint; my:longint; mz:longint; x1:Tmreal; 
           x2:Tmreal; y1:Tmreal; y2:Tmreal; z1:Tmreal; z2:Tmreal):THMDT;cdecl;external;
function mgl_data_hist(dat:THCDT; n:longint; v1:Tmreal; v2:Tmreal; nsub:longint):THMDT;cdecl;external;
function mgl_data_hist_w(dat:THCDT; weight:THCDT; n:longint; v1:Tmreal; v2:Tmreal; 
           nsub:longint):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_data_momentum(dat:THCDT; dir:char; how:Pchar):THMDT;cdecl;external;
function mgl_data_pulse(dat:THCDT; dir:char):THMDT;cdecl;external;
function mgl_data_evaluate(dat:THCDT; idat:THCDT; jdat:THCDT; kdat:THCDT; norm:longint):THMDT;cdecl;external;
procedure mgl_data_envelop(dat:THMDT; dir:char);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_sew(dat:THMDT; dirs:Pchar; da:Tmreal);cdecl;external;
procedure mgl_data_crop(dat:THMDT; n1:longint; n2:longint; dir:char);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_crop_opt(dat:THMDT; how:Pchar);cdecl;external;
procedure mgl_data_clean(dat:THMDT; id:longint);cdecl;external;
procedure mgl_data_mul_dat(dat:THMDT; d:THCDT);cdecl;external;
procedure mgl_data_div_dat(dat:THMDT; d:THCDT);cdecl;external;
procedure mgl_data_add_dat(dat:THMDT; d:THCDT);cdecl;external;
procedure mgl_data_sub_dat(dat:THMDT; d:THCDT);cdecl;external;
procedure mgl_data_mul_num(dat:THMDT; d:Tmreal);cdecl;external;
procedure mgl_data_div_num(dat:THMDT; d:Tmreal);cdecl;external;
procedure mgl_data_add_num(dat:THMDT; d:Tmreal);cdecl;external;
procedure mgl_data_sub_num(dat:THMDT; d:Tmreal);cdecl;external;
(* Const before type ignored *)
function mgl_transform_a(am:THCDT; ph:THCDT; tr:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_transform(re:THCDT; im:THCDT; tr:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
procedure mgl_data_fourier(re:THMDT; im:THMDT; dir:Pchar);cdecl;external;
function mgl_data_stfa(re:THCDT; im:THCDT; dn:longint; dir:char):THMDT;cdecl;external;
function mgl_triangulation_3d(x:THCDT; y:THCDT; z:THCDT):THMDT;cdecl;external;
function mgl_triangulation_2d(x:THCDT; y:THCDT):THMDT;cdecl;external;
function mgl_find_root(func:function (val:Tmreal; par:pointer):Tmreal; ini:Tmreal; par:pointer):Tmreal;cdecl;external;
(* Const before type ignored *)
function mgl_find_root_txt(func:Pchar; ini:Tmreal; var_id:char):Tmreal;cdecl;external;
(* Const before type ignored *)
function mgl_data_roots(func:Pchar; ini:THCDT; var_id:char):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_find_roots_txt(func:Pchar; vars:Pchar; ini:THCDT):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_find_roots(n:Tsize_t; func:procedure (x:Pmreal; f:Pmreal; par:pointer); x0:Pmreal; par:pointer):longint;cdecl;external;
function mgl_rnd_integer(lo:longint; hi:longint):Tmreal;cdecl;external;
function mgl_rnd_uniform(lo:Tmreal; hi:Tmreal):Tmreal;cdecl;external;
function mgl_rnd_bernoulli(p:Tmreal):Tmreal;cdecl;external;
function mgl_rnd_binomial(trials:longint; p:Tmreal):longint;cdecl;external;
function mgl_rnd_gaussian(mu:Tmreal; sigma:Tmreal):Tmreal;cdecl;external;
function mgl_rnd_exponential(lambda:Tmreal):Tmreal;cdecl;external;
function mgl_rnd_discrete(A:THCDT):longint;cdecl;external;
procedure mgl_data_rnd_integer(d:THMDT; lo:longint; hi:longint);cdecl;external;
procedure mgl_data_rnd_uniform(d:THMDT; lo:Tmreal; hi:Tmreal);cdecl;external;
procedure mgl_data_rnd_bernoulli(d:THMDT; p:Tmreal);cdecl;external;
procedure mgl_data_rnd_binomial(d:THMDT; trials:longint; p:Tmreal);cdecl;external;
procedure mgl_data_rnd_gaussian(d:THMDT; mu:Tmreal; sigma:Tmreal);cdecl;external;
procedure mgl_data_rnd_exponential(d:THMDT; lambda:Tmreal);cdecl;external;
procedure mgl_data_rnd_discrete(d:THMDT; A:THCDT);cdecl;external;
procedure mgl_shuffle(d:THMDT; dir:char);cdecl;external;
procedure mgl_data_brownian(d:THMDT; y1:Tmreal; y2:Tmreal; sigma:Tmreal; alpha:Tmreal);cdecl;external;
procedure mgl_data_brownian_(d:Puintptr_t; y1:Pdouble; y2:Pdouble; sigma:Pdouble; alpha:Pdouble);cdecl;external;

implementation


end.
