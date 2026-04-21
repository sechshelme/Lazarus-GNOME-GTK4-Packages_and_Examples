unit nm_device_ip_tunnel;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2015 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_IP_TUNNEL_H__}
{$define __NM_DEVICE_IP_TUNNEL_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}
{$include "nm-setting-ip-tunnel.h"}

const
  NM_DEVICE_IP_TUNNEL_MODE = 'mode';  
  NM_DEVICE_IP_TUNNEL_PARENT = 'parent';  
  NM_DEVICE_IP_TUNNEL_LOCAL = 'local';  
  NM_DEVICE_IP_TUNNEL_REMOTE = 'remote';  
  NM_DEVICE_IP_TUNNEL_TTL = 'ttl';  
  NM_DEVICE_IP_TUNNEL_TOS = 'tos';  
  NM_DEVICE_IP_TUNNEL_PATH_MTU_DISCOVERY = 'path-mtu-discovery';  
  NM_DEVICE_IP_TUNNEL_INPUT_KEY = 'input-key';  
  NM_DEVICE_IP_TUNNEL_OUTPUT_KEY = 'output-key';  
  NM_DEVICE_IP_TUNNEL_ENCAPSULATION_LIMIT = 'encapsulation-limit';  
  NM_DEVICE_IP_TUNNEL_FLOW_LABEL = 'flow-label';  
  NM_DEVICE_IP_TUNNEL_FWMARK = 'fwmark';  
  NM_DEVICE_IP_TUNNEL_FLAGS = 'flags';  
{*
 * NMDeviceIPTunnel:
 *
 * Since: 1.2
  }
type

function nm_device_ip_tunnel_get_type:TGType;cdecl;external libnm;
function nm_device_ip_tunnel_get_parent(device:PNMDeviceIPTunnel):PNMDevice;cdecl;external libnm;
function nm_device_ip_tunnel_get_mode(device:PNMDeviceIPTunnel):TNMIPTunnelMode;cdecl;external libnm;
function nm_device_ip_tunnel_get_local(device:PNMDeviceIPTunnel):Pchar;cdecl;external libnm;
function nm_device_ip_tunnel_get_remote(device:PNMDeviceIPTunnel):Pchar;cdecl;external libnm;
function nm_device_ip_tunnel_get_ttl(device:PNMDeviceIPTunnel):Tguint8;cdecl;external libnm;
function nm_device_ip_tunnel_get_tos(device:PNMDeviceIPTunnel):Tguint8;cdecl;external libnm;
function nm_device_ip_tunnel_get_path_mtu_discovery(device:PNMDeviceIPTunnel):Tgboolean;cdecl;external libnm;
function nm_device_ip_tunnel_get_input_key(device:PNMDeviceIPTunnel):Pchar;cdecl;external libnm;
function nm_device_ip_tunnel_get_output_key(device:PNMDeviceIPTunnel):Pchar;cdecl;external libnm;
function nm_device_ip_tunnel_get_encapsulation_limit(device:PNMDeviceIPTunnel):Tguint8;cdecl;external libnm;
function nm_device_ip_tunnel_get_flow_label(device:PNMDeviceIPTunnel):Tguint;cdecl;external libnm;
function nm_device_ip_tunnel_get_fwmark(device:PNMDeviceIPTunnel):Tguint32;cdecl;external libnm;
function nm_device_ip_tunnel_get_flags(device:PNMDeviceIPTunnel):TNMIPTunnelFlags;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_IP_TUNNEL_H__  }

// === Konventiert am: 19-4-26 19:30:56 ===

function NM_TYPE_DEVICE_IP_TUNNEL : TGType;
function NM_DEVICE_IP_TUNNEL(obj : Pointer) : PNMDeviceIPTunnel;
function NM_DEVICE_IP_TUNNEL_CLASS(klass : Pointer) : PNMDeviceIPTunnelClass;
function NM_IS_DEVICE_IP_TUNNEL(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_IP_TUNNEL_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_IP_TUNNEL_GET_CLASS(obj : Pointer) : PNMDeviceIPTunnelClass;

implementation

function NM_TYPE_DEVICE_IP_TUNNEL : TGType;
  begin
    NM_TYPE_DEVICE_IP_TUNNEL:=nm_device_ip_tunnel_get_type;
  end;

function NM_DEVICE_IP_TUNNEL(obj : Pointer) : PNMDeviceIPTunnel;
begin
  Result := PNMDeviceIPTunnel(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_IP_TUNNEL));
end;

function NM_DEVICE_IP_TUNNEL_CLASS(klass : Pointer) : PNMDeviceIPTunnelClass;
begin
  Result := PNMDeviceIPTunnelClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_IP_TUNNEL));
end;

function NM_IS_DEVICE_IP_TUNNEL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_IP_TUNNEL);
end;

function NM_IS_DEVICE_IP_TUNNEL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_IP_TUNNEL);
end;

function NM_DEVICE_IP_TUNNEL_GET_CLASS(obj : Pointer) : PNMDeviceIPTunnelClass;
begin
  Result := PNMDeviceIPTunnelClass(PGTypeInstance(obj)^.g_class);
end;



end.
