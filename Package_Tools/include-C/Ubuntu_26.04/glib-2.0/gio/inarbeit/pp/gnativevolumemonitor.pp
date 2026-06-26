
unit gnativevolumemonitor;
interface

{
  Automatically converted by H2Pas 1.0.0 from gnativevolumemonitor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gnativevolumemonitor.h
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
PGCancellable  = ^GCancellable;
PGMount  = ^GMount;
PGNativeVolumeMonitor  = ^GNativeVolumeMonitor;
PGNativeVolumeMonitorClass  = ^GNativeVolumeMonitorClass;
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

{ was #define dname def_expr }
function G_TYPE_NATIVE_VOLUME_MONITOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NATIVE_VOLUME_MONITOR(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NATIVE_VOLUME_MONITOR_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_NATIVE_VOLUME_MONITOR(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_NATIVE_VOLUME_MONITOR_CLASS(k : longint) : longint;

const
  G_NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME = 'gio-native-volume-monitor';  
type
  PGNativeVolumeMonitor = ^TGNativeVolumeMonitor;
  TGNativeVolumeMonitor = record
      parent_instance : TGVolumeMonitor;
    end;

(* Const before type ignored *)
  PGNativeVolumeMonitorClass = ^TGNativeVolumeMonitorClass;
  TGNativeVolumeMonitorClass = record
      parent_class : TGVolumeMonitorClass;
      get_mount_for_mount_path : function (mount_path:Pchar; cancellable:PGCancellable):PGMount;cdecl;
    end;


function g_native_volume_monitor_get_type:TGType;cdecl;external;
{$endif}
{ __G_NATIVE_VOLUME_MONITOR_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_NATIVE_VOLUME_MONITOR : longint; { return type might be wrong }
  begin
    G_TYPE_NATIVE_VOLUME_MONITOR:=g_native_volume_monitor_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NATIVE_VOLUME_MONITOR(o : longint) : longint;
begin
  G_NATIVE_VOLUME_MONITOR:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_NATIVE_VOLUME_MONITOR,GNativeVolumeMonitor);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NATIVE_VOLUME_MONITOR_CLASS(k : longint) : longint;
begin
  G_NATIVE_VOLUME_MONITOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_NATIVE_VOLUME_MONITOR,GNativeVolumeMonitorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_NATIVE_VOLUME_MONITOR(o : longint) : longint;
begin
  G_IS_NATIVE_VOLUME_MONITOR:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_NATIVE_VOLUME_MONITOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_NATIVE_VOLUME_MONITOR_CLASS(k : longint) : longint;
begin
  G_IS_NATIVE_VOLUME_MONITOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_NATIVE_VOLUME_MONITOR);
end;


end.
