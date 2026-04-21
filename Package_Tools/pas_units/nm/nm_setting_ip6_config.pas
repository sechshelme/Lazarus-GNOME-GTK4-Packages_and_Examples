unit nm_setting_ip6_config;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2014 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_IP6_CONFIG_H__}
{$define __NM_SETTING_IP6_CONFIG_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting-ip-config.h"}

const
  NM_SETTING_IP6_CONFIG_SETTING_NAME = 'ipv6';  
  NM_SETTING_IP6_CONFIG_IP6_PRIVACY = 'ip6-privacy';  
  NM_SETTING_IP6_CONFIG_ADDR_GEN_MODE = 'addr-gen-mode';  
  NM_SETTING_IP6_CONFIG_TOKEN = 'token';  
  NM_SETTING_IP6_CONFIG_DHCP_DUID = 'dhcp-duid';  
  NM_SETTING_IP6_CONFIG_RA_TIMEOUT = 'ra-timeout';  
  NM_SETTING_IP6_CONFIG_MTU = 'mtu';  
  NM_SETTING_IP6_CONFIG_DHCP_PD_HINT = 'dhcp-pd-hint';  
{*
 * NM_SETTING_IP6_CONFIG_METHOD_IGNORE:
 *
 * IPv6 is not required or is handled by some other mechanism, and NetworkManager
 * should not configure IPv6 for this connection.
  }
  NM_SETTING_IP6_CONFIG_METHOD_IGNORE = 'ignore';  
{*
 * NM_SETTING_IP6_CONFIG_METHOD_AUTO:
 *
 * IPv6 configuration should be automatically determined via a method appropriate
 * for the hardware interface, ie router advertisements, DHCP, or PPP or some
 * other device-specific manner.
  }
  NM_SETTING_IP6_CONFIG_METHOD_AUTO = 'auto';  
{*
 * NM_SETTING_IP6_CONFIG_METHOD_DHCP:
 *
 * IPv6 configuration should be automatically determined via DHCPv6 only and
 * router advertisements should be ignored.
  }
  NM_SETTING_IP6_CONFIG_METHOD_DHCP = 'dhcp';  
{*
 * NM_SETTING_IP6_CONFIG_METHOD_LINK_LOCAL:
 *
 * IPv6 configuration should be automatically configured for link-local-only
 * operation.
  }
  NM_SETTING_IP6_CONFIG_METHOD_LINK_LOCAL = 'link-local';  
{*
 * NM_SETTING_IP6_CONFIG_METHOD_MANUAL:
 *
 * All necessary IPv6 configuration (addresses, prefix, DNS, etc) is specified
 * in the setting's properties.
  }
  NM_SETTING_IP6_CONFIG_METHOD_MANUAL = 'manual';  
{*
 * NM_SETTING_IP6_CONFIG_METHOD_SHARED:
 *
 * This connection specifies configuration that allows other computers to
 * connect through it to the default network (usually the Internet).  The
 * connection's interface will be assigned a private address, and router
 * advertisements, a caching DNS server, and Network Address Translation (NAT)
 * functionality will be started on this connection's interface to allow other
 * devices to connect through that interface to the default network. (not yet
 * supported for IPv6)
  }
  NM_SETTING_IP6_CONFIG_METHOD_SHARED = 'shared';  
{*
 * NM_SETTING_IP6_CONFIG_METHOD_DISABLED:
 *
 * IPv6 is disabled for the connection.
 *
 * Since: 1.20
  }
  NM_SETTING_IP6_CONFIG_METHOD_DISABLED = 'disabled';  
{*
 * NMSettingIP6ConfigPrivacy:
 * @NM_SETTING_IP6_CONFIG_PRIVACY_UNKNOWN: unknown or no value specified
 * @NM_SETTING_IP6_CONFIG_PRIVACY_DISABLED: IPv6 Privacy Extensions are disabled
 * @NM_SETTING_IP6_CONFIG_PRIVACY_PREFER_PUBLIC_ADDR: IPv6 Privacy Extensions
 * are enabled, but public addresses are preferred over temporary addresses
 * @NM_SETTING_IP6_CONFIG_PRIVACY_PREFER_TEMP_ADDR: IPv6 Privacy Extensions
 * are enabled and temporary addresses are preferred over public addresses
 *
 * #NMSettingIP6ConfigPrivacy values indicate if and how IPv6 Privacy
 * Extensions are used (RFC4941).
  }
type
  PNMSettingIP6ConfigPrivacy = ^TNMSettingIP6ConfigPrivacy;
  TNMSettingIP6ConfigPrivacy =  Longint;
  Const
    NM_SETTING_IP6_CONFIG_PRIVACY_UNKNOWN = -(1);
    NM_SETTING_IP6_CONFIG_PRIVACY_DISABLED = 0;
    NM_SETTING_IP6_CONFIG_PRIVACY_PREFER_PUBLIC_ADDR = 1;
    NM_SETTING_IP6_CONFIG_PRIVACY_PREFER_TEMP_ADDR = 2;
;
{*
 * NMSettingIP6ConfigAddrGenMode:
 * @NM_SETTING_IP6_CONFIG_ADDR_GEN_MODE_EUI64: The Interface Identifier is derived
 * from the interface hardware address.
 * @NM_SETTING_IP6_CONFIG_ADDR_GEN_MODE_STABLE_PRIVACY: The Interface Identifier
 * is created by using a cryptographically secure hash of a secret host-specific
 * key along with the connection identification and the network address as
 * specified by RFC7217.
 * @NM_SETTING_IP6_CONFIG_ADDR_GEN_MODE_DEFAULT_OR_EUI64: Fallback to the global
 *   default, and if unspecified use "eui64". Since: 1.40.
 * @NM_SETTING_IP6_CONFIG_ADDR_GEN_MODE_DEFAULT: Fallback to the global
 *   default, and if unspecified use "stable-privacy". Since: 1.40.
 *
 * #NMSettingIP6ConfigAddrGenMode controls how the Interface Identifier for
 * RFC4862 Stateless Address Autoconfiguration is created.
 *
 * Since: 1.2
  }
type
  PNMSettingIP6ConfigAddrGenMode = ^TNMSettingIP6ConfigAddrGenMode;
  TNMSettingIP6ConfigAddrGenMode =  Longint;
  Const
    NM_SETTING_IP6_CONFIG_ADDR_GEN_MODE_EUI64 = 0;
    NM_SETTING_IP6_CONFIG_ADDR_GEN_MODE_STABLE_PRIVACY = 1;
    NM_SETTING_IP6_CONFIG_ADDR_GEN_MODE_DEFAULT_OR_EUI64 = 2;
    NM_SETTING_IP6_CONFIG_ADDR_GEN_MODE_DEFAULT = 3;
;
type

function nm_setting_ip6_config_get_type:TGType;cdecl;external libnm;
function nm_setting_ip6_config_new:PNMSetting;cdecl;external libnm;
function nm_setting_ip6_config_get_ip6_privacy(setting:PNMSettingIP6Config):TNMSettingIP6ConfigPrivacy;cdecl;external libnm;
function nm_setting_ip6_config_get_addr_gen_mode(setting:PNMSettingIP6Config):TNMSettingIP6ConfigAddrGenMode;cdecl;external libnm;
function nm_setting_ip6_config_get_token(setting:PNMSettingIP6Config):Pchar;cdecl;external libnm;
function nm_setting_ip6_config_get_dhcp_duid(setting:PNMSettingIP6Config):Pchar;cdecl;external libnm;
function nm_setting_ip6_config_get_ra_timeout(setting:PNMSettingIP6Config):Tgint32;cdecl;external libnm;
function nm_setting_ip6_config_get_mtu(setting:PNMSettingIP6Config):Tguint32;cdecl;external libnm;
function nm_setting_ip6_config_get_dhcp_pd_hint(setting:PNMSettingIP6Config):Pchar;cdecl;external libnm;
{$endif}
{ __NM_SETTING_IP6_CONFIG_H__  }

// === Konventiert am: 19-4-26 19:26:45 ===

function NM_TYPE_SETTING_IP6_CONFIG : TGType;
function NM_SETTING_IP6_CONFIG(obj : Pointer) : PNMSettingIP6Config;
function NM_SETTING_IP6_CONFIG_CLASS(klass : Pointer) : PNMSettingIP6ConfigClass;
function NM_IS_SETTING_IP6_CONFIG(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_IP6_CONFIG_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_IP6_CONFIG_GET_CLASS(obj : Pointer) : PNMSettingIP6ConfigClass;

implementation

function NM_TYPE_SETTING_IP6_CONFIG : TGType;
  begin
    NM_TYPE_SETTING_IP6_CONFIG:=nm_setting_ip6_config_get_type;
  end;

function NM_SETTING_IP6_CONFIG(obj : Pointer) : PNMSettingIP6Config;
begin
  Result := PNMSettingIP6Config(g_type_check_instance_cast(obj, NM_TYPE_SETTING_IP6_CONFIG));
end;

function NM_SETTING_IP6_CONFIG_CLASS(klass : Pointer) : PNMSettingIP6ConfigClass;
begin
  Result := PNMSettingIP6ConfigClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_IP6_CONFIG));
end;

function NM_IS_SETTING_IP6_CONFIG(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_IP6_CONFIG);
end;

function NM_IS_SETTING_IP6_CONFIG_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_IP6_CONFIG);
end;

function NM_SETTING_IP6_CONFIG_GET_CLASS(obj : Pointer) : PNMSettingIP6ConfigClass;
begin
  Result := PNMSettingIP6ConfigClass(PGTypeInstance(obj)^.g_class);
end;



end.
