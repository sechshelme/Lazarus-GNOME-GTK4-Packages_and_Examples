
unit adap_action_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_action_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_action_row.h
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
PAdapActionRow  = ^AdapActionRow;
PAdapActionRowClass  = ^AdapActionRowClass;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include "adap-preferences-row.h"}

{ was #define dname def_expr }
function ADAP_TYPE_ACTION_ROW : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapActionRow, adap_action_row, ADAP, ACTION_ROW, AdapPreferencesRow) }
{*
 * AdapActionRowClass
 * @parent_class: The parent class
 * @activate: Activates the row to trigger its main action.
  }
{< private > }
type
  PAdapActionRowClass = ^TAdapActionRowClass;
  TAdapActionRowClass = record
      parent_class : TAdapPreferencesRowClass;
      activate : procedure (self:PAdapActionRow);cdecl;
      padding : array[0..3] of Tgpointer;
    end;


function adap_action_row_new:PGtkWidget;cdecl;external;
procedure adap_action_row_add_prefix(self:PAdapActionRow; widget:PGtkWidget);cdecl;external;
procedure adap_action_row_add_suffix(self:PAdapActionRow; widget:PGtkWidget);cdecl;external;
procedure adap_action_row_remove(self:PAdapActionRow; widget:PGtkWidget);cdecl;external;
(* Const before type ignored *)
function adap_action_row_get_subtitle(self:PAdapActionRow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_action_row_set_subtitle(self:PAdapActionRow; subtitle:Pchar);cdecl;external;
{xxxxxxxxADAP_DEPRECATED_IN_1_3_FOR (adap_action_row_add_prefix) }
(* Const before type ignored *)
function adap_action_row_get_icon_name(self:PAdapActionRow):Pchar;cdecl;external;
{xxxxxxxxxxADAP_DEPRECATED_IN_1_3_FOR (adap_action_row_add_prefix) }
(* Const before type ignored *)
procedure adap_action_row_set_icon_name(self:PAdapActionRow; icon_name:Pchar);cdecl;external;
function adap_action_row_get_activatable_widget(self:PAdapActionRow):PGtkWidget;cdecl;external;
procedure adap_action_row_set_activatable_widget(self:PAdapActionRow; widget:PGtkWidget);cdecl;external;
function adap_action_row_get_title_lines(self:PAdapActionRow):longint;cdecl;external;
procedure adap_action_row_set_title_lines(self:PAdapActionRow; title_lines:longint);cdecl;external;
function adap_action_row_get_subtitle_lines(self:PAdapActionRow):longint;cdecl;external;
procedure adap_action_row_set_subtitle_lines(self:PAdapActionRow; subtitle_lines:longint);cdecl;external;
function adap_action_row_get_subtitle_selectable(self:PAdapActionRow):Tgboolean;cdecl;external;
procedure adap_action_row_set_subtitle_selectable(self:PAdapActionRow; subtitle_selectable:Tgboolean);cdecl;external;
procedure adap_action_row_activate(self:PAdapActionRow);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_ACTION_ROW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_ACTION_ROW:=adap_action_row_get_type;
  end;


end.
