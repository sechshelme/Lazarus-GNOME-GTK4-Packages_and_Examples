

  {$IFDEF read_enum}
const
  NM_DEVICE_VRF_TABLE = 'table';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceVrf = type Pointer;
  PNMDeviceVrfClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_vrf_get_type: TGType; cdecl; external libnm;
function nm_device_vrf_get_table(device: PNMDeviceVrf): Tguint32; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:30:08 ===

function NM_TYPE_DEVICE_VRF: TGType;
function NM_DEVICE_VRF(obj: Pointer): PNMDeviceVrf;
function NM_DEVICE_VRF_CLASS(klass: Pointer): PNMDeviceVrfClass;
function NM_IS_DEVICE_VRF(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_VRF_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_VRF_GET_CLASS(obj: Pointer): PNMDeviceVrfClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_DEVICE_VRF: TGType;
begin
  NM_TYPE_DEVICE_VRF := nm_device_vrf_get_type;
end;

function NM_DEVICE_VRF(obj: Pointer): PNMDeviceVrf;
begin
  Result := PNMDeviceVrf(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_VRF));
end;

function NM_DEVICE_VRF_CLASS(klass: Pointer): PNMDeviceVrfClass;
begin
  Result := PNMDeviceVrfClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_VRF));
end;

function NM_IS_DEVICE_VRF(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_VRF);
end;

function NM_IS_DEVICE_VRF_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_VRF);
end;

function NM_DEVICE_VRF_GET_CLASS(obj: Pointer): PNMDeviceVrfClass;
begin
  Result := PNMDeviceVrfClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
