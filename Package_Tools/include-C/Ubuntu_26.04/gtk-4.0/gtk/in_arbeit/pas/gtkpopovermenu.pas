unit gtkpopovermenu;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright © 2014 Red Hat, Inc.
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

function gtk_popover_menu_get_type:TGType;cdecl;external libgtk4;
function gtk_popover_menu_new_from_model(model:PGMenuModel):PGtkWidget;cdecl;external libgtk4;
function gtk_popover_menu_new_from_model_full(model:PGMenuModel; flags:TGtkPopoverMenuFlags):PGtkWidget;cdecl;external libgtk4;
procedure gtk_popover_menu_set_menu_model(popover:PGtkPopoverMenu; model:PGMenuModel);cdecl;external libgtk4;
function gtk_popover_menu_get_menu_model(popover:PGtkPopoverMenu):PGMenuModel;cdecl;external libgtk4;
procedure gtk_popover_menu_set_flags(popover:PGtkPopoverMenu; flags:TGtkPopoverMenuFlags);cdecl;external libgtk4;
function gtk_popover_menu_get_flags(popover:PGtkPopoverMenu):TGtkPopoverMenuFlags;cdecl;external libgtk4;
function gtk_popover_menu_add_child(popover:PGtkPopoverMenu; child:PGtkWidget; id:Pchar):Tgboolean;cdecl;external libgtk4;
function gtk_popover_menu_remove_child(popover:PGtkPopoverMenu; child:PGtkWidget):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkPopoverMenu, g_object_unref) }

// === Konventiert am: 6-7-26 17:00:20 ===

function GTK_TYPE_POPOVER_MENU : TGType;
function GTK_POPOVER_MENU(obj : Pointer) : PGtkPopoverMenu;
function GTK_IS_POPOVER_MENU(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_POPOVER_MENU : TGType;
  begin
    GTK_TYPE_POPOVER_MENU:=gtk_popover_menu_get_type;
  end;

function GTK_POPOVER_MENU(obj : Pointer) : PGtkPopoverMenu;
begin
  Result := PGtkPopoverMenu(g_type_check_instance_cast(obj, GTK_TYPE_POPOVER_MENU));
end;

function GTK_IS_POPOVER_MENU(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_POPOVER_MENU);
end;



end.
