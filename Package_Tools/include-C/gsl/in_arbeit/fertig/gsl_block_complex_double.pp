
unit gsl_block_complex_double;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_block_complex_double.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_block_complex_double.h
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
PFILE  = ^FILE;
Pgsl_block_complex  = ^gsl_block_complex;
Pgsl_block_complex_struct  = ^gsl_block_complex_struct;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ block/gsl_block_complex_double.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Gerard Jungman, Brian Gough
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
{$ifndef __GSL_BLOCK_COMPLEX_DOUBLE_H__}
{$define __GSL_BLOCK_COMPLEX_DOUBLE_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_errno.h>}
type
  Pgsl_block_complex_struct = ^Tgsl_block_complex_struct;
  Tgsl_block_complex_struct = record
      size : Tsize_t;
      data : Pdouble;
    end;

  Tgsl_block_complex_struct = Tgsl_block_complex;
(* Const before type ignored *)

function gsl_block_complex_alloc(n:Tsize_t):Pgsl_block_complex;cdecl;external;
(* Const before type ignored *)
function gsl_block_complex_calloc(n:Tsize_t):Pgsl_block_complex;cdecl;external;
procedure gsl_block_complex_free(b:Pgsl_block_complex);cdecl;external;
function gsl_block_complex_fread(stream:PFILE; b:Pgsl_block_complex):longint;cdecl;external;
(* Const before type ignored *)
function gsl_block_complex_fwrite(stream:PFILE; b:Pgsl_block_complex):longint;cdecl;external;
function gsl_block_complex_fscanf(stream:PFILE; b:Pgsl_block_complex):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_complex_fprintf(stream:PFILE; b:Pgsl_block_complex; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_complex_raw_fread(stream:PFILE; b:Pdouble; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_complex_raw_fwrite(stream:PFILE; b:Pdouble; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_complex_raw_fscanf(stream:PFILE; b:Pdouble; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_complex_raw_fprintf(stream:PFILE; b:Pdouble; n:Tsize_t; stride:Tsize_t; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_block_complex_size(b:Pgsl_block_complex):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_block_complex_data(b:Pgsl_block_complex):Pdouble;cdecl;external;
{$endif}
{ __GSL_BLOCK_COMPLEX_DOUBLE_H__  }

implementation


end.
