unit adw_preferences_window;

interface

uses
  fp_glib2, fp_GTK4, adw_window, adw_preferences_page, adw_navigation_view, adw_toast;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {G_DECLARE_DERIVABLE_TYPE (AdwPreferencesWindow, adw_preferences_window, ADW, PREFERENCES_WINDOW, AdwWindow) }
type
  TAdwPreferencesWindowClass = record
    parent_class: TAdwWindowClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwPreferencesWindowClass = ^TAdwPreferencesWindowClass;

  TAdwPreferencesWindow = record
    parent_instance: TAdwWindow;
  end;
  PAdwPreferencesWindow = ^TAdwPreferencesWindow;

function adw_preferences_window_get_type: TGType; cdecl; external libadwaita;
function adw_preferences_window_new: PGtkWidget; cdecl; external libadwaita;
procedure adw_preferences_window_add(self: PAdwPreferencesWindow; page: PAdwPreferencesPage); cdecl; external libadwaita;
procedure adw_preferences_window_remove(self: PAdwPreferencesWindow; page: PAdwPreferencesPage); cdecl; external libadwaita;
function adw_preferences_window_get_visible_page(self: PAdwPreferencesWindow): PAdwPreferencesPage; cdecl; external libadwaita;
procedure adw_preferences_window_set_visible_page(self: PAdwPreferencesWindow; page: PAdwPreferencesPage); cdecl; external libadwaita;
function adw_preferences_window_get_visible_page_name(self: PAdwPreferencesWindow): pchar; cdecl; external libadwaita;
procedure adw_preferences_window_set_visible_page_name(self: PAdwPreferencesWindow; Name: pchar); cdecl; external libadwaita;
function adw_preferences_window_get_search_enabled(self: PAdwPreferencesWindow): Tgboolean; cdecl; external libadwaita;
procedure adw_preferences_window_set_search_enabled(self: PAdwPreferencesWindow; search_enabled: Tgboolean); cdecl; external libadwaita;
function adw_preferences_window_get_can_navigate_back(self: PAdwPreferencesWindow): Tgboolean; cdecl; external libadwaita;
procedure adw_preferences_window_set_can_navigate_back(self: PAdwPreferencesWindow; can_navigate_back: Tgboolean); cdecl; external libadwaita;
procedure adw_preferences_window_present_subpage(self: PAdwPreferencesWindow; subpage: PGtkWidget); cdecl; external libadwaita;
procedure adw_preferences_window_close_subpage(self: PAdwPreferencesWindow); cdecl; external libadwaita;
procedure adw_preferences_window_push_subpage(self: PAdwPreferencesWindow; page: PAdwNavigationPage); cdecl; external libadwaita;
function adw_preferences_window_pop_subpage(self: PAdwPreferencesWindow): Tgboolean; cdecl; external libadwaita;
procedure adw_preferences_window_add_toast(self: PAdwPreferencesWindow; toast: PAdwToast); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:57:28 ===

function ADW_TYPE_PREFERENCES_WINDOW: TGType;
function ADW_PREFERENCES_WINDOW(obj: Pointer): PAdwPreferencesWindow;
function ADW_IS_PREFERENCES_WINDOW(obj: Pointer): Tgboolean;
function ADW_PREFERENCES_WINDOW_CLASS(klass: Pointer): PAdwPreferencesWindowClass;
function ADW_IS_PREFERENCES_WINDOW_CLASS(klass: Pointer): Tgboolean;
function ADW_PREFERENCES_WINDOW_GET_CLASS(obj: Pointer): PAdwPreferencesWindowClass;

implementation

function ADW_TYPE_PREFERENCES_WINDOW: TGType;
begin
  Result := adw_preferences_window_get_type;
end;

function ADW_PREFERENCES_WINDOW(obj: Pointer): PAdwPreferencesWindow;
begin
  Result := PAdwPreferencesWindow(g_type_check_instance_cast(obj, ADW_TYPE_PREFERENCES_WINDOW));
end;

function ADW_IS_PREFERENCES_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_PREFERENCES_WINDOW);
end;

function ADW_PREFERENCES_WINDOW_CLASS(klass: Pointer): PAdwPreferencesWindowClass;
begin
  Result := PAdwPreferencesWindowClass(g_type_check_class_cast(klass, ADW_TYPE_PREFERENCES_WINDOW));
end;

function ADW_IS_PREFERENCES_WINDOW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_PREFERENCES_WINDOW);
end;

function ADW_PREFERENCES_WINDOW_GET_CLASS(obj: Pointer): PAdwPreferencesWindowClass;
begin
  Result := PAdwPreferencesWindowClass(PGTypeInstance(obj)^.g_class);
end;


end.
