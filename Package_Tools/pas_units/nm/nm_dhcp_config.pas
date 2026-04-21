unit nm_dhcp_config;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2008 Red Hat, Inc.
 * Copyright (C) 2008 Novell, Inc.
  }
{$ifndef __NM_DHCP_CONFIG_H__}
{$define __NM_DHCP_CONFIG_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-object.h"}

{*
 * NMDhcpConfig:
  }
type

const
  NM_DHCP_CONFIG_FAMILY = 'family';  
  NM_DHCP_CONFIG_OPTIONS = 'options';  

function nm_dhcp_config_get_type:TGType;cdecl;external libnm;
function nm_dhcp_config_get_family(config:PNMDhcpConfig):longint;cdecl;external libnm;
function nm_dhcp_config_get_options(config:PNMDhcpConfig):PGHashTable;cdecl;external libnm;
function nm_dhcp_config_get_one_option(config:PNMDhcpConfig; option:Pchar):Pchar;cdecl;external libnm;
{$endif}
{ __NM_DHCP_CONFIG_H__  }

// === Konventiert am: 19-4-26 19:29:39 ===

function NM_TYPE_DHCP_CONFIG : TGType;
function NM_DHCP_CONFIG(obj : Pointer) : PNMDhcpConfig;
function NM_DHCP_CONFIG_CLASS(klass : Pointer) : PNMDhcpConfigClass;
function NM_IS_DHCP_CONFIG(obj : Pointer) : Tgboolean;
function NM_IS_DHCP_CONFIG_CLASS(klass : Pointer) : Tgboolean;

implementation

function NM_TYPE_DHCP_CONFIG : TGType;
  begin
    NM_TYPE_DHCP_CONFIG:=nm_dhcp_config_get_type;
  end;

function NM_DHCP_CONFIG(obj : Pointer) : PNMDhcpConfig;
begin
  Result := PNMDhcpConfig(g_type_check_instance_cast(obj, NM_TYPE_DHCP_CONFIG));
end;

function NM_DHCP_CONFIG_CLASS(klass : Pointer) : PNMDhcpConfigClass;
begin
  Result := PNMDhcpConfigClass(g_type_check_class_cast(klass, NM_TYPE_DHCP_CONFIG));
end;

function NM_IS_DHCP_CONFIG(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DHCP_CONFIG);
end;

function NM_IS_DHCP_CONFIG_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DHCP_CONFIG);
end;



end.
