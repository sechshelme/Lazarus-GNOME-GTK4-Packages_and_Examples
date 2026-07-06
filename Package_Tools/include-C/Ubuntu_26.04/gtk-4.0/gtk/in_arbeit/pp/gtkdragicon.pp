
unit gtkdragicon;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkdragicon.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkdragicon.h
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
PGdkDrag  = ^GdkDrag;
PGdkPaintable  = ^GdkPaintable;
PGtkDragIcon  = ^GtkDragIcon;
PGtkWidget  = ^GtkWidget;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020 Matthias Clasen
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gio/gio.h>}
{$include <gtk/gtkwidget.h>}

{ was #define dname def_expr }
function GTK_TYPE_DRAG_ICON : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkDragIcon, gtk_drag_icon, GTK, DRAG_ICON, GtkWidget) }
function gtk_drag_icon_get_for_drag(drag:PGdkDrag):PGtkWidget;cdecl;external;
procedure gtk_drag_icon_set_child(self:PGtkDragIcon; child:PGtkWidget);cdecl;external;
function gtk_drag_icon_get_child(self:PGtkDragIcon):PGtkWidget;cdecl;external;
procedure gtk_drag_icon_set_from_paintable(drag:PGdkDrag; paintable:PGdkPaintable; hot_x:longint; hot_y:longint);cdecl;external;
(* Const before type ignored *)
function gtk_drag_icon_create_widget_for_value(value:PGValue):PGtkWidget;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_DRAG_ICON : longint; { return type might be wrong }
  begin
    GTK_TYPE_DRAG_ICON:=gtk_drag_icon_get_type;
  end;


end.
