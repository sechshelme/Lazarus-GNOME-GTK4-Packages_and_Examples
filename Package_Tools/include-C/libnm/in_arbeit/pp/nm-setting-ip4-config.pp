
unit nm-setting-ip4-config;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-ip4-config.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-ip4-config.h
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
PNMSettingIP4Config  = ^NMSettingIP4Config;
PNMSettingIP4LinkLocal  = ^NMSettingIP4LinkLocal;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2014 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_IP4_CONFIG_H__}
{$define __NM_SETTING_IP4_CONFIG_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting-ip-config.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_IP4_CONFIG : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_IP4_CONFIG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_IP4_CONFIG_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_IP4_CONFIG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_IP4_CONFIG_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_IP4_CONFIG_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_IP4_CONFIG_SETTING_NAME = 'ipv4';  
  NM_SETTING_IP4_CONFIG_DHCP_CLIENT_ID = 'dhcp-client-id';  
  NM_SETTING_IP4_CONFIG_DHCP_FQDN = 'dhcp-fqdn';  
  NM_SETTING_IP4_CONFIG_DHCP_VENDOR_CLASS_IDENTIFIER = 'dhcp-vendor-class-identifier';  
  NM_SETTING_IP4_CONFIG_LINK_LOCAL = 'link-local';  
{*
 * NM_SETTING_IP4_CONFIG_METHOD_AUTO:
 *
 * IPv4 configuration should be automatically determined via a method appropriate
 * for the hardware interface, ie DHCP or PPP or some other device-specific
 * manner.
  }
  NM_SETTING_IP4_CONFIG_METHOD_AUTO = 'auto';  
{*
 * NM_SETTING_IP4_CONFIG_METHOD_LINK_LOCAL:
 *
 * IPv4 configuration should be automatically configured for link-local-only
 * operation.
  }
  NM_SETTING_IP4_CONFIG_METHOD_LINK_LOCAL = 'link-local';  
{*
 * NM_SETTING_IP4_CONFIG_METHOD_MANUAL:
 *
 * All necessary IPv4 configuration (addresses, prefix, DNS, etc) is specified
 * in the setting's properties.
  }
  NM_SETTING_IP4_CONFIG_METHOD_MANUAL = 'manual';  
{*
 * NM_SETTING_IP4_CONFIG_METHOD_SHARED:
 *
 * This connection specifies configuration that allows other computers to
 * connect through it to the default network (usually the Internet).  The
 * connection's interface will be assigned a private address, and a DHCP server,
 * caching DNS server, and Network Address Translation (NAT) functionality will
 * be started on this connection's interface to allow other devices to connect
 * through that interface to the default network.
  }
  NM_SETTING_IP4_CONFIG_METHOD_SHARED = 'shared';  
{*
 * NM_SETTING_IP4_CONFIG_METHOD_DISABLED:
 *
 * This connection does not use or require IPv4 address and it should be disabled.
  }
  NM_SETTING_IP4_CONFIG_METHOD_DISABLED = 'disabled';  
{*
 * NMSettingIP4LinkLocal:
 * @NM_SETTING_IP4_LL_DEFAULT: Allow fallback to a globally configured default. If unspecified,
 *   fallback to "auto". Note that if "ipv4.method" is "disabled", this always implies link-local
 *   addresses disabled too.
 * @NM_SETTING_IP4_LL_AUTO: Special value which enables LL if "ipv4.method" is set to
 *   "link-local".
 * @NM_SETTING_IP4_LL_DISABLED: Disable IPv4 link-local protocol.
 * @NM_SETTING_IP4_LL_ENABLED: Enable the IPv4 link-local protocol regardless what other protocols
 * such as DHCP or manually assigned IP addresses might be active.
 *
 * #NMSettingIP4LinkLocal values indicate whether IPv4 link-local address protocol should be enabled.
 *
 * Since: 1.40
  }
type
  PNMSettingIP4LinkLocal = ^TNMSettingIP4LinkLocal;
  TNMSettingIP4LinkLocal =  Longint;
  Const
    NM_SETTING_IP4_LL_DEFAULT = 0;
    NM_SETTING_IP4_LL_AUTO = 1;
    NM_SETTING_IP4_LL_DISABLED = 2;
    NM_SETTING_IP4_LL_ENABLED = 3;
;
type

function nm_setting_ip4_config_get_type:TGType;cdecl;external;
function nm_setting_ip4_config_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_ip4_config_get_dhcp_client_id(setting:PNMSettingIP4Config):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_ip4_config_get_dhcp_fqdn(setting:PNMSettingIP4Config):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_ip4_config_get_dhcp_vendor_class_identifier(setting:PNMSettingIP4Config):Pchar;cdecl;external;
function nm_setting_ip4_config_get_link_local(setting:PNMSettingIP4Config):TNMSettingIP4LinkLocal;cdecl;external;
{$endif}
{ __NM_SETTING_IP4_CONFIG_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_IP4_CONFIG : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_IP4_CONFIG:=nm_setting_ip4_config_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_IP4_CONFIG(obj : longint) : longint;
begin
  NM_SETTING_IP4_CONFIG:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_IP4_CONFIG,NMSettingIP4Config);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_IP4_CONFIG_CLASS(klass : longint) : longint;
begin
  NM_SETTING_IP4_CONFIG_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_IP4CONFIG,NMSettingIP4ConfigClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_IP4_CONFIG(obj : longint) : longint;
begin
  NM_IS_SETTING_IP4_CONFIG:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_IP4_CONFIG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_IP4_CONFIG_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_IP4_CONFIG_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_IP4_CONFIG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_IP4_CONFIG_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_IP4_CONFIG_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_IP4_CONFIG,NMSettingIP4ConfigClass);
end;


end.
