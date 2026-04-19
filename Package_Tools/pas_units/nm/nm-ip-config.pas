unit nm_ip_config;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Novell, Inc.
 * Copyright (C) 2008 - 2014 Red Hat, Inc.
  }
{$ifndef __NM_IP_CONFIG_H__}
{$define __NM_IP_CONFIG_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-object.h"}

{*
 * NMIPConfig:
  }
type

const
  NM_IP_CONFIG_FAMILY = 'family';  
  NM_IP_CONFIG_GATEWAY = 'gateway';  
  NM_IP_CONFIG_ADDRESSES = 'addresses';  
  NM_IP_CONFIG_ROUTES = 'routes';  
  NM_IP_CONFIG_NAMESERVERS = 'nameservers';  
  NM_IP_CONFIG_DOMAINS = 'domains';  
  NM_IP_CONFIG_SEARCHES = 'searches';  
  NM_IP_CONFIG_WINS_SERVERS = 'wins-servers';  

function nm_ip_config_get_type:TGType;cdecl;external libnm;
function nm_ip_config_get_family(config:PNMIPConfig):longint;cdecl;external libnm;
function nm_ip_config_get_gateway(config:PNMIPConfig):Pchar;cdecl;external libnm;
function nm_ip_config_get_addresses(config:PNMIPConfig):PGPtrArray;cdecl;external libnm;
function nm_ip_config_get_routes(config:PNMIPConfig):PGPtrArray;cdecl;external libnm;
function nm_ip_config_get_nameservers(config:PNMIPConfig):^Pchar;cdecl;external libnm;
function nm_ip_config_get_domains(config:PNMIPConfig):^Pchar;cdecl;external libnm;
function nm_ip_config_get_searches(config:PNMIPConfig):^Pchar;cdecl;external libnm;
function nm_ip_config_get_wins_servers(config:PNMIPConfig):^Pchar;cdecl;external libnm;
{$endif}
{ __NM_IP_CONFIG_H__  }

// === Konventiert am: 19-4-26 19:28:50 ===

function NM_TYPE_IP_CONFIG : TGType;
function NM_IP_CONFIG(obj : Pointer) : PNMIPConfig;
function NM_IP_CONFIG_CLASS(klass : Pointer) : PNMIPConfigClass;
function NM_IS_IP_CONFIG(obj : Pointer) : Tgboolean;
function NM_IS_IP_CONFIG_CLASS(klass : Pointer) : Tgboolean;
function NM_IP_CONFIG_GET_CLASS(obj : Pointer) : PNMIPConfigClass;

implementation

function NM_TYPE_IP_CONFIG : TGType;
  begin
    NM_TYPE_IP_CONFIG:=nm_ip_config_get_type;
  end;

function NM_IP_CONFIG(obj : Pointer) : PNMIPConfig;
begin
  Result := PNMIPConfig(g_type_check_instance_cast(obj, NM_TYPE_IP_CONFIG));
end;

function NM_IP_CONFIG_CLASS(klass : Pointer) : PNMIPConfigClass;
begin
  Result := PNMIPConfigClass(g_type_check_class_cast(klass, NM_TYPE_IP_CONFIG));
end;

function NM_IS_IP_CONFIG(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_IP_CONFIG);
end;

function NM_IS_IP_CONFIG_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_IP_CONFIG);
end;

function NM_IP_CONFIG_GET_CLASS(obj : Pointer) : PNMIPConfigClass;
begin
  Result := PNMIPConfigClass(PGTypeInstance(obj)^.g_class);
end;



end.
