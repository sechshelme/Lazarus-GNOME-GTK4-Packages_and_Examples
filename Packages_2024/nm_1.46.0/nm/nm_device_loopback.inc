

  {$IFDEF read_struct}
type
  PNMDeviceLoopbackClass = type Pointer;
  PNMDeviceLoopback = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_loopback_get_type: TGType; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:30:52 ===

function NM_TYPE_DEVICE_LOOPBACK: TGType;
function NM_DEVICE_LOOPBACK(obj: Pointer): PNMDeviceLoopback;
function NM_DEVICE_LOOPBACK_CLASS(klass: Pointer): PNMDeviceLoopbackClass;
function NM_IS_DEVICE_LOOPBACK(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_LOOPBACK_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_LOOPBACK_GET_CLASS(obj: Pointer): PNMDeviceLoopbackClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_DEVICE_LOOPBACK: TGType;
begin
  NM_TYPE_DEVICE_LOOPBACK := nm_device_loopback_get_type;
end;

function NM_DEVICE_LOOPBACK(obj: Pointer): PNMDeviceLoopback;
begin
  Result := PNMDeviceLoopback(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_LOOPBACK));
end;

function NM_DEVICE_LOOPBACK_CLASS(klass: Pointer): PNMDeviceLoopbackClass;
begin
  Result := PNMDeviceLoopbackClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_LOOPBACK));
end;

function NM_IS_DEVICE_LOOPBACK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_LOOPBACK);
end;

function NM_IS_DEVICE_LOOPBACK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_LOOPBACK);
end;

function NM_DEVICE_LOOPBACK_GET_CLASS(obj: Pointer): PNMDeviceLoopbackClass;
begin
  Result := PNMDeviceLoopbackClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
