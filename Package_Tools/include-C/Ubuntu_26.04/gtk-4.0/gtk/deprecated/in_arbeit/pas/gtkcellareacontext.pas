unit gtkcellareacontext;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkcellareacontext.h
 *
 * Copyright (C) 2010 Openismus GmbH
 *
 * Authors:
 *      Tristan Van Berkom <tristanvb@openismus.com>
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
{$include <gtk/deprecated/gtkcellarea.h>}

type
{< private > }
  PGtkCellAreaContext = ^TGtkCellAreaContext;
  TGtkCellAreaContext = record
      parent_instance : TGObject;
    end;

{*
 * GtkCellAreaContextClass:
 * @allocate: This tells the context that an allocation width or height
 *   (or both) have been decided for a group of rows. The context should
 *   store any allocations for internally aligned cells at this point so
 *   that they dont need to be recalculated at gtk_cell_area_render() time.
 * @reset: Clear any previously stored information about requested and
 *   allocated sizes for the context.
 * @get_preferred_height_for_width: Returns the aligned height for the given
 *   width that context must store while collecting sizes for it’s rows.
 * @get_preferred_width_for_height: Returns the aligned width for the given
 *   height that context must store while collecting sizes for it’s rows.
  }
{< private > }
{< public > }
{< private > }
  PGtkCellAreaContextClass = ^TGtkCellAreaContextClass;
  TGtkCellAreaContextClass = record
      parent_class : TGObjectClass;
      allocate : procedure (context:PGtkCellAreaContext; width:longint; height:longint);cdecl;
      reset : procedure (context:PGtkCellAreaContext);cdecl;
      get_preferred_height_for_width : procedure (context:PGtkCellAreaContext; width:longint; minimum_height:Plongint; natural_height:Plongint);cdecl;
      get_preferred_width_for_height : procedure (context:PGtkCellAreaContext; height:longint; minimum_width:Plongint; natural_width:Plongint);cdecl;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_cell_area_context_get_type:TGType;cdecl;external libgtk4;
{ Main apis  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_area_context_get_area(context:PGtkCellAreaContext):PGtkCellArea;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_context_allocate(context:PGtkCellAreaContext; width:longint; height:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_context_reset(context:PGtkCellAreaContext);cdecl;external libgtk4;
{ Apis for GtkCellArea clients to consult cached values
 * for a series of GtkTreeModel rows
  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_context_get_preferred_width(context:PGtkCellAreaContext; minimum_width:Plongint; natural_width:Plongint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_context_get_preferred_height(context:PGtkCellAreaContext; minimum_height:Plongint; natural_height:Plongint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_context_get_preferred_height_for_width(context:PGtkCellAreaContext; width:longint; minimum_height:Plongint; natural_height:Plongint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_context_get_preferred_width_for_height(context:PGtkCellAreaContext; height:longint; minimum_width:Plongint; natural_width:Plongint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_context_get_allocation(context:PGtkCellAreaContext; width:Plongint; height:Plongint);cdecl;external libgtk4;
{ Apis for GtkCellArea implementations to update cached values
 * for multiple GtkTreeModel rows
  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_context_push_preferred_width(context:PGtkCellAreaContext; minimum_width:longint; natural_width:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_context_push_preferred_height(context:PGtkCellAreaContext; minimum_height:longint; natural_height:longint);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellAreaContext, g_object_unref) }

// === Konventiert am: 9-7-26 19:34:39 ===

function GTK_TYPE_CELL_AREA_CONTEXT : TGType;
function GTK_CELL_AREA_CONTEXT(obj : Pointer) : PGtkCellAreaContext;
function GTK_CELL_AREA_CONTEXT_CLASS(klass : Pointer) : PGtkCellAreaContextClass;
function GTK_IS_CELL_AREA_CONTEXT(obj : Pointer) : Tgboolean;
function GTK_IS_CELL_AREA_CONTEXT_CLASS(klass : Pointer) : Tgboolean;
function GTK_CELL_AREA_CONTEXT_GET_CLASS(obj : Pointer) : PGtkCellAreaContextClass;

implementation

function GTK_TYPE_CELL_AREA_CONTEXT : TGType;
  begin
    GTK_TYPE_CELL_AREA_CONTEXT:=gtk_cell_area_context_get_type;
  end;

function GTK_CELL_AREA_CONTEXT(obj : Pointer) : PGtkCellAreaContext;
begin
  Result := PGtkCellAreaContext(g_type_check_instance_cast(obj, GTK_TYPE_CELL_AREA_CONTEXT));
end;

function GTK_CELL_AREA_CONTEXT_CLASS(klass : Pointer) : PGtkCellAreaContextClass;
begin
  Result := PGtkCellAreaContextClass(g_type_check_class_cast(klass, GTK_TYPE_CELL_AREA_CONTEXT));
end;

function GTK_IS_CELL_AREA_CONTEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_CELL_AREA_CONTEXT);
end;

function GTK_IS_CELL_AREA_CONTEXT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_CELL_AREA_CONTEXT);
end;

function GTK_CELL_AREA_CONTEXT_GET_CLASS(obj : Pointer) : PGtkCellAreaContextClass;
begin
  Result := PGtkCellAreaContextClass(PGTypeInstance(obj)^.g_class);
end;



end.
