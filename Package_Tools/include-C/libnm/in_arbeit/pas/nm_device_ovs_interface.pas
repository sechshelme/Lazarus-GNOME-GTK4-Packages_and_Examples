unit nm_device_ovs_interface;

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PNMDeviceOvsInterface = type Pointer;
  PNMDeviceOvsInterfaceClass = type Pointer;

function nm_device_ovs_interface_get_type: TGType; cdecl; external libnm;

// === Konventiert am: 5-8-26 17:21:42 ===

function NM_TYPE_DEVICE_OVS_INTERFACE: TGType;
function NM_DEVICE_OVS_INTERFACE(obj: Pointer): PNMDeviceOvsInterface;
function NM_DEVICE_OVS_INTERFACE_CLASS(klass: Pointer): PNMDeviceOvsInterfaceClass;
function NM_IS_DEVICE_OVS_INTERFACE(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_OVS_INTERFACE_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_OVS_INTERFACE_GET_CLASS(obj: Pointer): PNMDeviceOvsInterfaceClass;

implementation

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



end.
