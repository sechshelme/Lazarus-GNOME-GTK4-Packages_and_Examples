
unit fwupd_client;
interface

{
  Automatically converted by H2Pas 1.0.0 from fwupd_client.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fwupd_client.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PFwupdClient  = ^FwupdClient;
PFwupdClientClass  = ^FwupdClientClass;
PFwupdClientDownloadFlags  = ^FwupdClientDownloadFlags;
PFwupdClientUploadFlags  = ^FwupdClientUploadFlags;
PFwupdDevice  = ^FwupdDevice;
PFwupdRelease  = ^FwupdRelease;
PFwupdRemote  = ^FwupdRemote;
PFwupdRequest  = ^FwupdRequest;
PGAsyncResult  = ^GAsyncResult;
PGBytes  = ^GBytes;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
PGMainContext  = ^GMainContext;
PGPtrArray  = ^GPtrArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2016 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <gio/gio.h>}
{$include "fwupd-build.h"}
{$include "fwupd-device.h"}
{$include "fwupd-enums.h"}
{$include "fwupd-plugin.h"}
{$include "fwupd-remote.h"}
{$include "fwupd-request.h"}

{ was #define dname def_expr }
function FWUPD_TYPE_CLIENT : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE(FwupdClient, fwupd_client, FWUPD, CLIENT, GObject) }
{< private > }
type
  PFwupdClientClass = ^TFwupdClientClass;
  TFwupdClientClass = record
      parent_class : TGObjectClass;
      changed : procedure (client:PFwupdClient);cdecl;
      status_changed : procedure (client:PFwupdClient; status:TFwupdStatus);cdecl;
      device_added : procedure (client:PFwupdClient; result:PFwupdDevice);cdecl;
      device_removed : procedure (client:PFwupdClient; result:PFwupdDevice);cdecl;
      device_changed : procedure (client:PFwupdClient; result:PFwupdDevice);cdecl;
      device_request : procedure (client:PFwupdClient; request:PFwupdRequest);cdecl;
      _fwupd_reserved1 : procedure ;cdecl;
      _fwupd_reserved2 : procedure ;cdecl;
      _fwupd_reserved3 : procedure ;cdecl;
      _fwupd_reserved4 : procedure ;cdecl;
      _fwupd_reserved5 : procedure ;cdecl;
      _fwupd_reserved6 : procedure ;cdecl;
    end;

{*
 * FwupdClientDownloadFlags:
 * @FWUPD_CLIENT_DOWNLOAD_FLAG_NONE:		No flags set
 * @FWUPD_CLIENT_DOWNLOAD_FLAG_ONLY_P2P:	Only use peer-to-peer when downloading URIs
 *
 * The options to use for downloading.
 * }
{ Since: 1.4.5  }
{ Since: 1.9.4  }
{< private > }

  PFwupdClientDownloadFlags = ^TFwupdClientDownloadFlags;
  TFwupdClientDownloadFlags =  Longint;
  Const
    FWUPD_CLIENT_DOWNLOAD_FLAG_NONE = 0;
    FWUPD_CLIENT_DOWNLOAD_FLAG_ONLY_P2P = 1 shl 0;
    FWUPD_CLIENT_DOWNLOAD_FLAG_LAST = (1 shl 0)+1;
;
{*
 * FWUPD_CLIENT_DOWNLOAD_FLAG_ONLY_IPFS:
 *
 * For API compatibility:
 *
 * Since: 1.5.6
 * Deprecated: 1.9.4
 * }
  FWUPD_CLIENT_DOWNLOAD_FLAG_ONLY_IPFS = FWUPD_CLIENT_DOWNLOAD_FLAG_ONLY_P2P;  
{*
 * FwupdClientUploadFlags:
 * @FWUPD_CLIENT_UPLOAD_FLAG_NONE:		No flags set
 * @FWUPD_CLIENT_UPLOAD_FLAG_ALWAYS_MULTIPART:	Always use multipart/form-data
 *
 * The options to use for uploading.
 * }
{ Since: 1.4.5  }
{ Since: 1.4.5  }
{< private > }
type
  PFwupdClientUploadFlags = ^TFwupdClientUploadFlags;
  TFwupdClientUploadFlags =  Longint;
  Const
    FWUPD_CLIENT_UPLOAD_FLAG_NONE = 0;
    FWUPD_CLIENT_UPLOAD_FLAG_ALWAYS_MULTIPART = 1 shl 0;
    FWUPD_CLIENT_UPLOAD_FLAG_LAST = (1 shl 0)+1;
;

function fwupd_client_new:PFwupdClient;cdecl;external;
function fwupd_client_get_main_context(self:PFwupdClient):PGMainContext;cdecl;external;
procedure fwupd_client_set_main_context(self:PFwupdClient; main_ctx:PGMainContext);cdecl;external;
procedure fwupd_client_connect_async(self:PFwupdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_connect_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function fwupd_client_disconnect(self:PFwupdClient; error:PPGError):Tgboolean;cdecl;external;
procedure fwupd_client_quit_async(self:PFwupdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_quit_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure fwupd_client_get_devices_async(self:PFwupdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_devices_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
procedure fwupd_client_get_plugins_async(self:PFwupdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_plugins_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
procedure fwupd_client_get_history_async(self:PFwupdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_history_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_get_releases_async(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_releases_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_get_downgrades_async(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_downgrades_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_get_upgrades_async(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_upgrades_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
procedure fwupd_client_get_details_bytes_async(self:PFwupdClient; bytes:PGBytes; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_details_bytes_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_verify_async(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_verify_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_verify_update_async(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_verify_update_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_unlock_async(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_unlock_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure fwupd_client_modify_config_async(self:PFwupdClient; key:Pgchar; value:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            callback_data:Tgpointer);cdecl;external;
function fwupd_client_modify_config_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_activate_async(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_activate_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_clear_results_async(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_clear_results_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_get_results_async(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_results_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PFwupdDevice;cdecl;external;
procedure fwupd_client_modify_bios_setting_async(self:PFwupdClient; settings:PGHashTable; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_modify_bios_setting_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure fwupd_client_get_bios_settings_async(self:PFwupdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_bios_settings_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
procedure fwupd_client_get_host_security_attrs_async(self:PFwupdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_host_security_attrs_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
procedure fwupd_client_get_host_security_events_async(self:PFwupdClient; limit:Tguint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_host_security_events_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_get_device_by_id_async(self:PFwupdClient; device_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_device_by_id_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PFwupdDevice;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_get_devices_by_guid_async(self:PFwupdClient; guid:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_devices_by_guid_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure fwupd_client_install_async(self:PFwupdClient; device_id:Pgchar; filename:Pgchar; install_flags:TFwupdInstallFlags; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_install_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_install_bytes_async(self:PFwupdClient; device_id:Pgchar; bytes:PGBytes; install_flags:TFwupdInstallFlags; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_install_bytes_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{xxxxxxxxG_DEPRECATED_FOR(fwupd_client_install_release2_async) }
procedure fwupd_client_install_release_async(self:PFwupdClient; device:PFwupdDevice; release:PFwupdRelease; install_flags:TFwupdInstallFlags; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
procedure fwupd_client_install_release2_async(self:PFwupdClient; device:PFwupdDevice; release:PFwupdRelease; install_flags:TFwupdInstallFlags; download_flags:TFwupdClientDownloadFlags; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_install_release_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_update_metadata_bytes_async(self:PFwupdClient; remote_id:Pgchar; metadata:PGBytes; signature:PGBytes; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_update_metadata_bytes_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{///G_DEPRECATED_FOR(fwupd_client_refresh_remote2_async) }
procedure fwupd_client_refresh_remote_async(self:PFwupdClient; remote:PFwupdRemote; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
procedure fwupd_client_refresh_remote2_async(self:PFwupdClient; remote:PFwupdRemote; download_flags:TFwupdClientDownloadFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            callback_data:Tgpointer);cdecl;external;
function fwupd_client_refresh_remote_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure fwupd_client_modify_remote_async(self:PFwupdClient; remote_id:Pgchar; key:Pgchar; value:Pgchar; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_modify_remote_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure fwupd_client_modify_device_async(self:PFwupdClient; device_id:Pgchar; key:Pgchar; value:Pgchar; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_modify_device_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure fwupd_client_get_report_metadata_async(self:PFwupdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_report_metadata_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGHashTable;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_inhibit_async(self:PFwupdClient; reason:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_inhibit_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_uninhibit_async(self:PFwupdClient; inhibit_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_uninhibit_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure fwupd_client_emulation_load_async(self:PFwupdClient; data:PGBytes; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_emulation_load_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure fwupd_client_emulation_save_async(self:PFwupdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_emulation_save_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGBytes;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_fix_host_security_attr_async(self:PFwupdClient; appstream_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_fix_host_security_attr_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_undo_host_security_attr_async(self:PFwupdClient; appstream_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_undo_host_security_attr_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function fwupd_client_get_status(self:PFwupdClient):TFwupdStatus;cdecl;external;
function fwupd_client_get_tainted(self:PFwupdClient):Tgboolean;cdecl;external;
function fwupd_client_get_only_trusted(self:PFwupdClient):Tgboolean;cdecl;external;
function fwupd_client_get_daemon_interactive(self:PFwupdClient):Tgboolean;cdecl;external;
function fwupd_client_get_percentage(self:PFwupdClient):Tguint;cdecl;external;
(* Const before type ignored *)
function fwupd_client_get_daemon_version(self:PFwupdClient):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_set_daemon_version(self:PFwupdClient; daemon_version:Pgchar);cdecl;external;
(* Const before type ignored *)
function fwupd_client_get_host_bkc(self:PFwupdClient):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_client_get_host_vendor(self:PFwupdClient):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_client_get_host_product(self:PFwupdClient):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_client_get_host_machine_id(self:PFwupdClient):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_client_get_host_security_id(self:PFwupdClient):Pgchar;cdecl;external;
function fwupd_client_get_battery_level(self:PFwupdClient):Tguint32;cdecl;external;
function fwupd_client_get_battery_threshold(self:PFwupdClient):Tguint32;cdecl;external;
procedure fwupd_client_get_remotes_async(self:PFwupdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_remotes_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_get_remote_by_id_async(self:PFwupdClient; remote_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_remote_by_id_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PFwupdRemote;cdecl;external;
procedure fwupd_client_get_approved_firmware_async(self:PFwupdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_approved_firmware_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
procedure fwupd_client_set_approved_firmware_async(self:PFwupdClient; checksums:PGPtrArray; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_set_approved_firmware_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure fwupd_client_get_blocked_firmware_async(self:PFwupdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_get_blocked_firmware_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
procedure fwupd_client_set_blocked_firmware_async(self:PFwupdClient; checksums:PGPtrArray; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_set_blocked_firmware_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_self_sign_async(self:PFwupdClient; value:Pgchar; flags:TFwupdSelfSignFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            callback_data:Tgpointer);cdecl;external;
function fwupd_client_self_sign_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Pgchar;cdecl;external;
procedure fwupd_client_set_feature_flags_async(self:PFwupdClient; feature_flags:TFwupdFeatureFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_set_feature_flags_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function fwupd_client_get_user_agent(self:PFwupdClient):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_set_user_agent(self:PFwupdClient; user_agent:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure fwupd_client_set_user_agent_for_package(self:PFwupdClient; package_name:Pgchar; package_version:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure fwupd_client_download_bytes_async(self:PFwupdClient; url:Pgchar; flags:TFwupdClientDownloadFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            callback_data:Tgpointer);cdecl;external;
function fwupd_client_download_bytes_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGBytes;cdecl;external;
procedure fwupd_client_download_set_retries(self:PFwupdClient; retries:Tguint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure fwupd_client_upload_bytes_async(self:PFwupdClient; url:Pgchar; payload:Pgchar; signature:Pgchar; flags:TFwupdClientUploadFlags; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_upload_bytes_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):PGBytes;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure fwupd_client_upload_report_async(self:PFwupdClient; url:Pgchar; payload:Pgchar; signature:Pgchar; flags:TFwupdClientUploadFlags; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer);cdecl;external;
function fwupd_client_upload_report_finish(self:PFwupdClient; res:PGAsyncResult; error:PPGError):Pgchar;cdecl;external;
function fwupd_client_ensure_networking(self:PFwupdClient; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure fwupd_client_add_hint(self:PFwupdClient; key:Pgchar; value:Pgchar);cdecl;external;
function fwupd_client_build_report_devices(self:PFwupdClient; devices:PGPtrArray; metadata:PGHashTable; error:PPGError):Pgchar;cdecl;external;

implementation

{ was #define dname def_expr }
function FWUPD_TYPE_CLIENT : longint; { return type might be wrong }
  begin
    FWUPD_TYPE_CLIENT:=fwupd_client_get_type;
  end;


end.
