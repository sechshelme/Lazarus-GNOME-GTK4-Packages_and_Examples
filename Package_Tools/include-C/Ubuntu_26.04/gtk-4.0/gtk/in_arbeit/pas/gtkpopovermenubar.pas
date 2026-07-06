unit gtkpopovermenubar;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2019 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkpopover.h>}

type

function gtk_popover_menu_bar_get_type:TGType;cdecl;external libgtk4;
function gtk_popover_menu_bar_new_from_model(model:PGMenuModel):PGtkWidget;cdecl;external libgtk4;
procedure gtk_popover_menu_bar_set_menu_model(bar:PGtkPopoverMenuBar; model:PGMenuModel);cdecl;external libgtk4;
function gtk_popover_menu_bar_get_menu_model(bar:PGtkPopoverMenuBar):PGMenuModel;cdecl;external libgtk4;
function gtk_popover_menu_bar_add_child(bar:PGtkPopoverMenuBar; child:PGtkWidget; id:Pchar):Tgboolean;cdecl;external libgtk4;
function gtk_popover_menu_bar_remove_child(bar:PGtkPopoverMenuBar; child:PGtkWidget):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkPopoverMenuBar, g_object_unref) }

// === Konventiert am: 6-7-26 17:03:17 ===

function GTK_TYPE_POPOVER_MENU_BAR : TGType;
function GTK_POPOVER_MENU_BAR(obj : Pointer) : PGtkPopoverMenuBar;
function GTK_IS_POPOVER_MENU_BAR(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_POPOVER_MENU_BAR : TGType;
  begin
    GTK_TYPE_POPOVER_MENU_BAR:=gtk_popover_menu_bar_get_type;
  end;

function GTK_POPOVER_MENU_BAR(obj : Pointer) : PGtkPopoverMenuBar;
begin
  Result := PGtkPopoverMenuBar(g_type_check_instance_cast(obj, GTK_TYPE_POPOVER_MENU_BAR));
end;

function GTK_IS_POPOVER_MENU_BAR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_POPOVER_MENU_BAR);
end;



end.
