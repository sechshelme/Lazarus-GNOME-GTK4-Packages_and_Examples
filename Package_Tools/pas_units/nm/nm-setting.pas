unit nm_setting;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2011 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_H__}
{$define __NM_SETTING_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-core-types.h"}

{ The property of the #NMSetting is required for the setting to be valid  }
const
  NM_SETTING_PARAM_REQUIRED = $200;  
{ The property of the #NMSetting is a secret  }
  NM_SETTING_PARAM_SECRET = $400;  
{ The property of the #NMSetting should be ignored during comparisons that
 * use the %NM_SETTING_COMPARE_FLAG_FUZZY flag.
  }
  NM_SETTING_PARAM_FUZZY_IGNORE = $800;  
{ Note: all non-glib GParamFlags bits are reserved by NetworkManager  }
  NM_SETTING_NAME = 'name';  
{*
 * NMSettingSecretFlags:
 * @NM_SETTING_SECRET_FLAG_NONE: the system is responsible for providing and
 * storing this secret (default)
 * @NM_SETTING_SECRET_FLAG_AGENT_OWNED: a user secret agent is responsible
 * for providing and storing this secret; when it is required agents will be
 * asked to retrieve it
 * @NM_SETTING_SECRET_FLAG_NOT_SAVED: this secret should not be saved, but
 * should be requested from the user each time it is needed
 * @NM_SETTING_SECRET_FLAG_NOT_REQUIRED: in situations where it cannot be
 * automatically determined that the secret is required (some VPNs and PPP
 * providers don't require all secrets) this flag indicates that the specific
 * secret is not required
 *
 * These flags indicate specific behavior related to handling of a secret.  Each
 * secret has a corresponding set of these flags which indicate how the secret
 * is to be stored and/or requested when it is needed.
 *
 * }
{< flags > }{ NOTE: if adding flags, update nm-core-internal.h as well  }
type
  PNMSettingSecretFlags = ^TNMSettingSecretFlags;
  TNMSettingSecretFlags =  Longint;
  Const
    NM_SETTING_SECRET_FLAG_NONE = $00000000;
    NM_SETTING_SECRET_FLAG_AGENT_OWNED = $00000001;
    NM_SETTING_SECRET_FLAG_NOT_SAVED = $00000002;
    NM_SETTING_SECRET_FLAG_NOT_REQUIRED = $00000004;
;
{*
 * NMSettingCompareFlags:
 * @NM_SETTING_COMPARE_FLAG_EXACT: match all properties exactly
 * @NM_SETTING_COMPARE_FLAG_FUZZY: match only important attributes, like SSID,
 *   type, security settings, etc.  Does not match, for example, connection ID
 *   or UUID.
 * @NM_SETTING_COMPARE_FLAG_IGNORE_ID: ignore the connection's ID
 * @NM_SETTING_COMPARE_FLAG_IGNORE_SECRETS: ignore all secrets
 * @NM_SETTING_COMPARE_FLAG_IGNORE_AGENT_OWNED_SECRETS: ignore secrets for which
 *   the secret's flags indicate the secret is owned by a user secret agent
 *   (ie, the secret's flag includes @NM_SETTING_SECRET_FLAG_AGENT_OWNED)
 * @NM_SETTING_COMPARE_FLAG_IGNORE_NOT_SAVED_SECRETS: ignore secrets for which
 *   the secret's flags indicate the secret should not be saved to persistent
 *   storage (ie, the secret's flag includes @NM_SETTING_SECRET_FLAG_NOT_SAVED)
 * @NM_SETTING_COMPARE_FLAG_DIFF_RESULT_WITH_DEFAULT: if this flag is set,
 *   nm_setting_diff() and nm_connection_diff() will also include properties that
 *   are set to their default value. See also @NM_SETTING_COMPARE_FLAG_DIFF_RESULT_NO_DEFAULT.
 * @NM_SETTING_COMPARE_FLAG_DIFF_RESULT_NO_DEFAULT: if this flag is set,
 *   nm_setting_diff() and nm_connection_diff() will not include properties that
 *   are set to their default value. This is the opposite of
 *   @NM_SETTING_COMPARE_FLAG_DIFF_RESULT_WITH_DEFAULT. If both flags are set together,
 *   @NM_SETTING_COMPARE_FLAG_DIFF_RESULT_WITH_DEFAULT wins. If both flags are unset,
 *   this means to exclude default properties if there is a setting to compare,
 *   but include all properties, if the setting 'b' is missing. This is the legacy
 *   behaviour of libnm-util, where nm_setting_diff() behaved differently depending
 *   on whether the setting 'b' was available. If @NM_SETTING_COMPARE_FLAG_DIFF_RESULT_WITH_DEFAULT
 *   is set, nm_setting_diff() will also set the flags @NM_SETTING_DIFF_RESULT_IN_A_DEFAULT
 *   and @NM_SETTING_DIFF_RESULT_IN_B_DEFAULT, if the values are default values.
 * @NM_SETTING_COMPARE_FLAG_IGNORE_TIMESTAMP: ignore the connection's timestamp
 *
 * These flags modify the comparison behavior when comparing two settings or
 * two connections.
 *
 * }
{ Higher flags like 0x80000000 and 0x40000000 are used internally as private flags  }
type
  PNMSettingCompareFlags = ^TNMSettingCompareFlags;
  TNMSettingCompareFlags =  Longint;
  Const
    NM_SETTING_COMPARE_FLAG_EXACT = $00000000;
    NM_SETTING_COMPARE_FLAG_FUZZY = $00000001;
    NM_SETTING_COMPARE_FLAG_IGNORE_ID = $00000002;
    NM_SETTING_COMPARE_FLAG_IGNORE_SECRETS = $00000004;
    NM_SETTING_COMPARE_FLAG_IGNORE_AGENT_OWNED_SECRETS = $00000008;
    NM_SETTING_COMPARE_FLAG_IGNORE_NOT_SAVED_SECRETS = $00000010;
    NM_SETTING_COMPARE_FLAG_DIFF_RESULT_WITH_DEFAULT = $00000020;
    NM_SETTING_COMPARE_FLAG_DIFF_RESULT_NO_DEFAULT = $00000040;
    NM_SETTING_COMPARE_FLAG_IGNORE_TIMESTAMP = $00000080;
;
{*
 * NMSettingMacRandomization:
 * @NM_SETTING_MAC_RANDOMIZATION_DEFAULT: the default value, which unless
 * overridden by user-controlled defaults configuration, is "never".
 * @NM_SETTING_MAC_RANDOMIZATION_NEVER: the device's MAC address is always used.
 * @NM_SETTING_MAC_RANDOMIZATION_ALWAYS: a random MAC address is used.
 *
 * Controls if and how the MAC address of a device is randomzied.
 *
 * Since: 1.2
 * }
type
  PNMSettingMacRandomization = ^TNMSettingMacRandomization;
  TNMSettingMacRandomization =  Longint;
  Const
    NM_SETTING_MAC_RANDOMIZATION_DEFAULT = 0;
    NM_SETTING_MAC_RANDOMIZATION_NEVER = 1;
    NM_SETTING_MAC_RANDOMIZATION_ALWAYS = 2;
;
{*
 * NMSettingClearSecretsWithFlagsFn:
 * @setting: The setting for which secrets are being iterated
 * @secret: The secret's name
 * @flags: The secret's flags, eg %NM_SETTING_SECRET_FLAG_AGENT_OWNED
 * @user_data: User data passed to nm_connection_clear_secrets_with_flags()
 *
 * Returns: %TRUE to clear the secret, %FALSE to not clear the secret
  }
type

  TNMSettingClearSecretsWithFlagsFn = function (setting:PNMSetting; secret:Pchar; flags:TNMSettingSecretFlags; user_data:Tgpointer):Tgboolean;cdecl;
  PNMMetaSettingInfo = ^TNMMetaSettingInfo;
  TNMMetaSettingInfo = record
      {undefined structure}
    end;

  PNMSettInfoSetting = ^TNMSettInfoSetting;
  TNMSettInfoSetting = record
      {undefined structure}
    end;

  PNMSettInfoProperty = ^TNMSettInfoProperty;
  TNMSettInfoProperty = record
      {undefined structure}
    end;

{*
 * NMSettingValueIterFn:
 * @setting: The setting for which properties are being iterated, given to
 * nm_setting_enumerate_values()
 * @key: The value/property name
 * @value: The property's value
 * @flags: The property's flags, like %NM_SETTING_PARAM_SECRET
 * @user_data: User data passed to nm_setting_enumerate_values()
  }

  TNMSettingValueIterFn = procedure (setting:PNMSetting; key:Pchar; value:PGValue; flags:TGParamFlags; user_data:Tgpointer);cdecl;

function nm_setting_get_type:TGType;cdecl;external libnm;
function nm_setting_lookup_type(name:Pchar):TGType;cdecl;external libnm;
function nm_setting_duplicate(setting:PNMSetting):PNMSetting;cdecl;external libnm;
function nm_setting_get_name(setting:PNMSetting):Pchar;cdecl;external libnm;
function nm_setting_verify(setting:PNMSetting; connection:PNMConnection; error:PPGError):Tgboolean;cdecl;external libnm;
function nm_setting_verify_secrets(setting:PNMSetting; connection:PNMConnection; error:PPGError):Tgboolean;cdecl;external libnm;
function nm_setting_compare(a:PNMSetting; b:PNMSetting; flags:TNMSettingCompareFlags):Tgboolean;cdecl;external libnm;
{*
 * NMSettingDiffResult:
 * @NM_SETTING_DIFF_RESULT_UNKNOWN: unknown result
 * @NM_SETTING_DIFF_RESULT_IN_A: the property is present in setting A
 * @NM_SETTING_DIFF_RESULT_IN_B: the property is present in setting B
 * @NM_SETTING_DIFF_RESULT_IN_A_DEFAULT: the property is present in
 * setting A but is set to the default value. This flag is only set,
 * if you specify @NM_SETTING_COMPARE_FLAG_DIFF_RESULT_WITH_DEFAULT.
 * @NM_SETTING_DIFF_RESULT_IN_B_DEFAULT: analog to @NM_SETTING_DIFF_RESULT_IN_A_DEFAULT.
 *
 * These values indicate the result of a setting difference operation.
 * }
type
  PNMSettingDiffResult = ^TNMSettingDiffResult;
  TNMSettingDiffResult =  Longint;
  Const
    NM_SETTING_DIFF_RESULT_UNKNOWN = $00000000;
    NM_SETTING_DIFF_RESULT_IN_A = $00000001;
    NM_SETTING_DIFF_RESULT_IN_B = $00000002;
    NM_SETTING_DIFF_RESULT_IN_A_DEFAULT = $00000004;
    NM_SETTING_DIFF_RESULT_IN_B_DEFAULT = $00000008;
;

function nm_setting_diff(a:PNMSetting; b:PNMSetting; flags:TNMSettingCompareFlags; invert_results:Tgboolean; results:PPGHashTable):Tgboolean;cdecl;external libnm;
procedure nm_setting_enumerate_values(setting:PNMSetting; func:TNMSettingValueIterFn; user_data:Tgpointer);cdecl;external libnm;
function nm_setting_to_string(setting:PNMSetting):Pchar;cdecl;external libnm;
{*************************************************************************** }
function nm_setting_get_secret_flags(setting:PNMSetting; secret_name:Pchar; out_flags:PNMSettingSecretFlags; error:PPGError):Tgboolean;cdecl;external libnm;
function nm_setting_set_secret_flags(setting:PNMSetting; secret_name:Pchar; flags:TNMSettingSecretFlags; error:PPGError):Tgboolean;cdecl;external libnm;
{*************************************************************************** }
function nm_setting_option_get(setting:PNMSetting; opt_name:Pchar):PGVariant;cdecl;external libnm;
function nm_setting_option_get_boolean(setting:PNMSetting; opt_name:Pchar; out_value:Pgboolean):Tgboolean;cdecl;external libnm;
function nm_setting_option_get_uint32(setting:PNMSetting; opt_name:Pchar; out_value:Pguint32):Tgboolean;cdecl;external libnm;
procedure nm_setting_option_set(setting:PNMSetting; opt_name:Pchar; variant:PGVariant);cdecl;external libnm;
procedure nm_setting_option_set_uint32(setting:PNMSetting; opt_name:Pchar; value:Tguint32);cdecl;external libnm;
procedure nm_setting_option_set_boolean(setting:PNMSetting; opt_name:Pchar; value:Tgboolean);cdecl;external libnm;
function nm_setting_option_get_all_names(setting:PNMSetting; out_len:Pguint):^Pchar;cdecl;external libnm;
procedure nm_setting_option_clear_by_name(setting:PNMSetting; predicate:TNMUtilsPredicateStr);cdecl;external libnm;
{*************************************************************************** }
function nm_setting_get_dbus_property_type(setting:PNMSetting; property_name:Pchar):PGVariantType;cdecl;external libnm;
function nm_setting_get_enum_property_type(setting_type:TGType; property_name:Pchar):TGType;cdecl;external libnm;
{*************************************************************************** }
type

function nm_range_get_type:TGType;cdecl;external libnm;
function nm_range_new(start:Tguint64; end:Tguint64):PNMRange;cdecl;external libnm;
function nm_range_ref(range:PNMRange):PNMRange;cdecl;external libnm;
procedure nm_range_unref(range:PNMRange);cdecl;external libnm;
function nm_range_cmp(a:PNMRange; b:PNMRange):longint;cdecl;external libnm;
function nm_range_get_range(range:PNMRange; start:Pguint64; end:Pguint64):Tgboolean;cdecl;external libnm;
function nm_range_to_str(range:PNMRange):Pchar;cdecl;external libnm;
function nm_range_from_str(str:Pchar; error:PPGError):PNMRange;cdecl;external libnm;
{$endif}
{ __NM_SETTING_H__  }

// === Konventiert am: 19-4-26 19:28:23 ===

function NM_TYPE_SETTING : TGType;
function NM_SETTING(obj : Pointer) : PNMSetting;
function NM_SETTING_CLASS(klass : Pointer) : PNMSettingClass;
function NM_IS_SETTING(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_GET_CLASS(obj : Pointer) : PNMSettingClass;

implementation

function NM_TYPE_SETTING : TGType;
  begin
    NM_TYPE_SETTING:=nm_setting_get_type;
  end;

function NM_SETTING(obj : Pointer) : PNMSetting;
begin
  Result := PNMSetting(g_type_check_instance_cast(obj, NM_TYPE_SETTING));
end;

function NM_SETTING_CLASS(klass : Pointer) : PNMSettingClass;
begin
  Result := PNMSettingClass(g_type_check_class_cast(klass, NM_TYPE_SETTING));
end;

function NM_IS_SETTING(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING);
end;

function NM_IS_SETTING_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING);
end;

function NM_SETTING_GET_CLASS(obj : Pointer) : PNMSettingClass;
begin
  Result := PNMSettingClass(PGTypeInstance(obj)^.g_class);
end;



end.
