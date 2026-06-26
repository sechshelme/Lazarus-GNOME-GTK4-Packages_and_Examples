unit gnativevolumemonitor;

interface

uses
  fp_glib2;

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
{$ifndef __G_NATIVE_VOLUME_MONITOR_H__}
{$define __G_NATIVE_VOLUME_MONITOR_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gvolumemonitor.h>}

const
  G_NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME = 'gio-native-volume-monitor';  
type
  PGNativeVolumeMonitor = ^TGNativeVolumeMonitor;
  TGNativeVolumeMonitor = record
      parent_instance : TGVolumeMonitor;
    end;

  PGNativeVolumeMonitorClass = ^TGNativeVolumeMonitorClass;
  TGNativeVolumeMonitorClass = record
      parent_class : TGVolumeMonitorClass;
      get_mount_for_mount_path : function (mount_path:Pchar; cancellable:PGCancellable):PGMount;cdecl;
    end;


function g_native_volume_monitor_get_type:TGType;cdecl;external libgio2;
{$endif}
{ __G_NATIVE_VOLUME_MONITOR_H__  }

// === Konventiert am: 26-6-26 19:44:21 ===

function G_TYPE_NATIVE_VOLUME_MONITOR : TGType;
function G_NATIVE_VOLUME_MONITOR(obj : Pointer) : PGNativeVolumeMonitor;
function G_NATIVE_VOLUME_MONITOR_CLASS(klass : Pointer) : PGNativeVolumeMonitorClass;
function G_IS_NATIVE_VOLUME_MONITOR(obj : Pointer) : Tgboolean;
function G_IS_NATIVE_VOLUME_MONITOR_CLASS(klass : Pointer) : Tgboolean;

implementation

function G_TYPE_NATIVE_VOLUME_MONITOR : TGType;
  begin
    G_TYPE_NATIVE_VOLUME_MONITOR:=g_native_volume_monitor_get_type;
  end;

function G_NATIVE_VOLUME_MONITOR(obj : Pointer) : PGNativeVolumeMonitor;
begin
  Result := PGNativeVolumeMonitor(g_type_check_instance_cast(obj, G_TYPE_NATIVE_VOLUME_MONITOR));
end;

function G_NATIVE_VOLUME_MONITOR_CLASS(klass : Pointer) : PGNativeVolumeMonitorClass;
begin
  Result := PGNativeVolumeMonitorClass(g_type_check_class_cast(klass, G_TYPE_NATIVE_VOLUME_MONITOR));
end;

function G_IS_NATIVE_VOLUME_MONITOR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_NATIVE_VOLUME_MONITOR);
end;

function G_IS_NATIVE_VOLUME_MONITOR_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_NATIVE_VOLUME_MONITOR);
end;



end.
