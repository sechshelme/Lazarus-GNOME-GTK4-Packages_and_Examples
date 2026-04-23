unit nm_setting_veth;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_SETTING_VETH_SETTING_NAME = 'veth';
  NM_SETTING_VETH_PEER = 'peer';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingVeth = type Pointer;
  PNMSettingVethClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_veth_get_type: TGType; cdecl; external libnm;
function nm_setting_veth_new: PNMSetting; cdecl; external libnm;
function nm_setting_veth_get_peer(setting: PNMSettingVeth): pchar; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:24:31 ===

function NM_TYPE_SETTING_VETH: TGType;
function NM_SETTING_VETH(obj: Pointer): PNmSettingVeth;
function NM_SETTING_VETH_CLASS(klass: Pointer): PNmSettingVethClass;
function NM_IS_SETTING_VETH(obj: Pointer): Tgboolean;
function NM_IS_SETTING_VETH_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_VETH_GET_CLASS(obj: Pointer): PNmSettingVethClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_VETH: TGType;
begin
  Result := nm_setting_veth_get_type;
end;

function NM_SETTING_VETH(obj: Pointer): PNmSettingVeth;
begin
  Result := PNmSettingVeth(g_type_check_instance_cast(obj, NM_TYPE_SETTING_VETH));
end;

function NM_SETTING_VETH_CLASS(klass: Pointer): PNmSettingVethClass;
begin
  Result := PNmSettingVethClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_VETH));
end;

function NM_IS_SETTING_VETH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_VETH);
end;

function NM_IS_SETTING_VETH_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_VETH);
end;

function NM_SETTING_VETH_GET_CLASS(obj: Pointer): PNmSettingVethClass;
begin
  Result := PNmSettingVethClass(PGTypeInstance(obj)^.g_class);
end;



end.
