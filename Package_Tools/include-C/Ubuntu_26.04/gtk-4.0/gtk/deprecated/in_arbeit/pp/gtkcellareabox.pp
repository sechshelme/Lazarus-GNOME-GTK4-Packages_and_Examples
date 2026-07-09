
unit gtkcellareabox;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcellareabox.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcellareabox.h
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
PGtkCellArea  = ^GtkCellArea;
PGtkCellAreaBox  = ^GtkCellAreaBox;
PGtkCellRenderer  = ^GtkCellRenderer;
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

{ was #define dname def_expr }
function GTK_TYPE_CELL_AREA_BOX : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_AREA_BOX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CELL_AREA_BOX(obj : longint) : longint;

type

function gtk_cell_area_box_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_area_box_new:PGtkCellArea;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_box_pack_start(box:PGtkCellAreaBox; renderer:PGtkCellRenderer; expand:Tgboolean; align:Tgboolean; fixed:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_box_pack_end(box:PGtkCellAreaBox; renderer:PGtkCellRenderer; expand:Tgboolean; align:Tgboolean; fixed:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_area_box_get_spacing(box:PGtkCellAreaBox):longint;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_area_box_set_spacing(box:PGtkCellAreaBox; spacing:longint);cdecl;external;
{ Private interaction with GtkCellAreaBoxContext  }
function _gtk_cell_area_box_group_visible(box:PGtkCellAreaBox; group_idx:longint):Tgboolean;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellAreaBox, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_CELL_AREA_BOX : longint; { return type might be wrong }
  begin
    GTK_TYPE_CELL_AREA_BOX:=gtk_cell_area_box_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_AREA_BOX(obj : longint) : longint;
begin
  GTK_CELL_AREA_BOX:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_CELL_AREA_BOX,GtkCellAreaBox);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CELL_AREA_BOX(obj : longint) : longint;
begin
  GTK_IS_CELL_AREA_BOX:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_CELL_AREA_BOX);
end;


end.
