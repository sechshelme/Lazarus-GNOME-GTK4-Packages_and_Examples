
unit gsl_block_long_double;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_block_long_double.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_block_long_double.h
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
Pgsl_block_long_double  = ^gsl_block_long_double;
Pgsl_block_long_double_struct  = ^gsl_block_long_double_struct;
Plong_double  = ^long_double;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ block/gsl_block_long_double.h
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
{$ifndef __GSL_BLOCK_LONG_DOUBLE_H__}
{$define __GSL_BLOCK_LONG_DOUBLE_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_errno.h>}
type
  Pgsl_block_long_double_struct = ^Tgsl_block_long_double_struct;
  Tgsl_block_long_double_struct = record
      size : Tsize_t;
      data : Plong_double;
    end;

  Tgsl_block_long_double_struct = Tgsl_block_long_double;
(* Const before type ignored *)

function gsl_block_long_double_alloc(n:Tsize_t):Pgsl_block_long_double;cdecl;external;
(* Const before type ignored *)
function gsl_block_long_double_calloc(n:Tsize_t):Pgsl_block_long_double;cdecl;external;
procedure gsl_block_long_double_free(b:Pgsl_block_long_double);cdecl;external;
function gsl_block_long_double_fread(stream:PFILE; b:Pgsl_block_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_block_long_double_fwrite(stream:PFILE; b:Pgsl_block_long_double):longint;cdecl;external;
function gsl_block_long_double_fscanf(stream:PFILE; b:Pgsl_block_long_double):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_long_double_fprintf(stream:PFILE; b:Pgsl_block_long_double; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_long_double_raw_fread(stream:PFILE; b:Plong_double; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_long_double_raw_fwrite(stream:PFILE; b:Plong_double; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_long_double_raw_fscanf(stream:PFILE; b:Plong_double; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_long_double_raw_fprintf(stream:PFILE; b:Plong_double; n:Tsize_t; stride:Tsize_t; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_block_long_double_size(b:Pgsl_block_long_double):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_block_long_double_data(b:Pgsl_block_long_double):Plong_double;cdecl;external;
{$endif}
{ __GSL_BLOCK_LONG_DOUBLE_H__  }

implementation


end.
