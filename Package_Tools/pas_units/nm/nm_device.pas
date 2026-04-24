unit nm_device;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_dbus_interface;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_DEVICE_DEVICE_TYPE = 'device-type';
  NM_DEVICE_UDI = 'udi';
  NM_DEVICE_PATH = 'path';
  NM_DEVICE_INTERFACE = 'interface';
  NM_DEVICE_IP_INTERFACE = 'ip-interface';
  NM_DEVICE_DRIVER = 'driver';
  NM_DEVICE_DRIVER_VERSION = 'driver-version';
  NM_DEVICE_FIRMWARE_VERSION = 'firmware-version';
  NM_DEVICE_CAPABILITIES = 'capabilities';
  NM_DEVICE_REAL = 'real';
  NM_DEVICE_MANAGED = 'managed';
  NM_DEVICE_AUTOCONNECT = 'autoconnect';
  NM_DEVICE_FIRMWARE_MISSING = 'firmware-missing';
  NM_DEVICE_NM_PLUGIN_MISSING = 'nm-plugin-missing';
  NM_DEVICE_IP4_CONFIG = 'ip4-config';
  NM_DEVICE_DHCP4_CONFIG = 'dhcp4-config';
  NM_DEVICE_IP6_CONFIG = 'ip6-config';
  NM_DEVICE_DHCP6_CONFIG = 'dhcp6-config';
  NM_DEVICE_STATE = 'state';
  NM_DEVICE_STATE_REASON = 'state-reason';
  NM_DEVICE_ACTIVE_CONNECTION = 'active-connection';
  NM_DEVICE_AVAILABLE_CONNECTIONS = 'available-connections';
  NM_DEVICE_VENDOR = 'vendor';
  NM_DEVICE_PRODUCT = 'product';
  NM_DEVICE_PHYSICAL_PORT_ID = 'physical-port-id';
  NM_DEVICE_MTU = 'mtu';
  NM_DEVICE_METERED = 'metered';
  NM_DEVICE_LLDP_NEIGHBORS = 'lldp-neighbors';
  NM_DEVICE_IP4_CONNECTIVITY = 'ip4-connectivity';
  NM_DEVICE_IP6_CONNECTIVITY = 'ip6-connectivity';
  NM_DEVICE_INTERFACE_FLAGS = 'interface-flags';
  NM_DEVICE_HW_ADDRESS = 'hw-address';
  NM_DEVICE_PORTS = 'ports';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDevice = type Pointer;
  PPNMDevice = ^PNMDevice;
  PNMDeviceClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_get_type: TGType; cdecl; external libnm;
function nm_device_get_iface(device: PNMDevice): pchar; cdecl; external libnm;
function nm_device_get_ip_iface(device: PNMDevice): pchar; cdecl; external libnm;
function nm_device_get_device_type(device: PNMDevice): TNMDeviceType; cdecl; external libnm;
function nm_device_get_udi(device: PNMDevice): pchar; cdecl; external libnm;
function nm_device_get_path(device: PNMDevice): pchar; cdecl; external libnm;
function nm_device_get_driver(device: PNMDevice): pchar; cdecl; external libnm;
function nm_device_get_driver_version(device: PNMDevice): pchar; cdecl; external libnm;
function nm_device_get_firmware_version(device: PNMDevice): pchar; cdecl; external libnm;
function nm_device_get_type_description(device: PNMDevice): pchar; cdecl; external libnm;
function nm_device_get_hw_address(device: PNMDevice): pchar; cdecl; external libnm;
function nm_device_get_capabilities(device: PNMDevice): TNMDeviceCapabilities; cdecl; external libnm;
function nm_device_get_managed(device: PNMDevice): Tgboolean; cdecl; external libnm;
function nm_device_get_ports(device: PNMDevice): PGPtrArray; cdecl; external libnm;
procedure nm_device_set_managed(device: PNMDevice; managed: Tgboolean); cdecl; external libnm; deprecated;
function nm_device_get_autoconnect(device: PNMDevice): Tgboolean; cdecl; external libnm;
procedure nm_device_set_autoconnect(device: PNMDevice; autoconnect: Tgboolean); cdecl; external libnm; deprecated;
function nm_device_get_firmware_missing(device: PNMDevice): Tgboolean; cdecl; external libnm;
function nm_device_get_nm_plugin_missing(device: PNMDevice): Tgboolean; cdecl; external libnm;
function nm_device_get_ip4_config(device: PNMDevice): PNMIPConfig; cdecl; external libnm;
function nm_device_get_dhcp4_config(device: PNMDevice): PNMDhcpConfig; cdecl; external libnm;
function nm_device_get_ip6_config(device: PNMDevice): PNMIPConfig; cdecl; external libnm;
function nm_device_get_dhcp6_config(device: PNMDevice): PNMDhcpConfig; cdecl; external libnm;
function nm_device_get_connectivity(device: PNMDevice; addr_family: longint): TNMConnectivityState; cdecl; external libnm;
function nm_device_get_state(device: PNMDevice): TNMDeviceState; cdecl; external libnm;
function nm_device_get_state_reason(device: PNMDevice): TNMDeviceStateReason; cdecl; external libnm;
function nm_device_get_active_connection(device: PNMDevice): PNMActiveConnection; cdecl; external libnm;
function nm_device_get_available_connections(device: PNMDevice): PGPtrArray; cdecl; external libnm;
function nm_device_get_physical_port_id(device: PNMDevice): pchar; cdecl; external libnm;
function nm_device_get_mtu(device: PNMDevice): Tguint32; cdecl; external libnm;
function nm_device_is_real(device: PNMDevice): Tgboolean; cdecl; external libnm;
function nm_device_is_software(device: PNMDevice): Tgboolean; cdecl; external libnm;
function nm_device_get_product(device: PNMDevice): pchar; cdecl; external libnm;
function nm_device_get_vendor(device: PNMDevice): pchar; cdecl; external libnm;
function nm_device_get_description(device: PNMDevice): pchar; cdecl; external libnm;
function nm_device_get_metered(device: PNMDevice): TNMMetered; cdecl; external libnm;
function nm_device_get_lldp_neighbors(device: PNMDevice): PGPtrArray; cdecl; external libnm;
function nm_device_get_interface_flags(device: PNMDevice): TNMDeviceInterfaceFlags; cdecl; external libnm;
function nm_device_disambiguate_names(devices: PPNMDevice; num_devices: longint): PPchar; cdecl; external libnm;
function nm_device_reapply(device: PNMDevice; connection: PNMConnection; version_id: Tguint64; flags: Tguint32; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
procedure nm_device_reapply_async(device: PNMDevice; connection: PNMConnection; version_id: Tguint64; flags: Tguint32; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_device_reapply_finish(device: PNMDevice; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_device_get_applied_connection(device: PNMDevice; flags: Tguint32; version_id: Pguint64; cancellable: PGCancellable; error: PPGError): PNMConnection; cdecl; external libnm; deprecated;
procedure nm_device_get_applied_connection_async(device: PNMDevice; flags: Tguint32; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_device_get_applied_connection_finish(device: PNMDevice; result: PGAsyncResult; version_id: Pguint64; error: PPGError): PNMConnection; cdecl; external libnm;
function nm_device_disconnect(device: PNMDevice; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
procedure nm_device_disconnect_async(device: PNMDevice; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_device_disconnect_finish(device: PNMDevice; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_device_delete(device: PNMDevice; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
procedure nm_device_delete_async(device: PNMDevice; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_device_delete_finish(device: PNMDevice; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_device_filter_connections(device: PNMDevice; connections: PGPtrArray): PGPtrArray; cdecl; external libnm;
function nm_device_connection_valid(device: PNMDevice; connection: PNMConnection): Tgboolean; cdecl; external libnm;
function nm_device_connection_compatible(device: PNMDevice; connection: PNMConnection; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_device_get_setting_type(device: PNMDevice): TGType; cdecl; external libnm;
function nm_lldp_neighbor_get_type: TGType; cdecl; external libnm;
procedure nm_lldp_neighbor_ref(neighbor: PNMLldpNeighbor); cdecl; external libnm;
procedure nm_lldp_neighbor_unref(neighbor: PNMLldpNeighbor); cdecl; external libnm;
function nm_lldp_neighbor_get_attr_names(neighbor: PNMLldpNeighbor): Ppchar; cdecl; external libnm;
function nm_lldp_neighbor_get_attr_value(neighbor: PNMLldpNeighbor; name: pchar): PGVariant; cdecl; external libnm;
function nm_lldp_neighbor_new: PNMLldpNeighbor; cdecl; external libnm;
function nm_lldp_neighbor_get_attr_string_value(neighbor: PNMLldpNeighbor; name: pchar; out_value: PPchar): Tgboolean; cdecl; external libnm;
function nm_lldp_neighbor_get_attr_uint_value(neighbor: PNMLldpNeighbor; name: pchar; out_value: Pguint): Tgboolean; cdecl; external libnm;
function nm_lldp_neighbor_get_attr_type(neighbor: PNMLldpNeighbor; name: pchar): PGVariantType; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:31:28 ===

function NM_TYPE_DEVICE: TGType;
function NM_DEVICE(obj: Pointer): PNMDevice;
function NM_DEVICE_CLASS(klass: Pointer): PNMDeviceClass;
function NM_IS_DEVICE(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_GET_CLASS(obj: Pointer): PNMDeviceClass;
{$ENDIF read_function}

implementation

function NM_TYPE_DEVICE: TGType;
begin
  NM_TYPE_DEVICE := nm_device_get_type;
end;

function NM_DEVICE(obj: Pointer): PNMDevice;
begin
  Result := PNMDevice(g_type_check_instance_cast(obj, NM_TYPE_DEVICE));
end;

function NM_DEVICE_CLASS(klass: Pointer): PNMDeviceClass;
begin
  Result := PNMDeviceClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE));
end;

function NM_IS_DEVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE);
end;

function NM_IS_DEVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE);
end;

function NM_DEVICE_GET_CLASS(obj: Pointer): PNMDeviceClass;
begin
  Result := PNMDeviceClass(PGTypeInstance(obj)^.g_class);
end;



end.
