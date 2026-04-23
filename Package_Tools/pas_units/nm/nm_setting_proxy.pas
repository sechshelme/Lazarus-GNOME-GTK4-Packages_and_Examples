unit nm_setting_proxy;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
type
  PNMSettingProxyMethod = ^TNMSettingProxyMethod;
  TNMSettingProxyMethod = longint;

const
  NM_SETTING_PROXY_METHOD_NONE = 0;
  NM_SETTING_PROXY_METHOD_AUTO = 1;

const
  NM_SETTING_PROXY_SETTING_NAME = 'proxy';
  NM_SETTING_PROXY_METHOD = 'method';
  NM_SETTING_PROXY_BROWSER_ONLY = 'browser-only';
  NM_SETTING_PROXY_PAC_URL = 'pac-url';
  NM_SETTING_PROXY_PAC_SCRIPT = 'pac-script';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingProxy = type Pointer;
  PNMSettingProxyClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_proxy_get_type: TGType; cdecl; external libnm;
function nm_setting_proxy_new: PNMSetting; cdecl; external libnm;
function nm_setting_proxy_get_method(setting: PNMSettingProxy): TNMSettingProxyMethod; cdecl; external libnm;
function nm_setting_proxy_get_browser_only(setting: PNMSettingProxy): Tgboolean; cdecl; external libnm;
function nm_setting_proxy_get_pac_url(setting: PNMSettingProxy): pchar; cdecl; external libnm;
function nm_setting_proxy_get_pac_script(setting: PNMSettingProxy): pchar; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:25:20 ===

function NM_TYPE_SETTING_PROXY: TGType;
function NM_SETTING_PROXY(obj: Pointer): PNMSettingProxy;
function NM_SETTING_PROXY_CLASS(klass: Pointer): PNMSettingProxyClass;
function NM_IS_SETTING_PROXY(obj: Pointer): Tgboolean;
function NM_IS_SETTING_PROXY_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_PROXY_GET_CLASS(obj: Pointer): PNMSettingProxyClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_PROXY: TGType;
begin
  NM_TYPE_SETTING_PROXY := nm_setting_proxy_get_type;
end;

function NM_SETTING_PROXY(obj: Pointer): PNMSettingProxy;
begin
  Result := PNMSettingProxy(g_type_check_instance_cast(obj, NM_TYPE_SETTING_PROXY));
end;

function NM_SETTING_PROXY_CLASS(klass: Pointer): PNMSettingProxyClass;
begin
  Result := PNMSettingProxyClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_PROXY));
end;

function NM_IS_SETTING_PROXY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_PROXY);
end;

function NM_IS_SETTING_PROXY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_PROXY);
end;

function NM_SETTING_PROXY_GET_CLASS(obj: Pointer): PNMSettingProxyClass;
begin
  Result := PNMSettingProxyClass(PGTypeInstance(obj)^.g_class);
end;



end.
