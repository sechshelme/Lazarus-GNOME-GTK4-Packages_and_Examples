
unit eina_fnmatch;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_fnmatch.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_fnmatch.h
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
PEina_Fnmatch_Flags  = ^Eina_Fnmatch_Flags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2021 Vincent Torri
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef	EINA_FNMATCH_H}
{$define EINA_FNMATCH_H}
type
  PEina_Fnmatch_Flags = ^TEina_Fnmatch_Flags;
  TEina_Fnmatch_Flags =  Longint;
  Const
    EINA_FNMATCH_PATHNAME = 1 shl 0;
    EINA_FNMATCH_NOESCAPE = 1 shl 1;
    EINA_FNMATCH_PERIOD = 1 shl 2;
    EINA_FNMATCH_LEADING_DIR = 1 shl 3;
    EINA_FNMATCH_CASEFOLD = 1 shl 4;
    EINA_FNMATCH_FILE_NAME = EINA_FNMATCH_PATHNAME;
;
(* Const before type ignored *)
(* Const before type ignored *)

function eina_fnmatch(glob:Pchar; _string:Pchar; flags:TEina_Fnmatch_Flags):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
