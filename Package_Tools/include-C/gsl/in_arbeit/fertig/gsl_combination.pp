
unit gsl_combination;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_combination.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_combination.h
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
Pgsl_combination  = ^gsl_combination;
Pgsl_combination_struct  = ^gsl_combination_struct;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ combination/gsl_combination.h
 * based on permutation/gsl_permutation.h by Brian Gough
 * 
 * Copyright (C) 2001 Szymon Jaroszewicz
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
{$ifndef __GSL_COMBINATION_H__}
{$define __GSL_COMBINATION_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
type
  Pgsl_combination_struct = ^Tgsl_combination_struct;
  Tgsl_combination_struct = record
      n : Tsize_t;
      k : Tsize_t;
      data : Psize_t;
    end;

  Tgsl_combination_struct = Tgsl_combination;
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_combination_alloc(n:Tsize_t; k:Tsize_t):Pgsl_combination;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_combination_calloc(n:Tsize_t; k:Tsize_t):Pgsl_combination;cdecl;external;
procedure gsl_combination_init_first(c:Pgsl_combination);cdecl;external;
procedure gsl_combination_init_last(c:Pgsl_combination);cdecl;external;
procedure gsl_combination_free(c:Pgsl_combination);cdecl;external;
(* Const before type ignored *)
function gsl_combination_memcpy(dest:Pgsl_combination; src:Pgsl_combination):longint;cdecl;external;
function gsl_combination_fread(stream:PFILE; c:Pgsl_combination):longint;cdecl;external;
(* Const before type ignored *)
function gsl_combination_fwrite(stream:PFILE; c:Pgsl_combination):longint;cdecl;external;
function gsl_combination_fscanf(stream:PFILE; c:Pgsl_combination):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_combination_fprintf(stream:PFILE; c:Pgsl_combination; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_combination_n(c:Pgsl_combination):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_combination_k(c:Pgsl_combination):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_combination_data(c:Pgsl_combination):Psize_t;cdecl;external;
function gsl_combination_valid(c:Pgsl_combination):longint;cdecl;external;
function gsl_combination_next(c:Pgsl_combination):longint;cdecl;external;
function gsl_combination_prev(c:Pgsl_combination):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_combination_get(c:Pgsl_combination; i:Tsize_t):Tsize_t;cdecl;external;
{$endif}
{ __GSL_COMBINATION_H__  }

implementation


end.
