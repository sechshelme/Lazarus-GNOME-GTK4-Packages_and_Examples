unit gtkshortcuttrigger;

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
{$include <gtk/gtktypes.h>}

{ GDK_DECLARE_INTERNAL_TYPE (GtkShortcutTrigger, gtk_shortcut_trigger, GTK, SHORTCUT_TRIGGER, GObject) }
function gtk_shortcut_trigger_parse_string(_string:Pchar):PGtkShortcutTrigger;cdecl;external libgtk4;
function gtk_shortcut_trigger_to_string(self:PGtkShortcutTrigger):Pchar;cdecl;external libgtk4;
procedure gtk_shortcut_trigger_print(self:PGtkShortcutTrigger; _string:PGString);cdecl;external libgtk4;
function gtk_shortcut_trigger_to_label(self:PGtkShortcutTrigger; display:PGdkDisplay):Pchar;cdecl;external libgtk4;
function gtk_shortcut_trigger_print_label(self:PGtkShortcutTrigger; display:PGdkDisplay; _string:PGString):Tgboolean;cdecl;external libgtk4;
function gtk_shortcut_trigger_hash(trigger:Tgconstpointer):Tguint;cdecl;external libgtk4;
function gtk_shortcut_trigger_equal(trigger1:Tgconstpointer; trigger2:Tgconstpointer):Tgboolean;cdecl;external libgtk4;
function gtk_shortcut_trigger_compare(trigger1:Tgconstpointer; trigger2:Tgconstpointer):longint;cdecl;external libgtk4;
function gtk_shortcut_trigger_trigger(self:PGtkShortcutTrigger; event:PGdkEvent; enable_mnemonics:Tgboolean):TGdkKeyMatch;cdecl;external libgtk4;
{ was #define dname def_expr }
function GTK_TYPE_NEVER_TRIGGER : longint; { return type might be wrong }

{*
 * GtkNeverTrigger:
 *
 * A `GtkShortcutTrigger` that never triggers.
  }
{GDK_DECLARE_INTERNAL_TYPE (GtkNeverTrigger, gtk_never_trigger, GTK, NEVER_TRIGGER, GtkShortcutTrigger) }
function gtk_never_trigger_get:PGtkShortcutTrigger;cdecl;external libgtk4;
{ was #define dname def_expr }
function GTK_TYPE_KEYVAL_TRIGGER : longint; { return type might be wrong }

{*
 * GtkKeyvalTrigger:
 *
 * Triggers when a specific keyval and modifiers are pressed.
  }
{GDK_DECLARE_INTERNAL_TYPE (GtkKeyvalTrigger, gtk_keyval_trigger, GTK, KEYVAL_TRIGGER, GtkShortcutTrigger) }
function gtk_keyval_trigger_new(keyval:Tguint; modifiers:TGdkModifierType):PGtkShortcutTrigger;cdecl;external libgtk4;
function gtk_keyval_trigger_get_modifiers(self:PGtkKeyvalTrigger):TGdkModifierType;cdecl;external libgtk4;
function gtk_keyval_trigger_get_keyval(self:PGtkKeyvalTrigger):Tguint;cdecl;external libgtk4;
{ was #define dname def_expr }
function GTK_TYPE_MNEMONIC_TRIGGER : longint; { return type might be wrong }

{*
 * GtkMnemonicTrigger:
 *
 * Triggers when a specific mnemonic is pressed.
 *
 * Mnemonics require a *mnemonic modifier* (typically <kbd>Alt</kbd>) to be
 * pressed together with the mnemonic key.
  }
{GDK_DECLARE_INTERNAL_TYPE (GtkMnemonicTrigger, gtk_mnemonic_trigger, GTK, MNEMONIC_TRIGGER, GtkShortcutTrigger) }
function gtk_mnemonic_trigger_new(keyval:Tguint):PGtkShortcutTrigger;cdecl;external libgtk4;
function gtk_mnemonic_trigger_get_keyval(self:PGtkMnemonicTrigger):Tguint;cdecl;external libgtk4;
{ was #define dname def_expr }
function GTK_TYPE_ALTERNATIVE_TRIGGER : longint; { return type might be wrong }

{*
 * GtkAlternativeTrigger:
 *
 * Combines two shortcut triggers.
 *
 * The `GtkAlternativeTrigger` triggers when either of the two trigger.
 *
 * This can be cascaded to combine more than two triggers.
  }
{GDK_DECLARE_INTERNAL_TYPE (GtkAlternativeTrigger, gtk_alternative_trigger, GTK, ALTERNATIVE_TRIGGER, GtkShortcutTrigger) }
function gtk_alternative_trigger_new(first:PGtkShortcutTrigger; second:PGtkShortcutTrigger):PGtkShortcutTrigger;cdecl;external libgtk4;
function gtk_alternative_trigger_get_first(self:PGtkAlternativeTrigger):PGtkShortcutTrigger;cdecl;external libgtk4;
function gtk_alternative_trigger_get_second(self:PGtkAlternativeTrigger):PGtkShortcutTrigger;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:20:15 ===

function GTK_TYPE_SHORTCUT_TRIGGER: TGType;
function GTK_SHORTCUT_TRIGGER(obj: Pointer): PGtkShortcutTrigger;
function GTK_IS_SHORTCUT_TRIGGER(obj: Pointer): Tgboolean;
function GTK_SHORTCUT_TRIGGER_CLASS(klass: Pointer): PGtkShortcutTriggerClass;
function GTK_IS_SHORTCUT_TRIGGER_CLASS(klass: Pointer): Tgboolean;
function GTK_SHORTCUT_TRIGGER_GET_CLASS(obj: Pointer): PGtkShortcutTriggerClass;

implementation

function GTK_TYPE_SHORTCUT_TRIGGER: TGType;
begin
  Result := gtk_shortcut_trigger_get_type;
end;

function GTK_SHORTCUT_TRIGGER(obj: Pointer): PGtkShortcutTrigger;
begin
  Result := PGtkShortcutTrigger(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUT_TRIGGER));
end;

function GTK_IS_SHORTCUT_TRIGGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SHORTCUT_TRIGGER);
end;

function GTK_SHORTCUT_TRIGGER_CLASS(klass: Pointer): PGtkShortcutTriggerClass;
begin
  Result := PGtkShortcutTriggerClass(g_type_check_class_cast(klass, GTK_TYPE_SHORTCUT_TRIGGER));
end;

function GTK_IS_SHORTCUT_TRIGGER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_SHORTCUT_TRIGGER);
end;

function GTK_SHORTCUT_TRIGGER_GET_CLASS(obj: Pointer): PGtkShortcutTriggerClass;
begin
  Result := PGtkShortcutTriggerClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGtkShortcutTrigger = type Pointer;

  TGtkShortcutTriggerClass = record
  end;
  PGtkShortcutTriggerClass = ^TGtkShortcutTriggerClass;

function gtk_shortcut_trigger_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function GTK_TYPE_NEVER_TRIGGER : longint; { return type might be wrong }
  begin
    GTK_TYPE_NEVER_TRIGGER:=gtk_never_trigger_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_KEYVAL_TRIGGER : longint; { return type might be wrong }
  begin
    GTK_TYPE_KEYVAL_TRIGGER:=gtk_keyval_trigger_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_MNEMONIC_TRIGGER : longint; { return type might be wrong }
  begin
    GTK_TYPE_MNEMONIC_TRIGGER:=gtk_mnemonic_trigger_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_ALTERNATIVE_TRIGGER : longint; { return type might be wrong }
  begin
    GTK_TYPE_ALTERNATIVE_TRIGGER:=gtk_alternative_trigger_get_type;
  end;


end.
