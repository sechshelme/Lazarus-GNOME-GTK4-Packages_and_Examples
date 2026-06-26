unit gvolumemonitor;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
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
 *         David Zeuthen <davidz@redhat.com>
  }
{$ifndef __G_VOLUME_MONITOR_H__}
{$define __G_VOLUME_MONITOR_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{*
 * G_VOLUME_MONITOR_EXTENSION_POINT_NAME:
 *
 * Extension point for volume monitor functionality.
 * See [Extending GIO](overview.html#extending-gio).
  }
const
  G_VOLUME_MONITOR_EXTENSION_POINT_NAME = 'gio-volume-monitor';  
type
{< private > }
  PGVolumeMonitor = ^TGVolumeMonitor;
  TGVolumeMonitor = record
      parent_instance : TGObject;
      priv : Tgpointer;
    end;

{< public > }
{ signals  }
{ Vtable  }
{ These arguments are unfortunately backwards by mistake (bug #520169). Deprecated in 2.20.  }
{ signal added in 2.17  }
{ signal added in 2.21  }
{< private > }
{ Padding for future expansion  }
  PGVolumeMonitorClass = ^TGVolumeMonitorClass;
  TGVolumeMonitorClass = record
      parent_class : TGObjectClass;
      volume_added : procedure (volume_monitor:PGVolumeMonitor; volume:PGVolume);cdecl;
      volume_removed : procedure (volume_monitor:PGVolumeMonitor; volume:PGVolume);cdecl;
      volume_changed : procedure (volume_monitor:PGVolumeMonitor; volume:PGVolume);cdecl;
      mount_added : procedure (volume_monitor:PGVolumeMonitor; mount:PGMount);cdecl;
      mount_removed : procedure (volume_monitor:PGVolumeMonitor; mount:PGMount);cdecl;
      mount_pre_unmount : procedure (volume_monitor:PGVolumeMonitor; mount:PGMount);cdecl;
      mount_changed : procedure (volume_monitor:PGVolumeMonitor; mount:PGMount);cdecl;
      drive_connected : procedure (volume_monitor:PGVolumeMonitor; drive:PGDrive);cdecl;
      drive_disconnected : procedure (volume_monitor:PGVolumeMonitor; drive:PGDrive);cdecl;
      drive_changed : procedure (volume_monitor:PGVolumeMonitor; drive:PGDrive);cdecl;
      is_supported : function :Tgboolean;cdecl;
      get_connected_drives : function (volume_monitor:PGVolumeMonitor):PGList;cdecl;
      get_volumes : function (volume_monitor:PGVolumeMonitor):PGList;cdecl;
      get_mounts : function (volume_monitor:PGVolumeMonitor):PGList;cdecl;
      get_volume_for_uuid : function (volume_monitor:PGVolumeMonitor; uuid:Pchar):PGVolume;cdecl;
      get_mount_for_uuid : function (volume_monitor:PGVolumeMonitor; uuid:Pchar):PGMount;cdecl;
      adopt_orphan_mount : function (mount:PGMount; volume_monitor:PGVolumeMonitor):PGVolume;cdecl;
      drive_eject_button : procedure (volume_monitor:PGVolumeMonitor; drive:PGDrive);cdecl;
      drive_stop_button : procedure (volume_monitor:PGVolumeMonitor; drive:PGDrive);cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
      _g_reserved6 : procedure ;cdecl;
    end;


function g_volume_monitor_get_type:TGType;cdecl;external libgio2;
function g_volume_monitor_get:PGVolumeMonitor;cdecl;external libgio2;
function g_volume_monitor_get_connected_drives(volume_monitor:PGVolumeMonitor):PGList;cdecl;external libgio2;
function g_volume_monitor_get_volumes(volume_monitor:PGVolumeMonitor):PGList;cdecl;external libgio2;
function g_volume_monitor_get_mounts(volume_monitor:PGVolumeMonitor):PGList;cdecl;external libgio2;
function g_volume_monitor_get_volume_for_uuid(volume_monitor:PGVolumeMonitor; uuid:Pchar):PGVolume;cdecl;external libgio2;
function g_volume_monitor_get_mount_for_uuid(volume_monitor:PGVolumeMonitor; uuid:Pchar):PGMount;cdecl;external libgio2;
{xxxxxxxxGIO_DEPRECATED }
function g_volume_monitor_adopt_orphan_mount(mount:PGMount):PGVolume;cdecl;external libgio2;
{$endif}
{ __G_VOLUME_MONITOR_H__  }

// === Konventiert am: 26-6-26 20:07:42 ===

function G_TYPE_VOLUME_MONITOR : TGType;
function G_VOLUME_MONITOR(obj : Pointer) : PGVolumeMonitor;
function G_VOLUME_MONITOR_CLASS(klass : Pointer) : PGVolumeMonitorClass;
function G_VOLUME_MONITOR_GET_CLASS(obj : Pointer) : Tgboolean;
function G_IS_VOLUME_MONITOR(obj : Tgboolean) : longint;
function G_IS_VOLUME_MONITOR_CLASS(klass : PGVolumeMonitorClass) : longint;

implementation

function G_TYPE_VOLUME_MONITOR : TGType;
  begin
    G_TYPE_VOLUME_MONITOR:=g_volume_monitor_get_type;
  end;

function G_VOLUME_MONITOR(obj : Pointer) : PGVolumeMonitor;
begin
  Result := PGVolumeMonitor(g_type_check_instance_cast(obj, G_TYPE_VOLUME_MONITOR));
end;

function G_VOLUME_MONITOR_CLASS(klass : Pointer) : PGVolumeMonitorClass;
begin
  Result := PGVolumeMonitorClass(g_type_check_class_cast(klass, G_TYPE_VOLUME_MONITOR));
end;

function G_VOLUME_MONITOR_GET_CLASS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_VOLUME_MONITOR);
end;

function G_IS_VOLUME_MONITOR(obj : Tgboolean) : longint;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_VOLUME_MONITOR);
end;

function G_IS_VOLUME_MONITOR_CLASS(klass : PGVolumeMonitorClass) : longint;
begin
  Result := PGVolumeMonitorClass(PGTypeInstance(obj)^.g_class);
end;



end.
