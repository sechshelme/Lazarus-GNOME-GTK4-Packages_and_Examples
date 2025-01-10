
unit adw_tab_bar;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_tab_bar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_tab_bar.h
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
PAdwTabBar  = ^AdwTabBar;
PAdwTabView  = ^AdwTabView;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-enums.h"}
{$include "adw-tab-view.h"}

{ was #define dname def_expr }
function ADW_TYPE_TAB_BAR : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwTabBar, adw_tab_bar, ADW, TAB_BAR, GtkWidget) }
function adw_tab_bar_new:PAdwTabBar;cdecl;external;
function adw_tab_bar_get_view(self:PAdwTabBar):PAdwTabView;cdecl;external;
procedure adw_tab_bar_set_view(self:PAdwTabBar; view:PAdwTabView);cdecl;external;
function adw_tab_bar_get_start_action_widget(self:PAdwTabBar):PGtkWidget;cdecl;external;
procedure adw_tab_bar_set_start_action_widget(self:PAdwTabBar; widget:PGtkWidget);cdecl;external;
function adw_tab_bar_get_end_action_widget(self:PAdwTabBar):PGtkWidget;cdecl;external;
procedure adw_tab_bar_set_end_action_widget(self:PAdwTabBar; widget:PGtkWidget);cdecl;external;
function adw_tab_bar_get_autohide(self:PAdwTabBar):Tgboolean;cdecl;external;
procedure adw_tab_bar_set_autohide(self:PAdwTabBar; autohide:Tgboolean);cdecl;external;
function adw_tab_bar_get_tabs_revealed(self:PAdwTabBar):Tgboolean;cdecl;external;
function adw_tab_bar_get_expand_tabs(self:PAdwTabBar):Tgboolean;cdecl;external;
procedure adw_tab_bar_set_expand_tabs(self:PAdwTabBar; expand_tabs:Tgboolean);cdecl;external;
function adw_tab_bar_get_inverted(self:PAdwTabBar):Tgboolean;cdecl;external;
procedure adw_tab_bar_set_inverted(self:PAdwTabBar; inverted:Tgboolean);cdecl;external;
procedure adw_tab_bar_setup_extra_drop_target(self:PAdwTabBar; actions:TGdkDragAction; types:PGType; n_types:Tgsize);cdecl;external;
function adw_tab_bar_get_extra_drag_preferred_action(self:PAdwTabBar):TGdkDragAction;cdecl;external;
function adw_tab_bar_get_extra_drag_preload(self:PAdwTabBar):Tgboolean;cdecl;external;
procedure adw_tab_bar_set_extra_drag_preload(self:PAdwTabBar; preload:Tgboolean);cdecl;external;
function adw_tab_bar_get_is_overflowing(self:PAdwTabBar):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_TAB_BAR : longint; { return type might be wrong }
  begin
    ADW_TYPE_TAB_BAR:=adw_tab_bar_get_type;
  end;


end.
