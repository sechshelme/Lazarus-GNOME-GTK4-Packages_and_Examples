

  {$IFDEF read_enum}
const
  NM_SETTING_SRIOV_SETTING_NAME = 'sriov';
  NM_SETTING_SRIOV_TOTAL_VFS = 'total-vfs';
  NM_SETTING_SRIOV_VFS = 'vfs';
  NM_SETTING_SRIOV_AUTOPROBE_DRIVERS = 'autoprobe-drivers';
  NM_SETTING_SRIOV_ESWITCH_MODE = 'eswitch-mode';
  NM_SETTING_SRIOV_ESWITCH_INLINE_MODE = 'eswitch-inline-mode';
  NM_SETTING_SRIOV_ESWITCH_ENCAP_MODE = 'eswitch-encap-mode';
  NM_SRIOV_VF_ATTRIBUTE_MAC = 'mac';
  NM_SRIOV_VF_ATTRIBUTE_SPOOF_CHECK = 'spoof-check';
  NM_SRIOV_VF_ATTRIBUTE_TRUST = 'trust';
  NM_SRIOV_VF_ATTRIBUTE_MIN_TX_RATE = 'min-tx-rate';
  NM_SRIOV_VF_ATTRIBUTE_MAX_TX_RATE = 'max-tx-rate';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSriovVF = type Pointer;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  PNMSriovVFVlanProtocol = ^TNMSriovVFVlanProtocol;
  TNMSriovVFVlanProtocol = longint;

const
  NM_SRIOV_VF_VLAN_PROTOCOL_802_1Q = 0;
  NM_SRIOV_VF_VLAN_PROTOCOL_802_1AD = 1;

type
  PNMSriovEswitchMode = ^TNMSriovEswitchMode;
  TNMSriovEswitchMode = longint;

const
  NM_SRIOV_ESWITCH_MODE_PRESERVE = -(1);
  NM_SRIOV_ESWITCH_MODE_UNKNOWN = -(1);
  NM_SRIOV_ESWITCH_MODE_LEGACY = 0;
  NM_SRIOV_ESWITCH_MODE_SWITCHDEV = 1;

type
  PNMSriovEswitchInlineMode = ^TNMSriovEswitchInlineMode;
  TNMSriovEswitchInlineMode = longint;

const
  NM_SRIOV_ESWITCH_INLINE_MODE_PRESERVE = -(1);
  NM_SRIOV_ESWITCH_INLINE_MODE_UNKNOWN = -(1);
  NM_SRIOV_ESWITCH_INLINE_MODE_NONE = 0;
  NM_SRIOV_ESWITCH_INLINE_MODE_LINK = 1;
  NM_SRIOV_ESWITCH_INLINE_MODE_NETWORK = 2;
  NM_SRIOV_ESWITCH_INLINE_MODE_TRANSPORT = 3;

type
  PNMSriovEswitchEncapMode = ^TNMSriovEswitchEncapMode;
  TNMSriovEswitchEncapMode = longint;

const
  NM_SRIOV_ESWITCH_ENCAP_MODE_PRESERVE = -(1);
  NM_SRIOV_ESWITCH_ENCAP_MODE_UNKNOWN = -(1);
  NM_SRIOV_ESWITCH_ENCAP_MODE_NONE = 0;
  NM_SRIOV_ESWITCH_ENCAP_MODE_BASIC = 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingSriov = type Pointer;
  PNMSettingSriovClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_sriov_get_type: TGType; cdecl; external libnm;
function nm_setting_sriov_new: PNMSetting; cdecl; external libnm;
function nm_setting_sriov_get_total_vfs(setting: PNMSettingSriov): Tguint; cdecl; external libnm;
function nm_setting_sriov_get_num_vfs(setting: PNMSettingSriov): Tguint; cdecl; external libnm;
function nm_setting_sriov_get_vf(setting: PNMSettingSriov; idx: Tguint): PNMSriovVF; cdecl; external libnm;
procedure nm_setting_sriov_add_vf(setting: PNMSettingSriov; vf: PNMSriovVF); cdecl; external libnm;
procedure nm_setting_sriov_remove_vf(setting: PNMSettingSriov; idx: Tguint); cdecl; external libnm;
function nm_setting_sriov_remove_vf_by_index(setting: PNMSettingSriov; index: Tguint): Tgboolean; cdecl; external libnm;
procedure nm_setting_sriov_clear_vfs(setting: PNMSettingSriov); cdecl; external libnm;
function nm_setting_sriov_get_autoprobe_drivers(setting: PNMSettingSriov): TNMTernary; cdecl; external libnm;
function nm_setting_sriov_get_eswitch_mode(setting: PNMSettingSriov): TNMSriovEswitchMode; cdecl; external libnm;
function nm_setting_sriov_get_eswitch_inline_mode(setting: PNMSettingSriov): TNMSriovEswitchInlineMode; cdecl; external libnm;
function nm_setting_sriov_get_eswitch_encap_mode(setting: PNMSettingSriov): TNMSriovEswitchEncapMode; cdecl; external libnm;
function nm_sriov_vf_add_vlan(vf: PNMSriovVF; vlan_id: Tguint): Tgboolean; cdecl; external libnm;
function nm_sriov_vf_remove_vlan(vf: PNMSriovVF; vlan_id: Tguint): Tgboolean; cdecl; external libnm;
function nm_sriov_vf_get_vlan_ids(vf: PNMSriovVF; length: Pguint): Pguint; cdecl; external libnm;
procedure nm_sriov_vf_set_vlan_qos(vf: PNMSriovVF; vlan_id: Tguint; qos: Tguint32); cdecl; external libnm;
procedure nm_sriov_vf_set_vlan_protocol(vf: PNMSriovVF; vlan_id: Tguint; protocol: TNMSriovVFVlanProtocol); cdecl; external libnm;
function nm_sriov_vf_get_vlan_qos(vf: PNMSriovVF; vlan_id: Tguint): Tguint32; cdecl; external libnm;
function nm_sriov_vf_get_vlan_protocol(vf: PNMSriovVF; vlan_id: Tguint): TNMSriovVFVlanProtocol; cdecl; external libnm;
function nm_sriov_vf_get_type: TGType; cdecl; external libnm;
function nm_sriov_vf_new(index: Tguint): PNMSriovVF; cdecl; external libnm;
procedure nm_sriov_vf_ref(vf: PNMSriovVF); cdecl; external libnm;
procedure nm_sriov_vf_unref(vf: PNMSriovVF); cdecl; external libnm;
function nm_sriov_vf_equal(vf: PNMSriovVF; other: PNMSriovVF): Tgboolean; cdecl; external libnm;
function nm_sriov_vf_dup(vf: PNMSriovVF): PNMSriovVF; cdecl; external libnm;
function nm_sriov_vf_get_index(vf: PNMSriovVF): Tguint; cdecl; external libnm;
procedure nm_sriov_vf_set_attribute(vf: PNMSriovVF; name: pchar; value: PGVariant); cdecl; external libnm;
function nm_sriov_vf_get_attribute_names(vf: PNMSriovVF): Ppchar; cdecl; external libnm;
function nm_sriov_vf_get_attribute(vf: PNMSriovVF; name: pchar): PGVariant; cdecl; external libnm;
function nm_sriov_vf_attribute_validate(name: pchar; value: PGVariant; known: Pgboolean; error: PPGError): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:25:09 ===

function NM_TYPE_SETTING_SRIOV: TGType;
function NM_SETTING_SRIOV(obj: Pointer): PNMSettingSriov;
function NM_SETTING_SRIOV_CLASS(klass: Pointer): PNMSettingSriovClass;
function NM_IS_SETTING_SRIOV(obj: Pointer): Tgboolean;
function NM_IS_SETTING_SRIOV_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_SRIOV_GET_CLASS(obj: Pointer): PNMSettingSriovClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_SRIOV: TGType;
begin
  NM_TYPE_SETTING_SRIOV := nm_setting_sriov_get_type;
end;

function NM_SETTING_SRIOV(obj: Pointer): PNMSettingSriov;
begin
  Result := PNMSettingSriov(g_type_check_instance_cast(obj, NM_TYPE_SETTING_SRIOV));
end;

function NM_SETTING_SRIOV_CLASS(klass: Pointer): PNMSettingSriovClass;
begin
  Result := PNMSettingSriovClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_SRIOV));
end;

function NM_IS_SETTING_SRIOV(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_SRIOV);
end;

function NM_IS_SETTING_SRIOV_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_SRIOV);
end;

function NM_SETTING_SRIOV_GET_CLASS(obj: Pointer): PNMSettingSriovClass;
begin
  Result := PNMSettingSriovClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
