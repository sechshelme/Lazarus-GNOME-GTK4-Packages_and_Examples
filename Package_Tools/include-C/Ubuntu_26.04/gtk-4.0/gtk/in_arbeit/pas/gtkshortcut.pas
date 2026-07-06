unit gtkshortcut;

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
{$include <gtk/gtktypes.h>}

{G_DECLARE_FINAL_TYPE (GtkShortcut, gtk_shortcut, GTK, SHORTCUT, GObject) }
function gtk_shortcut_new(trigger:PGtkShortcutTrigger; action:PGtkShortcutAction):PGtkShortcut;cdecl;external libgtk4;
function gtk_shortcut_new_with_arguments(trigger:PGtkShortcutTrigger; action:PGtkShortcutAction; format_string:Pchar; args:array of const):PGtkShortcut;cdecl;external libgtk4;
function gtk_shortcut_new_with_arguments(trigger:PGtkShortcutTrigger; action:PGtkShortcutAction; format_string:Pchar):PGtkShortcut;cdecl;external libgtk4;
function gtk_shortcut_get_trigger(self:PGtkShortcut):PGtkShortcutTrigger;cdecl;external libgtk4;
procedure gtk_shortcut_set_trigger(self:PGtkShortcut; trigger:PGtkShortcutTrigger);cdecl;external libgtk4;
function gtk_shortcut_get_action(self:PGtkShortcut):PGtkShortcutAction;cdecl;external libgtk4;
procedure gtk_shortcut_set_action(self:PGtkShortcut; action:PGtkShortcutAction);cdecl;external libgtk4;
function gtk_shortcut_get_arguments(self:PGtkShortcut):PGVariant;cdecl;external libgtk4;
procedure gtk_shortcut_set_arguments(self:PGtkShortcut; args:PGVariant);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:00:14 ===

function GTK_TYPE_SHORTCUT: TGType;
function GTK_SHORTCUT(obj: Pointer): PGtkShortcut;
function GTK_IS_SHORTCUT(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_SHORTCUT: TGType;
begin
  Result := gtk_shortcut_get_type;
end;

function GTK_SHORTCUT(obj: Pointer): PGtkShortcut;
begin
  Result := PGtkShortcut(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUT));
end;

function GTK_IS_SHORTCUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SHORTCUT);
end;

type 
  PGtkShortcut = type Pointer;

  TGtkShortcutClass = record
    parent_class: TGObjectClass;
  end;
  PGtkShortcutClass = ^TGtkShortcutClass;

function gtk_shortcut_get_type: TGType; cdecl; external libgxxxxxxx;



end.
