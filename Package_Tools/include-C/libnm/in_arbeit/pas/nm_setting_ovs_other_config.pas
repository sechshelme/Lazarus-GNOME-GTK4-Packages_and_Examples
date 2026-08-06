unit nm_setting_ovs_other_config;

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_SETTING_OVS_OTHER_CONFIG_SETTING_NAME = 'ovs-other-config';
  NM_SETTING_OVS_OTHER_CONFIG_DATA = 'data';

type
  PNMSettingOvsOtherConfig = type Pointer;
  PNMSettingOvsOtherConfigClass = type Pointer;

function nm_setting_ovs_other_config_get_type: TGType; cdecl; external libnm;
function nm_setting_ovs_other_config_new: PNMSetting; cdecl; external libnm;

function nm_setting_ovs_other_config_get_data_keys(setting: PNMSettingOvsOtherConfig; out_len: Pguint): Ppchar; cdecl; external libnm;
function nm_setting_ovs_other_config_get_data(setting: PNMSettingOvsOtherConfig; key: pchar): pchar; cdecl; external libnm;
procedure nm_setting_ovs_other_config_set_data(setting: PNMSettingOvsOtherConfig; key: pchar; val: pchar); cdecl; external libnm;

// === Konventiert am: 5-8-26 19:54:23 ===

function NM_TYPE_SETTING_OVS_OTHER_CONFIG: TGType;
function NM_SETTING_OVS_OTHER_CONFIG(obj: Pointer): PNMSettingOvsOtherConfig;
function NM_SETTING_OVS_OTHER_CONFIG_CLASS(klass: Pointer): PNMSettingOvsOtherConfigClass;
function NM_IS_SETTING_OVS_OTHER_CONFIG(obj: Pointer): Tgboolean;
function NM_IS_SETTING_OVS_OTHER_CONFIG_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_OVS_OTHER_CONFIG_GET_CLASS(obj: Pointer): PNMSettingOvsOtherConfigClass;

implementation

function NM_TYPE_SETTING_OVS_OTHER_CONFIG: TGType;
begin
  NM_TYPE_SETTING_OVS_OTHER_CONFIG := nm_setting_ovs_other_config_get_type;
end;

function NM_SETTING_OVS_OTHER_CONFIG(obj: Pointer): PNMSettingOvsOtherConfig;
begin
  Result := PNMSettingOvsOtherConfig(g_type_check_instance_cast(obj, NM_TYPE_SETTING_OVS_OTHER_CONFIG));
end;

function NM_SETTING_OVS_OTHER_CONFIG_CLASS(klass: Pointer): PNMSettingOvsOtherConfigClass;
begin
  Result := PNMSettingOvsOtherConfigClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_OVS_OTHER_CONFIG));
end;

function NM_IS_SETTING_OVS_OTHER_CONFIG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_OVS_OTHER_CONFIG);
end;

function NM_IS_SETTING_OVS_OTHER_CONFIG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_OVS_OTHER_CONFIG);
end;

function NM_SETTING_OVS_OTHER_CONFIG_GET_CLASS(obj: Pointer): PNMSettingOvsOtherConfigClass;
begin
  Result := PNMSettingOvsOtherConfigClass(PGTypeInstance(obj)^.g_class);
end;



end.
