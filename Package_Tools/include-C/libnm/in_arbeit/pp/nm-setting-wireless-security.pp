
unit nm-setting-wireless-security;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-wireless-security.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-wireless-security.h
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
Pchar  = ^char;
PNMSetting  = ^NMSetting;
PNMSettingWirelessSecurity  = ^NMSettingWirelessSecurity;
PNMSettingWirelessSecurityFils  = ^NMSettingWirelessSecurityFils;
PNMSettingWirelessSecurityPmf  = ^NMSettingWirelessSecurityPmf;
PNMSettingWirelessSecurityWpsMethod  = ^NMSettingWirelessSecurityWpsMethod;
PNMWepKeyType  = ^NMWepKeyType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2017 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_WIRELESS_SECURITY_H__}
{$define __NM_SETTING_WIRELESS_SECURITY_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_WIRELESS_SECURITY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIRELESS_SECURITY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIRELESS_SECURITY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIRELESS_SECURITY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIRELESS_SECURITY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIRELESS_SECURITY_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_WIRELESS_SECURITY_SETTING_NAME = '802-11-wireless-security';  
{*
 * NMWepKeyType:
 * @NM_WEP_KEY_TYPE_UNKNOWN: unknown WEP key type
 * @NM_WEP_KEY_TYPE_KEY: indicates a hexadecimal or ASCII formatted WEP key.
 * Hex keys are either 10 or 26 hexadecimal characters (ie "5f782f2f5f" or
 * "732f2d712e4a394a375d366931"), while ASCII keys are either 5 or 13 ASCII
 * characters (ie "abcde" or "blahblah99$*1").
 * @NM_WEP_KEY_TYPE_PASSPHRASE: indicates a WEP passphrase (ex "I bought a duck
 * on my way back from the market 235Q&^%^*%") instead of a hexadecimal or ASCII
 * key.  Passphrases are between 8 and 64 characters inclusive and are hashed
 * the actual WEP key using the MD5 hash algorithm.
 * @NM_WEP_KEY_TYPE_LAST: placeholder value for bounds-checking
 *
 * The #NMWepKeyType values specify how any WEP keys present in the setting
 * are interpreted.  There are no standards governing how to hash the various WEP
 * key/passphrase formats into the actual WEP key.  Unfortunately some WEP keys
 * can be interpreted in multiple ways, requiring the setting to specify how to
 * interpret the any WEP keys.  For example, the key "732f2d712e4a394a375d366931"
 * is both a valid Hexadecimal WEP key and a WEP passphrase.  Further, many
 * ASCII keys are also valid WEP passphrases, but since passphrases and ASCII
 * keys are hashed differently to determine the actual WEP key the type must be
 * specified.
  }
{ Hex or ASCII  }
{ 104/128-bit Passphrase  }
{< skip > }
type
  PNMWepKeyType = ^TNMWepKeyType;
  TNMWepKeyType =  Longint;
  Const
    NM_WEP_KEY_TYPE_UNKNOWN = 0;
    NM_WEP_KEY_TYPE_KEY = 1;
    NM_WEP_KEY_TYPE_PASSPHRASE = 2;
    NM_WEP_KEY_TYPE_LAST = NM_WEP_KEY_TYPE_PASSPHRASE;
;
{*
 * NMSettingWirelessSecurityPmf:
 * @NM_SETTING_WIRELESS_SECURITY_PMF_DEFAULT: use the default value
 * @NM_SETTING_WIRELESS_SECURITY_PMF_DISABLE: disable PMF
 * @NM_SETTING_WIRELESS_SECURITY_PMF_OPTIONAL: enable PMF if the supplicant and the AP support it
 * @NM_SETTING_WIRELESS_SECURITY_PMF_REQUIRED: require PMF and fail if not available
 *
 * These flags indicate whether PMF must be enabled.
 *
 * Since: 1.10
 * }
{< skip > }
{< skip > }
type
  PNMSettingWirelessSecurityPmf = ^TNMSettingWirelessSecurityPmf;
  TNMSettingWirelessSecurityPmf =  Longint;
  Const
    NM_SETTING_WIRELESS_SECURITY_PMF_DEFAULT = 0;
    NM_SETTING_WIRELESS_SECURITY_PMF_DISABLE = 1;
    NM_SETTING_WIRELESS_SECURITY_PMF_OPTIONAL = 2;
    NM_SETTING_WIRELESS_SECURITY_PMF_REQUIRED = 3;
    _NM_SETTING_WIRELESS_SECURITY_PMF_NUM = 4;
    NM_SETTING_WIRELESS_SECURITY_PMF_LAST = _NM_SETTING_WIRELESS_SECURITY_PMF_NUM-1;
;
{*
 * NMSettingWirelessSecurityWpsMethod:
 * @NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_DEFAULT: Attempt whichever method AP supports
 * @NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_DISABLED: WPS can not be used.
 * @NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_AUTO: Use WPS, any method
 * @NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_PBC: use WPS push-button method
 * @NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_PIN: use PIN method
 *
 * Configure the use of WPS by a connection while it activates.
 *
 * Note: prior to 1.16, this was a GEnum type instead of a GFlags type
 * although, with the same numeric values.
 *
 * Since: 1.10
 * }
{< flags > }type
  PNMSettingWirelessSecurityWpsMethod = ^TNMSettingWirelessSecurityWpsMethod;
  TNMSettingWirelessSecurityWpsMethod =  Longint;
  Const
    NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_DEFAULT = $00000000;
    NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_DISABLED = $00000001;
    NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_AUTO = $00000002;
    NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_PBC = $00000004;
    NM_SETTING_WIRELESS_SECURITY_WPS_METHOD_PIN = $00000008;
;
{*
 * NMSettingWirelessSecurityFils:
 * @NM_SETTING_WIRELESS_SECURITY_FILS_DEFAULT: use the default value
 * @NM_SETTING_WIRELESS_SECURITY_FILS_DISABLE: disable FILS
 * @NM_SETTING_WIRELESS_SECURITY_FILS_OPTIONAL: enable FILS if the supplicant and the AP support it
 * @NM_SETTING_WIRELESS_SECURITY_FILS_REQUIRED: require FILS and fail if not available
 * @_NM_SETTING_WIRELESS_SECURITY_FILS_NUM: placeholder value for bounds-checking
 * @NM_SETTING_WIRELESS_SECURITY_FILS_LAST: placeholder value for bounds-checking
 *
 * These flags indicate whether FILS must be enabled.
 *
 * Since: 1.12
 * }
{ clang-format off  }
{< skip > }
{< skip > }
type
  PNMSettingWirelessSecurityFils = ^TNMSettingWirelessSecurityFils;
  TNMSettingWirelessSecurityFils =  Longint;
  Const
    NM_SETTING_WIRELESS_SECURITY_FILS_DEFAULT = 0;
    NM_SETTING_WIRELESS_SECURITY_FILS_DISABLE = 1;
    NM_SETTING_WIRELESS_SECURITY_FILS_OPTIONAL = 2;
    NM_SETTING_WIRELESS_SECURITY_FILS_REQUIRED = 3;
    _NM_SETTING_WIRELESS_SECURITY_FILS_NUM = 4;
    NM_SETTING_WIRELESS_SECURITY_FILS_LAST = _NM_SETTING_WIRELESS_SECURITY_FILS_NUM-1;
;
{ clang-format on  }
  NM_SETTING_WIRELESS_SECURITY_KEY_MGMT = 'key-mgmt';  
  NM_SETTING_WIRELESS_SECURITY_WEP_TX_KEYIDX = 'wep-tx-keyidx';  
  NM_SETTING_WIRELESS_SECURITY_AUTH_ALG = 'auth-alg';  
  NM_SETTING_WIRELESS_SECURITY_PROTO = 'proto';  
  NM_SETTING_WIRELESS_SECURITY_PAIRWISE = 'pairwise';  
  NM_SETTING_WIRELESS_SECURITY_GROUP = 'group';  
  NM_SETTING_WIRELESS_SECURITY_PMF = 'pmf';  
  NM_SETTING_WIRELESS_SECURITY_LEAP_USERNAME = 'leap-username';  
  NM_SETTING_WIRELESS_SECURITY_WEP_KEY0 = 'wep-key0';  
  NM_SETTING_WIRELESS_SECURITY_WEP_KEY1 = 'wep-key1';  
  NM_SETTING_WIRELESS_SECURITY_WEP_KEY2 = 'wep-key2';  
  NM_SETTING_WIRELESS_SECURITY_WEP_KEY3 = 'wep-key3';  
  NM_SETTING_WIRELESS_SECURITY_WEP_KEY_FLAGS = 'wep-key-flags';  
  NM_SETTING_WIRELESS_SECURITY_WEP_KEY_TYPE = 'wep-key-type';  
  NM_SETTING_WIRELESS_SECURITY_PSK = 'psk';  
  NM_SETTING_WIRELESS_SECURITY_PSK_FLAGS = 'psk-flags';  
  NM_SETTING_WIRELESS_SECURITY_LEAP_PASSWORD = 'leap-password';  
  NM_SETTING_WIRELESS_SECURITY_LEAP_PASSWORD_FLAGS = 'leap-password-flags';  
  NM_SETTING_WIRELESS_SECURITY_WPS_METHOD = 'wps-method';  
  NM_SETTING_WIRELESS_SECURITY_FILS = 'fils';  
type

function nm_setting_wireless_security_get_type:TGType;cdecl;external;
function nm_setting_wireless_security_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_get_key_mgmt(setting:PNMSettingWirelessSecurity):Pchar;cdecl;external;
function nm_setting_wireless_security_get_num_protos(setting:PNMSettingWirelessSecurity):Tguint32;cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_get_proto(setting:PNMSettingWirelessSecurity; i:Tguint32):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_add_proto(setting:PNMSettingWirelessSecurity; proto:Pchar):Tgboolean;cdecl;external;
procedure nm_setting_wireless_security_remove_proto(setting:PNMSettingWirelessSecurity; i:Tguint32);cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_remove_proto_by_value(setting:PNMSettingWirelessSecurity; proto:Pchar):Tgboolean;cdecl;external;
procedure nm_setting_wireless_security_clear_protos(setting:PNMSettingWirelessSecurity);cdecl;external;
function nm_setting_wireless_security_get_num_pairwise(setting:PNMSettingWirelessSecurity):Tguint32;cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_get_pairwise(setting:PNMSettingWirelessSecurity; i:Tguint32):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_add_pairwise(setting:PNMSettingWirelessSecurity; pairwise:Pchar):Tgboolean;cdecl;external;
procedure nm_setting_wireless_security_remove_pairwise(setting:PNMSettingWirelessSecurity; i:Tguint32);cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_remove_pairwise_by_value(setting:PNMSettingWirelessSecurity; pairwise:Pchar):Tgboolean;cdecl;external;
procedure nm_setting_wireless_security_clear_pairwise(setting:PNMSettingWirelessSecurity);cdecl;external;
function nm_setting_wireless_security_get_num_groups(setting:PNMSettingWirelessSecurity):Tguint32;cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_get_group(setting:PNMSettingWirelessSecurity; i:Tguint32):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_add_group(setting:PNMSettingWirelessSecurity; group:Pchar):Tgboolean;cdecl;external;
procedure nm_setting_wireless_security_remove_group(setting:PNMSettingWirelessSecurity; i:Tguint32);cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_remove_group_by_value(setting:PNMSettingWirelessSecurity; group:Pchar):Tgboolean;cdecl;external;
procedure nm_setting_wireless_security_clear_groups(setting:PNMSettingWirelessSecurity);cdecl;external;
function nm_setting_wireless_security_get_pmf(setting:PNMSettingWirelessSecurity):TNMSettingWirelessSecurityPmf;cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_get_psk(setting:PNMSettingWirelessSecurity):Pchar;cdecl;external;
function nm_setting_wireless_security_get_psk_flags(setting:PNMSettingWirelessSecurity):TNMSettingSecretFlags;cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_get_leap_username(setting:PNMSettingWirelessSecurity):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_get_leap_password(setting:PNMSettingWirelessSecurity):Pchar;cdecl;external;
function nm_setting_wireless_security_get_leap_password_flags(setting:PNMSettingWirelessSecurity):TNMSettingSecretFlags;cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_get_wep_key(setting:PNMSettingWirelessSecurity; idx:Tguint32):Pchar;cdecl;external;
(* Const before type ignored *)
procedure nm_setting_wireless_security_set_wep_key(setting:PNMSettingWirelessSecurity; idx:Tguint32; key:Pchar);cdecl;external;
function nm_setting_wireless_security_get_wep_tx_keyidx(setting:PNMSettingWirelessSecurity):Tguint32;cdecl;external;
(* Const before type ignored *)
function nm_setting_wireless_security_get_auth_alg(setting:PNMSettingWirelessSecurity):Pchar;cdecl;external;
function nm_setting_wireless_security_get_wep_key_flags(setting:PNMSettingWirelessSecurity):TNMSettingSecretFlags;cdecl;external;
function nm_setting_wireless_security_get_wep_key_type(setting:PNMSettingWirelessSecurity):TNMWepKeyType;cdecl;external;
function nm_setting_wireless_security_get_wps_method(setting:PNMSettingWirelessSecurity):TNMSettingWirelessSecurityWpsMethod;cdecl;external;
function nm_setting_wireless_security_get_fils(setting:PNMSettingWirelessSecurity):TNMSettingWirelessSecurityFils;cdecl;external;
{$endif}
{ __NM_SETTING_WIRELESS_SECURITY_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_WIRELESS_SECURITY : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_WIRELESS_SECURITY:=nm_setting_wireless_security_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIRELESS_SECURITY(obj : longint) : longint;
begin
  NM_SETTING_WIRELESS_SECURITY:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_WIRELESS_SECURITY,NMSettingWirelessSecurity);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIRELESS_SECURITY_CLASS(klass : longint) : longint;
begin
  NM_SETTING_WIRELESS_SECURITY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_WIRELESS_SECURITY,NMSettingWirelessSecurityClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIRELESS_SECURITY(obj : longint) : longint;
begin
  NM_IS_SETTING_WIRELESS_SECURITY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_WIRELESS_SECURITY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIRELESS_SECURITY_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_WIRELESS_SECURITY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_WIRELESS_SECURITY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIRELESS_SECURITY_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_WIRELESS_SECURITY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_WIRELESS_SECURITY,NMSettingWirelessSecurityClass);
end;


end.
