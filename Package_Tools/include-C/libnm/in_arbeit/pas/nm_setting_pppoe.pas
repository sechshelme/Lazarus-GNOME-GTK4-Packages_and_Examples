unit nm_setting_pppoe;

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_SETTING_PPPOE_SETTING_NAME = 'pppoe';
  NM_SETTING_PPPOE_PARENT = 'parent';
  NM_SETTING_PPPOE_SERVICE = 'service';
  NM_SETTING_PPPOE_USERNAME = 'username';
  NM_SETTING_PPPOE_PASSWORD = 'password';
  NM_SETTING_PPPOE_PASSWORD_FLAGS = 'password-flags';

type
  PNMSettingPppoe = type Pointer;
  PNMSettingPppoeClass = type Pointer;

function nm_setting_pppoe_get_type: TGType; cdecl; external libnm;
function nm_setting_pppoe_new: PNMSetting; cdecl; external libnm;
function nm_setting_pppoe_get_parent(setting: PNMSettingPppoe): pchar; cdecl; external libnm;
function nm_setting_pppoe_get_service(setting: PNMSettingPppoe): pchar; cdecl; external libnm;
function nm_setting_pppoe_get_username(setting: PNMSettingPppoe): pchar; cdecl; external libnm;
function nm_setting_pppoe_get_password(setting: PNMSettingPppoe): pchar; cdecl; external libnm;
function nm_setting_pppoe_get_password_flags(setting: PNMSettingPppoe): TNMSettingSecretFlags; cdecl; external libnm;

// === Konventiert am: 5-8-26 19:54:10 ===

function NM_TYPE_SETTING_PPPOE: TGType;
function NM_SETTING_PPPOE(obj: Pointer): PNMSettingPppoe;
function NM_SETTING_PPPOE_CLASS(klass: Pointer): PNMSettingPppoeClass;
function NM_IS_SETTING_PPPOE(obj: Pointer): Tgboolean;
function NM_IS_SETTING_PPPOE_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_PPPOE_GET_CLASS(obj: Pointer): PNMSettingPppoeClass;

implementation

function NM_TYPE_SETTING_PPPOE: TGType;
begin
  NM_TYPE_SETTING_PPPOE := nm_setting_pppoe_get_type;
end;

function NM_SETTING_PPPOE(obj: Pointer): PNMSettingPppoe;
begin
  Result := PNMSettingPppoe(g_type_check_instance_cast(obj, NM_TYPE_SETTING_PPPOE));
end;

function NM_SETTING_PPPOE_CLASS(klass: Pointer): PNMSettingPppoeClass;
begin
  Result := PNMSettingPppoeClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_PPPOE));
end;

function NM_IS_SETTING_PPPOE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_PPPOE);
end;

function NM_IS_SETTING_PPPOE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_PPPOE);
end;

function NM_SETTING_PPPOE_GET_CLASS(obj: Pointer): PNMSettingPppoeClass;
begin
  Result := PNMSettingPppoeClass(PGTypeInstance(obj)^.g_class);
end;



end.
