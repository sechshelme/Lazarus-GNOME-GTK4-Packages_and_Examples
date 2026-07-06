unit gtkwidgetpaintable;

interface

uses
  fp_glib2, fp_gtk4;

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

{G_DECLARE_FINAL_TYPE (GtkWidgetPaintable, gtk_widget_paintable, GTK, WIDGET_PAINTABLE, GObject) }
function gtk_widget_paintable_new(widget:PGtkWidget):PGdkPaintable;cdecl;external libgtk4;
function gtk_widget_paintable_get_widget(self:PGtkWidgetPaintable):PGtkWidget;cdecl;external libgtk4;
procedure gtk_widget_paintable_set_widget(self:PGtkWidgetPaintable; widget:PGtkWidget);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:18:01 ===

function GTK_TYPE_WIDGET_PAINTABLE: TGType;
function GTK_WIDGET_PAINTABLE(obj: Pointer): PGtkWidgetPaintable;
function GTK_IS_WIDGET_PAINTABLE(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_WIDGET_PAINTABLE: TGType;
begin
  Result := gtk_widget_paintable_get_type;
end;

function GTK_WIDGET_PAINTABLE(obj: Pointer): PGtkWidgetPaintable;
begin
  Result := PGtkWidgetPaintable(g_type_check_instance_cast(obj, GTK_TYPE_WIDGET_PAINTABLE));
end;

function GTK_IS_WIDGET_PAINTABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_WIDGET_PAINTABLE);
end;

type 
  PGtkWidgetPaintable = type Pointer;

  TGtkWidgetPaintableClass = record
    parent_class: TGObjectClass;
  end;
  PGtkWidgetPaintableClass = ^TGtkWidgetPaintableClass;

function gtk_widget_paintable_get_type: TGType; cdecl; external libgxxxxxxx;



end.
