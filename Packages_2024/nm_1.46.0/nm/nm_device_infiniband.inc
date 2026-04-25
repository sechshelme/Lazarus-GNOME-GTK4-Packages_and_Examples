

  {$IFDEF read_enum}
const
  NM_DEVICE_INFINIBAND_HW_ADDRESS = 'hw-address';
  NM_DEVICE_INFINIBAND_CARRIER = 'carrier';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceInfiniband = type Pointer;
  PNMDeviceInfinibandClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_infiniband_get_type: TGType; cdecl; external libnm;
function nm_device_infiniband_get_hw_address(device: PNMDeviceInfiniband): pchar; cdecl; external libnm; deprecated;
function nm_device_infiniband_get_carrier(device: PNMDeviceInfiniband): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:30:59 ===

function NM_TYPE_DEVICE_INFINIBAND: TGType;
function NM_DEVICE_INFINIBAND(obj: Pointer): PNMDeviceInfiniband;
function NM_DEVICE_INFINIBAND_CLASS(klass: Pointer): PNMDeviceInfinibandClass;
function NM_IS_DEVICE_INFINIBAND(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_INFINIBAND_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_INFINIBAND_GET_CLASS(obj: Pointer): PNMDeviceInfinibandClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_DEVICE_INFINIBAND: TGType;
begin
  NM_TYPE_DEVICE_INFINIBAND := nm_device_infiniband_get_type;
end;

function NM_DEVICE_INFINIBAND(obj: Pointer): PNMDeviceInfiniband;
begin
  Result := PNMDeviceInfiniband(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_INFINIBAND));
end;

function NM_DEVICE_INFINIBAND_CLASS(klass: Pointer): PNMDeviceInfinibandClass;
begin
  Result := PNMDeviceInfinibandClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_INFINIBAND));
end;

function NM_IS_DEVICE_INFINIBAND(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_INFINIBAND);
end;

function NM_IS_DEVICE_INFINIBAND_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_INFINIBAND);
end;

function NM_DEVICE_INFINIBAND_GET_CLASS(obj: Pointer): PNMDeviceInfinibandClass;
begin
  Result := PNMDeviceInfinibandClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
