unit adap_tab_button;

interface

uses
  fp_adapta;

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

{G_DECLARE_FINAL_TYPE (AdapTabButton, adap_tab_button, ADAP, TAB_BUTTON, GtkWidget) }
function adap_tab_button_new:PGtkWidget;cdecl;external libadapta;
function adap_tab_button_get_view(self:PAdapTabButton):PAdapTabView;cdecl;external libadapta;
procedure adap_tab_button_set_view(self:PAdapTabButton; view:PAdapTabView);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:27:57 ===

function ADAP_TYPE_TAB_BUTTON: TGType;
function ADAP_TAB_BUTTON(obj: Pointer): PAdapTabButton;
function ADAP_IS_TAB_BUTTON(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_TAB_BUTTON: TGType;
begin
  Result := adap_tab_button_get_type;
end;

function ADAP_TAB_BUTTON(obj: Pointer): PAdapTabButton;
begin
  Result := PAdapTabButton(g_type_check_instance_cast(obj, ADAP_TYPE_TAB_BUTTON));
end;

function ADAP_IS_TAB_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_TAB_BUTTON);
end;

type 
  TAdapTabButton = record
  end;
  PAdapTabButton = ^TAdapTabButton;

  TAdapTabButtonClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapTabButtonClass = ^TAdapTabButtonClass;

function adap_tab_button_get_type: TGType; cdecl; external libgxxxxxxx;



end.
