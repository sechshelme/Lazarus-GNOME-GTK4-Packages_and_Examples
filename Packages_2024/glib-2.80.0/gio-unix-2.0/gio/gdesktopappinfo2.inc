
{$IFDEF read_interface}


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
type
  PGDesktopAppInfoClass = ^TGDesktopAppInfoClass;
  TGDesktopAppInfoClass = record
      parent_class : TGObjectClass;
    end;


function g_desktop_app_info_get_type:TGType;cdecl;external libgio2;
function g_desktop_app_info_new_from_filename(filename:Pchar):PGDesktopAppInfo;cdecl;external libgio2;
function g_desktop_app_info_new_from_keyfile(key_file:PGKeyFile):PGDesktopAppInfo;cdecl;external libgio2;
function g_desktop_app_info_get_filename(info:PGDesktopAppInfo):Pchar;cdecl;external libgio2;
function g_desktop_app_info_get_generic_name(info:PGDesktopAppInfo):Pchar;cdecl;external libgio2;
function g_desktop_app_info_get_categories(info:PGDesktopAppInfo):Pchar;cdecl;external libgio2;
function g_desktop_app_info_get_keywords(info:PGDesktopAppInfo):^Pchar;cdecl;external libgio2;
function g_desktop_app_info_get_nodisplay(info:PGDesktopAppInfo):Tgboolean;cdecl;external libgio2;
function g_desktop_app_info_get_show_in(info:PGDesktopAppInfo; desktop_env:Pgchar):Tgboolean;cdecl;external libgio2;
function g_desktop_app_info_get_startup_wm_class(info:PGDesktopAppInfo):Pchar;cdecl;external libgio2;
function g_desktop_app_info_new(desktop_id:Pchar):PGDesktopAppInfo;cdecl;external libgio2;
function g_desktop_app_info_get_is_hidden(info:PGDesktopAppInfo):Tgboolean;cdecl;external libgio2;
procedure g_desktop_app_info_set_desktop_env(desktop_env:Pchar);cdecl;external libgio2;
function g_desktop_app_info_has_key(info:PGDesktopAppInfo; key:Pchar):Tgboolean;cdecl;external libgio2;
function g_desktop_app_info_get_string(info:PGDesktopAppInfo; key:Pchar):Pchar;cdecl;external libgio2;
function g_desktop_app_info_get_locale_string(info:PGDesktopAppInfo; key:Pchar):Pchar;cdecl;external libgio2;
function g_desktop_app_info_get_boolean(info:PGDesktopAppInfo; key:Pchar):Tgboolean;cdecl;external libgio2;
function g_desktop_app_info_get_string_list(info:PGDesktopAppInfo; key:Pchar; length:Pgsize):^Pgchar;cdecl;external libgio2;
function g_desktop_app_info_list_actions(info:PGDesktopAppInfo):^Pgchar;cdecl;external libgio2;
procedure g_desktop_app_info_launch_action(info:PGDesktopAppInfo; action_name:Pgchar; launch_context:PGAppLaunchContext);cdecl;external libgio2;
function g_desktop_app_info_get_action_name(info:PGDesktopAppInfo; action_name:Pgchar):Pgchar;cdecl;external libgio2;
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
  PGDesktopAppInfoLookupIface = ^TGDesktopAppInfoLookupIface;
  TGDesktopAppInfoLookupIface = record
      g_iface : TGTypeInterface;
      get_default_for_uri_scheme : function (lookup:PGDesktopAppInfoLookup; uri_scheme:Pchar):PGAppInfo;cdecl;
    end;


function g_desktop_app_info_lookup_get_type:TGType;cdecl;external libgio2;
function g_desktop_app_info_lookup_get_default_for_uri_scheme(lookup:PGDesktopAppInfoLookup; uri_scheme:Pchar):PGAppInfo;cdecl;external libgio2;
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

function g_desktop_app_info_launch_uris_as_manager(appinfo:PGDesktopAppInfo; uris:PGList; launch_context:PGAppLaunchContext; spawn_flags:TGSpawnFlags; user_setup:TGSpawnChildSetupFunc; 
           user_setup_data:Tgpointer; pid_callback:TGDesktopAppLaunchCallback; pid_callback_data:Tgpointer; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_desktop_app_info_launch_uris_as_manager_with_fds(appinfo:PGDesktopAppInfo; uris:PGList; launch_context:PGAppLaunchContext; spawn_flags:TGSpawnFlags; user_setup:TGSpawnChildSetupFunc; 
           user_setup_data:Tgpointer; pid_callback:TGDesktopAppLaunchCallback; pid_callback_data:Tgpointer; stdin_fd:Tgint; stdout_fd:Tgint; 
           stderr_fd:Tgint; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_desktop_app_info_search(search_string:Pgchar):^^Pgchar;cdecl;external libgio2;
function g_desktop_app_info_get_implementations(interface:Pgchar):PGList;cdecl;external libgio2;
{$endif}
{ __G_DESKTOP_APP_INFO_H__  }

// === Konventiert am: 20-11-24 15:18:39 ===

function G_TYPE_DESKTOP_APP_INFO_LOOKUP : TGType;
function G_DESKTOP_APP_INFO_LOOKUP(obj : Pointer) : PGDesktopAppInfoLookup;
function G_IS_DESKTOP_APP_INFO_LOOKUP(obj : Pointer) : Tgboolean;
function G_DESKTOP_APP_INFO_LOOKUP_GET_IFACE(obj : Pointer) : PGDesktopAppInfoLookupIface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_DESKTOP_APP_INFO_LOOKUP : TGType;
  begin
    G_TYPE_DESKTOP_APP_INFO_LOOKUP:=g_desktop_app_info_lookup_get_type;
  end;

function G_DESKTOP_APP_INFO_LOOKUP(obj : Pointer) : PGDesktopAppInfoLookup;
begin
  Result := PGDesktopAppInfoLookup(g_type_check_instance_cast(obj, G_TYPE_DESKTOP_APP_INFO_LOOKUP));
end;

function G_IS_DESKTOP_APP_INFO_LOOKUP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_DESKTOP_APP_INFO_LOOKUP);
end;

function G_DESKTOP_APP_INFO_LOOKUP_GET_IFACE(obj : Pointer) : PGDesktopAppInfoLookupIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DESKTOP_APP_INFO_LOOKUP);
end;



{$ENDIF read_implementation}
