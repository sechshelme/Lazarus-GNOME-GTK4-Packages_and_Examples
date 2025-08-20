
unit gsl_block_short;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_block_short.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_block_short.h
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
Pgsl_block_short  = ^gsl_block_short;
Pgsl_block_short_struct  = ^gsl_block_short_struct;
Psmallint  = ^smallint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ block/gsl_block_short.h
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
{$ifndef __GSL_BLOCK_SHORT_H__}
{$define __GSL_BLOCK_SHORT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_errno.h>}
type
  Pgsl_block_short_struct = ^Tgsl_block_short_struct;
  Tgsl_block_short_struct = record
      size : Tsize_t;
      data : Psmallint;
    end;

  Tgsl_block_short_struct = Tgsl_block_short;
(* Const before type ignored *)

function gsl_block_short_alloc(n:Tsize_t):Pgsl_block_short;cdecl;external;
(* Const before type ignored *)
function gsl_block_short_calloc(n:Tsize_t):Pgsl_block_short;cdecl;external;
procedure gsl_block_short_free(b:Pgsl_block_short);cdecl;external;
function gsl_block_short_fread(stream:PFILE; b:Pgsl_block_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_block_short_fwrite(stream:PFILE; b:Pgsl_block_short):longint;cdecl;external;
function gsl_block_short_fscanf(stream:PFILE; b:Pgsl_block_short):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_short_fprintf(stream:PFILE; b:Pgsl_block_short; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_short_raw_fread(stream:PFILE; b:Psmallint; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_short_raw_fwrite(stream:PFILE; b:Psmallint; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_short_raw_fscanf(stream:PFILE; b:Psmallint; n:Tsize_t; stride:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_block_short_raw_fprintf(stream:PFILE; b:Psmallint; n:Tsize_t; stride:Tsize_t; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gsl_block_short_size(b:Pgsl_block_short):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_block_short_data(b:Pgsl_block_short):Psmallint;cdecl;external;
{$endif}
{ __GSL_BLOCK_SHORT_H__  }

implementation


end.
