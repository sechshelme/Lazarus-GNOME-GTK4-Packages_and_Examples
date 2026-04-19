
unit nm-vpn-editor-plugin;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-vpn-editor-plugin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-vpn-editor-plugin.h
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
Pgsize  = ^gsize;
PNMConnection  = ^NMConnection;
PNMVpnEditor  = ^NMVpnEditor;
PNMVpnEditorPlugin  = ^NMVpnEditorPlugin;
PNMVpnEditorPluginCapability  = ^NMVpnEditorPluginCapability;
PNMVpnEditorPluginFactory  = ^NMVpnEditorPluginFactory;
PNMVpnEditorPluginInterface  = ^NMVpnEditorPluginInterface;
PNMVpnEditorPluginVT  = ^NMVpnEditorPluginVT;
PNMVpnPluginInfo  = ^NMVpnPluginInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2008 Novell, Inc.
 * Copyright (C) 2008 - 2015 Red Hat, Inc.
  }
{$ifndef __NM_VPN_EDITOR_PLUGIN_H__}
{$define __NM_VPN_EDITOR_PLUGIN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include <glib.h>}
{$include <glib-object.h>}
{$include "nm-connection.h"}
{$include "nm-utils.h"}
type
{ Plugin's factory function that returns a GObject that implements
 * NMVpnEditorPlugin.
  }
{$ifndef __GI_SCANNER__}
type
  PNMVpnEditorPluginFactory = ^TNMVpnEditorPluginFactory;
  TNMVpnEditorPluginFactory = function (error:PPGError):PNMVpnEditorPlugin;cdecl;

function nm_vpn_editor_plugin_factory(error:PPGError):PNMVpnEditorPlugin;cdecl;external;
{$endif}
{*************************************************************************** }
{ Editor plugin interface                         }
{*************************************************************************** }

{ was #define dname def_expr }
function NM_TYPE_VPN_EDITOR_PLUGIN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_EDITOR_PLUGIN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_EDITOR_PLUGIN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_EDITOR_PLUGIN_GET_INTERFACE(obj : longint) : longint;

{*
 * NMVpnEditorPluginCapability:
 * @NM_VPN_EDITOR_PLUGIN_CAPABILITY_NONE: unknown or no capability
 * @NM_VPN_EDITOR_PLUGIN_CAPABILITY_IMPORT: the plugin can import new connections
 * @NM_VPN_EDITOR_PLUGIN_CAPABILITY_EXPORT: the plugin can export connections
 * @NM_VPN_EDITOR_PLUGIN_CAPABILITY_IPV6: the plugin supports IPv6 addressing
 *
 * Flags that indicate certain capabilities of the plugin to editor programs.
 * }
{< flags > }type
  PNMVpnEditorPluginCapability = ^TNMVpnEditorPluginCapability;
  TNMVpnEditorPluginCapability =  Longint;
  Const
    NM_VPN_EDITOR_PLUGIN_CAPABILITY_NONE = $00;
    NM_VPN_EDITOR_PLUGIN_CAPABILITY_IMPORT = $01;
    NM_VPN_EDITOR_PLUGIN_CAPABILITY_EXPORT = $02;
    NM_VPN_EDITOR_PLUGIN_CAPABILITY_IPV6 = $04;
;
{ Short display name of the VPN plugin  }
  NM_VPN_EDITOR_PLUGIN_NAME = 'name';  
{ Longer description of the VPN plugin  }
  NM_VPN_EDITOR_PLUGIN_DESCRIPTION = 'description';  
{ D-Bus service name of the plugin's VPN service  }
  NM_VPN_EDITOR_PLUGIN_SERVICE = 'service';  
type
{*
 * NMVpnEditorPluginInterface:
 * @g_iface: the parent interface
 * @get_editor: returns an #NMVpnEditor, pre-filled with values from @connection
 *   if non-%NULL.
 * @get_capabilities: returns a bitmask of capabilities.
 * @import_from_file: Try to import a connection from the specified path.  On
 *   success, return a partial #NMConnection object.  On error, return %NULL and
 *   set @error with additional information.  Note that @error can be %NULL, in
 *   which case no additional error information should be provided.
 * @export_to_file: Export the given connection to the specified path.  Return
 *   %TRUE on success.  On error, return %FALSE and set @error with additional
 *   error information.  Note that @error can be %NULL, in which case no
 *   additional error information should be provided.
 * @get_suggested_filename: For a given connection, return a suggested file
 *   name.  Returned value will be %NULL or a suggested file name to be freed by
 *   the caller.
 * @notify_plugin_info_set: A callback to be called when the plugin info is set.
 * @get_vt: return a virtual function table to implement further functions in
 *   the plugin, without requiring to update libnm. Used by nm_vpn_editor_plugin_get_vt().
 *
 * Interface for VPN editor plugins.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  PNMVpnEditorPluginInterface = ^TNMVpnEditorPluginInterface;
  TNMVpnEditorPluginInterface = record
      g_iface : TGTypeInterface;
      get_editor : function (plugin:PNMVpnEditorPlugin; connection:PNMConnection; error:PPGError):PNMVpnEditor;cdecl;
      get_capabilities : function (plugin:PNMVpnEditorPlugin):TNMVpnEditorPluginCapability;cdecl;
      import_from_file : function (plugin:PNMVpnEditorPlugin; path:Pchar; error:PPGError):PNMConnection;cdecl;
      export_to_file : function (plugin:PNMVpnEditorPlugin; path:Pchar; connection:PNMConnection; error:PPGError):Tgboolean;cdecl;
      get_suggested_filename : function (plugin:PNMVpnEditorPlugin; connection:PNMConnection):Pchar;cdecl;
      notify_plugin_info_set : procedure (plugin:PNMVpnEditorPlugin; plugin_info:PNMVpnPluginInfo);cdecl;
      get_vt : function (plugin:PNMVpnEditorPlugin; out_vt_size:Pgsize):PNMVpnEditorPluginVT;cdecl;
    end;

function nm_vpn_editor_plugin_get_type:TGType;cdecl;external;
function nm_vpn_editor_plugin_get_editor(plugin:PNMVpnEditorPlugin; connection:PNMConnection; error:PPGError):PNMVpnEditor;cdecl;external;
function nm_vpn_editor_plugin_get_capabilities(plugin:PNMVpnEditorPlugin):TNMVpnEditorPluginCapability;cdecl;external;
function nm_vpn_editor_plugin_get_vt(plugin:PNMVpnEditorPlugin; vt:PNMVpnEditorPluginVT; vt_size:Tgsize):Tgsize;cdecl;external;
(* Const before type ignored *)
function nm_vpn_editor_plugin_import(plugin:PNMVpnEditorPlugin; path:Pchar; error:PPGError):PNMConnection;cdecl;external;
(* Const before type ignored *)
function nm_vpn_editor_plugin_export(plugin:PNMVpnEditorPlugin; path:Pchar; connection:PNMConnection; error:PPGError):Tgboolean;cdecl;external;
function nm_vpn_editor_plugin_get_suggested_filename(plugin:PNMVpnEditorPlugin; connection:PNMConnection):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_vpn_editor_plugin_load_from_file(plugin_name:Pchar; check_service:Pchar; check_owner:longint; check_file:TNMUtilsCheckFilePredicate; user_data:Tgpointer; 
           error:PPGError):PNMVpnEditorPlugin;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_vpn_editor_plugin_load(plugin_name:Pchar; check_service:Pchar; error:PPGError):PNMVpnEditorPlugin;cdecl;external;
function nm_vpn_editor_plugin_get_plugin_info(plugin:PNMVpnEditorPlugin):PNMVpnPluginInfo;cdecl;external;
procedure nm_vpn_editor_plugin_set_plugin_info(plugin:PNMVpnEditorPlugin; plugin_info:PNMVpnPluginInfo);cdecl;external;
{$include "nm-vpn-plugin-info.h"}
{$endif}
{ __NM_VPN_EDITOR_PLUGIN_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_VPN_EDITOR_PLUGIN : longint; { return type might be wrong }
  begin
    NM_TYPE_VPN_EDITOR_PLUGIN:=nm_vpn_editor_plugin_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_EDITOR_PLUGIN(obj : longint) : longint;
begin
  NM_VPN_EDITOR_PLUGIN:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_VPN_EDITOR_PLUGIN,NMVpnEditorPlugin);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_VPN_EDITOR_PLUGIN(obj : longint) : longint;
begin
  NM_IS_VPN_EDITOR_PLUGIN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_VPN_EDITOR_PLUGIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_VPN_EDITOR_PLUGIN_GET_INTERFACE(obj : longint) : longint;
begin
  NM_VPN_EDITOR_PLUGIN_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,NM_TYPE_VPN_EDITOR_PLUGIN,NMVpnEditorPluginInterface);
end;


end.
