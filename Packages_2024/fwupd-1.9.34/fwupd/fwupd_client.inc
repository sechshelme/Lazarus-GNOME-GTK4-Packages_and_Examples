

  {$IFDEF read_struct}
type
  TFwupdClient = record
    parent_instance: TGObject;
  end;
  PFwupdClient = ^TFwupdClient;

  TFwupdClientClass = record
    parent_class: TGObjectClass;
    changed: procedure(client: PFwupdClient); cdecl;
    status_changed: procedure(client: PFwupdClient; status: TFwupdStatus); cdecl;
    device_added: procedure(client: PFwupdClient; result: PFwupdDevice); cdecl;
    device_removed: procedure(client: PFwupdClient; result: PFwupdDevice); cdecl;
    device_changed: procedure(client: PFwupdClient; result: PFwupdDevice); cdecl;
    device_request: procedure(client: PFwupdClient; request: PFwupdRequest); cdecl;
    _fwupd_reserved1: procedure; cdecl;
    _fwupd_reserved2: procedure; cdecl;
    _fwupd_reserved3: procedure; cdecl;
    _fwupd_reserved4: procedure; cdecl;
    _fwupd_reserved5: procedure; cdecl;
    _fwupd_reserved6: procedure; cdecl;
  end;
  PFwupdClientClass = ^TFwupdClientClass;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  PFwupdClientDownloadFlags = ^TFwupdClientDownloadFlags;
  TFwupdClientDownloadFlags = longint;

const
  FWUPD_CLIENT_DOWNLOAD_FLAG_NONE = 0;
  FWUPD_CLIENT_DOWNLOAD_FLAG_ONLY_P2P = 1 shl 0;
  FWUPD_CLIENT_DOWNLOAD_FLAG_LAST = (1 shl 0) + 1;

const
  FWUPD_CLIENT_DOWNLOAD_FLAG_ONLY_IPFS = FWUPD_CLIENT_DOWNLOAD_FLAG_ONLY_P2P;

type
  PFwupdClientUploadFlags = ^TFwupdClientUploadFlags;
  TFwupdClientUploadFlags = longint;

const
  FWUPD_CLIENT_UPLOAD_FLAG_NONE = 0;
  FWUPD_CLIENT_UPLOAD_FLAG_ALWAYS_MULTIPART = 1 shl 0;
  FWUPD_CLIENT_UPLOAD_FLAG_LAST = (1 shl 0) + 1;
  {$ENDIF read_enum}

  {$IFDEF read_function}
function fwupd_client_get_type: TGType; cdecl; external libfwupd;
function fwupd_client_new: PFwupdClient; cdecl; external libfwupd;
function fwupd_client_get_main_context(self: PFwupdClient): PGMainContext; cdecl; external libfwupd;
procedure fwupd_client_set_main_context(self: PFwupdClient; main_ctx: PGMainContext); cdecl; external libfwupd;
procedure fwupd_client_connect_async(self: PFwupdClient; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_connect_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
function fwupd_client_disconnect(self: PFwupdClient; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_quit_async(self: PFwupdClient; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_quit_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_get_devices_async(self: PFwupdClient; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_devices_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_client_get_plugins_async(self: PFwupdClient; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_plugins_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_client_get_history_async(self: PFwupdClient; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_history_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_client_get_releases_async(self: PFwupdClient; device_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_releases_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_client_get_downgrades_async(self: PFwupdClient; device_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_downgrades_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_client_get_upgrades_async(self: PFwupdClient; device_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_upgrades_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_client_get_details_bytes_async(self: PFwupdClient; bytes: PGBytes; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_details_bytes_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_client_verify_async(self: PFwupdClient; device_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_verify_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_verify_update_async(self: PFwupdClient; device_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_verify_update_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_unlock_async(self: PFwupdClient; device_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_unlock_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_modify_config_async(self: PFwupdClient; key: Pgchar; value: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_modify_config_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_activate_async(self: PFwupdClient; device_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_activate_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_clear_results_async(self: PFwupdClient; device_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_clear_results_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_get_results_async(self: PFwupdClient; device_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_results_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PFwupdDevice; cdecl; external libfwupd;
procedure fwupd_client_modify_bios_setting_async(self: PFwupdClient; settings: PGHashTable; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_modify_bios_setting_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_get_bios_settings_async(self: PFwupdClient; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_bios_settings_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_client_get_host_security_attrs_async(self: PFwupdClient; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_host_security_attrs_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_client_get_host_security_events_async(self: PFwupdClient; limit: Tguint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_host_security_events_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_client_get_device_by_id_async(self: PFwupdClient; device_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_device_by_id_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PFwupdDevice; cdecl; external libfwupd;
procedure fwupd_client_get_devices_by_guid_async(self: PFwupdClient; guid: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_devices_by_guid_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_client_install_async(self: PFwupdClient; device_id: Pgchar; filename: Pgchar; install_flags: TFwupdInstallFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_install_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_install_bytes_async(self: PFwupdClient; device_id: Pgchar; bytes: PGBytes; install_flags: TFwupdInstallFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_install_bytes_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_install_release_async(self: PFwupdClient; device: PFwupdDevice; release: PFwupdRelease; install_flags: TFwupdInstallFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd; deprecated;
procedure fwupd_client_install_release2_async(self: PFwupdClient; device: PFwupdDevice; release: PFwupdRelease; install_flags: TFwupdInstallFlags; download_flags: TFwupdClientDownloadFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_install_release_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_update_metadata_bytes_async(self: PFwupdClient; remote_id: Pgchar; metadata: PGBytes; signature: PGBytes; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_update_metadata_bytes_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_refresh_remote_async(self: PFwupdClient; remote: PFwupdRemote; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd; deprecated;
procedure fwupd_client_refresh_remote2_async(self: PFwupdClient; remote: PFwupdRemote; download_flags: TFwupdClientDownloadFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_refresh_remote_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_modify_remote_async(self: PFwupdClient; remote_id: Pgchar; key: Pgchar; value: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_modify_remote_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_modify_device_async(self: PFwupdClient; device_id: Pgchar; key: Pgchar; value: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_modify_device_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_get_report_metadata_async(self: PFwupdClient; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_report_metadata_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGHashTable; cdecl; external libfwupd;
procedure fwupd_client_inhibit_async(self: PFwupdClient; reason: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_inhibit_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Pgchar; cdecl; external libfwupd;
procedure fwupd_client_uninhibit_async(self: PFwupdClient; inhibit_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_uninhibit_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_emulation_load_async(self: PFwupdClient; data: PGBytes; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_emulation_load_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_emulation_save_async(self: PFwupdClient; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_emulation_save_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGBytes; cdecl; external libfwupd;
procedure fwupd_client_fix_host_security_attr_async(self: PFwupdClient; appstream_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_fix_host_security_attr_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_undo_host_security_attr_async(self: PFwupdClient; appstream_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_undo_host_security_attr_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
function fwupd_client_get_status(self: PFwupdClient): TFwupdStatus; cdecl; external libfwupd;
function fwupd_client_get_tainted(self: PFwupdClient): Tgboolean; cdecl; external libfwupd;
function fwupd_client_get_only_trusted(self: PFwupdClient): Tgboolean; cdecl; external libfwupd;
function fwupd_client_get_daemon_interactive(self: PFwupdClient): Tgboolean; cdecl; external libfwupd;
function fwupd_client_get_percentage(self: PFwupdClient): Tguint; cdecl; external libfwupd;
function fwupd_client_get_daemon_version(self: PFwupdClient): Pgchar; cdecl; external libfwupd;
procedure fwupd_client_set_daemon_version(self: PFwupdClient; daemon_version: Pgchar); cdecl; external libfwupd;
function fwupd_client_get_host_bkc(self: PFwupdClient): Pgchar; cdecl; external libfwupd;
function fwupd_client_get_host_vendor(self: PFwupdClient): Pgchar; cdecl; external libfwupd;
function fwupd_client_get_host_product(self: PFwupdClient): Pgchar; cdecl; external libfwupd;
function fwupd_client_get_host_machine_id(self: PFwupdClient): Pgchar; cdecl; external libfwupd;
function fwupd_client_get_host_security_id(self: PFwupdClient): Pgchar; cdecl; external libfwupd;
function fwupd_client_get_battery_level(self: PFwupdClient): Tguint32; cdecl; external libfwupd;
function fwupd_client_get_battery_threshold(self: PFwupdClient): Tguint32; cdecl; external libfwupd;
procedure fwupd_client_get_remotes_async(self: PFwupdClient; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_remotes_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_client_get_remote_by_id_async(self: PFwupdClient; remote_id: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_remote_by_id_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PFwupdRemote; cdecl; external libfwupd;
procedure fwupd_client_get_approved_firmware_async(self: PFwupdClient; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_approved_firmware_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_client_set_approved_firmware_async(self: PFwupdClient; checksums: PGPtrArray; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_set_approved_firmware_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_get_blocked_firmware_async(self: PFwupdClient; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_get_blocked_firmware_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_client_set_blocked_firmware_async(self: PFwupdClient; checksums: PGPtrArray; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_set_blocked_firmware_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_self_sign_async(self: PFwupdClient; value: Pgchar; flags: TFwupdSelfSignFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_self_sign_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Pgchar; cdecl; external libfwupd;
procedure fwupd_client_set_feature_flags_async(self: PFwupdClient; feature_flags: TFwupdFeatureFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_set_feature_flags_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libfwupd;
function fwupd_client_get_user_agent(self: PFwupdClient): Pgchar; cdecl; external libfwupd;
procedure fwupd_client_set_user_agent(self: PFwupdClient; user_agent: Pgchar); cdecl; external libfwupd;
procedure fwupd_client_set_user_agent_for_package(self: PFwupdClient; package_name: Pgchar; package_version: Pgchar); cdecl; external libfwupd;
procedure fwupd_client_download_bytes_async(self: PFwupdClient; url: Pgchar; flags: TFwupdClientDownloadFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_download_bytes_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGBytes; cdecl; external libfwupd;
procedure fwupd_client_download_set_retries(self: PFwupdClient; retries: Tguint); cdecl; external libfwupd;
procedure fwupd_client_upload_bytes_async(self: PFwupdClient; url: Pgchar; payload: Pgchar; signature: Pgchar; flags: TFwupdClientUploadFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_upload_bytes_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): PGBytes; cdecl; external libfwupd;
procedure fwupd_client_upload_report_async(self: PFwupdClient; url: Pgchar; payload: Pgchar; signature: Pgchar; flags: TFwupdClientUploadFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; callback_data: Tgpointer); cdecl; external libfwupd;
function fwupd_client_upload_report_finish(self: PFwupdClient; res: PGAsyncResult; error: PPGError): Pgchar; cdecl; external libfwupd;
function fwupd_client_ensure_networking(self: PFwupdClient; error: PPGError): Tgboolean; cdecl; external libfwupd;
procedure fwupd_client_add_hint(self: PFwupdClient; key: Pgchar; value: Pgchar); cdecl; external libfwupd;
function fwupd_client_build_report_devices(self: PFwupdClient; devices: PGPtrArray; metadata: PGHashTable; error: PPGError): Pgchar; cdecl; external libfwupd;

// === Konventiert am: 21-4-26 15:35:02 ===

function FWUPD_TYPE_CLIENT: TGType;
function FWUPD_CLIENT(obj: Pointer): PFwupdClient;
function FWUPD_IS_CLIENT(obj: Pointer): Tgboolean;
function FWUPD_CLIENT_CLASS(klass: Pointer): PFwupdClientClass;
function FWUPD_IS_CLIENT_CLASS(klass: Pointer): Tgboolean;
function FWUPD_CLIENT_GET_CLASS(obj: Pointer): PFwupdClientClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function FWUPD_TYPE_CLIENT: TGType;
begin
  Result := fwupd_client_get_type;
end;

function FWUPD_CLIENT(obj: Pointer): PFwupdClient;
begin
  Result := PFwupdClient(g_type_check_instance_cast(obj, FWUPD_TYPE_CLIENT));
end;

function FWUPD_IS_CLIENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, FWUPD_TYPE_CLIENT);
end;

function FWUPD_CLIENT_CLASS(klass: Pointer): PFwupdClientClass;
begin
  Result := PFwupdClientClass(g_type_check_class_cast(klass, FWUPD_TYPE_CLIENT));
end;

function FWUPD_IS_CLIENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, FWUPD_TYPE_CLIENT);
end;

function FWUPD_CLIENT_GET_CLASS(obj: Pointer): PFwupdClientClass;
begin
  Result := PFwupdClientClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
