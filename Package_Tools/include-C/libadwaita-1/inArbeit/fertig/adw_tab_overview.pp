
unit adw_tab_overview;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_tab_overview.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_tab_overview.h
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
PAdwTabOverview  = ^AdwTabOverview;
PAdwTabView  = ^AdwTabView;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-tab-view.h"}

{ was #define dname def_expr }
function ADW_TYPE_TAB_OVERVIEW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwTabOverview, adw_tab_overview, ADW, TAB_OVERVIEW, GtkWidget) }
function adw_tab_overview_new:PGtkWidget;cdecl;external;
function adw_tab_overview_get_view(self:PAdwTabOverview):PAdwTabView;cdecl;external;
procedure adw_tab_overview_set_view(self:PAdwTabOverview; view:PAdwTabView);cdecl;external;
function adw_tab_overview_get_child(self:PAdwTabOverview):PGtkWidget;cdecl;external;
procedure adw_tab_overview_set_child(self:PAdwTabOverview; child:PGtkWidget);cdecl;external;
function adw_tab_overview_get_open(self:PAdwTabOverview):Tgboolean;cdecl;external;
procedure adw_tab_overview_set_open(self:PAdwTabOverview; open:Tgboolean);cdecl;external;
function adw_tab_overview_get_inverted(self:PAdwTabOverview):Tgboolean;cdecl;external;
procedure adw_tab_overview_set_inverted(self:PAdwTabOverview; inverted:Tgboolean);cdecl;external;
function adw_tab_overview_get_enable_search(self:PAdwTabOverview):Tgboolean;cdecl;external;
procedure adw_tab_overview_set_enable_search(self:PAdwTabOverview; enable_search:Tgboolean);cdecl;external;
function adw_tab_overview_get_search_active(self:PAdwTabOverview):Tgboolean;cdecl;external;
function adw_tab_overview_get_enable_new_tab(self:PAdwTabOverview):Tgboolean;cdecl;external;
procedure adw_tab_overview_set_enable_new_tab(self:PAdwTabOverview; enable_new_tab:Tgboolean);cdecl;external;
function adw_tab_overview_get_secondary_menu(self:PAdwTabOverview):PGMenuModel;cdecl;external;
procedure adw_tab_overview_set_secondary_menu(self:PAdwTabOverview; secondary_menu:PGMenuModel);cdecl;external;
function adw_tab_overview_get_show_start_title_buttons(self:PAdwTabOverview):Tgboolean;cdecl;external;
procedure adw_tab_overview_set_show_start_title_buttons(self:PAdwTabOverview; show_start_title_buttons:Tgboolean);cdecl;external;
function adw_tab_overview_get_show_end_title_buttons(self:PAdwTabOverview):Tgboolean;cdecl;external;
procedure adw_tab_overview_set_show_end_title_buttons(self:PAdwTabOverview; show_end_title_buttons:Tgboolean);cdecl;external;
procedure adw_tab_overview_setup_extra_drop_target(self:PAdwTabOverview; actions:TGdkDragAction; types:PGType; n_types:Tgsize);cdecl;external;
function adw_tab_overview_get_extra_drag_preferred_action(self:PAdwTabOverview):TGdkDragAction;cdecl;external;
function adw_tab_overview_get_extra_drag_preload(self:PAdwTabOverview):Tgboolean;cdecl;external;
procedure adw_tab_overview_set_extra_drag_preload(self:PAdwTabOverview; preload:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_TAB_OVERVIEW : longint; { return type might be wrong }
  begin
    ADW_TYPE_TAB_OVERVIEW:=adw_tab_overview_get_type;
  end;


end.
