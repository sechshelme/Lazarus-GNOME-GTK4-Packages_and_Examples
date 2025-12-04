
unit adap_tab_bar;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_tab_bar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_tab_bar.h
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
PAdapTabBar  = ^AdapTabBar;
PAdapTabView  = ^AdapTabView;
PGtkWidget  = ^GtkWidget;
PGType  = ^GType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-enums.h"}
{$include "adap-tab-view.h"}

{ was #define dname def_expr }
function ADAP_TYPE_TAB_BAR : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapTabBar, adap_tab_bar, ADAP, TAB_BAR, GtkWidget) }
function adap_tab_bar_new:PAdapTabBar;cdecl;external;
function adap_tab_bar_get_view(self:PAdapTabBar):PAdapTabView;cdecl;external;
procedure adap_tab_bar_set_view(self:PAdapTabBar; view:PAdapTabView);cdecl;external;
function adap_tab_bar_get_start_action_widget(self:PAdapTabBar):PGtkWidget;cdecl;external;
procedure adap_tab_bar_set_start_action_widget(self:PAdapTabBar; widget:PGtkWidget);cdecl;external;
function adap_tab_bar_get_end_action_widget(self:PAdapTabBar):PGtkWidget;cdecl;external;
procedure adap_tab_bar_set_end_action_widget(self:PAdapTabBar; widget:PGtkWidget);cdecl;external;
function adap_tab_bar_get_autohide(self:PAdapTabBar):Tgboolean;cdecl;external;
procedure adap_tab_bar_set_autohide(self:PAdapTabBar; autohide:Tgboolean);cdecl;external;
function adap_tab_bar_get_tabs_revealed(self:PAdapTabBar):Tgboolean;cdecl;external;
function adap_tab_bar_get_expand_tabs(self:PAdapTabBar):Tgboolean;cdecl;external;
procedure adap_tab_bar_set_expand_tabs(self:PAdapTabBar; expand_tabs:Tgboolean);cdecl;external;
function adap_tab_bar_get_inverted(self:PAdapTabBar):Tgboolean;cdecl;external;
procedure adap_tab_bar_set_inverted(self:PAdapTabBar; inverted:Tgboolean);cdecl;external;
procedure adap_tab_bar_setup_extra_drop_target(self:PAdapTabBar; actions:TGdkDragAction; types:PGType; n_types:Tgsize);cdecl;external;
function adap_tab_bar_get_extra_drag_preferred_action(self:PAdapTabBar):TGdkDragAction;cdecl;external;
function adap_tab_bar_get_extra_drag_preload(self:PAdapTabBar):Tgboolean;cdecl;external;
procedure adap_tab_bar_set_extra_drag_preload(self:PAdapTabBar; preload:Tgboolean);cdecl;external;
function adap_tab_bar_get_is_overflowing(self:PAdapTabBar):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_TAB_BAR : longint; { return type might be wrong }
  begin
    ADAP_TYPE_TAB_BAR:=adap_tab_bar_get_type;
  end;


end.
