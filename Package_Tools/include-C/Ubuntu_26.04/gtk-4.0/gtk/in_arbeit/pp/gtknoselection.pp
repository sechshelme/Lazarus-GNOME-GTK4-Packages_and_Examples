
unit gtknoselection;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtknoselection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtknoselection.h
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
PGtkNoSelection  = ^GtkNoSelection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2019 Benjamin Otte
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
{$include <gtk/gtktypes.h>}

{ was #define dname def_expr }
function GTK_TYPE_NO_SELECTION : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkNoSelection, gtk_no_selection, GTK, NO_SELECTION, GObject) }
function gtk_no_selection_new(model:PGListModel):PGtkNoSelection;cdecl;external;
function gtk_no_selection_get_model(self:PGtkNoSelection):PGListModel;cdecl;external;
procedure gtk_no_selection_set_model(self:PGtkNoSelection; model:PGListModel);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_NO_SELECTION : longint; { return type might be wrong }
  begin
    GTK_TYPE_NO_SELECTION:=gtk_no_selection_get_type;
  end;


end.
