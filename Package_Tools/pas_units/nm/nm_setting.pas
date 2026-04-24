unit nm_setting;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_core_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_SETTING_PARAM_REQUIRED = $200;
  NM_SETTING_PARAM_SECRET = $400;
  NM_SETTING_PARAM_FUZZY_IGNORE = $800;
  NM_SETTING_NAME = 'name';

type
  PNMSettingSecretFlags = ^TNMSettingSecretFlags;
  TNMSettingSecretFlags = longint;

const
  NM_SETTING_SECRET_FLAG_NONE = $00000000;
  NM_SETTING_SECRET_FLAG_AGENT_OWNED = $00000001;
  NM_SETTING_SECRET_FLAG_NOT_SAVED = $00000002;
  NM_SETTING_SECRET_FLAG_NOT_REQUIRED = $00000004;

type
  PNMSettingCompareFlags = ^TNMSettingCompareFlags;
  TNMSettingCompareFlags = longint;

const
  NM_SETTING_COMPARE_FLAG_EXACT = $00000000;
  NM_SETTING_COMPARE_FLAG_FUZZY = $00000001;
  NM_SETTING_COMPARE_FLAG_IGNORE_ID = $00000002;
  NM_SETTING_COMPARE_FLAG_IGNORE_SECRETS = $00000004;
  NM_SETTING_COMPARE_FLAG_IGNORE_AGENT_OWNED_SECRETS = $00000008;
  NM_SETTING_COMPARE_FLAG_IGNORE_NOT_SAVED_SECRETS = $00000010;
  NM_SETTING_COMPARE_FLAG_DIFF_RESULT_WITH_DEFAULT = $00000020;
  NM_SETTING_COMPARE_FLAG_DIFF_RESULT_NO_DEFAULT = $00000040;
  NM_SETTING_COMPARE_FLAG_IGNORE_TIMESTAMP = $00000080;

type
  PNMSettingMacRandomization = ^TNMSettingMacRandomization;
  TNMSettingMacRandomization = longint;

const
  NM_SETTING_MAC_RANDOMIZATION_DEFAULT = 0;
  NM_SETTING_MAC_RANDOMIZATION_NEVER = 1;
  NM_SETTING_MAC_RANDOMIZATION_ALWAYS = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TNMSettingClearSecretsWithFlagsFn = function(setting: PNMSetting; secret: pchar; flags: TNMSettingSecretFlags; user_data: Tgpointer): Tgboolean; cdecl;

  PNMMetaSettingInfo = type Pointer;
  PNMSettInfoSetting = type Pointer;
  PNMSettInfoProperty = type Pointer;

  TNMSettingValueIterFn = procedure(setting: PNMSetting; key: pchar; value: PGValue; flags: TGParamFlags; user_data: Tgpointer); cdecl;

  PNMSetting = type Pointer;
  PPNMSetting = ^PNMSetting;
  PNMSettingClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_get_type: TGType; cdecl; external libnm;
function nm_setting_lookup_type(name: pchar): TGType; cdecl; external libnm;
function nm_setting_duplicate(setting: PNMSetting): PNMSetting; cdecl; external libnm;
function nm_setting_get_name(setting: PNMSetting): pchar; cdecl; external libnm;
function nm_setting_verify(setting: PNMSetting; connection: PNMConnection; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_setting_verify_secrets(setting: PNMSetting; connection: PNMConnection; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_setting_compare(a: PNMSetting; b: PNMSetting; flags: TNMSettingCompareFlags): Tgboolean; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PNMSettingDiffResult = ^TNMSettingDiffResult;
  TNMSettingDiffResult = longint;

const
  NM_SETTING_DIFF_RESULT_UNKNOWN = $00000000;
  NM_SETTING_DIFF_RESULT_IN_A = $00000001;
  NM_SETTING_DIFF_RESULT_IN_B = $00000002;
  NM_SETTING_DIFF_RESULT_IN_A_DEFAULT = $00000004;
  NM_SETTING_DIFF_RESULT_IN_B_DEFAULT = $00000008;
  {$ENDIF read_enum}

{$IFDEF read_function}
function nm_setting_diff(a: PNMSetting; b: PNMSetting; flags: TNMSettingCompareFlags; invert_results: Tgboolean; results: PPGHashTable): Tgboolean; cdecl; external libnm;
procedure nm_setting_enumerate_values(setting: PNMSetting; func: TNMSettingValueIterFn; user_data: Tgpointer); cdecl; external libnm;
function nm_setting_to_string(setting: PNMSetting): pchar; cdecl; external libnm;

function nm_setting_get_secret_flags(setting: PNMSetting; secret_name: pchar; out_flags: PNMSettingSecretFlags; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_setting_set_secret_flags(setting: PNMSetting; secret_name: pchar; flags: TNMSettingSecretFlags; error: PPGError): Tgboolean; cdecl; external libnm;

function nm_setting_option_get(setting: PNMSetting; opt_name: pchar): PGVariant; cdecl; external libnm;
function nm_setting_option_get_boolean(setting: PNMSetting; opt_name: pchar; out_value: Pgboolean): Tgboolean; cdecl; external libnm;
function nm_setting_option_get_uint32(setting: PNMSetting; opt_name: pchar; out_value: Pguint32): Tgboolean; cdecl; external libnm;
procedure nm_setting_option_set(setting: PNMSetting; opt_name: pchar; variant: PGVariant); cdecl; external libnm;
procedure nm_setting_option_set_uint32(setting: PNMSetting; opt_name: pchar; value: Tguint32); cdecl; external libnm;
procedure nm_setting_option_set_boolean(setting: PNMSetting; opt_name: pchar; value: Tgboolean); cdecl; external libnm;
function nm_setting_option_get_all_names(setting: PNMSetting; out_len: Pguint): PPchar; cdecl; external libnm;
procedure nm_setting_option_clear_by_name(setting: PNMSetting; predicate: TNMUtilsPredicateStr); cdecl; external libnm;

function nm_setting_get_dbus_property_type(setting: PNMSetting; property_name: pchar): PGVariantType; cdecl; external libnm;
function nm_setting_get_enum_property_type(setting_type: TGType; property_name: pchar): TGType; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  PNMRange = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_range_get_type: TGType; cdecl; external libnm;
function nm_range_new(start: Tguint64; _end: Tguint64): PNMRange; cdecl; external libnm;
function nm_range_ref(range: PNMRange): PNMRange; cdecl; external libnm;
procedure nm_range_unref(range: PNMRange); cdecl; external libnm;
function nm_range_cmp(a: PNMRange; b: PNMRange): longint; cdecl; external libnm;
function nm_range_get_range(range: PNMRange; start: Pguint64; end_: Pguint64): Tgboolean; cdecl; external libnm;
function nm_range_to_str(range: PNMRange): pchar; cdecl; external libnm;
function nm_range_from_str(str: pchar; error: PPGError): PNMRange; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:28:23 ===

function NM_TYPE_SETTING: TGType;
function NM_SETTING(obj: Pointer): PNMSetting;
function NM_SETTING_CLASS(klass: Pointer): PNMSettingClass;
function NM_IS_SETTING(obj: Pointer): Tgboolean;
function NM_IS_SETTING_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_GET_CLASS(obj: Pointer): PNMSettingClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING: TGType;
begin
  NM_TYPE_SETTING := nm_setting_get_type;
end;

function NM_SETTING(obj: Pointer): PNMSetting;
begin
  Result := PNMSetting(g_type_check_instance_cast(obj, NM_TYPE_SETTING));
end;

function NM_SETTING_CLASS(klass: Pointer): PNMSettingClass;
begin
  Result := PNMSettingClass(g_type_check_class_cast(klass, NM_TYPE_SETTING));
end;

function NM_IS_SETTING(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING);
end;

function NM_IS_SETTING_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING);
end;

function NM_SETTING_GET_CLASS(obj: Pointer): PNMSettingClass;
begin
  Result := PNMSettingClass(PGTypeInstance(obj)^.g_class);
end;



end.
