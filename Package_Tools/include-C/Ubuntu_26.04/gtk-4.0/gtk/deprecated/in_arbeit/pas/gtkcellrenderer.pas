unit gtkcellrenderer;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkcellrenderer.h
 * Copyright (C) 2000  Red Hat, Inc.,  Jonathan Blandford <jrb@redhat.com>
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
{$include <gtk/deprecated/gtkcelleditable.h>}
{*
 * GtkCellRendererState:
 * @GTK_CELL_RENDERER_SELECTED: The cell is currently selected, and
 *  probably has a selection colored background to render to.
 * @GTK_CELL_RENDERER_PRELIT: The mouse is hovering over the cell.
 * @GTK_CELL_RENDERER_INSENSITIVE: The cell is drawn in an insensitive manner
 * @GTK_CELL_RENDERER_SORTED: The cell is in a sorted row
 * @GTK_CELL_RENDERER_FOCUSED: The cell is in the focus row.
 * @GTK_CELL_RENDERER_EXPANDABLE: The cell is in a row that can be expanded
 * @GTK_CELL_RENDERER_EXPANDED: The cell is in a row that is expanded
 *
 * Tells how a cell is to be rendered.
 *
 * Deprecated: 4.20: There is no replacement.
  }
{ this flag means the cell is in the sort column/row  }
type
  PGtkCellRendererState = ^TGtkCellRendererState;
  TGtkCellRendererState =  Longint;
  Const
    GTK_CELL_RENDERER_SELECTED = 1 shl 0;
    GTK_CELL_RENDERER_PRELIT = 1 shl 1;
    GTK_CELL_RENDERER_INSENSITIVE = 1 shl 2;
    GTK_CELL_RENDERER_SORTED = 1 shl 3;
    GTK_CELL_RENDERER_FOCUSED = 1 shl 4;
    GTK_CELL_RENDERER_EXPANDABLE = 1 shl 5;
    GTK_CELL_RENDERER_EXPANDED = 1 shl 6;
;
{*
 * GtkCellRendererMode:
 * @GTK_CELL_RENDERER_MODE_INERT: The cell is just for display
 *  and cannot be interacted with.  Note that this doesn’t mean that eg. the
 *  row being drawn can’t be selected -- just that a particular element of
 *  it cannot be individually modified.
 * @GTK_CELL_RENDERER_MODE_ACTIVATABLE: The cell can be clicked.
 * @GTK_CELL_RENDERER_MODE_EDITABLE: The cell can be edited or otherwise modified.
 *
 * Identifies how the user can interact with a particular cell.
 *
 * Deprecated: 4.20: There is no replacement.
  }
type
  PGtkCellRendererMode = ^TGtkCellRendererMode;
  TGtkCellRendererMode =  Longint;
  Const
    GTK_CELL_RENDERER_MODE_INERT = 0;
    GTK_CELL_RENDERER_MODE_ACTIVATABLE = 1;
    GTK_CELL_RENDERER_MODE_EDITABLE = 2;
;

type
{< private > }
  PGtkCellRenderer = ^TGtkCellRenderer;
  TGtkCellRenderer = record
      parent_instance : TGInitiallyUnowned;
      priv : PGtkCellRendererPrivate;
    end;

{*
 * GtkCellRendererClass:
 * @get_request_mode: Called to gets whether the cell renderer prefers
 *    a height-for-width layout or a width-for-height layout.
 * @get_preferred_width: Called to get a renderer’s natural width.
 * @get_preferred_height_for_width: Called to get a renderer’s natural height for width.
 * @get_preferred_height: Called to get a renderer’s natural height.
 * @get_preferred_width_for_height: Called to get a renderer’s natural width for height.
 * @get_aligned_area: Called to get the aligned area used by @cell inside @cell_area.
 * @snapshot: Called to snapshot the content of the `GtkCellRenderer`.
 * @activate: Called to activate the content of the `GtkCellRenderer`.
 * @start_editing: Called to initiate editing the content of the `GtkCellRenderer`.
 * @editing_canceled: Signal gets emitted when the user cancels the process of editing a cell.
 * @editing_started: Signal gets emitted when a cell starts to be edited.
  }
{< private > }
{< public > }
{ vtable - not signals  }
{ Signals  }
{< private > }
  PGtkCellRendererClass = ^TGtkCellRendererClass;
  TGtkCellRendererClass = record
      parent_class : TGInitiallyUnownedClass;
      get_request_mode : function (cell:PGtkCellRenderer):TGtkSizeRequestMode;cdecl;
      get_preferred_width : procedure (cell:PGtkCellRenderer; widget:PGtkWidget; minimum_size:Plongint; natural_size:Plongint);cdecl;
      get_preferred_height_for_width : procedure (cell:PGtkCellRenderer; widget:PGtkWidget; width:longint; minimum_height:Plongint; natural_height:Plongint);cdecl;
      get_preferred_height : procedure (cell:PGtkCellRenderer; widget:PGtkWidget; minimum_size:Plongint; natural_size:Plongint);cdecl;
      get_preferred_width_for_height : procedure (cell:PGtkCellRenderer; widget:PGtkWidget; height:longint; minimum_width:Plongint; natural_width:Plongint);cdecl;
      get_aligned_area : procedure (cell:PGtkCellRenderer; widget:PGtkWidget; flags:TGtkCellRendererState; cell_area:PGdkRectangle; aligned_area:PGdkRectangle);cdecl;
      snapshot : procedure (cell:PGtkCellRenderer; snapshot:PGtkSnapshot; widget:PGtkWidget; background_area:PGdkRectangle; cell_area:PGdkRectangle; 
                    flags:TGtkCellRendererState);cdecl;
      activate : function (cell:PGtkCellRenderer; event:PGdkEvent; widget:PGtkWidget; path:Pchar; background_area:PGdkRectangle; 
                   cell_area:PGdkRectangle; flags:TGtkCellRendererState):Tgboolean;cdecl;
      start_editing : function (cell:PGtkCellRenderer; event:PGdkEvent; widget:PGtkWidget; path:Pchar; background_area:PGdkRectangle; 
                   cell_area:PGdkRectangle; flags:TGtkCellRendererState):PGtkCellEditable;cdecl;
      editing_canceled : procedure (cell:PGtkCellRenderer);cdecl;
      editing_started : procedure (cell:PGtkCellRenderer; editable:PGtkCellEditable; path:Pchar);cdecl;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_cell_renderer_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_get_request_mode(cell:PGtkCellRenderer):TGtkSizeRequestMode;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_get_preferred_width(cell:PGtkCellRenderer; widget:PGtkWidget; minimum_size:Plongint; natural_size:Plongint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_get_preferred_height_for_width(cell:PGtkCellRenderer; widget:PGtkWidget; width:longint; minimum_height:Plongint; natural_height:Plongint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_get_preferred_height(cell:PGtkCellRenderer; widget:PGtkWidget; minimum_size:Plongint; natural_size:Plongint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_get_preferred_width_for_height(cell:PGtkCellRenderer; widget:PGtkWidget; height:longint; minimum_width:Plongint; natural_width:Plongint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_get_preferred_size(cell:PGtkCellRenderer; widget:PGtkWidget; minimum_size:PGtkRequisition; natural_size:PGtkRequisition);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_get_aligned_area(cell:PGtkCellRenderer; widget:PGtkWidget; flags:TGtkCellRendererState; cell_area:PGdkRectangle; aligned_area:PGdkRectangle);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_snapshot(cell:PGtkCellRenderer; snapshot:PGtkSnapshot; widget:PGtkWidget; background_area:PGdkRectangle; cell_area:PGdkRectangle; 
            flags:TGtkCellRendererState);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_activate(cell:PGtkCellRenderer; event:PGdkEvent; widget:PGtkWidget; path:Pchar; background_area:PGdkRectangle; 
           cell_area:PGdkRectangle; flags:TGtkCellRendererState):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_start_editing(cell:PGtkCellRenderer; event:PGdkEvent; widget:PGtkWidget; path:Pchar; background_area:PGdkRectangle; 
           cell_area:PGdkRectangle; flags:TGtkCellRendererState):PGtkCellEditable;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_set_fixed_size(cell:PGtkCellRenderer; width:longint; height:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_get_fixed_size(cell:PGtkCellRenderer; width:Plongint; height:Plongint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_set_alignment(cell:PGtkCellRenderer; xalign:single; yalign:single);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_get_alignment(cell:PGtkCellRenderer; xalign:Psingle; yalign:Psingle);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_set_padding(cell:PGtkCellRenderer; xpad:longint; ypad:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_get_padding(cell:PGtkCellRenderer; xpad:Plongint; ypad:Plongint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_set_visible(cell:PGtkCellRenderer; visible:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_get_visible(cell:PGtkCellRenderer):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_set_sensitive(cell:PGtkCellRenderer; sensitive:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_get_sensitive(cell:PGtkCellRenderer):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_is_activatable(cell:PGtkCellRenderer):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_set_is_expander(cell:PGtkCellRenderer; is_expander:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_get_is_expander(cell:PGtkCellRenderer):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_set_is_expanded(cell:PGtkCellRenderer; is_expanded:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_get_is_expanded(cell:PGtkCellRenderer):Tgboolean;cdecl;external libgtk4;
{ For use by cell renderer implementations only  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_stop_editing(cell:PGtkCellRenderer; canceled:Tgboolean);cdecl;external libgtk4;
procedure _gtk_cell_renderer_calc_offset(cell:PGtkCellRenderer; cell_area:PGdkRectangle; direction:TGtkTextDirection; width:longint; height:longint; 
            x_offset:Plongint; y_offset:Plongint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_get_state(cell:PGtkCellRenderer; widget:PGtkWidget; cell_state:TGtkCellRendererState):TGtkStateFlags;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellRenderer, g_object_unref) }

// === Konventiert am: 9-7-26 19:39:21 ===

function GTK_TYPE_CELL_RENDERER : TGType;
function GTK_CELL_RENDERER(obj : Pointer) : PGtkCellRenderer;
function GTK_CELL_RENDERER_CLASS(klass : Pointer) : PGtkCellRendererClass;
function GTK_IS_CELL_RENDERER(obj : Pointer) : Tgboolean;
function GTK_IS_CELL_RENDERER_CLASS(klass : Pointer) : Tgboolean;
function GTK_CELL_RENDERER_GET_CLASS(obj : Pointer) : PGtkCellRendererClass;

implementation

function GTK_TYPE_CELL_RENDERER : TGType;
  begin
    GTK_TYPE_CELL_RENDERER:=gtk_cell_renderer_get_type;
  end;

function GTK_CELL_RENDERER(obj : Pointer) : PGtkCellRenderer;
begin
  Result := PGtkCellRenderer(g_type_check_instance_cast(obj, GTK_TYPE_CELL_RENDERER));
end;

function GTK_CELL_RENDERER_CLASS(klass : Pointer) : PGtkCellRendererClass;
begin
  Result := PGtkCellRendererClass(g_type_check_class_cast(klass, GTK_TYPE_CELL_RENDERER));
end;

function GTK_IS_CELL_RENDERER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_CELL_RENDERER);
end;

function GTK_IS_CELL_RENDERER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_CELL_RENDERER);
end;

function GTK_CELL_RENDERER_GET_CLASS(obj : Pointer) : PGtkCellRendererClass;
begin
  Result := PGtkCellRendererClass(PGTypeInstance(obj)^.g_class);
end;



end.
