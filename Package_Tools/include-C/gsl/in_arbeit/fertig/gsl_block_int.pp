
unit gsl_block_int;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_block_int.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_block_int.h
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
Pgsl_block_int  = ^gsl_block_int;
Pgsl_block_int_struct  = ^gsl_block_int_struct;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ block/gsl_block_int.h
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
{$ifndef __GSL_BLOCK_INT_H__}
{$define __GSL_BLOCK_INT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_errno.h>}
type
  Pgsl_block_int_struct = ^Tgsl_block_int_struct;
  Tgsl_block_int_struct = record
      size : Tsize_t;
      data : Plongint;
    end;

  Tgsl_block_int_struct = Tgsl_block_int;
(* Const before type ignored *)

function gsl_block_int_alloc(n:Tsize_t):Pgsl_block_int;cdecl;external;
(* Const before type ignored *)
function gsl_block_int_calloc(n:Tsize_t):Pgsl_block_int;cdecl;external;
procedure gsl_block_int_free(b:Pgsl_block_int);cdecl;external;
function gsl_block_int_fread(stream:PFILE; b:Pgsl_block_int):longint;cdecl;external;
(* Const before type ignored *)
function gsl_block_int_fwrite(stream:PFILE; b:Pgsl_block_int):longint;cdecl;external;
function gsl_block_int_fscanf(stream:PFILE; b:Pgsl_block_int):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_int_fprintf(stream:PFILE; b:Pgsl_block_int; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_int_raw_fread(stream:PFILE; b:Plongint; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_int_raw_fwrite(stream:PFILE; b:Plongint; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_int_raw_fscanf(stream:PFILE; b:Plongint; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_int_raw_fprintf(stream:PFILE; b:Plongint; n:Tsize_t; stride:Tsize_t; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_block_int_size(b:Pgsl_block_int):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_block_int_data(b:Pgsl_block_int):Plongint;cdecl;external;
{$endif}
{ __GSL_BLOCK_INT_H__  }

implementation


end.
