
unit grefstring;
interface

{
  Automatically converted by H2Pas 1.0.0 from grefstring.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    grefstring.h
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
PGRefString  = ^GRefString;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ grefstring.h: Reference counted strings
 *
 * Copyright 2018  Emmanuele Bassi
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$include "gmem.h"}
{$include "gmacros.h"}
(* Const before type ignored *)

function g_ref_string_new(str:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function g_ref_string_new_len(str:Pchar; len:Tgssize):Pchar;cdecl;external;
(* Const before type ignored *)
function g_ref_string_new_intern(str:Pchar):Pchar;cdecl;external;
function g_ref_string_acquire(str:Pchar):Pchar;cdecl;external;
procedure g_ref_string_release(str:Pchar);cdecl;external;
function g_ref_string_length(str:Pchar):Tgsize;cdecl;external;
{*
 * GRefString:
 *
 * A typedef for a reference-counted string. A pointer to a #GRefString can be
 * treated like a standard `char*` array by all code, but can additionally have
 * `g_ref_string_*()` methods called on it. `g_ref_string_*()` methods cannot be
 * called on `char*` arrays not allocated using g_ref_string_new().
 *
 * If using #GRefString with autocleanups, g_autoptr() must be used rather than
 * g_autofree(), so that the reference counting metadata is also freed.
 *
 * Since: 2.58
  }
type
  PGRefString = ^TGRefString;
  TGRefString = char;
(* Const before type ignored *)
(* Const before type ignored *)

function g_ref_string_equal(str1:Pchar; str2:Pchar):Tgboolean;cdecl;external;

implementation


end.
