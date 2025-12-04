unit adap_split_button;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}

{G_DECLARE_FINAL_TYPE (AdapSplitButton, adap_split_button, ADAP, SPLIT_BUTTON, GtkWidget) }
function adap_split_button_new:PGtkWidget;cdecl;external libadapta;
function adap_split_button_get_label(self:PAdapSplitButton):Pchar;cdecl;external libadapta;
procedure adap_split_button_set_label(self:PAdapSplitButton; _label:Pchar);cdecl;external libadapta;
function adap_split_button_get_use_underline(self:PAdapSplitButton):Tgboolean;cdecl;external libadapta;
procedure adap_split_button_set_use_underline(self:PAdapSplitButton; use_underline:Tgboolean);cdecl;external libadapta;
function adap_split_button_get_icon_name(self:PAdapSplitButton):Pchar;cdecl;external libadapta;
procedure adap_split_button_set_icon_name(self:PAdapSplitButton; icon_name:Pchar);cdecl;external libadapta;
function adap_split_button_get_child(self:PAdapSplitButton):PGtkWidget;cdecl;external libadapta;
procedure adap_split_button_set_child(self:PAdapSplitButton; child:PGtkWidget);cdecl;external libadapta;
function adap_split_button_get_can_shrink(self:PAdapSplitButton):Tgboolean;cdecl;external libadapta;
procedure adap_split_button_set_can_shrink(self:PAdapSplitButton; can_shrink:Tgboolean);cdecl;external libadapta;
function adap_split_button_get_menu_model(self:PAdapSplitButton):PGMenuModel;cdecl;external libadapta;
procedure adap_split_button_set_menu_model(self:PAdapSplitButton; menu_model:PGMenuModel);cdecl;external libadapta;
function adap_split_button_get_popover(self:PAdapSplitButton):PGtkPopover;cdecl;external libadapta;
procedure adap_split_button_set_popover(self:PAdapSplitButton; popover:PGtkPopover);cdecl;external libadapta;
function adap_split_button_get_direction(self:PAdapSplitButton):TGtkArrowType;cdecl;external libadapta;
procedure adap_split_button_set_direction(self:PAdapSplitButton; direction:TGtkArrowType);cdecl;external libadapta;
function adap_split_button_get_dropdown_tooltip(self:PAdapSplitButton):Pchar;cdecl;external libadapta;
procedure adap_split_button_set_dropdown_tooltip(self:PAdapSplitButton; tooltip:Pchar);cdecl;external libadapta;
procedure adap_split_button_popup(self:PAdapSplitButton);cdecl;external libadapta;
procedure adap_split_button_popdown(self:PAdapSplitButton);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:18:40 ===

function ADAP_TYPE_SPLIT_BUTTON: TGType;
function ADAP_SPLIT_BUTTON(obj: Pointer): PAdapSplitButton;
function ADAP_IS_SPLIT_BUTTON(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_SPLIT_BUTTON: TGType;
begin
  Result := adap_split_button_get_type;
end;

function ADAP_SPLIT_BUTTON(obj: Pointer): PAdapSplitButton;
begin
  Result := PAdapSplitButton(g_type_check_instance_cast(obj, ADAP_TYPE_SPLIT_BUTTON));
end;

function ADAP_IS_SPLIT_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_SPLIT_BUTTON);
end;

type 
  TAdapSplitButton = record
  end;
  PAdapSplitButton = ^TAdapSplitButton;

  TAdapSplitButtonClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapSplitButtonClass = ^TAdapSplitButtonClass;

function adap_split_button_get_type: TGType; cdecl; external libgxxxxxxx;



end.
