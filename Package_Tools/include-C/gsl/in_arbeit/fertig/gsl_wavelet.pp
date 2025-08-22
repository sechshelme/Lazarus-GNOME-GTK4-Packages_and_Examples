
unit gsl_wavelet;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_wavelet.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_wavelet.h
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
Pgsl_wavelet  = ^gsl_wavelet;
Pgsl_wavelet_direction  = ^gsl_wavelet_direction;
Pgsl_wavelet_type  = ^gsl_wavelet_type;
Pgsl_wavelet_workspace  = ^gsl_wavelet_workspace;
Psize_t  = ^size_t;
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
{$ifndef __GSL_WAVELET_H__}
{$define __GSL_WAVELET_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
type
  Pgsl_wavelet_direction = ^Tgsl_wavelet_direction;
  Tgsl_wavelet_direction =  Longint;
  Const
    gsl_wavelet_forward = 1;
    gsl_wavelet_backward = -(1);
;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  Pgsl_wavelet_type = ^Tgsl_wavelet_type;
  Tgsl_wavelet_type = record
      name : Pchar;
      init : function (h1:PPdouble; g1:PPdouble; h2:PPdouble; g2:PPdouble; nc:Psize_t; 
                   offset:Psize_t; member:Tsize_t):longint;cdecl;
    end;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Pgsl_wavelet = ^Tgsl_wavelet;
  Tgsl_wavelet = record
      _type : Pgsl_wavelet_type;
      h1 : Pdouble;
      g1 : Pdouble;
      h2 : Pdouble;
      g2 : Pdouble;
      nc : Tsize_t;
      offset : Tsize_t;
    end;

  Pgsl_wavelet_workspace = ^Tgsl_wavelet_workspace;
  Tgsl_wavelet_workspace = record
      scratch : Pdouble;
      n : Tsize_t;
    end;
(* Const before type ignored *)
  var
    gsl_wavelet_daubechies : Pgsl_wavelet_type;cvar;external;
(* Const before type ignored *)
    gsl_wavelet_daubechies_centered : Pgsl_wavelet_type;cvar;external;
(* Const before type ignored *)
    gsl_wavelet_haar : Pgsl_wavelet_type;cvar;external;
(* Const before type ignored *)
    gsl_wavelet_haar_centered : Pgsl_wavelet_type;cvar;external;
(* Const before type ignored *)
    gsl_wavelet_bspline : Pgsl_wavelet_type;cvar;external;
(* Const before type ignored *)
    gsl_wavelet_bspline_centered : Pgsl_wavelet_type;cvar;external;
(* Const before type ignored *)

function gsl_wavelet_alloc(T:Pgsl_wavelet_type; k:Tsize_t):Pgsl_wavelet;cdecl;external;
procedure gsl_wavelet_free(w:Pgsl_wavelet);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_wavelet_name(w:Pgsl_wavelet):Pchar;cdecl;external;
function gsl_wavelet_workspace_alloc(n:Tsize_t):Pgsl_wavelet_workspace;cdecl;external;
procedure gsl_wavelet_workspace_free(work:Pgsl_wavelet_workspace);cdecl;external;
(* Const before type ignored *)
function gsl_wavelet_transform(w:Pgsl_wavelet; data:Pdouble; stride:Tsize_t; n:Tsize_t; dir:Tgsl_wavelet_direction; 
           work:Pgsl_wavelet_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_wavelet_transform_forward(w:Pgsl_wavelet; data:Pdouble; stride:Tsize_t; n:Tsize_t; work:Pgsl_wavelet_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_wavelet_transform_inverse(w:Pgsl_wavelet; data:Pdouble; stride:Tsize_t; n:Tsize_t; work:Pgsl_wavelet_workspace):longint;cdecl;external;
{$endif}
{ __GSL_WAVELET_H__  }

implementation


end.
