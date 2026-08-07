unit nm_device_ovs_port;

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_DEVICE_OVS_PORT_SLAVES = 'slaves';

type
  PNMDeviceOvsPort = type Pointer;
  PNMDeviceOvsPortClass = type Pointer;

function nm_device_ovs_port_get_type: TGType; cdecl; external libnm;
function nm_device_ovs_port_get_slaves(device: PNMDeviceOvsPort): PGPtrArray; cdecl; external libnm; deprecated;

// === Konventiert am: 5-8-26 17:21:38 ===

function NM_TYPE_DEVICE_OVS_PORT: TGType;
function NM_DEVICE_OVS_PORT(obj: Pointer): PNMDeviceOvsPort;
function NM_DEVICE_OVS_PORT_CLASS(klass: Pointer): PNMDeviceOvsPortClass;
function NM_IS_DEVICE_OVS_PORT(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_OVS_PORT_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_OVS_PORT_GET_CLASS(obj: Pointer): PNMDeviceOvsPortClass;

implementation

function NM_TYPE_DEVICE_OVS_PORT: TGType;
begin
  NM_TYPE_DEVICE_OVS_PORT := nm_device_ovs_port_get_type;
end;

function NM_DEVICE_OVS_PORT(obj: Pointer): PNMDeviceOvsPort;
begin
  Result := PNMDeviceOvsPort(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_OVS_PORT));
end;

function NM_DEVICE_OVS_PORT_CLASS(klass: Pointer): PNMDeviceOvsPortClass;
begin
  Result := PNMDeviceOvsPortClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_OVS_PORT));
end;

function NM_IS_DEVICE_OVS_PORT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_OVS_PORT);
end;

function NM_IS_DEVICE_OVS_PORT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_OVS_PORT);
end;

function NM_DEVICE_OVS_PORT_GET_CLASS(obj: Pointer): PNMDeviceOvsPortClass;
begin
  Result := PNMDeviceOvsPortClass(PGTypeInstance(obj)^.g_class);
end;



end.
