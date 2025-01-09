
unit adw_about_window;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_about_window.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_about_window.h
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
PAdwAboutWindow  = ^AdwAboutWindow;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-window.h"}

{ was #define dname def_expr }
function ADW_TYPE_ABOUT_WINDOW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwAboutWindow, adw_about_window, ADW, ABOUT_WINDOW, AdwWindow) }
function adw_about_window_new:PGtkWidget;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function adw_about_window_new_from_appdata(resource_path:Pchar; release_notes_version:Pchar):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_application_name(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_application_name(self:PAdwAboutWindow; application_name:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_application_icon(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_application_icon(self:PAdwAboutWindow; application_icon:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_developer_name(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_developer_name(self:PAdwAboutWindow; developer_name:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_version(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_version(self:PAdwAboutWindow; version:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_release_notes_version(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_release_notes_version(self:PAdwAboutWindow; version:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_release_notes(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_release_notes(self:PAdwAboutWindow; release_notes:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_comments(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_comments(self:PAdwAboutWindow; comments:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_website(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_website(self:PAdwAboutWindow; website:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_support_url(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_support_url(self:PAdwAboutWindow; support_url:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_issue_url(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_issue_url(self:PAdwAboutWindow; issue_url:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_about_window_add_link(self:PAdwAboutWindow; title:Pchar; url:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_debug_info(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_debug_info(self:PAdwAboutWindow; debug_info:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_debug_info_filename(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_debug_info_filename(self:PAdwAboutWindow; filename:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adw_about_window_get_developers(self:PAdwAboutWindow):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_developers(self:PAdwAboutWindow; developers:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adw_about_window_get_designers(self:PAdwAboutWindow):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_designers(self:PAdwAboutWindow; designers:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adw_about_window_get_artists(self:PAdwAboutWindow):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_artists(self:PAdwAboutWindow; artists:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function adw_about_window_get_documenters(self:PAdwAboutWindow):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_documenters(self:PAdwAboutWindow; documenters:PPchar);cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_translator_credits(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_translator_credits(self:PAdwAboutWindow; translator_credits:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_about_window_add_credit_section(self:PAdwAboutWindow; name:Pchar; people:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_about_window_add_acknowledgement_section(self:PAdwAboutWindow; name:Pchar; people:PPchar);cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_copyright(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_copyright(self:PAdwAboutWindow; copyright:Pchar);cdecl;external;
function adw_about_window_get_license_type(self:PAdwAboutWindow):TGtkLicense;cdecl;external;
procedure adw_about_window_set_license_type(self:PAdwAboutWindow; license_type:TGtkLicense);cdecl;external;
(* Const before type ignored *)
function adw_about_window_get_license(self:PAdwAboutWindow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_about_window_set_license(self:PAdwAboutWindow; license:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_about_window_add_legal_section(self:PAdwAboutWindow; title:Pchar; copyright:Pchar; license_type:TGtkLicense; license:Pchar);cdecl;external;
(* Const before type ignored *)
procedure adw_show_about_window(parent:PGtkWindow; first_property_name:Pchar; args:array of const);cdecl;external;
procedure adw_show_about_window(parent:PGtkWindow; first_property_name:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure adw_show_about_window_from_appdata(parent:PGtkWindow; resource_path:Pchar; release_notes_version:Pchar; first_property_name:Pchar; args:array of const);cdecl;external;
procedure adw_show_about_window_from_appdata(parent:PGtkWindow; resource_path:Pchar; release_notes_version:Pchar; first_property_name:Pchar);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_ABOUT_WINDOW : longint; { return type might be wrong }
  begin
    ADW_TYPE_ABOUT_WINDOW:=adw_about_window_get_type;
  end;


end.
