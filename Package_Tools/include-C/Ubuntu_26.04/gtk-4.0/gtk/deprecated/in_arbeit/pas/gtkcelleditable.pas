unit gtkcelleditable;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkcelleditable.h
 * Copyright (C) 2001  Red Hat, Inc.
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

type
{ Dummy typedef  }
{*
 * GtkCellEditableIface:
 * @editing_done: Signal is a sign for the cell renderer to update its
 *    value from the cell_editable.
 * @remove_widget: Signal is meant to indicate that the cell is
 *    finished editing, and the widget may now be destroyed.
 * @start_editing: Begins editing on a cell_editable.
  }
{< private > }
{< public > }
{ signals  }
{ virtual table  }
  PGtkCellEditableIface = ^TGtkCellEditableIface;
  TGtkCellEditableIface = record
      g_iface : TGTypeInterface;
      editing_done : procedure (cell_editable:PGtkCellEditable);cdecl;
      remove_widget : procedure (cell_editable:PGtkCellEditable);cdecl;
      start_editing : procedure (cell_editable:PGtkCellEditable; event:PGdkEvent);cdecl;
    end;


function gtk_cell_editable_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_editable_start_editing(cell_editable:PGtkCellEditable; event:PGdkEvent);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_editable_editing_done(cell_editable:PGtkCellEditable);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_editable_remove_widget(cell_editable:PGtkCellEditable);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellEditable, g_object_unref) }

// === Konventiert am: 9-7-26 19:34:48 ===

function GTK_TYPE_CELL_EDITABLE : TGType;
function GTK_CELL_EDITABLE(obj : Pointer) : PGtkCellEditable;
function GTK_IS_CELL_EDITABLE(obj : Pointer) : Tgboolean;
function GTK_CELL_EDITABLE_GET_IFACE(obj : Pointer) : PGtkCellEditableIface;

implementation

function GTK_TYPE_CELL_EDITABLE : TGType;
  begin
    GTK_TYPE_CELL_EDITABLE:=gtk_cell_editable_get_type;
  end;

function GTK_CELL_EDITABLE(obj : Pointer) : PGtkCellEditable;
begin
  Result := PGtkCellEditable(g_type_check_instance_cast(obj, GTK_TYPE_CELL_EDITABLE));
end;

function GTK_IS_CELL_EDITABLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_CELL_EDITABLE);
end;

function GTK_CELL_EDITABLE_GET_IFACE(obj : Pointer) : PGtkCellEditableIface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_CELL_EDITABLE);
end;



end.
