unit gtkcustomlayout;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkcustomlayout.h: Simple layout manager
 * Copyright 2019  GNOME Foundation
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
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtklayoutmanager.h>}

{*
 * GtkCustomRequestModeFunc:
 * @widget: the widget to be queried
 *
 * Queries a widget for its preferred size request mode.
 *
 * Returns: the size request mode
  }
type

  TGtkCustomRequestModeFunc = function (widget:PGtkWidget):TGtkSizeRequestMode;cdecl;
{*
 * GtkCustomMeasureFunc:
 * @widget: the widget to be measured
 * @orientation: the direction to be measured
 * @for_size: the size to be measured for
 * @minimum: (out): the measured minimum size of the widget
 * @natural: (out): the measured natural size of the widget
 * @minimum_baseline: (out): the measured minimum baseline of the widget
 * @natural_baseline: (out): the measured natural baseline of the widget
 *
 * A function to be used by `GtkCustomLayout` to measure a widget.
  }

  TGtkCustomMeasureFunc = procedure (widget:PGtkWidget; orientation:TGtkOrientation; for_size:longint; minimum:Plongint; natural:Plongint; 
                minimum_baseline:Plongint; natural_baseline:Plongint);cdecl;
{*
 * GtkCustomAllocateFunc:
 * @widget: the widget to allocate
 * @width: the new width of the widget
 * @height: the new height of the widget
 * @baseline: the new baseline of the widget, or -1
 *
 * A function to be used by `GtkCustomLayout` to allocate a widget.
  }

  TGtkCustomAllocateFunc = procedure (widget:PGtkWidget; width:longint; height:longint; baseline:longint);cdecl;
{G_DECLARE_FINAL_TYPE (GtkCustomLayout, gtk_custom_layout, GTK, CUSTOM_LAYOUT, GtkLayoutManager) }

function gtk_custom_layout_new(request_mode:TGtkCustomRequestModeFunc; measure:TGtkCustomMeasureFunc; allocate:TGtkCustomAllocateFunc):PGtkLayoutManager;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:08:24 ===

function GTK_TYPE_CUSTOM_LAYOUT: TGType;
function GTK_CUSTOM_LAYOUT(obj: Pointer): PGtkCustomLayout;
function GTK_IS_CUSTOM_LAYOUT(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_CUSTOM_LAYOUT: TGType;
begin
  Result := gtk_custom_layout_get_type;
end;

function GTK_CUSTOM_LAYOUT(obj: Pointer): PGtkCustomLayout;
begin
  Result := PGtkCustomLayout(g_type_check_instance_cast(obj, GTK_TYPE_CUSTOM_LAYOUT));
end;

function GTK_IS_CUSTOM_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CUSTOM_LAYOUT);
end;

type 
  PGtkCustomLayout = type Pointer;

  TGtkCustomLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PGtkCustomLayoutClass = ^TGtkCustomLayoutClass;

function gtk_custom_layout_get_type: TGType; cdecl; external libgxxxxxxx;



end.
