unit gtkmenubutton;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 *
 * Copyright (C) 2003 Ricardo Fernandez Pascual
 * Copyright (C) 2004 Paolo Borelli
 * Copyright (C) 2012 Bastien Nocera
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
{$include <gtk/gtktogglebutton.h>}
{$include <gtk/gtkpopover.h>}

type
{*
 * GtkMenuButtonCreatePopupFunc:
 * @menu_button: the `GtkMenuButton`
 * @user_data: User data passed to gtk_menu_button_set_create_popup_func()
 *
 * User-provided callback function to create a popup for a
 * `GtkMenuButton` on demand.
 *
 * This function is called when the popup of @menu_button is shown,
 * but none has been provided via [method@Gtk.MenuButton.set_popover]
 * or [method@Gtk.MenuButton.set_menu_model].
  }

  TGtkMenuButtonCreatePopupFunc = procedure (menu_button:PGtkMenuButton; user_data:Tgpointer);cdecl;

function gtk_menu_button_get_type:TGType;cdecl;external libgtk4;
function gtk_menu_button_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_menu_button_set_popover(menu_button:PGtkMenuButton; popover:PGtkWidget);cdecl;external libgtk4;
function gtk_menu_button_get_popover(menu_button:PGtkMenuButton):PGtkPopover;cdecl;external libgtk4;
procedure gtk_menu_button_set_direction(menu_button:PGtkMenuButton; direction:TGtkArrowType);cdecl;external libgtk4;
function gtk_menu_button_get_direction(menu_button:PGtkMenuButton):TGtkArrowType;cdecl;external libgtk4;
procedure gtk_menu_button_set_menu_model(menu_button:PGtkMenuButton; menu_model:PGMenuModel);cdecl;external libgtk4;
function gtk_menu_button_get_menu_model(menu_button:PGtkMenuButton):PGMenuModel;cdecl;external libgtk4;
procedure gtk_menu_button_set_icon_name(menu_button:PGtkMenuButton; icon_name:Pchar);cdecl;external libgtk4;
function gtk_menu_button_get_icon_name(menu_button:PGtkMenuButton):Pchar;cdecl;external libgtk4;
procedure gtk_menu_button_set_always_show_arrow(menu_button:PGtkMenuButton; always_show_arrow:Tgboolean);cdecl;external libgtk4;
function gtk_menu_button_get_always_show_arrow(menu_button:PGtkMenuButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_menu_button_set_label(menu_button:PGtkMenuButton; _label:Pchar);cdecl;external libgtk4;
function gtk_menu_button_get_label(menu_button:PGtkMenuButton):Pchar;cdecl;external libgtk4;
procedure gtk_menu_button_set_use_underline(menu_button:PGtkMenuButton; use_underline:Tgboolean);cdecl;external libgtk4;
function gtk_menu_button_get_use_underline(menu_button:PGtkMenuButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_menu_button_set_has_frame(menu_button:PGtkMenuButton; has_frame:Tgboolean);cdecl;external libgtk4;
function gtk_menu_button_get_has_frame(menu_button:PGtkMenuButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_menu_button_popup(menu_button:PGtkMenuButton);cdecl;external libgtk4;
procedure gtk_menu_button_popdown(menu_button:PGtkMenuButton);cdecl;external libgtk4;
procedure gtk_menu_button_set_create_popup_func(menu_button:PGtkMenuButton; func:TGtkMenuButtonCreatePopupFunc; user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external libgtk4;
procedure gtk_menu_button_set_primary(menu_button:PGtkMenuButton; primary:Tgboolean);cdecl;external libgtk4;
function gtk_menu_button_get_primary(menu_button:PGtkMenuButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_menu_button_set_child(menu_button:PGtkMenuButton; child:PGtkWidget);cdecl;external libgtk4;
function gtk_menu_button_get_child(menu_button:PGtkMenuButton):PGtkWidget;cdecl;external libgtk4;
procedure gtk_menu_button_set_active(menu_button:PGtkMenuButton; active:Tgboolean);cdecl;external libgtk4;
function gtk_menu_button_get_active(menu_button:PGtkMenuButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_menu_button_set_can_shrink(menu_button:PGtkMenuButton; can_shrink:Tgboolean);cdecl;external libgtk4;
function gtk_menu_button_get_can_shrink(menu_button:PGtkMenuButton):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkMenuButton, g_object_unref) }

// === Konventiert am: 6-7-26 16:20:38 ===

function GTK_TYPE_MENU_BUTTON : TGType;
function GTK_MENU_BUTTON(obj : Pointer) : PGtkMenuButton;
function GTK_IS_MENU_BUTTON(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_MENU_BUTTON : TGType;
  begin
    GTK_TYPE_MENU_BUTTON:=gtk_menu_button_get_type;
  end;

function GTK_MENU_BUTTON(obj : Pointer) : PGtkMenuButton;
begin
  Result := PGtkMenuButton(g_type_check_instance_cast(obj, GTK_TYPE_MENU_BUTTON));
end;

function GTK_IS_MENU_BUTTON(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_MENU_BUTTON);
end;



end.
