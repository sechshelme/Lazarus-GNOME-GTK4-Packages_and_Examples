
unit nm-vpn-plugin-old;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-vpn-plugin-old.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-vpn-plugin-old.h
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
PNMVpnPluginOld  = ^NMVpnPluginOld;
PNMVpnPluginOldClass  = ^NMVpnPluginOldClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Novell, Inc.
 * Copyright (C) 2007 - 2015 Red Hat, Inc.
  }
{$ifndef __NM_VPN_PLUGIN_OLD_H__}
{$define __NM_VPN_PLUGIN_OLD_H__}
{$include <gio/gio.h>}
{$include "nm-vpn-dbus-interface.h"}
{$include "nm-connection.h"}

{ was #define dname def_expr }
function NM_TYPE_VPN_PLUGIN_OLD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_PLUGIN_OLD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_PLUGIN_OLD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_PLUGIN_OLD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_PLUGIN_OLD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_PLUGIN_OLD_GET_CLASS(obj : longint) : longint;

const
  NM_VPN_PLUGIN_OLD_DBUS_SERVICE_NAME = 'service-name';  
  NM_VPN_PLUGIN_OLD_STATE = 'state';  
{*
 * NMVpnPluginOld:
  }
{xxxx NM_DEPRECATED_IN__1_2 }
type
  PNMVpnPluginOld = ^TNMVpnPluginOld;
  TNMVpnPluginOld = record
      parent : TGObject;
    end;
{xxxx NM_DEPRECATED_IN__1_2 }
{ Signals  }
{xxxx NM_DEPRECATED_IN__1_2 }
{xxxx NM_DEPRECATED_IN__1_2 }
{xxxx NM_DEPRECATED_IN__1_2 }
(* Const before type ignored *)
{xxxx NM_DEPRECATED_IN__1_2 }
{xxxx NM_DEPRECATED_IN__1_2 }
{xxxx NM_DEPRECATED_IN__1_2 }
{xxxx NM_DEPRECATED_IN__1_2 }
{ virtual methods  }
{xxxx NM_DEPRECATED_IN__1_2 }
{xxxx NM_DEPRECATED_IN__1_2 }
(* Const before type ignored *)
{xxxx NM_DEPRECATED_IN__1_2 }
{xxxx NM_DEPRECATED_IN__1_2 }
{xxxx NM_DEPRECATED_IN__1_2 }
{< private > }
{xxxx NM_DEPRECATED_IN__1_2 }

  PNMVpnPluginOldClass = ^TNMVpnPluginOldClass;
  TNMVpnPluginOldClass = record
      parent : TGObjectClass;
      state_changed : procedure (plugin:PNMVpnPluginOld; state:TNMVpnServiceState);cdecl;
      ip4_config : procedure (plugin:PNMVpnPluginOld; ip4_config:PGVariant);cdecl;
      login_banner : procedure (plugin:PNMVpnPluginOld; banner:Pchar);cdecl;
      failure : procedure (plugin:PNMVpnPluginOld; reason:TNMVpnPluginFailure);cdecl;
      quit : procedure (plugin:PNMVpnPluginOld);cdecl;
      config : procedure (plugin:PNMVpnPluginOld; config:PGVariant);cdecl;
      ip6_config : procedure (plugin:PNMVpnPluginOld; config:PGVariant);cdecl;
      connect : function (plugin:PNMVpnPluginOld; connection:PNMConnection; err:PPGError):Tgboolean;cdecl;
      need_secrets : function (plugin:PNMVpnPluginOld; connection:PNMConnection; setting_name:PPchar; error:PPGError):Tgboolean;cdecl;
      disconnect : function (plugin:PNMVpnPluginOld; err:PPGError):Tgboolean;cdecl;
      new_secrets : function (plugin:PNMVpnPluginOld; connection:PNMConnection; error:PPGError):Tgboolean;cdecl;
      connect_interactive : function (plugin:PNMVpnPluginOld; connection:PNMConnection; details:PGVariant; error:PPGError):Tgboolean;cdecl;
      padding : array[0..7] of Tgpointer;
    end;
{xxxx NM_DEPRECATED_IN__1_2 }

function nm_vpn_plugin_old_get_type:TGType;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_vpn_plugin_old_get_connection(plugin:PNMVpnPluginOld):PGDBusConnection;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_vpn_plugin_old_get_state(plugin:PNMVpnPluginOld):TNMVpnServiceState;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
procedure nm_vpn_plugin_old_set_state(plugin:PNMVpnPluginOld; state:TNMVpnServiceState);cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
(* Const before type ignored *)
(* Const before type ignored *)
procedure nm_vpn_plugin_old_secrets_required(plugin:PNMVpnPluginOld; message:Pchar; hints:PPchar);cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
(* Const before type ignored *)
procedure nm_vpn_plugin_old_set_login_banner(plugin:PNMVpnPluginOld; banner:Pchar);cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
procedure nm_vpn_plugin_old_failure(plugin:PNMVpnPluginOld; reason:TNMVpnPluginFailure);cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
procedure nm_vpn_plugin_old_set_ip4_config(plugin:PNMVpnPluginOld; ip4_config:PGVariant);cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_vpn_plugin_old_disconnect(plugin:PNMVpnPluginOld; err:PPGError):Tgboolean;cdecl;external;
{ Utility functions  }
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_vpn_plugin_old_read_vpn_details(fd:longint; out_data:PPGHashTable; out_secrets:PPGHashTable):Tgboolean;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
(* Const before type ignored *)
function nm_vpn_plugin_old_get_secret_flags(data:PGHashTable; secret_name:Pchar; out_flags:PNMSettingSecretFlags):Tgboolean;cdecl;external;
{$endif}
{ __NM_VPN_PLUGIN_OLD_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_VPN_PLUGIN_OLD : longint; { return type might be wrong }
  begin
    NM_TYPE_VPN_PLUGIN_OLD:=nm_vpn_plugin_old_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_PLUGIN_OLD(obj : longint) : longint;
begin
  NM_VPN_PLUGIN_OLD:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_VPN_PLUGIN_OLD,NMVpnPluginOld);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_PLUGIN_OLD_CLASS(klass : longint) : longint;
begin
  NM_VPN_PLUGIN_OLD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_VPN_PLUGIN_OLD,NMVpnPluginOldClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_PLUGIN_OLD(obj : longint) : longint;
begin
  NM_IS_VPN_PLUGIN_OLD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_VPN_PLUGIN_OLD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_PLUGIN_OLD_CLASS(klass : longint) : longint;
begin
  NM_IS_VPN_PLUGIN_OLD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_VPN_PLUGIN_OLD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_PLUGIN_OLD_GET_CLASS(obj : longint) : longint;
begin
  NM_VPN_PLUGIN_OLD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_VPN_PLUGIN_OLD,NMVpnPluginOldClass);
end;


end.
