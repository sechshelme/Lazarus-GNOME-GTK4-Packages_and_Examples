
unit adap_switch_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_switch_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_switch_row.h
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
PAdapSwitchRow  = ^AdapSwitchRow;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly"}
{$endif}
{$include "adap-version.h"}
{$include "adap-action-row.h"}

{ was #define dname def_expr }
function ADAP_TYPE_SWITCH_ROW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapSwitchRow, adap_switch_row, ADAP, SWITCH_ROW, AdapActionRow) }
function adap_switch_row_new:PGtkWidget;cdecl;external;
function adap_switch_row_get_active(self:PAdapSwitchRow):Tgboolean;cdecl;external;
procedure adap_switch_row_set_active(self:PAdapSwitchRow; is_active:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_SWITCH_ROW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_SWITCH_ROW:=adap_switch_row_get_type;
  end;


end.
