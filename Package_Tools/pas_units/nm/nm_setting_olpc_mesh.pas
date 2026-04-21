unit nm_setting_olpc_mesh;

interface

uses
  fp_glib2, fp_nm;

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

const
  NM_SETTING_OLPC_MESH_SETTING_NAME = '802-11-olpc-mesh';  
  NM_SETTING_OLPC_MESH_SSID = 'ssid';  
  NM_SETTING_OLPC_MESH_CHANNEL = 'channel';  
  NM_SETTING_OLPC_MESH_DHCP_ANYCAST_ADDRESS = 'dhcp-anycast-address';  
type

function nm_setting_olpc_mesh_get_type:TGType;cdecl;external libnm;
function nm_setting_olpc_mesh_new:PNMSetting;cdecl;external libnm;
function nm_setting_olpc_mesh_get_ssid(setting:PNMSettingOlpcMesh):PGBytes;cdecl;external libnm;
function nm_setting_olpc_mesh_get_channel(setting:PNMSettingOlpcMesh):Tguint32;cdecl;external libnm;
function nm_setting_olpc_mesh_get_dhcp_anycast_address(setting:PNMSettingOlpcMesh):Pchar;cdecl;external libnm;
{$endif}
{ __NM_SETTING_OLPC_MESH_H__  }

// === Konventiert am: 19-4-26 19:26:05 ===

function NM_TYPE_SETTING_OLPC_MESH : TGType;
function NM_SETTING_OLPC_MESH(obj : Pointer) : PNMSettingOlpcMesh;
function NM_SETTING_OLPC_MESH_CLASS(klass : Pointer) : PNMSettingOlpcMeshClass;
function NM_IS_SETTING_OLPC_MESH(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_OLPC_MESH_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_OLPC_MESH_GET_CLASS(obj : Pointer) : PNMSettingOlpcMeshClass;

implementation

function NM_TYPE_SETTING_OLPC_MESH : TGType;
  begin
    NM_TYPE_SETTING_OLPC_MESH:=nm_setting_olpc_mesh_get_type;
  end;

function NM_SETTING_OLPC_MESH(obj : Pointer) : PNMSettingOlpcMesh;
begin
  Result := PNMSettingOlpcMesh(g_type_check_instance_cast(obj, NM_TYPE_SETTING_OLPC_MESH));
end;

function NM_SETTING_OLPC_MESH_CLASS(klass : Pointer) : PNMSettingOlpcMeshClass;
begin
  Result := PNMSettingOlpcMeshClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_OLPC_MESH));
end;

function NM_IS_SETTING_OLPC_MESH(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_OLPC_MESH);
end;

function NM_IS_SETTING_OLPC_MESH_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_OLPC_MESH);
end;

function NM_SETTING_OLPC_MESH_GET_CLASS(obj : Pointer) : PNMSettingOlpcMeshClass;
begin
  Result := PNMSettingOlpcMeshClass(PGTypeInstance(obj)^.g_class);
end;



end.
