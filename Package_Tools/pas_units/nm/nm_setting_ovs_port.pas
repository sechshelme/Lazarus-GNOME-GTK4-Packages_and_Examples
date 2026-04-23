unit nm_setting_ovs_port;

{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_SETTING_OVS_PORT_SETTING_NAME = 'ovs-port';
  NM_SETTING_OVS_PORT_VLAN_MODE = 'vlan-mode';
  NM_SETTING_OVS_PORT_TAG = 'tag';
  NM_SETTING_OVS_PORT_TRUNKS = 'trunks';
  NM_SETTING_OVS_PORT_LACP = 'lacp';
  NM_SETTING_OVS_PORT_BOND_MODE = 'bond-mode';
  NM_SETTING_OVS_PORT_BOND_UPDELAY = 'bond-updelay';
  NM_SETTING_OVS_PORT_BOND_DOWNDELAY = 'bond-downdelay';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingOvsPort = type Pointer;
  PNMSettingOvsPortClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_ovs_port_get_type: TGType; cdecl; external libnm;
function nm_setting_ovs_port_new: PNMSetting; cdecl; external libnm;
function nm_setting_ovs_port_get_vlan_mode(self: PNMSettingOvsPort): pchar; cdecl; external libnm;
function nm_setting_ovs_port_get_tag(self: PNMSettingOvsPort): Tguint; cdecl; external libnm;
function nm_setting_ovs_port_get_lacp(self: PNMSettingOvsPort): pchar; cdecl; external libnm;
function nm_setting_ovs_port_get_bond_mode(self: PNMSettingOvsPort): pchar; cdecl; external libnm;
function nm_setting_ovs_port_get_bond_updelay(self: PNMSettingOvsPort): Tguint; cdecl; external libnm;
function nm_setting_ovs_port_get_bond_downdelay(self: PNMSettingOvsPort): Tguint; cdecl; external libnm;
procedure nm_setting_ovs_port_add_trunk(setting: PNMSettingOvsPort; trunk: PNMRange); cdecl; external libnm;
function nm_setting_ovs_port_get_num_trunks(setting: PNMSettingOvsPort): Tguint; cdecl; external libnm;
function nm_setting_ovs_port_get_trunk(setting: PNMSettingOvsPort; idx: Tguint): PNMRange; cdecl; external libnm;
procedure nm_setting_ovs_port_remove_trunk(setting: PNMSettingOvsPort; idx: Tguint); cdecl; external libnm;
function nm_setting_ovs_port_remove_trunk_by_value(setting: PNMSettingOvsPort; start: Tguint; end_: Tguint): Tgboolean; cdecl; external libnm;
procedure nm_setting_ovs_port_clear_trunks(setting: PNMSettingOvsPort); cdecl; external libnm;

// === Konventiert am: 19-4-26 19:25:35 ===

function NM_TYPE_SETTING_OVS_PORT: TGType;
function NM_SETTING_OVS_PORT(obj: Pointer): PNMSettingOvsPort;
function NM_SETTING_OVS_PORT_CLASS(klass: Pointer): PNMSettingOvsPortClass;
function NM_IS_SETTING_OVS_PORT(obj: Pointer): Tgboolean;
function NM_IS_SETTING_OVS_PORT_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_OVS_PORT_GET_CLASS(obj: Pointer): PNMSettingOvsPortClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_OVS_PORT: TGType;
begin
  NM_TYPE_SETTING_OVS_PORT := nm_setting_ovs_port_get_type;
end;

function NM_SETTING_OVS_PORT(obj: Pointer): PNMSettingOvsPort;
begin
  Result := PNMSettingOvsPort(g_type_check_instance_cast(obj, NM_TYPE_SETTING_OVS_PORT));
end;

function NM_SETTING_OVS_PORT_CLASS(klass: Pointer): PNMSettingOvsPortClass;
begin
  Result := PNMSettingOvsPortClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_OVS_PORT));
end;

function NM_IS_SETTING_OVS_PORT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_OVS_PORT);
end;

function NM_IS_SETTING_OVS_PORT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_OVS_PORT);
end;

function NM_SETTING_OVS_PORT_GET_CLASS(obj: Pointer): PNMSettingOvsPortClass;
begin
  Result := PNMSettingOvsPortClass(PGTypeInstance(obj)^.g_class);
end;



end.
