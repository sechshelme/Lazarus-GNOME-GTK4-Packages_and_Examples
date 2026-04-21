unit fwupd_common;

interface

uses
  fp_glib2, fp_fwupd;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2015 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include "fwupd-build.h"}
{*
 * FWUPD_DBUS_PATH:
 *
 * The dbus path
 * }

const
  FWUPD_DBUS_PATH = '/';  
{*
 * FWUPD_DBUS_SERVICE:
 *
 * The dbus service
 * }
  FWUPD_DBUS_SERVICE = 'org.freedesktop.fwupd';  
{*
 * FWUPD_DBUS_INTERFACE:
 *
 * The dbus interface
 * }
  FWUPD_DBUS_INTERFACE = 'org.freedesktop.fwupd';  
{*
 * FWUPD_DBUS_P2P_SOCKET_ADDRESS:
 *
 * The D-Bus socket address when using point-to-point connections.
 *
 * NOTE: This is no longer used as the value is set at compile time.
 * }
  FWUPD_DBUS_P2P_SOCKET_ADDRESS = 'tcp:host=localhost,port=1341';  
{*
 * FWUPD_DEVICE_ID_ANY:
 *
 * Wildcard used for matching all device ids in fwupd
 * }
  FWUPD_DEVICE_ID_ANY = '*';  
{*
 * FwupdGuidFlags:
 * @FWUPD_GUID_FLAG_NONE:			No trust
 * @FWUPD_GUID_FLAG_NAMESPACE_MICROSOFT:	Use the Microsoft-compatible namespace
 * @FWUPD_GUID_FLAG_MIXED_ENDIAN:		Use EFI mixed endian representation
 *
 * The flags to show how the data should be converted.
 * }
{ Since: 1.2.5  }
{ Since: 1.2.5  }
{ Since: 1.2.5  }
{< private > }
type
  PFwupdGuidFlags = ^TFwupdGuidFlags;
  TFwupdGuidFlags =  Longint;
  Const
    FWUPD_GUID_FLAG_NONE = 0;
    FWUPD_GUID_FLAG_NAMESPACE_MICROSOFT = 1 shl 0;
    FWUPD_GUID_FLAG_MIXED_ENDIAN = 1 shl 1;
    FWUPD_GUID_FLAG_LAST = (1 shl 1)+1;
;
{ GObject Introspection does not understand typedefs with sizes  }
{$ifdef __GI_SCANNER__}
type
  Pfwupd_guid_t = ^Tfwupd_guid_t;
  Tfwupd_guid_t = Pguint8;
{$else}
type
  Pfwupd_guid_t = ^Tfwupd_guid_t;
  Tfwupd_guid_t = array[0..15] of Tguint8;
{$endif}

function fwupd_checksum_get_best(checksums:PGPtrArray):Pgchar;cdecl;external libfwupd;
function fwupd_checksum_get_by_kind(checksums:PGPtrArray; kind:TGChecksumType):Pgchar;cdecl;external libfwupd;
function fwupd_checksum_guess_kind(checksum:Pgchar):TGChecksumType;cdecl;external libfwupd;
function fwupd_checksum_type_to_string_display(checksum_type:TGChecksumType):Pgchar;cdecl;external libfwupd;
function fwupd_checksum_format_for_display(checksum:Pgchar):Pgchar;cdecl;external libfwupd;
{// G_DEPRECATED_FOR(fwupd_client_set_user_agent_for_package) }
function fwupd_build_user_agent(package_name:Pgchar; package_version:Pgchar):Pgchar;cdecl;external libfwupd;
function fwupd_build_machine_id(salt:Pgchar; error:PPGError):Pgchar;cdecl;external libfwupd;
function fwupd_get_os_release(error:PPGError):PGHashTable;cdecl;external libfwupd;
function fwupd_get_os_release_full(filename:Pgchar; error:PPGError):PGHashTable;cdecl;external libfwupd;
function fwupd_build_history_report_json(devices:PGPtrArray; error:PPGError):Pgchar;cdecl;external libfwupd;
function fwupd_device_id_is_valid(device_id:Pgchar):Tgboolean;cdecl;external libfwupd;
{$ifndef __GI_SCANNER__}

function fwupd_guid_to_string(guid:Pfwupd_guid_t; flags:TFwupdGuidFlags):Pgchar;cdecl;external libfwupd;
function fwupd_guid_from_string(guidstr:Pgchar; guid:Pfwupd_guid_t; flags:TFwupdGuidFlags; error:PPGError):Tgboolean;cdecl;external libfwupd;
{$else}

function fwupd_guid_to_string(guid:array[0..15] of Tguint8; flags:TFwupdGuidFlags):Pgchar;cdecl;external libfwupd;
function fwupd_guid_from_string(guidstr:Pgchar; guid:array[0..15] of Tguint8; flags:TFwupdGuidFlags; error:PPGError):Tgboolean;cdecl;external libfwupd;
{$endif}

function fwupd_guid_is_valid(guid:Pgchar):Tgboolean;cdecl;external libfwupd;
function fwupd_guid_hash_string(str:Pgchar):Pgchar;cdecl;external libfwupd;
function fwupd_guid_hash_data(data:Pguint8; datasz:Tgsize; flags:TFwupdGuidFlags):Pgchar;cdecl;external libfwupd;

// === Konventiert am: 21-4-26 15:35:15 ===


implementation



end.
