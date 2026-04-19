
unit nm-device-ip-tunnel;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-ip-tunnel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-ip-tunnel.h
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
PNMDevice  = ^NMDevice;
PNMDeviceIPTunnel  = ^NMDeviceIPTunnel;
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

{ was #define dname def_expr }
function NM_TYPE_DEVICE_IP_TUNNEL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_IP_TUNNEL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_IP_TUNNEL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_IP_TUNNEL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_IP_TUNNEL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_IP_TUNNEL_GET_CLASS(obj : longint) : longint;

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

function nm_device_ip_tunnel_get_type:TGType;cdecl;external;
function nm_device_ip_tunnel_get_parent(device:PNMDeviceIPTunnel):PNMDevice;cdecl;external;
function nm_device_ip_tunnel_get_mode(device:PNMDeviceIPTunnel):TNMIPTunnelMode;cdecl;external;
(* Const before type ignored *)
function nm_device_ip_tunnel_get_local(device:PNMDeviceIPTunnel):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_ip_tunnel_get_remote(device:PNMDeviceIPTunnel):Pchar;cdecl;external;
function nm_device_ip_tunnel_get_ttl(device:PNMDeviceIPTunnel):Tguint8;cdecl;external;
function nm_device_ip_tunnel_get_tos(device:PNMDeviceIPTunnel):Tguint8;cdecl;external;
function nm_device_ip_tunnel_get_path_mtu_discovery(device:PNMDeviceIPTunnel):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_device_ip_tunnel_get_input_key(device:PNMDeviceIPTunnel):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_ip_tunnel_get_output_key(device:PNMDeviceIPTunnel):Pchar;cdecl;external;
function nm_device_ip_tunnel_get_encapsulation_limit(device:PNMDeviceIPTunnel):Tguint8;cdecl;external;
function nm_device_ip_tunnel_get_flow_label(device:PNMDeviceIPTunnel):Tguint;cdecl;external;
function nm_device_ip_tunnel_get_fwmark(device:PNMDeviceIPTunnel):Tguint32;cdecl;external;
function nm_device_ip_tunnel_get_flags(device:PNMDeviceIPTunnel):TNMIPTunnelFlags;cdecl;external;
{$endif}
{ __NM_DEVICE_IP_TUNNEL_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_IP_TUNNEL : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_IP_TUNNEL:=nm_device_ip_tunnel_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_IP_TUNNEL(obj : longint) : longint;
begin
  NM_DEVICE_IP_TUNNEL:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_IP_TUNNEL,NMDeviceIPTunnel);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_IP_TUNNEL_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_IP_TUNNEL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_IP_TUNNEL,NMDeviceIPTunnelClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_IP_TUNNEL(obj : longint) : longint;
begin
  NM_IS_DEVICE_IP_TUNNEL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_IP_TUNNEL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_IP_TUNNEL_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_IP_TUNNEL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_IP_TUNNEL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_IP_TUNNEL_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_IP_TUNNEL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_IP_TUNNEL,NMDeviceIPTunnelClass);
end;


end.
