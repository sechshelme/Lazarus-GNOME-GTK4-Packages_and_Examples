
unit gunixmounts;
interface

{
  Automatically converted by H2Pas 1.0.0 from gunixmounts.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gunixmounts.h
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
PGIcon  = ^GIcon;
PGList  = ^GList;
Pguint64  = ^guint64;
PGUnixMountEntry  = ^GUnixMountEntry;
PGUnixMountMonitor  = ^GUnixMountMonitor;
PGUnixMountPoint  = ^GUnixMountPoint;
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
{$ifndef __G_UNIX_MOUNTS_H__}
{$define __G_UNIX_MOUNTS_H__}
{$include <gio/gio.h>}

{ was #define dname def_expr }
function G_TYPE_UNIX_MOUNT_MONITOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_MOUNT_MONITOR(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_MOUNT_MONITOR_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_MOUNT_MONITOR(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_MOUNT_MONITOR_CLASS(k : longint) : longint;

{*
 * GUnixMountEntry:
 *
 * Defines a Unix mount entry (e.g. <filename>/media/cdrom</filename>).
 * This corresponds roughly to a mtab entry.
 * }
type

{ was #define dname def_expr }
function G_TYPE_UNIX_MOUNT_ENTRY : longint; { return type might be wrong }

function g_unix_mount_entry_get_type:TGType;cdecl;external;
{*
 * GUnixMountPoint:
 *
 * Defines a Unix mount point (e.g. <filename>/dev</filename>).
 * This corresponds roughly to a fstab entry.
 * }
type

{ was #define dname def_expr }
function G_TYPE_UNIX_MOUNT_POINT : longint; { return type might be wrong }

function g_unix_mount_point_get_type:TGType;cdecl;external;
{*
 * GUnixMountMonitor:
 *
 * Watches #GUnixMounts for changes.
 * }
type

procedure g_unix_mount_free(mount_entry:PGUnixMountEntry);cdecl;external;
function g_unix_mount_copy(mount_entry:PGUnixMountEntry):PGUnixMountEntry;cdecl;external;
procedure g_unix_mount_point_free(mount_point:PGUnixMountPoint);cdecl;external;
function g_unix_mount_point_copy(mount_point:PGUnixMountPoint):PGUnixMountPoint;cdecl;external;
function g_unix_mount_compare(mount1:PGUnixMountEntry; mount2:PGUnixMountEntry):Tgint;cdecl;external;
(* Const before type ignored *)
function g_unix_mount_get_mount_path(mount_entry:PGUnixMountEntry):Pchar;cdecl;external;
(* Const before type ignored *)
function g_unix_mount_get_device_path(mount_entry:PGUnixMountEntry):Pchar;cdecl;external;
(* Const before type ignored *)
function g_unix_mount_get_root_path(mount_entry:PGUnixMountEntry):Pchar;cdecl;external;
(* Const before type ignored *)
function g_unix_mount_get_fs_type(mount_entry:PGUnixMountEntry):Pchar;cdecl;external;
(* Const before type ignored *)
function g_unix_mount_get_options(mount_entry:PGUnixMountEntry):Pchar;cdecl;external;
function g_unix_mount_is_readonly(mount_entry:PGUnixMountEntry):Tgboolean;cdecl;external;
function g_unix_mount_is_system_internal(mount_entry:PGUnixMountEntry):Tgboolean;cdecl;external;
function g_unix_mount_guess_can_eject(mount_entry:PGUnixMountEntry):Tgboolean;cdecl;external;
function g_unix_mount_guess_should_display(mount_entry:PGUnixMountEntry):Tgboolean;cdecl;external;
function g_unix_mount_guess_name(mount_entry:PGUnixMountEntry):Pchar;cdecl;external;
function g_unix_mount_guess_icon(mount_entry:PGUnixMountEntry):PGIcon;cdecl;external;
function g_unix_mount_guess_symbolic_icon(mount_entry:PGUnixMountEntry):PGIcon;cdecl;external;
function g_unix_mount_point_compare(mount1:PGUnixMountPoint; mount2:PGUnixMountPoint):Tgint;cdecl;external;
(* Const before type ignored *)
function g_unix_mount_point_get_mount_path(mount_point:PGUnixMountPoint):Pchar;cdecl;external;
(* Const before type ignored *)
function g_unix_mount_point_get_device_path(mount_point:PGUnixMountPoint):Pchar;cdecl;external;
(* Const before type ignored *)
function g_unix_mount_point_get_fs_type(mount_point:PGUnixMountPoint):Pchar;cdecl;external;
(* Const before type ignored *)
function g_unix_mount_point_get_options(mount_point:PGUnixMountPoint):Pchar;cdecl;external;
function g_unix_mount_point_is_readonly(mount_point:PGUnixMountPoint):Tgboolean;cdecl;external;
function g_unix_mount_point_is_user_mountable(mount_point:PGUnixMountPoint):Tgboolean;cdecl;external;
function g_unix_mount_point_is_loopback(mount_point:PGUnixMountPoint):Tgboolean;cdecl;external;
function g_unix_mount_point_guess_can_eject(mount_point:PGUnixMountPoint):Tgboolean;cdecl;external;
function g_unix_mount_point_guess_name(mount_point:PGUnixMountPoint):Pchar;cdecl;external;
function g_unix_mount_point_guess_icon(mount_point:PGUnixMountPoint):PGIcon;cdecl;external;
function g_unix_mount_point_guess_symbolic_icon(mount_point:PGUnixMountPoint):PGIcon;cdecl;external;
function g_unix_mount_points_get(time_read:Pguint64):PGList;cdecl;external;
(* Const before type ignored *)
function g_unix_mount_point_at(mount_path:Pchar; time_read:Pguint64):PGUnixMountPoint;cdecl;external;
function g_unix_mounts_get(time_read:Pguint64):PGList;cdecl;external;
(* Const before type ignored *)
function g_unix_mount_at(mount_path:Pchar; time_read:Pguint64):PGUnixMountEntry;cdecl;external;
(* Const before type ignored *)
function g_unix_mount_for(file_path:Pchar; time_read:Pguint64):PGUnixMountEntry;cdecl;external;
function g_unix_mounts_changed_since(time:Tguint64):Tgboolean;cdecl;external;
function g_unix_mount_points_changed_since(time:Tguint64):Tgboolean;cdecl;external;
function g_unix_mount_monitor_get_type:TGType;cdecl;external;
function g_unix_mount_monitor_get:PGUnixMountMonitor;cdecl;external;
function g_unix_mount_monitor_new:PGUnixMountMonitor;cdecl;external;
procedure g_unix_mount_monitor_set_rate_limit(mount_monitor:PGUnixMountMonitor; limit_msec:longint);cdecl;external;
(* Const before type ignored *)
function g_unix_is_mount_path_system_internal(mount_path:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_unix_is_system_fs_type(fs_type:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_unix_is_system_device_path(device_path:Pchar):Tgboolean;cdecl;external;
{$endif}
{ __G_UNIX_MOUNTS_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_UNIX_MOUNT_MONITOR : longint; { return type might be wrong }
  begin
    G_TYPE_UNIX_MOUNT_MONITOR:=g_unix_mount_monitor_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_MOUNT_MONITOR(o : longint) : longint;
begin
  G_UNIX_MOUNT_MONITOR:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_UNIX_MOUNT_MONITOR,GUnixMountMonitor);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_MOUNT_MONITOR_CLASS(k : longint) : longint;
begin
  G_UNIX_MOUNT_MONITOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_UNIX_MOUNT_MONITOR,GUnixMountMonitorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_MOUNT_MONITOR(o : longint) : longint;
begin
  G_IS_UNIX_MOUNT_MONITOR:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_UNIX_MOUNT_MONITOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_MOUNT_MONITOR_CLASS(k : longint) : longint;
begin
  G_IS_UNIX_MOUNT_MONITOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_UNIX_MOUNT_MONITOR);
end;

{ was #define dname def_expr }
function G_TYPE_UNIX_MOUNT_ENTRY : longint; { return type might be wrong }
  begin
    G_TYPE_UNIX_MOUNT_ENTRY:=g_unix_mount_entry_get_type;
  end;

{ was #define dname def_expr }
function G_TYPE_UNIX_MOUNT_POINT : longint; { return type might be wrong }
  begin
    G_TYPE_UNIX_MOUNT_POINT:=g_unix_mount_point_get_type;
  end;


end.
