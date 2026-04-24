unit nm_device_bridge;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_DEVICE_BRIDGE_HW_ADDRESS = 'hw-address';
  NM_DEVICE_BRIDGE_CARRIER = 'carrier';
  NM_DEVICE_BRIDGE_SLAVES = 'slaves';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceBridge = type Pointer;
  PNMDeviceBridgeClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_bridge_get_type: TGType; cdecl; external libnm;
function nm_device_bridge_get_hw_address(device: PNMDeviceBridge): pchar; cdecl; external libnm; deprecated;
function nm_device_bridge_get_carrier(device: PNMDeviceBridge): Tgboolean; cdecl; external libnm;
function nm_device_bridge_get_slaves(device: PNMDeviceBridge): PGPtrArray; cdecl; external libnm; deprecated;

// === Konventiert am: 19-4-26 19:31:16 ===

function NM_TYPE_DEVICE_BRIDGE: TGType;
function NM_DEVICE_BRIDGE(obj: Pointer): PNMDeviceBridge;
function NM_DEVICE_BRIDGE_CLASS(klass: Pointer): PNMDeviceBridgeClass;
function NM_IS_DEVICE_BRIDGE(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_BRIDGE_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_BRIDGE_GET_CLASS(obj: Pointer): PNMDeviceBridgeClass;
{$ENDIF read_function}

implementation

function NM_TYPE_DEVICE_BRIDGE: TGType;
begin
  NM_TYPE_DEVICE_BRIDGE := nm_device_bridge_get_type;
end;

function NM_DEVICE_BRIDGE(obj: Pointer): PNMDeviceBridge;
begin
  Result := PNMDeviceBridge(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_BRIDGE));
end;

function NM_DEVICE_BRIDGE_CLASS(klass: Pointer): PNMDeviceBridgeClass;
begin
  Result := PNMDeviceBridgeClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_BRIDGE));
end;

function NM_IS_DEVICE_BRIDGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_BRIDGE);
end;

function NM_IS_DEVICE_BRIDGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_BRIDGE);
end;

function NM_DEVICE_BRIDGE_GET_CLASS(obj: Pointer): PNMDeviceBridgeClass;
begin
  Result := PNMDeviceBridgeClass(PGTypeInstance(obj)^.g_class);
end;



end.
