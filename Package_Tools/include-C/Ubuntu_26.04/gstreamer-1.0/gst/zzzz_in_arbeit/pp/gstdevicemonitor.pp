
unit gstdevicemonitor;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstdevicemonitor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstdevicemonitor.h
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
Pgchar  = ^gchar;
PGList  = ^GList;
PGstBus  = ^GstBus;
PGstCaps  = ^GstCaps;
PGstDeviceMonitor  = ^GstDeviceMonitor;
PGstDeviceMonitorClass  = ^GstDeviceMonitorClass;
PGstDeviceMonitorPrivate  = ^GstDeviceMonitorPrivate;
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

{ was #define dname def_expr }
function GST_TYPE_DEVICE_MONITOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE_MONITOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE_MONITOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_MONITOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_MONITOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_MONITOR_CLASS(klass : longint) : longint;

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


function gst_device_monitor_get_type:TGType;cdecl;external;
function gst_device_monitor_new:PGstDeviceMonitor;cdecl;external;
function gst_device_monitor_get_bus(monitor:PGstDeviceMonitor):PGstBus;cdecl;external;
function gst_device_monitor_get_devices(monitor:PGstDeviceMonitor):PGList;cdecl;external;
function gst_device_monitor_start(monitor:PGstDeviceMonitor):Tgboolean;cdecl;external;
procedure gst_device_monitor_stop(monitor:PGstDeviceMonitor);cdecl;external;
(* Const before type ignored *)
function gst_device_monitor_add_filter(monitor:PGstDeviceMonitor; classes:Pgchar; caps:PGstCaps):Tguint;cdecl;external;
function gst_device_monitor_remove_filter(monitor:PGstDeviceMonitor; filter_id:Tguint):Tgboolean;cdecl;external;
function gst_device_monitor_get_providers(monitor:PGstDeviceMonitor):^Pgchar;cdecl;external;
procedure gst_device_monitor_set_show_all_devices(monitor:PGstDeviceMonitor; show_all:Tgboolean);cdecl;external;
function gst_device_monitor_get_show_all_devices(monitor:PGstDeviceMonitor):Tgboolean;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstDeviceMonitor, gst_object_unref) }
{$endif}
{ __GST_DEVICE_MONITOR_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_DEVICE_MONITOR : longint; { return type might be wrong }
  begin
    GST_TYPE_DEVICE_MONITOR:=gst_device_monitor_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE_MONITOR(obj : longint) : longint;
begin
  GST_IS_DEVICE_MONITOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_DEVICE_MONITOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE_MONITOR_CLASS(klass : longint) : longint;
begin
  GST_IS_DEVICE_MONITOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_DEVICE_MONITOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_MONITOR_GET_CLASS(obj : longint) : longint;
begin
  GST_DEVICE_MONITOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_DEVICE_MONITOR,GstDeviceMonitorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_MONITOR(obj : longint) : longint;
begin
  GST_DEVICE_MONITOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_DEVICE_MONITOR,GstDeviceMonitor);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_MONITOR_CLASS(klass : longint) : longint;
begin
  GST_DEVICE_MONITOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_DEVICE_MONITOR,GstDeviceMonitorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_DEVICE_MONITOR_CAST(obj : longint) : PGstDeviceMonitor;
begin
  GST_DEVICE_MONITOR_CAST:=PGstDeviceMonitor(obj);
end;


end.
