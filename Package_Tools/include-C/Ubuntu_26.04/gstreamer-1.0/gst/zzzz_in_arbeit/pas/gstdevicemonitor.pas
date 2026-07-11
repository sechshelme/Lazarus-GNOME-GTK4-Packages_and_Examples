unit gstdevicemonitor;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2013 Olivier Crete <olivier.crete@collabora.com>
 *
 * gstdevicemonitor.c: Device monitor
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __GST_DEVICE_MONITOR_H__}
{$define __GST_DEVICE_MONITOR_H__}
{$include <gst/gstobject.h>}
{$include <gst/gstdevice.h>}
{$include <gst/gstdeviceprovider.h>}
{$include <gst/gstdeviceproviderfactory.h>}
type

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_DEVICE_MONITOR_CAST(obj : longint) : PGstDeviceMonitor;

{*
 * GstDeviceMonitor:
 * @parent: the parent #GstObject structure
 *
 * Opaque device monitor object structure.
 *
 * Since: 1.4
  }
{< private > }
type
  PGstDeviceMonitor = ^TGstDeviceMonitor;
  TGstDeviceMonitor = record
      parent : TGstObject;
      priv : PGstDeviceMonitorPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstDeviceMonitorClass:
 * @parent_class: the parent #GstObjectClass structure
 *
 * Opaque device monitor class structure.
 *
 * Since: 1.4
  }
{< private > }
  PGstDeviceMonitorClass = ^TGstDeviceMonitorClass;
  TGstDeviceMonitorClass = record
      parent_class : TGstObjectClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_device_monitor_get_type:TGType;cdecl;external libgstreamer;
function gst_device_monitor_new:PGstDeviceMonitor;cdecl;external libgstreamer;
function gst_device_monitor_get_bus(monitor:PGstDeviceMonitor):PGstBus;cdecl;external libgstreamer;
function gst_device_monitor_get_devices(monitor:PGstDeviceMonitor):PGList;cdecl;external libgstreamer;
function gst_device_monitor_start(monitor:PGstDeviceMonitor):Tgboolean;cdecl;external libgstreamer;
procedure gst_device_monitor_stop(monitor:PGstDeviceMonitor);cdecl;external libgstreamer;
function gst_device_monitor_add_filter(monitor:PGstDeviceMonitor; classes:Pgchar; caps:PGstCaps):Tguint;cdecl;external libgstreamer;
function gst_device_monitor_remove_filter(monitor:PGstDeviceMonitor; filter_id:Tguint):Tgboolean;cdecl;external libgstreamer;
function gst_device_monitor_get_providers(monitor:PGstDeviceMonitor):^Pgchar;cdecl;external libgstreamer;
procedure gst_device_monitor_set_show_all_devices(monitor:PGstDeviceMonitor; show_all:Tgboolean);cdecl;external libgstreamer;
function gst_device_monitor_get_show_all_devices(monitor:PGstDeviceMonitor):Tgboolean;cdecl;external libgstreamer;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstDeviceMonitor, gst_object_unref) }
{$endif}
{ __GST_DEVICE_MONITOR_H__  }

// === Konventiert am: 11-7-26 11:00:19 ===

function GST_TYPE_DEVICE_MONITOR : TGType;
function GST_IS_DEVICE_MONITOR(obj : Pointer) : P;;
function GST_IS_DEVICE_MONITOR_CLASS(klass : Pointer) : P;;
function GST_DEVICE_MONITOR_GET_CLASS(obj : Pointer) : Tgboolean;
function GST_DEVICE_MONITOR(obj : Tgboolean) : longint;
function GST_DEVICE_MONITOR_CLASS(klass : P;) : longint;

implementation

function GST_TYPE_DEVICE_MONITOR : TGType;
  begin
    GST_TYPE_DEVICE_MONITOR:=gst_device_monitor_get_type;
  end;

function GST_IS_DEVICE_MONITOR(obj : Pointer) : P;;
begin
  Result := P;(g_type_check_instance_cast(obj, GST_TYPE_DEVICE_MONITOR));
end;

function GST_IS_DEVICE_MONITOR_CLASS(klass : Pointer) : P;;
begin
  Result := P;(g_type_check_class_cast(klass, GST_TYPE_DEVICE_MONITOR));
end;

function GST_DEVICE_MONITOR_GET_CLASS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_DEVICE_MONITOR);
end;

function GST_DEVICE_MONITOR(obj : Tgboolean) : longint;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_DEVICE_MONITOR);
end;

function GST_DEVICE_MONITOR_CLASS(klass : P;) : longint;
begin
  Result := P;(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_DEVICE_MONITOR_CAST(obj : longint) : PGstDeviceMonitor;
begin
  GST_DEVICE_MONITOR_CAST:=PGstDeviceMonitor(obj);
end;


end.
