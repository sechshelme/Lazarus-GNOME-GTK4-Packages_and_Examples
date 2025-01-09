
unit adw_preferences_window;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_preferences_window.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_preferences_window.h
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
PAdwNavigationPage  = ^AdwNavigationPage;
PAdwPreferencesPage  = ^AdwPreferencesPage;
PAdwPreferencesWindow  = ^AdwPreferencesWindow;
PAdwPreferencesWindowClass  = ^AdwPreferencesWindowClass;
PAdwToast  = ^AdwToast;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-navigation-view.h"}
{$include "adw-preferences-page.h"}
{$include "adw-toast.h"}
{$include "adw-window.h"}

{ was #define dname def_expr }
function ADW_TYPE_PREFERENCES_WINDOW : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwPreferencesWindow, adw_preferences_window, ADW, PREFERENCES_WINDOW, AdwWindow) }
{*
 * AdwPreferencesWindowClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdwPreferencesWindowClass = ^TAdwPreferencesWindowClass;
  TAdwPreferencesWindowClass = record
      parent_class : TAdwWindowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adw_preferences_window_new:PGtkWidget;cdecl;external;
procedure adw_preferences_window_add(self:PAdwPreferencesWindow; page:PAdwPreferencesPage);cdecl;external;
procedure adw_preferences_window_remove(self:PAdwPreferencesWindow; page:PAdwPreferencesPage);cdecl;external;
function adw_preferences_window_get_visible_page(self:PAdwPreferencesWindow):PAdwPreferencesPage;cdecl;external;
procedure adw_preferences_window_set_visible_page(self:PAdwPreferencesWindow; page:PAdwPreferencesPage);cdecl;external;
(* Const before type ignored *)
function adw_preferences_window_get_visible_page_name(self:PAdwPreferencesWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_preferences_window_set_visible_page_name(self:PAdwPreferencesWindow; name:Pchar);cdecl;external;
function adw_preferences_window_get_search_enabled(self:PAdwPreferencesWindow):Tgboolean;cdecl;external;
procedure adw_preferences_window_set_search_enabled(self:PAdwPreferencesWindow; search_enabled:Tgboolean);cdecl;external;
function adw_preferences_window_get_can_navigate_back(self:PAdwPreferencesWindow):Tgboolean;cdecl;external;
procedure adw_preferences_window_set_can_navigate_back(self:PAdwPreferencesWindow; can_navigate_back:Tgboolean);cdecl;external;
procedure adw_preferences_window_present_subpage(self:PAdwPreferencesWindow; subpage:PGtkWidget);cdecl;external;
procedure adw_preferences_window_close_subpage(self:PAdwPreferencesWindow);cdecl;external;
procedure adw_preferences_window_push_subpage(self:PAdwPreferencesWindow; page:PAdwNavigationPage);cdecl;external;
function adw_preferences_window_pop_subpage(self:PAdwPreferencesWindow):Tgboolean;cdecl;external;
procedure adw_preferences_window_add_toast(self:PAdwPreferencesWindow; toast:PAdwToast);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_PREFERENCES_WINDOW : longint; { return type might be wrong }
  begin
    ADW_TYPE_PREFERENCES_WINDOW:=adw_preferences_window_get_type;
  end;


end.
