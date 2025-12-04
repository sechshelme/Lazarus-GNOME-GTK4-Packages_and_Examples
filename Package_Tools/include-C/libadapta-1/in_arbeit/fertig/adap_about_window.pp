
unit adap_about_window;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_about_window.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_about_window.h
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
PAdapAboutWindow  = ^AdapAboutWindow;
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
PGtkWindow  = ^GtkWindow;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021-2022 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-window.h"}

{ was #define dname def_expr }
function ADAP_TYPE_ABOUT_WINDOW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapAboutWindow, adap_about_window, ADAP, ABOUT_WINDOW, AdapWindow) }
function adap_about_window_new:PGtkWidget;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function adap_about_window_new_from_appdata(resource_path:Pchar; release_notes_version:Pchar):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_application_name(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_application_name(self:PAdapAboutWindow; application_name:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_application_icon(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_application_icon(self:PAdapAboutWindow; application_icon:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_developer_name(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_developer_name(self:PAdapAboutWindow; developer_name:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_version(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_version(self:PAdapAboutWindow; version:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_release_notes_version(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_release_notes_version(self:PAdapAboutWindow; version:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_release_notes(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_release_notes(self:PAdapAboutWindow; release_notes:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_comments(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_comments(self:PAdapAboutWindow; comments:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_website(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_website(self:PAdapAboutWindow; website:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_support_url(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_support_url(self:PAdapAboutWindow; support_url:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_issue_url(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_issue_url(self:PAdapAboutWindow; issue_url:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_about_window_add_link(self:PAdapAboutWindow; title:Pchar; url:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_debug_info(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_debug_info(self:PAdapAboutWindow; debug_info:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_debug_info_filename(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_debug_info_filename(self:PAdapAboutWindow; filename:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adap_about_window_get_developers(self:PAdapAboutWindow):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_developers(self:PAdapAboutWindow; developers:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adap_about_window_get_designers(self:PAdapAboutWindow):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_designers(self:PAdapAboutWindow; designers:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adap_about_window_get_artists(self:PAdapAboutWindow):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_artists(self:PAdapAboutWindow; artists:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adap_about_window_get_documenters(self:PAdapAboutWindow):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_documenters(self:PAdapAboutWindow; documenters:PPchar);cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_translator_credits(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_translator_credits(self:PAdapAboutWindow; translator_credits:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_about_window_add_credit_section(self:PAdapAboutWindow; name:Pchar; people:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_about_window_add_acknowledgement_section(self:PAdapAboutWindow; name:Pchar; people:PPchar);cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_copyright(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_copyright(self:PAdapAboutWindow; copyright:Pchar);cdecl;external;
function adap_about_window_get_license_type(self:PAdapAboutWindow):TGtkLicense;cdecl;external;
procedure adap_about_window_set_license_type(self:PAdapAboutWindow; license_type:TGtkLicense);cdecl;external;
(* Const before type ignored *)
function adap_about_window_get_license(self:PAdapAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_about_window_set_license(self:PAdapAboutWindow; license:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_about_window_add_legal_section(self:PAdapAboutWindow; title:Pchar; copyright:Pchar; license_type:TGtkLicense; license:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adap_show_about_window(parent:PGtkWindow; first_property_name:Pchar; args:array of const);cdecl;external;
procedure adap_show_about_window(parent:PGtkWindow; first_property_name:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure adap_show_about_window_from_appdata(parent:PGtkWindow; resource_path:Pchar; release_notes_version:Pchar; first_property_name:Pchar; args:array of const);cdecl;external;
procedure adap_show_about_window_from_appdata(parent:PGtkWindow; resource_path:Pchar; release_notes_version:Pchar; first_property_name:Pchar);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_ABOUT_WINDOW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_ABOUT_WINDOW:=adap_about_window_get_type;
  end;


end.
