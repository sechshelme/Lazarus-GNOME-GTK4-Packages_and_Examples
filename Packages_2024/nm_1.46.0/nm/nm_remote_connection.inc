

  {$IFDEF read_enum}
const
  NM_REMOTE_CONNECTION_DBUS_CONNECTION = 'dbus-connection';
  NM_REMOTE_CONNECTION_PATH = 'path';
  NM_REMOTE_CONNECTION_UNSAVED = 'unsaved';
  NM_REMOTE_CONNECTION_FLAGS = 'flags';
  NM_REMOTE_CONNECTION_FILENAME = 'filename';
  NM_REMOTE_CONNECTION_VERSION_ID = 'version-id';
  NM_REMOTE_CONNECTION_VISIBLE = 'visible';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMRemoteConnection = type Pointer;
  PNMRemoteConnectionClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_remote_connection_get_type: TGType; cdecl; external libnm;
procedure nm_remote_connection_update2(connection: PNMRemoteConnection; settings: PGVariant; flags: TNMSettingsUpdate2Flags; args: PGVariant; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_remote_connection_update2_finish(connection: PNMRemoteConnection; result: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libnm;
function nm_remote_connection_commit_changes(connection: PNMRemoteConnection; save_to_disk: Tgboolean; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
procedure nm_remote_connection_commit_changes_async(connection: PNMRemoteConnection; save_to_disk: Tgboolean; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_remote_connection_commit_changes_finish(connection: PNMRemoteConnection; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_remote_connection_save(connection: PNMRemoteConnection; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
procedure nm_remote_connection_save_async(connection: PNMRemoteConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_remote_connection_save_finish(connection: PNMRemoteConnection; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_remote_connection_delete(connection: PNMRemoteConnection; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
procedure nm_remote_connection_delete_async(connection: PNMRemoteConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_remote_connection_delete_finish(connection: PNMRemoteConnection; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_remote_connection_get_secrets(connection: PNMRemoteConnection; setting_name: pchar; cancellable: PGCancellable; error: PPGError): PGVariant; cdecl; external libnm;
procedure nm_remote_connection_get_secrets_async(connection: PNMRemoteConnection; setting_name: pchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_remote_connection_get_secrets_finish(connection: PNMRemoteConnection; result: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libnm;
function nm_remote_connection_get_unsaved(connection: PNMRemoteConnection): Tgboolean; cdecl; external libnm;
function nm_remote_connection_get_flags(connection: PNMRemoteConnection): TNMSettingsConnectionFlags; cdecl; external libnm;
function nm_remote_connection_get_filename(connection: PNMRemoteConnection): pchar; cdecl; external libnm;
function nm_remote_connection_get_visible(connection: PNMRemoteConnection): Tgboolean; cdecl; external libnm;
function nm_remote_connection_get_version_id(connection: PNMRemoteConnection): Tguint64; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:28:30 ===

function NM_TYPE_REMOTE_CONNECTION: TGType;
function NM_REMOTE_CONNECTION(obj: Pointer): PNMRemoteConnection;
function NM_REMOTE_CONNECTION_CLASS(klass: Pointer): PNMRemoteConnectionClass;
function NM_IS_REMOTE_CONNECTION(obj: Pointer): Tgboolean;
function NM_IS_REMOTE_CONNECTION_CLASS(klass: Pointer): Tgboolean;
function NM_REMOTE_CONNECTION_GET_CLASS(obj: Pointer): PNMRemoteConnectionClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_REMOTE_CONNECTION: TGType;
begin
  NM_TYPE_REMOTE_CONNECTION := nm_remote_connection_get_type;
end;

function NM_REMOTE_CONNECTION(obj: Pointer): PNMRemoteConnection;
begin
  Result := PNMRemoteConnection(g_type_check_instance_cast(obj, NM_TYPE_REMOTE_CONNECTION));
end;

function NM_REMOTE_CONNECTION_CLASS(klass: Pointer): PNMRemoteConnectionClass;
begin
  Result := PNMRemoteConnectionClass(g_type_check_class_cast(klass, NM_TYPE_REMOTE_CONNECTION));
end;

function NM_IS_REMOTE_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_REMOTE_CONNECTION);
end;

function NM_IS_REMOTE_CONNECTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_REMOTE_CONNECTION);
end;

function NM_REMOTE_CONNECTION_GET_CLASS(obj: Pointer): PNMRemoteConnectionClass;
begin
  Result := PNMRemoteConnectionClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
