unit pk_client_sync;

interface

uses
  fp_glib2, fp_packagekit, pk_client, pk_bitfield, pk_results, pk_progress, pk_enum;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function pk_client_resolve(client: PPkClient; filters: TPkBitfield; packages: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_search_names(client: PPkClient; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_search_details(client: PPkClient; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_search_groups(client: PPkClient; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_search_files(client: PPkClient; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_get_details(client: PPkClient; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_get_details_local(client: PPkClient; files: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_get_files_local(client: PPkClient; files: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_get_update_detail(client: PPkClient; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_download_packages(client: PPkClient; package_ids: PPgchar; directory: Pgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_get_updates(client: PPkClient; filters: TPkBitfield; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_get_old_transactions(client: PPkClient; number: Tguint; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_depends_on(client: PPkClient; filters: TPkBitfield; package_ids: PPgchar; recursive: Tgboolean; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_get_packages(client: PPkClient; filters: TPkBitfield; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_required_by(client: PPkClient; filters: TPkBitfield; package_ids: PPgchar; recursive: Tgboolean; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_what_provides(client: PPkClient; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_get_distro_upgrades(client: PPkClient; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_get_files(client: PPkClient; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_get_categories(client: PPkClient; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_remove_packages(client: PPkClient; transaction_flags: TPkBitfield; package_ids: PPgchar; allow_deps: Tgboolean; autoremove: Tgboolean;
  cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_purge_packages(client: PPkClient; transaction_flags: TPkBitfield; package_ids: PPgchar; allow_deps: Tgboolean; autoremove: Tgboolean;
  cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_refresh_cache(client: PPkClient; force: Tgboolean; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_install_packages(client: PPkClient; transaction_flags: TPkBitfield; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_install_signature(client: PPkClient; _type: TPkSigTypeEnum; key_id: Pgchar; package_id: Pgchar; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_update_packages(client: PPkClient; transaction_flags: TPkBitfield; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_install_files(client: PPkClient; transaction_flags: TPkBitfield; files: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_accept_eula(client: PPkClient; eula_id: Pgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_get_repo_list(client: PPkClient; filters: TPkBitfield; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_repo_enable(client: PPkClient; repo_id: Pgchar; enabled: Tgboolean; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_repo_set_data(client: PPkClient; repo_id: Pgchar; parameter: Pgchar; value: Pgchar; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_repo_remove(client: PPkClient; transaction_flags: TPkBitfield; repo_id: Pgchar; autoremove: Tgboolean; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_upgrade_system(client: PPkClient; transaction_flags: TPkBitfield; distro_id: Pgchar; upgrade_kind: TPkUpgradeKindEnum; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_repair_system(client: PPkClient; transaction_flags: TPkBitfield; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_adopt(client: PPkClient; transaction_id: Pgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_client_get_progress(client: PPkClient; transaction_id: Pgchar; cancellable: PGCancellable; error: PPGError): PPkProgress; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:04:05 ===


implementation



end.
