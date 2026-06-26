unit gmemorymonitor;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright 2019 Red Hat, Inc.
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
{$ifndef __G_MEMORY_MONITOR_H__}
{$define __G_MEMORY_MONITOR_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{*
 * G_MEMORY_MONITOR_EXTENSION_POINT_NAME:
 *
 * Extension point for memory usage monitoring functionality.
 * See [Extending GIO](overview.html#extending-gio).
 *
 * Since: 2.64
  }

const
  G_MEMORY_MONITOR_EXTENSION_POINT_NAME = 'gio-memory-monitor';  

{G_DECLARE_INTERFACE(GMemoryMonitor, g_memory_monitor, g, memory_monitor, GObject) }
{< private > }
{< public > }
type
  PGMemoryMonitorInterface = ^TGMemoryMonitorInterface;
  TGMemoryMonitorInterface = record
      g_iface : TGTypeInterface;
      low_memory_warning : procedure (monitor:PGMemoryMonitor; level:TGMemoryMonitorWarningLevel);cdecl;
    end;


function g_memory_monitor_dup_default:PGMemoryMonitor;cdecl;external libgio2;
{$endif}
{ __G_MEMORY_MONITOR_H__  }

// === Konventiert am: 26-6-26 19:39:31 ===

function g_TYPE_memory_monitor: TGType;
function g_memory_monitor(obj: Pointer): PGMemoryMonitor;
function g_IS_memory_monitor(obj: Pointer): Tgboolean;
function g_memory_monitor_GET_IFACE(obj: Pointer): PGMemoryMonitorInterface;

implementation

function g_TYPE_memory_monitor: TGType;
begin
  Result := g_memory_monitor_get_type;
end;

function g_memory_monitor(obj: Pointer): PGMemoryMonitor;
begin
  Result := PGMemoryMonitor(g_type_check_instance_cast(obj, g_TYPE_memory_monitor));
end;

function g_IS_memory_monitor(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, g_TYPE_memory_monitor);
end;

function g_memory_monitor_GET_IFACE(obj: Pointer): PGMemoryMonitorInterface;
begin
  Result := g_type_interface_peek(obj, g_TYPE_memory_monitor);
end;

type 
  TGMemoryMonitor = record
  end;
  PGMemoryMonitor = ^TGMemoryMonitor;

  TGMemoryMonitorInterface = record
  end;
  PGMemoryMonitorInterface = ^TGMemoryMonitorInterface;

function g_memory_monitor_get_type: TGType; cdecl; external libgxxxxxxx;



end.
