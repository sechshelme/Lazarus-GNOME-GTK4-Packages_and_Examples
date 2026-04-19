unit nm_setting_ip4_config;

interface

uses
  fp_glib2, fp_nm;

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

function nm_setting_ip4_config_get_type:TGType;cdecl;external libnm;
function nm_setting_ip4_config_new:PNMSetting;cdecl;external libnm;
function nm_setting_ip4_config_get_dhcp_client_id(setting:PNMSettingIP4Config):Pchar;cdecl;external libnm;
function nm_setting_ip4_config_get_dhcp_fqdn(setting:PNMSettingIP4Config):Pchar;cdecl;external libnm;
function nm_setting_ip4_config_get_dhcp_vendor_class_identifier(setting:PNMSettingIP4Config):Pchar;cdecl;external libnm;
function nm_setting_ip4_config_get_link_local(setting:PNMSettingIP4Config):TNMSettingIP4LinkLocal;cdecl;external libnm;
{$endif}
{ __NM_SETTING_IP4_CONFIG_H__  }

// === Konventiert am: 19-4-26 19:26:50 ===

function NM_TYPE_SETTING_IP4_CONFIG : TGType;
function NM_SETTING_IP4_CONFIG(obj : Pointer) : PNMSettingIP4Config;
function NM_SETTING_IP4_CONFIG_CLASS(klass : Pointer) : PNMSettingIP4ConfigClass;
function NM_IS_SETTING_IP4_CONFIG(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_IP4_CONFIG_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_IP4_CONFIG_GET_CLASS(obj : Pointer) : PNMSettingIP4ConfigClass;

implementation

function NM_TYPE_SETTING_IP4_CONFIG : TGType;
  begin
    NM_TYPE_SETTING_IP4_CONFIG:=nm_setting_ip4_config_get_type;
  end;

function NM_SETTING_IP4_CONFIG(obj : Pointer) : PNMSettingIP4Config;
begin
  Result := PNMSettingIP4Config(g_type_check_instance_cast(obj, NM_TYPE_SETTING_IP4_CONFIG));
end;

function NM_SETTING_IP4_CONFIG_CLASS(klass : Pointer) : PNMSettingIP4ConfigClass;
begin
  Result := PNMSettingIP4ConfigClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_IP4_CONFIG));
end;

function NM_IS_SETTING_IP4_CONFIG(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_IP4_CONFIG);
end;

function NM_IS_SETTING_IP4_CONFIG_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_IP4_CONFIG);
end;

function NM_SETTING_IP4_CONFIG_GET_CLASS(obj : Pointer) : PNMSettingIP4ConfigClass;
begin
  Result := PNMSettingIP4ConfigClass(PGTypeInstance(obj)^.g_class);
end;



end.
