unit adap_view_switcher_bar;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Zander Brown <zbrown@gnome.org>
 * Copyright (C) 2019 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-view-switcher.h"}

{G_DECLARE_FINAL_TYPE (AdapViewSwitcherBar, adap_view_switcher_bar, ADAP, VIEW_SWITCHER_BAR, GtkWidget) }
function adap_view_switcher_bar_new:PGtkWidget;cdecl;external libadapta;
function adap_view_switcher_bar_get_stack(self:PAdapViewSwitcherBar):PAdapViewStack;cdecl;external libadapta;
procedure adap_view_switcher_bar_set_stack(self:PAdapViewSwitcherBar; stack:PAdapViewStack);cdecl;external libadapta;
function adap_view_switcher_bar_get_reveal(self:PAdapViewSwitcherBar):Tgboolean;cdecl;external libadapta;
procedure adap_view_switcher_bar_set_reveal(self:PAdapViewSwitcherBar; reveal:Tgboolean);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:27:25 ===

function ADAP_TYPE_VIEW_SWITCHER_BAR: TGType;
function ADAP_VIEW_SWITCHER_BAR(obj: Pointer): PAdapViewSwitcherBar;
function ADAP_IS_VIEW_SWITCHER_BAR(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_VIEW_SWITCHER_BAR: TGType;
begin
  Result := adap_view_switcher_bar_get_type;
end;

function ADAP_VIEW_SWITCHER_BAR(obj: Pointer): PAdapViewSwitcherBar;
begin
  Result := PAdapViewSwitcherBar(g_type_check_instance_cast(obj, ADAP_TYPE_VIEW_SWITCHER_BAR));
end;

function ADAP_IS_VIEW_SWITCHER_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_VIEW_SWITCHER_BAR);
end;

type 
  TAdapViewSwitcherBar = record
  end;
  PAdapViewSwitcherBar = ^TAdapViewSwitcherBar;

  TAdapViewSwitcherBarClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapViewSwitcherBarClass = ^TAdapViewSwitcherBarClass;

function adap_view_switcher_bar_get_type: TGType; cdecl; external libgxxxxxxx;



end.
