
unit gtkshortcut;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkshortcut.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkshortcut.h
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
Pchar  = ^char;
PGtkShortcut  = ^GtkShortcut;
PGtkShortcutAction  = ^GtkShortcutAction;
PGtkShortcutTrigger  = ^GtkShortcutTrigger;
PGVariant  = ^GVariant;
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

{ was #define dname def_expr }
function GTK_TYPE_SHORTCUT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkShortcut, gtk_shortcut, GTK, SHORTCUT, GObject) }
function gtk_shortcut_new(trigger:PGtkShortcutTrigger; action:PGtkShortcutAction):PGtkShortcut;cdecl;external;
(* Const before type ignored *)
function gtk_shortcut_new_with_arguments(trigger:PGtkShortcutTrigger; action:PGtkShortcutAction; format_string:Pchar; args:array of const):PGtkShortcut;cdecl;external;
function gtk_shortcut_new_with_arguments(trigger:PGtkShortcutTrigger; action:PGtkShortcutAction; format_string:Pchar):PGtkShortcut;cdecl;external;
function gtk_shortcut_get_trigger(self:PGtkShortcut):PGtkShortcutTrigger;cdecl;external;
procedure gtk_shortcut_set_trigger(self:PGtkShortcut; trigger:PGtkShortcutTrigger);cdecl;external;
function gtk_shortcut_get_action(self:PGtkShortcut):PGtkShortcutAction;cdecl;external;
procedure gtk_shortcut_set_action(self:PGtkShortcut; action:PGtkShortcutAction);cdecl;external;
function gtk_shortcut_get_arguments(self:PGtkShortcut):PGVariant;cdecl;external;
procedure gtk_shortcut_set_arguments(self:PGtkShortcut; args:PGVariant);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_SHORTCUT : longint; { return type might be wrong }
  begin
    GTK_TYPE_SHORTCUT:=gtk_shortcut_get_type;
  end;


end.
