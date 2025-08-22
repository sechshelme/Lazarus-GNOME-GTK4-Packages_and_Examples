
unit gsl_wavelet2d;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_wavelet2d.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_wavelet2d.h
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
Pdouble  = ^double;
Pgsl_matrix  = ^gsl_matrix;
Pgsl_wavelet  = ^gsl_wavelet;
Pgsl_wavelet_workspace  = ^gsl_wavelet_workspace;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ wavelet/gsl_wavelet.h
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
  }
{$ifndef __GSL_WAVELET2D_H__}
{$define __GSL_WAVELET2D_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_vector_double.h>}
{$include <gsl/gsl_matrix_double.h>}
{$include <gsl/gsl_wavelet.h>}
(* Const before type ignored *)

function gsl_wavelet2d_transform(w:Pgsl_wavelet; data:Pdouble; tda:Tsize_t; size1:Tsize_t; size2:Tsize_t; 
           dir:Tgsl_wavelet_direction; work:Pgsl_wavelet_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_wavelet2d_transform_forward(w:Pgsl_wavelet; data:Pdouble; tda:Tsize_t; size1:Tsize_t; size2:Tsize_t; 
           work:Pgsl_wavelet_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_wavelet2d_transform_inverse(w:Pgsl_wavelet; data:Pdouble; tda:Tsize_t; size1:Tsize_t; size2:Tsize_t; 
           work:Pgsl_wavelet_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_wavelet2d_nstransform(w:Pgsl_wavelet; data:Pdouble; tda:Tsize_t; size1:Tsize_t; size2:Tsize_t; 
           dir:Tgsl_wavelet_direction; work:Pgsl_wavelet_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_wavelet2d_nstransform_forward(w:Pgsl_wavelet; data:Pdouble; tda:Tsize_t; size1:Tsize_t; size2:Tsize_t; 
           work:Pgsl_wavelet_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_wavelet2d_nstransform_inverse(w:Pgsl_wavelet; data:Pdouble; tda:Tsize_t; size1:Tsize_t; size2:Tsize_t; 
           work:Pgsl_wavelet_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_wavelet2d_transform_matrix(w:Pgsl_wavelet; a:Pgsl_matrix; dir:Tgsl_wavelet_direction; work:Pgsl_wavelet_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_wavelet2d_transform_matrix_forward(w:Pgsl_wavelet; a:Pgsl_matrix; work:Pgsl_wavelet_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_wavelet2d_transform_matrix_inverse(w:Pgsl_wavelet; a:Pgsl_matrix; work:Pgsl_wavelet_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_wavelet2d_nstransform_matrix(w:Pgsl_wavelet; a:Pgsl_matrix; dir:Tgsl_wavelet_direction; work:Pgsl_wavelet_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_wavelet2d_nstransform_matrix_forward(w:Pgsl_wavelet; a:Pgsl_matrix; work:Pgsl_wavelet_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_wavelet2d_nstransform_matrix_inverse(w:Pgsl_wavelet; a:Pgsl_matrix; work:Pgsl_wavelet_workspace):longint;cdecl;external;
{$endif}
{ __GSL_WAVELET2D_H__  }

implementation


end.
