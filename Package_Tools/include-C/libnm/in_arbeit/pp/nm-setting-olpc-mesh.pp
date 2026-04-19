
unit nm-setting-olpc-mesh;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-olpc-mesh.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-olpc-mesh.h
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
PGBytes  = ^GBytes;
PNMSetting  = ^NMSetting;
PNMSettingOlpcMesh  = ^NMSettingOlpcMesh;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
 * Copyright (C) 2009 One Laptop per Child
  }
{$ifndef __NM_SETTING_OLPC_MESH_H__}
{$define __NM_SETTING_OLPC_MESH_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_OLPC_MESH : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OLPC_MESH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OLPC_MESH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OLPC_MESH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OLPC_MESH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OLPC_MESH_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_OLPC_MESH_SETTING_NAME = '802-11-olpc-mesh';  
  NM_SETTING_OLPC_MESH_SSID = 'ssid';  
  NM_SETTING_OLPC_MESH_CHANNEL = 'channel';  
  NM_SETTING_OLPC_MESH_DHCP_ANYCAST_ADDRESS = 'dhcp-anycast-address';  
type

function nm_setting_olpc_mesh_get_type:TGType;cdecl;external;
function nm_setting_olpc_mesh_new:PNMSetting;cdecl;external;
function nm_setting_olpc_mesh_get_ssid(setting:PNMSettingOlpcMesh):PGBytes;cdecl;external;
function nm_setting_olpc_mesh_get_channel(setting:PNMSettingOlpcMesh):Tguint32;cdecl;external;
(* Const before type ignored *)
function nm_setting_olpc_mesh_get_dhcp_anycast_address(setting:PNMSettingOlpcMesh):Pchar;cdecl;external;
{$endif}
{ __NM_SETTING_OLPC_MESH_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_OLPC_MESH : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_OLPC_MESH:=nm_setting_olpc_mesh_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OLPC_MESH(obj : longint) : longint;
begin
  NM_SETTING_OLPC_MESH:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_OLPC_MESH,NMSettingOlpcMesh);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OLPC_MESH_CLASS(klass : longint) : longint;
begin
  NM_SETTING_OLPC_MESH_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_OLPC_MESH,NMSettingOlpcMeshClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OLPC_MESH(obj : longint) : longint;
begin
  NM_IS_SETTING_OLPC_MESH:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_OLPC_MESH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OLPC_MESH_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_OLPC_MESH_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_OLPC_MESH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OLPC_MESH_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_OLPC_MESH_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_OLPC_MESH,NMSettingOlpcMeshClass);
end;


end.
