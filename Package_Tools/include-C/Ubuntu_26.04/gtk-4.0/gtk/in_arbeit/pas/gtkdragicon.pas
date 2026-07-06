unit gtkdragicon;

interface

uses
  fp_glib2, fp_gtk4;

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

{G_DECLARE_FINAL_TYPE (GtkDragIcon, gtk_drag_icon, GTK, DRAG_ICON, GtkWidget) }
function gtk_drag_icon_get_for_drag(drag:PGdkDrag):PGtkWidget;cdecl;external libgtk4;
procedure gtk_drag_icon_set_child(self:PGtkDragIcon; child:PGtkWidget);cdecl;external libgtk4;
function gtk_drag_icon_get_child(self:PGtkDragIcon):PGtkWidget;cdecl;external libgtk4;
procedure gtk_drag_icon_set_from_paintable(drag:PGdkDrag; paintable:PGdkPaintable; hot_x:longint; hot_y:longint);cdecl;external libgtk4;
function gtk_drag_icon_create_widget_for_value(value:PGValue):PGtkWidget;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:07:56 ===

function GTK_TYPE_DRAG_ICON: TGType;
function GTK_DRAG_ICON(obj: Pointer): PGtkDragIcon;
function GTK_IS_DRAG_ICON(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_DRAG_ICON: TGType;
begin
  Result := gtk_drag_icon_get_type;
end;

function GTK_DRAG_ICON(obj: Pointer): PGtkDragIcon;
begin
  Result := PGtkDragIcon(g_type_check_instance_cast(obj, GTK_TYPE_DRAG_ICON));
end;

function GTK_IS_DRAG_ICON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_DRAG_ICON);
end;

type 
  PGtkDragIcon = type Pointer;

  TGtkDragIconClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkDragIconClass = ^TGtkDragIconClass;

function gtk_drag_icon_get_type: TGType; cdecl; external libgxxxxxxx;



end.
