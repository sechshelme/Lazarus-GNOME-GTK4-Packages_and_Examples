
unit nm-setting-ip-tunnel;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-ip-tunnel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-ip-tunnel.h
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
PNMIPTunnelFlags  = ^NMIPTunnelFlags;
PNMSetting  = ^NMSetting;
PNMSettingIPTunnel  = ^NMSettingIPTunnel;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2015 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_IP_TUNNEL_H__}
{$define __NM_SETTING_IP_TUNNEL_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_IP_TUNNEL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_IP_TUNNEL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_IP_TUNNEL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_IP_TUNNEL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_IP_TUNNEL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_IP_TUNNEL_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_IP_TUNNEL_SETTING_NAME = 'ip-tunnel';  
  NM_SETTING_IP_TUNNEL_PARENT = 'parent';  
  NM_SETTING_IP_TUNNEL_MODE = 'mode';  
  NM_SETTING_IP_TUNNEL_LOCAL = 'local';  
  NM_SETTING_IP_TUNNEL_REMOTE = 'remote';  
  NM_SETTING_IP_TUNNEL_TTL = 'ttl';  
  NM_SETTING_IP_TUNNEL_TOS = 'tos';  
  NM_SETTING_IP_TUNNEL_PATH_MTU_DISCOVERY = 'path-mtu-discovery';  
  NM_SETTING_IP_TUNNEL_INPUT_KEY = 'input-key';  
  NM_SETTING_IP_TUNNEL_OUTPUT_KEY = 'output-key';  
  NM_SETTING_IP_TUNNEL_ENCAPSULATION_LIMIT = 'encapsulation-limit';  
  NM_SETTING_IP_TUNNEL_FLOW_LABEL = 'flow-label';  
  NM_SETTING_IP_TUNNEL_FWMARK = 'fwmark';  
  NM_SETTING_IP_TUNNEL_MTU = 'mtu';  
  NM_SETTING_IP_TUNNEL_FLAGS = 'flags';  
type
{*
 * NMIPTunnelFlags:
 * @NM_IP_TUNNEL_FLAG_NONE: no flag
 * @NM_IP_TUNNEL_FLAG_IP6_IGN_ENCAP_LIMIT: don't add encapsulation limit
 *     if one isn't present in inner packet
 * @NM_IP_TUNNEL_FLAG_IP6_USE_ORIG_TCLASS: copy the traffic class field
 *     from the inner packet
 * @NM_IP_TUNNEL_FLAG_IP6_USE_ORIG_FLOWLABEL: copy the flowlabel from the
 *     inner packet
 * @NM_IP_TUNNEL_FLAG_IP6_MIP6_DEV: used for Mobile IPv6
 * @NM_IP_TUNNEL_FLAG_IP6_RCV_DSCP_COPY: copy DSCP from the outer packet
 * @NM_IP_TUNNEL_FLAG_IP6_USE_ORIG_FWMARK: copy fwmark from inner packet
 *
 * IP tunnel flags.
 *
 * Since: 1.12
  }
{< prefix=NM_IP_TUNNEL_FLAG, flags > }
  PNMIPTunnelFlags = ^TNMIPTunnelFlags;
  TNMIPTunnelFlags =  Longint;
  Const
    NM_IP_TUNNEL_FLAG_NONE = $0;
    NM_IP_TUNNEL_FLAG_IP6_IGN_ENCAP_LIMIT = $1;
    NM_IP_TUNNEL_FLAG_IP6_USE_ORIG_TCLASS = $2;
    NM_IP_TUNNEL_FLAG_IP6_USE_ORIG_FLOWLABEL = $4;
    NM_IP_TUNNEL_FLAG_IP6_MIP6_DEV = $8;
    NM_IP_TUNNEL_FLAG_IP6_RCV_DSCP_COPY = $10;
    NM_IP_TUNNEL_FLAG_IP6_USE_ORIG_FWMARK = $20;
;

function nm_setting_ip_tunnel_get_type:TGType;cdecl;external;
function nm_setting_ip_tunnel_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_ip_tunnel_get_parent(setting:PNMSettingIPTunnel):Pchar;cdecl;external;
function nm_setting_ip_tunnel_get_mode(setting:PNMSettingIPTunnel):TNMIPTunnelMode;cdecl;external;
(* Const before type ignored *)
function nm_setting_ip_tunnel_get_local(setting:PNMSettingIPTunnel):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_ip_tunnel_get_remote(setting:PNMSettingIPTunnel):Pchar;cdecl;external;
function nm_setting_ip_tunnel_get_ttl(setting:PNMSettingIPTunnel):Tguint;cdecl;external;
function nm_setting_ip_tunnel_get_tos(setting:PNMSettingIPTunnel):Tguint;cdecl;external;
function nm_setting_ip_tunnel_get_path_mtu_discovery(setting:PNMSettingIPTunnel):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_setting_ip_tunnel_get_input_key(setting:PNMSettingIPTunnel):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_ip_tunnel_get_output_key(setting:PNMSettingIPTunnel):Pchar;cdecl;external;
function nm_setting_ip_tunnel_get_encapsulation_limit(setting:PNMSettingIPTunnel):Tguint;cdecl;external;
function nm_setting_ip_tunnel_get_flow_label(setting:PNMSettingIPTunnel):Tguint;cdecl;external;
function nm_setting_ip_tunnel_get_fwmark(setting:PNMSettingIPTunnel):Tguint32;cdecl;external;
function nm_setting_ip_tunnel_get_mtu(setting:PNMSettingIPTunnel):Tguint;cdecl;external;
function nm_setting_ip_tunnel_get_flags(setting:PNMSettingIPTunnel):TNMIPTunnelFlags;cdecl;external;
{$endif}
{ __NM_SETTING_IP_TUNNEL_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_IP_TUNNEL : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_IP_TUNNEL:=nm_setting_ip_tunnel_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_IP_TUNNEL(obj : longint) : longint;
begin
  NM_SETTING_IP_TUNNEL:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_IP_TUNNEL,NMSettingIPTunnel);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_IP_TUNNEL_CLASS(klass : longint) : longint;
begin
  NM_SETTING_IP_TUNNEL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_IP_TUNNEL,NMSettingIPTunnelClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_IP_TUNNEL(obj : longint) : longint;
begin
  NM_IS_SETTING_IP_TUNNEL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_IP_TUNNEL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_IP_TUNNEL_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_IP_TUNNEL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_IP_TUNNEL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_IP_TUNNEL_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_IP_TUNNEL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_IP_TUNNEL,NMSettingIPTunnelClass);
end;


end.
