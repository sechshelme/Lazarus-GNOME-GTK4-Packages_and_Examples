unit adap_view_switcher_title;

interface

uses
  fp_adapta;

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

{ADAP_DEPRECATED_IN_1_4 }
{G_DECLARE_FINAL_TYPE (AdapViewSwitcherTitle, adap_view_switcher_title, ADAP, VIEW_SWITCHER_TITLE, GtkWidget) }
{ADAP_DEPRECATED_IN_1_4 }
function adap_view_switcher_title_new:PGtkWidget;cdecl;external libadapta;
{ADAP_DEPRECATED_IN_1_4 }
function adap_view_switcher_title_get_stack(self:PAdapViewSwitcherTitle):PAdapViewStack;cdecl;external libadapta;
{ADAP_DEPRECATED_IN_1_4 }
procedure adap_view_switcher_title_set_stack(self:PAdapViewSwitcherTitle; stack:PAdapViewStack);cdecl;external libadapta;
{ADAP_DEPRECATED_IN_1_4 }
function adap_view_switcher_title_get_title(self:PAdapViewSwitcherTitle):Pchar;cdecl;external libadapta;
{ADAP_DEPRECATED_IN_1_4 }
procedure adap_view_switcher_title_set_title(self:PAdapViewSwitcherTitle; title:Pchar);cdecl;external libadapta;
{ADAP_DEPRECATED_IN_1_4 }
function adap_view_switcher_title_get_subtitle(self:PAdapViewSwitcherTitle):Pchar;cdecl;external libadapta;
{ADAP_DEPRECATED_IN_1_4 }
procedure adap_view_switcher_title_set_subtitle(self:PAdapViewSwitcherTitle; subtitle:Pchar);cdecl;external libadapta;
{ADAP_DEPRECATED_IN_1_4 }
function adap_view_switcher_title_get_view_switcher_enabled(self:PAdapViewSwitcherTitle):Tgboolean;cdecl;external libadapta;
{ADAP_DEPRECATED_IN_1_4 }
procedure adap_view_switcher_title_set_view_switcher_enabled(self:PAdapViewSwitcherTitle; enabled:Tgboolean);cdecl;external libadapta;
{ADAP_DEPRECATED_IN_1_4 }
function adap_view_switcher_title_get_title_visible(self:PAdapViewSwitcherTitle):Tgboolean;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:27:23 ===

function ADAP_TYPE_VIEW_SWITCHER_TITLE: TGType;
function ADAP_VIEW_SWITCHER_TITLE(obj: Pointer): PAdapViewSwitcherTitle;
function ADAP_IS_VIEW_SWITCHER_TITLE(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_VIEW_SWITCHER_TITLE: TGType;
begin
  Result := adap_view_switcher_title_get_type;
end;

function ADAP_VIEW_SWITCHER_TITLE(obj: Pointer): PAdapViewSwitcherTitle;
begin
  Result := PAdapViewSwitcherTitle(g_type_check_instance_cast(obj, ADAP_TYPE_VIEW_SWITCHER_TITLE));
end;

function ADAP_IS_VIEW_SWITCHER_TITLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_VIEW_SWITCHER_TITLE);
end;

type 
  TAdapViewSwitcherTitle = record
  end;
  PAdapViewSwitcherTitle = ^TAdapViewSwitcherTitle;

  TAdapViewSwitcherTitleClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapViewSwitcherTitleClass = ^TAdapViewSwitcherTitleClass;

function adap_view_switcher_title_get_type: TGType; cdecl; external libgxxxxxxx;



end.
