

  {$IFDEF read_enum}
const
  NM_DEVICE_VXLAN_HW_ADDRESS = 'hw-address';
  NM_DEVICE_VXLAN_CARRIER = 'carrier';
  NM_DEVICE_VXLAN_PARENT = 'parent';
  NM_DEVICE_VXLAN_ID = 'id';
  NM_DEVICE_VXLAN_GROUP = 'group';
  NM_DEVICE_VXLAN_LOCAL = 'local';
  NM_DEVICE_VXLAN_SRC_PORT_MIN = 'src-port-min';
  NM_DEVICE_VXLAN_SRC_PORT_MAX = 'src-port-max';
  NM_DEVICE_VXLAN_LEARNING = 'learning';
  NM_DEVICE_VXLAN_AGEING = 'ageing';
  NM_DEVICE_VXLAN_TOS = 'tos';
  NM_DEVICE_VXLAN_TTL = 'ttl';
  NM_DEVICE_VXLAN_LIMIT = 'limit';
  NM_DEVICE_VXLAN_PROXY = 'proxy';
  NM_DEVICE_VXLAN_RSC = 'rsc';
  NM_DEVICE_VXLAN_L2MISS = 'l2miss';
  NM_DEVICE_VXLAN_L3MISS = 'l3miss';
  NM_DEVICE_VXLAN_DST_PORT = 'dst-port';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceVxlan = type Pointer;
  PNMDeviceVxlanClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_vxlan_get_type: TGType; cdecl; external libnm;
function nm_device_vxlan_get_hw_address(device: PNMDeviceVxlan): pchar; cdecl; external libnm; deprecated;
function nm_device_vxlan_get_carrier(device: PNMDeviceVxlan): Tgboolean; cdecl; external libnm;
function nm_device_vxlan_get_parent(device: PNMDeviceVxlan): PNMDevice; cdecl; external libnm;
function nm_device_vxlan_get_id(device: PNMDeviceVxlan): Tguint; cdecl; external libnm;
function nm_device_vxlan_get_group(device: PNMDeviceVxlan): pchar; cdecl; external libnm;
function nm_device_vxlan_get_local(device: PNMDeviceVxlan): pchar; cdecl; external libnm;
function nm_device_vxlan_get_src_port_min(device: PNMDeviceVxlan): Tguint; cdecl; external libnm;
function nm_device_vxlan_get_src_port_max(device: PNMDeviceVxlan): Tguint; cdecl; external libnm;
function nm_device_vxlan_get_dst_port(device: PNMDeviceVxlan): Tguint; cdecl; external libnm;
function nm_device_vxlan_get_learning(device: PNMDeviceVxlan): Tgboolean; cdecl; external libnm;
function nm_device_vxlan_get_ageing(device: PNMDeviceVxlan): Tguint; cdecl; external libnm;
function nm_device_vxlan_get_tos(device: PNMDeviceVxlan): Tguint; cdecl; external libnm;
function nm_device_vxlan_get_ttl(device: PNMDeviceVxlan): Tguint; cdecl; external libnm;
function nm_device_vxlan_get_limit(device: PNMDeviceVxlan): Tguint; cdecl; external libnm;
function nm_device_vxlan_get_proxy(device: PNMDeviceVxlan): Tgboolean; cdecl; external libnm;
function nm_device_vxlan_get_rsc(device: PNMDeviceVxlan): Tgboolean; cdecl; external libnm;
function nm_device_vxlan_get_l2miss(device: PNMDeviceVxlan): Tgboolean; cdecl; external libnm;
function nm_device_vxlan_get_l3miss(device: PNMDeviceVxlan): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:30:05 ===

function NM_TYPE_DEVICE_VXLAN: TGType;
function NM_DEVICE_VXLAN(obj: Pointer): PNMDeviceVxlan;
function NM_DEVICE_VXLAN_CLASS(klass: Pointer): PNMDeviceVxlanClass;
function NM_IS_DEVICE_VXLAN(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_VXLAN_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_VXLAN_GET_CLASS(obj: Pointer): PNMDeviceVxlanClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_DEVICE_VXLAN: TGType;
begin
  NM_TYPE_DEVICE_VXLAN := nm_device_vxlan_get_type;
end;

function NM_DEVICE_VXLAN(obj: Pointer): PNMDeviceVxlan;
begin
  Result := PNMDeviceVxlan(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_VXLAN));
end;

function NM_DEVICE_VXLAN_CLASS(klass: Pointer): PNMDeviceVxlanClass;
begin
  Result := PNMDeviceVxlanClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_VXLAN));
end;

function NM_IS_DEVICE_VXLAN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_VXLAN);
end;

function NM_IS_DEVICE_VXLAN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_VXLAN);
end;

function NM_DEVICE_VXLAN_GET_CLASS(obj: Pointer): PNMDeviceVxlanClass;
begin
  Result := PNMDeviceVxlanClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
