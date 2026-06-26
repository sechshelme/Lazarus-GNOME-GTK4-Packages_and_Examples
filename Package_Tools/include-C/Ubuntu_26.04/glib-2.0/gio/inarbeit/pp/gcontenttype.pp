
unit gcontenttype;
interface

{
  Automatically converted by H2Pas 1.0.0 from gcontenttype.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gcontenttype.h
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
Pgboolean  = ^gboolean;
Pgchar  = ^gchar;
PGFile  = ^GFile;
PGIcon  = ^GIcon;
PGList  = ^GList;
Pguchar  = ^guchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
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
 *
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_CONTENT_TYPE_H__}
{$define __G_CONTENT_TYPE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
(* Const before type ignored *)
(* Const before type ignored *)

function g_content_type_equals(type1:Pgchar; type2:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_content_type_is_a(_type:Pgchar; supertype:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_content_type_is_mime_type(_type:Pgchar; mime_type:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_content_type_is_unknown(_type:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_content_type_get_description(_type:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_content_type_get_mime_type(_type:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_content_type_get_icon(_type:Pgchar):PGIcon;cdecl;external;
(* Const before type ignored *)
function g_content_type_get_symbolic_icon(_type:Pgchar):PGIcon;cdecl;external;
(* Const before type ignored *)
function g_content_type_get_generic_icon_name(_type:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_content_type_can_be_executable(_type:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_content_type_from_mime_type(mime_type:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_content_type_guess(filename:Pgchar; data:Pguchar; data_size:Tgsize; result_uncertain:Pgboolean):Pgchar;cdecl;external;
function g_content_type_guess_for_tree(root:PGFile):^Pgchar;cdecl;external;
function g_content_types_get_registered:PGList;cdecl;external;
{< private > }
{$ifndef __GTK_DOC_IGNORE__}
(* Const before type ignored *)
(* Const before declarator ignored *)

function g_content_type_get_mime_dirs:^Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure g_content_type_set_mime_dirs(dirs:PPgchar);cdecl;external;
{$endif}
{ __GTK_DOC_IGNORE__  }
{$endif}
{ __G_CONTENT_TYPE_H__  }

implementation


end.
