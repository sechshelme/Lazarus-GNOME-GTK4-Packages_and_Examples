

  {$IFDEF read_enum}
const
  NM_DEVICE_GENERIC_HW_ADDRESS = 'hw-address';
  NM_DEVICE_GENERIC_TYPE_DESCRIPTION = 'type-description';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceGeneric = type Pointer;
  PNMDeviceGenericClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_generic_get_type: TGType; cdecl; external libnm;
function nm_device_generic_get_hw_address(device: PNMDeviceGeneric): pchar; cdecl; external libnm; deprecated;

// === Konventiert am: 19-4-26 19:31:04 ===

function NM_TYPE_DEVICE_GENERIC: TGType;
function NM_DEVICE_GENERIC(obj: Pointer): PNMDeviceGeneric;
function NM_DEVICE_GENERIC_CLASS(klass: Pointer): PNMDeviceGenericClass;
function NM_IS_DEVICE_GENERIC(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_GENERIC_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_GENERIC_GET_CLASS(obj: Pointer): PNMDeviceGenericClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_DEVICE_GENERIC: TGType;
begin
  NM_TYPE_DEVICE_GENERIC := nm_device_generic_get_type;
end;

function NM_DEVICE_GENERIC(obj: Pointer): PNMDeviceGeneric;
begin
  Result := PNMDeviceGeneric(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_GENERIC));
end;

function NM_DEVICE_GENERIC_CLASS(klass: Pointer): PNMDeviceGenericClass;
begin
  Result := PNMDeviceGenericClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_GENERIC));
end;

function NM_IS_DEVICE_GENERIC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_GENERIC);
end;

function NM_IS_DEVICE_GENERIC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_GENERIC);
end;

function NM_DEVICE_GENERIC_GET_CLASS(obj: Pointer): PNMDeviceGenericClass;
begin
  Result := PNMDeviceGenericClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
