
unit adap_preferences_window;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_preferences_window.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_preferences_window.h
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
PAdapNavigationPage  = ^AdapNavigationPage;
PAdapPreferencesPage  = ^AdapPreferencesPage;
PAdapPreferencesWindow  = ^AdapPreferencesWindow;
PAdapPreferencesWindowClass  = ^AdapPreferencesWindowClass;
PAdapToast  = ^AdapToast;
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
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
{$include "adap-navigation-view.h"}
{$include "adap-preferences-page.h"}
{$include "adap-toast.h"}
{$include "adap-window.h"}

{ was #define dname def_expr }
function ADAP_TYPE_PREFERENCES_WINDOW : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapPreferencesWindow, adap_preferences_window, ADAP, PREFERENCES_WINDOW, AdapWindow) }
{*
 * AdapPreferencesWindowClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdapPreferencesWindowClass = ^TAdapPreferencesWindowClass;
  TAdapPreferencesWindowClass = record
      parent_class : TAdapWindowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_preferences_window_new:PGtkWidget;cdecl;external;
procedure adap_preferences_window_add(self:PAdapPreferencesWindow; page:PAdapPreferencesPage);cdecl;external;
procedure adap_preferences_window_remove(self:PAdapPreferencesWindow; page:PAdapPreferencesPage);cdecl;external;
function adap_preferences_window_get_visible_page(self:PAdapPreferencesWindow):PAdapPreferencesPage;cdecl;external;
procedure adap_preferences_window_set_visible_page(self:PAdapPreferencesWindow; page:PAdapPreferencesPage);cdecl;external;
(* Const before type ignored *)
function adap_preferences_window_get_visible_page_name(self:PAdapPreferencesWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_preferences_window_set_visible_page_name(self:PAdapPreferencesWindow; name:Pchar);cdecl;external;
function adap_preferences_window_get_search_enabled(self:PAdapPreferencesWindow):Tgboolean;cdecl;external;
procedure adap_preferences_window_set_search_enabled(self:PAdapPreferencesWindow; search_enabled:Tgboolean);cdecl;external;
{xxxxxADAP_DEPRECATED_IN_1_4_FOR (adap_navigation_page_get_can_pop) }
function adap_preferences_window_get_can_navigate_back(self:PAdapPreferencesWindow):Tgboolean;cdecl;external;
{xxxxxADAP_DEPRECATED_IN_1_4_FOR (adap_navigation_page_set_can_pop) }
procedure adap_preferences_window_set_can_navigate_back(self:PAdapPreferencesWindow; can_navigate_back:Tgboolean);cdecl;external;
{xxxxxADAP_DEPRECATED_IN_1_4_FOR (adap_preferences_window_push_subpage) }
procedure adap_preferences_window_present_subpage(self:PAdapPreferencesWindow; subpage:PGtkWidget);cdecl;external;
{xxxxxADAP_DEPRECATED_IN_1_4_FOR (adap_preferences_window_pop_subpage) }
procedure adap_preferences_window_close_subpage(self:PAdapPreferencesWindow);cdecl;external;
procedure adap_preferences_window_push_subpage(self:PAdapPreferencesWindow; page:PAdapNavigationPage);cdecl;external;
function adap_preferences_window_pop_subpage(self:PAdapPreferencesWindow):Tgboolean;cdecl;external;
procedure adap_preferences_window_add_toast(self:PAdapPreferencesWindow; toast:PAdapToast);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_PREFERENCES_WINDOW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_PREFERENCES_WINDOW:=adap_preferences_window_get_type;
  end;


end.
