
unit adap_preferences_dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_preferences_dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_preferences_dialog.h
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
PAdapDialog  = ^AdapDialog;
PAdapNavigationPage  = ^AdapNavigationPage;
PAdapPreferencesDialog  = ^AdapPreferencesDialog;
PAdapPreferencesDialogClass  = ^AdapPreferencesDialogClass;
PAdapPreferencesPage  = ^AdapPreferencesPage;
PAdapToast  = ^AdapToast;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Purism SPC
 * Copyright (C) 2023 GNOME Foundation Inc
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-dialog.h"}
{$include "adap-navigation-view.h"}
{$include "adap-preferences-page.h"}
{$include "adap-toast.h"}

{ was #define dname def_expr }
function ADAP_TYPE_PREFERENCES_DIALOG : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapPreferencesDialog, adap_preferences_dialog, ADAP, PREFERENCES_DIALOG, AdapDialog) }
{*
 * AdapPreferencesDialogClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdapPreferencesDialogClass = ^TAdapPreferencesDialogClass;
  TAdapPreferencesDialogClass = record
      parent_class : TAdapDialogClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_preferences_dialog_new:PAdapDialog;cdecl;external;
procedure adap_preferences_dialog_add(self:PAdapPreferencesDialog; page:PAdapPreferencesPage);cdecl;external;
procedure adap_preferences_dialog_remove(self:PAdapPreferencesDialog; page:PAdapPreferencesPage);cdecl;external;
function adap_preferences_dialog_get_visible_page(self:PAdapPreferencesDialog):PAdapPreferencesPage;cdecl;external;
procedure adap_preferences_dialog_set_visible_page(self:PAdapPreferencesDialog; page:PAdapPreferencesPage);cdecl;external;
(* Const before type ignored *)
function adap_preferences_dialog_get_visible_page_name(self:PAdapPreferencesDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_preferences_dialog_set_visible_page_name(self:PAdapPreferencesDialog; name:Pchar);cdecl;external;
function adap_preferences_dialog_get_search_enabled(self:PAdapPreferencesDialog):Tgboolean;cdecl;external;
procedure adap_preferences_dialog_set_search_enabled(self:PAdapPreferencesDialog; search_enabled:Tgboolean);cdecl;external;
procedure adap_preferences_dialog_push_subpage(self:PAdapPreferencesDialog; page:PAdapNavigationPage);cdecl;external;
function adap_preferences_dialog_pop_subpage(self:PAdapPreferencesDialog):Tgboolean;cdecl;external;
procedure adap_preferences_dialog_add_toast(self:PAdapPreferencesDialog; toast:PAdapToast);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_PREFERENCES_DIALOG : longint; { return type might be wrong }
  begin
    ADAP_TYPE_PREFERENCES_DIALOG:=adap_preferences_dialog_get_type;
  end;


end.
