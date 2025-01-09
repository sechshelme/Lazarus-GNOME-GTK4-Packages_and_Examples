
unit adw_about_dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_about_dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_about_dialog.h
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
PAdwAboutDialog  = ^AdwAboutDialog;
PAdwDialog  = ^AdwDialog;
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021-2022 Purism SPC
 * Copyright (C) 2024 GNOME Foundation Inc.
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

{ was #define dname def_expr }
function ADW_TYPE_ABOUT_DIALOG : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwAboutDialog, adw_about_dialog, ADW, ABOUT_DIALOG, AdwDialog) }
function adw_about_dialog_new:PAdwDialog;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function adw_about_dialog_new_from_appdata(resource_path:Pchar; release_notes_version:Pchar):PAdwDialog;cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_application_name(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_application_name(self:PAdwAboutDialog; application_name:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_application_icon(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_application_icon(self:PAdwAboutDialog; application_icon:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_developer_name(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_developer_name(self:PAdwAboutDialog; developer_name:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_version(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_version(self:PAdwAboutDialog; version:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_release_notes_version(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_release_notes_version(self:PAdwAboutDialog; version:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_release_notes(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_release_notes(self:PAdwAboutDialog; release_notes:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_comments(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_comments(self:PAdwAboutDialog; comments:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_website(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_website(self:PAdwAboutDialog; website:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_support_url(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_support_url(self:PAdwAboutDialog; support_url:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_issue_url(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_issue_url(self:PAdwAboutDialog; issue_url:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_about_dialog_add_link(self:PAdwAboutDialog; title:Pchar; url:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_debug_info(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_debug_info(self:PAdwAboutDialog; debug_info:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_debug_info_filename(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_debug_info_filename(self:PAdwAboutDialog; filename:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adw_about_dialog_get_developers(self:PAdwAboutDialog):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_developers(self:PAdwAboutDialog; developers:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adw_about_dialog_get_designers(self:PAdwAboutDialog):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_designers(self:PAdwAboutDialog; designers:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adw_about_dialog_get_artists(self:PAdwAboutDialog):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_artists(self:PAdwAboutDialog; artists:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adw_about_dialog_get_documenters(self:PAdwAboutDialog):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_documenters(self:PAdwAboutDialog; documenters:PPchar);cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_translator_credits(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_translator_credits(self:PAdwAboutDialog; translator_credits:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_about_dialog_add_credit_section(self:PAdwAboutDialog; name:Pchar; people:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_about_dialog_add_acknowledgement_section(self:PAdwAboutDialog; name:Pchar; people:PPchar);cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_copyright(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_copyright(self:PAdwAboutDialog; copyright:Pchar);cdecl;external;
function adw_about_dialog_get_license_type(self:PAdwAboutDialog):TGtkLicense;cdecl;external;
procedure adw_about_dialog_set_license_type(self:PAdwAboutDialog; license_type:TGtkLicense);cdecl;external;
(* Const before type ignored *)
function adw_about_dialog_get_license(self:PAdwAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_dialog_set_license(self:PAdwAboutDialog; license:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_about_dialog_add_legal_section(self:PAdwAboutDialog; title:Pchar; copyright:Pchar; license_type:TGtkLicense; license:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adw_show_about_dialog(parent:PGtkWidget; first_property_name:Pchar; args:array of const);cdecl;external;
procedure adw_show_about_dialog(parent:PGtkWidget; first_property_name:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_show_about_dialog_from_appdata(parent:PGtkWidget; resource_path:Pchar; release_notes_version:Pchar; first_property_name:Pchar; args:array of const);cdecl;external;
procedure adw_show_about_dialog_from_appdata(parent:PGtkWidget; resource_path:Pchar; release_notes_version:Pchar; first_property_name:Pchar);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_ABOUT_DIALOG : longint; { return type might be wrong }
  begin
    ADW_TYPE_ABOUT_DIALOG:=adw_about_dialog_get_type;
  end;


end.
