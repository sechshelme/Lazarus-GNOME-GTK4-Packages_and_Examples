unit pk_task_sync;

interface

uses
  fp_glib2, fp_packagekit, pk_task, pk_progress, pk_results, pk_bitfield, pk_enum;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function pk_task_remove_packages_sync(task: PPkTask; package_ids: PPgchar; allow_deps: Tgboolean; autoremove: Tgboolean; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_purge_packages_sync(task: PPkTask; package_ids: PPgchar; allow_deps: Tgboolean; autoremove: Tgboolean; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_install_packages_sync(task: PPkTask; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_update_packages_sync(task: PPkTask; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_install_files_sync(task: PPkTask; files: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_resolve_sync(task: PPkTask; filters: TPkBitfield; packages: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_search_names_sync(task: PPkTask; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_search_details_sync(task: PPkTask; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_search_groups_sync(task: PPkTask; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_search_files_sync(task: PPkTask; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_get_details_sync(task: PPkTask; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_get_update_detail_sync(task: PPkTask; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_download_packages_sync(task: PPkTask; package_ids: PPgchar; directory: Pgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_get_updates_sync(task: PPkTask; filters: TPkBitfield; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_depends_on_sync(task: PPkTask; filters: TPkBitfield; package_ids: PPgchar; recursive: Tgboolean; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_get_packages_sync(task: PPkTask; filters: TPkBitfield; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_required_by_sync(task: PPkTask; filters: TPkBitfield; package_ids: PPgchar; recursive: Tgboolean; cancellable: PGCancellable;
  progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_what_provides_sync(task: PPkTask; filters: TPkBitfield; values: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_get_files_sync(task: PPkTask; package_ids: PPgchar; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_get_categories_sync(task: PPkTask; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_refresh_cache_sync(task: PPkTask; force: Tgboolean; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_get_repo_list_sync(task: PPkTask; filters: TPkBitfield; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer;
  error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_repo_enable_sync(task: PPkTask; repo_id: Pgchar; enabled: Tgboolean; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_upgrade_system_sync(task: PPkTask; distro_id: Pgchar; upgrade_kind: TPkUpgradeKindEnum; cancellable: PGCancellable; progress_callback: TPkProgressCallback;
  progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;
function pk_task_repair_system_sync(task: PPkTask; cancellable: PGCancellable; progress_callback: TPkProgressCallback; progress_user_data: Tgpointer; error: PPGError): PPkResults; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:13:33 ===


implementation



end.
