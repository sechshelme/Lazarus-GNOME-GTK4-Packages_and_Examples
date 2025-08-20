
unit gsl_block_ushort;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_block_ushort.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_block_ushort.h
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
Pgsl_block_ushort  = ^gsl_block_ushort;
Pgsl_block_ushort_struct  = ^gsl_block_ushort_struct;
Pword  = ^word;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ block/gsl_block_ushort.h
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
{$ifndef __GSL_BLOCK_USHORT_H__}
{$define __GSL_BLOCK_USHORT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_errno.h>}
type
  Pgsl_block_ushort_struct = ^Tgsl_block_ushort_struct;
  Tgsl_block_ushort_struct = record
      size : Tsize_t;
      data : Pword;
    end;

  Tgsl_block_ushort_struct = Tgsl_block_ushort;
(* Const before type ignored *)

function gsl_block_ushort_alloc(n:Tsize_t):Pgsl_block_ushort;cdecl;external;
(* Const before type ignored *)
function gsl_block_ushort_calloc(n:Tsize_t):Pgsl_block_ushort;cdecl;external;
procedure gsl_block_ushort_free(b:Pgsl_block_ushort);cdecl;external;
function gsl_block_ushort_fread(stream:PFILE; b:Pgsl_block_ushort):longint;cdecl;external;
(* Const before type ignored *)
function gsl_block_ushort_fwrite(stream:PFILE; b:Pgsl_block_ushort):longint;cdecl;external;
function gsl_block_ushort_fscanf(stream:PFILE; b:Pgsl_block_ushort):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_ushort_fprintf(stream:PFILE; b:Pgsl_block_ushort; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_ushort_raw_fread(stream:PFILE; b:Pword; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_ushort_raw_fwrite(stream:PFILE; b:Pword; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_ushort_raw_fscanf(stream:PFILE; b:Pword; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_ushort_raw_fprintf(stream:PFILE; b:Pword; n:Tsize_t; stride:Tsize_t; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_block_ushort_size(b:Pgsl_block_ushort):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_block_ushort_data(b:Pgsl_block_ushort):Pword;cdecl;external;
{$endif}
{ __GSL_BLOCK_USHORT_H__  }

implementation


end.
