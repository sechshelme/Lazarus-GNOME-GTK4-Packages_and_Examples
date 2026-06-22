
unit ghostutils;
interface

{
  Automatically converted by H2Pas 1.0.0 from ghostutils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ghostutils.h
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


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 2008 Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_HOST_UTILS_H__}
{$define __G_HOST_UTILS_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
(* Const before type ignored *)

function g_hostname_is_non_ascii(hostname:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_hostname_is_ascii_encoded(hostname:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_hostname_is_ip_address(hostname:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_hostname_to_ascii(hostname:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_hostname_to_unicode(hostname:Pgchar):Pgchar;cdecl;external;
{$endif}
{ __G_HOST_UTILS_H__  }

implementation


end.
