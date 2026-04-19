
unit nm-setting-vpn;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-vpn.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-vpn.h
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
Pguint  = ^guint;
PNMSetting  = ^NMSetting;
PNMSettingVpn  = ^NMSettingVpn;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2013 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_VPN_H__}
{$define __NM_SETTING_VPN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_VPN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VPN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VPN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_VPN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_VPN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VPN_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_VPN_SETTING_NAME = 'vpn';  
  NM_SETTING_VPN_SERVICE_TYPE = 'service-type';  
  NM_SETTING_VPN_USER_NAME = 'user-name';  
  NM_SETTING_VPN_PERSISTENT = 'persistent';  
  NM_SETTING_VPN_DATA = 'data';  
  NM_SETTING_VPN_SECRETS = 'secrets';  
  NM_SETTING_VPN_TIMEOUT = 'timeout';  
type
{*
 * NMVpnIterFunc:
 * @key: the name of the data or secret item
 * @value: the value of the data or secret item
 * @user_data: User data passed to nm_setting_vpn_foreach_data_item() or
 * nm_setting_vpn_foreach_secret()
 * }
(* Const before type ignored *)
(* Const before type ignored *)

  TNMVpnIterFunc = procedure (key:Pchar; value:Pchar; user_data:Tgpointer);cdecl;

function nm_setting_vpn_get_type:TGType;cdecl;external;
function nm_setting_vpn_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_vpn_get_service_type(setting:PNMSettingVpn):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_vpn_get_user_name(setting:PNMSettingVpn):Pchar;cdecl;external;
function nm_setting_vpn_get_persistent(setting:PNMSettingVpn):Tgboolean;cdecl;external;
function nm_setting_vpn_get_num_data_items(setting:PNMSettingVpn):Tguint32;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure nm_setting_vpn_add_data_item(setting:PNMSettingVpn; key:Pchar; item:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_vpn_get_data_item(setting:PNMSettingVpn; key:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_vpn_remove_data_item(setting:PNMSettingVpn; key:Pchar):Tgboolean;cdecl;external;
procedure nm_setting_vpn_foreach_data_item(setting:PNMSettingVpn; func:TNMVpnIterFunc; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function nm_setting_vpn_get_data_keys(setting:PNMSettingVpn; out_length:Pguint):^Pchar;cdecl;external;
function nm_setting_vpn_get_num_secrets(setting:PNMSettingVpn):Tguint32;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure nm_setting_vpn_add_secret(setting:PNMSettingVpn; key:Pchar; secret:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_vpn_get_secret(setting:PNMSettingVpn; key:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_vpn_remove_secret(setting:PNMSettingVpn; key:Pchar):Tgboolean;cdecl;external;
procedure nm_setting_vpn_foreach_secret(setting:PNMSettingVpn; func:TNMVpnIterFunc; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function nm_setting_vpn_get_secret_keys(setting:PNMSettingVpn; out_length:Pguint):^Pchar;cdecl;external;
function nm_setting_vpn_get_timeout(setting:PNMSettingVpn):Tguint32;cdecl;external;
{$endif}
{ __NM_SETTING_VPN_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_VPN : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_VPN:=nm_setting_vpn_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VPN(obj : longint) : longint;
begin
  NM_SETTING_VPN:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_VPN,NMSettingVpn);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VPN_CLASS(klass : longint) : longint;
begin
  NM_SETTING_VPN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_VPN,NMSettingVpnClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_VPN(obj : longint) : longint;
begin
  NM_IS_SETTING_VPN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_VPN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_VPN_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_VPN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_VPN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VPN_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_VPN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_VPN,NMSettingVpnClass);
end;


end.
