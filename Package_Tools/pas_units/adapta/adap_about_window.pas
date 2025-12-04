unit adap_about_window;

interface

uses
  fp_adapta;

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

{G_DECLARE_FINAL_TYPE (AdapAboutWindow, adap_about_window, ADAP, ABOUT_WINDOW, AdapWindow) }
function adap_about_window_new:PGtkWidget;cdecl;external libadapta;
function adap_about_window_new_from_appdata(resource_path:Pchar; release_notes_version:Pchar):PGtkWidget;cdecl;external libadapta;
function adap_about_window_get_application_name(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_application_name(self:PAdapAboutWindow; application_name:Pchar);cdecl;external libadapta;
function adap_about_window_get_application_icon(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_application_icon(self:PAdapAboutWindow; application_icon:Pchar);cdecl;external libadapta;
function adap_about_window_get_developer_name(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_developer_name(self:PAdapAboutWindow; developer_name:Pchar);cdecl;external libadapta;
function adap_about_window_get_version(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_version(self:PAdapAboutWindow; version:Pchar);cdecl;external libadapta;
function adap_about_window_get_release_notes_version(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_release_notes_version(self:PAdapAboutWindow; version:Pchar);cdecl;external libadapta;
function adap_about_window_get_release_notes(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_release_notes(self:PAdapAboutWindow; release_notes:Pchar);cdecl;external libadapta;
function adap_about_window_get_comments(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_comments(self:PAdapAboutWindow; comments:Pchar);cdecl;external libadapta;
function adap_about_window_get_website(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_website(self:PAdapAboutWindow; website:Pchar);cdecl;external libadapta;
function adap_about_window_get_support_url(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_support_url(self:PAdapAboutWindow; support_url:Pchar);cdecl;external libadapta;
function adap_about_window_get_issue_url(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_issue_url(self:PAdapAboutWindow; issue_url:Pchar);cdecl;external libadapta;
procedure adap_about_window_add_link(self:PAdapAboutWindow; title:Pchar; url:Pchar);cdecl;external libadapta;
function adap_about_window_get_debug_info(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_debug_info(self:PAdapAboutWindow; debug_info:Pchar);cdecl;external libadapta;
function adap_about_window_get_debug_info_filename(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_debug_info_filename(self:PAdapAboutWindow; filename:Pchar);cdecl;external libadapta;
function adap_about_window_get_developers(self:PAdapAboutWindow):^Pchar;cdecl;external libadapta;
procedure adap_about_window_set_developers(self:PAdapAboutWindow; developers:PPchar);cdecl;external libadapta;
function adap_about_window_get_designers(self:PAdapAboutWindow):^Pchar;cdecl;external libadapta;
procedure adap_about_window_set_designers(self:PAdapAboutWindow; designers:PPchar);cdecl;external libadapta;
function adap_about_window_get_artists(self:PAdapAboutWindow):^Pchar;cdecl;external libadapta;
procedure adap_about_window_set_artists(self:PAdapAboutWindow; artists:PPchar);cdecl;external libadapta;
function adap_about_window_get_documenters(self:PAdapAboutWindow):^Pchar;cdecl;external libadapta;
procedure adap_about_window_set_documenters(self:PAdapAboutWindow; documenters:PPchar);cdecl;external libadapta;
function adap_about_window_get_translator_credits(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_translator_credits(self:PAdapAboutWindow; translator_credits:Pchar);cdecl;external libadapta;
procedure adap_about_window_add_credit_section(self:PAdapAboutWindow; name:Pchar; people:PPchar);cdecl;external libadapta;
procedure adap_about_window_add_acknowledgement_section(self:PAdapAboutWindow; name:Pchar; people:PPchar);cdecl;external libadapta;
function adap_about_window_get_copyright(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_copyright(self:PAdapAboutWindow; copyright:Pchar);cdecl;external libadapta;
function adap_about_window_get_license_type(self:PAdapAboutWindow):TGtkLicense;cdecl;external libadapta;
procedure adap_about_window_set_license_type(self:PAdapAboutWindow; license_type:TGtkLicense);cdecl;external libadapta;
function adap_about_window_get_license(self:PAdapAboutWindow):Pchar;cdecl;external libadapta;
procedure adap_about_window_set_license(self:PAdapAboutWindow; license:Pchar);cdecl;external libadapta;
procedure adap_about_window_add_legal_section(self:PAdapAboutWindow; title:Pchar; copyright:Pchar; license_type:TGtkLicense; license:Pchar);cdecl;external libadapta;
procedure adap_show_about_window(parent:PGtkWindow; first_property_name:Pchar; args:array of const);cdecl;external libadapta;
procedure adap_show_about_window(parent:PGtkWindow; first_property_name:Pchar);cdecl;external libadapta;
procedure adap_show_about_window_from_appdata(parent:PGtkWindow; resource_path:Pchar; release_notes_version:Pchar; first_property_name:Pchar; args:array of const);cdecl;external libadapta;
procedure adap_show_about_window_from_appdata(parent:PGtkWindow; resource_path:Pchar; release_notes_version:Pchar; first_property_name:Pchar);cdecl;external libadapta;

// === Konventiert am: 4-12-25 16:59:44 ===

function ADAP_TYPE_ABOUT_WINDOW: TGType;
function ADAP_ABOUT_WINDOW(obj: Pointer): PAdapAboutWindow;
function ADAP_IS_ABOUT_WINDOW(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_ABOUT_WINDOW: TGType;
begin
  Result := adap_about_window_get_type;
end;

function ADAP_ABOUT_WINDOW(obj: Pointer): PAdapAboutWindow;
begin
  Result := PAdapAboutWindow(g_type_check_instance_cast(obj, ADAP_TYPE_ABOUT_WINDOW));
end;

function ADAP_IS_ABOUT_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_ABOUT_WINDOW);
end;

type 
  TAdapAboutWindow = record
  end;
  PAdapAboutWindow = ^TAdapAboutWindow;

  TAdapAboutWindowClass = record
    parent_class: TAdapWindowClass;
  end;
  PAdapAboutWindowClass = ^TAdapAboutWindowClass;

function adap_about_window_get_type: TGType; cdecl; external libgxxxxxxx;



end.
