unit adap_about_dialog;

interface

uses
  fp_adapta;

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

{G_DECLARE_FINAL_TYPE (AdapAboutDialog, adap_about_dialog, ADAP, ABOUT_DIALOG, AdapDialog) }
function adap_about_dialog_new:PAdapDialog;cdecl;external libadapta;
function adap_about_dialog_new_from_appdata(resource_path:Pchar; release_notes_version:Pchar):PAdapDialog;cdecl;external libadapta;
function adap_about_dialog_get_application_name(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_application_name(self:PAdapAboutDialog; application_name:Pchar);cdecl;external libadapta;
function adap_about_dialog_get_application_icon(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_application_icon(self:PAdapAboutDialog; application_icon:Pchar);cdecl;external libadapta;
function adap_about_dialog_get_developer_name(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_developer_name(self:PAdapAboutDialog; developer_name:Pchar);cdecl;external libadapta;
function adap_about_dialog_get_version(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_version(self:PAdapAboutDialog; version:Pchar);cdecl;external libadapta;
function adap_about_dialog_get_release_notes_version(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_release_notes_version(self:PAdapAboutDialog; version:Pchar);cdecl;external libadapta;
function adap_about_dialog_get_release_notes(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_release_notes(self:PAdapAboutDialog; release_notes:Pchar);cdecl;external libadapta;
function adap_about_dialog_get_comments(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_comments(self:PAdapAboutDialog; comments:Pchar);cdecl;external libadapta;
function adap_about_dialog_get_website(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_website(self:PAdapAboutDialog; website:Pchar);cdecl;external libadapta;
function adap_about_dialog_get_support_url(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_support_url(self:PAdapAboutDialog; support_url:Pchar);cdecl;external libadapta;
function adap_about_dialog_get_issue_url(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_issue_url(self:PAdapAboutDialog; issue_url:Pchar);cdecl;external libadapta;
procedure adap_about_dialog_add_link(self:PAdapAboutDialog; title:Pchar; url:Pchar);cdecl;external libadapta;
function adap_about_dialog_get_debug_info(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_debug_info(self:PAdapAboutDialog; debug_info:Pchar);cdecl;external libadapta;
function adap_about_dialog_get_debug_info_filename(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_debug_info_filename(self:PAdapAboutDialog; filename:Pchar);cdecl;external libadapta;
function adap_about_dialog_get_developers(self:PAdapAboutDialog):^Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_developers(self:PAdapAboutDialog; developers:PPchar);cdecl;external libadapta;
function adap_about_dialog_get_designers(self:PAdapAboutDialog):^Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_designers(self:PAdapAboutDialog; designers:PPchar);cdecl;external libadapta;
function adap_about_dialog_get_artists(self:PAdapAboutDialog):^Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_artists(self:PAdapAboutDialog; artists:PPchar);cdecl;external libadapta;
function adap_about_dialog_get_documenters(self:PAdapAboutDialog):^Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_documenters(self:PAdapAboutDialog; documenters:PPchar);cdecl;external libadapta;
function adap_about_dialog_get_translator_credits(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_translator_credits(self:PAdapAboutDialog; translator_credits:Pchar);cdecl;external libadapta;
procedure adap_about_dialog_add_credit_section(self:PAdapAboutDialog; name:Pchar; people:PPchar);cdecl;external libadapta;
procedure adap_about_dialog_add_acknowledgement_section(self:PAdapAboutDialog; name:Pchar; people:PPchar);cdecl;external libadapta;
function adap_about_dialog_get_copyright(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_copyright(self:PAdapAboutDialog; copyright:Pchar);cdecl;external libadapta;
function adap_about_dialog_get_license_type(self:PAdapAboutDialog):TGtkLicense;cdecl;external libadapta;
procedure adap_about_dialog_set_license_type(self:PAdapAboutDialog; license_type:TGtkLicense);cdecl;external libadapta;
function adap_about_dialog_get_license(self:PAdapAboutDialog):Pchar;cdecl;external libadapta;
procedure adap_about_dialog_set_license(self:PAdapAboutDialog; license:Pchar);cdecl;external libadapta;
procedure adap_about_dialog_add_legal_section(self:PAdapAboutDialog; title:Pchar; copyright:Pchar; license_type:TGtkLicense; license:Pchar);cdecl;external libadapta;
procedure adap_show_about_dialog(parent:PGtkWidget; first_property_name:Pchar; args:array of const);cdecl;external libadapta;
procedure adap_show_about_dialog(parent:PGtkWidget; first_property_name:Pchar);cdecl;external libadapta;
procedure adap_show_about_dialog_from_appdata(parent:PGtkWidget; resource_path:Pchar; release_notes_version:Pchar; first_property_name:Pchar; args:array of const);cdecl;external libadapta;
procedure adap_show_about_dialog_from_appdata(parent:PGtkWidget; resource_path:Pchar; release_notes_version:Pchar; first_property_name:Pchar);cdecl;external libadapta;

// === Konventiert am: 4-12-25 16:59:20 ===

function ADAP_TYPE_ABOUT_DIALOG: TGType;
function ADAP_ABOUT_DIALOG(obj: Pointer): PAdapAboutDialog;
function ADAP_IS_ABOUT_DIALOG(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_ABOUT_DIALOG: TGType;
begin
  Result := adap_about_dialog_get_type;
end;

function ADAP_ABOUT_DIALOG(obj: Pointer): PAdapAboutDialog;
begin
  Result := PAdapAboutDialog(g_type_check_instance_cast(obj, ADAP_TYPE_ABOUT_DIALOG));
end;

function ADAP_IS_ABOUT_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_ABOUT_DIALOG);
end;

type 
  TAdapAboutDialog = record
  end;
  PAdapAboutDialog = ^TAdapAboutDialog;

  TAdapAboutDialogClass = record
    parent_class: TAdapDialogClass;
  end;
  PAdapAboutDialogClass = ^TAdapAboutDialogClass;

function adap_about_dialog_get_type: TGType; cdecl; external libgxxxxxxx;



end.
