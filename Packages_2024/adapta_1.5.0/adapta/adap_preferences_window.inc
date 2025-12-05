{$IFDEF read_interface}


type
  TAdapPreferencesWindow = record
    parent_instance: TAdapWindow;
  end;
  PAdapPreferencesWindow = ^TAdapPreferencesWindow;

  TAdapPreferencesWindowClass = record
    parent_class: TAdapWindowClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdapPreferencesWindowClass = ^TAdapPreferencesWindowClass;

function adap_preferences_window_get_type: TGType; cdecl; external libadapta;
function adap_preferences_window_new: PGtkWidget; cdecl; external libadapta;
procedure adap_preferences_window_add(self: PAdapPreferencesWindow; page: PAdapPreferencesPage); cdecl; external libadapta;
procedure adap_preferences_window_remove(self: PAdapPreferencesWindow; page: PAdapPreferencesPage); cdecl; external libadapta;
function adap_preferences_window_get_visible_page(self: PAdapPreferencesWindow): PAdapPreferencesPage; cdecl; external libadapta;
procedure adap_preferences_window_set_visible_page(self: PAdapPreferencesWindow; page: PAdapPreferencesPage); cdecl; external libadapta;
function adap_preferences_window_get_visible_page_name(self: PAdapPreferencesWindow): pchar; cdecl; external libadapta;
procedure adap_preferences_window_set_visible_page_name(self: PAdapPreferencesWindow; name: pchar); cdecl; external libadapta;
function adap_preferences_window_get_search_enabled(self: PAdapPreferencesWindow): Tgboolean; cdecl; external libadapta;
procedure adap_preferences_window_set_search_enabled(self: PAdapPreferencesWindow; search_enabled: Tgboolean); cdecl; external libadapta;
function adap_preferences_window_get_can_navigate_back(self: PAdapPreferencesWindow): Tgboolean; cdecl; external libadapta; deprecated'adap_navigation_page_get_can_pop';
procedure adap_preferences_window_set_can_navigate_back(self: PAdapPreferencesWindow; can_navigate_back: Tgboolean); cdecl; external libadapta; deprecated'adap_navigation_page_set_can_pop';
procedure adap_preferences_window_present_subpage(self: PAdapPreferencesWindow; subpage: PGtkWidget); cdecl; external libadapta; deprecated'adap_preferences_window_push_subpage';
procedure adap_preferences_window_close_subpage(self: PAdapPreferencesWindow); cdecl; external libadapta; deprecated'adap_preferences_window_pop_subpage';
procedure adap_preferences_window_push_subpage(self: PAdapPreferencesWindow; page: PAdapNavigationPage); cdecl; external libadapta;
function adap_preferences_window_pop_subpage(self: PAdapPreferencesWindow): Tgboolean; cdecl; external libadapta;
procedure adap_preferences_window_add_toast(self: PAdapPreferencesWindow; toast: PAdapToast); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:18:35 ===

function ADAP_TYPE_PREFERENCES_WINDOW: TGType;
function ADAP_PREFERENCES_WINDOW(obj: Pointer): PAdapPreferencesWindow;
function ADAP_IS_PREFERENCES_WINDOW(obj: Pointer): Tgboolean;
function ADAP_PREFERENCES_WINDOW_CLASS(klass: Pointer): PAdapPreferencesWindowClass;
function ADAP_IS_PREFERENCES_WINDOW_CLASS(klass: Pointer): Tgboolean;
function ADAP_PREFERENCES_WINDOW_GET_CLASS(obj: Pointer): PAdapPreferencesWindowClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_PREFERENCES_WINDOW: TGType;
begin
  Result := adap_preferences_window_get_type;
end;

function ADAP_PREFERENCES_WINDOW(obj: Pointer): PAdapPreferencesWindow;
begin
  Result := PAdapPreferencesWindow(g_type_check_instance_cast(obj, ADAP_TYPE_PREFERENCES_WINDOW));
end;

function ADAP_IS_PREFERENCES_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_PREFERENCES_WINDOW);
end;

function ADAP_PREFERENCES_WINDOW_CLASS(klass: Pointer): PAdapPreferencesWindowClass;
begin
  Result := PAdapPreferencesWindowClass(g_type_check_class_cast(klass, ADAP_TYPE_PREFERENCES_WINDOW));
end;

function ADAP_IS_PREFERENCES_WINDOW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_PREFERENCES_WINDOW);
end;

function ADAP_PREFERENCES_WINDOW_GET_CLASS(obj: Pointer): PAdapPreferencesWindowClass;
begin
  Result := PAdapPreferencesWindowClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
