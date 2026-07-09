unit gtkiconview;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkiconview.h
 * Copyright (C) 2002, 2004  Anders Carlsson <andersca@gnome.org>
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
{$include <gtk/gtkwidget.h>}
{$include <gtk/gtktooltip.h>}
{$include <gtk/deprecated/gtktreemodel.h>}
{$include <gtk/deprecated/gtkcellrenderer.h>}
{$include <gtk/deprecated/gtkcellarea.h>}

type
{*
 * GtkIconViewForeachFunc:
 * @icon_view: a `GtkIconView`
 * @path: The `GtkTreePath` of a selected row
 * @data: (closure): user data
 *
 * A function used by gtk_icon_view_selected_foreach() to map all
 * selected rows.
 *
 * It will be called on every selected row in the view.
 *
 * Deprecated: 4.20: There is no replacement.
  }

  TGtkIconViewForeachFunc = procedure (icon_view:PGtkIconView; path:PGtkTreePath; data:Tgpointer);cdecl;
{*
 * GtkIconViewDropPosition:
 * @GTK_ICON_VIEW_NO_DROP: no drop possible
 * @GTK_ICON_VIEW_DROP_INTO: dropped item replaces the item
 * @GTK_ICON_VIEW_DROP_LEFT: dropped item is inserted to the left
 * @GTK_ICON_VIEW_DROP_RIGHT: dropped item is inserted to the right
 * @GTK_ICON_VIEW_DROP_ABOVE: dropped item is inserted above
 * @GTK_ICON_VIEW_DROP_BELOW: dropped item is inserted below
 *
 * An enum for determining where a dropped item goes.
 *
 * Deprecated: 4.20: There is no replacement.
  }

  PGtkIconViewDropPosition = ^TGtkIconViewDropPosition;
  TGtkIconViewDropPosition =  Longint;
  Const
    GTK_ICON_VIEW_NO_DROP = 0;
    GTK_ICON_VIEW_DROP_INTO = 1;
    GTK_ICON_VIEW_DROP_LEFT = 2;
    GTK_ICON_VIEW_DROP_RIGHT = 3;
    GTK_ICON_VIEW_DROP_ABOVE = 4;
    GTK_ICON_VIEW_DROP_BELOW = 5;
;

function gtk_icon_view_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_new:PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_new_with_area(area:PGtkCellArea):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_new_with_model(model:PGtkTreeModel):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_model(icon_view:PGtkIconView; model:PGtkTreeModel);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_model(icon_view:PGtkIconView):PGtkTreeModel;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_text_column(icon_view:PGtkIconView; column:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_text_column(icon_view:PGtkIconView):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_markup_column(icon_view:PGtkIconView; column:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_markup_column(icon_view:PGtkIconView):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_pixbuf_column(icon_view:PGtkIconView; column:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_pixbuf_column(icon_view:PGtkIconView):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_item_orientation(icon_view:PGtkIconView; orientation:TGtkOrientation);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_item_orientation(icon_view:PGtkIconView):TGtkOrientation;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_columns(icon_view:PGtkIconView; columns:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_columns(icon_view:PGtkIconView):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_item_width(icon_view:PGtkIconView; item_width:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_item_width(icon_view:PGtkIconView):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_spacing(icon_view:PGtkIconView; spacing:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_spacing(icon_view:PGtkIconView):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_row_spacing(icon_view:PGtkIconView; row_spacing:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_row_spacing(icon_view:PGtkIconView):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_column_spacing(icon_view:PGtkIconView; column_spacing:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_column_spacing(icon_view:PGtkIconView):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_margin(icon_view:PGtkIconView; margin:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_margin(icon_view:PGtkIconView):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_item_padding(icon_view:PGtkIconView; item_padding:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_item_padding(icon_view:PGtkIconView):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_path_at_pos(icon_view:PGtkIconView; x:longint; y:longint):PGtkTreePath;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_item_at_pos(icon_view:PGtkIconView; x:longint; y:longint; path:PPGtkTreePath; cell:PPGtkCellRenderer):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_visible_range(icon_view:PGtkIconView; start_path:PPGtkTreePath; end_path:PPGtkTreePath):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_activate_on_single_click(icon_view:PGtkIconView; single:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_activate_on_single_click(icon_view:PGtkIconView):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_selected_foreach(icon_view:PGtkIconView; func:TGtkIconViewForeachFunc; data:Tgpointer);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_selection_mode(icon_view:PGtkIconView; mode:TGtkSelectionMode);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_selection_mode(icon_view:PGtkIconView):TGtkSelectionMode;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_select_path(icon_view:PGtkIconView; path:PGtkTreePath);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_unselect_path(icon_view:PGtkIconView; path:PGtkTreePath);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_path_is_selected(icon_view:PGtkIconView; path:PGtkTreePath):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_item_row(icon_view:PGtkIconView; path:PGtkTreePath):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_item_column(icon_view:PGtkIconView; path:PGtkTreePath):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_selected_items(icon_view:PGtkIconView):PGList;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_select_all(icon_view:PGtkIconView);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_unselect_all(icon_view:PGtkIconView);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_item_activated(icon_view:PGtkIconView; path:PGtkTreePath);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_cursor(icon_view:PGtkIconView; path:PGtkTreePath; cell:PGtkCellRenderer; start_editing:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_cursor(icon_view:PGtkIconView; path:PPGtkTreePath; cell:PPGtkCellRenderer):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_scroll_to_path(icon_view:PGtkIconView; path:PGtkTreePath; use_align:Tgboolean; row_align:single; col_align:single);cdecl;external libgtk4;
{ Drag-and-Drop support  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_enable_model_drag_source(icon_view:PGtkIconView; start_button_mask:TGdkModifierType; formats:PGdkContentFormats; actions:TGdkDragAction);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_enable_model_drag_dest(icon_view:PGtkIconView; formats:PGdkContentFormats; actions:TGdkDragAction);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_unset_model_drag_source(icon_view:PGtkIconView);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_unset_model_drag_dest(icon_view:PGtkIconView);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_reorderable(icon_view:PGtkIconView; reorderable:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_reorderable(icon_view:PGtkIconView):Tgboolean;cdecl;external libgtk4;
{ These are useful to implement your own custom stuff.  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_drag_dest_item(icon_view:PGtkIconView; path:PGtkTreePath; pos:TGtkIconViewDropPosition);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_get_drag_dest_item(icon_view:PGtkIconView; path:PPGtkTreePath; pos:PGtkIconViewDropPosition);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_dest_item_at_pos(icon_view:PGtkIconView; drag_x:longint; drag_y:longint; path:PPGtkTreePath; pos:PGtkIconViewDropPosition):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_create_drag_icon(icon_view:PGtkIconView; path:PGtkTreePath):PGdkPaintable;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_cell_rect(icon_view:PGtkIconView; path:PGtkTreePath; cell:PGtkCellRenderer; rect:PGdkRectangle):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_tooltip_item(icon_view:PGtkIconView; tooltip:PGtkTooltip; path:PGtkTreePath);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_tooltip_cell(icon_view:PGtkIconView; tooltip:PGtkTooltip; path:PGtkTreePath; cell:PGtkCellRenderer);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_tooltip_context(icon_view:PGtkIconView; x:longint; y:longint; keyboard_tip:Tgboolean; model:PPGtkTreeModel; 
           path:PPGtkTreePath; iter:PGtkTreeIter):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
procedure gtk_icon_view_set_tooltip_column(icon_view:PGtkIconView; column:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkGridView) }
function gtk_icon_view_get_tooltip_column(icon_view:PGtkIconView):longint;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkIconView, g_object_unref) }

// === Konventiert am: 9-7-26 19:45:14 ===

function GTK_TYPE_ICON_VIEW : TGType;
function GTK_ICON_VIEW(obj : Pointer) : PGtkIconView;
function GTK_IS_ICON_VIEW(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_ICON_VIEW : TGType;
  begin
    GTK_TYPE_ICON_VIEW:=gtk_icon_view_get_type;
  end;

function GTK_ICON_VIEW(obj : Pointer) : PGtkIconView;
begin
  Result := PGtkIconView(g_type_check_instance_cast(obj, GTK_TYPE_ICON_VIEW));
end;

function GTK_IS_ICON_VIEW(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_ICON_VIEW);
end;



end.
