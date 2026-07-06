
unit gtkflattenlistmodel;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkflattenlistmodel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkflattenlistmodel.h
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
PGListModel  = ^GListModel;
PGtkFlattenListModel  = ^GtkFlattenListModel;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2018 Benjamin Otte
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
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}

{ was #define dname def_expr }
function GTK_TYPE_FLATTEN_LIST_MODEL : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkFlattenListModel, gtk_flatten_list_model, GTK, FLATTEN_LIST_MODEL, GObject) }
function gtk_flatten_list_model_new(model:PGListModel):PGtkFlattenListModel;cdecl;external;
procedure gtk_flatten_list_model_set_model(self:PGtkFlattenListModel; model:PGListModel);cdecl;external;
function gtk_flatten_list_model_get_model(self:PGtkFlattenListModel):PGListModel;cdecl;external;
function gtk_flatten_list_model_get_model_for_item(self:PGtkFlattenListModel; position:Tguint):PGListModel;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_FLATTEN_LIST_MODEL : longint; { return type might be wrong }
  begin
    GTK_TYPE_FLATTEN_LIST_MODEL:=gtk_flatten_list_model_get_type;
  end;


end.
