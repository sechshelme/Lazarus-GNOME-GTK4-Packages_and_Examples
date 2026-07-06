
unit gtkshortcutaction;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkshortcutaction.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkshortcutaction.h
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
PGString  = ^GString;
PGtkNamedAction  = ^GtkNamedAction;
PGtkShortcutAction  = ^GtkShortcutAction;
PGtkShortcutActionFlags  = ^GtkShortcutActionFlags;
PGtkSignalAction  = ^GtkSignalAction;
PGtkWidget  = ^GtkWidget;
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
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtktypes.h>}

{ was #define dname def_expr }
function GTK_TYPE_SHORTCUT_ACTION : longint; { return type might be wrong }

{*
 * GtkShortcutFunc:
 * @widget: The widget passed to the activation
 * @args: (nullable): The arguments passed to the activation
 * @user_data: (nullable): The user data provided when activating the action
 *
 * Type for shortcuts based on user callbacks.
 *
 * Returns: true if the action was successful
  }
type

  TGtkShortcutFunc = function (widget:PGtkWidget; args:PGVariant; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GtkShortcutActionFlags:
 * @GTK_SHORTCUT_ACTION_EXCLUSIVE: The action is the only
 *   action that can be activated. If this flag is not set,
 *   a future activation may select a different action.
 *
 * Flags that can be passed to action activation.
 *
 * More flags may be added in the future.
 * }

  PGtkShortcutActionFlags = ^TGtkShortcutActionFlags;
  TGtkShortcutActionFlags =  Longint;
  Const
    GTK_SHORTCUT_ACTION_EXCLUSIVE = 1 shl 0;
;
{GDK_DECLARE_INTERNAL_TYPE (GtkShortcutAction, gtk_shortcut_action, GTK, SHORTCUT_ACTION, GObject) }

function gtk_shortcut_action_to_string(self:PGtkShortcutAction):Pchar;cdecl;external;
(* Const before type ignored *)
function gtk_shortcut_action_parse_string(_string:Pchar):PGtkShortcutAction;cdecl;external;
procedure gtk_shortcut_action_print(self:PGtkShortcutAction; _string:PGString);cdecl;external;
function gtk_shortcut_action_activate(self:PGtkShortcutAction; flags:TGtkShortcutActionFlags; widget:PGtkWidget; args:PGVariant):Tgboolean;cdecl;external;
{ was #define dname def_expr }
function GTK_TYPE_NOTHING_ACTION : longint; { return type might be wrong }

{*
 * GtkNothingAction:
 *
 * Does nothing.
  }
{GDK_DECLARE_INTERNAL_TYPE (GtkNothingAction, gtk_nothing_action, GTK, NOTHING_ACTION, GtkShortcutAction) }
function gtk_nothing_action_get:PGtkShortcutAction;cdecl;external;
{ was #define dname def_expr }
function GTK_TYPE_CALLBACK_ACTION : longint; { return type might be wrong }

{*
 * GtkCallbackAction:
 *
 * Invokes a callback.
  }
{GDK_DECLARE_INTERNAL_TYPE (GtkCallbackAction, gtk_callback_action, GTK, CALLBACK_ACTION, GtkShortcutAction) }
function gtk_callback_action_new(callback:TGtkShortcutFunc; data:Tgpointer; destroy:TGDestroyNotify):PGtkShortcutAction;cdecl;external;
{ was #define dname def_expr }
function GTK_TYPE_MNEMONIC_ACTION : longint; { return type might be wrong }

{*
 * GtkMnemonicAction:
 *
 * Activates a widget with a mnemonic.
 *
 * This means that [method@Gtk.Widget.mnemonic_activate] is called.
  }
{GDK_DECLARE_INTERNAL_TYPE (GtkMnemonicAction, gtk_mnemonic_action, GTK, MNEMONIC_ACTION, GtkShortcutAction) }
function gtk_mnemonic_action_get:PGtkShortcutAction;cdecl;external;
{ was #define dname def_expr }
function GTK_TYPE_ACTIVATE_ACTION : longint; { return type might be wrong }

{*
 * GtkActivateAction:
 *
 * Activates a widget.
 *
 * Widgets are activated by calling [method@Gtk.Widget.activate].
  }
{GDK_DECLARE_INTERNAL_TYPE (GtkActivateAction, gtk_activate_action, GTK, ACTIVATE_ACTION, GtkShortcutAction) }
function gtk_activate_action_get:PGtkShortcutAction;cdecl;external;
{ was #define dname def_expr }
function GTK_TYPE_SIGNAL_ACTION : longint; { return type might be wrong }

{*
 * GtkSignalAction:
 *
 * Emits a signal on a widget.
 *
 * Signals that are used in this way are referred to as keybinding signals,
 * and they are expected to be defined with the `G_SIGNAL_ACTION` flag.
  }
{GDK_DECLARE_INTERNAL_TYPE (GtkSignalAction, gtk_signal_action, GTK, SIGNAL_ACTION, GtkShortcutAction) }
(* Const before type ignored *)
function gtk_signal_action_new(signal_name:Pchar):PGtkShortcutAction;cdecl;external;
(* Const before type ignored *)
function gtk_signal_action_get_signal_name(self:PGtkSignalAction):Pchar;cdecl;external;
{ was #define dname def_expr }
function GTK_TYPE_NAMED_ACTION : longint; { return type might be wrong }

{*
 * GtkNamedAction:
 *
 * Activates a named action.
 *
 * See [method@Gtk.WidgetClass.install_action] and
 * [method@Gtk.Widget.insert_action_group] for ways
 * to associate named actions with widgets.
  }
{GDK_DECLARE_INTERNAL_TYPE (GtkNamedAction, gtk_named_action, GTK, NAMED_ACTION, GtkShortcutAction) }
(* Const before type ignored *)
function gtk_named_action_new(name:Pchar):PGtkShortcutAction;cdecl;external;
(* Const before type ignored *)
function gtk_named_action_get_action_name(self:PGtkNamedAction):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_SHORTCUT_ACTION : longint; { return type might be wrong }
  begin
    GTK_TYPE_SHORTCUT_ACTION:=gtk_shortcut_action_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_NOTHING_ACTION : longint; { return type might be wrong }
  begin
    GTK_TYPE_NOTHING_ACTION:=gtk_nothing_action_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_CALLBACK_ACTION : longint; { return type might be wrong }
  begin
    GTK_TYPE_CALLBACK_ACTION:=gtk_callback_action_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_MNEMONIC_ACTION : longint; { return type might be wrong }
  begin
    GTK_TYPE_MNEMONIC_ACTION:=gtk_mnemonic_action_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_ACTIVATE_ACTION : longint; { return type might be wrong }
  begin
    GTK_TYPE_ACTIVATE_ACTION:=gtk_activate_action_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_SIGNAL_ACTION : longint; { return type might be wrong }
  begin
    GTK_TYPE_SIGNAL_ACTION:=gtk_signal_action_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_NAMED_ACTION : longint; { return type might be wrong }
  begin
    GTK_TYPE_NAMED_ACTION:=gtk_named_action_get_type;
  end;


end.
