unit fwupd_client_sync;

interface

uses
  fp_glib2, fp_fwupd;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2016 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include "fwupd-client.h"}

function fwupd_client_connect(self:PFwupdClient; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_quit(self:PFwupdClient; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_get_devices(self:PFwupdClient; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external libfwupd;
function fwupd_client_get_plugins(self:PFwupdClient; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external libfwupd;
function fwupd_client_get_history(self:PFwupdClient; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external libfwupd;
function fwupd_client_get_releases(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external libfwupd;
function fwupd_client_get_downgrades(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external libfwupd;
function fwupd_client_get_upgrades(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external libfwupd;
function fwupd_client_get_details(self:PFwupdClient; filename:Pgchar; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external libfwupd;
function fwupd_client_get_details_bytes(self:PFwupdClient; bytes:PGBytes; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external libfwupd;
function fwupd_client_verify(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_verify_update(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_unlock(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_inhibit(self:PFwupdClient; reason:Pgchar; cancellable:PGCancellable; error:PPGError):Pgchar;cdecl;external libfwupd;
function fwupd_client_uninhibit(self:PFwupdClient; inhibit_id:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_modify_config(self:PFwupdClient; key:Pgchar; value:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_activate(self:PFwupdClient; cancellable:PGCancellable; device_id:Pgchar; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_clear_results(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_get_results(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; error:PPGError):PFwupdDevice;cdecl;external libfwupd;
function fwupd_client_modify_bios_setting(self:PFwupdClient; settings:PGHashTable; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_get_bios_settings(self:PFwupdClient; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external libfwupd;
function fwupd_client_get_host_security_attrs(self:PFwupdClient; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external libfwupd;
function fwupd_client_get_host_security_events(self:PFwupdClient; limit:Tguint; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external libfwupd;
function fwupd_client_get_device_by_id(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; error:PPGError):PFwupdDevice;cdecl;external libfwupd;
function fwupd_client_get_devices_by_guid(self:PFwupdClient; guid:Pgchar; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external libfwupd;
function fwupd_client_install(self:PFwupdClient; device_id:Pgchar; filename:Pgchar; install_flags:TFwupdInstallFlags; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_install_bytes(self:PFwupdClient; device_id:Pgchar; bytes:PGBytes; install_flags:TFwupdInstallFlags; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external libfwupd;
{///G_DEPRECATED_FOR(fwupd_client_install_release2) }
function fwupd_client_install_release(self:PFwupdClient; device:PFwupdDevice; release:PFwupdRelease; install_flags:TFwupdInstallFlags; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_install_release2(self:PFwupdClient; device:PFwupdDevice; release:PFwupdRelease; install_flags:TFwupdInstallFlags; download_flags:TFwupdClientDownloadFlags; 
           cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_update_metadata(self:PFwupdClient; remote_id:Pgchar; metadata_fn:Pgchar; signature_fn:Pgchar; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_update_metadata_bytes(self:PFwupdClient; remote_id:Pgchar; metadata:PGBytes; signature:PGBytes; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external libfwupd;
{// G_DEPRECATED_FOR(fwupd_client_refresh_remote2) }
function fwupd_client_refresh_remote(self:PFwupdClient; remote:PFwupdRemote; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_refresh_remote2(self:PFwupdClient; remote:PFwupdRemote; download_flags:TFwupdClientDownloadFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_modify_remote(self:PFwupdClient; remote_id:Pgchar; key:Pgchar; value:Pgchar; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_modify_device(self:PFwupdClient; device_id:Pgchar; key:Pgchar; value:Pgchar; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_get_report_metadata(self:PFwupdClient; cancellable:PGCancellable; error:PPGError):PGHashTable;cdecl;external libfwupd;
function fwupd_client_get_remotes(self:PFwupdClient; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external libfwupd;
function fwupd_client_get_remote_by_id(self:PFwupdClient; remote_id:Pgchar; cancellable:PGCancellable; error:PPGError):PFwupdRemote;cdecl;external libfwupd;
function fwupd_client_get_approved_firmware(self:PFwupdClient; cancellable:PGCancellable; error:PPGError):^Pgchar;cdecl;external libfwupd;
function fwupd_client_set_approved_firmware(self:PFwupdClient; checksums:PPgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_get_blocked_firmware(self:PFwupdClient; cancellable:PGCancellable; error:PPGError):^Pgchar;cdecl;external libfwupd;
function fwupd_client_set_blocked_firmware(self:PFwupdClient; checksums:PPgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_self_sign(self:PFwupdClient; value:Pgchar; flags:TFwupdSelfSignFlags; cancellable:PGCancellable; error:PPGError):Pgchar;cdecl;external libfwupd;
function fwupd_client_set_feature_flags(self:PFwupdClient; feature_flags:TFwupdFeatureFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_download_bytes(self:PFwupdClient; url:Pgchar; flags:TFwupdClientDownloadFlags; cancellable:PGCancellable; error:PPGError):PGBytes;cdecl;external libfwupd;
function fwupd_client_download_file(self:PFwupdClient; url:Pgchar; file:PGFile; flags:TFwupdClientDownloadFlags; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_upload_bytes(self:PFwupdClient; url:Pgchar; payload:Pgchar; signature:Pgchar; flags:TFwupdClientUploadFlags; 
           cancellable:PGCancellable; error:PPGError):PGBytes;cdecl;external libfwupd;
function fwupd_client_upload_report(self:PFwupdClient; url:Pgchar; payload:Pgchar; signature:Pgchar; flags:TFwupdClientUploadFlags; 
           cancellable:PGCancellable; error:PPGError):Pgchar;cdecl;external libfwupd;
function fwupd_client_emulation_load(self:PFwupdClient; data:PGBytes; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_emulation_save(self:PFwupdClient; cancellable:PGCancellable; error:PPGError):PGBytes;cdecl;external libfwupd;
function fwupd_client_fix_host_security_attr(self:PFwupdClient; appstream_id:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;
function fwupd_client_undo_host_security_attr(self:PFwupdClient; appstream_id:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libfwupd;

// === Konventiert am: 21-4-26 15:35:11 ===


implementation



end.
