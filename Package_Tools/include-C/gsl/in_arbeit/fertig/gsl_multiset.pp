
unit gsl_multiset;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_multiset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_multiset.h
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
Pgsl_multiset  = ^gsl_multiset;
Pgsl_multiset_struct  = ^gsl_multiset_struct;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ multiset/gsl_multiset.h
 * based on combination/gsl_combination.h by Szymon Jaroszewicz
 * based on permutation/gsl_permutation.h by Brian Gough
 *
 * Copyright (C) 2009 Rhys Ulerich
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
{$ifndef __GSL_MULTISET_H__}
{$define __GSL_MULTISET_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_errno.h>}
{$include <gsl/gsl_types.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_check_range.h>}
type
  Pgsl_multiset_struct = ^Tgsl_multiset_struct;
  Tgsl_multiset_struct = record
      n : Tsize_t;
      k : Tsize_t;
      data : Psize_t;
    end;

  Tgsl_multiset_struct = Tgsl_multiset;
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_multiset_alloc(n:Tsize_t; k:Tsize_t):Pgsl_multiset;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multiset_calloc(n:Tsize_t; k:Tsize_t):Pgsl_multiset;cdecl;external;
procedure gsl_multiset_init_first(c:Pgsl_multiset);cdecl;external;
procedure gsl_multiset_init_last(c:Pgsl_multiset);cdecl;external;
procedure gsl_multiset_free(c:Pgsl_multiset);cdecl;external;
(* Const before type ignored *)
function gsl_multiset_memcpy(dest:Pgsl_multiset; src:Pgsl_multiset):longint;cdecl;external;
function gsl_multiset_fread(stream:PFILE; c:Pgsl_multiset):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multiset_fwrite(stream:PFILE; c:Pgsl_multiset):longint;cdecl;external;
function gsl_multiset_fscanf(stream:PFILE; c:Pgsl_multiset):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multiset_fprintf(stream:PFILE; c:Pgsl_multiset; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multiset_n(c:Pgsl_multiset):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_multiset_k(c:Pgsl_multiset):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_multiset_data(c:Pgsl_multiset):Psize_t;cdecl;external;
function gsl_multiset_valid(c:Pgsl_multiset):longint;cdecl;external;
function gsl_multiset_next(c:Pgsl_multiset):longint;cdecl;external;
function gsl_multiset_prev(c:Pgsl_multiset):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multiset_get(c:Pgsl_multiset; i:Tsize_t):Tsize_t;cdecl;external;
{$endif}
{ __GSL_MULTISET_H__  }

implementation


end.
