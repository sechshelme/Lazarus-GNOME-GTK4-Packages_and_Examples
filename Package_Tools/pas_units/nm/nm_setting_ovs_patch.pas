unit nm_setting_ovs_patch;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  NM_SETTING_OVS_PATCH_SETTING_NAME = 'ovs-patch';
  NM_SETTING_OVS_PATCH_PEER = 'peer';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingOvsPatch = type Pointer;
  PNMSettingOvsPatchClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_struct}
function nm_setting_ovs_patch_get_type: TGType; cdecl; external libnm;
function nm_setting_ovs_patch_new: PNMSetting; cdecl; external libnm;
function nm_setting_ovs_patch_get_peer(self: PNMSettingOvsPatch): pchar; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:25:39 ===

function NM_TYPE_SETTING_OVS_PATCH: TGType;
function NM_SETTING_OVS_PATCH(obj: Pointer): PNMSettingOvsPatch;
function NM_SETTING_OVS_PATCH_CLASS(klass: Pointer): PNMSettingOvsPatchClass;
function NM_IS_SETTING_OVS_PATCH(obj: Pointer): Tgboolean;
function NM_IS_SETTING_OVS_PATCH_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_OVS_PATCH_GET_CLASS(obj: Pointer): PNMSettingOvsPatchClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_OVS_PATCH: TGType;
begin
  NM_TYPE_SETTING_OVS_PATCH := nm_setting_ovs_patch_get_type;
end;

function NM_SETTING_OVS_PATCH(obj: Pointer): PNMSettingOvsPatch;
begin
  Result := PNMSettingOvsPatch(g_type_check_instance_cast(obj, NM_TYPE_SETTING_OVS_PATCH));
end;

function NM_SETTING_OVS_PATCH_CLASS(klass: Pointer): PNMSettingOvsPatchClass;
begin
  Result := PNMSettingOvsPatchClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_OVS_PATCH));
end;

function NM_IS_SETTING_OVS_PATCH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_OVS_PATCH);
end;

function NM_IS_SETTING_OVS_PATCH_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_OVS_PATCH);
end;

function NM_SETTING_OVS_PATCH_GET_CLASS(obj: Pointer): PNMSettingOvsPatchClass;
begin
  Result := PNMSettingOvsPatchClass(PGTypeInstance(obj)^.g_class);
end;



end.
