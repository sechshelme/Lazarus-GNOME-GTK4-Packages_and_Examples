unit nm_setting_veth;

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_SETTING_VETH_SETTING_NAME = 'veth';
  NM_SETTING_VETH_PEER = 'peer';

type
  PNMSettingVeth = type Pointer;
  PNMSettingVethcClass = type Pointer;

function nm_setting_veth_get_type: TGType; cdecl; external libnm;
function nm_setting_veth_new: PNMSetting; cdecl; external libnm;
function nm_setting_veth_get_peer(setting: PNMSettingVeth): pchar; cdecl; external libnm;

// === Konventiert am: 5-8-26 19:58:17 ===

function NM_TYPE_SETTING_VETH: TGType;
function NM_SETTING_VETH(obj: Pointer): PNMSettingVeth;
function NM_IS_SETTING_VETH(obj: Pointer): Tgboolean;
function NM_IS_SETTING_VETH_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_VETH_GET_CLASS(obj: Pointer): PNMSettingVethcClass;

implementation

function NM_TYPE_SETTING_VETH: TGType;
begin
  NM_TYPE_SETTING_VETH := nm_setting_veth_get_type;
end;

function NM_SETTING_VETH(obj: Pointer): PNMSettingVeth;
begin
  Result := PNMSettingVeth(g_type_check_instance_cast(obj, NM_TYPE_SETTING_VETH));
end;

function NM_IS_SETTING_VETH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_VETH);
end;

function NM_IS_SETTING_VETH_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_VETH);
end;

function NM_SETTING_VETH_GET_CLASS(obj: Pointer): PNMSettingVethcClass;
begin
  Result := (PGTypeInstance(obj)^.g_class);
end;



end.
