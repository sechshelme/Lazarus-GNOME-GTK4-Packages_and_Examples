
{$IFDEF read_interface}

type
  TGDesktopAppInfo = record
  end;
  PGDesktopAppInfo = ^TGDesktopAppInfo;

  TGDesktopAppInfoClass = record
    parent_class: TGObjectClass;
  end;
  PGDesktopAppInfoClass = ^TGDesktopAppInfoClass;

function g_desktop_app_info_get_type: TGType; cdecl; external libgio2;
function g_desktop_app_info_new_from_filename(filename: pchar): PGDesktopAppInfo; cdecl; external libgio2;
function g_desktop_app_info_new_from_keyfile(key_file: PGKeyFile): PGDesktopAppInfo; cdecl; external libgio2;
function g_desktop_app_info_get_filename(info: PGDesktopAppInfo): pchar; cdecl; external libgio2;
function g_desktop_app_info_get_generic_name(info: PGDesktopAppInfo): pchar; cdecl; external libgio2;
function g_desktop_app_info_get_categories(info: PGDesktopAppInfo): pchar; cdecl; external libgio2;
function g_desktop_app_info_get_keywords(info: PGDesktopAppInfo): PPchar; cdecl; external libgio2;
function g_desktop_app_info_get_nodisplay(info: PGDesktopAppInfo): Tgboolean; cdecl; external libgio2;
function g_desktop_app_info_get_show_in(info: PGDesktopAppInfo; desktop_env: Pgchar): Tgboolean; cdecl; external libgio2;
function g_desktop_app_info_get_startup_wm_class(info: PGDesktopAppInfo): pchar; cdecl; external libgio2;
function g_desktop_app_info_new(desktop_id: pchar): PGDesktopAppInfo; cdecl; external libgio2;
function g_desktop_app_info_get_is_hidden(info: PGDesktopAppInfo): Tgboolean; cdecl; external libgio2;
procedure g_desktop_app_info_set_desktop_env(desktop_env: pchar); cdecl; external libgio2; deprecated; // GIO_DEPRECATED_IN_2_42
function g_desktop_app_info_has_key(info: PGDesktopAppInfo; key: pchar): Tgboolean; cdecl; external libgio2;
function g_desktop_app_info_get_string(info: PGDesktopAppInfo; key: pchar): pchar; cdecl; external libgio2;
function g_desktop_app_info_get_locale_string(info: PGDesktopAppInfo; key: pchar): pchar; cdecl; external libgio2;
function g_desktop_app_info_get_boolean(info: PGDesktopAppInfo; key: pchar): Tgboolean; cdecl; external libgio2;
function g_desktop_app_info_get_string_list(info: PGDesktopAppInfo; key: pchar; length: Pgsize): PPgchar; cdecl; external libgio2;
function g_desktop_app_info_list_actions(info: PGDesktopAppInfo): PPgchar; cdecl; external libgio2;
procedure g_desktop_app_info_launch_action(info: PGDesktopAppInfo; action_name: Pgchar; launch_context: PGAppLaunchContext); cdecl; external libgio2;
function g_desktop_app_info_get_action_name(info: PGDesktopAppInfo; action_name: Pgchar): Pgchar; cdecl; external libgio2;

const
  G_DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME = 'gio-desktop-app-info-lookup'; // GIO_DEPRECATED_MACRO_IN_2_28

type
  TGDesktopAppInfoLookup = record
  end;
  PGDesktopAppInfoLookup = ^TGDesktopAppInfoLookup;

  TGDesktopAppInfoLookupIface = record
    g_iface: TGTypeInterface;
    get_default_for_uri_scheme: function(lookup: PGDesktopAppInfoLookup; uri_scheme: pchar): PGAppInfo; cdecl;
  end;
  PGDesktopAppInfoLookupIface = ^TGDesktopAppInfoLookupIface;

function g_desktop_app_info_lookup_get_type: TGType; cdecl; external libgio2; deprecated; // GIO_DEPRECATED
function g_desktop_app_info_lookup_get_default_for_uri_scheme(lookup: PGDesktopAppInfoLookup; uri_scheme: pchar): PGAppInfo; cdecl; external libgio2; deprecated; // GIO_DEPRECATED

type
  TGDesktopAppLaunchCallback = procedure(appinfo: PGDesktopAppInfo; pid: TGPid; user_data: Tgpointer); cdecl;

function g_desktop_app_info_launch_uris_as_manager(appinfo: PGDesktopAppInfo; uris: PGList; launch_context: PGAppLaunchContext; spawn_flags: TGSpawnFlags; user_setup: TGSpawnChildSetupFunc;
  user_setup_data: Tgpointer; pid_callback: TGDesktopAppLaunchCallback; pid_callback_data: Tgpointer; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_desktop_app_info_launch_uris_as_manager_with_fds(appinfo: PGDesktopAppInfo; uris: PGList; launch_context: PGAppLaunchContext; spawn_flags: TGSpawnFlags; user_setup: TGSpawnChildSetupFunc;
  user_setup_data: Tgpointer; pid_callback: TGDesktopAppLaunchCallback; pid_callback_data: Tgpointer; stdin_fd: Tgint; stdout_fd: Tgint;
  stderr_fd: Tgint; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_desktop_app_info_search(search_string: Pgchar): PPPgchar; cdecl; external libgio2;
function g_desktop_app_info_get_implementations(iface: Pgchar): PGList; cdecl; external libgio2;

function G_TYPE_DESKTOP_APP_INFO_LOOKUP: TGType; deprecated; // GIO_DEPRECATED_MACRO_IN_2_28
function G_DESKTOP_APP_INFO_LOOKUP(obj: Pointer): PGDesktopAppInfoLookup; deprecated; // GIO_DEPRECATED_MACRO_IN_2_28
function G_IS_DESKTOP_APP_INFO_LOOKUP(obj: Pointer): Tgboolean; deprecated; // GIO_DEPRECATED_MACRO_IN_2_28
function G_DESKTOP_APP_INFO_LOOKUP_GET_IFACE(obj: Pointer): PGDesktopAppInfoLookupIface; deprecated; // GIO_DEPRECATED_MACRO_IN_2_28

// === Konventiert am: 20-11-24 15:18:19 ===

function G_TYPE_DESKTOP_APP_INFO: TGType;
function G_DESKTOP_APP_INFO(obj: Pointer): PGDesktopAppInfo;
function G_DESKTOP_APP_INFO_CLASS(klass: Pointer): PGDesktopAppInfoClass;
function G_IS_DESKTOP_APP_INFO(obj: Pointer): Tgboolean;
function G_IS_DESKTOP_APP_INFO_CLASS(klass: Pointer): Tgboolean;
function G_DESKTOP_APP_INFO_GET_CLASS(obj: Pointer): PGDesktopAppInfoClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_DESKTOP_APP_INFO: TGType;
begin
  G_TYPE_DESKTOP_APP_INFO := g_desktop_app_info_get_type;
end;

function G_DESKTOP_APP_INFO(obj: Pointer): PGDesktopAppInfo;
begin
  Result := PGDesktopAppInfo(g_type_check_instance_cast(obj, G_TYPE_DESKTOP_APP_INFO));
end;

function G_DESKTOP_APP_INFO_CLASS(klass: Pointer): PGDesktopAppInfoClass;
begin
  Result := PGDesktopAppInfoClass(g_type_check_class_cast(klass, G_TYPE_DESKTOP_APP_INFO));
end;

function G_IS_DESKTOP_APP_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DESKTOP_APP_INFO);
end;

function G_IS_DESKTOP_APP_INFO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_DESKTOP_APP_INFO);
end;

function G_DESKTOP_APP_INFO_GET_CLASS(obj: Pointer): PGDesktopAppInfoClass;
begin
  Result := PGDesktopAppInfoClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function G_TYPE_DESKTOP_APP_INFO_LOOKUP: TGType;
begin
  G_TYPE_DESKTOP_APP_INFO_LOOKUP := g_desktop_app_info_lookup_get_type;
end;

function G_DESKTOP_APP_INFO_LOOKUP(obj: Pointer): PGDesktopAppInfoLookup;
begin
  Result := PGDesktopAppInfoLookup(g_type_check_instance_cast(obj, G_TYPE_DESKTOP_APP_INFO_LOOKUP));
end;

function G_IS_DESKTOP_APP_INFO_LOOKUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DESKTOP_APP_INFO_LOOKUP);
end;

function G_DESKTOP_APP_INFO_LOOKUP_GET_IFACE(obj: Pointer): PGDesktopAppInfoLookupIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DESKTOP_APP_INFO_LOOKUP);
end;


{$ENDIF read_implementation}
