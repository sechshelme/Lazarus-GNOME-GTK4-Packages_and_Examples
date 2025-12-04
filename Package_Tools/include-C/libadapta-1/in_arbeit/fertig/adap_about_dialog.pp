
unit adap_about_dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_about_dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_about_dialog.h
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
PAdapAboutDialog  = ^AdapAboutDialog;
PAdapDialog  = ^AdapDialog;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-dialog.h"}

{ was #define dname def_expr }
function ADAP_TYPE_ABOUT_DIALOG : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapAboutDialog, adap_about_dialog, ADAP, ABOUT_DIALOG, AdapDialog) }
function adap_about_dialog_new:PAdapDialog;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function adap_about_dialog_new_from_appdata(resource_path:Pchar; release_notes_version:Pchar):PAdapDialog;cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_application_name(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_application_name(self:PAdapAboutDialog; application_name:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_application_icon(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_application_icon(self:PAdapAboutDialog; application_icon:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_developer_name(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_developer_name(self:PAdapAboutDialog; developer_name:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_version(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_version(self:PAdapAboutDialog; version:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_release_notes_version(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_release_notes_version(self:PAdapAboutDialog; version:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_release_notes(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_release_notes(self:PAdapAboutDialog; release_notes:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_comments(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_comments(self:PAdapAboutDialog; comments:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_website(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_website(self:PAdapAboutDialog; website:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_support_url(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_support_url(self:PAdapAboutDialog; support_url:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_issue_url(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_issue_url(self:PAdapAboutDialog; issue_url:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_about_dialog_add_link(self:PAdapAboutDialog; title:Pchar; url:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_debug_info(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_debug_info(self:PAdapAboutDialog; debug_info:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_debug_info_filename(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_debug_info_filename(self:PAdapAboutDialog; filename:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adap_about_dialog_get_developers(self:PAdapAboutDialog):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_developers(self:PAdapAboutDialog; developers:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adap_about_dialog_get_designers(self:PAdapAboutDialog):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_designers(self:PAdapAboutDialog; designers:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adap_about_dialog_get_artists(self:PAdapAboutDialog):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_artists(self:PAdapAboutDialog; artists:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adap_about_dialog_get_documenters(self:PAdapAboutDialog):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_documenters(self:PAdapAboutDialog; documenters:PPchar);cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_translator_credits(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_translator_credits(self:PAdapAboutDialog; translator_credits:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_about_dialog_add_credit_section(self:PAdapAboutDialog; name:Pchar; people:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_about_dialog_add_acknowledgement_section(self:PAdapAboutDialog; name:Pchar; people:PPchar);cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_copyright(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_copyright(self:PAdapAboutDialog; copyright:Pchar);cdecl;external;
function adap_about_dialog_get_license_type(self:PAdapAboutDialog):TGtkLicense;cdecl;external;
procedure adap_about_dialog_set_license_type(self:PAdapAboutDialog; license_type:TGtkLicense);cdecl;external;
(* Const before type ignored *)
function adap_about_dialog_get_license(self:PAdapAboutDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_dialog_set_license(self:PAdapAboutDialog; license:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_about_dialog_add_legal_section(self:PAdapAboutDialog; title:Pchar; copyright:Pchar; license_type:TGtkLicense; license:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adap_show_about_dialog(parent:PGtkWidget; first_property_name:Pchar; args:array of const);cdecl;external;
procedure adap_show_about_dialog(parent:PGtkWidget; first_property_name:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_show_about_dialog_from_appdata(parent:PGtkWidget; resource_path:Pchar; release_notes_version:Pchar; first_property_name:Pchar; args:array of const);cdecl;external;
procedure adap_show_about_dialog_from_appdata(parent:PGtkWidget; resource_path:Pchar; release_notes_version:Pchar; first_property_name:Pchar);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_ABOUT_DIALOG : longint; { return type might be wrong }
  begin
    ADAP_TYPE_ABOUT_DIALOG:=adap_about_dialog_get_type;
  end;


end.
