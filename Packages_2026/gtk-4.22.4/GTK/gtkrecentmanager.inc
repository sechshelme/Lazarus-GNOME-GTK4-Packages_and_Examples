

  {$IFDEF read_struct}
type
  PGtkRecentData = ^TGtkRecentData;
  TGtkRecentData = record
    display_name: pchar;
    description: pchar;
    mime_type: pchar;
    app_name: pchar;
    app_exec: pchar;
    groups: ^pchar;
    is_private: Tgboolean;
  end;

  PGtkRecentInfo = type Pointer;

  PGtkRecentManagerPrivate = type Pointer;

  PGtkRecentManager = ^TGtkRecentManager;
  TGtkRecentManager = record
    parent_instance: TGObject;
    priv: PGtkRecentManagerPrivate;
  end;

  PGtkRecentManagerClass = ^TGtkRecentManagerClass;
  TGtkRecentManagerClass = record
    parent_class: TGObjectClass;
    changed: procedure(manager: PGtkRecentManager); cdecl;
    _gtk_recent1: procedure; cdecl;
    _gtk_recent2: procedure; cdecl;
    _gtk_recent3: procedure; cdecl;
    _gtk_recent4: procedure; cdecl;
  end;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  PGtkRecentManagerError = ^TGtkRecentManagerError;
  TGtkRecentManagerError = longint;
const
  GTK_RECENT_MANAGER_ERROR_NOT_FOUND = 0;
  GTK_RECENT_MANAGER_ERROR_INVALID_URI = 1;
  GTK_RECENT_MANAGER_ERROR_INVALID_ENCODING = 2;
  GTK_RECENT_MANAGER_ERROR_NOT_REGISTERED = 3;
  GTK_RECENT_MANAGER_ERROR_READ = 4;
  GTK_RECENT_MANAGER_ERROR_WRITE = 5;
  GTK_RECENT_MANAGER_ERROR_UNKNOWN = 6;
  {$ENDIF read_enum}

{$IFDEF read_function}
function gtk_recent_manager_error_quark: TGQuark; cdecl; external libgtk4;
function gtk_recent_manager_get_type: TGType; cdecl; external libgtk4;
function gtk_recent_manager_new: PGtkRecentManager; cdecl; external libgtk4;
function gtk_recent_manager_get_default: PGtkRecentManager; cdecl; external libgtk4;
function gtk_recent_manager_add_item(manager: PGtkRecentManager; uri: pchar): Tgboolean; cdecl; external libgtk4;
function gtk_recent_manager_add_full(manager: PGtkRecentManager; uri: pchar; recent_data: PGtkRecentData): Tgboolean; cdecl; external libgtk4;
function gtk_recent_manager_remove_item(manager: PGtkRecentManager; uri: pchar; error: PPGError): Tgboolean; cdecl; external libgtk4;
function gtk_recent_manager_lookup_item(manager: PGtkRecentManager; uri: pchar; error: PPGError): PGtkRecentInfo; cdecl; external libgtk4;
function gtk_recent_manager_has_item(manager: PGtkRecentManager; uri: pchar): Tgboolean; cdecl; external libgtk4;
function gtk_recent_manager_move_item(manager: PGtkRecentManager; uri: pchar; new_uri: pchar; error: PPGError): Tgboolean; cdecl; external libgtk4;
function gtk_recent_manager_get_items(manager: PGtkRecentManager): PGList; cdecl; external libgtk4;
function gtk_recent_manager_purge_items(manager: PGtkRecentManager; error: PPGError): longint; cdecl; external libgtk4;
function gtk_recent_info_get_type: TGType; cdecl; external libgtk4;
function gtk_recent_info_ref(info: PGtkRecentInfo): PGtkRecentInfo; cdecl; external libgtk4;
procedure gtk_recent_info_unref(info: PGtkRecentInfo); cdecl; external libgtk4;
function gtk_recent_info_get_uri(info: PGtkRecentInfo): pchar; cdecl; external libgtk4;
function gtk_recent_info_get_display_name(info: PGtkRecentInfo): pchar; cdecl; external libgtk4;
function gtk_recent_info_get_description(info: PGtkRecentInfo): pchar; cdecl; external libgtk4;
function gtk_recent_info_get_mime_type(info: PGtkRecentInfo): pchar; cdecl; external libgtk4;
function gtk_recent_info_get_added(info: PGtkRecentInfo): PGDateTime; cdecl; external libgtk4;
function gtk_recent_info_get_modified(info: PGtkRecentInfo): PGDateTime; cdecl; external libgtk4;
function gtk_recent_info_get_visited(info: PGtkRecentInfo): PGDateTime; cdecl; external libgtk4;
function gtk_recent_info_get_private_hint(info: PGtkRecentInfo): Tgboolean; cdecl; external libgtk4;
function gtk_recent_info_get_application_info(info: PGtkRecentInfo; app_name: pchar; app_exec: PPchar; count: Pguint; stamp: PPGDateTime): Tgboolean; cdecl; external libgtk4;
function gtk_recent_info_create_app_info(info: PGtkRecentInfo; app_name: pchar; error: PPGError): PGAppInfo; cdecl; external libgtk4;
function gtk_recent_info_get_applications(info: PGtkRecentInfo; length: Pgsize): Ppchar; cdecl; external libgtk4;
function gtk_recent_info_last_application(info: PGtkRecentInfo): pchar; cdecl; external libgtk4;
function gtk_recent_info_has_application(info: PGtkRecentInfo; app_name: pchar): Tgboolean; cdecl; external libgtk4;
function gtk_recent_info_get_groups(info: PGtkRecentInfo; length: Pgsize): Ppchar; cdecl; external libgtk4;
function gtk_recent_info_has_group(info: PGtkRecentInfo; group_name: pchar): Tgboolean; cdecl; external libgtk4;
function gtk_recent_info_get_gicon(info: PGtkRecentInfo): PGIcon; cdecl; external libgtk4;
function gtk_recent_info_get_short_name(info: PGtkRecentInfo): pchar; cdecl; external libgtk4;
function gtk_recent_info_get_uri_display(info: PGtkRecentInfo): pchar; cdecl; external libgtk4;
function gtk_recent_info_get_age(info: PGtkRecentInfo): longint; cdecl; external libgtk4;
function gtk_recent_info_is_local(info: PGtkRecentInfo): Tgboolean; cdecl; external libgtk4;
function gtk_recent_info_exists(info: PGtkRecentInfo): Tgboolean; cdecl; external libgtk4;
function gtk_recent_info_match(info_a: PGtkRecentInfo; info_b: PGtkRecentInfo): Tgboolean; cdecl; external libgtk4;
procedure _gtk_recent_manager_sync; cdecl; external libgtk4;


function GTK_RECENT_MANAGER_ERROR: TGQuark;
function GTK_TYPE_RECENT_INFO: TGType;

// === Konventiert am: 6-7-26 16:07:31 ===

function GTK_TYPE_RECENT_MANAGER: TGType;
function GTK_RECENT_MANAGER(obj: Pointer): PGtkRecentManager;
function GTK_RECENT_MANAGER_CLASS(klass: Pointer): PGtkRecentManagerClass;
function GTK_IS_RECENT_MANAGER(obj: Pointer): Tgboolean;
function GTK_IS_RECENT_MANAGER_CLASS(klass: Pointer): Tgboolean;
function GTK_RECENT_MANAGER_GET_CLASS(obj: Pointer): PGtkRecentManagerClass;
{$ENDIF read_function}



{$IFDEF read_implementation}

function GTK_TYPE_RECENT_MANAGER: TGType;
begin
  GTK_TYPE_RECENT_MANAGER := gtk_recent_manager_get_type;
end;

function GTK_RECENT_MANAGER(obj: Pointer): PGtkRecentManager;
begin
  Result := PGtkRecentManager(g_type_check_instance_cast(obj, GTK_TYPE_RECENT_MANAGER));
end;

function GTK_RECENT_MANAGER_CLASS(klass: Pointer): PGtkRecentManagerClass;
begin
  Result := PGtkRecentManagerClass(g_type_check_class_cast(klass, GTK_TYPE_RECENT_MANAGER));
end;

function GTK_IS_RECENT_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_RECENT_MANAGER);
end;

function GTK_IS_RECENT_MANAGER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_RECENT_MANAGER);
end;

function GTK_RECENT_MANAGER_GET_CLASS(obj: Pointer): PGtkRecentManagerClass;
begin
  Result := PGtkRecentManagerClass(PGTypeInstance(obj)^.g_class);
end;


function GTK_RECENT_MANAGER_ERROR: TGQuark;
begin
  GTK_RECENT_MANAGER_ERROR := gtk_recent_manager_error_quark;
end;

function GTK_TYPE_RECENT_INFO: TGType;
begin
  GTK_TYPE_RECENT_INFO := gtk_recent_info_get_type;
end;

{$ENDIF read_implementation}
