unit nm_setting_ip_config;

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
{$ifndef NM_SETTING_IP_CONFIG_H}
{$define NM_SETTING_IP_CONFIG_H}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}
{$include "nm-utils.h"}

const
  NM_IP_ADDRESS_ATTRIBUTE_LABEL = 'label';  
{*
 * NMIPAddressCmpFlags:
 * @NM_IP_ADDRESS_CMP_FLAGS_NONE: no flags.
 * @NM_IP_ADDRESS_CMP_FLAGS_WITH_ATTRS: when comparing two addresses,
 *   also consider their attributes. Warning: note that attributes are GVariants
 *   and they don't have a total order. In other words, if the address differs only
 *   by their attributes, the returned compare order is not total. In that case,
 *   the return value merely indicates equality (zero) or inequality.
 *
 * Compare flags for nm_ip_address_cmp_full().
 *
 * Since: 1.22
  }
{< flags > }type
  PNMIPAddressCmpFlags = ^TNMIPAddressCmpFlags;
  TNMIPAddressCmpFlags =  Longint;
  Const
    NM_IP_ADDRESS_CMP_FLAGS_NONE = 0;
    NM_IP_ADDRESS_CMP_FLAGS_WITH_ATTRS = $1;
;
type

function nm_ip_address_get_type:TGType;cdecl;external libnm;
function nm_ip_address_new(family:longint; addr:Pchar; prefix:Tguint; error:PPGError):PNMIPAddress;cdecl;external libnm;
function nm_ip_address_new_binary(family:longint; addr:Tgconstpointer; prefix:Tguint; error:PPGError):PNMIPAddress;cdecl;external libnm;
procedure nm_ip_address_ref(address:PNMIPAddress);cdecl;external libnm;
procedure nm_ip_address_unref(address:PNMIPAddress);cdecl;external libnm;
function nm_ip_address_equal(address:PNMIPAddress; other:PNMIPAddress):Tgboolean;cdecl;external libnm;
function nm_ip_address_cmp_full(a:PNMIPAddress; b:PNMIPAddress; cmp_flags:TNMIPAddressCmpFlags):longint;cdecl;external libnm;
function nm_ip_address_dup(address:PNMIPAddress):PNMIPAddress;cdecl;external libnm;
function nm_ip_address_get_family(address:PNMIPAddress):longint;cdecl;external libnm;
function nm_ip_address_get_address(address:PNMIPAddress):Pchar;cdecl;external libnm;
procedure nm_ip_address_set_address(address:PNMIPAddress; addr:Pchar);cdecl;external libnm;
procedure nm_ip_address_get_address_binary(address:PNMIPAddress; addr:Tgpointer);cdecl;external libnm;
procedure nm_ip_address_set_address_binary(address:PNMIPAddress; addr:Tgconstpointer);cdecl;external libnm;
function nm_ip_address_get_prefix(address:PNMIPAddress):Tguint;cdecl;external libnm;
procedure nm_ip_address_set_prefix(address:PNMIPAddress; prefix:Tguint);cdecl;external libnm;
function nm_ip_address_get_attribute_names(address:PNMIPAddress):^Pchar;cdecl;external libnm;
function nm_ip_address_get_attribute(address:PNMIPAddress; name:Pchar):PGVariant;cdecl;external libnm;
procedure nm_ip_address_set_attribute(address:PNMIPAddress; name:Pchar; value:PGVariant);cdecl;external libnm;
type

function nm_ip_route_get_type:TGType;cdecl;external libnm;
function nm_ip_route_new(family:longint; dest:Pchar; prefix:Tguint; next_hop:Pchar; metric:Tgint64; 
           error:PPGError):PNMIPRoute;cdecl;external libnm;
function nm_ip_route_new_binary(family:longint; dest:Tgconstpointer; prefix:Tguint; next_hop:Tgconstpointer; metric:Tgint64; 
           error:PPGError):PNMIPRoute;cdecl;external libnm;
procedure nm_ip_route_ref(route:PNMIPRoute);cdecl;external libnm;
procedure nm_ip_route_unref(route:PNMIPRoute);cdecl;external libnm;
function nm_ip_route_equal(route:PNMIPRoute; other:PNMIPRoute):Tgboolean;cdecl;external libnm;
{< flags > }type
  Txxxxxx =  Longint;
  Const
    NM_IP_ROUTE_EQUAL_CMP_FLAGS_NONE = 0;
    NM_IP_ROUTE_EQUAL_CMP_FLAGS_WITH_ATTRS = $1;


function nm_ip_route_equal_full(route:PNMIPRoute; other:PNMIPRoute; cmp_flags:Tguint):Tgboolean;cdecl;external libnm;
function nm_ip_route_dup(route:PNMIPRoute):PNMIPRoute;cdecl;external libnm;
function nm_ip_route_get_family(route:PNMIPRoute):longint;cdecl;external libnm;
function nm_ip_route_get_dest(route:PNMIPRoute):Pchar;cdecl;external libnm;
procedure nm_ip_route_set_dest(route:PNMIPRoute; dest:Pchar);cdecl;external libnm;
procedure nm_ip_route_get_dest_binary(route:PNMIPRoute; dest:Tgpointer);cdecl;external libnm;
procedure nm_ip_route_set_dest_binary(route:PNMIPRoute; dest:Tgconstpointer);cdecl;external libnm;
function nm_ip_route_get_prefix(route:PNMIPRoute):Tguint;cdecl;external libnm;
procedure nm_ip_route_set_prefix(route:PNMIPRoute; prefix:Tguint);cdecl;external libnm;
function nm_ip_route_get_next_hop(route:PNMIPRoute):Pchar;cdecl;external libnm;
procedure nm_ip_route_set_next_hop(route:PNMIPRoute; next_hop:Pchar);cdecl;external libnm;
function nm_ip_route_get_next_hop_binary(route:PNMIPRoute; next_hop:Tgpointer):Tgboolean;cdecl;external libnm;
procedure nm_ip_route_set_next_hop_binary(route:PNMIPRoute; next_hop:Tgconstpointer);cdecl;external libnm;
function nm_ip_route_get_metric(route:PNMIPRoute):Tgint64;cdecl;external libnm;
procedure nm_ip_route_set_metric(route:PNMIPRoute; metric:Tgint64);cdecl;external libnm;
function nm_ip_route_get_attribute_names(route:PNMIPRoute):^Pchar;cdecl;external libnm;
function nm_ip_route_get_attribute(route:PNMIPRoute; name:Pchar):PGVariant;cdecl;external libnm;
procedure nm_ip_route_set_attribute(route:PNMIPRoute; name:Pchar; value:PGVariant);cdecl;external libnm;
function nm_ip_route_get_variant_attribute_spec:^PNMVariantAttributeSpec;cdecl;external libnm;
function nm_ip_route_attribute_validate(name:Pchar; value:PGVariant; family:longint; known:Pgboolean; error:PPGError):Tgboolean;cdecl;external libnm;
const
  NM_IP_ROUTE_ATTRIBUTE_ADVMSS = 'advmss';  
  NM_IP_ROUTE_ATTRIBUTE_CWND = 'cwnd';  
  NM_IP_ROUTE_ATTRIBUTE_FROM = 'from';  
  NM_IP_ROUTE_ATTRIBUTE_INITCWND = 'initcwnd';  
  NM_IP_ROUTE_ATTRIBUTE_INITRWND = 'initrwnd';  
  NM_IP_ROUTE_ATTRIBUTE_LOCK_ADVMSS = 'lock-advmss';  
  NM_IP_ROUTE_ATTRIBUTE_LOCK_CWND = 'lock-cwnd';  
  NM_IP_ROUTE_ATTRIBUTE_LOCK_INITCWND = 'lock-initcwnd';  
  NM_IP_ROUTE_ATTRIBUTE_LOCK_INITRWND = 'lock-initrwnd';  
  NM_IP_ROUTE_ATTRIBUTE_LOCK_MTU = 'lock-mtu';  
  NM_IP_ROUTE_ATTRIBUTE_LOCK_WINDOW = 'lock-window';  
  NM_IP_ROUTE_ATTRIBUTE_MTU = 'mtu';  
  NM_IP_ROUTE_ATTRIBUTE_ONLINK = 'onlink';  
  NM_IP_ROUTE_ATTRIBUTE_QUICKACK = 'quickack';  
  NM_IP_ROUTE_ATTRIBUTE_RTO_MIN = 'rto_min';  
  NM_IP_ROUTE_ATTRIBUTE_SCOPE = 'scope';  
  NM_IP_ROUTE_ATTRIBUTE_SRC = 'src';  
  NM_IP_ROUTE_ATTRIBUTE_TABLE = 'table';  
  NM_IP_ROUTE_ATTRIBUTE_TOS = 'tos';  
  NM_IP_ROUTE_ATTRIBUTE_TYPE = 'type';  
  NM_IP_ROUTE_ATTRIBUTE_WINDOW = 'window';  
  NM_IP_ROUTE_ATTRIBUTE_WEIGHT = 'weight';  
{*************************************************************************** }
type

function nm_ip_routing_rule_get_type:TGType;cdecl;external libnm;
function nm_ip_routing_rule_new(addr_family:longint):PNMIPRoutingRule;cdecl;external libnm;
function nm_ip_routing_rule_new_clone(rule:PNMIPRoutingRule):PNMIPRoutingRule;cdecl;external libnm;
function nm_ip_routing_rule_ref(self:PNMIPRoutingRule):PNMIPRoutingRule;cdecl;external libnm;
procedure nm_ip_routing_rule_unref(self:PNMIPRoutingRule);cdecl;external libnm;
function nm_ip_routing_rule_is_sealed(self:PNMIPRoutingRule):Tgboolean;cdecl;external libnm;
procedure nm_ip_routing_rule_seal(self:PNMIPRoutingRule);cdecl;external libnm;
function nm_ip_routing_rule_get_addr_family(self:PNMIPRoutingRule):longint;cdecl;external libnm;
function nm_ip_routing_rule_get_invert(self:PNMIPRoutingRule):Tgboolean;cdecl;external libnm;
procedure nm_ip_routing_rule_set_invert(self:PNMIPRoutingRule; invert:Tgboolean);cdecl;external libnm;
function nm_ip_routing_rule_get_priority(self:PNMIPRoutingRule):Tgint64;cdecl;external libnm;
procedure nm_ip_routing_rule_set_priority(self:PNMIPRoutingRule; priority:Tgint64);cdecl;external libnm;
function nm_ip_routing_rule_get_tos(self:PNMIPRoutingRule):Tguint8;cdecl;external libnm;
procedure nm_ip_routing_rule_set_tos(self:PNMIPRoutingRule; tos:Tguint8);cdecl;external libnm;
function nm_ip_routing_rule_get_ipproto(self:PNMIPRoutingRule):Tguint8;cdecl;external libnm;
procedure nm_ip_routing_rule_set_ipproto(self:PNMIPRoutingRule; ipproto:Tguint8);cdecl;external libnm;
function nm_ip_routing_rule_get_source_port_start(self:PNMIPRoutingRule):Tguint16;cdecl;external libnm;
function nm_ip_routing_rule_get_source_port_end(self:PNMIPRoutingRule):Tguint16;cdecl;external libnm;
procedure nm_ip_routing_rule_set_source_port(self:PNMIPRoutingRule; start:Tguint16; end:Tguint16);cdecl;external libnm;
function nm_ip_routing_rule_get_destination_port_start(self:PNMIPRoutingRule):Tguint16;cdecl;external libnm;
function nm_ip_routing_rule_get_destination_port_end(self:PNMIPRoutingRule):Tguint16;cdecl;external libnm;
procedure nm_ip_routing_rule_set_destination_port(self:PNMIPRoutingRule; start:Tguint16; end:Tguint16);cdecl;external libnm;
function nm_ip_routing_rule_get_fwmark(self:PNMIPRoutingRule):Tguint32;cdecl;external libnm;
function nm_ip_routing_rule_get_fwmask(self:PNMIPRoutingRule):Tguint32;cdecl;external libnm;
procedure nm_ip_routing_rule_set_fwmark(self:PNMIPRoutingRule; fwmark:Tguint32; fwmask:Tguint32);cdecl;external libnm;
function nm_ip_routing_rule_get_from_len(self:PNMIPRoutingRule):Tguint8;cdecl;external libnm;
function nm_ip_routing_rule_get_from(self:PNMIPRoutingRule):Pchar;cdecl;external libnm;
procedure nm_ip_routing_rule_set_from(self:PNMIPRoutingRule; from:Pchar; len:Tguint8);cdecl;external libnm;
function nm_ip_routing_rule_get_to_len(self:PNMIPRoutingRule):Tguint8;cdecl;external libnm;
function nm_ip_routing_rule_get_to(self:PNMIPRoutingRule):Pchar;cdecl;external libnm;
procedure nm_ip_routing_rule_set_to(self:PNMIPRoutingRule; to:Pchar; len:Tguint8);cdecl;external libnm;
function nm_ip_routing_rule_get_iifname(self:PNMIPRoutingRule):Pchar;cdecl;external libnm;
procedure nm_ip_routing_rule_set_iifname(self:PNMIPRoutingRule; iifname:Pchar);cdecl;external libnm;
function nm_ip_routing_rule_get_oifname(self:PNMIPRoutingRule):Pchar;cdecl;external libnm;
procedure nm_ip_routing_rule_set_oifname(self:PNMIPRoutingRule; oifname:Pchar);cdecl;external libnm;
function nm_ip_routing_rule_get_action(self:PNMIPRoutingRule):Tguint8;cdecl;external libnm;
procedure nm_ip_routing_rule_set_action(self:PNMIPRoutingRule; action:Tguint8);cdecl;external libnm;
function nm_ip_routing_rule_get_table(self:PNMIPRoutingRule):Tguint32;cdecl;external libnm;
procedure nm_ip_routing_rule_set_table(self:PNMIPRoutingRule; table:Tguint32);cdecl;external libnm;
function nm_ip_routing_rule_get_suppress_prefixlength(self:PNMIPRoutingRule):Tgint32;cdecl;external libnm;
procedure nm_ip_routing_rule_set_suppress_prefixlength(self:PNMIPRoutingRule; suppress_prefixlength:Tgint32);cdecl;external libnm;
function nm_ip_routing_rule_get_uid_range(self:PNMIPRoutingRule; out_range_start:Pguint32; out_range_end:Pguint32):Tgboolean;cdecl;external libnm;
procedure nm_ip_routing_rule_set_uid_range(self:PNMIPRoutingRule; uid_range_start:Tguint32; uid_range_end:Tguint32);cdecl;external libnm;
function nm_ip_routing_rule_cmp(rule:PNMIPRoutingRule; other:PNMIPRoutingRule):longint;cdecl;external libnm;
function nm_ip_routing_rule_validate(self:PNMIPRoutingRule; error:PPGError):Tgboolean;cdecl;external libnm;
{*
 * NMIPRoutingRuleAsStringFlags:
 * @NM_IP_ROUTING_RULE_AS_STRING_FLAGS_NONE: no flags selected.
 * @NM_IP_ROUTING_RULE_AS_STRING_FLAGS_AF_INET: whether to allow parsing
 *   IPv4 addresses.
 * @NM_IP_ROUTING_RULE_AS_STRING_FLAGS_AF_INET6: whether to allow parsing
 *   IPv6 addresses. If both @NM_IP_ROUTING_RULE_AS_STRING_FLAGS_AF_INET and
 *   @NM_IP_ROUTING_RULE_AS_STRING_FLAGS_AF_INET6 are unset, it's the same
 *   as setting them both.
 * @NM_IP_ROUTING_RULE_AS_STRING_FLAGS_VALIDATE: if set, ensure that the
 *   rule verfies or fail.
 *
 * Since: 1.18
  }
{< flags > }type
  PNMIPRoutingRuleAsStringFlags = ^TNMIPRoutingRuleAsStringFlags;
  TNMIPRoutingRuleAsStringFlags =  Longint;
  Const
    NM_IP_ROUTING_RULE_AS_STRING_FLAGS_NONE = 0;
    NM_IP_ROUTING_RULE_AS_STRING_FLAGS_AF_INET = $1;
    NM_IP_ROUTING_RULE_AS_STRING_FLAGS_AF_INET6 = $2;
    NM_IP_ROUTING_RULE_AS_STRING_FLAGS_VALIDATE = $4;
;

function nm_ip_routing_rule_from_string(str:Pchar; to_string_flags:TNMIPRoutingRuleAsStringFlags; extra_args:PGHashTable; error:PPGError):PNMIPRoutingRule;cdecl;external libnm;
function nm_ip_routing_rule_to_string(self:PNMIPRoutingRule; to_string_flags:TNMIPRoutingRuleAsStringFlags; extra_args:PGHashTable; error:PPGError):Pchar;cdecl;external libnm;
{*************************************************************************** }
const
  NM_SETTING_IP_CONFIG_DAD_TIMEOUT_MAX = 30000;  
  NM_SETTING_IP_CONFIG_METHOD = 'method';  
  NM_SETTING_IP_CONFIG_DNS = 'dns';  
  NM_SETTING_IP_CONFIG_DNS_SEARCH = 'dns-search';  
  NM_SETTING_IP_CONFIG_DNS_OPTIONS = 'dns-options';  
  NM_SETTING_IP_CONFIG_DNS_PRIORITY = 'dns-priority';  
  NM_SETTING_IP_CONFIG_ADDRESSES = 'addresses';  
  NM_SETTING_IP_CONFIG_GATEWAY = 'gateway';  
  NM_SETTING_IP_CONFIG_ROUTES = 'routes';  
  NM_SETTING_IP_CONFIG_ROUTE_METRIC = 'route-metric';  
  NM_SETTING_IP_CONFIG_ROUTE_TABLE = 'route-table';  
  NM_SETTING_IP_CONFIG_IGNORE_AUTO_ROUTES = 'ignore-auto-routes';  
  NM_SETTING_IP_CONFIG_IGNORE_AUTO_DNS = 'ignore-auto-dns';  
  NM_SETTING_IP_CONFIG_DHCP_HOSTNAME = 'dhcp-hostname';  
  NM_SETTING_IP_CONFIG_DHCP_SEND_HOSTNAME = 'dhcp-send-hostname';  
  NM_SETTING_IP_CONFIG_DHCP_HOSTNAME_FLAGS = 'dhcp-hostname-flags';  
  NM_SETTING_IP_CONFIG_DHCP_DSCP = 'dhcp-dscp';  
  NM_SETTING_IP_CONFIG_NEVER_DEFAULT = 'never-default';  
  NM_SETTING_IP_CONFIG_MAY_FAIL = 'may-fail';  
  NM_SETTING_IP_CONFIG_DAD_TIMEOUT = 'dad-timeout';  
  NM_SETTING_IP_CONFIG_DHCP_TIMEOUT = 'dhcp-timeout';  
  NM_SETTING_IP_CONFIG_REQUIRED_TIMEOUT = 'required-timeout';  
  NM_SETTING_IP_CONFIG_DHCP_IAID = 'dhcp-iaid';  
  NM_SETTING_IP_CONFIG_DHCP_REJECT_SERVERS = 'dhcp-reject-servers';  
  NM_SETTING_IP_CONFIG_AUTO_ROUTE_EXT_GW = 'auto-route-ext-gw';  
  NM_SETTING_IP_CONFIG_REPLACE_LOCAL_RULE = 'replace-local-rule';  
{ these are not real GObject properties.  }
  NM_SETTING_IP_CONFIG_ROUTING_RULES = 'routing-rules';  
  NM_SETTING_DNS_OPTION_DEBUG = 'debug';  
  NM_SETTING_DNS_OPTION_NDOTS = 'ndots';  
  NM_SETTING_DNS_OPTION_TIMEOUT = 'timeout';  
  NM_SETTING_DNS_OPTION_ATTEMPTS = 'attempts';  
  NM_SETTING_DNS_OPTION_ROTATE = 'rotate';  
  NM_SETTING_DNS_OPTION_NO_CHECK_NAMES = 'no-check-names';  
  NM_SETTING_DNS_OPTION_INET6 = 'inet6';  
  NM_SETTING_DNS_OPTION_IP6_BYTESTRING = 'ip6-bytestring';  
  NM_SETTING_DNS_OPTION_IP6_DOTINT = 'ip6-dotint';  
  NM_SETTING_DNS_OPTION_NO_IP6_DOTINT = 'no-ip6-dotint';  
  NM_SETTING_DNS_OPTION_EDNS0 = 'edns0';  
  NM_SETTING_DNS_OPTION_SINGLE_REQUEST = 'single-request';  
  NM_SETTING_DNS_OPTION_SINGLE_REQUEST_REOPEN = 'single-request-reopen';  
  NM_SETTING_DNS_OPTION_NO_TLD_QUERY = 'no-tld-query';  
  NM_SETTING_DNS_OPTION_USE_VC = 'use-vc';  
  NM_SETTING_DNS_OPTION_NO_RELOAD = 'no-reload';  
  NM_SETTING_DNS_OPTION_TRUST_AD = 'trust-ad';  
  NM_SETTING_DNS_OPTION_NO_AAAA = 'no-aaaa';  
{ Internal options (not added to resolv.conf)  }
  NM_SETTING_DNS_OPTION_INTERNAL_NO_ADD_EDNS0 = '_no-add-edns0';  
  NM_SETTING_DNS_OPTION_INTERNAL_NO_ADD_TRUST_AD = '_no-add-trust-ad';  
type
{*
 * NMDhcpHostnameFlags:
 * @NM_DHCP_HOSTNAME_FLAG_NONE: no flag set. The default value from
 *   Networkmanager global configuration is used. If such value is unset
 *   or still zero, the DHCP request will use standard FQDN flags, i.e.
 *   %NM_DHCP_HOSTNAME_FLAG_FQDN_SERV_UPDATE and
 *   %NM_DHCP_HOSTNAME_FLAG_FQDN_ENCODED for IPv4 and
 *   %NM_DHCP_HOSTNAME_FLAG_FQDN_SERV_UPDATE for IPv6.
 * @NM_DHCP_HOSTNAME_FLAG_FQDN_SERV_UPDATE: whether the server should
 *   do the A RR (FQDN-to-address) DNS updates.
 * @NM_DHCP_HOSTNAME_FLAG_FQDN_ENCODED: if set, the FQDN is encoded
 *   using canonical wire format. Otherwise it uses the deprecated
 *   ASCII encoding. This flag is allowed only for DHCPv4.
 * @NM_DHCP_HOSTNAME_FLAG_FQDN_NO_UPDATE: when not set, request the
 *   server to perform updates (the PTR RR and possibly the A RR
 *   based on the %NM_DHCP_HOSTNAME_FLAG_FQDN_SERV_UPDATE flag). If
 *   this is set, the %NM_DHCP_HOSTNAME_FLAG_FQDN_SERV_UPDATE flag
 *   should be cleared.
 * @NM_DHCP_HOSTNAME_FLAG_FQDN_CLEAR_FLAGS: when set, no FQDN flags are
 *   sent in the DHCP FQDN option. When cleared and all other FQDN
 *   flags are zero, standard FQDN flags are sent. This flag is
 *   incompatible with any other FQDN flag.
 *
 * #NMDhcpHostnameFlags describe flags related to the DHCP hostname and
 * FQDN.
 *
 * Since: 1.22
  }
{< flags > }
  PNMDhcpHostnameFlags = ^TNMDhcpHostnameFlags;
  TNMDhcpHostnameFlags =  Longint;
  Const
    NM_DHCP_HOSTNAME_FLAG_NONE = $0;
    NM_DHCP_HOSTNAME_FLAG_FQDN_SERV_UPDATE = $1;
    NM_DHCP_HOSTNAME_FLAG_FQDN_ENCODED = $2;
    NM_DHCP_HOSTNAME_FLAG_FQDN_NO_UPDATE = $4;
    NM_DHCP_HOSTNAME_FLAG_FQDN_CLEAR_FLAGS = $8;
;

function nm_setting_ip_config_get_type:TGType;cdecl;external libnm;
function nm_setting_ip_config_get_method(setting:PNMSettingIPConfig):Pchar;cdecl;external libnm;
function nm_setting_ip_config_get_num_dns(setting:PNMSettingIPConfig):Tguint;cdecl;external libnm;
function nm_setting_ip_config_get_dns(setting:PNMSettingIPConfig; idx:longint):Pchar;cdecl;external libnm;
function nm_setting_ip_config_add_dns(setting:PNMSettingIPConfig; dns:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_ip_config_remove_dns(setting:PNMSettingIPConfig; idx:longint);cdecl;external libnm;
function nm_setting_ip_config_remove_dns_by_value(setting:PNMSettingIPConfig; dns:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_ip_config_clear_dns(setting:PNMSettingIPConfig);cdecl;external libnm;
function nm_setting_ip_config_get_num_dns_searches(setting:PNMSettingIPConfig):Tguint;cdecl;external libnm;
function nm_setting_ip_config_get_dns_search(setting:PNMSettingIPConfig; idx:longint):Pchar;cdecl;external libnm;
function nm_setting_ip_config_add_dns_search(setting:PNMSettingIPConfig; dns_search:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_ip_config_remove_dns_search(setting:PNMSettingIPConfig; idx:longint);cdecl;external libnm;
function nm_setting_ip_config_remove_dns_search_by_value(setting:PNMSettingIPConfig; dns_search:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_ip_config_clear_dns_searches(setting:PNMSettingIPConfig);cdecl;external libnm;
function nm_setting_ip_config_get_num_dns_options(setting:PNMSettingIPConfig):Tguint;cdecl;external libnm;
function nm_setting_ip_config_has_dns_options(setting:PNMSettingIPConfig):Tgboolean;cdecl;external libnm;
function nm_setting_ip_config_get_dns_option(setting:PNMSettingIPConfig; idx:Tguint):Pchar;cdecl;external libnm;
function nm_setting_ip_config_add_dns_option(setting:PNMSettingIPConfig; dns_option:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_ip_config_remove_dns_option(setting:PNMSettingIPConfig; idx:longint);cdecl;external libnm;
function nm_setting_ip_config_remove_dns_option_by_value(setting:PNMSettingIPConfig; dns_option:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_setting_ip_config_clear_dns_options(setting:PNMSettingIPConfig; is_set:Tgboolean);cdecl;external libnm;
function nm_setting_ip_config_get_dns_priority(setting:PNMSettingIPConfig):longint;cdecl;external libnm;
function nm_setting_ip_config_get_num_addresses(setting:PNMSettingIPConfig):Tguint;cdecl;external libnm;
function nm_setting_ip_config_get_address(setting:PNMSettingIPConfig; idx:longint):PNMIPAddress;cdecl;external libnm;
function nm_setting_ip_config_add_address(setting:PNMSettingIPConfig; address:PNMIPAddress):Tgboolean;cdecl;external libnm;
procedure nm_setting_ip_config_remove_address(setting:PNMSettingIPConfig; idx:longint);cdecl;external libnm;
function nm_setting_ip_config_remove_address_by_value(setting:PNMSettingIPConfig; address:PNMIPAddress):Tgboolean;cdecl;external libnm;
procedure nm_setting_ip_config_clear_addresses(setting:PNMSettingIPConfig);cdecl;external libnm;
function nm_setting_ip_config_get_gateway(setting:PNMSettingIPConfig):Pchar;cdecl;external libnm;
function nm_setting_ip_config_get_num_routes(setting:PNMSettingIPConfig):Tguint;cdecl;external libnm;
function nm_setting_ip_config_get_route(setting:PNMSettingIPConfig; idx:longint):PNMIPRoute;cdecl;external libnm;
function nm_setting_ip_config_add_route(setting:PNMSettingIPConfig; route:PNMIPRoute):Tgboolean;cdecl;external libnm;
procedure nm_setting_ip_config_remove_route(setting:PNMSettingIPConfig; idx:longint);cdecl;external libnm;
function nm_setting_ip_config_remove_route_by_value(setting:PNMSettingIPConfig; route:PNMIPRoute):Tgboolean;cdecl;external libnm;
procedure nm_setting_ip_config_clear_routes(setting:PNMSettingIPConfig);cdecl;external libnm;
function nm_setting_ip_config_get_route_metric(setting:PNMSettingIPConfig):Tgint64;cdecl;external libnm;
function nm_setting_ip_config_get_route_table(setting:PNMSettingIPConfig):Tguint32;cdecl;external libnm;
function nm_setting_ip_config_get_num_routing_rules(setting:PNMSettingIPConfig):Tguint;cdecl;external libnm;
function nm_setting_ip_config_get_routing_rule(setting:PNMSettingIPConfig; idx:Tguint):PNMIPRoutingRule;cdecl;external libnm;
procedure nm_setting_ip_config_add_routing_rule(setting:PNMSettingIPConfig; routing_rule:PNMIPRoutingRule);cdecl;external libnm;
procedure nm_setting_ip_config_remove_routing_rule(setting:PNMSettingIPConfig; idx:Tguint);cdecl;external libnm;
procedure nm_setting_ip_config_clear_routing_rules(setting:PNMSettingIPConfig);cdecl;external libnm;
function nm_setting_ip_config_get_ignore_auto_routes(setting:PNMSettingIPConfig):Tgboolean;cdecl;external libnm;
function nm_setting_ip_config_get_ignore_auto_dns(setting:PNMSettingIPConfig):Tgboolean;cdecl;external libnm;
function nm_setting_ip_config_get_dhcp_hostname(setting:PNMSettingIPConfig):Pchar;cdecl;external libnm;
function nm_setting_ip_config_get_dhcp_send_hostname(setting:PNMSettingIPConfig):Tgboolean;cdecl;external libnm;
function nm_setting_ip_config_get_dhcp_dscp(setting:PNMSettingIPConfig):Pchar;cdecl;external libnm;
function nm_setting_ip_config_get_never_default(setting:PNMSettingIPConfig):Tgboolean;cdecl;external libnm;
function nm_setting_ip_config_get_may_fail(setting:PNMSettingIPConfig):Tgboolean;cdecl;external libnm;
function nm_setting_ip_config_get_dad_timeout(setting:PNMSettingIPConfig):longint;cdecl;external libnm;
function nm_setting_ip_config_get_dhcp_timeout(setting:PNMSettingIPConfig):longint;cdecl;external libnm;
function nm_setting_ip_config_get_required_timeout(setting:PNMSettingIPConfig):longint;cdecl;external libnm;
function nm_setting_ip_config_get_dhcp_iaid(setting:PNMSettingIPConfig):Pchar;cdecl;external libnm;
function nm_setting_ip_config_get_dhcp_hostname_flags(setting:PNMSettingIPConfig):TNMDhcpHostnameFlags;cdecl;external libnm;
function nm_setting_ip_config_get_dhcp_reject_servers(setting:PNMSettingIPConfig; out_len:Pguint):^Pchar;cdecl;external libnm;
procedure nm_setting_ip_config_add_dhcp_reject_server(setting:PNMSettingIPConfig; server:Pchar);cdecl;external libnm;
procedure nm_setting_ip_config_remove_dhcp_reject_server(setting:PNMSettingIPConfig; idx:Tguint);cdecl;external libnm;
procedure nm_setting_ip_config_clear_dhcp_reject_servers(setting:PNMSettingIPConfig);cdecl;external libnm;
function nm_setting_ip_config_get_auto_route_ext_gw(setting:PNMSettingIPConfig):TNMTernary;cdecl;external libnm;
function nm_setting_ip_config_get_replace_local_rule(setting:PNMSettingIPConfig):TNMTernary;cdecl;external libnm;
{$endif}
{ NM_SETTING_IP_CONFIG_H  }

// === Konventiert am: 19-4-26 19:26:38 ===

function NM_TYPE_SETTING_IP_CONFIG : TGType;
function NM_SETTING_IP_CONFIG(obj : Pointer) : PNMSettingIPConfig;
function NM_SETTING_IP_CONFIG_CLASS(klass : Pointer) : PNMSettingIPConfigClass;
function NM_IS_SETTING_IP_CONFIG(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_IP_CONFIG_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_IP_CONFIG_GET_CLASS(obj : Pointer) : PNMSettingIPConfigClass;

implementation

function NM_TYPE_SETTING_IP_CONFIG : TGType;
  begin
    NM_TYPE_SETTING_IP_CONFIG:=nm_setting_ip_config_get_type;
  end;

function NM_SETTING_IP_CONFIG(obj : Pointer) : PNMSettingIPConfig;
begin
  Result := PNMSettingIPConfig(g_type_check_instance_cast(obj, NM_TYPE_SETTING_IP_CONFIG));
end;

function NM_SETTING_IP_CONFIG_CLASS(klass : Pointer) : PNMSettingIPConfigClass;
begin
  Result := PNMSettingIPConfigClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_IP_CONFIG));
end;

function NM_IS_SETTING_IP_CONFIG(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_IP_CONFIG);
end;

function NM_IS_SETTING_IP_CONFIG_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_IP_CONFIG);
end;

function NM_SETTING_IP_CONFIG_GET_CLASS(obj : Pointer) : PNMSettingIPConfigClass;
begin
  Result := PNMSettingIPConfigClass(PGTypeInstance(obj)^.g_class);
end;



end.
