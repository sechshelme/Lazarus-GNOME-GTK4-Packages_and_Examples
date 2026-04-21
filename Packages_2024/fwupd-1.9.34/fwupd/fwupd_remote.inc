
  {$IFDEF read_struct}
type
  TFwupdRemote = record
    parent_instance: TGObject;
  end;
  PFwupdRemote = ^TFwupdRemote;

  TFwupdRemoteClass = record
    parent_class: TGObjectClass;
    _fwupd_reserved1: procedure; cdecl;
    _fwupd_reserved2: procedure; cdecl;
    _fwupd_reserved3: procedure; cdecl;
    _fwupd_reserved4: procedure; cdecl;
    _fwupd_reserved5: procedure; cdecl;
    _fwupd_reserved6: procedure; cdecl;
    _fwupd_reserved7: procedure; cdecl;
  end;
  PFwupdRemoteClass = ^TFwupdRemoteClass;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  PFwupdRemoteKind = ^TFwupdRemoteKind;
  TFwupdRemoteKind = longint;

const
  FWUPD_REMOTE_KIND_UNKNOWN = 0;
  FWUPD_REMOTE_KIND_DOWNLOAD = 1;
  FWUPD_REMOTE_KIND_LOCAL = 2;
  FWUPD_REMOTE_KIND_DIRECTORY = 3;
  FWUPD_REMOTE_KIND_LAST = 4;

type
  PFwupdRemoteFlags = ^TFwupdRemoteFlags;
  TFwupdRemoteFlags = longint;

const
  FWUPD_REMOTE_FLAG_NONE = 0;
  FWUPD_REMOTE_FLAG_ENABLED = 1 shl 0;
  FWUPD_REMOTE_FLAG_APPROVAL_REQUIRED = 1 shl 1;
  FWUPD_REMOTE_FLAG_AUTOMATIC_REPORTS = 1 shl 2;
  FWUPD_REMOTE_FLAG_AUTOMATIC_SECURITY_REPORTS = 1 shl 3;
  FWUPD_REMOTE_FLAG_ALLOW_P2P_METADATA = 1 shl 4;
  FWUPD_REMOTE_FLAG_ALLOW_P2P_FIRMWARE = 1 shl 5;
  {$ENDIF read_enum}

{$IFDEF read_function}
function fwupd_remote_get_type: TGType; cdecl; external libfwupd;
function fwupd_remote_kind_from_string(kind: Pgchar): TFwupdRemoteKind; cdecl; external libfwupd;
function fwupd_remote_kind_to_string(kind: TFwupdRemoteKind): Pgchar; cdecl; external libfwupd;
function fwupd_remote_flag_to_string(flag: TFwupdRemoteFlags): Pgchar; cdecl; external libfwupd;
function fwupd_remote_flag_from_string(flag: Pgchar): TFwupdRemoteFlags; cdecl; external libfwupd;
function fwupd_remote_new: PFwupdRemote; cdecl; external libfwupd;
function fwupd_remote_get_id(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_title(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_agreement(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_remotes_dir(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_checksum(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_checksum_metadata(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_username(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_password(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_filename_cache(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_filename_cache_sig(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_filename_source(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_firmware_base_uri(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_report_uri(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_security_report_uri(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_metadata_uri(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_metadata_uri_sig(self: PFwupdRemote): Pgchar; cdecl; external libfwupd;
function fwupd_remote_get_enabled(self: PFwupdRemote): Tgboolean; cdecl; external libfwupd; deprecated;
function fwupd_remote_get_approval_required(self: PFwupdRemote): Tgboolean; cdecl; external libfwupd; deprecated;
function fwupd_remote_get_automatic_reports(self: PFwupdRemote): Tgboolean; cdecl; external libfwupd; deprecated;
function fwupd_remote_get_automatic_security_reports(self: PFwupdRemote): Tgboolean; cdecl; external libfwupd; deprecated;
function fwupd_remote_get_refresh_interval(self: PFwupdRemote): Tguint64; cdecl; external libfwupd;
function fwupd_remote_get_flags(self: PFwupdRemote): TFwupdRemoteFlags; cdecl; external libfwupd;
procedure fwupd_remote_set_flags(self: PFwupdRemote; flags: TFwupdRemoteFlags); cdecl; external libfwupd;
procedure fwupd_remote_add_flag(self: PFwupdRemote; flag: TFwupdRemoteFlags); cdecl; external libfwupd;
procedure fwupd_remote_remove_flag(self: PFwupdRemote; flag: TFwupdRemoteFlags); cdecl; external libfwupd;
function fwupd_remote_has_flag(self: PFwupdRemote; flag: TFwupdRemoteFlags): Tgboolean; cdecl; external libfwupd;
function fwupd_remote_needs_refresh(self: PFwupdRemote): Tgboolean; cdecl; external libfwupd;
function fwupd_remote_get_priority(self: PFwupdRemote): Tgint; cdecl; external libfwupd;
function fwupd_remote_get_age(self: PFwupdRemote): Tguint64; cdecl; external libfwupd;
function fwupd_remote_get_kind(self: PFwupdRemote): TFwupdRemoteKind; cdecl; external libfwupd;
function fwupd_remote_get_keyring_kind(self: PFwupdRemote): TFwupdKeyringKind; cdecl; external libfwupd;
function fwupd_remote_build_firmware_uri(self: PFwupdRemote; url: Pgchar; error: PPGError): Pgchar; cdecl; external libfwupd;
function fwupd_remote_build_report_uri(self: PFwupdRemote; error: PPGError): Pgchar; cdecl; external libfwupd;
function fwupd_remote_load_signature(self: PFwupdRemote; filename: Pgchar; error: PPGError): Tgboolean; cdecl; external libfwupd;
function fwupd_remote_load_signature_bytes(self: PFwupdRemote; bytes: PGBytes; error: PPGError): Tgboolean; cdecl; external libfwupd;
function fwupd_remote_from_variant(value: PGVariant): PFwupdRemote; cdecl; external libfwupd;
function fwupd_remote_array_from_variant(value: PGVariant): PGPtrArray; cdecl; external libfwupd;

// === Konventiert am: 21-4-26 15:36:14 ===

function FWUPD_TYPE_REMOTE: TGType;
function FWUPD_REMOTE(obj: Pointer): PFwupdRemote;
function FWUPD_IS_REMOTE(obj: Pointer): Tgboolean;
function FWUPD_REMOTE_CLASS(klass: Pointer): PFwupdRemoteClass;
function FWUPD_IS_REMOTE_CLASS(klass: Pointer): Tgboolean;
function FWUPD_REMOTE_GET_CLASS(obj: Pointer): PFwupdRemoteClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function FWUPD_TYPE_REMOTE: TGType;
begin
  Result := fwupd_remote_get_type;
end;

function FWUPD_REMOTE(obj: Pointer): PFwupdRemote;
begin
  Result := PFwupdRemote(g_type_check_instance_cast(obj, FWUPD_TYPE_REMOTE));
end;

function FWUPD_IS_REMOTE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, FWUPD_TYPE_REMOTE);
end;

function FWUPD_REMOTE_CLASS(klass: Pointer): PFwupdRemoteClass;
begin
  Result := PFwupdRemoteClass(g_type_check_class_cast(klass, FWUPD_TYPE_REMOTE));
end;

function FWUPD_IS_REMOTE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, FWUPD_TYPE_REMOTE);
end;

function FWUPD_REMOTE_GET_CLASS(obj: Pointer): PFwupdRemoteClass;
begin
  Result := PFwupdRemoteClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
