
unit nm-ip-config;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-ip-config.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-ip-config.h
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
PGPtrArray  = ^GPtrArray;
PNMIPConfig  = ^NMIPConfig;
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

{ was #define dname def_expr }
function NM_TYPE_IP_CONFIG : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IP_CONFIG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IP_CONFIG_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_IP_CONFIG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_IP_CONFIG_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IP_CONFIG_GET_CLASS(obj : longint) : longint;

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

function nm_ip_config_get_type:TGType;cdecl;external;
function nm_ip_config_get_family(config:PNMIPConfig):longint;cdecl;external;
(* Const before type ignored *)
function nm_ip_config_get_gateway(config:PNMIPConfig):Pchar;cdecl;external;
function nm_ip_config_get_addresses(config:PNMIPConfig):PGPtrArray;cdecl;external;
function nm_ip_config_get_routes(config:PNMIPConfig):PGPtrArray;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_ip_config_get_nameservers(config:PNMIPConfig):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_ip_config_get_domains(config:PNMIPConfig):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_ip_config_get_searches(config:PNMIPConfig):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_ip_config_get_wins_servers(config:PNMIPConfig):^Pchar;cdecl;external;
{$endif}
{ __NM_IP_CONFIG_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_IP_CONFIG : longint; { return type might be wrong }
  begin
    NM_TYPE_IP_CONFIG:=nm_ip_config_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IP_CONFIG(obj : longint) : longint;
begin
  NM_IP_CONFIG:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_IP_CONFIG,NMIPConfig);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IP_CONFIG_CLASS(klass : longint) : longint;
begin
  NM_IP_CONFIG_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_IP_CONFIG,NMIPConfigClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_IP_CONFIG(obj : longint) : longint;
begin
  NM_IS_IP_CONFIG:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_IP_CONFIG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_IP_CONFIG_CLASS(klass : longint) : longint;
begin
  NM_IS_IP_CONFIG_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_IP_CONFIG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IP_CONFIG_GET_CLASS(obj : longint) : longint;
begin
  NM_IP_CONFIG_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_IP_CONFIG,NMIPConfigClass);
end;


end.
