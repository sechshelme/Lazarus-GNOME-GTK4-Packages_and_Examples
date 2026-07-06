
unit gtkwidgetpaintable;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkwidgetpaintable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkwidgetpaintable.h
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
PGdkPaintable  = ^GdkPaintable;
PGtkWidget  = ^GtkWidget;
PGtkWidgetPaintable  = ^GtkWidgetPaintable;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2018 Benjamin Otte
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
{$include <gtk/gtktypes.h>}

{ was #define dname def_expr }
function GTK_TYPE_WIDGET_PAINTABLE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkWidgetPaintable, gtk_widget_paintable, GTK, WIDGET_PAINTABLE, GObject) }
function gtk_widget_paintable_new(widget:PGtkWidget):PGdkPaintable;cdecl;external;
function gtk_widget_paintable_get_widget(self:PGtkWidgetPaintable):PGtkWidget;cdecl;external;
procedure gtk_widget_paintable_set_widget(self:PGtkWidgetPaintable; widget:PGtkWidget);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_WIDGET_PAINTABLE : longint; { return type might be wrong }
  begin
    GTK_TYPE_WIDGET_PAINTABLE:=gtk_widget_paintable_get_type;
  end;


end.
