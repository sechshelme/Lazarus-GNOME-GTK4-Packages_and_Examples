
unit adap_tab_button;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_tab_button.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_tab_button.h
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
PAdapTabButton  = ^AdapTabButton;
PAdapTabView  = ^AdapTabView;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1+
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-tab-view.h"}

{ was #define dname def_expr }
function ADAP_TYPE_TAB_BUTTON : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapTabButton, adap_tab_button, ADAP, TAB_BUTTON, GtkWidget) }
function adap_tab_button_new:PGtkWidget;cdecl;external;
function adap_tab_button_get_view(self:PAdapTabButton):PAdapTabView;cdecl;external;
procedure adap_tab_button_set_view(self:PAdapTabButton; view:PAdapTabView);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_TAB_BUTTON : longint; { return type might be wrong }
  begin
    ADAP_TYPE_TAB_BUTTON:=adap_tab_button_get_type;
  end;


end.
