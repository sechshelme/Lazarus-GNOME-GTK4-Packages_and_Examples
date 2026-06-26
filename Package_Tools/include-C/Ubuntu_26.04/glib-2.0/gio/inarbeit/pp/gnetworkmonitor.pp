
unit gnetworkmonitor;
interface

{
  Automatically converted by H2Pas 1.0.0 from gnetworkmonitor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gnetworkmonitor.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGNetworkMonitor  = ^GNetworkMonitor;
PGNetworkMonitorInterface  = ^GNetworkMonitorInterface;
PGSocketConnectable  = ^GSocketConnectable;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright 2011 Red Hat, Inc.
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
  }
{$ifndef __G_NETWORK_MONITOR_H__}
{$define __G_NETWORK_MONITOR_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{*
 * G_NETWORK_MONITOR_EXTENSION_POINT_NAME:
 *
 * Extension point for network status monitoring functionality.
 * See [Extending GIO](overview.html#extending-gio).
 *
 * Since: 2.30
  }

const
  G_NETWORK_MONITOR_EXTENSION_POINT_NAME = 'gio-network-monitor';  

{ was #define dname def_expr }
function G_TYPE_NETWORK_MONITOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NETWORK_MONITOR(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_NETWORK_MONITOR(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NETWORK_MONITOR_GET_INTERFACE(o : longint) : longint;

type
  PGNetworkMonitorInterface = ^TGNetworkMonitorInterface;
  TGNetworkMonitorInterface = record
      g_iface : TGTypeInterface;
      network_changed : procedure (monitor:PGNetworkMonitor; network_available:Tgboolean);cdecl;
      can_reach : function (monitor:PGNetworkMonitor; connectable:PGSocketConnectable; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      can_reach_async : procedure (monitor:PGNetworkMonitor; connectable:PGSocketConnectable; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      can_reach_finish : function (monitor:PGNetworkMonitor; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
    end;


function g_network_monitor_get_type:TGType;cdecl;external;
function g_network_monitor_get_default:PGNetworkMonitor;cdecl;external;
function g_network_monitor_get_network_available(monitor:PGNetworkMonitor):Tgboolean;cdecl;external;
function g_network_monitor_get_network_metered(monitor:PGNetworkMonitor):Tgboolean;cdecl;external;
function g_network_monitor_get_connectivity(monitor:PGNetworkMonitor):TGNetworkConnectivity;cdecl;external;
function g_network_monitor_can_reach(monitor:PGNetworkMonitor; connectable:PGSocketConnectable; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_network_monitor_can_reach_async(monitor:PGNetworkMonitor; connectable:PGSocketConnectable; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_network_monitor_can_reach_finish(monitor:PGNetworkMonitor; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __G_NETWORK_MONITOR_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_NETWORK_MONITOR : longint; { return type might be wrong }
  begin
    G_TYPE_NETWORK_MONITOR:=g_network_monitor_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NETWORK_MONITOR(o : longint) : longint;
begin
  G_NETWORK_MONITOR:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_NETWORK_MONITOR,GNetworkMonitor);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_NETWORK_MONITOR(o : longint) : longint;
begin
  G_IS_NETWORK_MONITOR:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_NETWORK_MONITOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NETWORK_MONITOR_GET_INTERFACE(o : longint) : longint;
begin
  G_NETWORK_MONITOR_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(o,G_TYPE_NETWORK_MONITOR,GNetworkMonitorInterface);
end;


end.
