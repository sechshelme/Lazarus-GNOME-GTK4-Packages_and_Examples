
unit nm-device;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGPtrArray  = ^GPtrArray;
Pguint  = ^guint;
Pguint64  = ^guint64;
PGVariant  = ^GVariant;
PGVariantType  = ^GVariantType;
PNMActiveConnection  = ^NMActiveConnection;
PNMConnection  = ^NMConnection;
PNMDevice  = ^NMDevice;
PNMDhcpConfig  = ^NMDhcpConfig;
PNMIPConfig  = ^NMIPConfig;
PNMLldpNeighbor  = ^NMLldpNeighbor;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Novell, Inc.
 * Copyright (C) 2007 - 2013 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_H__}
{$define __NM_DEVICE_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-object.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_GET_CLASS(obj : longint) : longint;

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
{//xxxx _NM_DEPRECATED_SYNC_WRITABLE_PROPERTY }
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
{*
 * NMDevice:
  }
type
{*
 * NMLldpNeighbor:
 *
 * Supported attributes are:
 *
 * - #NM_LLDP_ATTR_CHASSIS_ID_TYPE (type: 'u')
 * - #NM_LLDP_ATTR_CHASSIS_ID (type: 's')
 * - #NM_LLDP_ATTR_DESTINATION (type: 's')
 * - #NM_LLDP_ATTR_IEEE_802_1_PPVID (type: 'u'). This attribute only reports the first PPVID
 *   and therefore it is deprecated in favor of NM_LLDP_ATTR_IEEE_802_1_PPVIDS which reports
 *   all the PPVID.
 * - #NM_LLDP_ATTR_IEEE_802_1_PPVID_FLAGS (type: 'u'). This attribute only reports the first PPVID
 *   and therefore it is deprecated in favor of NM_LLDP_ATTR_IEEE_802_1_PPVIDS which reports
 *   all the PPVID.
 * - #NM_LLDP_ATTR_IEEE_802_1_PPVIDS (type: 'aasv')
 *
 *   An array of dictionaries where each element has keys:
 *   - flags (type: 'u')
 *   - ppvid (type: 'u')
 * - #NM_LLDP_ATTR_IEEE_802_1_PVID (type: 'u')
 * - #NM_LLDP_ATTR_IEEE_802_1_VID (type: 'u'). This attribute only reports the first VLAN
 *   and therefore it is deprecated in favor of NM_LLDP_ATTR_IEEE_802_1_VLANS which reports
 *   all the VLANs.
 * - #NM_LLDP_ATTR_IEEE_802_1_VLAN_NAME (type: 's'). This attribute only reports the first VLAN
 *   and therefore it is deprecated in favor of NM_LLDP_ATTR_IEEE_802_1_VLANS which reports
 *   all the VLANs.
 * - #NM_LLDP_ATTR_IEEE_802_1_VLANS (type: 'aasv')
 *
 *   An array of dictionaries where each element has keys:
 *   - name (type: 's')
 *   - vid (type: 'u')
 * - #NM_LLDP_ATTR_IEEE_802_3_MAC_PHY_CONF (type: 'asv')
 *
 *   Dictionary where each element has keys:
 *   - autoneg (type: 'u')
 *   - operational-mau-type (type: 'u')
 *   - pmd-autoneg-cap (type: 'u')
 * - #NM_LLDP_ATTR_IEEE_802_3_MAX_FRAME_SIZE (type: 'u')
 * - #NM_LLDP_ATTR_IEEE_802_3_POWER_VIA_MDI (type: 'asv')
 *
 *   Dictionary where each element has keys:
 *   - mdi-power-support (type: 'u')
 *   - power-class (type: 'u')
 *   - pse-power-pair (type: 'u')
 * - #NM_LLDP_ATTR_MANAGEMENT_ADDRESSES (type: 'aasv')
 *
 *   An array of dictionaries where each element has keys:
 *   - address (type: 'ay')
 *   - address-subtype (type: 'u')
 *   - interface-number (type: 'u')
 *   - interface-number-subtype (type: 'u')
 *   - object-id (type: 'ay')
 * - #NM_LLDP_ATTR_PORT_DESCRIPTION (type: 's')
 * - #NM_LLDP_ATTR_PORT_ID_TYPE (type: 'u')
 * - #NM_LLDP_ATTR_PORT_ID (type: 's')
 * - #NM_LLDP_ATTR_RAW (type: 'ay')
 * - #NM_LLDP_ATTR_SYSTEM_CAPABILITIES (type: 'u')
 * - #NM_LLDP_ATTR_SYSTEM_DESCRIPTION (type: 's')
 * - #NM_LLDP_ATTR_SYSTEM_NAME (type: 's')
 * }

function nm_device_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function nm_device_get_iface(device:PNMDevice):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_get_ip_iface(device:PNMDevice):Pchar;cdecl;external;
function nm_device_get_device_type(device:PNMDevice):TNMDeviceType;cdecl;external;
(* Const before type ignored *)
function nm_device_get_udi(device:PNMDevice):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_get_path(device:PNMDevice):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_get_driver(device:PNMDevice):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_get_driver_version(device:PNMDevice):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_get_firmware_version(device:PNMDevice):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_get_type_description(device:PNMDevice):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_get_hw_address(device:PNMDevice):Pchar;cdecl;external;
function nm_device_get_capabilities(device:PNMDevice):TNMDeviceCapabilities;cdecl;external;
function nm_device_get_managed(device:PNMDevice):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_device_get_ports(device:PNMDevice):PGPtrArray;cdecl;external;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx NM_DEPRECATED_IN_1_22 }
{xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
procedure nm_device_set_managed(device:PNMDevice; managed:Tgboolean);cdecl;external;
function nm_device_get_autoconnect(device:PNMDevice):Tgboolean;cdecl;external;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx NM_DEPRECATED_IN_1_22 }
{xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
procedure nm_device_set_autoconnect(device:PNMDevice; autoconnect:Tgboolean);cdecl;external;
function nm_device_get_firmware_missing(device:PNMDevice):Tgboolean;cdecl;external;
function nm_device_get_nm_plugin_missing(device:PNMDevice):Tgboolean;cdecl;external;
function nm_device_get_ip4_config(device:PNMDevice):PNMIPConfig;cdecl;external;
function nm_device_get_dhcp4_config(device:PNMDevice):PNMDhcpConfig;cdecl;external;
function nm_device_get_ip6_config(device:PNMDevice):PNMIPConfig;cdecl;external;
function nm_device_get_dhcp6_config(device:PNMDevice):PNMDhcpConfig;cdecl;external;
function nm_device_get_connectivity(device:PNMDevice; addr_family:longint):TNMConnectivityState;cdecl;external;
function nm_device_get_state(device:PNMDevice):TNMDeviceState;cdecl;external;
function nm_device_get_state_reason(device:PNMDevice):TNMDeviceStateReason;cdecl;external;
function nm_device_get_active_connection(device:PNMDevice):PNMActiveConnection;cdecl;external;
(* Const before type ignored *)
function nm_device_get_available_connections(device:PNMDevice):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function nm_device_get_physical_port_id(device:PNMDevice):Pchar;cdecl;external;
function nm_device_get_mtu(device:PNMDevice):Tguint32;cdecl;external;
function nm_device_is_real(device:PNMDevice):Tgboolean;cdecl;external;
function nm_device_is_software(device:PNMDevice):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_device_get_product(device:PNMDevice):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_get_vendor(device:PNMDevice):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_get_description(device:PNMDevice):Pchar;cdecl;external;
function nm_device_get_metered(device:PNMDevice):TNMMetered;cdecl;external;
function nm_device_get_lldp_neighbors(device:PNMDevice):PGPtrArray;cdecl;external;
function nm_device_get_interface_flags(device:PNMDevice):TNMDeviceInterfaceFlags;cdecl;external;
function nm_device_disambiguate_names(devices:PPNMDevice; num_devices:longint):^Pchar;cdecl;external;
{xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_device_reapply(device:PNMDevice; connection:PNMConnection; version_id:Tguint64; flags:Tguint32; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external;
procedure nm_device_reapply_async(device:PNMDevice; connection:PNMConnection; version_id:Tguint64; flags:Tguint32; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_device_reapply_finish(device:PNMDevice; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_device_get_applied_connection(device:PNMDevice; flags:Tguint32; version_id:Pguint64; cancellable:PGCancellable; error:PPGError):PNMConnection;cdecl;external;
procedure nm_device_get_applied_connection_async(device:PNMDevice; flags:Tguint32; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_device_get_applied_connection_finish(device:PNMDevice; result:PGAsyncResult; version_id:Pguint64; error:PPGError):PNMConnection;cdecl;external;
{xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_device_disconnect(device:PNMDevice; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure nm_device_disconnect_async(device:PNMDevice; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_device_disconnect_finish(device:PNMDevice; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_device_delete(device:PNMDevice; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure nm_device_delete_async(device:PNMDevice; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_device_delete_finish(device:PNMDevice; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_device_filter_connections(device:PNMDevice; connections:PGPtrArray):PGPtrArray;cdecl;external;
function nm_device_connection_valid(device:PNMDevice; connection:PNMConnection):Tgboolean;cdecl;external;
function nm_device_connection_compatible(device:PNMDevice; connection:PNMConnection; error:PPGError):Tgboolean;cdecl;external;
function nm_device_get_setting_type(device:PNMDevice):TGType;cdecl;external;
function nm_lldp_neighbor_get_type:TGType;cdecl;external;
procedure nm_lldp_neighbor_ref(neighbor:PNMLldpNeighbor);cdecl;external;
procedure nm_lldp_neighbor_unref(neighbor:PNMLldpNeighbor);cdecl;external;
function nm_lldp_neighbor_get_attr_names(neighbor:PNMLldpNeighbor):^Pchar;cdecl;external;
(* Const before type ignored *)
function nm_lldp_neighbor_get_attr_value(neighbor:PNMLldpNeighbor; name:Pchar):PGVariant;cdecl;external;
function nm_lldp_neighbor_new:PNMLldpNeighbor;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_lldp_neighbor_get_attr_string_value(neighbor:PNMLldpNeighbor; name:Pchar; out_value:PPchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_lldp_neighbor_get_attr_uint_value(neighbor:PNMLldpNeighbor; name:Pchar; out_value:Pguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_lldp_neighbor_get_attr_type(neighbor:PNMLldpNeighbor; name:Pchar):PGVariantType;cdecl;external;
{$endif}
{ __NM_DEVICE_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE:=nm_device_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE(obj : longint) : longint;
begin
  NM_DEVICE:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE,NMDevice);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE,NMDeviceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE(obj : longint) : longint;
begin
  NM_IS_DEVICE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE,NMDeviceClass);
end;


end.
