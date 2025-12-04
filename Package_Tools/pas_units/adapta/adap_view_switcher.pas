unit adap_view_switcher;

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
{$include "adap-view-stack.h"}

{G_DECLARE_FINAL_TYPE (AdapViewSwitcher, adap_view_switcher, ADAP, VIEW_SWITCHER, GtkWidget) }
type
  PAdapViewSwitcherPolicy = ^TAdapViewSwitcherPolicy;
  TAdapViewSwitcherPolicy =  Longint;
  Const
    ADAP_VIEW_SWITCHER_POLICY_NARROW = 0;
    ADAP_VIEW_SWITCHER_POLICY_WIDE = 1;
;

function adap_view_switcher_new:PGtkWidget;cdecl;external libadapta;
function adap_view_switcher_get_policy(self:PAdapViewSwitcher):TAdapViewSwitcherPolicy;cdecl;external libadapta;
procedure adap_view_switcher_set_policy(self:PAdapViewSwitcher; policy:TAdapViewSwitcherPolicy);cdecl;external libadapta;
function adap_view_switcher_get_stack(self:PAdapViewSwitcher):PAdapViewStack;cdecl;external libadapta;
procedure adap_view_switcher_set_stack(self:PAdapViewSwitcher; stack:PAdapViewStack);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:27:29 ===

function ADAP_TYPE_VIEW_SWITCHER: TGType;
function ADAP_VIEW_SWITCHER(obj: Pointer): PAdapViewSwitcher;
function ADAP_IS_VIEW_SWITCHER(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_VIEW_SWITCHER: TGType;
begin
  Result := adap_view_switcher_get_type;
end;

function ADAP_VIEW_SWITCHER(obj: Pointer): PAdapViewSwitcher;
begin
  Result := PAdapViewSwitcher(g_type_check_instance_cast(obj, ADAP_TYPE_VIEW_SWITCHER));
end;

function ADAP_IS_VIEW_SWITCHER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_VIEW_SWITCHER);
end;

type 
  TAdapViewSwitcher = record
  end;
  PAdapViewSwitcher = ^TAdapViewSwitcher;

  TAdapViewSwitcherClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapViewSwitcherClass = ^TAdapViewSwitcherClass;

function adap_view_switcher_get_type: TGType; cdecl; external libgxxxxxxx;



end.
