unit gtklayoutmanager;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtklayoutmanager.h: Layout manager base class
 * Copyright 2019  The GNOME Foundation
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
 * Author: Emmanuele Bassi
  }
(** unsupported pragma#pragma once*)
{$include <gsk/gsk.h>}
{$include <gtk/gtktypes.h>}
{$include <gtk/gtkwidget.h>}
{$include <gtk/gtklayoutchild.h>}

{ G_DECLARE_DERIVABLE_TYPE (GtkLayoutManager, gtk_layout_manager, GTK, LAYOUT_MANAGER, GObject) }
{*
 * GtkLayoutManagerClass:
 * @get_request_mode: a virtual function, used to return the preferred
 *   request mode for the layout manager; for instance, "width for height"
 *   or "height for width"; see `GtkSizeRequestMode`
 * @measure: a virtual function, used to measure the minimum and preferred
 *   sizes of the widget using the layout manager for a given orientation
 * @allocate: a virtual function, used to allocate the size of the widget
 *   using the layout manager
 * @layout_child_type: the type of `GtkLayoutChild` used by this layout manager
 * @create_layout_child: a virtual function, used to create a `GtkLayoutChild`
 *   meta object for the layout properties
 * @root: a virtual function, called when the widget using the layout
 *   manager is attached to a `GtkRoot`
 * @unroot: a virtual function, called when the widget using the layout
 *   manager is detached from a `GtkRoot`
 *
 * The `GtkLayoutManagerClass` structure contains only private data, and
 * should only be accessed through the provided API, or when subclassing
 * `GtkLayoutManager`.
  }
{< private > }
{< public > }
{*
   * GtkLayoutManagerClass::create_layout_child:
   * @manager: the `GtkLayoutManager`
   * @widget: the widget using the @manager
   * @for_child: the child of @widget
   *
   * Create a `GtkLayoutChild` instance for the given @for_child widget.
   *
   * Returns: (transfer full): a `GtkLayoutChild`
    }
{< private > }
type
  PGtkLayoutManagerClass = ^TGtkLayoutManagerClass;
  TGtkLayoutManagerClass = record
      parent_class : TGObjectClass;
      get_request_mode : function (manager:PGtkLayoutManager; widget:PGtkWidget):TGtkSizeRequestMode;cdecl;
      measure : procedure (manager:PGtkLayoutManager; widget:PGtkWidget; orientation:TGtkOrientation; for_size:longint; minimum:Plongint; 
                    natural:Plongint; minimum_baseline:Plongint; natural_baseline:Plongint);cdecl;
      allocate : procedure (manager:PGtkLayoutManager; widget:PGtkWidget; width:longint; height:longint; baseline:longint);cdecl;
      layout_child_type : TGType;
      create_layout_child : function (manager:PGtkLayoutManager; widget:PGtkWidget; for_child:PGtkWidget):PGtkLayoutChild;cdecl;
      root : procedure (manager:PGtkLayoutManager);cdecl;
      unroot : procedure (manager:PGtkLayoutManager);cdecl;
      _padding : array[0..15] of Tgpointer;
    end;


procedure gtk_layout_manager_measure(manager:PGtkLayoutManager; widget:PGtkWidget; orientation:TGtkOrientation; for_size:longint; minimum:Plongint; 
            natural:Plongint; minimum_baseline:Plongint; natural_baseline:Plongint);cdecl;external libgtk4;
procedure gtk_layout_manager_allocate(manager:PGtkLayoutManager; widget:PGtkWidget; width:longint; height:longint; baseline:longint);cdecl;external libgtk4;
function gtk_layout_manager_get_request_mode(manager:PGtkLayoutManager):TGtkSizeRequestMode;cdecl;external libgtk4;
function gtk_layout_manager_get_widget(manager:PGtkLayoutManager):PGtkWidget;cdecl;external libgtk4;
procedure gtk_layout_manager_layout_changed(manager:PGtkLayoutManager);cdecl;external libgtk4;
function gtk_layout_manager_get_layout_child(manager:PGtkLayoutManager; child:PGtkWidget):PGtkLayoutChild;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:14:32 ===

function GTK_TYPE_LAYOUT_MANAGER: TGType;
function GTK_LAYOUT_MANAGER(obj: Pointer): PGtkLayoutManager;
function GTK_IS_LAYOUT_MANAGER(obj: Pointer): Tgboolean;
function GTK_LAYOUT_MANAGER_CLASS(klass: Pointer): PGtkLayoutManagerClass;
function GTK_IS_LAYOUT_MANAGER_CLASS(klass: Pointer): Tgboolean;
function GTK_LAYOUT_MANAGER_GET_CLASS(obj: Pointer): PGtkLayoutManagerClass;

implementation

function GTK_TYPE_LAYOUT_MANAGER: TGType;
begin
  Result := gtk_layout_manager_get_type;
end;

function GTK_LAYOUT_MANAGER(obj: Pointer): PGtkLayoutManager;
begin
  Result := PGtkLayoutManager(g_type_check_instance_cast(obj, GTK_TYPE_LAYOUT_MANAGER));
end;

function GTK_IS_LAYOUT_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_LAYOUT_MANAGER);
end;

function GTK_LAYOUT_MANAGER_CLASS(klass: Pointer): PGtkLayoutManagerClass;
begin
  Result := PGtkLayoutManagerClass(g_type_check_class_cast(klass, GTK_TYPE_LAYOUT_MANAGER));
end;

function GTK_IS_LAYOUT_MANAGER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_LAYOUT_MANAGER);
end;

function GTK_LAYOUT_MANAGER_GET_CLASS(obj: Pointer): PGtkLayoutManagerClass;
begin
  Result := PGtkLayoutManagerClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGtkLayoutManager = record
    parent_instance: TGObject;
  end;
  PGtkLayoutManager = ^TGtkLayoutManager;

  PGtkLayoutManagerClass = type Pointer;

function gtk_layout_manager_get_type: TGType; cdecl; external libgxxxxxxx;



end.
