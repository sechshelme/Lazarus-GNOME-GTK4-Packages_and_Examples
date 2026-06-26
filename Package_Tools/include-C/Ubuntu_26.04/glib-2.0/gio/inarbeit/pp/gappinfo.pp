
unit gappinfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from gappinfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gappinfo.h
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
PGAppInfoIface  = ^GAppInfoIface;
PGAppInfoMonitor  = ^GAppInfoMonitor;
PGAppLaunchContext  = ^GAppLaunchContext;
PGAppLaunchContextClass  = ^GAppLaunchContextClass;
PGAppLaunchContextPrivate  = ^GAppLaunchContextPrivate;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGIcon  = ^GIcon;
PGList  = ^GList;
PGVariant  = ^GVariant;
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
{$ifndef __G_APP_INFO_H__}
{$define __G_APP_INFO_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_APP_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APP_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APP_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APP_INFO_GET_IFACE(obj : longint) : longint;

{ was #define dname def_expr }
function G_TYPE_APP_LAUNCH_CONTEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APP_LAUNCH_CONTEXT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APP_LAUNCH_CONTEXT_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APP_LAUNCH_CONTEXT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APP_LAUNCH_CONTEXT_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APP_LAUNCH_CONTEXT_GET_CLASS(o : longint) : longint;

type
{*
 * GAppInfoIface:
 * @g_iface: The parent interface.
 * @dup: Copies a [iface@Gio.AppInfo].
 * @equal: Checks two [iface@Gio.AppInfo]s for equality.
 * @get_id: Gets a string identifier for a [iface@Gio.AppInfo].
 * @get_name: Gets the name of the application for a [iface@Gio.AppInfo].
 * @get_description: Gets a short description for the application described by
 *   the [iface@Gio.AppInfo].
 * @get_executable: Gets the executable name for the [iface@Gio.AppInfo].
 * @get_icon: Gets the [iface@Gio.Icon] for the [iface@Gio.AppInfo].
 * @launch: Launches an application specified by the [iface@Gio.AppInfo].
 * @supports_uris: Indicates whether the application specified supports
 *   launching URIs.
 * @supports_files: Indicates whether the application specified accepts
 *   filename arguments.
 * @launch_uris: Launches an application with a list of URIs.
 * @should_show: Returns whether an application should be shown (e.g. when
 *   getting a list of installed applications).
 *   [FreeDesktop.Org Startup Notification Specification](http://standards.freedesktop.org/startup-notification-spec/startup-notification-latest.txt).
 * @set_as_default_for_type: Sets an application as default for a given content
 *   type.
 * @set_as_default_for_extension: Sets an application as default for a given
 *   file extension.
 * @add_supports_type: Adds to the [iface@Gio.AppInfo] information about
 *   supported file types.
 * @can_remove_supports_type: Checks for support for removing supported file
 *   types from a [iface@Gio.AppInfo].
 * @remove_supports_type: Removes a supported application type from a
 *   [iface@Gio.AppInfo].
 * @can_delete: Checks if a [iface@Gio.AppInfo] can be deleted. (Since 2.20)
 * @do_delete: Deletes a [iface@Gio.AppInfo]. (Since 2.20)
 * @get_commandline: Gets the commandline for the [iface@Gio.AppInfo].
 *   (Since 2.20)
 * @get_display_name: Gets the display name for the [iface@Gio.AppInfo].
 *   (Since 2.24)
 * @set_as_last_used_for_type: Sets the application as the last used. See
 *   [method@Gio.AppInfo.set_as_last_used_for_type].
 * @get_supported_types: Retrieves the list of content types that @app_info
 *   claims to support.
 * @launch_uris_async: Asynchronously launches an application with a list of
 *   URIs. (Since: 2.60)
 * @launch_uris_finish: Finishes an operation started with @launch_uris_async.
 *   (Since: 2.60)

 * Application Information interface, for operating system portability.
  }
{ Virtual Table  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ For changing associations  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PGAppInfoIface = ^TGAppInfoIface;
  TGAppInfoIface = record
      g_iface : TGTypeInterface;
      dup : function (appinfo:PGAppInfo):PGAppInfo;cdecl;
      equal : function (appinfo1:PGAppInfo; appinfo2:PGAppInfo):Tgboolean;cdecl;
      get_id : function (appinfo:PGAppInfo):Pchar;cdecl;
      get_name : function (appinfo:PGAppInfo):Pchar;cdecl;
      get_description : function (appinfo:PGAppInfo):Pchar;cdecl;
      get_executable : function (appinfo:PGAppInfo):Pchar;cdecl;
      get_icon : function (appinfo:PGAppInfo):PGIcon;cdecl;
      launch : function (appinfo:PGAppInfo; files:PGList; context:PGAppLaunchContext; error:PPGError):Tgboolean;cdecl;
      supports_uris : function (appinfo:PGAppInfo):Tgboolean;cdecl;
      supports_files : function (appinfo:PGAppInfo):Tgboolean;cdecl;
      launch_uris : function (appinfo:PGAppInfo; uris:PGList; context:PGAppLaunchContext; error:PPGError):Tgboolean;cdecl;
      should_show : function (appinfo:PGAppInfo):Tgboolean;cdecl;
      set_as_default_for_type : function (appinfo:PGAppInfo; content_type:Pchar; error:PPGError):Tgboolean;cdecl;
      set_as_default_for_extension : function (appinfo:PGAppInfo; extension:Pchar; error:PPGError):Tgboolean;cdecl;
      add_supports_type : function (appinfo:PGAppInfo; content_type:Pchar; error:PPGError):Tgboolean;cdecl;
      can_remove_supports_type : function (appinfo:PGAppInfo):Tgboolean;cdecl;
      remove_supports_type : function (appinfo:PGAppInfo; content_type:Pchar; error:PPGError):Tgboolean;cdecl;
      can_delete : function (appinfo:PGAppInfo):Tgboolean;cdecl;
      do_delete : function (appinfo:PGAppInfo):Tgboolean;cdecl;
      get_commandline : function (appinfo:PGAppInfo):Pchar;cdecl;
      get_display_name : function (appinfo:PGAppInfo):Pchar;cdecl;
      set_as_last_used_for_type : function (appinfo:PGAppInfo; content_type:Pchar; error:PPGError):Tgboolean;cdecl;
      get_supported_types : function (appinfo:PGAppInfo):PPchar;cdecl;
      launch_uris_async : procedure (appinfo:PGAppInfo; uris:PGList; context:PGAppLaunchContext; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      launch_uris_finish : function (appinfo:PGAppInfo; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
    end;


function g_app_info_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_app_info_create_from_commandline(commandline:Pchar; application_name:Pchar; flags:TGAppInfoCreateFlags; error:PPGError):PGAppInfo;cdecl;external;
function g_app_info_dup(appinfo:PGAppInfo):PGAppInfo;cdecl;external;
function g_app_info_equal(appinfo1:PGAppInfo; appinfo2:PGAppInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_app_info_get_id(appinfo:PGAppInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function g_app_info_get_name(appinfo:PGAppInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function g_app_info_get_display_name(appinfo:PGAppInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function g_app_info_get_description(appinfo:PGAppInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function g_app_info_get_executable(appinfo:PGAppInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function g_app_info_get_commandline(appinfo:PGAppInfo):Pchar;cdecl;external;
function g_app_info_get_icon(appinfo:PGAppInfo):PGIcon;cdecl;external;
function g_app_info_launch(appinfo:PGAppInfo; files:PGList; context:PGAppLaunchContext; error:PPGError):Tgboolean;cdecl;external;
function g_app_info_supports_uris(appinfo:PGAppInfo):Tgboolean;cdecl;external;
function g_app_info_supports_files(appinfo:PGAppInfo):Tgboolean;cdecl;external;
function g_app_info_launch_uris(appinfo:PGAppInfo; uris:PGList; context:PGAppLaunchContext; error:PPGError):Tgboolean;cdecl;external;
procedure g_app_info_launch_uris_async(appinfo:PGAppInfo; uris:PGList; context:PGAppLaunchContext; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_app_info_launch_uris_finish(appinfo:PGAppInfo; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_app_info_should_show(appinfo:PGAppInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_app_info_set_as_default_for_type(appinfo:PGAppInfo; content_type:Pchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_app_info_set_as_default_for_extension(appinfo:PGAppInfo; extension:Pchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_app_info_add_supports_type(appinfo:PGAppInfo; content_type:Pchar; error:PPGError):Tgboolean;cdecl;external;
function g_app_info_can_remove_supports_type(appinfo:PGAppInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_app_info_remove_supports_type(appinfo:PGAppInfo; content_type:Pchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_app_info_get_supported_types(appinfo:PGAppInfo):^Pchar;cdecl;external;
function g_app_info_can_delete(appinfo:PGAppInfo):Tgboolean;cdecl;external;
function g_app_info_delete(appinfo:PGAppInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_app_info_set_as_last_used_for_type(appinfo:PGAppInfo; content_type:Pchar; error:PPGError):Tgboolean;cdecl;external;
function g_app_info_get_all:PGList;cdecl;external;
(* Const before type ignored *)
function g_app_info_get_all_for_type(content_type:Pchar):PGList;cdecl;external;
(* Const before type ignored *)
function g_app_info_get_recommended_for_type(content_type:Pgchar):PGList;cdecl;external;
(* Const before type ignored *)
function g_app_info_get_fallback_for_type(content_type:Pgchar):PGList;cdecl;external;
(* Const before type ignored *)
procedure g_app_info_reset_type_associations(content_type:Pchar);cdecl;external;
(* Const before type ignored *)
function g_app_info_get_default_for_type(content_type:Pchar; must_support_uris:Tgboolean):PGAppInfo;cdecl;external;
(* Const before type ignored *)
procedure g_app_info_get_default_for_type_async(content_type:Pchar; must_support_uris:Tgboolean; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_app_info_get_default_for_type_finish(result:PGAsyncResult; error:PPGError):PGAppInfo;cdecl;external;
(* Const before type ignored *)
function g_app_info_get_default_for_uri_scheme(uri_scheme:Pchar):PGAppInfo;cdecl;external;
(* Const before type ignored *)
procedure g_app_info_get_default_for_uri_scheme_async(uri_scheme:Pchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_app_info_get_default_for_uri_scheme_finish(result:PGAsyncResult; error:PPGError):PGAppInfo;cdecl;external;
(* Const before type ignored *)
function g_app_info_launch_default_for_uri(uri:Pchar; context:PGAppLaunchContext; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure g_app_info_launch_default_for_uri_async(uri:Pchar; context:PGAppLaunchContext; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_app_info_launch_default_for_uri_finish(result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{*
 * GAppLaunchContext:
 *
 * Integrating the launch with the launching application. This is used to
 * handle for instance startup notification and launching the new application
 * on the same screen as the launching window.
  }
{< private > }
type
  PGAppLaunchContext = ^TGAppLaunchContext;
  TGAppLaunchContext = record
      parent_instance : TGObject;
      priv : PGAppLaunchContextPrivate;
    end;

(* Const before type ignored *)
{ Padding for future expansion  }
  PGAppLaunchContextClass = ^TGAppLaunchContextClass;
  TGAppLaunchContextClass = record
      parent_class : TGObjectClass;
      get_display : function (context:PGAppLaunchContext; info:PGAppInfo; files:PGList):Pchar;cdecl;
      get_startup_notify_id : function (context:PGAppLaunchContext; info:PGAppInfo; files:PGList):Pchar;cdecl;
      launch_failed : procedure (context:PGAppLaunchContext; startup_notify_id:Pchar);cdecl;
      launched : procedure (context:PGAppLaunchContext; info:PGAppInfo; platform_data:PGVariant);cdecl;
      launch_started : procedure (context:PGAppLaunchContext; info:PGAppInfo; platform_data:PGVariant);cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
    end;


function g_app_launch_context_get_type:TGType;cdecl;external;
function g_app_launch_context_new:PGAppLaunchContext;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_app_launch_context_setenv(context:PGAppLaunchContext; variable:Pchar; value:Pchar);cdecl;external;
(* Const before type ignored *)
procedure g_app_launch_context_unsetenv(context:PGAppLaunchContext; variable:Pchar);cdecl;external;
function g_app_launch_context_get_environment(context:PGAppLaunchContext):^Pchar;cdecl;external;
function g_app_launch_context_get_display(context:PGAppLaunchContext; info:PGAppInfo; files:PGList):Pchar;cdecl;external;
function g_app_launch_context_get_startup_notify_id(context:PGAppLaunchContext; info:PGAppInfo; files:PGList):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_app_launch_context_launch_failed(context:PGAppLaunchContext; startup_notify_id:Pchar);cdecl;external;
{ was #define dname def_expr }
function G_TYPE_APP_INFO_MONITOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APP_INFO_MONITOR(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APP_INFO_MONITOR(inst : longint) : longint;

type

function g_app_info_monitor_get_type:TGType;cdecl;external;
function g_app_info_monitor_get:PGAppInfoMonitor;cdecl;external;
{$endif}
{ __G_APP_INFO_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_APP_INFO : longint; { return type might be wrong }
  begin
    G_TYPE_APP_INFO:=g_app_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APP_INFO(obj : longint) : longint;
begin
  G_APP_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_APP_INFO,GAppInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APP_INFO(obj : longint) : longint;
begin
  G_IS_APP_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_APP_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APP_INFO_GET_IFACE(obj : longint) : longint;
begin
  G_APP_INFO_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_APP_INFO,GAppInfoIface);
end;

{ was #define dname def_expr }
function G_TYPE_APP_LAUNCH_CONTEXT : longint; { return type might be wrong }
  begin
    G_TYPE_APP_LAUNCH_CONTEXT:=g_app_launch_context_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APP_LAUNCH_CONTEXT(o : longint) : longint;
begin
  G_APP_LAUNCH_CONTEXT:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_APP_LAUNCH_CONTEXT,GAppLaunchContext);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APP_LAUNCH_CONTEXT_CLASS(k : longint) : longint;
begin
  G_APP_LAUNCH_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_APP_LAUNCH_CONTEXT,GAppLaunchContextClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APP_LAUNCH_CONTEXT(o : longint) : longint;
begin
  G_IS_APP_LAUNCH_CONTEXT:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_APP_LAUNCH_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APP_LAUNCH_CONTEXT_CLASS(k : longint) : longint;
begin
  G_IS_APP_LAUNCH_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_APP_LAUNCH_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APP_LAUNCH_CONTEXT_GET_CLASS(o : longint) : longint;
begin
  G_APP_LAUNCH_CONTEXT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_APP_LAUNCH_CONTEXT,GAppLaunchContextClass);
end;

{ was #define dname def_expr }
function G_TYPE_APP_INFO_MONITOR : longint; { return type might be wrong }
  begin
    G_TYPE_APP_INFO_MONITOR:=g_app_info_monitor_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APP_INFO_MONITOR(inst : longint) : longint;
begin
  G_APP_INFO_MONITOR:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_APP_INFO_MONITOR,GAppInfoMonitor);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APP_INFO_MONITOR(inst : longint) : longint;
begin
  G_IS_APP_INFO_MONITOR:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_APP_INFO_MONITOR);
end;


end.
