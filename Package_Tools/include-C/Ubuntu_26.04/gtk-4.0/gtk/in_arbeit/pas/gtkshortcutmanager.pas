unit gtkshortcutmanager;

interface

uses
  fp_glib2, fp_gtk4;

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
{$include <gtk/gtkshortcutcontroller.h>}
{$include <gtk/gtkwidget.h>}

{G_DECLARE_INTERFACE (GtkShortcutManager, gtk_shortcut_manager, GTK, SHORTCUT_MANAGER, GtkWidget) }
{*
 * GtkShortcutManagerInterface:
 * @add_controller: Add a `GtkShortcutController` to be managed.
 * @remove_controller: Remove a `GtkShortcutController` that had previously
 *   been added
 *
 * The list of functions that can be implemented for the `GtkShortcutManager`
 * interface.
 *
 * Note that no function is mandatory to implement, the default implementation
 * will work fine.
  }
{< private > }
{< public > }
type
  PGtkShortcutManagerInterface = ^TGtkShortcutManagerInterface;
  TGtkShortcutManagerInterface = record
      g_iface : TGTypeInterface;
      add_controller : procedure (self:PGtkShortcutManager; controller:PGtkShortcutController);cdecl;
      remove_controller : procedure (self:PGtkShortcutManager; controller:PGtkShortcutController);cdecl;
    end;


// === Konventiert am: 6-7-26 17:06:48 ===

function GTK_TYPE_SHORTCUT_MANAGER: TGType;
function GTK_SHORTCUT_MANAGER(obj: Pointer): PGtkShortcutManager;
function GTK_IS_SHORTCUT_MANAGER(obj: Pointer): Tgboolean;
function GTK_SHORTCUT_MANAGER_GET_IFACE(obj: Pointer): PGtkShortcutManagerInterface;

implementation

function GTK_TYPE_SHORTCUT_MANAGER: TGType;
begin
  Result := gtk_shortcut_manager_get_type;
end;

function GTK_SHORTCUT_MANAGER(obj: Pointer): PGtkShortcutManager;
begin
  Result := PGtkShortcutManager(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUT_MANAGER));
end;

function GTK_IS_SHORTCUT_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SHORTCUT_MANAGER);
end;

function GTK_SHORTCUT_MANAGER_GET_IFACE(obj: Pointer): PGtkShortcutManagerInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_SHORTCUT_MANAGER);
end;

type 
  PGtkShortcutManager = type Pointer;

  PGtkShortcutManagerInterface = type Pointer

function gtk_shortcut_manager_get_type: TGType; cdecl; external libgxxxxxxx;



end.
