
unit gsl_permutation;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_permutation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_permutation.h
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
PFILE  = ^FILE;
Pgsl_permutation  = ^gsl_permutation;
Pgsl_permutation_struct  = ^gsl_permutation_struct;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ permutation/gsl_permutation.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2004, 2007 Brian Gough
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
{$ifndef __GSL_PERMUTATION_H__}
{$define __GSL_PERMUTATION_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
type
  Pgsl_permutation_struct = ^Tgsl_permutation_struct;
  Tgsl_permutation_struct = record
      size : Tsize_t;
      data : Psize_t;
    end;

  Tgsl_permutation_struct = Tgsl_permutation;
(* Const before type ignored *)

function gsl_permutation_alloc(n:Tsize_t):Pgsl_permutation;cdecl;external;
(* Const before type ignored *)
function gsl_permutation_calloc(n:Tsize_t):Pgsl_permutation;cdecl;external;
procedure gsl_permutation_init(p:Pgsl_permutation);cdecl;external;
procedure gsl_permutation_free(p:Pgsl_permutation);cdecl;external;
(* Const before type ignored *)
function gsl_permutation_memcpy(dest:Pgsl_permutation; src:Pgsl_permutation):longint;cdecl;external;
function gsl_permutation_fread(stream:PFILE; p:Pgsl_permutation):longint;cdecl;external;
(* Const before type ignored *)
function gsl_permutation_fwrite(stream:PFILE; p:Pgsl_permutation):longint;cdecl;external;
function gsl_permutation_fscanf(stream:PFILE; p:Pgsl_permutation):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_permutation_fprintf(stream:PFILE; p:Pgsl_permutation; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_permutation_size(p:Pgsl_permutation):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_permutation_data(p:Pgsl_permutation):Psize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_permutation_swap(p:Pgsl_permutation; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function gsl_permutation_valid(p:Pgsl_permutation):longint;cdecl;external;
procedure gsl_permutation_reverse(p:Pgsl_permutation);cdecl;external;
(* Const before type ignored *)
function gsl_permutation_inverse(inv:Pgsl_permutation; p:Pgsl_permutation):longint;cdecl;external;
function gsl_permutation_next(p:Pgsl_permutation):longint;cdecl;external;
function gsl_permutation_prev(p:Pgsl_permutation):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_permutation_mul(p:Pgsl_permutation; pa:Pgsl_permutation; pb:Pgsl_permutation):longint;cdecl;external;
(* Const before type ignored *)
function gsl_permutation_linear_to_canonical(q:Pgsl_permutation; p:Pgsl_permutation):longint;cdecl;external;
(* Const before type ignored *)
function gsl_permutation_canonical_to_linear(p:Pgsl_permutation; q:Pgsl_permutation):longint;cdecl;external;
(* Const before type ignored *)
function gsl_permutation_inversions(p:Pgsl_permutation):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_permutation_linear_cycles(p:Pgsl_permutation):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_permutation_canonical_cycles(q:Pgsl_permutation):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_permutation_get(p:Pgsl_permutation; i:Tsize_t):Tsize_t;cdecl;external;
{$endif}
{ __GSL_PERMUTATION_H__  }

implementation


end.
