
unit adw_switch_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_switch_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_switch_row.h
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
PAdwSwitchRow  = ^AdwSwitchRow;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2023 Joshua Lee <lee.son.wai@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly"}
{$endif}
{$include "adw-version.h"}
{$include "adw-action-row.h"}

{ was #define dname def_expr }
function ADW_TYPE_SWITCH_ROW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwSwitchRow, adw_switch_row, ADW, SWITCH_ROW, AdwActionRow) }
function adw_switch_row_new:PGtkWidget;cdecl;external;
function adw_switch_row_get_active(self:PAdwSwitchRow):Tgboolean;cdecl;external;
procedure adw_switch_row_set_active(self:PAdwSwitchRow; is_active:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_SWITCH_ROW : longint; { return type might be wrong }
  begin
    ADW_TYPE_SWITCH_ROW:=adw_switch_row_get_type;
  end;


end.
