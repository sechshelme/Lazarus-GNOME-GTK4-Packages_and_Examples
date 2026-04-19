
unit nm-setting-wireguard;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-wireguard.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-wireguard.h
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
Pgboolean  = ^gboolean;
PGError  = ^GError;
Pguint  = ^guint;
PNMSetting  = ^NMSetting;
PNMSettingWireGuard  = ^NMSettingWireGuard;
PNMWireGuardPeer  = ^NMWireGuardPeer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2018 - 2019 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_WIREGUARD_H__}
{$define __NM_SETTING_WIREGUARD_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}
{$include "nm-utils.h"}
{*************************************************************************** }

const
  NM_WIREGUARD_PUBLIC_KEY_LEN = 32;  
  NM_WIREGUARD_SYMMETRIC_KEY_LEN = 32;  
{*************************************************************************** }
type

function nm_wireguard_peer_get_type:TGType;cdecl;external;
function nm_wireguard_peer_new:PNMWireGuardPeer;cdecl;external;
(* Const before type ignored *)
function nm_wireguard_peer_new_clone(self:PNMWireGuardPeer; with_secrets:Tgboolean):PNMWireGuardPeer;cdecl;external;
function nm_wireguard_peer_ref(self:PNMWireGuardPeer):PNMWireGuardPeer;cdecl;external;
procedure nm_wireguard_peer_unref(self:PNMWireGuardPeer);cdecl;external;
procedure nm_wireguard_peer_seal(self:PNMWireGuardPeer);cdecl;external;
(* Const before type ignored *)
function nm_wireguard_peer_is_sealed(self:PNMWireGuardPeer):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_wireguard_peer_get_public_key(self:PNMWireGuardPeer):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_wireguard_peer_set_public_key(self:PNMWireGuardPeer; public_key:Pchar; accept_invalid:Tgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_wireguard_peer_get_preshared_key(self:PNMWireGuardPeer):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_wireguard_peer_set_preshared_key(self:PNMWireGuardPeer; preshared_key:Pchar; accept_invalid:Tgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_wireguard_peer_get_preshared_key_flags(self:PNMWireGuardPeer):TNMSettingSecretFlags;cdecl;external;
procedure nm_wireguard_peer_set_preshared_key_flags(self:PNMWireGuardPeer; preshared_key_flags:TNMSettingSecretFlags);cdecl;external;
(* Const before type ignored *)
function nm_wireguard_peer_get_persistent_keepalive(self:PNMWireGuardPeer):Tguint16;cdecl;external;
procedure nm_wireguard_peer_set_persistent_keepalive(self:PNMWireGuardPeer; persistent_keepalive:Tguint16);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_wireguard_peer_get_endpoint(self:PNMWireGuardPeer):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_wireguard_peer_set_endpoint(self:PNMWireGuardPeer; endpoint:Pchar; allow_invalid:Tgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_wireguard_peer_get_allowed_ips_len(self:PNMWireGuardPeer):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_wireguard_peer_get_allowed_ip(self:PNMWireGuardPeer; idx:Tguint; out_is_valid:Pgboolean):Pchar;cdecl;external;
procedure nm_wireguard_peer_clear_allowed_ips(self:PNMWireGuardPeer);cdecl;external;
(* Const before type ignored *)
function nm_wireguard_peer_append_allowed_ip(self:PNMWireGuardPeer; allowed_ip:Pchar; accept_invalid:Tgboolean):Tgboolean;cdecl;external;
function nm_wireguard_peer_remove_allowed_ip(self:PNMWireGuardPeer; idx:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_wireguard_peer_is_valid(self:PNMWireGuardPeer; check_non_secrets:Tgboolean; check_secrets:Tgboolean; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_wireguard_peer_cmp(a:PNMWireGuardPeer; b:PNMWireGuardPeer; compare_flags:TNMSettingCompareFlags):longint;cdecl;external;
{*************************************************************************** }
{ was #define dname def_expr }
function NM_TYPE_SETTING_WIREGUARD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIREGUARD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIREGUARD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIREGUARD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIREGUARD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIREGUARD_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_WIREGUARD_SETTING_NAME = 'wireguard';  
  NM_SETTING_WIREGUARD_FWMARK = 'fwmark';  
  NM_SETTING_WIREGUARD_LISTEN_PORT = 'listen-port';  
  NM_SETTING_WIREGUARD_PRIVATE_KEY = 'private-key';  
  NM_SETTING_WIREGUARD_PRIVATE_KEY_FLAGS = 'private-key-flags';  
  NM_SETTING_WIREGUARD_PEERS = 'peers';  
  NM_SETTING_WIREGUARD_MTU = 'mtu';  
  NM_SETTING_WIREGUARD_PEER_ROUTES = 'peer-routes';  
  NM_SETTING_WIREGUARD_IP4_AUTO_DEFAULT_ROUTE = 'ip4-auto-default-route';  
  NM_SETTING_WIREGUARD_IP6_AUTO_DEFAULT_ROUTE = 'ip6-auto-default-route';  
  NM_WIREGUARD_PEER_ATTR_ALLOWED_IPS = 'allowed-ips';  
  NM_WIREGUARD_PEER_ATTR_ENDPOINT = 'endpoint';  
  NM_WIREGUARD_PEER_ATTR_PERSISTENT_KEEPALIVE = 'persistent-keepalive';  
  NM_WIREGUARD_PEER_ATTR_PRESHARED_KEY = 'preshared-key';  
  NM_WIREGUARD_PEER_ATTR_PRESHARED_KEY_FLAGS = 'preshared-key-flags';  
  NM_WIREGUARD_PEER_ATTR_PUBLIC_KEY = 'public-key';  
{*************************************************************************** }
type

function nm_setting_wireguard_get_type:TGType;cdecl;external;
function nm_setting_wireguard_new:PNMSetting;cdecl;external;
{*************************************************************************** }
(* Const before type ignored *)
function nm_setting_wireguard_get_private_key(self:PNMSettingWireGuard):Pchar;cdecl;external;
function nm_setting_wireguard_get_private_key_flags(self:PNMSettingWireGuard):TNMSettingSecretFlags;cdecl;external;
function nm_setting_wireguard_get_listen_port(self:PNMSettingWireGuard):Tguint16;cdecl;external;
function nm_setting_wireguard_get_fwmark(self:PNMSettingWireGuard):Tguint32;cdecl;external;
{*************************************************************************** }
function nm_setting_wireguard_get_peers_len(self:PNMSettingWireGuard):Tguint;cdecl;external;
function nm_setting_wireguard_get_peer(self:PNMSettingWireGuard; idx:Tguint):PNMWireGuardPeer;cdecl;external;
(* Const before type ignored *)
function nm_setting_wireguard_get_peer_by_public_key(self:PNMSettingWireGuard; public_key:Pchar; out_idx:Pguint):PNMWireGuardPeer;cdecl;external;
procedure nm_setting_wireguard_set_peer(self:PNMSettingWireGuard; peer:PNMWireGuardPeer; idx:Tguint);cdecl;external;
procedure nm_setting_wireguard_append_peer(self:PNMSettingWireGuard; peer:PNMWireGuardPeer);cdecl;external;
function nm_setting_wireguard_remove_peer(self:PNMSettingWireGuard; idx:Tguint):Tgboolean;cdecl;external;
function nm_setting_wireguard_clear_peers(self:PNMSettingWireGuard):Tguint;cdecl;external;
function nm_setting_wireguard_get_peer_routes(self:PNMSettingWireGuard):Tgboolean;cdecl;external;
function nm_setting_wireguard_get_mtu(self:PNMSettingWireGuard):Tguint32;cdecl;external;
function nm_setting_wireguard_get_ip4_auto_default_route(self:PNMSettingWireGuard):TNMTernary;cdecl;external;
function nm_setting_wireguard_get_ip6_auto_default_route(self:PNMSettingWireGuard):TNMTernary;cdecl;external;
{*************************************************************************** }
{$endif}
{ __NM_SETTING_WIREGUARD_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_WIREGUARD : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_WIREGUARD:=nm_setting_wireguard_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIREGUARD(obj : longint) : longint;
begin
  NM_SETTING_WIREGUARD:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_WIREGUARD,NMSettingWireGuard);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIREGUARD_CLASS(klass : longint) : longint;
begin
  NM_SETTING_WIREGUARD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_WIREGUARD,NMSettingWireGuardClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIREGUARD(obj : longint) : longint;
begin
  NM_IS_SETTING_WIREGUARD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_WIREGUARD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_WIREGUARD_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_WIREGUARD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_WIREGUARD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_WIREGUARD_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_WIREGUARD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_WIREGUARD,NMSettingWireGuardClass);
end;


end.
