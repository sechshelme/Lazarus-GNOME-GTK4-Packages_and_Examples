unit adw_about_dialog;

interface

uses
  fp_glib2, fp_GTK4, adw_dialog;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (AdwAboutDialog, adw_about_dialog, ADW, ABOUT_DIALOG, AdwDialog) }
type
  TAdwAboutDialog = record
  end;
  PAdwAboutDialog = ^TAdwAboutDialog;

  TAdwAboutDialogClass = record
    parent_class: TAdwDialogClass;
  end;
  PAdwAboutDialogClass = ^TAdwAboutDialogClass;

function adw_about_dialog_get_type: TGType; cdecl; external libadwaita;
function adw_about_dialog_new: PAdwDialog; cdecl; external libadwaita;
function adw_about_dialog_new_from_appdata(resource_path: pchar; release_notes_version: pchar): PAdwDialog; cdecl; external libadwaita;
function adw_about_dialog_get_application_name(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_application_name(self: PAdwAboutDialog; application_name: pchar); cdecl; external libadwaita;
function adw_about_dialog_get_application_icon(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_application_icon(self: PAdwAboutDialog; application_icon: pchar); cdecl; external libadwaita;
function adw_about_dialog_get_developer_name(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_developer_name(self: PAdwAboutDialog; developer_name: pchar); cdecl; external libadwaita;
function adw_about_dialog_get_version(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_version(self: PAdwAboutDialog; version: pchar); cdecl; external libadwaita;
function adw_about_dialog_get_release_notes_version(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_release_notes_version(self: PAdwAboutDialog; version: pchar); cdecl; external libadwaita;
function adw_about_dialog_get_release_notes(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_release_notes(self: PAdwAboutDialog; release_notes: pchar); cdecl; external libadwaita;
function adw_about_dialog_get_comments(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_comments(self: PAdwAboutDialog; comments: pchar); cdecl; external libadwaita;
function adw_about_dialog_get_website(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_website(self: PAdwAboutDialog; website: pchar); cdecl; external libadwaita;
function adw_about_dialog_get_support_url(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_support_url(self: PAdwAboutDialog; support_url: pchar); cdecl; external libadwaita;
function adw_about_dialog_get_issue_url(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_issue_url(self: PAdwAboutDialog; issue_url: pchar); cdecl; external libadwaita;
procedure adw_about_dialog_add_link(self: PAdwAboutDialog; title: pchar; url: pchar); cdecl; external libadwaita;
function adw_about_dialog_get_debug_info(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_debug_info(self: PAdwAboutDialog; debug_info: pchar); cdecl; external libadwaita;
function adw_about_dialog_get_debug_info_filename(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_debug_info_filename(self: PAdwAboutDialog; filename: pchar); cdecl; external libadwaita;
function adw_about_dialog_get_developers(self: PAdwAboutDialog): PPchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_developers(self: PAdwAboutDialog; developers: PPchar); cdecl; external libadwaita;
function adw_about_dialog_get_designers(self: PAdwAboutDialog): PPchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_designers(self: PAdwAboutDialog; designers: PPchar); cdecl; external libadwaita;
function adw_about_dialog_get_artists(self: PAdwAboutDialog): PPchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_artists(self: PAdwAboutDialog; artists: PPchar); cdecl; external libadwaita;
function adw_about_dialog_get_documenters(self: PAdwAboutDialog): PPchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_documenters(self: PAdwAboutDialog; documenters: PPchar); cdecl; external libadwaita;
function adw_about_dialog_get_translator_credits(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_translator_credits(self: PAdwAboutDialog; translator_credits: pchar); cdecl; external libadwaita;
procedure adw_about_dialog_add_credit_section(self: PAdwAboutDialog; Name: pchar; people: PPchar); cdecl; external libadwaita;
procedure adw_about_dialog_add_acknowledgement_section(self: PAdwAboutDialog; Name: pchar; people: PPchar); cdecl; external libadwaita;
function adw_about_dialog_get_copyright(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_copyright(self: PAdwAboutDialog; copyright: pchar); cdecl; external libadwaita;
function adw_about_dialog_get_license_type(self: PAdwAboutDialog): TGtkLicense; cdecl; external libadwaita;
procedure adw_about_dialog_set_license_type(self: PAdwAboutDialog; license_type: TGtkLicense); cdecl; external libadwaita;
function adw_about_dialog_get_license(self: PAdwAboutDialog): pchar; cdecl; external libadwaita;
procedure adw_about_dialog_set_license(self: PAdwAboutDialog; license: pchar); cdecl; external libadwaita;
procedure adw_about_dialog_add_legal_section(self: PAdwAboutDialog; title: pchar; copyright: pchar; license_type: TGtkLicense; license: pchar); cdecl; external libadwaita;
procedure adw_show_about_dialog(parent: PGtkWidget; first_property_name: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_show_about_dialog(parent: PGtkWidget; first_property_name: pchar); cdecl; external libadwaita;
procedure adw_show_about_dialog_from_appdata(parent: PGtkWidget; resource_path: pchar; release_notes_version: pchar; first_property_name: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_show_about_dialog_from_appdata(parent: PGtkWidget; resource_path: pchar; release_notes_version: pchar; first_property_name: pchar); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:14:52 ===

function ADW_TYPE_ABOUT_DIALOG: TGType;
function ADW_ABOUT_DIALOG(obj: Pointer): PAdwAboutDialog;
function ADW_IS_ABOUT_DIALOG(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_ABOUT_DIALOG: TGType;
begin
  Result := adw_about_dialog_get_type;
end;

function ADW_ABOUT_DIALOG(obj: Pointer): PAdwAboutDialog;
begin
  Result := PAdwAboutDialog(g_type_check_instance_cast(obj, ADW_TYPE_ABOUT_DIALOG));
end;

function ADW_IS_ABOUT_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_ABOUT_DIALOG);
end;


end.
