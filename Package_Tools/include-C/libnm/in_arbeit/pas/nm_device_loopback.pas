unit nm_device_loopback;

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PNMDeviceLoopback = type Pointer;
  PNMDeviceLoopbackClass = type Pointer;

function nm_device_loopback_get_type: TGType; cdecl; external libnm;

// === Konventiert am: 5-8-26 17:22:03 ===

function NM_TYPE_DEVICE_LOOPBACK: TGType;
function NM_DEVICE_LOOPBACK(obj: Pointer): PNMDeviceLoopback;
function NM_DEVICE_LOOPBACK_CLASS(klass: Pointer): PNMDeviceLoopbackClass;
function NM_IS_DEVICE_LOOPBACK(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_LOOPBACK_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_LOOPBACK_GET_CLASS(obj: Pointer): PNMDeviceLoopbackClass;

implementation

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



end.
