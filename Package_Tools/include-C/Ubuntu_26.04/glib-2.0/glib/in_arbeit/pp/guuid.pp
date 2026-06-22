
unit guuid;
interface

{
  Automatically converted by H2Pas 1.0.0 from guuid.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    guuid.h
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
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ guuid.h - UUID functions
 *
 * Copyright (C) 2013-2015, 2017 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of the
 * licence, or (at your option) any later version.
 *
 * This is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301
 * USA.
 *
 * Authors: Marc-André Lureau <marcandre.lureau@redhat.com>
  }
{$ifndef __G_UUID_H__}
{$define __G_UUID_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
(* Const before type ignored *)

function g_uuid_string_is_valid(str:Pgchar):Tgboolean;cdecl;external;
function g_uuid_string_random:Pgchar;cdecl;external;
{$endif}
{ __G_UUID_H__  }

implementation


end.
