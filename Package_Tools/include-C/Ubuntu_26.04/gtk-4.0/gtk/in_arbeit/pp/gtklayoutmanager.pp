
unit gtklayoutmanager;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtklayoutmanager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtklayoutmanager.h
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
PGtkLayoutChild  = ^GtkLayoutChild;
PGtkLayoutManager  = ^GtkLayoutManager;
PGtkLayoutManagerClass  = ^GtkLayoutManagerClass;
PGtkWidget  = ^GtkWidget;
Plongint  = ^longint;
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

{ was #define dname def_expr }
function GTK_TYPE_LAYOUT_MANAGER : longint; { return type might be wrong }

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
            natural:Plongint; minimum_baseline:Plongint; natural_baseline:Plongint);cdecl;external;
procedure gtk_layout_manager_allocate(manager:PGtkLayoutManager; widget:PGtkWidget; width:longint; height:longint; baseline:longint);cdecl;external;
function gtk_layout_manager_get_request_mode(manager:PGtkLayoutManager):TGtkSizeRequestMode;cdecl;external;
function gtk_layout_manager_get_widget(manager:PGtkLayoutManager):PGtkWidget;cdecl;external;
procedure gtk_layout_manager_layout_changed(manager:PGtkLayoutManager);cdecl;external;
function gtk_layout_manager_get_layout_child(manager:PGtkLayoutManager; child:PGtkWidget):PGtkLayoutChild;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_LAYOUT_MANAGER : longint; { return type might be wrong }
  begin
    GTK_TYPE_LAYOUT_MANAGER:=gtk_layout_manager_get_type;
  end;


end.
