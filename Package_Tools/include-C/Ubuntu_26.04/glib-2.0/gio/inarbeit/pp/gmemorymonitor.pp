
unit gmemorymonitor;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmemorymonitor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmemorymonitor.h
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
PGMemoryMonitor  = ^GMemoryMonitor;
PGMemoryMonitorInterface  = ^GMemoryMonitorInterface;
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

{ was #define dname def_expr }
function G_TYPE_MEMORY_MONITOR : longint; { return type might be wrong }

{G_DECLARE_INTERFACE(GMemoryMonitor, g_memory_monitor, g, memory_monitor, GObject) }
{< private > }
{< public > }
type
  PGMemoryMonitorInterface = ^TGMemoryMonitorInterface;
  TGMemoryMonitorInterface = record
      g_iface : TGTypeInterface;
      low_memory_warning : procedure (monitor:PGMemoryMonitor; level:TGMemoryMonitorWarningLevel);cdecl;
    end;


function g_memory_monitor_dup_default:PGMemoryMonitor;cdecl;external;
{$endif}
{ __G_MEMORY_MONITOR_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_MEMORY_MONITOR : longint; { return type might be wrong }
  begin
    G_TYPE_MEMORY_MONITOR:=g_memory_monitor_get_type;
  end;


end.
