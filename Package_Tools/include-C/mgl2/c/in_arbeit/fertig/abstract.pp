
unit abstract;
interface

{
  Automatically converted by H2Pas 1.0.0 from abstract.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    abstract.h
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
Pdword  = ^dword;
PHADT  = ^HADT;
PHAEX  = ^HAEX;
PHCDT  = ^HCDT;
PHMDT  = ^HMDT;
PHMEX  = ^HMEX;
PHMGL  = ^HMGL;
PHMPR  = ^HMPR;
Plongint  = ^longint;
Pmdual  = ^mdual;
PmglDataA  = ^mglDataA;
Pmreal  = ^mreal;
Puintptr_t  = ^uintptr_t;
Pwchar_t  = ^wchar_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{**************************************************************************
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
 ************************************************************************** }
{$ifndef _MGL_ABSTRACT_H_}
{$define _MGL_ABSTRACT_H_}
{$include "mgl2/define.h"}
{----------------------------------------------------------------------------- }
{????????????????? }
{#define mglDataA void }
{#define mglNum void }
type
  PHMGL = ^THMGL;
  THMGL = pointer;

  PHMDT = ^THMDT;
  THMDT = pointer;

  PHADT = ^THADT;
  THADT = pointer;

  PHMEX = ^THMEX;
  THMEX = pointer;

  PHAEX = ^THAEX;
  THAEX = pointer;

  PHMPR = ^THMPR;
  THMPR = pointer;
(* Const before type ignored *)

  PHCDT = ^THCDT;
  THCDT = pointer;
{/ Set buffer size for number of primitives as (1<<bsize)^2. }
{* I.e. as 10^12 for bsize=20 or 4*10^9 for bsize=16 (default). NOTE: you set it only once. The current value is returned.  }

function mgl_bsize(bsize:dword):dword;cdecl;external;
function mgl_bsize_(bsize:Pdword):dword;cdecl;external;
{/ Set seed for random numbers }
procedure mgl_srnd(seed:longint);cdecl;external;
procedure mgl_srnd_(seed:Plongint);cdecl;external;
{/ Get random number }
function mgl_rnd:Tdouble;cdecl;external;
function mgl_rnd_:Tdouble;cdecl;external;
{/ Set name for data variable (can be used in mgl_formula_calc() or in MGL scripts) }
(* Const before type ignored *)
procedure mgl_data_set_name(dat:PmglDataA; name:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_set_name_(dat:Puintptr_t; name:Pchar; para3:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_set_name_w(dat:PmglDataA; name:Pwchar_t);cdecl;external;
{/ Get name of data variable }
(* Const before type ignored *)
function mgl_data_get_name_w(dat:THCDT):Pwchar_t;cdecl;external;
{/ Set callback function which is called at deleting variable }
procedure mgl_data_set_func(dat:PmglDataA; func:procedure (para1:pointer); par:pointer);cdecl;external;
const
  mgl_datac_set_id = mgl_data_set_id;  
  mgl_datac_set_id_ = mgl_data_set_id_;  
{/ Set names for columns (slices) }
(* Const before type ignored *)

procedure mgl_data_set_id(d:PmglDataA; ids:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_datac_set_id_(d:Puintptr_t; eq:Pchar; para3:longint);cdecl;external;
{/ Get names for columns (slices) }
(* Const before type ignored *)
function mgl_data_get_id(d:THCDT):Pchar;cdecl;external;
{/ Save whole data array (for ns=-1) or only ns-th slice to text file }
(* Const before type ignored *)
procedure mgl_data_save(dat:THCDT; fname:Pchar; ns:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_data_save_(dat:Puintptr_t; fname:Pchar; ns:Plongint; para4:longint);cdecl;external;
{/ Export data array (for ns=-1) or only ns-th slice to PNG file according color scheme }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_data_export(dat:THCDT; fname:Pchar; scheme:Pchar; v1:Tdouble; v2:Tdouble; 
            ns:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_data_export_(dat:Puintptr_t; fname:Pchar; scheme:Pchar; v1:Pmreal; v2:Pmreal; 
            ns:Plongint; para7:longint; para8:longint);cdecl;external;
{/ Save data to HDF file }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_data_save_hdf(d:THCDT; fname:Pchar; data:Pchar; rewrite:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_data_save_hdf_(d:Puintptr_t; fname:Pchar; data:Pchar; rewrite:Plongint; l:longint; 
            n:longint);cdecl;external;
{/ Save value to HDF file }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dual_save_hdf(val:Tmdual; fname:Pchar; data:Pchar; rewrite:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_real_save_hdf(val:Tdouble; fname:Pchar; data:Pchar; rewrite:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_int_save_hdf(val:longint; fname:Pchar; data:Pchar; rewrite:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_real_save_hdf_(val:Pdouble; fname:Pchar; data:Pchar; rewrite:Plongint; para5:longint; 
            para6:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_int_save_hdf_(val:Plongint; fname:Pchar; data:Pchar; rewrite:Plongint; para5:longint; 
            para6:longint);cdecl;external;
{/ Get information about the data (sizes and momentum) to string }
(* Const before type ignored *)
function mgl_data_info(dat:THCDT):Pchar;cdecl;external;
function mgl_data_info_(dat:Puintptr_t; out:Pchar; len:longint):longint;cdecl;external;
{/ Put HDF data names into buf as '\t' separated. }
(* Const before type ignored *)
function mgl_datas_hdf(fname:Pchar; buf:Pchar; size:longint):longint;cdecl;external;
(* Const before type ignored *)
function mgl_datas_hdf_(fname:Pchar; buf:Pchar; l:longint; size:longint):longint;cdecl;external;
{/ Put HDF data names as list of strings (last one is ""). }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function mgl_datas_hdf_str(fname:Pchar):^Pchar;cdecl;external;
{/ Get maximal value of the data }
function mgl_data_max(dat:THCDT):Tmreal;cdecl;external;
function mgl_data_max_(dat:Puintptr_t):Tmreal;cdecl;external;
{/ Get maximal value of the data which is less than 0 }
function mgl_data_neg_max(dat:THCDT):Tmreal;cdecl;external;
function mgl_data_neg_max_(dat:Puintptr_t):Tmreal;cdecl;external;
{/ Get minimal value of the data }
function mgl_data_min(dat:THCDT):Tmreal;cdecl;external;
function mgl_data_min_(dat:Puintptr_t):Tmreal;cdecl;external;
{/ Get minimal value of the data which is larger than 0 }
function mgl_data_pos_min(dat:THCDT):Tmreal;cdecl;external;
function mgl_data_pos_min_(dat:Puintptr_t):Tmreal;cdecl;external;
{/ Find position (after specified in i,j,k) of first nonzero value of formula }
(* Const before type ignored *)
function mgl_data_first(dat:THCDT; cond:Pchar; i:Plongint; j:Plongint; k:Plongint):Tmreal;cdecl;external;
(* Const before type ignored *)
function mgl_data_first_(dat:Puintptr_t; cond:Pchar; i:Plongint; j:Plongint; k:Plongint; 
           para6:longint):Tmreal;cdecl;external;
{/ Find position (before specified in i,j,k) of last nonzero value of formula }
(* Const before type ignored *)
function mgl_data_last(dat:THCDT; cond:Pchar; i:Plongint; j:Plongint; k:Plongint):Tmreal;cdecl;external;
(* Const before type ignored *)
function mgl_data_last_(dat:Puintptr_t; cond:Pchar; i:Plongint; j:Plongint; k:Plongint; 
           para6:longint):Tmreal;cdecl;external;
{/ Find position of first in direction 'dir' nonzero value of formula }
(* Const before type ignored *)
function mgl_data_find(dat:THCDT; cond:Pchar; dir:char; i:longint; j:longint; 
           k:longint):longint;cdecl;external;
(* Const before type ignored *)
function mgl_data_find_(dat:Puintptr_t; cond:Pchar; dir:Pchar; i:Plongint; j:Plongint; 
           k:Plongint; para7:longint; para8:longint):longint;cdecl;external;
{/ Find if any nonzero value of formula }
(* Const before type ignored *)
function mgl_data_find_any(dat:THCDT; cond:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mgl_data_find_any_(dat:Puintptr_t; cond:Pchar; para3:longint):longint;cdecl;external;
{/ Get maximal value of the data and its position }
function mgl_data_max_int(dat:THCDT; i:Plongint; j:Plongint; k:Plongint):Tmreal;cdecl;external;
function mgl_data_max_int_(dat:Puintptr_t; i:Plongint; j:Plongint; k:Plongint):Tmreal;cdecl;external;
{/ Get maximal value of the data and its approximated position }
function mgl_data_max_real(dat:THCDT; x:Pmreal; y:Pmreal; z:Pmreal):Tmreal;cdecl;external;
function mgl_data_max_real_(dat:Puintptr_t; x:Pmreal; y:Pmreal; z:Pmreal):Tmreal;cdecl;external;
{/ Get minimal value of the data and its position }
function mgl_data_min_int(dat:THCDT; i:Plongint; j:Plongint; k:Plongint):Tmreal;cdecl;external;
function mgl_data_min_int_(dat:Puintptr_t; i:Plongint; j:Plongint; k:Plongint):Tmreal;cdecl;external;
{/ Get minimal value of the data and its approximated position }
function mgl_data_min_real(dat:THCDT; x:Pmreal; y:Pmreal; z:Pmreal):Tmreal;cdecl;external;
function mgl_data_min_real_(dat:Puintptr_t; x:Pmreal; y:Pmreal; z:Pmreal):Tmreal;cdecl;external;
{/ Get "energy and find 4 momenta of data: median, width, skewness, kurtosis }
function mgl_data_momentum_val(d:THCDT; dir:char; m:Pmreal; w:Pmreal; s:Pmreal; 
           k:Pmreal):Tmreal;cdecl;external;
function mgl_data_momentum_val_(dat:Puintptr_t; dir:Pchar; m:Pmreal; w:Pmreal; s:Pmreal; 
           k:Pmreal; para7:longint):Tmreal;cdecl;external;
{/ Get first (last if from<0) maximum along direction dir, and save its orthogonal coordinates in p1, p2 }
function mgl_data_max_first(d:THCDT; dir:char; from:longint; p1:Plongint; p2:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function mgl_data_max_first_(d:Puintptr_t; dir:Pchar; from:Plongint; p1:Plongint; p2:Plongint; 
           para6:longint):longint;cdecl;external;
{/ Interpolate by linear function the data to given point x=[0...nx-1], y=[0...ny-1], z=[0...nz-1] }
function mgl_data_linear(dat:THCDT; x:Tmreal; y:Tmreal; z:Tmreal):Tmreal;cdecl;external;
function mgl_data_linear_(dat:Puintptr_t; x:Pmreal; y:Pmreal; z:Pmreal):Tmreal;cdecl;external;
{/ Interpolate by linear function the data and return its derivatives at given point x=[0...nx-1], y=[0...ny-1], z=[0...nz-1] }
function mgl_data_linear_ext(dat:THCDT; x:Tmreal; y:Tmreal; z:Tmreal; dx:Pmreal; 
           dy:Pmreal; dz:Pmreal):Tmreal;cdecl;external;
function mgl_data_linear_ext_(dat:Puintptr_t; x:Pmreal; y:Pmreal; z:Pmreal; dx:Pmreal; 
           dy:Pmreal; dz:Pmreal):Tmreal;cdecl;external;
{/ Internal function for (un-)locking mutex in mglStack }
procedure mgl_mutex_lock(para1:pointer);cdecl;external;
procedure mgl_mutex_unlock(para1:pointer);cdecl;external;
{----------------------------------------------------------------------------- }
{/ Create HMEX object for expression evaluating }
(* Const before type ignored *)
function mgl_create_expr(expr:Pchar):THMEX;cdecl;external;
(* Const before type ignored *)
function mgl_create_expr_(expr:Pchar; para2:longint):Tuintptr_t;cdecl;external;
{/ Delete HMEX object }
procedure mgl_delete_expr(ex:THMEX);cdecl;external;
procedure mgl_delete_expr_(ex:Puintptr_t);cdecl;external;
{/ Return value of expression for given x,y,z variables }
function mgl_expr_eval(ex:THMEX; x:Tdouble; y:Tdouble; z:Tdouble):Tdouble;cdecl;external;
function mgl_expr_eval_(ex:Puintptr_t; x:Pmreal; y:Pmreal; z:Pmreal):Tdouble;cdecl;external;
{/ Return value of expression for given variables }
function mgl_expr_eval_v(ex:THMEX; vars:Pmreal):Tdouble;cdecl;external;
{/ Return value of expression differentiation over variable dir for given x,y,z variables }
function mgl_expr_diff(ex:THMEX; dir:char; x:Tdouble; y:Tdouble; z:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function mgl_expr_diff_(ex:Puintptr_t; dir:Pchar; x:Pmreal; y:Pmreal; z:Pmreal; 
           para6:longint):Tdouble;cdecl;external;
{/ Return value of expression differentiation over variable dir for given variables }
function mgl_expr_diff_v(ex:THMEX; dir:char; vars:Pmreal):Tdouble;cdecl;external;
{----------------------------------------------------------------------------- }
{/ Create HAEX object for expression evaluating }
(* Const before type ignored *)
function mgl_create_cexpr(expr:Pchar):THAEX;cdecl;external;
(* Const before type ignored *)
function mgl_create_cexpr_(expr:Pchar; para2:longint):Tuintptr_t;cdecl;external;
{/ Delete HAEX object }
procedure mgl_delete_cexpr(ex:THAEX);cdecl;external;
procedure mgl_delete_cexpr_(ex:Puintptr_t);cdecl;external;
{/ Return value of expression for given x,y,z variables }
function mgl_cexpr_eval(ex:THAEX; x:Tmdual; y:Tmdual; z:Tmdual):Tcmdual;cdecl;external;
function mgl_cexpr_eval_(ex:Puintptr_t; x:Pmdual; y:Pmdual; z:Pmdual):Tcmdual;cdecl;external;
{/ Return value of expression for given variables }
function mgl_cexpr_eval_v(ex:THAEX; vars:Pmdual):Tcmdual;cdecl;external;
{----------------------------------------------------------------------------- }
{/ Callback function for asking user a question. Result shouldn't exceed 1024. }
(* Const before type ignored *)
  var
    mgl_ask_func : procedure (quest:Pwchar_t; res:Pwchar_t);cvar;external;
{/ Console function for asking user a question. Result shouldn't exceed 1024. }
(* Const before type ignored *)

procedure mgl_ask_gets(quest:Pwchar_t; res:Pwchar_t);cdecl;external;
{/ Callback function for displaying progress of something. }
  var
    mgl_progress_func : procedure (value:longint; maximal:longint; gr:THMGL);cvar;external;
{/ Console function for displaying progress of something. }

procedure mgl_progress_txt(value:longint; maximal:longint; gr:THMGL);cdecl;external;
{/ Display progress of something. }
procedure mgl_progress(value:longint; maximal:longint; gr:THMGL);cdecl;external;
{----------------------------------------------------------------------------- }
{$endif}

implementation


end.
