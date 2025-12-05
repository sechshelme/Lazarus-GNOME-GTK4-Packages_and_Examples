{$IFDEF read_interface}


type
  TAdapAboutDialog = record
  end;
  PAdapAboutDialog = ^TAdapAboutDialog;

  TAdapAboutDialogClass = record
    parent_class: TAdapDialogClass;
  end;
  PAdapAboutDialogClass = ^TAdapAboutDialogClass;

function adap_about_dialog_get_type: TGType; cdecl; external libadapta;
function adap_about_dialog_new: PAdapDialog; cdecl; external libadapta;
function adap_about_dialog_new_from_appdata(resource_path: pchar; release_notes_version: pchar): PAdapDialog; cdecl; external libadapta;
function adap_about_dialog_get_application_name(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_application_name(self: PAdapAboutDialog; application_name: pchar); cdecl; external libadapta;
function adap_about_dialog_get_application_icon(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_application_icon(self: PAdapAboutDialog; application_icon: pchar); cdecl; external libadapta;
function adap_about_dialog_get_developer_name(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_developer_name(self: PAdapAboutDialog; developer_name: pchar); cdecl; external libadapta;
function adap_about_dialog_get_version(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_version(self: PAdapAboutDialog; version: pchar); cdecl; external libadapta;
function adap_about_dialog_get_release_notes_version(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_release_notes_version(self: PAdapAboutDialog; version: pchar); cdecl; external libadapta;
function adap_about_dialog_get_release_notes(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_release_notes(self: PAdapAboutDialog; release_notes: pchar); cdecl; external libadapta;
function adap_about_dialog_get_comments(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_comments(self: PAdapAboutDialog; comments: pchar); cdecl; external libadapta;
function adap_about_dialog_get_website(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_website(self: PAdapAboutDialog; website: pchar); cdecl; external libadapta;
function adap_about_dialog_get_support_url(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_support_url(self: PAdapAboutDialog; support_url: pchar); cdecl; external libadapta;
function adap_about_dialog_get_issue_url(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_issue_url(self: PAdapAboutDialog; issue_url: pchar); cdecl; external libadapta;
procedure adap_about_dialog_add_link(self: PAdapAboutDialog; title: pchar; url: pchar); cdecl; external libadapta;
function adap_about_dialog_get_debug_info(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_debug_info(self: PAdapAboutDialog; debug_info: pchar); cdecl; external libadapta;
function adap_about_dialog_get_debug_info_filename(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_debug_info_filename(self: PAdapAboutDialog; filename: pchar); cdecl; external libadapta;
function adap_about_dialog_get_developers(self: PAdapAboutDialog): Ppchar; cdecl; external libadapta;
procedure adap_about_dialog_set_developers(self: PAdapAboutDialog; developers: PPchar); cdecl; external libadapta;
function adap_about_dialog_get_designers(self: PAdapAboutDialog): Ppchar; cdecl; external libadapta;
procedure adap_about_dialog_set_designers(self: PAdapAboutDialog; designers: PPchar); cdecl; external libadapta;
function adap_about_dialog_get_artists(self: PAdapAboutDialog): Ppchar; cdecl; external libadapta;
procedure adap_about_dialog_set_artists(self: PAdapAboutDialog; artists: PPchar); cdecl; external libadapta;
function adap_about_dialog_get_documenters(self: PAdapAboutDialog): Ppchar; cdecl; external libadapta;
procedure adap_about_dialog_set_documenters(self: PAdapAboutDialog; documenters: PPchar); cdecl; external libadapta;
function adap_about_dialog_get_translator_credits(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_translator_credits(self: PAdapAboutDialog; translator_credits: pchar); cdecl; external libadapta;
procedure adap_about_dialog_add_credit_section(self: PAdapAboutDialog; name: pchar; people: PPchar); cdecl; external libadapta;
procedure adap_about_dialog_add_acknowledgement_section(self: PAdapAboutDialog; name: pchar; people: PPchar); cdecl; external libadapta;
function adap_about_dialog_get_copyright(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_copyright(self: PAdapAboutDialog; copyright: pchar); cdecl; external libadapta;
function adap_about_dialog_get_license_type(self: PAdapAboutDialog): TGtkLicense; cdecl; external libadapta;
procedure adap_about_dialog_set_license_type(self: PAdapAboutDialog; license_type: TGtkLicense); cdecl; external libadapta;
function adap_about_dialog_get_license(self: PAdapAboutDialog): pchar; cdecl; external libadapta;
procedure adap_about_dialog_set_license(self: PAdapAboutDialog; license: pchar); cdecl; external libadapta;
procedure adap_about_dialog_add_legal_section(self: PAdapAboutDialog; title: pchar; copyright: pchar; license_type: TGtkLicense; license: pchar); cdecl; external libadapta;
procedure adap_show_about_dialog(parent: PGtkWidget; first_property_name: pchar; args: array of const); cdecl; external libadapta;
procedure adap_show_about_dialog(parent: PGtkWidget; first_property_name: pchar); cdecl; external libadapta;
procedure adap_show_about_dialog_from_appdata(parent: PGtkWidget; resource_path: pchar; release_notes_version: pchar; first_property_name: pchar; args: array of const); cdecl; external libadapta;
procedure adap_show_about_dialog_from_appdata(parent: PGtkWidget; resource_path: pchar; release_notes_version: pchar; first_property_name: pchar); cdecl; external libadapta;

// === Konventiert am: 4-12-25 16:59:20 ===

function ADAP_TYPE_ABOUT_DIALOG: TGType;
function ADAP_ABOUT_DIALOG(obj: Pointer): PAdapAboutDialog;
function ADAP_IS_ABOUT_DIALOG(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

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



{$ENDIF read_implementation}
