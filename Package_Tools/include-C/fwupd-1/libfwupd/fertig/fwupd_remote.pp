
unit fwupd_remote;
interface

{
  Automatically converted by H2Pas 1.0.0 from fwupd_remote.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fwupd_remote.h
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
PFwupdRemote  = ^FwupdRemote;
PFwupdRemoteClass  = ^FwupdRemoteClass;
PFwupdRemoteFlags  = ^FwupdRemoteFlags;
PFwupdRemoteKind  = ^FwupdRemoteKind;
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGError  = ^GError;
PGPtrArray  = ^GPtrArray;
PGVariant  = ^GVariant;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2017 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include "fwupd-enums.h"}

{ was #define dname def_expr }
function FWUPD_TYPE_REMOTE : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE(FwupdRemote, fwupd_remote, FWUPD, REMOTE, GObject) }
{< private > }
type
  PFwupdRemoteClass = ^TFwupdRemoteClass;
  TFwupdRemoteClass = record
      parent_class : TGObjectClass;
      _fwupd_reserved1 : procedure ;cdecl;
      _fwupd_reserved2 : procedure ;cdecl;
      _fwupd_reserved3 : procedure ;cdecl;
      _fwupd_reserved4 : procedure ;cdecl;
      _fwupd_reserved5 : procedure ;cdecl;
      _fwupd_reserved6 : procedure ;cdecl;
      _fwupd_reserved7 : procedure ;cdecl;
    end;

{*
 * FwupdRemoteKind:
 * @FWUPD_REMOTE_KIND_UNKNOWN:			Unknown kind
 * @FWUPD_REMOTE_KIND_DOWNLOAD:			Requires files to be downloaded
 * @FWUPD_REMOTE_KIND_LOCAL:			Reads files from the local machine
 * @FWUPD_REMOTE_KIND_DIRECTORY:		Reads directory from the local machine
 *
 * The kind of remote.
 * }
{ Since: 1.2.4  }
{< private > }

  PFwupdRemoteKind = ^TFwupdRemoteKind;
  TFwupdRemoteKind =  Longint;
  Const
    FWUPD_REMOTE_KIND_UNKNOWN = 0;
    FWUPD_REMOTE_KIND_DOWNLOAD = 1;
    FWUPD_REMOTE_KIND_LOCAL = 2;
    FWUPD_REMOTE_KIND_DIRECTORY = 3;
    FWUPD_REMOTE_KIND_LAST = 4;
;
{*
 * FwupdRemoteFlags:
 * @FWUPD_REMOTE_FLAG_NONE:				No flags set
 * @FWUPD_REMOTE_FLAG_ENABLED:				Is enabled
 * @FWUPD_REMOTE_FLAG_APPROVAL_REQUIRED:		Requires approval for each firmware
 * @FWUPD_REMOTE_FLAG_AUTOMATIC_REPORTS:		Send firmware reports automatically
 * @FWUPD_REMOTE_FLAG_AUTOMATIC_SECURITY_REPORTS:	Send security reports automatically
 * @FWUPD_REMOTE_FLAG_ALLOW_P2P_METADATA:		Use peer-to-peer locations for metadata
 * @FWUPD_REMOTE_FLAG_ALLOW_P2P_FIRMWARE:		Use peer-to-peer locations for firmware
 *
 * The flags available for the remote.
 * }
{ Since: 1.9.4  }
{ Since: 1.9.4  }
{ Since: 1.9.4  }
{ Since: 1.9.4  }
{ Since: 1.9.4  }
{ Since: 1.9.5  }
{ Since: 1.9.5  }
type
  PFwupdRemoteFlags = ^TFwupdRemoteFlags;
  TFwupdRemoteFlags =  Longint;
  Const
    FWUPD_REMOTE_FLAG_NONE = 0;
    FWUPD_REMOTE_FLAG_ENABLED = 1 shl 0;
    FWUPD_REMOTE_FLAG_APPROVAL_REQUIRED = 1 shl 1;
    FWUPD_REMOTE_FLAG_AUTOMATIC_REPORTS = 1 shl 2;
    FWUPD_REMOTE_FLAG_AUTOMATIC_SECURITY_REPORTS = 1 shl 3;
    FWUPD_REMOTE_FLAG_ALLOW_P2P_METADATA = 1 shl 4;
    FWUPD_REMOTE_FLAG_ALLOW_P2P_FIRMWARE = 1 shl 5;
;
(* Const before type ignored *)

function fwupd_remote_kind_from_string(kind:Pgchar):TFwupdRemoteKind;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_kind_to_string(kind:TFwupdRemoteKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_flag_to_string(flag:TFwupdRemoteFlags):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_flag_from_string(flag:Pgchar):TFwupdRemoteFlags;cdecl;external;
function fwupd_remote_new:PFwupdRemote;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_id(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_title(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_agreement(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_remotes_dir(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_checksum(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_checksum_metadata(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_username(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_password(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_filename_cache(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_filename_cache_sig(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_filename_source(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_firmware_base_uri(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_report_uri(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_security_report_uri(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_metadata_uri(self:PFwupdRemote):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_get_metadata_uri_sig(self:PFwupdRemote):Pgchar;cdecl;external;
{/G_DEPRECATED_FOR(fwupd_remote_has_flag) }
function fwupd_remote_get_enabled(self:PFwupdRemote):Tgboolean;cdecl;external;
{/G_DEPRECATED_FOR(fwupd_remote_has_flag) }
function fwupd_remote_get_approval_required(self:PFwupdRemote):Tgboolean;cdecl;external;
{//G_DEPRECATED_FOR(fwupd_remote_has_flag) }
function fwupd_remote_get_automatic_reports(self:PFwupdRemote):Tgboolean;cdecl;external;
{//G_DEPRECATED_FOR(fwupd_remote_has_flag) }
function fwupd_remote_get_automatic_security_reports(self:PFwupdRemote):Tgboolean;cdecl;external;
function fwupd_remote_get_refresh_interval(self:PFwupdRemote):Tguint64;cdecl;external;
function fwupd_remote_get_flags(self:PFwupdRemote):TFwupdRemoteFlags;cdecl;external;
procedure fwupd_remote_set_flags(self:PFwupdRemote; flags:TFwupdRemoteFlags);cdecl;external;
procedure fwupd_remote_add_flag(self:PFwupdRemote; flag:TFwupdRemoteFlags);cdecl;external;
procedure fwupd_remote_remove_flag(self:PFwupdRemote; flag:TFwupdRemoteFlags);cdecl;external;
function fwupd_remote_has_flag(self:PFwupdRemote; flag:TFwupdRemoteFlags):Tgboolean;cdecl;external;
function fwupd_remote_needs_refresh(self:PFwupdRemote):Tgboolean;cdecl;external;
function fwupd_remote_get_priority(self:PFwupdRemote):Tgint;cdecl;external;
function fwupd_remote_get_age(self:PFwupdRemote):Tguint64;cdecl;external;
function fwupd_remote_get_kind(self:PFwupdRemote):TFwupdRemoteKind;cdecl;external;
function fwupd_remote_get_keyring_kind(self:PFwupdRemote):TFwupdKeyringKind;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_build_firmware_uri(self:PFwupdRemote; url:Pgchar; error:PPGError):Pgchar;cdecl;external;
function fwupd_remote_build_report_uri(self:PFwupdRemote; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_remote_load_signature(self:PFwupdRemote; filename:Pgchar; error:PPGError):Tgboolean;cdecl;external;
function fwupd_remote_load_signature_bytes(self:PFwupdRemote; bytes:PGBytes; error:PPGError):Tgboolean;cdecl;external;
function fwupd_remote_from_variant(value:PGVariant):PFwupdRemote;cdecl;external;
function fwupd_remote_array_from_variant(value:PGVariant):PGPtrArray;cdecl;external;

implementation

{ was #define dname def_expr }
function FWUPD_TYPE_REMOTE : longint; { return type might be wrong }
  begin
    FWUPD_TYPE_REMOTE:=fwupd_remote_get_type;
  end;


end.
