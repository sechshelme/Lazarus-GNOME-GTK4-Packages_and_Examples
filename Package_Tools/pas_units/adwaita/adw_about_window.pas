unit adw_about_window;

interface

uses
  fp_glib2, fp_GTK4, adw_window;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (AdwAboutWindow, adw_about_window, ADW, ABOUT_WINDOW, AdwWindow) }
type
  TAdwAboutWindow = record
  end;
  PAdwAboutWindow = ^TAdwAboutWindow;

  TAdwAboutWindowClass = record
    parent_class: TAdwWindowClass;
  end;
  PAdwAboutWindowClass = ^TAdwAboutWindowClass;

function adw_about_window_get_type: TGType; cdecl; external libadwaita;
function adw_about_window_new: PGtkWidget; cdecl; external libadwaita;
function adw_about_window_new_from_appdata(resource_path: pchar; release_notes_version: pchar): PGtkWidget; cdecl; external libadwaita;
function adw_about_window_get_application_name(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_application_name(self: PAdwAboutWindow; application_name: pchar); cdecl; external libadwaita;
function adw_about_window_get_application_icon(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_application_icon(self: PAdwAboutWindow; application_icon: pchar); cdecl; external libadwaita;
function adw_about_window_get_developer_name(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_developer_name(self: PAdwAboutWindow; developer_name: pchar); cdecl; external libadwaita;
function adw_about_window_get_version(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_version(self: PAdwAboutWindow; version: pchar); cdecl; external libadwaita;
function adw_about_window_get_release_notes_version(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_release_notes_version(self: PAdwAboutWindow; version: pchar); cdecl; external libadwaita;
function adw_about_window_get_release_notes(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_release_notes(self: PAdwAboutWindow; release_notes: pchar); cdecl; external libadwaita;
function adw_about_window_get_comments(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_comments(self: PAdwAboutWindow; comments: pchar); cdecl; external libadwaita;
function adw_about_window_get_website(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_website(self: PAdwAboutWindow; website: pchar); cdecl; external libadwaita;
function adw_about_window_get_support_url(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_support_url(self: PAdwAboutWindow; support_url: pchar); cdecl; external libadwaita;
function adw_about_window_get_issue_url(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_issue_url(self: PAdwAboutWindow; issue_url: pchar); cdecl; external libadwaita;
procedure adw_about_window_add_link(self: PAdwAboutWindow; title: pchar; url: pchar); cdecl; external libadwaita;
function adw_about_window_get_debug_info(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_debug_info(self: PAdwAboutWindow; debug_info: pchar); cdecl; external libadwaita;
function adw_about_window_get_debug_info_filename(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_debug_info_filename(self: PAdwAboutWindow; filename: pchar); cdecl; external libadwaita;
function adw_about_window_get_developers(self: PAdwAboutWindow): PPchar; cdecl; external libadwaita;
procedure adw_about_window_set_developers(self: PAdwAboutWindow; developers: PPchar); cdecl; external libadwaita;
function adw_about_window_get_designers(self: PAdwAboutWindow): PPchar; cdecl; external libadwaita;
procedure adw_about_window_set_designers(self: PAdwAboutWindow; designers: PPchar); cdecl; external libadwaita;
function adw_about_window_get_artists(self: PAdwAboutWindow): PPchar; cdecl; external libadwaita;
procedure adw_about_window_set_artists(self: PAdwAboutWindow; artists: PPchar); cdecl; external libadwaita;
function adw_about_window_get_documenters(self: PAdwAboutWindow): PPchar; cdecl; external libadwaita;
procedure adw_about_window_set_documenters(self: PAdwAboutWindow; documenters: PPchar); cdecl; external libadwaita;
function adw_about_window_get_translator_credits(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_translator_credits(self: PAdwAboutWindow; translator_credits: pchar); cdecl; external libadwaita;
procedure adw_about_window_add_credit_section(self: PAdwAboutWindow; Name: pchar; people: PPchar); cdecl; external libadwaita;
procedure adw_about_window_add_acknowledgement_section(self: PAdwAboutWindow; Name: pchar; people: PPchar); cdecl; external libadwaita;
function adw_about_window_get_copyright(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_copyright(self: PAdwAboutWindow; copyright: pchar); cdecl; external libadwaita;
function adw_about_window_get_license_type(self: PAdwAboutWindow): TGtkLicense; cdecl; external libadwaita;
procedure adw_about_window_set_license_type(self: PAdwAboutWindow; license_type: TGtkLicense); cdecl; external libadwaita;
function adw_about_window_get_license(self: PAdwAboutWindow): pchar; cdecl; external libadwaita;
procedure adw_about_window_set_license(self: PAdwAboutWindow; license: pchar); cdecl; external libadwaita;
procedure adw_about_window_add_legal_section(self: PAdwAboutWindow; title: pchar; copyright: pchar; license_type: TGtkLicense; license: pchar); cdecl; external libadwaita;
procedure adw_show_about_window(parent: PGtkWindow; first_property_name: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_show_about_window(parent: PGtkWindow; first_property_name: pchar); cdecl; external libadwaita;
procedure adw_show_about_window_from_appdata(parent: PGtkWindow; resource_path: pchar; release_notes_version: pchar; first_property_name: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_show_about_window_from_appdata(parent: PGtkWindow; resource_path: pchar; release_notes_version: pchar; first_property_name: pchar); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 17:43:38 ===

function ADW_TYPE_ABOUT_WINDOW: TGType;
function ADW_ABOUT_WINDOW(obj: Pointer): PAdwAboutWindow;
function ADW_IS_ABOUT_WINDOW(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_ABOUT_WINDOW: TGType;
begin
  Result := adw_about_window_get_type;
end;

function ADW_ABOUT_WINDOW(obj: Pointer): PAdwAboutWindow;
begin
  Result := PAdwAboutWindow(g_type_check_instance_cast(obj, ADW_TYPE_ABOUT_WINDOW));
end;

function ADW_IS_ABOUT_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_ABOUT_WINDOW);
end;


end.
