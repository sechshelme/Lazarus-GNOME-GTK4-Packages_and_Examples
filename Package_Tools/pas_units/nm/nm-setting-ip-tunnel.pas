unit nm_setting_ip_tunnel;

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
{$ifndef __NM_SETTING_IP_TUNNEL_H__}
{$define __NM_SETTING_IP_TUNNEL_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

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

function nm_setting_ip_tunnel_get_type:TGType;cdecl;external libnm;
function nm_setting_ip_tunnel_new:PNMSetting;cdecl;external libnm;
function nm_setting_ip_tunnel_get_parent(setting:PNMSettingIPTunnel):Pchar;cdecl;external libnm;
function nm_setting_ip_tunnel_get_mode(setting:PNMSettingIPTunnel):TNMIPTunnelMode;cdecl;external libnm;
function nm_setting_ip_tunnel_get_local(setting:PNMSettingIPTunnel):Pchar;cdecl;external libnm;
function nm_setting_ip_tunnel_get_remote(setting:PNMSettingIPTunnel):Pchar;cdecl;external libnm;
function nm_setting_ip_tunnel_get_ttl(setting:PNMSettingIPTunnel):Tguint;cdecl;external libnm;
function nm_setting_ip_tunnel_get_tos(setting:PNMSettingIPTunnel):Tguint;cdecl;external libnm;
function nm_setting_ip_tunnel_get_path_mtu_discovery(setting:PNMSettingIPTunnel):Tgboolean;cdecl;external libnm;
function nm_setting_ip_tunnel_get_input_key(setting:PNMSettingIPTunnel):Pchar;cdecl;external libnm;
function nm_setting_ip_tunnel_get_output_key(setting:PNMSettingIPTunnel):Pchar;cdecl;external libnm;
function nm_setting_ip_tunnel_get_encapsulation_limit(setting:PNMSettingIPTunnel):Tguint;cdecl;external libnm;
function nm_setting_ip_tunnel_get_flow_label(setting:PNMSettingIPTunnel):Tguint;cdecl;external libnm;
function nm_setting_ip_tunnel_get_fwmark(setting:PNMSettingIPTunnel):Tguint32;cdecl;external libnm;
function nm_setting_ip_tunnel_get_mtu(setting:PNMSettingIPTunnel):Tguint;cdecl;external libnm;
function nm_setting_ip_tunnel_get_flags(setting:PNMSettingIPTunnel):TNMIPTunnelFlags;cdecl;external libnm;
{$endif}
{ __NM_SETTING_IP_TUNNEL_H__  }

// === Konventiert am: 19-4-26 19:26:30 ===

function NM_TYPE_SETTING_IP_TUNNEL : TGType;
function NM_SETTING_IP_TUNNEL(obj : Pointer) : PNMSettingIPTunnel;
function NM_SETTING_IP_TUNNEL_CLASS(klass : Pointer) : PNMSettingIPTunnelClass;
function NM_IS_SETTING_IP_TUNNEL(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_IP_TUNNEL_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_IP_TUNNEL_GET_CLASS(obj : Pointer) : PNMSettingIPTunnelClass;

implementation

function NM_TYPE_SETTING_IP_TUNNEL : TGType;
  begin
    NM_TYPE_SETTING_IP_TUNNEL:=nm_setting_ip_tunnel_get_type;
  end;

function NM_SETTING_IP_TUNNEL(obj : Pointer) : PNMSettingIPTunnel;
begin
  Result := PNMSettingIPTunnel(g_type_check_instance_cast(obj, NM_TYPE_SETTING_IP_TUNNEL));
end;

function NM_SETTING_IP_TUNNEL_CLASS(klass : Pointer) : PNMSettingIPTunnelClass;
begin
  Result := PNMSettingIPTunnelClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_IP_TUNNEL));
end;

function NM_IS_SETTING_IP_TUNNEL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_IP_TUNNEL);
end;

function NM_IS_SETTING_IP_TUNNEL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_IP_TUNNEL);
end;

function NM_SETTING_IP_TUNNEL_GET_CLASS(obj : Pointer) : PNMSettingIPTunnelClass;
begin
  Result := PNMSettingIPTunnelClass(PGTypeInstance(obj)^.g_class);
end;



end.
