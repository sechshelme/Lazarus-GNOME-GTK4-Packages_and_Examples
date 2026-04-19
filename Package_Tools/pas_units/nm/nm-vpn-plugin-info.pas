unit nm_vpn_plugin_info;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2015 Red Hat, Inc.
  }
{$ifndef __NM_VPN_PLUGIN_INFO_H__}
{$define __NM_VPN_PLUGIN_INFO_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include "nm-utils.h"}
{$include "nm-vpn-editor-plugin.h"}

const
  NM_VPN_PLUGIN_INFO_NAME = 'name';  
  NM_VPN_PLUGIN_INFO_FILENAME = 'filename';  
  NM_VPN_PLUGIN_INFO_KEYFILE = 'keyfile';  
  NM_VPN_PLUGIN_INFO_KF_GROUP_CONNECTION = 'VPN Connection';  
  NM_VPN_PLUGIN_INFO_KF_GROUP_LIBNM = 'libnm';  
  NM_VPN_PLUGIN_INFO_KF_GROUP_GNOME = 'GNOME';  
type

function nm_vpn_plugin_info_get_type:TGType;cdecl;external libnm;
function nm_vpn_plugin_info_new_from_file(filename:Pchar; error:PPGError):PNMVpnPluginInfo;cdecl;external libnm;
function nm_vpn_plugin_info_new_with_data(filename:Pchar; keyfile:PGKeyFile; error:PPGError):PNMVpnPluginInfo;cdecl;external libnm;
function nm_vpn_plugin_info_new_search_file(name:Pchar; service:Pchar):PNMVpnPluginInfo;cdecl;external libnm;
function nm_vpn_plugin_info_get_name(self:PNMVpnPluginInfo):Pchar;cdecl;external libnm;
function nm_vpn_plugin_info_get_filename(self:PNMVpnPluginInfo):Pchar;cdecl;external libnm;
function nm_vpn_plugin_info_get_service(self:PNMVpnPluginInfo):Pchar;cdecl;external libnm;
function nm_vpn_plugin_info_get_plugin(self:PNMVpnPluginInfo):Pchar;cdecl;external libnm;
function nm_vpn_plugin_info_get_program(self:PNMVpnPluginInfo):Pchar;cdecl;external libnm;
function nm_vpn_plugin_info_get_auth_dialog(self:PNMVpnPluginInfo):Pchar;cdecl;external libnm;
function nm_vpn_plugin_info_supports_hints(self:PNMVpnPluginInfo):Tgboolean;cdecl;external libnm;
function nm_vpn_plugin_info_supports_multiple(self:PNMVpnPluginInfo):Tgboolean;cdecl;external libnm;
function nm_vpn_plugin_info_get_aliases(self:PNMVpnPluginInfo):^Pchar;cdecl;external libnm;
function nm_vpn_plugin_info_lookup_property(self:PNMVpnPluginInfo; group:Pchar; key:Pchar):Pchar;cdecl;external libnm;
function nm_vpn_plugin_info_validate_filename(filename:Pchar):Tgboolean;cdecl;external libnm;
function nm_vpn_plugin_info_list_load:PGSList;cdecl;external libnm;
function nm_vpn_plugin_info_list_add(list:PPGSList; plugin_info:PNMVpnPluginInfo; error:PPGError):Tgboolean;cdecl;external libnm;
function nm_vpn_plugin_info_list_remove(list:PPGSList; plugin_info:PNMVpnPluginInfo):Tgboolean;cdecl;external libnm;
function nm_vpn_plugin_info_list_find_by_name(list:PGSList; name:Pchar):PNMVpnPluginInfo;cdecl;external libnm;
function nm_vpn_plugin_info_list_find_by_filename(list:PGSList; filename:Pchar):PNMVpnPluginInfo;cdecl;external libnm;
function nm_vpn_plugin_info_list_find_by_service(list:PGSList; service:Pchar):PNMVpnPluginInfo;cdecl;external libnm;
function nm_vpn_plugin_info_list_find_service_type(list:PGSList; name:Pchar):Pchar;cdecl;external libnm;
function nm_vpn_plugin_info_list_get_service_types(list:PGSList; only_existing:Tgboolean; with_abbreviations:Tgboolean):^Pchar;cdecl;external libnm;
function nm_vpn_plugin_info_get_editor_plugin(self:PNMVpnPluginInfo):PNMVpnEditorPlugin;cdecl;external libnm;
procedure nm_vpn_plugin_info_set_editor_plugin(self:PNMVpnPluginInfo; plugin:PNMVpnEditorPlugin);cdecl;external libnm;
function nm_vpn_plugin_info_load_editor_plugin(self:PNMVpnPluginInfo; error:PPGError):PNMVpnEditorPlugin;cdecl;external libnm;
{$endif}
{ __NM_VPN_PLUGIN_INFO_H__  }

// === Konventiert am: 19-4-26 19:19:04 ===

function NM_TYPE_VPN_PLUGIN_INFO : TGType;
function NM_VPN_PLUGIN_INFO(obj : Pointer) : PNMVpnPluginInfo;
function NM_VPN_PLUGIN_INFO_CLASS(klass : Pointer) : PNMVpnPluginInfoClass;
function NM_IS_VPN_PLUGIN_INFO(obj : Pointer) : Tgboolean;
function NM_IS_VPN_PLUGIN_INFO_CLASS(klass : Pointer) : Tgboolean;
function NM_VPN_PLUGIN_INFO_GET_CLASS(obj : Pointer) : PNMVpnPluginInfoClass;

implementation

function NM_TYPE_VPN_PLUGIN_INFO : TGType;
  begin
    NM_TYPE_VPN_PLUGIN_INFO:=nm_vpn_plugin_info_get_type;
  end;

function NM_VPN_PLUGIN_INFO(obj : Pointer) : PNMVpnPluginInfo;
begin
  Result := PNMVpnPluginInfo(g_type_check_instance_cast(obj, NM_TYPE_VPN_PLUGIN_INFO));
end;

function NM_VPN_PLUGIN_INFO_CLASS(klass : Pointer) : PNMVpnPluginInfoClass;
begin
  Result := PNMVpnPluginInfoClass(g_type_check_class_cast(klass, NM_TYPE_VPN_PLUGIN_INFO));
end;

function NM_IS_VPN_PLUGIN_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_VPN_PLUGIN_INFO);
end;

function NM_IS_VPN_PLUGIN_INFO_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_VPN_PLUGIN_INFO);
end;

function NM_VPN_PLUGIN_INFO_GET_CLASS(obj : Pointer) : PNMVpnPluginInfoClass;
begin
  Result := PNMVpnPluginInfoClass(PGTypeInstance(obj)^.g_class);
end;



end.
