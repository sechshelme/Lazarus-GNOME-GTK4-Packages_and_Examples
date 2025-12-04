unit adap_about_window;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_window;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapAboutWindow = record
  end;
  PAdapAboutWindow = ^TAdapAboutWindow;

  TAdapAboutWindowClass = record
    parent_class: TAdapWindowClass;
  end;
  PAdapAboutWindowClass = ^TAdapAboutWindowClass;

function adap_about_window_get_type: TGType; cdecl; external libadapta;
function adap_about_window_new: PGtkWidget; cdecl; external libadapta;
function adap_about_window_new_from_appdata(resource_path: pchar; release_notes_version: pchar): PGtkWidget; cdecl; external libadapta;
function adap_about_window_get_application_name(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_application_name(self: PAdapAboutWindow; application_name: pchar); cdecl; external libadapta;
function adap_about_window_get_application_icon(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_application_icon(self: PAdapAboutWindow; application_icon: pchar); cdecl; external libadapta;
function adap_about_window_get_developer_name(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_developer_name(self: PAdapAboutWindow; developer_name: pchar); cdecl; external libadapta;
function adap_about_window_get_version(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_version(self: PAdapAboutWindow; version: pchar); cdecl; external libadapta;
function adap_about_window_get_release_notes_version(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_release_notes_version(self: PAdapAboutWindow; version: pchar); cdecl; external libadapta;
function adap_about_window_get_release_notes(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_release_notes(self: PAdapAboutWindow; release_notes: pchar); cdecl; external libadapta;
function adap_about_window_get_comments(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_comments(self: PAdapAboutWindow; comments: pchar); cdecl; external libadapta;
function adap_about_window_get_website(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_website(self: PAdapAboutWindow; website: pchar); cdecl; external libadapta;
function adap_about_window_get_support_url(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_support_url(self: PAdapAboutWindow; support_url: pchar); cdecl; external libadapta;
function adap_about_window_get_issue_url(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_issue_url(self: PAdapAboutWindow; issue_url: pchar); cdecl; external libadapta;
procedure adap_about_window_add_link(self: PAdapAboutWindow; title: pchar; url: pchar); cdecl; external libadapta;
function adap_about_window_get_debug_info(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_debug_info(self: PAdapAboutWindow; debug_info: pchar); cdecl; external libadapta;
function adap_about_window_get_debug_info_filename(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_debug_info_filename(self: PAdapAboutWindow; filename: pchar); cdecl; external libadapta;
function adap_about_window_get_developers(self: PAdapAboutWindow): Ppchar; cdecl; external libadapta;
procedure adap_about_window_set_developers(self: PAdapAboutWindow; developers: PPchar); cdecl; external libadapta;
function adap_about_window_get_designers(self: PAdapAboutWindow): Ppchar; cdecl; external libadapta;
procedure adap_about_window_set_designers(self: PAdapAboutWindow; designers: PPchar); cdecl; external libadapta;
function adap_about_window_get_artists(self: PAdapAboutWindow): Ppchar; cdecl; external libadapta;
procedure adap_about_window_set_artists(self: PAdapAboutWindow; artists: PPchar); cdecl; external libadapta;
function adap_about_window_get_documenters(self: PAdapAboutWindow): Ppchar; cdecl; external libadapta;
procedure adap_about_window_set_documenters(self: PAdapAboutWindow; documenters: PPchar); cdecl; external libadapta;
function adap_about_window_get_translator_credits(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_translator_credits(self: PAdapAboutWindow; translator_credits: pchar); cdecl; external libadapta;
procedure adap_about_window_add_credit_section(self: PAdapAboutWindow; name: pchar; people: PPchar); cdecl; external libadapta;
procedure adap_about_window_add_acknowledgement_section(self: PAdapAboutWindow; name: pchar; people: PPchar); cdecl; external libadapta;
function adap_about_window_get_copyright(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_copyright(self: PAdapAboutWindow; copyright: pchar); cdecl; external libadapta;
function adap_about_window_get_license_type(self: PAdapAboutWindow): TGtkLicense; cdecl; external libadapta;
procedure adap_about_window_set_license_type(self: PAdapAboutWindow; license_type: TGtkLicense); cdecl; external libadapta;
function adap_about_window_get_license(self: PAdapAboutWindow): pchar; cdecl; external libadapta;
procedure adap_about_window_set_license(self: PAdapAboutWindow; license: pchar); cdecl; external libadapta;
procedure adap_about_window_add_legal_section(self: PAdapAboutWindow; title: pchar; copyright: pchar; license_type: TGtkLicense; license: pchar); cdecl; external libadapta;
procedure adap_show_about_window(parent: PGtkWindow; first_property_name: pchar; args: array of const); cdecl; external libadapta;
procedure adap_show_about_window(parent: PGtkWindow; first_property_name: pchar); cdecl; external libadapta;
procedure adap_show_about_window_from_appdata(parent: PGtkWindow; resource_path: pchar; release_notes_version: pchar; first_property_name: pchar; args: array of const); cdecl; external libadapta;
procedure adap_show_about_window_from_appdata(parent: PGtkWindow; resource_path: pchar; release_notes_version: pchar; first_property_name: pchar); cdecl; external libadapta;

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


end.
