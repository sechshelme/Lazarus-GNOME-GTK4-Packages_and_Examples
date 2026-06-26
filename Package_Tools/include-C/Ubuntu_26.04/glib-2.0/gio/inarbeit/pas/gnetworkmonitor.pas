unit gnetworkmonitor;

interface

uses
  fp_glib2;

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

type
  PGNetworkMonitorInterface = ^TGNetworkMonitorInterface;
  TGNetworkMonitorInterface = record
      g_iface : TGTypeInterface;
      network_changed : procedure (monitor:PGNetworkMonitor; network_available:Tgboolean);cdecl;
      can_reach : function (monitor:PGNetworkMonitor; connectable:PGSocketConnectable; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      can_reach_async : procedure (monitor:PGNetworkMonitor; connectable:PGSocketConnectable; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      can_reach_finish : function (monitor:PGNetworkMonitor; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
    end;


function g_network_monitor_get_type:TGType;cdecl;external libgio2;
function g_network_monitor_get_default:PGNetworkMonitor;cdecl;external libgio2;
function g_network_monitor_get_network_available(monitor:PGNetworkMonitor):Tgboolean;cdecl;external libgio2;
function g_network_monitor_get_network_metered(monitor:PGNetworkMonitor):Tgboolean;cdecl;external libgio2;
function g_network_monitor_get_connectivity(monitor:PGNetworkMonitor):TGNetworkConnectivity;cdecl;external libgio2;
function g_network_monitor_can_reach(monitor:PGNetworkMonitor; connectable:PGSocketConnectable; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
procedure g_network_monitor_can_reach_async(monitor:PGNetworkMonitor; connectable:PGSocketConnectable; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_network_monitor_can_reach_finish(monitor:PGNetworkMonitor; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_NETWORK_MONITOR_H__  }

// === Konventiert am: 26-6-26 19:43:34 ===

function G_TYPE_NETWORK_MONITOR : TGType;
function G_NETWORK_MONITOR(obj : Pointer) : PGNetworkMonitor;
function G_IS_NETWORK_MONITOR(obj : Pointer) : Tgboolean;
function G_NETWORK_MONITOR_GET_INTERFACE(obj : Pointer) : PGNetworkMonitorInterface;

implementation

function G_TYPE_NETWORK_MONITOR : TGType;
  begin
    G_TYPE_NETWORK_MONITOR:=g_network_monitor_get_type;
  end;

function G_NETWORK_MONITOR(obj : Pointer) : PGNetworkMonitor;
begin
  Result := PGNetworkMonitor(g_type_check_instance_cast(obj, G_TYPE_NETWORK_MONITOR));
end;

function G_IS_NETWORK_MONITOR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_NETWORK_MONITOR);
end;

function G_NETWORK_MONITOR_GET_INTERFACE(obj : Pointer) : PGNetworkMonitorInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_NETWORK_MONITOR);
end;



end.
