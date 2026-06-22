
unit gatomic;
interface

{
  Automatically converted by H2Pas 1.0.0 from gatomic.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gatomic.h
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
Pgint  = ^gint;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2011 Ryan Lortie
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_ATOMIC_H__}
{$define __G_ATOMIC_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
{$include <glib/glib-typeof.h>}
(* Const before type ignored *)

function g_atomic_int_get(atomic:Pgint):Tgint;cdecl;external;
procedure g_atomic_int_set(atomic:Pgint; newval:Tgint);cdecl;external;
procedure g_atomic_int_inc(atomic:Pgint);cdecl;external;
function g_atomic_int_dec_and_test(atomic:Pgint):Tgboolean;cdecl;external;
function g_atomic_int_compare_and_exchange(atomic:Pgint; oldval:Tgint; newval:Tgint):Tgboolean;cdecl;external;
function g_atomic_int_compare_and_exchange_full(atomic:Pgint; oldval:Tgint; newval:Tgint; preval:Pgint):Tgboolean;cdecl;external;
function g_atomic_int_exchange(atomic:Pgint; newval:Tgint):Tgint;cdecl;external;
function g_atomic_int_add(atomic:Pgint; val:Tgint):Tgint;cdecl;external;
function g_atomic_int_and(atomic:Pguint; val:Tguint):Tguint;cdecl;external;
function g_atomic_int_or(atomic:Pguint; val:Tguint):Tguint;cdecl;external;
function g_atomic_int_xor(atomic:Pguint; val:Tguint):Tguint;cdecl;external;
(* Const before type ignored *)
function g_atomic_pointer_get(atomic:pointer):Tgpointer;cdecl;external;
procedure g_atomic_pointer_set(atomic:pointer; newval:Tgpointer);cdecl;external;
function g_atomic_pointer_compare_and_exchange(atomic:pointer; oldval:Tgpointer; newval:Tgpointer):Tgboolean;cdecl;external;
function g_atomic_pointer_compare_and_exchange_full(atomic:pointer; oldval:Tgpointer; newval:Tgpointer; preval:pointer):Tgboolean;cdecl;external;
function g_atomic_pointer_exchange(atomic:pointer; newval:Tgpointer):Tgpointer;cdecl;external;
function g_atomic_pointer_add(atomic:pointer; val:Tgssize):Tgintptr;cdecl;external;
function g_atomic_pointer_and(atomic:pointer; val:Tgsize):Tguintptr;cdecl;external;
function g_atomic_pointer_or(atomic:pointer; val:Tgsize):Tguintptr;cdecl;external;
function g_atomic_pointer_xor(atomic:pointer; val:Tgsize):Tguintptr;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_30_FOR(g_atomic_int_add) }
function g_atomic_int_exchange_and_add(atomic:Pgint; val:Tgint):Tgint;cdecl;external;

implementation


end.
