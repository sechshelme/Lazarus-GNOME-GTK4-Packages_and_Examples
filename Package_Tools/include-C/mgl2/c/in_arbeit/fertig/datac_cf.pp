
unit datac_cf;
interface

{
  Automatically converted by H2Pas 1.0.0 from datac_cf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    datac_cf.h
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
PHADT  = ^HADT;
Pmdual  = ^mdual;
Psingle  = ^single;
Puintptr_t  = ^uintptr_t;
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
{$ifndef _MGL_DATAC_CF_H_}
{$define _MGL_DATAC_CF_H_}
{----------------------------------------------------------------------------- }
{$include "mgl2/abstract.h"}
{----------------------------------------------------------------------------- }
{$if MGL_HAVE_GSL}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
{$else}
type
  Pgsl_vector = ^Tgsl_vector;
  Tgsl_vector = record
      {undefined structure}
    end;

  Pgsl_matrix = ^Tgsl_matrix;
  Tgsl_matrix = record
      {undefined structure}
    end;

{$endif}
{----------------------------------------------------------------------------- }
type
  PHADT = ^THADT;
  THADT = pointer;

function mgl_ipowc(x:Tmdual; n:longint):Tcmdual;cdecl;external;
(* Const before type ignored *)
function mgl_atoc(s:Pchar; adv:longint):Tcmdual;cdecl;external;
function mgl_expi(a:Tmdual):Tcmdual;cdecl;external;
function mgl_create_datac:THADT;cdecl;external;
function mgl_create_datac_size(nx:longint; ny:longint; nz:longint):THADT;cdecl;external;
(* Const before type ignored *)
function mgl_create_datac_file(fname:Pchar):THADT;cdecl;external;
procedure mgl_delete_datac(dat:THADT);cdecl;external;
procedure mgl_datac_rearrange(dat:THADT; mx:longint; my:longint; mz:longint);cdecl;external;
procedure mgl_datac_link(dat:THADT; A:Pmdual; mx:longint; my:longint; mz:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_set_float(dat:THADT; A:Psingle; mx:longint; my:longint; mz:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_set_double(dat:THADT; A:Pdouble; mx:longint; my:longint; mz:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_set_complex(dat:THADT; A:Pmdual; mx:longint; my:longint; mz:longint);cdecl;external;
procedure mgl_datac_set(dat:THADT; a:THCDT);cdecl;external;
procedure mgl_datac_set_vector(dat:THADT; v:Pgsl_vector);cdecl;external;
procedure mgl_datac_set_matrix(dat:THADT; m:Pgsl_matrix);cdecl;external;
procedure mgl_datac_set_value(dat:THADT; v:Tmdual; i:longint; j:longint; k:longint);cdecl;external;
function mgl_datac_get_value(dat:THCDT; i:longint; j:longint; k:longint):Tcmdual;cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_set_values(dat:THADT; val:Pchar; nx:longint; ny:longint; nz:longint);cdecl;external;
(* Const before type ignored *)
function mgl_datac_tridmat(A:THCDT; B:THCDT; C:THCDT; D:THCDT; how:Pchar):THADT;cdecl;external;
(* Const before type ignored *)
function mgl_datac_tridmat_(A:Puintptr_t; B:Puintptr_t; C:Puintptr_t; D:Puintptr_t; how:Pchar; 
           para6:longint):Tuintptr_t;cdecl;external;
function mgl_datac_data(dat:THADT):Pmdual;cdecl;external;
function mgl_datac_value(dat:THADT; i:longint; j:longint; k:longint):Pmdual;cdecl;external;
procedure mgl_datac_set_ri(dat:THADT; re:THCDT; im:THCDT);cdecl;external;
procedure mgl_datac_set_ap(dat:THADT; abs:THCDT; phi:THCDT);cdecl;external;
(* Const before type ignored *)
function mgl_datac_read(dat:THADT; fname:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mgl_datac_read_mat(dat:THADT; fname:Pchar; dim:longint):longint;cdecl;external;
(* Const before type ignored *)
function mgl_datac_read_dim(dat:THADT; fname:Pchar; mx:longint; my:longint; mz:longint):longint;cdecl;external;
(* Const before type ignored *)
function mgl_datac_read_range(d:THADT; templ:Pchar; from:Tdouble; to:Tdouble; step:Tdouble; 
           as_slice:longint):longint;cdecl;external;
(* Const before type ignored *)
function mgl_datac_read_all(dat:THADT; templ:Pchar; as_slice:longint):longint;cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_save(dat:THCDT; fname:Pchar; ns:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_datac_read_hdf(d:THADT; fname:Pchar; data:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_datac_save_hdf(d:THCDT; fname:Pchar; data:Pchar; rewrite:longint);cdecl;external;
procedure mgl_datac_create(dat:THADT; nx:longint; ny:longint; nz:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_transpose(dat:THADT; dim:Pchar);cdecl;external;
function mgl_datac_subdata(dat:THCDT; xx:longint; yy:longint; zz:longint):THADT;cdecl;external;
function mgl_datac_subdata_ext(dat:THCDT; xx:THCDT; yy:THCDT; zz:THCDT):THADT;cdecl;external;
(* Const before type ignored *)
function mgl_datac_column(dat:THCDT; eq:Pchar):THADT;cdecl;external;
function mgl_datac_trace(d:THCDT):THADT;cdecl;external;
function mgl_datac_resize(dat:THCDT; mx:longint; my:longint; mz:longint):THADT;cdecl;external;
function mgl_datac_resize_box(dat:THCDT; mx:longint; my:longint; mz:longint; x1:Tmreal; 
           x2:Tmreal; y1:Tmreal; y2:Tmreal; z1:Tmreal; z2:Tmreal):THADT;cdecl;external;
(* Const before type ignored *)
function mgl_datac_momentum(dat:THCDT; dir:char; how:Pchar):THADT;cdecl;external;
function mgl_datac_evaluate(dat:THCDT; idat:THCDT; jdat:THCDT; kdat:THCDT; norm:longint):THADT;cdecl;external;
(* Const before type ignored *)
function mgl_datac_sum(dat:THCDT; dir:Pchar):THADT;cdecl;external;
function mgl_datac_combine(dat1:THCDT; dat2:THCDT):THADT;cdecl;external;
function mgl_datac_section(dat:THCDT; ids:THCDT; dir:char; val:Tmreal):THADT;cdecl;external;
function mgl_datac_section_val(dat:THCDT; id:longint; dir:char; val:Tmreal):THADT;cdecl;external;
(* Const before type ignored *)
function mgl_formula_calc_c(str:Pchar; n:longint; args:array of const):THADT;cdecl;external;
function mgl_formula_calc_c(str:Pchar; n:longint):THADT;cdecl;external;
procedure mgl_datac_fill(dat:THADT; x1:Tmdual; x2:Tmdual; dir:char);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_datac_fill_eq(gr:THMGL; dat:THADT; eq:Pchar; vdat:THCDT; wdat:THCDT; 
            opt:Pchar);cdecl;external;
procedure mgl_datac_refill_gs(dat:THADT; xdat:THCDT; vdat:THCDT; x1:Tmreal; x2:Tmreal; 
            sl:longint);cdecl;external;
procedure mgl_datac_refill_x(dat:THADT; xdat:THCDT; vdat:THCDT; x1:Tmreal; x2:Tmreal; 
            sl:longint);cdecl;external;
procedure mgl_datac_refill_xy(dat:THADT; xdat:THCDT; ydat:THCDT; vdat:THCDT; x1:Tmreal; 
            x2:Tmreal; y1:Tmreal; y2:Tmreal; sl:longint);cdecl;external;
procedure mgl_datac_refill_xyz(dat:THADT; xdat:THCDT; ydat:THCDT; zdat:THCDT; vdat:THCDT; 
            x1:Tmreal; x2:Tmreal; y1:Tmreal; y2:Tmreal; z1:Tmreal; 
            z2:Tmreal);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_refill_gr(gr:THMGL; dat:THADT; xdat:THCDT; ydat:THCDT; zdat:THCDT; 
            vdat:THCDT; sl:longint; opt:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_modify(dat:THADT; eq:Pchar; dim:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_modify_vw(dat:THADT; eq:Pchar; vdat:THCDT; wdat:THCDT);cdecl;external;
procedure mgl_datac_limit(dat:THADT; v:Tmreal);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_keep(dat:THADT; how:Pchar; i:longint; j:longint);cdecl;external;
procedure mgl_datac_put_val(dat:THADT; val:Tmdual; i:longint; j:longint; k:longint);cdecl;external;
procedure mgl_datac_put_dat(dat:THADT; val:THCDT; i:longint; j:longint; k:longint);cdecl;external;
procedure mgl_datac_squeeze(dat:THADT; rx:longint; ry:longint; rz:longint; smooth:longint);cdecl;external;
procedure mgl_datac_extend(dat:THADT; n1:longint; n2:longint);cdecl;external;
procedure mgl_datac_insert(dat:THADT; dir:char; at:longint; num:longint);cdecl;external;
procedure mgl_datac_delete(dat:THADT; dir:char; at:longint; num:longint);cdecl;external;
procedure mgl_datac_join(dat:THADT; d:THCDT);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_smooth(d:THADT; dirs:Pchar; delta:Tmreal);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_cumsum(dat:THADT; dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_integral(dat:THADT; dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_diff(dat:THADT; dir:Pchar);cdecl;external;
procedure mgl_datac_diff_par(dat:THADT; v1:THCDT; v2:THCDT; v3:THCDT);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_diff2(dat:THADT; dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_swap(dat:THADT; dir:Pchar);cdecl;external;
procedure mgl_datac_roll(dat:THADT; dir:char; num:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_mirror(dat:THADT; dir:Pchar);cdecl;external;
procedure mgl_datac_crop(dat:THADT; n1:longint; n2:longint; dir:char);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_crop_opt(dat:THADT; how:Pchar);cdecl;external;
procedure mgl_datac_mul_dat(dat:THADT; d:THCDT);cdecl;external;
procedure mgl_datac_div_dat(dat:THADT; d:THCDT);cdecl;external;
procedure mgl_datac_add_dat(dat:THADT; d:THCDT);cdecl;external;
procedure mgl_datac_sub_dat(dat:THADT; d:THCDT);cdecl;external;
procedure mgl_datac_mul_num(dat:THADT; d:Tmdual);cdecl;external;
procedure mgl_datac_div_num(dat:THADT; d:Tmdual);cdecl;external;
procedure mgl_datac_add_num(dat:THADT; d:Tmdual);cdecl;external;
procedure mgl_datac_sub_num(dat:THADT; d:Tmdual);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_hankel(dat:THADT; dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_sinfft(dat:THADT; dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_cosfft(dat:THADT; dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_fft(dat:THADT; dir:Pchar);cdecl;external;
(* Const before type ignored *)
function mgl_datac_correl(dat1:THCDT; dat2:THCDT; dir:Pchar):THADT;cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_diffr(dat:THADT; how:Pchar; q:Tmreal);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_wavelet(dat:THADT; how:Pchar; k:longint);cdecl;external;
procedure mgl_datac_envelop(dat:THADT; dir:char);cdecl;external;
function mgl_datac_real(dat:THCDT):THMDT;cdecl;external;
function mgl_datac_imag(dat:THCDT):THMDT;cdecl;external;
function mgl_datac_abs(dat:THCDT):THMDT;cdecl;external;
function mgl_datac_arg(dat:THCDT):THMDT;cdecl;external;
function mgl_datac_norm(dat:THCDT):THMDT;cdecl;external;
function mgl_datac_linear(d:THCDT; x:Tmreal; y:Tmreal; z:Tmreal):Tcmdual;cdecl;external;
function mgl_datac_linear_ext(d:THCDT; x:Tmreal; y:Tmreal; z:Tmreal; dx:Pmdual; 
           dy:Pmdual; dz:Pmdual):Tcmdual;cdecl;external;
function mgl_datac_spline(dat:THCDT; x:Tmreal; y:Tmreal; z:Tmreal):Tcmdual;cdecl;external;
function mgl_datac_spline_ext(dat:THCDT; x:Tmreal; y:Tmreal; z:Tmreal; dx:Pmdual; 
           dy:Pmdual; dz:Pmdual):Tcmdual;cdecl;external;
function mgl_gsplinec_init(x:THCDT; v:THCDT):THADT;cdecl;external;
function mgl_gsplinec(coef:THCDT; dx:Tmreal; d1:Pmdual; d2:Pmdual):Tcmdual;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_find_roots_txt_c(func:Pchar; vars:Pchar; ini:THCDT):THADT;cdecl;external;

implementation


end.
