
unit gtkcelleditable;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcelleditable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcelleditable.h
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
PGdkEvent  = ^GdkEvent;
PGtkCellEditable  = ^GtkCellEditable;
PGtkCellEditableIface  = ^GtkCellEditableIface;
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

{ was #define dname def_expr }
function GTK_TYPE_CELL_EDITABLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_EDITABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CELL_EDITABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_EDITABLE_GET_IFACE(obj : longint) : longint;

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


function gtk_cell_editable_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_editable_start_editing(cell_editable:PGtkCellEditable; event:PGdkEvent);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_editable_editing_done(cell_editable:PGtkCellEditable);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_editable_remove_widget(cell_editable:PGtkCellEditable);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellEditable, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_CELL_EDITABLE : longint; { return type might be wrong }
  begin
    GTK_TYPE_CELL_EDITABLE:=gtk_cell_editable_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_EDITABLE(obj : longint) : longint;
begin
  GTK_CELL_EDITABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_CELL_EDITABLE,GtkCellEditable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CELL_EDITABLE(obj : longint) : longint;
begin
  GTK_IS_CELL_EDITABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_CELL_EDITABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_EDITABLE_GET_IFACE(obj : longint) : longint;
begin
  GTK_CELL_EDITABLE_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GTK_TYPE_CELL_EDITABLE,GtkCellEditableIface);
end;


end.
