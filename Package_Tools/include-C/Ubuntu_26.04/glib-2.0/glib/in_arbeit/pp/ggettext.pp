
unit ggettext;
interface

{
  Automatically converted by H2Pas 1.0.0 from ggettext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ggettext.h
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
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
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
{
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
  }
{$ifndef __G_GETTEXT_H__}
{$define __G_GETTEXT_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function g_strip_context(msgid:Pgchar; msgval:Pgchar):Pgchar;cdecl;external;
{(1); }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_dgettext(domain:Pgchar; msgid:Pgchar):Pgchar;cdecl;external;
{(2); }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_dcgettext(domain:Pgchar; msgid:Pgchar; category:Tgint):Pgchar;cdecl;external;
{(2); }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_dngettext(domain:Pgchar; msgid:Pgchar; msgid_plural:Pgchar; n:Tgulong):Pgchar;cdecl;external;
{(3); }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_dpgettext(domain:Pgchar; msgctxtid:Pgchar; msgidoffset:Tgsize):Pgchar;cdecl;external;
{(2); }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_dpgettext2(domain:Pgchar; context:Pgchar; msgid:Pgchar):Pgchar;cdecl;external;
{(3); }
{$endif}
{ __G_GETTEXT_H__  }

implementation


end.
