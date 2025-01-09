
unit adw_action_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_action_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_action_row.h
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
PAdwActionRow  = ^AdwActionRow;
PAdwActionRowClass  = ^AdwActionRowClass;
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include "adw-preferences-row.h"}

{ was #define dname def_expr }
function ADW_TYPE_ACTION_ROW : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwActionRow, adw_action_row, ADW, ACTION_ROW, AdwPreferencesRow) }
{*
 * AdwActionRowClass
 * @parent_class: The parent class
 * @activate: Activates the row to trigger its main action.
  }
{< private > }
type
  PAdwActionRowClass = ^TAdwActionRowClass;
  TAdwActionRowClass = record
      parent_class : TAdwPreferencesRowClass;
      activate : procedure (self:PAdwActionRow);cdecl;
      padding : array[0..3] of Tgpointer;
    end;


function adw_action_row_new:PGtkWidget;cdecl;external;
procedure adw_action_row_add_prefix(self:PAdwActionRow; widget:PGtkWidget);cdecl;external;
procedure adw_action_row_add_suffix(self:PAdwActionRow; widget:PGtkWidget);cdecl;external;
procedure adw_action_row_remove(self:PAdwActionRow; widget:PGtkWidget);cdecl;external;
(* Const before type ignored *)
function adw_action_row_get_subtitle(self:PAdwActionRow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_action_row_set_subtitle(self:PAdwActionRow; subtitle:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_action_row_get_icon_name(self:PAdwActionRow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_action_row_set_icon_name(self:PAdwActionRow; icon_name:Pchar);cdecl;external;
function adw_action_row_get_activatable_widget(self:PAdwActionRow):PGtkWidget;cdecl;external;
procedure adw_action_row_set_activatable_widget(self:PAdwActionRow; widget:PGtkWidget);cdecl;external;
function adw_action_row_get_title_lines(self:PAdwActionRow):longint;cdecl;external;
procedure adw_action_row_set_title_lines(self:PAdwActionRow; title_lines:longint);cdecl;external;
function adw_action_row_get_subtitle_lines(self:PAdwActionRow):longint;cdecl;external;
procedure adw_action_row_set_subtitle_lines(self:PAdwActionRow; subtitle_lines:longint);cdecl;external;
function adw_action_row_get_subtitle_selectable(self:PAdwActionRow):Tgboolean;cdecl;external;
procedure adw_action_row_set_subtitle_selectable(self:PAdwActionRow; subtitle_selectable:Tgboolean);cdecl;external;
procedure adw_action_row_activate(self:PAdwActionRow);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_ACTION_ROW : longint; { return type might be wrong }
  begin
    ADW_TYPE_ACTION_ROW:=adw_action_row_get_type;
  end;


end.
