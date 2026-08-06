unit nm_setting_vrf;

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_SETTING_VRF_SETTING_NAME = 'vrf';
  NM_SETTING_VRF_TABLE = 'table';

type
  PNMSettingVrf = type Pointer;
  PNMSettingVrfClass = type Pointer;

function nm_setting_vrf_get_type: TGType; cdecl; external libnm;
function nm_setting_vrf_new: PNMSetting; cdecl; external libnm;
function nm_setting_vrf_get_table(setting: PNMSettingVrf): Tguint32; cdecl; external libnm;

// === Konventiert am: 5-8-26 20:03:46 ===

function NM_TYPE_SETTING_VRF: TGType;
function NM_SETTING_VRF(obj: Pointer): PNMSettingVrf;
function NM_SETTING_VRF_CLASS(klass: Pointer): PNMSettingVrfClass;
function NM_IS_SETTING_VRF(obj: Pointer): Tgboolean;
function NM_IS_SETTING_VRF_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_VRF_GET_CLASS(obj: Pointer): PNMSettingVrfClass;

implementation

function NM_TYPE_SETTING_VRF: TGType;
begin
  NM_TYPE_SETTING_VRF := nm_setting_vrf_get_type;
end;

function NM_SETTING_VRF(obj: Pointer): PNMSettingVrf;
begin
  Result := PNMSettingVrf(g_type_check_instance_cast(obj, NM_TYPE_SETTING_VRF));
end;

function NM_SETTING_VRF_CLASS(klass: Pointer): PNMSettingVrfClass;
begin
  Result := PNMSettingVrfClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_VRF));
end;

function NM_IS_SETTING_VRF(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_VRF);
end;

function NM_IS_SETTING_VRF_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_VRF);
end;

function NM_SETTING_VRF_GET_CLASS(obj: Pointer): PNMSettingVrfClass;
begin
  Result := PNMSettingVrfClass(PGTypeInstance(obj)^.g_class);
end;



end.
