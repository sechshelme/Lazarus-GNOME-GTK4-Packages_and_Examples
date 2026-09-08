{$IFDEF read_interface}



type
  PPkClientError = ^TPkClientError;
  TPkClientError = longint;
const
  PK_CLIENT_ERROR_FAILED = 0;
  PK_CLIENT_ERROR_FAILED_AUTH = 1;
  PK_CLIENT_ERROR_NO_TID = 2;
  PK_CLIENT_ERROR_ALREADY_TID = 3;
  PK_CLIENT_ERROR_ROLE_UNKNOWN = 4;
  PK_CLIENT_ERROR_CANNOT_START_DAEMON = 5;
  PK_CLIENT_ERROR_INVALID_INPUT = 6;
  PK_CLIENT_ERROR_INVALID_FILE = 7;
  PK_CLIENT_ERROR_NOT_SUPPORTED = 8;
  PK_CLIENT_ERROR_DECLINED_SIMULATION = 9;
  PK_CLIENT_ERROR_DECLINED_INTERACTION = 10;
  PK_CLIENT_ERROR_LAST = 11;

type
  PPkClientPrivate = type Pointer;

  PPkClient = ^TPkClient;
  TPkClient = record
    parent: TGObject;
    priv: PPkClientPrivate;
  end;

  PPkClientClass = ^TPkClientClass;
  TPkClientClass = record
    parent_class: TGObjectClass;
    changed: procedure(client: PPkClient); cdecl;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_client_error_quark: TGQuark; cdecl; external libpackagekit;
function pk_client_get_type: TGType; cdecl; external libpackagekit;
function pk_client_new: PPkClient; cdecl; external libpackagekit;

function pk_client_generic_finish(client: PPkClient; res: PGAsyncResult; error: PPGError): PPkResults; cdecl; external libpackagekit;
procedure pk_client_resolve_async(client: PPkClient; filters: TPkBitfield; packages: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_search_names_async(client: PPkClient; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_search_details_async(client: PPkClient; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_search_groups_async(client: PPkClient; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_search_files_async(client: PPkClient; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_get_details_async(client: PPkClient; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_get_details_local_async(client: PPkClient; files: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_get_files_local_async(client: PPkClient; files: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_get_update_detail_async(client: PPkClient; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_download_packages_async(client: PPkClient; package_ids: PPgchar; directory: Pgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_get_updates_async(client: PPkClient; filters: TPkBitfield; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_get_old_transactions_async(client: PPkClient; number: Tguint; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_depends_on_async(client: PPkClient; filters: TPkBitfield; package_ids: PPgchar; recursive: Tgboolean; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_get_packages_async(client: PPkClient; filters: TPkBitfield; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_required_by_async(client: PPkClient; filters: TPkBitfield; package_ids: PPgchar; recursive: Tgboolean; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_what_provides_async(client: PPkClient; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_get_distro_upgrades_async(client: PPkClient; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_get_files_async(client: PPkClient; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_get_categories_async(client: PPkClient; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_remove_packages_async(client: PPkClient; transaction_flags: TPkBitfield; package_ids: PPgchar; allow_deps: Tgboolean; autoremove: Tgboolean;
  cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_purge_packages_async(client: PPkClient; transaction_flags: TPkBitfield; package_ids: PPgchar; allow_deps: Tgboolean; autoremove: Tgboolean;
  cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_refresh_cache_async(client: PPkClient; force: Tgboolean; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_install_packages_async(client: PPkClient; transaction_flags: TPkBitfield; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_install_signature_async(client: PPkClient; _type: TPkSigTypeEnum; key_id: Pgchar; package_id: Pgchar; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_update_packages_async(client: PPkClient; transaction_flags: TPkBitfield; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_install_files_async(client: PPkClient; transaction_flags: TPkBitfield; files: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_accept_eula_async(client: PPkClient; eula_id: Pgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_get_repo_list_async(client: PPkClient; filters: TPkBitfield; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_repo_enable_async(client: PPkClient; repo_id: Pgchar; enabled: Tgboolean; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_repo_set_data_async(client: PPkClient; repo_id: Pgchar; parameter: Pgchar; value: Pgchar; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_repo_remove_async(client: PPkClient; transaction_flags: TPkBitfield; repo_id: Pgchar; autoremove: Tgboolean; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_upgrade_system_async(client: PPkClient; transaction_flags: TPkBitfield; distro_id: Pgchar; upgrade_kind: TPkUpgradeKindEnum; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_repair_system_async(client: PPkClient; transaction_flags: TPkBitfield; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
procedure pk_client_adopt_async(client: PPkClient; transaction_id: Pgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
function pk_client_get_progress_finish(client: PPkClient; res: PGAsyncResult; error: PPGError): PPkProgress; cdecl; external libpackagekit;
procedure pk_client_get_progress_async(client: PPkClient; transaction_id: Pgchar; cancellable: PGCancellable; callback_ready: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libpackagekit;
function pk_client_create_helper_argv_envp(argv: PPPgchar; envp_out: PPPgchar): Tgboolean; cdecl; external libpackagekit;

procedure pk_client_set_locale(client: PPkClient; locale: Pgchar); cdecl; external libpackagekit;
function pk_client_get_locale(client: PPkClient): Pgchar; cdecl; external libpackagekit;
procedure pk_client_set_background(client: PPkClient; background: Tgboolean); cdecl; external libpackagekit;
function pk_client_get_background(client: PPkClient): Tgboolean; cdecl; external libpackagekit;
procedure pk_client_set_interactive(client: PPkClient; interactive: Tgboolean); cdecl; external libpackagekit;
function pk_client_get_interactive(client: PPkClient): Tgboolean; cdecl; external libpackagekit;
function pk_client_get_idle(client: PPkClient): Tgboolean; cdecl; external libpackagekit;
procedure pk_client_set_cache_age(client: PPkClient; cache_age: Tguint); cdecl; external libpackagekit;
function pk_client_get_cache_age(client: PPkClient): Tguint; cdecl; external libpackagekit;
procedure pk_client_set_details_with_deps_size(client: PPkClient; details_with_deps_size: Tgboolean); cdecl; external libpackagekit;
function pk_client_get_details_with_deps_size(client: PPkClient): Tgboolean; cdecl; external libpackagekit;

function PK_CLIENT_ERROR: TGQuark;

// === Konventiert am: 7-9-26 15:04:18 ===

function PK_TYPE_CLIENT: TGType;
function PK_CLIENT(obj: Pointer): PPkClient;
function PK_CLIENT_CLASS(klass: Pointer): PPkClientClass;
function PK_IS_CLIENT(obj: Pointer): Tgboolean;
function PK_IS_CLIENT_CLASS(klass: Pointer): Tgboolean;
function PK_CLIENT_GET_CLASS(obj: Pointer): PPkClientClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_CLIENT: TGType;
begin
  PK_TYPE_CLIENT := pk_client_get_type;
end;

function PK_CLIENT(obj: Pointer): PPkClient;
begin
  Result := PPkClient(g_type_check_instance_cast(obj, PK_TYPE_CLIENT));
end;

function PK_CLIENT_CLASS(klass: Pointer): PPkClientClass;
begin
  Result := PPkClientClass(g_type_check_class_cast(klass, PK_TYPE_CLIENT));
end;

function PK_IS_CLIENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_CLIENT);
end;

function PK_IS_CLIENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_CLIENT);
end;

function PK_CLIENT_GET_CLASS(obj: Pointer): PPkClientClass;
begin
  Result := PPkClientClass(PGTypeInstance(obj)^.g_class);
end;


function PK_CLIENT_ERROR: TGQuark;
begin
  PK_CLIENT_ERROR := pk_client_error_quark;
end;

{$ENDIF read_implementation}
