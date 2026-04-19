
unit nm-setting-proxy;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-proxy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-proxy.h
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
PNMSetting  = ^NMSetting;
PNMSettingProxy  = ^NMSettingProxy;
PNMSettingProxyMethod  = ^NMSettingProxyMethod;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2016 Atul Anand <atulhjp@gmail.com>.
  }
{$ifndef __NM_SETTING_PROXY_H__}
{$define __NM_SETTING_PROXY_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}
{*
 * NMSettingProxyMethod:
 * @NM_SETTING_PROXY_METHOD_NONE: No Proxy for the Connection
 * @NM_SETTING_PROXY_METHOD_AUTO: DHCP obtained Proxy/ Manual override
 *
 * The Proxy method.
 *
 * Since: 1.6
  }
type
  PNMSettingProxyMethod = ^TNMSettingProxyMethod;
  TNMSettingProxyMethod =  Longint;
  Const
    NM_SETTING_PROXY_METHOD_NONE = 0;
    NM_SETTING_PROXY_METHOD_AUTO = 1;
;

{ was #define dname def_expr }
function NM_TYPE_SETTING_PROXY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PROXY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PROXY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_PROXY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_PROXY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PROXY_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_PROXY_SETTING_NAME = 'proxy';  
  NM_SETTING_PROXY_METHOD = 'method';  
  NM_SETTING_PROXY_BROWSER_ONLY = 'browser-only';  
  NM_SETTING_PROXY_PAC_URL = 'pac-url';  
  NM_SETTING_PROXY_PAC_SCRIPT = 'pac-script';  
type

function nm_setting_proxy_get_type:TGType;cdecl;external;
function nm_setting_proxy_new:PNMSetting;cdecl;external;
function nm_setting_proxy_get_method(setting:PNMSettingProxy):TNMSettingProxyMethod;cdecl;external;
function nm_setting_proxy_get_browser_only(setting:PNMSettingProxy):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_setting_proxy_get_pac_url(setting:PNMSettingProxy):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_proxy_get_pac_script(setting:PNMSettingProxy):Pchar;cdecl;external;
{$endif}
{ __NM_SETTING_PROXY_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_PROXY : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_PROXY:=nm_setting_proxy_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PROXY(obj : longint) : longint;
begin
  NM_SETTING_PROXY:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_PROXY,NMSettingProxy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PROXY_CLASS(klass : longint) : longint;
begin
  NM_SETTING_PROXY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_PROXY,NMSettingProxyClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_PROXY(obj : longint) : longint;
begin
  NM_IS_SETTING_PROXY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_PROXY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_PROXY_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_PROXY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_PROXY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PROXY_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_PROXY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_PROXY,NMSettingProxyClass);
end;


end.
