
unit nm-dhcp-config;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-dhcp-config.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-dhcp-config.h
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
PGHashTable  = ^GHashTable;
PNMDhcpConfig  = ^NMDhcpConfig;
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

{ was #define dname def_expr }
function NM_TYPE_DHCP_CONFIG : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DHCP_CONFIG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DHCP_CONFIG_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DHCP_CONFIG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DHCP_CONFIG_CLASS(klass : longint) : longint;

{*
 * NMDhcpConfig:
  }
type

const
  NM_DHCP_CONFIG_FAMILY = 'family';  
  NM_DHCP_CONFIG_OPTIONS = 'options';  

function nm_dhcp_config_get_type:TGType;cdecl;external;
function nm_dhcp_config_get_family(config:PNMDhcpConfig):longint;cdecl;external;
function nm_dhcp_config_get_options(config:PNMDhcpConfig):PGHashTable;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_dhcp_config_get_one_option(config:PNMDhcpConfig; option:Pchar):Pchar;cdecl;external;
{$endif}
{ __NM_DHCP_CONFIG_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DHCP_CONFIG : longint; { return type might be wrong }
  begin
    NM_TYPE_DHCP_CONFIG:=nm_dhcp_config_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DHCP_CONFIG(obj : longint) : longint;
begin
  NM_DHCP_CONFIG:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DHCP_CONFIG,NMDhcpConfig);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DHCP_CONFIG_CLASS(klass : longint) : longint;
begin
  NM_DHCP_CONFIG_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DHCP_CONFIG,NMDhcpConfigClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DHCP_CONFIG(obj : longint) : longint;
begin
  NM_IS_DHCP_CONFIG:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DHCP_CONFIG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DHCP_CONFIG_CLASS(klass : longint) : longint;
begin
  NM_IS_DHCP_CONFIG_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DHCP_CONFIG);
end;


end.
