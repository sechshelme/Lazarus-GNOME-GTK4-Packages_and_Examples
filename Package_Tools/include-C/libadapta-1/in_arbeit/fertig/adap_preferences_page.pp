
unit adap_preferences_page;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_preferences_page.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_preferences_page.h
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
PAdapPreferencesGroup  = ^AdapPreferencesGroup;
PAdapPreferencesPage  = ^AdapPreferencesPage;
PAdapPreferencesPageClass  = ^AdapPreferencesPageClass;
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
{$include "adap-preferences-group.h"}

{ was #define dname def_expr }
function ADAP_TYPE_PREFERENCES_PAGE : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapPreferencesPage, adap_preferences_page, ADAP, PREFERENCES_PAGE, GtkWidget) }
{*
 * AdapPreferencesPageClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdapPreferencesPageClass = ^TAdapPreferencesPageClass;
  TAdapPreferencesPageClass = record
      parent_class : TGtkWidgetClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_preferences_page_new:PGtkWidget;cdecl;external;
procedure adap_preferences_page_add(self:PAdapPreferencesPage; group:PAdapPreferencesGroup);cdecl;external;
procedure adap_preferences_page_remove(self:PAdapPreferencesPage; group:PAdapPreferencesGroup);cdecl;external;
(* Const before type ignored *)
function adap_preferences_page_get_icon_name(self:PAdapPreferencesPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_preferences_page_set_icon_name(self:PAdapPreferencesPage; icon_name:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_preferences_page_get_title(self:PAdapPreferencesPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_preferences_page_set_title(self:PAdapPreferencesPage; title:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_preferences_page_get_description(self:PAdapPreferencesPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_preferences_page_set_description(self:PAdapPreferencesPage; description:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_preferences_page_get_name(self:PAdapPreferencesPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_preferences_page_set_name(self:PAdapPreferencesPage; name:Pchar);cdecl;external;
function adap_preferences_page_get_use_underline(self:PAdapPreferencesPage):Tgboolean;cdecl;external;
procedure adap_preferences_page_set_use_underline(self:PAdapPreferencesPage; use_underline:Tgboolean);cdecl;external;
procedure adap_preferences_page_scroll_to_top(self:PAdapPreferencesPage);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_PREFERENCES_PAGE : longint; { return type might be wrong }
  begin
    ADAP_TYPE_PREFERENCES_PAGE:=adap_preferences_page_get_type;
  end;


end.
