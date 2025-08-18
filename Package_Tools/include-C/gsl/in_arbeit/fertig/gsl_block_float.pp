
unit gsl_block_float;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_block_float.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_block_float.h
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
Pgsl_block_float  = ^gsl_block_float;
Pgsl_block_float_struct  = ^gsl_block_float_struct;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ block/gsl_block_float.h
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
{$ifndef __GSL_BLOCK_FLOAT_H__}
{$define __GSL_BLOCK_FLOAT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_errno.h>}
type
  Pgsl_block_float_struct = ^Tgsl_block_float_struct;
  Tgsl_block_float_struct = record
      size : Tsize_t;
      data : Psingle;
    end;

  Tgsl_block_float_struct = Tgsl_block_float;
(* Const before type ignored *)

function gsl_block_float_alloc(n:Tsize_t):Pgsl_block_float;cdecl;external;
(* Const before type ignored *)
function gsl_block_float_calloc(n:Tsize_t):Pgsl_block_float;cdecl;external;
procedure gsl_block_float_free(b:Pgsl_block_float);cdecl;external;
function gsl_block_float_fread(stream:PFILE; b:Pgsl_block_float):longint;cdecl;external;
(* Const before type ignored *)
function gsl_block_float_fwrite(stream:PFILE; b:Pgsl_block_float):longint;cdecl;external;
function gsl_block_float_fscanf(stream:PFILE; b:Pgsl_block_float):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_float_fprintf(stream:PFILE; b:Pgsl_block_float; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_float_raw_fread(stream:PFILE; b:Psingle; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_float_raw_fwrite(stream:PFILE; b:Psingle; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_float_raw_fscanf(stream:PFILE; b:Psingle; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_float_raw_fprintf(stream:PFILE; b:Psingle; n:Tsize_t; stride:Tsize_t; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_block_float_size(b:Pgsl_block_float):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_block_float_data(b:Pgsl_block_float):Psingle;cdecl;external;
{$endif}
{ __GSL_BLOCK_FLOAT_H__  }

implementation


end.
