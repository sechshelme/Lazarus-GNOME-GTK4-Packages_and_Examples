
unit adw_preferences_dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_preferences_dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_preferences_dialog.h
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
PAdwDialog  = ^AdwDialog;
PAdwNavigationPage  = ^AdwNavigationPage;
PAdwPreferencesDialog  = ^AdwPreferencesDialog;
PAdwPreferencesDialogClass  = ^AdwPreferencesDialogClass;
PAdwPreferencesPage  = ^AdwPreferencesPage;
PAdwToast  = ^AdwToast;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-dialog.h"}
{$include "adw-navigation-view.h"}
{$include "adw-preferences-page.h"}
{$include "adw-toast.h"}

{ was #define dname def_expr }
function ADW_TYPE_PREFERENCES_DIALOG : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwPreferencesDialog, adw_preferences_dialog, ADW, PREFERENCES_DIALOG, AdwDialog) }
{*
 * AdwPreferencesDialogClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdwPreferencesDialogClass = ^TAdwPreferencesDialogClass;
  TAdwPreferencesDialogClass = record
      parent_class : TAdwDialogClass;
      padding : array[0..3] of Tgpointer;
    end;


function adw_preferences_dialog_new:PAdwDialog;cdecl;external;
procedure adw_preferences_dialog_add(self:PAdwPreferencesDialog; page:PAdwPreferencesPage);cdecl;external;
procedure adw_preferences_dialog_remove(self:PAdwPreferencesDialog; page:PAdwPreferencesPage);cdecl;external;
function adw_preferences_dialog_get_visible_page(self:PAdwPreferencesDialog):PAdwPreferencesPage;cdecl;external;
procedure adw_preferences_dialog_set_visible_page(self:PAdwPreferencesDialog; page:PAdwPreferencesPage);cdecl;external;
(* Const before type ignored *)
function adw_preferences_dialog_get_visible_page_name(self:PAdwPreferencesDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_preferences_dialog_set_visible_page_name(self:PAdwPreferencesDialog; name:Pchar);cdecl;external;
function adw_preferences_dialog_get_search_enabled(self:PAdwPreferencesDialog):Tgboolean;cdecl;external;
procedure adw_preferences_dialog_set_search_enabled(self:PAdwPreferencesDialog; search_enabled:Tgboolean);cdecl;external;
procedure adw_preferences_dialog_push_subpage(self:PAdwPreferencesDialog; page:PAdwNavigationPage);cdecl;external;
function adw_preferences_dialog_pop_subpage(self:PAdwPreferencesDialog):Tgboolean;cdecl;external;
procedure adw_preferences_dialog_add_toast(self:PAdwPreferencesDialog; toast:PAdwToast);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_PREFERENCES_DIALOG : longint; { return type might be wrong }
  begin
    ADW_TYPE_PREFERENCES_DIALOG:=adw_preferences_dialog_get_type;
  end;


end.
