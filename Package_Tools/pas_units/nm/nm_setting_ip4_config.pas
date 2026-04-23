unit nm_setting_ip4_config;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_SETTING_IP4_CONFIG_SETTING_NAME = 'ipv4';
  NM_SETTING_IP4_CONFIG_DHCP_CLIENT_ID = 'dhcp-client-id';
  NM_SETTING_IP4_CONFIG_DHCP_FQDN = 'dhcp-fqdn';
  NM_SETTING_IP4_CONFIG_DHCP_VENDOR_CLASS_IDENTIFIER = 'dhcp-vendor-class-identifier';
  NM_SETTING_IP4_CONFIG_LINK_LOCAL = 'link-local';
  NM_SETTING_IP4_CONFIG_METHOD_AUTO = 'auto';
  NM_SETTING_IP4_CONFIG_METHOD_LINK_LOCAL = 'link-local';
  NM_SETTING_IP4_CONFIG_METHOD_MANUAL = 'manual';
  NM_SETTING_IP4_CONFIG_METHOD_SHARED = 'shared';
  NM_SETTING_IP4_CONFIG_METHOD_DISABLED = 'disabled';

type
  PNMSettingIP4LinkLocal = ^TNMSettingIP4LinkLocal;
  TNMSettingIP4LinkLocal = longint;

const
  NM_SETTING_IP4_LL_DEFAULT = 0;
  NM_SETTING_IP4_LL_AUTO = 1;
  NM_SETTING_IP4_LL_DISABLED = 2;
  NM_SETTING_IP4_LL_ENABLED = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingIP4Config = type Pointer;
  PNMSettingIP4ConfigClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_ip4_config_get_type: TGType; cdecl; external libnm;
function nm_setting_ip4_config_new: PNMSetting; cdecl; external libnm;
function nm_setting_ip4_config_get_dhcp_client_id(setting: PNMSettingIP4Config): pchar; cdecl; external libnm;
function nm_setting_ip4_config_get_dhcp_fqdn(setting: PNMSettingIP4Config): pchar; cdecl; external libnm;
function nm_setting_ip4_config_get_dhcp_vendor_class_identifier(setting: PNMSettingIP4Config): pchar; cdecl; external libnm;
function nm_setting_ip4_config_get_link_local(setting: PNMSettingIP4Config): TNMSettingIP4LinkLocal; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:26:50 ===

function NM_TYPE_SETTING_IP4_CONFIG: TGType;
function NM_SETTING_IP4_CONFIG(obj: Pointer): PNMSettingIP4Config;
function NM_SETTING_IP4_CONFIG_CLASS(klass: Pointer): PNMSettingIP4ConfigClass;
function NM_IS_SETTING_IP4_CONFIG(obj: Pointer): Tgboolean;
function NM_IS_SETTING_IP4_CONFIG_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_IP4_CONFIG_GET_CLASS(obj: Pointer): PNMSettingIP4ConfigClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_IP4_CONFIG: TGType;
begin
  NM_TYPE_SETTING_IP4_CONFIG := nm_setting_ip4_config_get_type;
end;

function NM_SETTING_IP4_CONFIG(obj: Pointer): PNMSettingIP4Config;
begin
  Result := PNMSettingIP4Config(g_type_check_instance_cast(obj, NM_TYPE_SETTING_IP4_CONFIG));
end;

function NM_SETTING_IP4_CONFIG_CLASS(klass: Pointer): PNMSettingIP4ConfigClass;
begin
  Result := PNMSettingIP4ConfigClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_IP4_CONFIG));
end;

function NM_IS_SETTING_IP4_CONFIG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_IP4_CONFIG);
end;

function NM_IS_SETTING_IP4_CONFIG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_IP4_CONFIG);
end;

function NM_SETTING_IP4_CONFIG_GET_CLASS(obj: Pointer): PNMSettingIP4ConfigClass;
begin
  Result := PNMSettingIP4ConfigClass(PGTypeInstance(obj)^.g_class);
end;



end.
