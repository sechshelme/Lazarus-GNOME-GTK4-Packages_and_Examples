
unit nm-vpn-plugin-info;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-vpn-plugin-info.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-vpn-plugin-info.h
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
PGError  = ^GError;
PGKeyFile  = ^GKeyFile;
PGSList  = ^GSList;
PNMVpnEditorPlugin  = ^NMVpnEditorPlugin;
PNMVpnPluginInfo  = ^NMVpnPluginInfo;
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

{ was #define dname def_expr }
function NM_TYPE_VPN_PLUGIN_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_PLUGIN_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_PLUGIN_INFO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_PLUGIN_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_PLUGIN_INFO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_PLUGIN_INFO_GET_CLASS(obj : longint) : longint;

const
  NM_VPN_PLUGIN_INFO_NAME = 'name';  
  NM_VPN_PLUGIN_INFO_FILENAME = 'filename';  
  NM_VPN_PLUGIN_INFO_KEYFILE = 'keyfile';  
  NM_VPN_PLUGIN_INFO_KF_GROUP_CONNECTION = 'VPN Connection';  
  NM_VPN_PLUGIN_INFO_KF_GROUP_LIBNM = 'libnm';  
  NM_VPN_PLUGIN_INFO_KF_GROUP_GNOME = 'GNOME';  
type

function nm_vpn_plugin_info_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function nm_vpn_plugin_info_new_from_file(filename:Pchar; error:PPGError):PNMVpnPluginInfo;cdecl;external;
(* Const before type ignored *)
function nm_vpn_plugin_info_new_with_data(filename:Pchar; keyfile:PGKeyFile; error:PPGError):PNMVpnPluginInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_vpn_plugin_info_new_search_file(name:Pchar; service:Pchar):PNMVpnPluginInfo;cdecl;external;
(* Const before type ignored *)
function nm_vpn_plugin_info_get_name(self:PNMVpnPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_vpn_plugin_info_get_filename(self:PNMVpnPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_vpn_plugin_info_get_service(self:PNMVpnPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_vpn_plugin_info_get_plugin(self:PNMVpnPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_vpn_plugin_info_get_program(self:PNMVpnPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_vpn_plugin_info_get_auth_dialog(self:PNMVpnPluginInfo):Pchar;cdecl;external;
function nm_vpn_plugin_info_supports_hints(self:PNMVpnPluginInfo):Tgboolean;cdecl;external;
function nm_vpn_plugin_info_supports_multiple(self:PNMVpnPluginInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_vpn_plugin_info_get_aliases(self:PNMVpnPluginInfo):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function nm_vpn_plugin_info_lookup_property(self:PNMVpnPluginInfo; group:Pchar; key:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_vpn_plugin_info_validate_filename(filename:Pchar):Tgboolean;cdecl;external;
function nm_vpn_plugin_info_list_load:PGSList;cdecl;external;
function nm_vpn_plugin_info_list_add(list:PPGSList; plugin_info:PNMVpnPluginInfo; error:PPGError):Tgboolean;cdecl;external;
function nm_vpn_plugin_info_list_remove(list:PPGSList; plugin_info:PNMVpnPluginInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_vpn_plugin_info_list_find_by_name(list:PGSList; name:Pchar):PNMVpnPluginInfo;cdecl;external;
(* Const before type ignored *)
function nm_vpn_plugin_info_list_find_by_filename(list:PGSList; filename:Pchar):PNMVpnPluginInfo;cdecl;external;
(* Const before type ignored *)
function nm_vpn_plugin_info_list_find_by_service(list:PGSList; service:Pchar):PNMVpnPluginInfo;cdecl;external;
(* Const before type ignored *)
function nm_vpn_plugin_info_list_find_service_type(list:PGSList; name:Pchar):Pchar;cdecl;external;
function nm_vpn_plugin_info_list_get_service_types(list:PGSList; only_existing:Tgboolean; with_abbreviations:Tgboolean):^Pchar;cdecl;external;
function nm_vpn_plugin_info_get_editor_plugin(self:PNMVpnPluginInfo):PNMVpnEditorPlugin;cdecl;external;
procedure nm_vpn_plugin_info_set_editor_plugin(self:PNMVpnPluginInfo; plugin:PNMVpnEditorPlugin);cdecl;external;
function nm_vpn_plugin_info_load_editor_plugin(self:PNMVpnPluginInfo; error:PPGError):PNMVpnEditorPlugin;cdecl;external;
{$endif}
{ __NM_VPN_PLUGIN_INFO_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_VPN_PLUGIN_INFO : longint; { return type might be wrong }
  begin
    NM_TYPE_VPN_PLUGIN_INFO:=nm_vpn_plugin_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_PLUGIN_INFO(obj : longint) : longint;
begin
  NM_VPN_PLUGIN_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_VPN_PLUGIN_INFO,NMVpnPluginInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_PLUGIN_INFO_CLASS(klass : longint) : longint;
begin
  NM_VPN_PLUGIN_INFO_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_VPN_PLUGIN_INFO,NMVpnPluginInfoClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_PLUGIN_INFO(obj : longint) : longint;
begin
  NM_IS_VPN_PLUGIN_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_VPN_PLUGIN_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_PLUGIN_INFO_CLASS(klass : longint) : longint;
begin
  NM_IS_VPN_PLUGIN_INFO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_VPN_PLUGIN_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_PLUGIN_INFO_GET_CLASS(obj : longint) : longint;
begin
  NM_VPN_PLUGIN_INFO_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_VPN_PLUGIN_INFO,NMVpnPluginInfoClass);
end;


end.
