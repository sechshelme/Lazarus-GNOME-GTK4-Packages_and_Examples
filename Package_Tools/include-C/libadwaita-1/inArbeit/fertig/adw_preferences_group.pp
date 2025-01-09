
unit adw_preferences_group;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_preferences_group.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_preferences_group.h
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
PAdwPreferencesGroup  = ^AdwPreferencesGroup;
PAdwPreferencesGroupClass  = ^AdwPreferencesGroupClass;
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADW_TYPE_PREFERENCES_GROUP : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwPreferencesGroup, adw_preferences_group, ADW, PREFERENCES_GROUP, GtkWidget) }
{*
 * AdwPreferencesGroupClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdwPreferencesGroupClass = ^TAdwPreferencesGroupClass;
  TAdwPreferencesGroupClass = record
      parent_class : TGtkWidgetClass;
      padding : array[0..3] of Tgpointer;
    end;


function adw_preferences_group_new:PGtkWidget;cdecl;external;
procedure adw_preferences_group_add(self:PAdwPreferencesGroup; child:PGtkWidget);cdecl;external;
procedure adw_preferences_group_remove(self:PAdwPreferencesGroup; child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
function adw_preferences_group_get_title(self:PAdwPreferencesGroup):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_preferences_group_set_title(self:PAdwPreferencesGroup; title:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_preferences_group_get_description(self:PAdwPreferencesGroup):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_preferences_group_set_description(self:PAdwPreferencesGroup; description:Pchar);cdecl;external;
function adw_preferences_group_get_header_suffix(self:PAdwPreferencesGroup):PGtkWidget;cdecl;external;
procedure adw_preferences_group_set_header_suffix(self:PAdwPreferencesGroup; suffix:PGtkWidget);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_PREFERENCES_GROUP : longint; { return type might be wrong }
  begin
    ADW_TYPE_PREFERENCES_GROUP:=adw_preferences_group_get_type;
  end;


end.
