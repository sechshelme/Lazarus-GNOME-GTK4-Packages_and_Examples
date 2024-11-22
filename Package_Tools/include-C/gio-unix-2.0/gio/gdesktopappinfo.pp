
{$mode objfpc}
unit gdesktopappinfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdesktopappinfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdesktopappinfo.h
    -P
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
PGAppInfo  = ^GAppInfo;
PGAppLaunchContext  = ^GAppLaunchContext;
Pgchar  = ^gchar;
PGDesktopAppInfo  = ^GDesktopAppInfo;
PGDesktopAppInfoClass  = ^GDesktopAppInfoClass;
PGDesktopAppInfoLookup  = ^GDesktopAppInfoLookup;
PGDesktopAppInfoLookupIface  = ^GDesktopAppInfoLookupIface;
PGError  = ^GError;
PGKeyFile  = ^GKeyFile;
PGList  = ^GList;
Pgsize  = ^gsize;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_DESKTOP_APP_INFO_H__}
{$define __G_DESKTOP_APP_INFO_H__}
{$include <gio/gio.h>}

{ was #define dname def_expr }
function G_TYPE_DESKTOP_APP_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DESKTOP_APP_INFO(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DESKTOP_APP_INFO_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DESKTOP_APP_INFO(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DESKTOP_APP_INFO_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DESKTOP_APP_INFO_GET_CLASS(o : longint) : longint;

type
  PGDesktopAppInfoClass = ^TGDesktopAppInfoClass;
  TGDesktopAppInfoClass = record
      parent_class : TGObjectClass;
    end;

var
g_desktop_app_info_get_type : function:TGType;cdecl;
(* Const before type ignored *)
g_desktop_app_info_new_from_filename : function(filename:Pchar):PGDesktopAppInfo;cdecl;
g_desktop_app_info_new_from_keyfile : function(key_file:PGKeyFile):PGDesktopAppInfo;cdecl;
(* Const before type ignored *)
g_desktop_app_info_get_filename : function(info:PGDesktopAppInfo):Pchar;cdecl;
(* Const before type ignored *)
g_desktop_app_info_get_generic_name : function(info:PGDesktopAppInfo):Pchar;cdecl;
(* Const before type ignored *)
g_desktop_app_info_get_categories : function(info:PGDesktopAppInfo):Pchar;cdecl;
(* Const before type ignored *)
(* Const before declarator ignored *)
g_desktop_app_info_get_keywords : function(info:PGDesktopAppInfo):^Pchar;cdecl;
g_desktop_app_info_get_nodisplay : function(info:PGDesktopAppInfo):Tgboolean;cdecl;
(* Const before type ignored *)
g_desktop_app_info_get_show_in : function(info:PGDesktopAppInfo; desktop_env:Pgchar):Tgboolean;cdecl;
(* Const before type ignored *)
g_desktop_app_info_get_startup_wm_class : function(info:PGDesktopAppInfo):Pchar;cdecl;
(* Const before type ignored *)
g_desktop_app_info_new : function(desktop_id:Pchar):PGDesktopAppInfo;cdecl;
g_desktop_app_info_get_is_hidden : function(info:PGDesktopAppInfo):Tgboolean;cdecl;
(* Const before type ignored *)
g_desktop_app_info_set_desktop_env : procedure(desktop_env:Pchar);cdecl;
(* Const before type ignored *)
g_desktop_app_info_has_key : function(info:PGDesktopAppInfo; key:Pchar):Tgboolean;cdecl;
(* Const before type ignored *)
g_desktop_app_info_get_string : function(info:PGDesktopAppInfo; key:Pchar):Pchar;cdecl;
(* Const before type ignored *)
g_desktop_app_info_get_locale_string : function(info:PGDesktopAppInfo; key:Pchar):Pchar;cdecl;
(* Const before type ignored *)
g_desktop_app_info_get_boolean : function(info:PGDesktopAppInfo; key:Pchar):Tgboolean;cdecl;
(* Const before type ignored *)
g_desktop_app_info_get_string_list : function(info:PGDesktopAppInfo; key:Pchar; length:Pgsize):^Pgchar;cdecl;
(* Const before type ignored *)
(* Const before declarator ignored *)
g_desktop_app_info_list_actions : function(info:PGDesktopAppInfo):^Pgchar;cdecl;
(* Const before type ignored *)
g_desktop_app_info_launch_action : procedure(info:PGDesktopAppInfo; action_name:Pgchar; launch_context:PGAppLaunchContext);cdecl;
(* Const before type ignored *)
g_desktop_app_info_get_action_name : function(info:PGDesktopAppInfo; action_name:Pgchar):Pgchar;cdecl;

{ was #define dname def_expr }
function G_TYPE_DESKTOP_APP_INFO_LOOKUP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DESKTOP_APP_INFO_LOOKUP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DESKTOP_APP_INFO_LOOKUP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DESKTOP_APP_INFO_LOOKUP_GET_IFACE(obj : longint) : longint;

{*
 * G_DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME:
 *
 * Extension point for default handler to URI association. See
 * [Extending GIO][extending-gio].
 *
 * Deprecated: 2.28: The #GDesktopAppInfoLookup interface is deprecated and
 *    unused by GIO.
  }
const
  G_DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME = 'gio-desktop-app-info-lookup';  
{*
 * GDesktopAppInfoLookupIface:
 * @get_default_for_uri_scheme: Virtual method for
 *  g_desktop_app_info_lookup_get_default_for_uri_scheme().
 *
 * Interface that is used by backends to associate default
 * handlers with URI schemes.
  }
type
(* Const before type ignored *)
  PGDesktopAppInfoLookupIface = ^TGDesktopAppInfoLookupIface;
  TGDesktopAppInfoLookupIface = record
      g_iface : TGTypeInterface;
      get_default_for_uri_scheme : function (lookup:PGDesktopAppInfoLookup; uri_scheme:Pchar):PGAppInfo;cdecl;
    end;

var
g_desktop_app_info_lookup_get_type : function:TGType;cdecl;
(* Const before type ignored *)
g_desktop_app_info_lookup_get_default_for_uri_scheme : function(lookup:PGDesktopAppInfoLookup; uri_scheme:Pchar):PGAppInfo;cdecl;
{*
 * GDesktopAppLaunchCallback:
 * @appinfo: a #GDesktopAppInfo
 * @pid: Process identifier
 * @user_data: User data
 *
 * During invocation, g_desktop_app_info_launch_uris_as_manager() may
 * create one or more child processes.  This callback is invoked once
 * for each, providing the process ID.
  }
type

  TGDesktopAppLaunchCallback = procedure (appinfo:PGDesktopAppInfo; pid:TGPid; user_data:Tgpointer);cdecl;
var
g_desktop_app_info_launch_uris_as_manager : function(appinfo:PGDesktopAppInfo; uris:PGList; launch_context:PGAppLaunchContext; spawn_flags:TGSpawnFlags; user_setup:TGSpawnChildSetupFunc; 
    user_setup_data:Tgpointer; pid_callback:TGDesktopAppLaunchCallback; pid_callback_data:Tgpointer; error:PPGError):Tgboolean;cdecl;
g_desktop_app_info_launch_uris_as_manager_with_fds : function(appinfo:PGDesktopAppInfo; uris:PGList; launch_context:PGAppLaunchContext; spawn_flags:TGSpawnFlags; user_setup:TGSpawnChildSetupFunc; 
    user_setup_data:Tgpointer; pid_callback:TGDesktopAppLaunchCallback; pid_callback_data:Tgpointer; stdin_fd:Tgint; stdout_fd:Tgint; 
    stderr_fd:Tgint; error:PPGError):Tgboolean;cdecl;
(* Const before type ignored *)
g_desktop_app_info_search : function(search_string:Pgchar):^^Pgchar;cdecl;
(* Const before type ignored *)
g_desktop_app_info_get_implementations : function(interface:Pgchar):PGList;cdecl;
{$endif}
{ __G_DESKTOP_APP_INFO_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DESKTOP_APP_INFO : longint; { return type might be wrong }
  begin
    G_TYPE_DESKTOP_APP_INFO:=g_desktop_app_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DESKTOP_APP_INFO(o : longint) : longint;
begin
  G_DESKTOP_APP_INFO:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_DESKTOP_APP_INFO,GDesktopAppInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DESKTOP_APP_INFO_CLASS(k : longint) : longint;
begin
  G_DESKTOP_APP_INFO_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_DESKTOP_APP_INFO,GDesktopAppInfoClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DESKTOP_APP_INFO(o : longint) : longint;
begin
  G_IS_DESKTOP_APP_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DESKTOP_APP_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DESKTOP_APP_INFO_CLASS(k : longint) : longint;
begin
  G_IS_DESKTOP_APP_INFO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_DESKTOP_APP_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DESKTOP_APP_INFO_GET_CLASS(o : longint) : longint;
begin
  G_DESKTOP_APP_INFO_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_DESKTOP_APP_INFO,GDesktopAppInfoClass);
end;

{ was #define dname def_expr }
function G_TYPE_DESKTOP_APP_INFO_LOOKUP : longint; { return type might be wrong }
  begin
    G_TYPE_DESKTOP_APP_INFO_LOOKUP:=g_desktop_app_info_lookup_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DESKTOP_APP_INFO_LOOKUP(obj : longint) : longint;
begin
  G_DESKTOP_APP_INFO_LOOKUP:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_DESKTOP_APP_INFO_LOOKUP,GDesktopAppInfoLookup);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DESKTOP_APP_INFO_LOOKUP(obj : longint) : longint;
begin
  G_IS_DESKTOP_APP_INFO_LOOKUP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_DESKTOP_APP_INFO_LOOKUP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DESKTOP_APP_INFO_LOOKUP_GET_IFACE(obj : longint) : longint;
begin
  G_DESKTOP_APP_INFO_LOOKUP_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_DESKTOP_APP_INFO_LOOKUP,GDesktopAppInfoLookupIface);
end;

  uses
    SysUtils, dynlibs;

  var
    hlib : tlibhandle;


  procedure Freegdesktopappinfo;
    begin
      FreeLibrary(hlib);
      g_desktop_app_info_get_type:=nil;
      g_desktop_app_info_new_from_filename:=nil;
      g_desktop_app_info_new_from_keyfile:=nil;
      g_desktop_app_info_get_filename:=nil;
      g_desktop_app_info_get_generic_name:=nil;
      g_desktop_app_info_get_categories:=nil;
      g_desktop_app_info_get_keywords:=nil;
      g_desktop_app_info_get_nodisplay:=nil;
      g_desktop_app_info_get_show_in:=nil;
      g_desktop_app_info_get_startup_wm_class:=nil;
      g_desktop_app_info_new:=nil;
      g_desktop_app_info_get_is_hidden:=nil;
      g_desktop_app_info_set_desktop_env:=nil;
      g_desktop_app_info_has_key:=nil;
      g_desktop_app_info_get_string:=nil;
      g_desktop_app_info_get_locale_string:=nil;
      g_desktop_app_info_get_boolean:=nil;
      g_desktop_app_info_get_string_list:=nil;
      g_desktop_app_info_list_actions:=nil;
      g_desktop_app_info_launch_action:=nil;
      g_desktop_app_info_get_action_name:=nil;
      g_desktop_app_info_lookup_get_type:=nil;
      g_desktop_app_info_lookup_get_default_for_uri_scheme:=nil;
      g_desktop_app_info_launch_uris_as_manager:=nil;
      g_desktop_app_info_launch_uris_as_manager_with_fds:=nil;
      g_desktop_app_info_search:=nil;
      g_desktop_app_info_get_implementations:=nil;
    end;


  procedure Loadgdesktopappinfo(lib : pchar);
    begin
      Freegdesktopappinfo;
      hlib:=LoadLibrary(lib);
      if hlib=0 then
        raise Exception.Create(format('Could not load library: %s',[lib]));

      pointer(g_desktop_app_info_get_type):=GetProcAddress(hlib,'g_desktop_app_info_get_type');
      pointer(g_desktop_app_info_new_from_filename):=GetProcAddress(hlib,'g_desktop_app_info_new_from_filename');
      pointer(g_desktop_app_info_new_from_keyfile):=GetProcAddress(hlib,'g_desktop_app_info_new_from_keyfile');
      pointer(g_desktop_app_info_get_filename):=GetProcAddress(hlib,'g_desktop_app_info_get_filename');
      pointer(g_desktop_app_info_get_generic_name):=GetProcAddress(hlib,'g_desktop_app_info_get_generic_name');
      pointer(g_desktop_app_info_get_categories):=GetProcAddress(hlib,'g_desktop_app_info_get_categories');
      pointer(g_desktop_app_info_get_keywords):=GetProcAddress(hlib,'g_desktop_app_info_get_keywords');
      pointer(g_desktop_app_info_get_nodisplay):=GetProcAddress(hlib,'g_desktop_app_info_get_nodisplay');
      pointer(g_desktop_app_info_get_show_in):=GetProcAddress(hlib,'g_desktop_app_info_get_show_in');
      pointer(g_desktop_app_info_get_startup_wm_class):=GetProcAddress(hlib,'g_desktop_app_info_get_startup_wm_class');
      pointer(g_desktop_app_info_new):=GetProcAddress(hlib,'g_desktop_app_info_new');
      pointer(g_desktop_app_info_get_is_hidden):=GetProcAddress(hlib,'g_desktop_app_info_get_is_hidden');
      pointer(g_desktop_app_info_set_desktop_env):=GetProcAddress(hlib,'g_desktop_app_info_set_desktop_env');
      pointer(g_desktop_app_info_has_key):=GetProcAddress(hlib,'g_desktop_app_info_has_key');
      pointer(g_desktop_app_info_get_string):=GetProcAddress(hlib,'g_desktop_app_info_get_string');
      pointer(g_desktop_app_info_get_locale_string):=GetProcAddress(hlib,'g_desktop_app_info_get_locale_string');
      pointer(g_desktop_app_info_get_boolean):=GetProcAddress(hlib,'g_desktop_app_info_get_boolean');
      pointer(g_desktop_app_info_get_string_list):=GetProcAddress(hlib,'g_desktop_app_info_get_string_list');
      pointer(g_desktop_app_info_list_actions):=GetProcAddress(hlib,'g_desktop_app_info_list_actions');
      pointer(g_desktop_app_info_launch_action):=GetProcAddress(hlib,'g_desktop_app_info_launch_action');
      pointer(g_desktop_app_info_get_action_name):=GetProcAddress(hlib,'g_desktop_app_info_get_action_name');
      pointer(g_desktop_app_info_lookup_get_type):=GetProcAddress(hlib,'g_desktop_app_info_lookup_get_type');
      pointer(g_desktop_app_info_lookup_get_default_for_uri_scheme):=GetProcAddress(hlib,'g_desktop_app_info_lookup_get_default_for_uri_scheme');
      pointer(g_desktop_app_info_launch_uris_as_manager):=GetProcAddress(hlib,'g_desktop_app_info_launch_uris_as_manager');
      pointer(g_desktop_app_info_launch_uris_as_manager_with_fds):=GetProcAddress(hlib,'g_desktop_app_info_launch_uris_as_manager_with_fds');
      pointer(g_desktop_app_info_search):=GetProcAddress(hlib,'g_desktop_app_info_search');
      pointer(g_desktop_app_info_get_implementations):=GetProcAddress(hlib,'g_desktop_app_info_get_implementations');
    end;


initialization
  Loadgdesktopappinfo('gdesktopappinfo');
finalization
  Freegdesktopappinfo;

end.
