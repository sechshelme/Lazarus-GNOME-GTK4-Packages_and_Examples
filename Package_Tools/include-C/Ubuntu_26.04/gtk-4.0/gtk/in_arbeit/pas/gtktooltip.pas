unit gtktooltip;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtktooltip.h
 *
 * Copyright (C) 2006-2007 Imendio AB
 * Contact: Kristian Rietveld <kris@imendio.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwindow.h>}

function gtk_tooltip_get_type:TGType;cdecl;external libgtk4;
procedure gtk_tooltip_set_markup(tooltip:PGtkTooltip; markup:Pchar);cdecl;external libgtk4;
procedure gtk_tooltip_set_text(tooltip:PGtkTooltip; text:Pchar);cdecl;external libgtk4;
procedure gtk_tooltip_set_icon(tooltip:PGtkTooltip; paintable:PGdkPaintable);cdecl;external libgtk4;
procedure gtk_tooltip_set_icon_from_icon_name(tooltip:PGtkTooltip; icon_name:Pchar);cdecl;external libgtk4;
procedure gtk_tooltip_set_icon_from_gicon(tooltip:PGtkTooltip; gicon:PGIcon);cdecl;external libgtk4;
procedure gtk_tooltip_set_custom(tooltip:PGtkTooltip; custom_widget:PGtkWidget);cdecl;external libgtk4;
procedure gtk_tooltip_set_tip_area(tooltip:PGtkTooltip; rect:PGdkRectangle);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTooltip, g_object_unref) }

// === Konventiert am: 6-7-26 17:00:02 ===

function GTK_TYPE_TOOLTIP : TGType;
function GTK_TOOLTIP(obj : PGtkTooltip) : longint;
function GTK_IS_TOOLTIP(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_TOOLTIP : TGType;
  begin
    GTK_TYPE_TOOLTIP:=gtk_tooltip_get_type;
  end;

function GTK_TOOLTIP(obj : PGtkTooltip) : longint;
begin
  Result := PGtkTooltip(g_type_check_class_cast(klass, GTK_TYPE_TOOLTIP));
end;

function GTK_IS_TOOLTIP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_TOOLTIP);
end;



end.
