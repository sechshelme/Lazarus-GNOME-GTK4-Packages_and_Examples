
unit adap_tab_overview;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_tab_overview.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_tab_overview.h
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
PAdapTabOverview  = ^AdapTabOverview;
PAdapTabView  = ^AdapTabView;
PGMenuModel  = ^GMenuModel;
PGtkWidget  = ^GtkWidget;
PGType  = ^GType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021-2022 Purism SPC
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
function ADAP_TYPE_TAB_OVERVIEW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapTabOverview, adap_tab_overview, ADAP, TAB_OVERVIEW, GtkWidget) }
function adap_tab_overview_new:PGtkWidget;cdecl;external;
function adap_tab_overview_get_view(self:PAdapTabOverview):PAdapTabView;cdecl;external;
procedure adap_tab_overview_set_view(self:PAdapTabOverview; view:PAdapTabView);cdecl;external;
function adap_tab_overview_get_child(self:PAdapTabOverview):PGtkWidget;cdecl;external;
procedure adap_tab_overview_set_child(self:PAdapTabOverview; child:PGtkWidget);cdecl;external;
function adap_tab_overview_get_open(self:PAdapTabOverview):Tgboolean;cdecl;external;
procedure adap_tab_overview_set_open(self:PAdapTabOverview; open:Tgboolean);cdecl;external;
function adap_tab_overview_get_inverted(self:PAdapTabOverview):Tgboolean;cdecl;external;
procedure adap_tab_overview_set_inverted(self:PAdapTabOverview; inverted:Tgboolean);cdecl;external;
function adap_tab_overview_get_enable_search(self:PAdapTabOverview):Tgboolean;cdecl;external;
procedure adap_tab_overview_set_enable_search(self:PAdapTabOverview; enable_search:Tgboolean);cdecl;external;
function adap_tab_overview_get_search_active(self:PAdapTabOverview):Tgboolean;cdecl;external;
function adap_tab_overview_get_enable_new_tab(self:PAdapTabOverview):Tgboolean;cdecl;external;
procedure adap_tab_overview_set_enable_new_tab(self:PAdapTabOverview; enable_new_tab:Tgboolean);cdecl;external;
function adap_tab_overview_get_secondary_menu(self:PAdapTabOverview):PGMenuModel;cdecl;external;
procedure adap_tab_overview_set_secondary_menu(self:PAdapTabOverview; secondary_menu:PGMenuModel);cdecl;external;
function adap_tab_overview_get_show_start_title_buttons(self:PAdapTabOverview):Tgboolean;cdecl;external;
procedure adap_tab_overview_set_show_start_title_buttons(self:PAdapTabOverview; show_start_title_buttons:Tgboolean);cdecl;external;
function adap_tab_overview_get_show_end_title_buttons(self:PAdapTabOverview):Tgboolean;cdecl;external;
procedure adap_tab_overview_set_show_end_title_buttons(self:PAdapTabOverview; show_end_title_buttons:Tgboolean);cdecl;external;
procedure adap_tab_overview_setup_extra_drop_target(self:PAdapTabOverview; actions:TGdkDragAction; types:PGType; n_types:Tgsize);cdecl;external;
function adap_tab_overview_get_extra_drag_preferred_action(self:PAdapTabOverview):TGdkDragAction;cdecl;external;
function adap_tab_overview_get_extra_drag_preload(self:PAdapTabOverview):Tgboolean;cdecl;external;
procedure adap_tab_overview_set_extra_drag_preload(self:PAdapTabOverview; preload:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_TAB_OVERVIEW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_TAB_OVERVIEW:=adap_tab_overview_get_type;
  end;


end.
