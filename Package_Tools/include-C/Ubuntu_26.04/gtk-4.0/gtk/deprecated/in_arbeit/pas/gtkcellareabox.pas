unit gtkcellareabox;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkcellareabox.h
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

function gtk_cell_area_box_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_area_box_new:PGtkCellArea;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_box_pack_start(box:PGtkCellAreaBox; renderer:PGtkCellRenderer; expand:Tgboolean; align:Tgboolean; fixed:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_box_pack_end(box:PGtkCellAreaBox; renderer:PGtkCellRenderer; expand:Tgboolean; align:Tgboolean; fixed:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_area_box_get_spacing(box:PGtkCellAreaBox):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_box_set_spacing(box:PGtkCellAreaBox; spacing:longint);cdecl;external libgtk4;
{ Private interaction with GtkCellAreaBoxContext  }
function _gtk_cell_area_box_group_visible(box:PGtkCellAreaBox; group_idx:longint):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellAreaBox, g_object_unref) }

// === Konventiert am: 9-7-26 19:34:33 ===

function GTK_TYPE_CELL_AREA_BOX : TGType;
function GTK_CELL_AREA_BOX(obj : Pointer) : PGtkCellAreaBox;
function GTK_IS_CELL_AREA_BOX(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_CELL_AREA_BOX : TGType;
  begin
    GTK_TYPE_CELL_AREA_BOX:=gtk_cell_area_box_get_type;
  end;

function GTK_CELL_AREA_BOX(obj : Pointer) : PGtkCellAreaBox;
begin
  Result := PGtkCellAreaBox(g_type_check_instance_cast(obj, GTK_TYPE_CELL_AREA_BOX));
end;

function GTK_IS_CELL_AREA_BOX(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_CELL_AREA_BOX);
end;



end.
