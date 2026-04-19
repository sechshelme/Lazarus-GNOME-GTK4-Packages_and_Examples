
unit nm-device-vxlan;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-vxlan.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-vxlan.h
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
PNMDeviceVxlan  = ^NMDeviceVxlan;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2015 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_VXLAN_H__}
{$define __NM_DEVICE_VXLAN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_VXLAN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VXLAN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VXLAN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VXLAN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VXLAN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VXLAN_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_VXLAN_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_VXLAN_CARRIER = 'carrier';  
  NM_DEVICE_VXLAN_PARENT = 'parent';  
  NM_DEVICE_VXLAN_ID = 'id';  
  NM_DEVICE_VXLAN_GROUP = 'group';  
  NM_DEVICE_VXLAN_LOCAL = 'local';  
  NM_DEVICE_VXLAN_SRC_PORT_MIN = 'src-port-min';  
  NM_DEVICE_VXLAN_SRC_PORT_MAX = 'src-port-max';  
  NM_DEVICE_VXLAN_LEARNING = 'learning';  
  NM_DEVICE_VXLAN_AGEING = 'ageing';  
  NM_DEVICE_VXLAN_TOS = 'tos';  
  NM_DEVICE_VXLAN_TTL = 'ttl';  
  NM_DEVICE_VXLAN_LIMIT = 'limit';  
  NM_DEVICE_VXLAN_PROXY = 'proxy';  
  NM_DEVICE_VXLAN_RSC = 'rsc';  
  NM_DEVICE_VXLAN_L2MISS = 'l2miss';  
  NM_DEVICE_VXLAN_L3MISS = 'l3miss';  
  NM_DEVICE_VXLAN_DST_PORT = 'dst-port';  
{*
 * NMDeviceVxlan:
 *
 * Since: 1.2
  }
type

function nm_device_vxlan_get_type:TGType;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
(* Const before type ignored *)
function nm_device_vxlan_get_hw_address(device:PNMDeviceVxlan):Pchar;cdecl;external;
function nm_device_vxlan_get_carrier(device:PNMDeviceVxlan):Tgboolean;cdecl;external;
function nm_device_vxlan_get_parent(device:PNMDeviceVxlan):PNMDevice;cdecl;external;
function nm_device_vxlan_get_id(device:PNMDeviceVxlan):Tguint;cdecl;external;
(* Const before type ignored *)
function nm_device_vxlan_get_group(device:PNMDeviceVxlan):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_vxlan_get_local(device:PNMDeviceVxlan):Pchar;cdecl;external;
function nm_device_vxlan_get_src_port_min(device:PNMDeviceVxlan):Tguint;cdecl;external;
function nm_device_vxlan_get_src_port_max(device:PNMDeviceVxlan):Tguint;cdecl;external;
function nm_device_vxlan_get_dst_port(device:PNMDeviceVxlan):Tguint;cdecl;external;
function nm_device_vxlan_get_learning(device:PNMDeviceVxlan):Tgboolean;cdecl;external;
function nm_device_vxlan_get_ageing(device:PNMDeviceVxlan):Tguint;cdecl;external;
function nm_device_vxlan_get_tos(device:PNMDeviceVxlan):Tguint;cdecl;external;
function nm_device_vxlan_get_ttl(device:PNMDeviceVxlan):Tguint;cdecl;external;
function nm_device_vxlan_get_limit(device:PNMDeviceVxlan):Tguint;cdecl;external;
function nm_device_vxlan_get_proxy(device:PNMDeviceVxlan):Tgboolean;cdecl;external;
function nm_device_vxlan_get_rsc(device:PNMDeviceVxlan):Tgboolean;cdecl;external;
function nm_device_vxlan_get_l2miss(device:PNMDeviceVxlan):Tgboolean;cdecl;external;
function nm_device_vxlan_get_l3miss(device:PNMDeviceVxlan):Tgboolean;cdecl;external;
{$endif}
{ __NM_DEVICE_VXLAN_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_VXLAN : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_VXLAN:=nm_device_vxlan_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VXLAN(obj : longint) : longint;
begin
  NM_DEVICE_VXLAN:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_VXLAN,NMDeviceVxlan);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VXLAN_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_VXLAN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_VXLAN,NMDeviceVxlanClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VXLAN(obj : longint) : longint;
begin
  NM_IS_DEVICE_VXLAN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_VXLAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VXLAN_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_VXLAN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_VXLAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VXLAN_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_VXLAN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_VXLAN,NMDeviceVxlanClass);
end;


end.
