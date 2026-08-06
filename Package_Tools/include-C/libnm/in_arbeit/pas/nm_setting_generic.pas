unit nm_setting_generic;

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_SETTING_GENERIC_SETTING_NAME = 'generic';
  NM_SETTING_GENERIC_DEVICE_HANDLER = 'device-handler';

type
  PNMSettingGeneric = type Pointer;
  PNMSettingGenericClass = type Pointer;

function nm_setting_generic_get_type: TGType; cdecl; external libnm;
function nm_setting_generic_new: PNMSetting; cdecl; external libnm;
function nm_setting_generic_get_device_handler(setting: PNMSettingGeneric): pchar; cdecl; external libnm;

// === Konventiert am: 5-8-26 19:45:40 ===

function NM_TYPE_SETTING_GENERIC: TGType;
function NM_SETTING_GENERIC(obj: Pointer): PNMSettingGeneric;
function NM_SETTING_GENERIC_CLASS(klass: Pointer): PNMSettingGenericClass;
function NM_IS_SETTING_GENERIC(obj: Pointer): Tgboolean;
function NM_IS_SETTING_GENERIC_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_GENERIC_GET_CLASS(obj: Pointer): PNMSettingGenericClass;

implementation

function NM_TYPE_SETTING_GENERIC: TGType;
begin
  NM_TYPE_SETTING_GENERIC := nm_setting_generic_get_type;
end;

function NM_SETTING_GENERIC(obj: Pointer): PNMSettingGeneric;
begin
  Result := PNMSettingGeneric(g_type_check_instance_cast(obj, NM_TYPE_SETTING_GENERIC));
end;

function NM_SETTING_GENERIC_CLASS(klass: Pointer): PNMSettingGenericClass;
begin
  Result := PNMSettingGenericClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_GENERIC));
end;

function NM_IS_SETTING_GENERIC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_GENERIC);
end;

function NM_IS_SETTING_GENERIC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_GENERIC);
end;

function NM_SETTING_GENERIC_GET_CLASS(obj: Pointer): PNMSettingGenericClass;
begin
  Result := PNMSettingGenericClass(PGTypeInstance(obj)^.g_class);
end;



end.
