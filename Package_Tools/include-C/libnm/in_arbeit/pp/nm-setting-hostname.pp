
unit nm-setting-hostname;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-hostname.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-hostname.h
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
PNMSetting  = ^NMSetting;
PNMSettingHostname  = ^NMSettingHostname;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2020 Red Hat, Inc.
  }
{$ifndef NM_SETTING_HOSTNAME_H}
{$define NM_SETTING_HOSTNAME_H}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_HOSTNAME : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_HOSTNAME(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_HOSTNAME_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_HOSTNAME(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_HOSTNAME_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_HOSTNAME_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_HOSTNAME_SETTING_NAME = 'hostname';  
  NM_SETTING_HOSTNAME_PRIORITY = 'priority';  
  NM_SETTING_HOSTNAME_FROM_DHCP = 'from-dhcp';  
  NM_SETTING_HOSTNAME_FROM_DNS_LOOKUP = 'from-dns-lookup';  
  NM_SETTING_HOSTNAME_ONLY_FROM_DEFAULT = 'only-from-default';  
type

function nm_setting_hostname_get_type:TGType;cdecl;external;
function nm_setting_hostname_new:PNMSetting;cdecl;external;
function nm_setting_hostname_get_priority(setting:PNMSettingHostname):longint;cdecl;external;
function nm_setting_hostname_get_from_dhcp(setting:PNMSettingHostname):TNMTernary;cdecl;external;
function nm_setting_hostname_get_from_dns_lookup(setting:PNMSettingHostname):TNMTernary;cdecl;external;
function nm_setting_hostname_get_only_from_default(setting:PNMSettingHostname):TNMTernary;cdecl;external;
{$endif}
{ NM_SETTING_HOSTNAME_H  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_HOSTNAME : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_HOSTNAME:=nm_setting_hostname_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_HOSTNAME(obj : longint) : longint;
begin
  NM_SETTING_HOSTNAME:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_HOSTNAME,NMSettingHostname);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_HOSTNAME_CLASS(klass : longint) : longint;
begin
  NM_SETTING_HOSTNAME_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_HOSTNAME,NMSettingHostnameClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_HOSTNAME(obj : longint) : longint;
begin
  NM_IS_SETTING_HOSTNAME:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_HOSTNAME);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_HOSTNAME_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_HOSTNAME_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_HOSTNAME);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_HOSTNAME_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_HOSTNAME_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_HOSTNAME,NMSettingHostnameClass);
end;


end.
