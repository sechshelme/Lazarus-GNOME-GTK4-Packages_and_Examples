unit nm_utils;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_core_types, nm_dbus_interface, nm_setting_wireless_security;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PNMVariantAttributeSpec = type Pointer;
  PPNMVariantAttributeSpec = ^PNMVariantAttributeSpec;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_utils_is_empty_ssid(ssid: Pguint8; len: Tgsize): Tgboolean; cdecl; external libnm;
function nm_utils_escape_ssid(ssid: Pguint8; len: Tgsize): pchar; cdecl; external libnm; deprecated;
function nm_utils_same_ssid(ssid1: Pguint8; len1: Tgsize; ssid2: Pguint8; len2: Tgsize; ignore_trailing_null: Tgboolean): Tgboolean; cdecl; external libnm;
function nm_utils_ssid_to_utf8(ssid: Pguint8; len: Tgsize): pchar; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PNMUtilsSecurityType = ^TNMUtilsSecurityType;
  TNMUtilsSecurityType = longint;

const
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
  {$ENDIF read_enum}

{$IFDEF read_function}
function nm_utils_security_valid(_type: TNMUtilsSecurityType; wifi_caps: TNMDeviceWifiCapabilities; have_ap: Tgboolean; adhoc: Tgboolean; ap_flags: TNM80211ApFlags;
  ap_wpa: TNM80211ApSecurityFlags; ap_rsn: TNM80211ApSecurityFlags): Tgboolean; cdecl; external libnm;
function nm_utils_ap_mode_security_valid(_type: TNMUtilsSecurityType; wifi_caps: TNMDeviceWifiCapabilities): Tgboolean; cdecl; external libnm;
function nm_utils_wep_key_valid(key: pchar; wep_type: TNMWepKeyType): Tgboolean; cdecl; external libnm;
function nm_utils_wpa_psk_valid(psk: pchar): Tgboolean; cdecl; external libnm;
function nm_utils_is_json_object(str: pchar; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_utils_ip4_dns_to_variant(dns: PPchar): PGVariant; cdecl; external libnm;
function nm_utils_ip4_dns_from_variant(value: PGVariant): PPchar; cdecl; external libnm;
function nm_utils_ip4_addresses_to_variant(addresses: PGPtrArray; gateway: pchar): PGVariant; cdecl; external libnm;
function nm_utils_ip4_addresses_from_variant(value: PGVariant; out_gateway: PPchar): PGPtrArray; cdecl; external libnm;
function nm_utils_ip4_routes_to_variant(routes: PGPtrArray): PGVariant; cdecl; external libnm;
function nm_utils_ip4_routes_from_variant(value: PGVariant): PGPtrArray; cdecl; external libnm;
function nm_utils_ip4_netmask_to_prefix(netmask: Tguint32): Tguint32; cdecl; external libnm;
function nm_utils_ip4_prefix_to_netmask(prefix: Tguint32): Tguint32; cdecl; external libnm;
function nm_utils_ip4_get_default_prefix(ip: Tguint32): Tguint32; cdecl; external libnm;
function nm_utils_ip6_dns_to_variant(dns: PPchar): PGVariant; cdecl; external libnm;
function nm_utils_ip6_dns_from_variant(value: PGVariant): PPchar; cdecl; external libnm;
function nm_utils_ip6_addresses_to_variant(addresses: PGPtrArray; gateway: pchar): PGVariant; cdecl; external libnm;
function nm_utils_ip6_addresses_from_variant(value: PGVariant; out_gateway: PPchar): PGPtrArray; cdecl; external libnm;
function nm_utils_ip6_routes_to_variant(routes: PGPtrArray): PGVariant; cdecl; external libnm;
function nm_utils_ip6_routes_from_variant(value: PGVariant): PGPtrArray; cdecl; external libnm;
function nm_utils_ip_addresses_to_variant(addresses: PGPtrArray): PGVariant; cdecl; external libnm;
function nm_utils_ip_addresses_from_variant(value: PGVariant; family: longint): PGPtrArray; cdecl; external libnm;
function nm_utils_ip_routes_to_variant(routes: PGPtrArray): PGVariant; cdecl; external libnm;
function nm_utils_ip_routes_from_variant(value: PGVariant; family: longint): PGPtrArray; cdecl; external libnm;
function nm_utils_uuid_generate: pchar; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TNMUtilsFileSearchInPathsPredicate = function(filename: pchar; user_data: Tgpointer): Tgboolean; cdecl;
  Pstat = type Pointer;
  TNMUtilsCheckFilePredicate = function(filename: pchar; stat: Pstat; user_data: Tgpointer; error: PPGError): Tgboolean; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_utils_file_search_in_paths(progname: pchar; try_first: pchar; paths: PPchar; file_test_flags: TGFileTest; predicate: TNMUtilsFileSearchInPathsPredicate;
  user_data: Tgpointer; error: PPGError): pchar; cdecl; external libnm;
function nm_utils_wifi_freq_to_channel(freq: Tguint32): Tguint32; cdecl; external libnm;
function nm_utils_wifi_channel_to_freq(channel: Tguint32; band: pchar): Tguint32; cdecl; external libnm;
function nm_utils_wifi_find_next_channel(channel: Tguint32; direction: longint; band: pchar): Tguint32; cdecl; external libnm;
function nm_utils_wifi_is_channel_valid(channel: Tguint32; band: pchar): Tgboolean; cdecl; external libnm;
function nm_utils_wifi_2ghz_freqs: Pguint; cdecl; external libnm;
function nm_utils_wifi_5ghz_freqs: Pguint; cdecl; external libnm;
function nm_utils_wifi_strength_bars(strength: Tguint8): pchar; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_enum}
const
  NM_UTILS_HWADDR_LEN_MAX = 20;
  {$ENDIF read_enum}

{$IFDEF read_function}
function nm_utils_hwaddr_len(_type: longint): Tgsize; cdecl; external libnm;
function nm_utils_hwaddr_ntoa(addr: Tgconstpointer; length: Tgsize): pchar; cdecl; external libnm;
function nm_utils_hwaddr_atoba(asc: pchar; length: Tgsize): PGByteArray; cdecl; external libnm;
function nm_utils_hwaddr_aton(asc: pchar; buffer: Tgpointer; length: Tgsize): Pguint8; cdecl; external libnm;
function nm_utils_hwaddr_valid(asc: pchar; length: Tgssize): Tgboolean; cdecl; external libnm;
function nm_utils_hwaddr_canonical(asc: pchar; length: Tgssize): pchar; cdecl; external libnm;
function nm_utils_hwaddr_matches(hwaddr1: Tgconstpointer; hwaddr1_len: Tgssize; hwaddr2: Tgconstpointer; hwaddr2_len: Tgssize): Tgboolean; cdecl; external libnm;
function nm_utils_bin2hexstr(src: Tgconstpointer; len: Tgsize; final_len: longint): pchar; cdecl; external libnm;
function nm_utils_hexstr2bin(hex: pchar): PGBytes; cdecl; external libnm;
function nm_utils_iface_valid_name(name: pchar): Tgboolean; cdecl; external libnm; deprecated;
function nm_utils_is_valid_iface_name(name: pchar; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_utils_is_uuid(str: pchar): Tgboolean; cdecl; external libnm; deprecated;
{$ENDIF read_function}

{$IFDEF read_enum}
const
  NM_UTILS_INET_ADDRSTRLEN = INET6_ADDRSTRLEN;
  {$ENDIF read_enum}

{$IFDEF read_function}
function nm_utils_inet4_ntop(inaddr: Tguint32; dst: pchar): pchar; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  Pin6_addr = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_utils_inet6_ntop(in6addr: Pin6_addr; dst: pchar): pchar; cdecl; external libnm;
function nm_utils_ipaddr_valid(family: longint; ip: pchar): Tgboolean; cdecl; external libnm;
function nm_utils_check_virtual_device_compatibility(virtual_type: TGType; other_type: TGType): Tgboolean; cdecl; external libnm;
function nm_utils_bond_mode_string_to_int(mode: pchar): longint; cdecl; external libnm;
function nm_utils_bond_mode_int_to_string(mode: longint): pchar; cdecl; external libnm;
function nm_utils_enum_to_str(_type: TGType; value: longint): pchar; cdecl; external libnm;
function nm_utils_enum_from_str(_type: TGType; str: pchar; out_value: Plongint; err_token: PPchar): Tgboolean; cdecl; external libnm;
function nm_utils_enum_get_values(_type: TGType; from: longint; to_: longint): PPchar; cdecl; external libnm;
function nm_utils_version: Tguint; cdecl; external libnm;
function nm_utils_parse_variant_attributes(_string: pchar; attr_separator: char; key_value_separator: char; ignore_unknown: Tgboolean; spec: PPNMVariantAttributeSpec; error: PPGError): PGHashTable; cdecl; external libnm;
function nm_utils_format_variant_attributes(attributes: PGHashTable; attr_separator: char; key_value_separator: char): pchar; cdecl; external libnm;

function nm_utils_tc_qdisc_from_str(str: pchar; error: PPGError): PNMTCQdisc; cdecl; external libnm;
function nm_utils_tc_qdisc_to_str(qdisc: PNMTCQdisc; error: PPGError): pchar; cdecl; external libnm;
function nm_utils_tc_action_from_str(str: pchar; error: PPGError): PNMTCAction; cdecl; external libnm;
function nm_utils_tc_action_to_str(action: PNMTCAction; error: PPGError): pchar; cdecl; external libnm;
function nm_utils_tc_tfilter_from_str(str: pchar; error: PPGError): PNMTCTfilter; cdecl; external libnm;
function nm_utils_tc_tfilter_to_str(tfilter: PNMTCTfilter; error: PPGError): pchar; cdecl; external libnm;

function nm_utils_sriov_vf_to_str(vf: PNMSriovVF; omit_index: Tgboolean; error: PPGError): pchar; cdecl; external libnm;
function nm_utils_sriov_vf_from_str(str: pchar; error: PPGError): PNMSriovVF; cdecl; external libnm;

function nm_utils_get_timestamp_msec: Tgint64; cdecl; external libnm;
function nm_utils_base64secret_decode(base64_key: pchar; required_key_len: Tgsize; out_key: Pguint8): Tgboolean; cdecl; external libnm;
procedure nm_utils_ensure_gtypes; cdecl; external libnm;
{$ENDIF read_function}

// === Konventiert am: 19-4-26 19:20:31 ===


implementation



end.
