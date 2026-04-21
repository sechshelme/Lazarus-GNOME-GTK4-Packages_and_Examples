unit fwupd_security_attr;

interface

uses
  fp_glib2, fp_fwupd;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TFwupdSecurityAttr = record
    parent_instance: TGObject;
  end;
  PFwupdSecurityAttr = ^TFwupdSecurityAttr;

  TFwupdSecurityAttrClass = record
    parent_class: TGObjectClass;
    _fwupd_reserved1: procedure; cdecl;
    _fwupd_reserved2: procedure; cdecl;
    _fwupd_reserved3: procedure; cdecl;
    _fwupd_reserved4: procedure; cdecl;
    _fwupd_reserved5: procedure; cdecl;
    _fwupd_reserved6: procedure; cdecl;
    _fwupd_reserved7: procedure; cdecl;
  end;
  PFwupdSecurityAttrClass = ^TFwupdSecurityAttrClass;

type
  PFwupdSecurityAttrFlags = ^TFwupdSecurityAttrFlags;
  TFwupdSecurityAttrFlags = longint;

const
  FWUPD_SECURITY_ATTR_FLAG_NONE = 0;
  FWUPD_SECURITY_ATTR_FLAG_SUCCESS = 1 shl 0;
  FWUPD_SECURITY_ATTR_FLAG_OBSOLETED = 1 shl 1;
  FWUPD_SECURITY_ATTR_FLAG_MISSING_DATA = 1 shl 2;
  FWUPD_SECURITY_ATTR_FLAG_RUNTIME_UPDATES = 1 shl 8;
  FWUPD_SECURITY_ATTR_FLAG_RUNTIME_ATTESTATION = 1 shl 9;
  FWUPD_SECURITY_ATTR_FLAG_RUNTIME_ISSUE = 1 shl 10;
  FWUPD_SECURITY_ATTR_FLAG_ACTION_CONTACT_OEM = 1 shl 11;
  FWUPD_SECURITY_ATTR_FLAG_ACTION_CONFIG_FW = 1 shl 12;
  FWUPD_SECURITY_ATTR_FLAG_ACTION_CONFIG_OS = 1 shl 13;
  FWUPD_SECURITY_ATTR_FLAG_CAN_FIX = 1 shl 14;
  FWUPD_SECURITY_ATTR_FLAG_CAN_UNDO = 1 shl 15;

type
  PFwupdSecurityAttrLevel = ^TFwupdSecurityAttrLevel;
  TFwupdSecurityAttrLevel = longint;

const
  FWUPD_SECURITY_ATTR_LEVEL_NONE = 0;
  FWUPD_SECURITY_ATTR_LEVEL_CRITICAL = 1;
  FWUPD_SECURITY_ATTR_LEVEL_IMPORTANT = 2;
  FWUPD_SECURITY_ATTR_LEVEL_THEORETICAL = 3;
  FWUPD_SECURITY_ATTR_LEVEL_SYSTEM_PROTECTION = 4;
  FWUPD_SECURITY_ATTR_LEVEL_SYSTEM_ATTESTATION = 5;
  FWUPD_SECURITY_ATTR_LEVEL_LAST = 6;

type
  PFwupdSecurityAttrResult = ^TFwupdSecurityAttrResult;
  TFwupdSecurityAttrResult = longint;

const
  FWUPD_SECURITY_ATTR_RESULT_UNKNOWN = 0;
  FWUPD_SECURITY_ATTR_RESULT_ENABLED = 1;
  FWUPD_SECURITY_ATTR_RESULT_NOT_ENABLED = 2;
  FWUPD_SECURITY_ATTR_RESULT_VALID = 3;
  FWUPD_SECURITY_ATTR_RESULT_NOT_VALID = 4;
  FWUPD_SECURITY_ATTR_RESULT_LOCKED = 5;
  FWUPD_SECURITY_ATTR_RESULT_NOT_LOCKED = 6;
  FWUPD_SECURITY_ATTR_RESULT_ENCRYPTED = 7;
  FWUPD_SECURITY_ATTR_RESULT_NOT_ENCRYPTED = 8;
  FWUPD_SECURITY_ATTR_RESULT_TAINTED = 9;
  FWUPD_SECURITY_ATTR_RESULT_NOT_TAINTED = 10;
  FWUPD_SECURITY_ATTR_RESULT_FOUND = 11;
  FWUPD_SECURITY_ATTR_RESULT_NOT_FOUND = 12;
  FWUPD_SECURITY_ATTR_RESULT_SUPPORTED = 13;
  FWUPD_SECURITY_ATTR_RESULT_NOT_SUPPORTED = 14;
  FWUPD_SECURITY_ATTR_RESULT_LAST = 15;

function fwupd_security_attr_get_type: TGType; cdecl; external libfwupd;
function fwupd_security_attr_new(appstream_id: Pgchar): PFwupdSecurityAttr; cdecl; external libfwupd;
function fwupd_security_attr_to_string(self: PFwupdSecurityAttr): Pgchar; cdecl; external libfwupd;
function fwupd_security_attr_get_bios_setting_id(self: PFwupdSecurityAttr): Pgchar; cdecl; external libfwupd;
procedure fwupd_security_attr_set_bios_setting_id(self: PFwupdSecurityAttr; id: Pgchar); cdecl; external libfwupd;
function fwupd_security_attr_get_bios_setting_target_value(self: PFwupdSecurityAttr): Pgchar; cdecl; external libfwupd;
procedure fwupd_security_attr_set_bios_setting_target_value(self: PFwupdSecurityAttr; value: Pgchar); cdecl; external libfwupd;
function fwupd_security_attr_get_bios_setting_current_value(self: PFwupdSecurityAttr): Pgchar; cdecl; external libfwupd;
procedure fwupd_security_attr_set_bios_setting_current_value(self: PFwupdSecurityAttr; value: Pgchar); cdecl; external libfwupd;
function fwupd_security_attr_get_kernel_current_value(self: PFwupdSecurityAttr): Pgchar; cdecl; external libfwupd;
procedure fwupd_security_attr_set_kernel_current_value(self: PFwupdSecurityAttr; value: Pgchar); cdecl; external libfwupd;
function fwupd_security_attr_get_kernel_target_value(self: PFwupdSecurityAttr): Pgchar; cdecl; external libfwupd;
procedure fwupd_security_attr_set_kernel_target_value(self: PFwupdSecurityAttr; value: Pgchar); cdecl; external libfwupd;
function fwupd_security_attr_get_appstream_id(self: PFwupdSecurityAttr): Pgchar; cdecl; external libfwupd;
procedure fwupd_security_attr_set_appstream_id(self: PFwupdSecurityAttr; appstream_id: Pgchar); cdecl; external libfwupd;
function fwupd_security_attr_get_level(self: PFwupdSecurityAttr): TFwupdSecurityAttrLevel; cdecl; external libfwupd;
procedure fwupd_security_attr_set_level(self: PFwupdSecurityAttr; level: TFwupdSecurityAttrLevel); cdecl; external libfwupd;
function fwupd_security_attr_get_result(self: PFwupdSecurityAttr): TFwupdSecurityAttrResult; cdecl; external libfwupd;
procedure fwupd_security_attr_set_result(self: PFwupdSecurityAttr; result: TFwupdSecurityAttrResult); cdecl; external libfwupd;
function fwupd_security_attr_get_result_fallback(self: PFwupdSecurityAttr): TFwupdSecurityAttrResult; cdecl; external libfwupd;
procedure fwupd_security_attr_set_result_fallback(self: PFwupdSecurityAttr; result: TFwupdSecurityAttrResult); cdecl; external libfwupd;
function fwupd_security_attr_get_result_success(self: PFwupdSecurityAttr): TFwupdSecurityAttrResult; cdecl; external libfwupd;
procedure fwupd_security_attr_set_result_success(self: PFwupdSecurityAttr; result: TFwupdSecurityAttrResult); cdecl; external libfwupd;
function fwupd_security_attr_get_name(self: PFwupdSecurityAttr): Pgchar; cdecl; external libfwupd;
procedure fwupd_security_attr_set_name(self: PFwupdSecurityAttr; name: Pgchar); cdecl; external libfwupd;
function fwupd_security_attr_get_title(self: PFwupdSecurityAttr): Pgchar; cdecl; external libfwupd;
procedure fwupd_security_attr_set_title(self: PFwupdSecurityAttr; title: Pgchar); cdecl; external libfwupd;
function fwupd_security_attr_get_description(self: PFwupdSecurityAttr): Pgchar; cdecl; external libfwupd;
procedure fwupd_security_attr_set_description(self: PFwupdSecurityAttr; description: Pgchar); cdecl; external libfwupd;
function fwupd_security_attr_get_plugin(self: PFwupdSecurityAttr): Pgchar; cdecl; external libfwupd;
procedure fwupd_security_attr_set_plugin(self: PFwupdSecurityAttr; plugin: Pgchar); cdecl; external libfwupd;
function fwupd_security_attr_get_url(self: PFwupdSecurityAttr): Pgchar; cdecl; external libfwupd;
procedure fwupd_security_attr_set_url(self: PFwupdSecurityAttr; url: Pgchar); cdecl; external libfwupd;
function fwupd_security_attr_get_created(self: PFwupdSecurityAttr): Tguint64; cdecl; external libfwupd;
procedure fwupd_security_attr_set_created(self: PFwupdSecurityAttr; created: Tguint64); cdecl; external libfwupd;
function fwupd_security_attr_get_obsoletes(self: PFwupdSecurityAttr): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_security_attr_add_obsolete(self: PFwupdSecurityAttr; appstream_id: Pgchar); cdecl; external libfwupd;
function fwupd_security_attr_has_obsolete(self: PFwupdSecurityAttr; appstream_id: Pgchar): Tgboolean; cdecl; external libfwupd;
function fwupd_security_attr_get_guids(self: PFwupdSecurityAttr): PGPtrArray; cdecl; external libfwupd;
procedure fwupd_security_attr_add_guid(self: PFwupdSecurityAttr; guid: Pgchar); cdecl; external libfwupd;
procedure fwupd_security_attr_add_guids(self: PFwupdSecurityAttr; guids: PGPtrArray); cdecl; external libfwupd;
function fwupd_security_attr_has_guid(self: PFwupdSecurityAttr; guid: Pgchar): Tgboolean; cdecl; external libfwupd;
function fwupd_security_attr_get_metadata(self: PFwupdSecurityAttr; key: Pgchar): Pgchar; cdecl; external libfwupd;
procedure fwupd_security_attr_add_metadata(self: PFwupdSecurityAttr; key: Pgchar; value: Pgchar); cdecl; external libfwupd;
function fwupd_security_attr_get_flags(self: PFwupdSecurityAttr): TFwupdSecurityAttrFlags; cdecl; external libfwupd;
procedure fwupd_security_attr_set_flags(self: PFwupdSecurityAttr; flags: TFwupdSecurityAttrFlags); cdecl; external libfwupd;
procedure fwupd_security_attr_add_flag(self: PFwupdSecurityAttr; flag: TFwupdSecurityAttrFlags); cdecl; external libfwupd;
procedure fwupd_security_attr_remove_flag(self: PFwupdSecurityAttr; flag: TFwupdSecurityAttrFlags); cdecl; external libfwupd;
function fwupd_security_attr_has_flag(self: PFwupdSecurityAttr; flag: TFwupdSecurityAttrFlags): Tgboolean; cdecl; external libfwupd;
function fwupd_security_attr_flag_to_string(flag: TFwupdSecurityAttrFlags): Pgchar; cdecl; external libfwupd;
function fwupd_security_attr_flag_from_string(flag: Pgchar): TFwupdSecurityAttrFlags; cdecl; external libfwupd;
function fwupd_security_attr_flag_to_suffix(flag: TFwupdSecurityAttrFlags): Pgchar; cdecl; external libfwupd;
function fwupd_security_attr_result_to_string(result: TFwupdSecurityAttrResult): Pgchar; cdecl; external libfwupd;
function fwupd_security_attr_result_from_string(result: Pgchar): TFwupdSecurityAttrResult; cdecl; external libfwupd;
function fwupd_security_attr_from_variant(value: PGVariant): PFwupdSecurityAttr; cdecl; external libfwupd;
function fwupd_security_attr_array_from_variant(value: PGVariant): PGPtrArray; cdecl; external libfwupd;

// === Konventiert am: 21-4-26 15:36:25 ===

function FWUPD_TYPE_SECURITY_ATTR: TGType;
function FWUPD_SECURITY_ATTR(obj: Pointer): PFwupdSecurityAttr;
function FWUPD_IS_SECURITY_ATTR(obj: Pointer): Tgboolean;
function FWUPD_SECURITY_ATTR_CLASS(klass: Pointer): PFwupdSecurityAttrClass;
function FWUPD_IS_SECURITY_ATTR_CLASS(klass: Pointer): Tgboolean;
function FWUPD_SECURITY_ATTR_GET_CLASS(obj: Pointer): PFwupdSecurityAttrClass;

implementation

function FWUPD_TYPE_SECURITY_ATTR: TGType;
begin
  Result := fwupd_security_attr_get_type;
end;

function FWUPD_SECURITY_ATTR(obj: Pointer): PFwupdSecurityAttr;
begin
  Result := PFwupdSecurityAttr(g_type_check_instance_cast(obj, FWUPD_TYPE_SECURITY_ATTR));
end;

function FWUPD_IS_SECURITY_ATTR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, FWUPD_TYPE_SECURITY_ATTR);
end;

function FWUPD_SECURITY_ATTR_CLASS(klass: Pointer): PFwupdSecurityAttrClass;
begin
  Result := PFwupdSecurityAttrClass(g_type_check_class_cast(klass, FWUPD_TYPE_SECURITY_ATTR));
end;

function FWUPD_IS_SECURITY_ATTR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, FWUPD_TYPE_SECURITY_ATTR);
end;

function FWUPD_SECURITY_ATTR_GET_CLASS(obj: Pointer): PFwupdSecurityAttrClass;
begin
  Result := PFwupdSecurityAttrClass(PGTypeInstance(obj)^.g_class);
end;



end.
