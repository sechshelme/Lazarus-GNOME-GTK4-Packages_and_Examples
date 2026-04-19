
unit nm-utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-utils.h
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
PGByteArray  = ^GByteArray;
PGBytes  = ^GBytes;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
PGPtrArray  = ^GPtrArray;
Pguint  = ^guint;
Pguint8  = ^guint8;
PGVariant  = ^GVariant;
Pin6_addr  = ^in6_addr;
Plongint  = ^longint;
PNMSriovVF  = ^NMSriovVF;
PNMTCAction  = ^NMTCAction;
PNMTCQdisc  = ^NMTCQdisc;
PNMTCTfilter  = ^NMTCTfilter;
PNMUtilsSecurityType  = ^NMUtilsSecurityType;
PNMVariantAttributeSpec  = ^NMVariantAttributeSpec;
Pstat  = ^stat;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2005 - 2017 Red Hat, Inc.
  }
{$ifndef __NM_UTILS_H__}
{$define __NM_UTILS_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include <glib.h>}
{$include "nm-core-enum-types.h"}
{$include "nm-setting-sriov.h"}
{$include "nm-setting-tc-config.h"}
{$include "nm-setting-wireless-security.h"}
{*************************************************************************** }
type
{ SSID helpers  }
(* Const before type ignored *)

function nm_utils_is_empty_ssid(ssid:Pguint8; len:Tgsize):Tgboolean;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_46 }
(* Const before type ignored *)
(* Const before type ignored *)
function nm_utils_escape_ssid(ssid:Pguint8; len:Tgsize):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_utils_same_ssid(ssid1:Pguint8; len1:Tgsize; ssid2:Pguint8; len2:Tgsize; ignore_trailing_null:Tgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_utils_ssid_to_utf8(ssid:Pguint8; len:Tgsize):Pchar;cdecl;external;
{*
 * NMUtilsSecurityType:
 * @NMU_SEC_INVALID: unknown or invalid security, placeholder and not used
 * @NMU_SEC_NONE: unencrypted and open
 * @NMU_SEC_STATIC_WEP: static WEP keys are used for encryption
 * @NMU_SEC_LEAP: Cisco LEAP is used for authentication and for generating the
 * dynamic WEP keys automatically
 * @NMU_SEC_DYNAMIC_WEP: standard 802.1x is used for authentication and
 * generating the dynamic WEP keys automatically
 * @NMU_SEC_WPA_PSK: WPA1 is used with Pre-Shared Keys (PSK)
 * @NMU_SEC_WPA_ENTERPRISE: WPA1 is used with 802.1x authentication
 * @NMU_SEC_WPA2_PSK: WPA2/RSN is used with Pre-Shared Keys (PSK)
 * @NMU_SEC_WPA2_ENTERPRISE: WPA2 is used with 802.1x authentication
 * @NMU_SEC_SAE: is used with WPA3 Enterprise
 * @NMU_SEC_OWE: is used with Enhanced Open
 * @NMU_SEC_WPA3_SUITE_B_192: is used with WPA3 Enterprise Suite-B 192 bit mode. Since: 1.30.
 *
 * Describes generic security mechanisms that 802.11 access points may offer.
 * Used with nm_utils_security_valid() for checking whether a given access
 * point is compatible with a network device.
 * }
type
  PNMUtilsSecurityType = ^TNMUtilsSecurityType;
  TNMUtilsSecurityType =  Longint;
  Const
    NMU_SEC_INVALID = 0;
    NMU_SEC_NONE = 1;
    NMU_SEC_STATIC_WEP = 2;
    NMU_SEC_LEAP = 3;
    NMU_SEC_DYNAMIC_WEP = 4;
    NMU_SEC_WPA_PSK = 5;
    NMU_SEC_WPA_ENTERPRISE = 6;
    NMU_SEC_WPA2_PSK = 7;
    NMU_SEC_WPA2_ENTERPRISE = 8;
    NMU_SEC_SAE = 9;
    NMU_SEC_OWE = 10;
    NMU_SEC_WPA3_SUITE_B_192 = 11;
;

function nm_utils_security_valid(_type:TNMUtilsSecurityType; wifi_caps:TNMDeviceWifiCapabilities; have_ap:Tgboolean; adhoc:Tgboolean; ap_flags:TNM80211ApFlags; 
           ap_wpa:TNM80211ApSecurityFlags; ap_rsn:TNM80211ApSecurityFlags):Tgboolean;cdecl;external;
function nm_utils_ap_mode_security_valid(_type:TNMUtilsSecurityType; wifi_caps:TNMDeviceWifiCapabilities):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_utils_wep_key_valid(key:Pchar; wep_type:TNMWepKeyType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_utils_wpa_psk_valid(psk:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_utils_is_json_object(str:Pchar; error:PPGError):Tgboolean;cdecl;external;
function nm_utils_ip4_dns_to_variant(dns:PPchar):PGVariant;cdecl;external;
function nm_utils_ip4_dns_from_variant(value:PGVariant):^Pchar;cdecl;external;
(* Const before type ignored *)
function nm_utils_ip4_addresses_to_variant(addresses:PGPtrArray; gateway:Pchar):PGVariant;cdecl;external;
function nm_utils_ip4_addresses_from_variant(value:PGVariant; out_gateway:PPchar):PGPtrArray;cdecl;external;
function nm_utils_ip4_routes_to_variant(routes:PGPtrArray):PGVariant;cdecl;external;
function nm_utils_ip4_routes_from_variant(value:PGVariant):PGPtrArray;cdecl;external;
function nm_utils_ip4_netmask_to_prefix(netmask:Tguint32):Tguint32;cdecl;external;
function nm_utils_ip4_prefix_to_netmask(prefix:Tguint32):Tguint32;cdecl;external;
function nm_utils_ip4_get_default_prefix(ip:Tguint32):Tguint32;cdecl;external;
function nm_utils_ip6_dns_to_variant(dns:PPchar):PGVariant;cdecl;external;
function nm_utils_ip6_dns_from_variant(value:PGVariant):^Pchar;cdecl;external;
(* Const before type ignored *)
function nm_utils_ip6_addresses_to_variant(addresses:PGPtrArray; gateway:Pchar):PGVariant;cdecl;external;
function nm_utils_ip6_addresses_from_variant(value:PGVariant; out_gateway:PPchar):PGPtrArray;cdecl;external;
function nm_utils_ip6_routes_to_variant(routes:PGPtrArray):PGVariant;cdecl;external;
function nm_utils_ip6_routes_from_variant(value:PGVariant):PGPtrArray;cdecl;external;
function nm_utils_ip_addresses_to_variant(addresses:PGPtrArray):PGVariant;cdecl;external;
function nm_utils_ip_addresses_from_variant(value:PGVariant; family:longint):PGPtrArray;cdecl;external;
function nm_utils_ip_routes_to_variant(routes:PGPtrArray):PGVariant;cdecl;external;
function nm_utils_ip_routes_from_variant(value:PGVariant; family:longint):PGPtrArray;cdecl;external;
function nm_utils_uuid_generate:Pchar;cdecl;external;
(* Const before type ignored *)
type

  TNMUtilsFileSearchInPathsPredicate = function (filename:Pchar; user_data:Tgpointer):Tgboolean;cdecl;
  Pstat = ^Tstat;
  Tstat = record
      {undefined structure}
    end;

(* Const before type ignored *)
(* Const before type ignored *)

  TNMUtilsCheckFilePredicate = function (filename:Pchar; stat:Pstat; user_data:Tgpointer; error:PPGError):Tgboolean;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)

function nm_utils_file_search_in_paths(progname:Pchar; try_first:Pchar; paths:PPchar; file_test_flags:TGFileTest; predicate:TNMUtilsFileSearchInPathsPredicate; 
           user_data:Tgpointer; error:PPGError):Pchar;cdecl;external;
function nm_utils_wifi_freq_to_channel(freq:Tguint32):Tguint32;cdecl;external;
(* Const before type ignored *)
function nm_utils_wifi_channel_to_freq(channel:Tguint32; band:Pchar):Tguint32;cdecl;external;
function nm_utils_wifi_find_next_channel(channel:Tguint32; direction:longint; band:Pchar):Tguint32;cdecl;external;
(* Const before type ignored *)
function nm_utils_wifi_is_channel_valid(channel:Tguint32; band:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_utils_wifi_2ghz_freqs:Pguint;cdecl;external;
(* Const before type ignored *)
function nm_utils_wifi_5ghz_freqs:Pguint;cdecl;external;
(* Const before type ignored *)
function nm_utils_wifi_strength_bars(strength:Tguint8):Pchar;cdecl;external;
{*
 * NM_UTILS_HWADDR_LEN_MAX:
 *
 * The maximum length of hardware addresses handled by NetworkManager itself,
 * nm_utils_hwaddr_len(), and nm_utils_hwaddr_aton().
  }
{ INFINIBAND_ALEN  }
const
  NM_UTILS_HWADDR_LEN_MAX = 20;  

function nm_utils_hwaddr_len(_type:longint):Tgsize;cdecl;external;
function nm_utils_hwaddr_ntoa(addr:Tgconstpointer; length:Tgsize):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_utils_hwaddr_atoba(asc:Pchar; length:Tgsize):PGByteArray;cdecl;external;
(* Const before type ignored *)
function nm_utils_hwaddr_aton(asc:Pchar; buffer:Tgpointer; length:Tgsize):Pguint8;cdecl;external;
(* Const before type ignored *)
function nm_utils_hwaddr_valid(asc:Pchar; length:Tgssize):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_utils_hwaddr_canonical(asc:Pchar; length:Tgssize):Pchar;cdecl;external;
function nm_utils_hwaddr_matches(hwaddr1:Tgconstpointer; hwaddr1_len:Tgssize; hwaddr2:Tgconstpointer; hwaddr2_len:Tgssize):Tgboolean;cdecl;external;
function nm_utils_bin2hexstr(src:Tgconstpointer; len:Tgsize; final_len:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_utils_hexstr2bin(hex:Pchar):PGBytes;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_6_FOR(nm_utils_is_valid_iface_name) }
(* Const before type ignored *)
function nm_utils_iface_valid_name(name:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_utils_is_valid_iface_name(name:Pchar; error:PPGError):Tgboolean;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_32 }
(* Const before type ignored *)
function nm_utils_is_uuid(str:Pchar):Tgboolean;cdecl;external;
{*
 * NM_UTILS_INET_ADDRSTRLEN:
 *
 * Defines the minimal length for a char buffer that is suitable as @dst argument
 * for both nm_utils_inet4_ntop() and nm_utils_inet6_ntop().
 * }
const
  NM_UTILS_INET_ADDRSTRLEN = INET6_ADDRSTRLEN;  
(* Const before type ignored *)

function nm_utils_inet4_ntop(inaddr:Tguint32; dst:Pchar):Pchar;cdecl;external;
type
  Pin6_addr = ^Tin6_addr;
  Tin6_addr = record
      {undefined structure}
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function nm_utils_inet6_ntop(in6addr:Pin6_addr; dst:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_utils_ipaddr_valid(family:longint; ip:Pchar):Tgboolean;cdecl;external;
function nm_utils_check_virtual_device_compatibility(virtual_type:TGType; other_type:TGType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_utils_bond_mode_string_to_int(mode:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function nm_utils_bond_mode_int_to_string(mode:longint):Pchar;cdecl;external;
function nm_utils_enum_to_str(_type:TGType; value:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_utils_enum_from_str(_type:TGType; str:Pchar; out_value:Plongint; err_token:PPchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_utils_enum_get_values(_type:TGType; from:longint; to:longint):^Pchar;cdecl;external;
function nm_utils_version:Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_utils_parse_variant_attributes(_string:Pchar; attr_separator:char; key_value_separator:char; ignore_unknown:Tgboolean; spec:PPNMVariantAttributeSpec; 
           error:PPGError):PGHashTable;cdecl;external;
function nm_utils_format_variant_attributes(attributes:PGHashTable; attr_separator:char; key_value_separator:char):Pchar;cdecl;external;
{*************************************************************************** }
(* Const before type ignored *)
function nm_utils_tc_qdisc_from_str(str:Pchar; error:PPGError):PNMTCQdisc;cdecl;external;
function nm_utils_tc_qdisc_to_str(qdisc:PNMTCQdisc; error:PPGError):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_utils_tc_action_from_str(str:Pchar; error:PPGError):PNMTCAction;cdecl;external;
function nm_utils_tc_action_to_str(action:PNMTCAction; error:PPGError):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_utils_tc_tfilter_from_str(str:Pchar; error:PPGError):PNMTCTfilter;cdecl;external;
function nm_utils_tc_tfilter_to_str(tfilter:PNMTCTfilter; error:PPGError):Pchar;cdecl;external;
{*************************************************************************** }
(* Const before type ignored *)
function nm_utils_sriov_vf_to_str(vf:PNMSriovVF; omit_index:Tgboolean; error:PPGError):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_utils_sriov_vf_from_str(str:Pchar; error:PPGError):PNMSriovVF;cdecl;external;
{*************************************************************************** }
function nm_utils_get_timestamp_msec:Tgint64;cdecl;external;
(* Const before type ignored *)
function nm_utils_base64secret_decode(base64_key:Pchar; required_key_len:Tgsize; out_key:Pguint8):Tgboolean;cdecl;external;
procedure nm_utils_ensure_gtypes;cdecl;external;
{$endif}
{ __NM_UTILS_H__  }

implementation


end.
