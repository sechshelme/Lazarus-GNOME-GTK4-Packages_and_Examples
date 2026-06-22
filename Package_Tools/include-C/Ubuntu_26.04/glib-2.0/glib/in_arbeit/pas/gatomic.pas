unit gatomic;

interface

uses
  common_GLIB, gtypes;

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

function g_atomic_int_get(atomic:Pgint):Tgint;cdecl;external libglib2;
procedure g_atomic_int_set(atomic:Pgint; newval:Tgint);cdecl;external libglib2;
procedure g_atomic_int_inc(atomic:Pgint);cdecl;external libglib2;
function g_atomic_int_dec_and_test(atomic:Pgint):Tgboolean;cdecl;external libglib2;
function g_atomic_int_compare_and_exchange(atomic:Pgint; oldval:Tgint; newval:Tgint):Tgboolean;cdecl;external libglib2;
function g_atomic_int_compare_and_exchange_full(atomic:Pgint; oldval:Tgint; newval:Tgint; preval:Pgint):Tgboolean;cdecl;external libglib2;
function g_atomic_int_exchange(atomic:Pgint; newval:Tgint):Tgint;cdecl;external libglib2;
function g_atomic_int_add(atomic:Pgint; val:Tgint):Tgint;cdecl;external libglib2;
function g_atomic_int_and(atomic:Pguint; val:Tguint):Tguint;cdecl;external libglib2;
function g_atomic_int_or(atomic:Pguint; val:Tguint):Tguint;cdecl;external libglib2;
function g_atomic_int_xor(atomic:Pguint; val:Tguint):Tguint;cdecl;external libglib2;
function g_atomic_pointer_get(atomic:pointer):Tgpointer;cdecl;external libglib2;
procedure g_atomic_pointer_set(atomic:pointer; newval:Tgpointer);cdecl;external libglib2;
function g_atomic_pointer_compare_and_exchange(atomic:pointer; oldval:Tgpointer; newval:Tgpointer):Tgboolean;cdecl;external libglib2;
function g_atomic_pointer_compare_and_exchange_full(atomic:pointer; oldval:Tgpointer; newval:Tgpointer; preval:pointer):Tgboolean;cdecl;external libglib2;
function g_atomic_pointer_exchange(atomic:pointer; newval:Tgpointer):Tgpointer;cdecl;external libglib2;
function g_atomic_pointer_add(atomic:pointer; val:Tgssize):Tgintptr;cdecl;external libglib2;
function g_atomic_pointer_and(atomic:pointer; val:Tgsize):Tguintptr;cdecl;external libglib2;
function g_atomic_pointer_or(atomic:pointer; val:Tgsize):Tguintptr;cdecl;external libglib2;
function g_atomic_pointer_xor(atomic:pointer; val:Tgsize):Tguintptr;cdecl;external libglib2;
{xxxxxGLIB_DEPRECATED_IN_2_30_FOR(g_atomic_int_add) }
function g_atomic_int_exchange_and_add(atomic:Pgint; val:Tgint):Tgint;cdecl;external libglib2;

// === Konventiert am: 22-6-26 16:00:46 ===


implementation



end.
