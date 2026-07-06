
unit gtkiconpaintable;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkiconpaintable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkiconpaintable.h
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
PGFile  = ^GFile;
PGtkIconPaintable  = ^GtkIconPaintable;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GtkIconPaintable
 * gtkiconpaintable.h Copyright (C) 2002, 2003 Red Hat, Inc.
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
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/gtkenums.h>}

{ was #define dname def_expr }
function GTK_TYPE_ICON_PAINTABLE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkIconPaintable, gtk_icon_paintable, GTK, ICON_PAINTABLE, GObject) }
function gtk_icon_paintable_new_for_file(file:PGFile; size:longint; scale:longint):PGtkIconPaintable;cdecl;external;
function gtk_icon_paintable_get_file(self:PGtkIconPaintable):PGFile;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_20 }
(* Const before type ignored *)
function gtk_icon_paintable_get_icon_name(self:PGtkIconPaintable):Pchar;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_20 }
function gtk_icon_paintable_is_symbolic(self:PGtkIconPaintable):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_ICON_PAINTABLE : longint; { return type might be wrong }
  begin
    GTK_TYPE_ICON_PAINTABLE:=gtk_icon_paintable_get_type;
  end;


end.
