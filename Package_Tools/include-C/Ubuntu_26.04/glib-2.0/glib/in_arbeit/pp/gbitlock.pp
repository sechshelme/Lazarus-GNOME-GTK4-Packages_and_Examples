
unit gbitlock;
interface

{
  Automatically converted by H2Pas 1.0.0 from gbitlock.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gbitlock.h
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
Pguintptr  = ^guintptr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2008 Ryan Lortie
 * Copyright © 2010 Codethink Limited
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
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_BITLOCK_H__}
{$define __G_BITLOCK_H__}
{$include <glib/gtypes.h>}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}

procedure g_bit_lock(address:Pgint; lock_bit:Tgint);cdecl;external;
procedure g_bit_lock_and_get(address:Pgint; lock_bit:Tguint; out_val:Pgint);cdecl;external;
function g_bit_trylock(address:Pgint; lock_bit:Tgint):Tgboolean;cdecl;external;
procedure g_bit_unlock(address:Pgint; lock_bit:Tgint);cdecl;external;
procedure g_bit_unlock_and_set(address:Pgint; lock_bit:Tguint; new_val:Tgint; preserve_mask:Tgint);cdecl;external;
procedure g_pointer_bit_lock(address:pointer; lock_bit:Tgint);cdecl;external;
procedure g_pointer_bit_lock_and_get(address:Tgpointer; lock_bit:Tguint; out_ptr:Pguintptr);cdecl;external;
function g_pointer_bit_trylock(address:pointer; lock_bit:Tgint):Tgboolean;cdecl;external;
procedure g_pointer_bit_unlock(address:pointer; lock_bit:Tgint);cdecl;external;
function g_pointer_bit_lock_mask_ptr(ptr:Tgpointer; lock_bit:Tguint; set:Tgboolean; preserve_mask:Tguintptr; preserve_ptr:Tgpointer):Tgpointer;cdecl;external;
procedure g_pointer_bit_unlock_and_set(address:pointer; lock_bit:Tguint; ptr:Tgpointer; preserve_mask:Tguintptr);cdecl;external;
{$endif}
{ __G_BITLOCK_H_  }

implementation


end.
