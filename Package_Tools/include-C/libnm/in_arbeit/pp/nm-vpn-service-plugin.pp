
unit nm-vpn-service-plugin;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-vpn-service-plugin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-vpn-service-plugin.h
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
PGDBusConnection  = ^GDBusConnection;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
PGVariant  = ^GVariant;
PNMConnection  = ^NMConnection;
PNMSettingSecretFlags  = ^NMSettingSecretFlags;
PNMVpnServicePlugin  = ^NMVpnServicePlugin;
PNMVpnServicePluginClass  = ^NMVpnServicePluginClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Novell, Inc.
 * Copyright (C) 2007 - 2015 Red Hat, Inc.
  }
{$ifndef __NM_VPN_SERVICE_PLUGIN_H__}
{$define __NM_VPN_SERVICE_PLUGIN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include <gio/gio.h>}
{$include "nm-vpn-dbus-interface.h"}
{$include "nm-connection.h"}

{ was #define dname def_expr }
function NM_TYPE_VPN_SERVICE_PLUGIN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_SERVICE_PLUGIN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_SERVICE_PLUGIN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_SERVICE_PLUGIN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_SERVICE_PLUGIN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_SERVICE_PLUGIN_GET_CLASS(obj : longint) : longint;

const
  NM_VPN_SERVICE_PLUGIN_DBUS_SERVICE_NAME = 'service-name';  
  NM_VPN_SERVICE_PLUGIN_DBUS_WATCH_PEER = 'watch-peer';  
  NM_VPN_SERVICE_PLUGIN_STATE = 'state';  
{*
 * NMVpnServicePlugin:
 *
 * Since: 1.2
  }
type
  PNMVpnServicePlugin = ^TNMVpnServicePlugin;
  TNMVpnServicePlugin = record
      parent : TGObject;
    end;
{ Signals  }
(* Const before type ignored *)
{ virtual methods  }
(* Const before type ignored *)
{< private > }

  PNMVpnServicePluginClass = ^TNMVpnServicePluginClass;
  TNMVpnServicePluginClass = record
      parent : TGObjectClass;
      state_changed : procedure (plugin:PNMVpnServicePlugin; state:TNMVpnServiceState);cdecl;
      ip4_config : procedure (plugin:PNMVpnServicePlugin; ip4_config:PGVariant);cdecl;
      login_banner : procedure (plugin:PNMVpnServicePlugin; banner:Pchar);cdecl;
      failure : procedure (plugin:PNMVpnServicePlugin; reason:TNMVpnPluginFailure);cdecl;
      quit : procedure (plugin:PNMVpnServicePlugin);cdecl;
      config : procedure (plugin:PNMVpnServicePlugin; config:PGVariant);cdecl;
      ip6_config : procedure (plugin:PNMVpnServicePlugin; config:PGVariant);cdecl;
      connect : function (plugin:PNMVpnServicePlugin; connection:PNMConnection; err:PPGError):Tgboolean;cdecl;
      need_secrets : function (plugin:PNMVpnServicePlugin; connection:PNMConnection; setting_name:PPchar; error:PPGError):Tgboolean;cdecl;
      disconnect : function (plugin:PNMVpnServicePlugin; err:PPGError):Tgboolean;cdecl;
      new_secrets : function (plugin:PNMVpnServicePlugin; connection:PNMConnection; error:PPGError):Tgboolean;cdecl;
      connect_interactive : function (plugin:PNMVpnServicePlugin; connection:PNMConnection; details:PGVariant; error:PPGError):Tgboolean;cdecl;
      padding : array[0..7] of Tgpointer;
    end;

function nm_vpn_service_plugin_get_type:TGType;cdecl;external;
function nm_vpn_service_plugin_get_connection(plugin:PNMVpnServicePlugin):PGDBusConnection;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure nm_vpn_service_plugin_secrets_required(plugin:PNMVpnServicePlugin; message:Pchar; hints:PPchar);cdecl;external;
(* Const before type ignored *)
procedure nm_vpn_service_plugin_set_login_banner(plugin:PNMVpnServicePlugin; banner:Pchar);cdecl;external;
procedure nm_vpn_service_plugin_failure(plugin:PNMVpnServicePlugin; reason:TNMVpnPluginFailure);cdecl;external;
procedure nm_vpn_service_plugin_set_config(plugin:PNMVpnServicePlugin; config:PGVariant);cdecl;external;
procedure nm_vpn_service_plugin_set_ip4_config(plugin:PNMVpnServicePlugin; ip4_config:PGVariant);cdecl;external;
procedure nm_vpn_service_plugin_set_ip6_config(plugin:PNMVpnServicePlugin; ip6_config:PGVariant);cdecl;external;
function nm_vpn_service_plugin_disconnect(plugin:PNMVpnServicePlugin; err:PPGError):Tgboolean;cdecl;external;
procedure nm_vpn_service_plugin_shutdown(plugin:PNMVpnServicePlugin);cdecl;external;
{ Utility functions  }
function nm_vpn_service_plugin_read_vpn_details(fd:longint; out_data:PPGHashTable; out_secrets:PPGHashTable):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_vpn_service_plugin_get_secret_flags(data:PGHashTable; secret_name:Pchar; out_flags:PNMSettingSecretFlags):Tgboolean;cdecl;external;
{$endif}
{ __NM_VPN_SERVICE_PLUGIN_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_VPN_SERVICE_PLUGIN : longint; { return type might be wrong }
  begin
    NM_TYPE_VPN_SERVICE_PLUGIN:=nm_vpn_service_plugin_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_SERVICE_PLUGIN(obj : longint) : longint;
begin
  NM_VPN_SERVICE_PLUGIN:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_VPN_SERVICE_PLUGIN,NMVpnServicePlugin);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_SERVICE_PLUGIN_CLASS(klass : longint) : longint;
begin
  NM_VPN_SERVICE_PLUGIN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_VPN_SERVICE_PLUGIN,NMVpnServicePluginClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_SERVICE_PLUGIN(obj : longint) : longint;
begin
  NM_IS_VPN_SERVICE_PLUGIN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_VPN_SERVICE_PLUGIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_SERVICE_PLUGIN_CLASS(klass : longint) : longint;
begin
  NM_IS_VPN_SERVICE_PLUGIN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_VPN_SERVICE_PLUGIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_SERVICE_PLUGIN_GET_CLASS(obj : longint) : longint;
begin
  NM_VPN_SERVICE_PLUGIN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_VPN_SERVICE_PLUGIN,NMVpnServicePluginClass);
end;


end.
