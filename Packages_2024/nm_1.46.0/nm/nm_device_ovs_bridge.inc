

  {$IFDEF read_enum}
const
  NM_DEVICE_OVS_BRIDGE_SLAVES = 'slaves';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceOvsBridge = type Pointer;
  PNMDeviceOvsBridgeClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_ovs_bridge_get_type: TGType; cdecl; external libnm;
function nm_device_ovs_bridge_get_slaves(device: PNMDeviceOvsBridge): PGPtrArray; cdecl; external libnm; deprecated;

// === Konventiert am: 19-4-26 19:30:37 ===

function NM_TYPE_DEVICE_OVS_BRIDGE: TGType;
function NM_DEVICE_OVS_BRIDGE(obj: Pointer): PNMDeviceOvsBridge;
function NM_DEVICE_OVS_BRIDGE_CLASS(klass: Pointer): PNMDeviceOvsBridgeClass;
function NM_IS_DEVICE_OVS_BRIDGE(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_OVS_BRIDGE_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_OVS_BRIDGE_GET_CLASS(obj: Pointer): PNMDeviceOvsBridgeClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_DEVICE_OVS_BRIDGE: TGType;
begin
  NM_TYPE_DEVICE_OVS_BRIDGE := nm_device_ovs_bridge_get_type;
end;

function NM_DEVICE_OVS_BRIDGE(obj: Pointer): PNMDeviceOvsBridge;
begin
  Result := PNMDeviceOvsBridge(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_OVS_BRIDGE));
end;

function NM_DEVICE_OVS_BRIDGE_CLASS(klass: Pointer): PNMDeviceOvsBridgeClass;
begin
  Result := PNMDeviceOvsBridgeClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_OVS_BRIDGE));
end;

function NM_IS_DEVICE_OVS_BRIDGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_OVS_BRIDGE);
end;

function NM_IS_DEVICE_OVS_BRIDGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_OVS_BRIDGE);
end;

function NM_DEVICE_OVS_BRIDGE_GET_CLASS(obj: Pointer): PNMDeviceOvsBridgeClass;
begin
  Result := PNMDeviceOvsBridgeClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
