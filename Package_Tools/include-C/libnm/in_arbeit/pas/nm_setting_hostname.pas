unit nm_setting_hostname;

interface

uses
  fp_glib2, fp_nm, nm_setting, nm_dbus_interface;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_SETTING_HOSTNAME_SETTING_NAME = 'hostname';
  NM_SETTING_HOSTNAME_PRIORITY = 'priority';
  NM_SETTING_HOSTNAME_FROM_DHCP = 'from-dhcp';
  NM_SETTING_HOSTNAME_FROM_DNS_LOOKUP = 'from-dns-lookup';
  NM_SETTING_HOSTNAME_ONLY_FROM_DEFAULT = 'only-from-default';

type
  PNMSettingHostname = type Pointer;
  PNMSettingHostnameClass = type Pointer;

function nm_setting_hostname_get_type: TGType; cdecl; external libnm;
function nm_setting_hostname_new: PNMSetting; cdecl; external libnm;
function nm_setting_hostname_get_priority(setting: PNMSettingHostname): longint; cdecl; external libnm;
function nm_setting_hostname_get_from_dhcp(setting: PNMSettingHostname): TNMTernary; cdecl; external libnm;
function nm_setting_hostname_get_from_dns_lookup(setting: PNMSettingHostname): TNMTernary; cdecl; external libnm;
function nm_setting_hostname_get_only_from_default(setting: PNMSettingHostname): TNMTernary; cdecl; external libnm;

// === Konventiert am: 5-8-26 19:45:30 ===

function NM_TYPE_SETTING_HOSTNAME: TGType;
function NM_SETTING_HOSTNAME(obj: Pointer): PNMSettingHostname;
function NM_SETTING_HOSTNAME_CLASS(klass: Pointer): PNMSettingHostnameClass;
function NM_IS_SETTING_HOSTNAME(obj: Pointer): Tgboolean;
function NM_IS_SETTING_HOSTNAME_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_HOSTNAME_GET_CLASS(obj: Pointer): PNMSettingHostnameClass;

implementation

function NM_TYPE_SETTING_HOSTNAME: TGType;
begin
  NM_TYPE_SETTING_HOSTNAME := nm_setting_hostname_get_type;
end;

function NM_SETTING_HOSTNAME(obj: Pointer): PNMSettingHostname;
begin
  Result := PNMSettingHostname(g_type_check_instance_cast(obj, NM_TYPE_SETTING_HOSTNAME));
end;

function NM_SETTING_HOSTNAME_CLASS(klass: Pointer): PNMSettingHostnameClass;
begin
  Result := PNMSettingHostnameClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_HOSTNAME));
end;

function NM_IS_SETTING_HOSTNAME(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_HOSTNAME);
end;

function NM_IS_SETTING_HOSTNAME_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_HOSTNAME);
end;

function NM_SETTING_HOSTNAME_GET_CLASS(obj: Pointer): PNMSettingHostnameClass;
begin
  Result := PNMSettingHostnameClass(PGTypeInstance(obj)^.g_class);
end;



end.
