

  {$IFDEF read_enum}
const
  NM_SETTING_IP6_CONFIG_SETTING_NAME = 'ipv6';
  NM_SETTING_IP6_CONFIG_IP6_PRIVACY = 'ip6-privacy';
  NM_SETTING_IP6_CONFIG_ADDR_GEN_MODE = 'addr-gen-mode';
  NM_SETTING_IP6_CONFIG_TOKEN = 'token';
  NM_SETTING_IP6_CONFIG_DHCP_DUID = 'dhcp-duid';
  NM_SETTING_IP6_CONFIG_RA_TIMEOUT = 'ra-timeout';
  NM_SETTING_IP6_CONFIG_MTU = 'mtu';
  NM_SETTING_IP6_CONFIG_DHCP_PD_HINT = 'dhcp-pd-hint';
  NM_SETTING_IP6_CONFIG_METHOD_IGNORE = 'ignore';
  NM_SETTING_IP6_CONFIG_METHOD_AUTO = 'auto';
  NM_SETTING_IP6_CONFIG_METHOD_DHCP = 'dhcp';
  NM_SETTING_IP6_CONFIG_METHOD_LINK_LOCAL = 'link-local';
  NM_SETTING_IP6_CONFIG_METHOD_MANUAL = 'manual';
  NM_SETTING_IP6_CONFIG_METHOD_SHARED = 'shared';
  NM_SETTING_IP6_CONFIG_METHOD_DISABLED = 'disabled';

type
  PNMSettingIP6ConfigPrivacy = ^TNMSettingIP6ConfigPrivacy;
  TNMSettingIP6ConfigPrivacy = longint;

const
  NM_SETTING_IP6_CONFIG_PRIVACY_UNKNOWN = -(1);
  NM_SETTING_IP6_CONFIG_PRIVACY_DISABLED = 0;
  NM_SETTING_IP6_CONFIG_PRIVACY_PREFER_PUBLIC_ADDR = 1;
  NM_SETTING_IP6_CONFIG_PRIVACY_PREFER_TEMP_ADDR = 2;

type
  PNMSettingIP6ConfigAddrGenMode = ^TNMSettingIP6ConfigAddrGenMode;
  TNMSettingIP6ConfigAddrGenMode = longint;

const
  NM_SETTING_IP6_CONFIG_ADDR_GEN_MODE_EUI64 = 0;
  NM_SETTING_IP6_CONFIG_ADDR_GEN_MODE_STABLE_PRIVACY = 1;
  NM_SETTING_IP6_CONFIG_ADDR_GEN_MODE_DEFAULT_OR_EUI64 = 2;
  NM_SETTING_IP6_CONFIG_ADDR_GEN_MODE_DEFAULT = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingIP6Config = type Pointer;
  PNMSettingIP6ConfigClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_ip6_config_get_type: TGType; cdecl; external libnm;
function nm_setting_ip6_config_new: PNMSetting; cdecl; external libnm;
function nm_setting_ip6_config_get_ip6_privacy(setting: PNMSettingIP6Config): TNMSettingIP6ConfigPrivacy; cdecl; external libnm;
function nm_setting_ip6_config_get_addr_gen_mode(setting: PNMSettingIP6Config): TNMSettingIP6ConfigAddrGenMode; cdecl; external libnm;
function nm_setting_ip6_config_get_token(setting: PNMSettingIP6Config): pchar; cdecl; external libnm;
function nm_setting_ip6_config_get_dhcp_duid(setting: PNMSettingIP6Config): pchar; cdecl; external libnm;
function nm_setting_ip6_config_get_ra_timeout(setting: PNMSettingIP6Config): Tgint32; cdecl; external libnm;
function nm_setting_ip6_config_get_mtu(setting: PNMSettingIP6Config): Tguint32; cdecl; external libnm;
function nm_setting_ip6_config_get_dhcp_pd_hint(setting: PNMSettingIP6Config): pchar; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:26:45 ===

function NM_TYPE_SETTING_IP6_CONFIG: TGType;
function NM_SETTING_IP6_CONFIG(obj: Pointer): PNMSettingIP6Config;
function NM_SETTING_IP6_CONFIG_CLASS(klass: Pointer): PNMSettingIP6ConfigClass;
function NM_IS_SETTING_IP6_CONFIG(obj: Pointer): Tgboolean;
function NM_IS_SETTING_IP6_CONFIG_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_IP6_CONFIG_GET_CLASS(obj: Pointer): PNMSettingIP6ConfigClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_IP6_CONFIG: TGType;
begin
  NM_TYPE_SETTING_IP6_CONFIG := nm_setting_ip6_config_get_type;
end;

function NM_SETTING_IP6_CONFIG(obj: Pointer): PNMSettingIP6Config;
begin
  Result := PNMSettingIP6Config(g_type_check_instance_cast(obj, NM_TYPE_SETTING_IP6_CONFIG));
end;

function NM_SETTING_IP6_CONFIG_CLASS(klass: Pointer): PNMSettingIP6ConfigClass;
begin
  Result := PNMSettingIP6ConfigClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_IP6_CONFIG));
end;

function NM_IS_SETTING_IP6_CONFIG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_IP6_CONFIG);
end;

function NM_IS_SETTING_IP6_CONFIG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_IP6_CONFIG);
end;

function NM_SETTING_IP6_CONFIG_GET_CLASS(obj: Pointer): PNMSettingIP6ConfigClass;
begin
  Result := PNMSettingIP6ConfigClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
