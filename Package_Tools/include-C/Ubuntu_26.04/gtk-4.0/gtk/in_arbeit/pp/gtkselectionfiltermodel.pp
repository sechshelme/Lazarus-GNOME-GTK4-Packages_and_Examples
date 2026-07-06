
unit gtkselectionfiltermodel;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkselectionfiltermodel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkselectionfiltermodel.h
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
PGtkSelectionFilterModel  = ^GtkSelectionFilterModel;
PGtkSelectionModel  = ^GtkSelectionModel;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020 Red Hat, Inc.
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
 * Authors: Matthias Clasen
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gio/gio.h>}
{$include <gtk/gtkselectionmodel.h>}

{ was #define dname def_expr }
function GTK_TYPE_SELECTION_FILTER_MODEL : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSelectionFilterModel, gtk_selection_filter_model, GTK, SELECTION_FILTER_MODEL, GObject) }
function gtk_selection_filter_model_new(model:PGtkSelectionModel):PGtkSelectionFilterModel;cdecl;external;
procedure gtk_selection_filter_model_set_model(self:PGtkSelectionFilterModel; model:PGtkSelectionModel);cdecl;external;
function gtk_selection_filter_model_get_model(self:PGtkSelectionFilterModel):PGtkSelectionModel;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_SELECTION_FILTER_MODEL : longint; { return type might be wrong }
  begin
    GTK_TYPE_SELECTION_FILTER_MODEL:=gtk_selection_filter_model_get_type;
  end;


end.
