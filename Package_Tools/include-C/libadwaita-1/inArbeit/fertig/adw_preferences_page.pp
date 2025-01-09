
unit adw_preferences_page;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_preferences_page.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_preferences_page.h
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
PAdwPreferencesGroup  = ^AdwPreferencesGroup;
PAdwPreferencesPage  = ^AdwPreferencesPage;
PAdwPreferencesPageClass  = ^AdwPreferencesPageClass;
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
{$include "adw-preferences-group.h"}

{ was #define dname def_expr }
function ADW_TYPE_PREFERENCES_PAGE : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwPreferencesPage, adw_preferences_page, ADW, PREFERENCES_PAGE, GtkWidget) }
{*
 * AdwPreferencesPageClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdwPreferencesPageClass = ^TAdwPreferencesPageClass;
  TAdwPreferencesPageClass = record
      parent_class : TGtkWidgetClass;
      padding : array[0..3] of Tgpointer;
    end;


function adw_preferences_page_new:PGtkWidget;cdecl;external;
procedure adw_preferences_page_add(self:PAdwPreferencesPage; group:PAdwPreferencesGroup);cdecl;external;
procedure adw_preferences_page_remove(self:PAdwPreferencesPage; group:PAdwPreferencesGroup);cdecl;external;
(* Const before type ignored *)
function adw_preferences_page_get_icon_name(self:PAdwPreferencesPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_preferences_page_set_icon_name(self:PAdwPreferencesPage; icon_name:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_preferences_page_get_title(self:PAdwPreferencesPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_preferences_page_set_title(self:PAdwPreferencesPage; title:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_preferences_page_get_description(self:PAdwPreferencesPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_preferences_page_set_description(self:PAdwPreferencesPage; description:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_preferences_page_get_name(self:PAdwPreferencesPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_preferences_page_set_name(self:PAdwPreferencesPage; name:Pchar);cdecl;external;
function adw_preferences_page_get_use_underline(self:PAdwPreferencesPage):Tgboolean;cdecl;external;
procedure adw_preferences_page_set_use_underline(self:PAdwPreferencesPage; use_underline:Tgboolean);cdecl;external;
procedure adw_preferences_page_scroll_to_top(self:PAdwPreferencesPage);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_PREFERENCES_PAGE : longint; { return type might be wrong }
  begin
    ADW_TYPE_PREFERENCES_PAGE:=adw_preferences_page_get_type;
  end;


end.
