
unit gdkrgba;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkrgba.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkrgba.h
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
PGdkRGBA  = ^GdkRGBA;
PGString  = ^GString;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}
type
  PGdkRGBA = ^TGdkRGBA;
  TGdkRGBA = record
      red : single;
      green : single;
      blue : single;
      alpha : single;
    end;


{ was #define dname def_expr }
function GDK_TYPE_RGBA : longint; { return type might be wrong }

function gdk_rgba_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gdk_rgba_copy(rgba:PGdkRGBA):PGdkRGBA;cdecl;external;
procedure gdk_rgba_free(rgba:PGdkRGBA);cdecl;external;
(* Const before type ignored *)
function gdk_rgba_is_clear(rgba:PGdkRGBA):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gdk_rgba_is_opaque(rgba:PGdkRGBA):Tgboolean;cdecl;external;
function gdk_rgba_hash(p:Tgconstpointer):Tguint;cdecl;external;
function gdk_rgba_equal(p1:Tgconstpointer; p2:Tgconstpointer):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gdk_rgba_parse(rgba:PGdkRGBA; spec:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gdk_rgba_to_string(rgba:PGdkRGBA):Pchar;cdecl;external;
(* Const before type ignored *)
function gdk_rgba_print(rgba:PGdkRGBA; _string:PGString):PGString;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkRGBA, gdk_rgba_free) }

implementation

{ was #define dname def_expr }
function GDK_TYPE_RGBA : longint; { return type might be wrong }
  begin
    GDK_TYPE_RGBA:=gdk_rgba_get_type;
  end;


end.
