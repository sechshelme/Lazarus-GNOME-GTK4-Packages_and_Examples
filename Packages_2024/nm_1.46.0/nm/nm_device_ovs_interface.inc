

  {$IFDEF read_struct}
type
  PNMDeviceOvsInterface = type Pointer;
  PNMDeviceOvsInterfaceClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_ovs_interface_get_type: TGType; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:30:33 ===

function NM_TYPE_DEVICE_OVS_INTERFACE: TGType;
function NM_DEVICE_OVS_INTERFACE(obj: Pointer): PNMDeviceOvsInterface;
function NM_DEVICE_OVS_INTERFACE_CLASS(klass: Pointer): PNMDeviceOvsInterfaceClass;
function NM_IS_DEVICE_OVS_INTERFACE(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_OVS_INTERFACE_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_OVS_INTERFACE_GET_CLASS(obj: Pointer): PNMDeviceOvsInterfaceClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_DEVICE_OVS_INTERFACE: TGType;
begin
  NM_TYPE_DEVICE_OVS_INTERFACE := nm_device_ovs_interface_get_type;
end;

function NM_DEVICE_OVS_INTERFACE(obj: Pointer): PNMDeviceOvsInterface;
begin
  Result := PNMDeviceOvsInterface(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_OVS_INTERFACE));
end;

function NM_DEVICE_OVS_INTERFACE_CLASS(klass: Pointer): PNMDeviceOvsInterfaceClass;
begin
  Result := PNMDeviceOvsInterfaceClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_OVS_INTERFACE));
end;

function NM_IS_DEVICE_OVS_INTERFACE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_OVS_INTERFACE);
end;

function NM_IS_DEVICE_OVS_INTERFACE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_OVS_INTERFACE);
end;

function NM_DEVICE_OVS_INTERFACE_GET_CLASS(obj: Pointer): PNMDeviceOvsInterfaceClass;
begin
  Result := PNMDeviceOvsInterfaceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
