
unit gmount;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmount.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmount.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGDrive  = ^GDrive;
PGError  = ^GError;
PGFile  = ^GFile;
PGIcon  = ^GIcon;
PGMount  = ^GMount;
PGMountIface  = ^GMountIface;
PGMountOperation  = ^GMountOperation;
PGVolume  = ^GVolume;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2008 Red Hat, Inc.
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
{$ifndef __G_MOUNT_H__}
{$define __G_MOUNT_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_MOUNT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MOUNT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MOUNT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MOUNT_GET_IFACE(obj : longint) : longint;

type
{*
 * GMountIface:
 * @g_iface: The parent interface.
 * @changed: Changed signal that is emitted when the mount's state has changed.
 * @unmounted: The unmounted signal that is emitted when the #GMount have been unmounted. If the recipient is holding references to the object they should release them so the object can be finalized.
 * @pre_unmount: The ::pre-unmount signal that is emitted when the #GMount will soon be emitted. If the recipient is somehow holding the mount open by keeping an open file on it it should close the file.
 * @get_root: Gets a #GFile to the root directory of the #GMount.
 * @get_name: Gets a string containing the name of the #GMount.
 * @get_icon: Gets a #GIcon for the #GMount.
 * @get_uuid: Gets the UUID for the #GMount. The reference is typically based on the file system UUID for the mount in question and should be considered an opaque string. Returns %NULL if there is no UUID available.
 * @get_volume: Gets a #GVolume the mount is located on. Returns %NULL if the #GMount is not associated with a #GVolume.
 * @get_drive: Gets a #GDrive the volume of the mount is located on. Returns %NULL if the #GMount is not associated with a #GDrive or a #GVolume. This is convenience method for getting the #GVolume and using that to get the #GDrive.
 * @can_unmount: Checks if a #GMount can be unmounted.
 * @can_eject: Checks if a #GMount can be ejected.
 * @unmount: Starts unmounting a #GMount.
 * @unmount_finish: Finishes an unmounting operation.
 * @eject: Starts ejecting a #GMount.
 * @eject_finish: Finishes an eject operation.
 * @remount: Starts remounting a #GMount.
 * @remount_finish: Finishes a remounting operation.
 * @guess_content_type: Starts guessing the type of the content of a #GMount.
 *     See g_mount_guess_content_type() for more information on content
 *     type guessing. This operation was added in 2.18.
 * @guess_content_type_finish: Finishes a content type guessing operation. Added in 2.18.
 * @guess_content_type_sync: Synchronous variant of @guess_content_type. Added in 2.18
 * @unmount_with_operation: Starts unmounting a #GMount using a #GMountOperation. Since 2.22.
 * @unmount_with_operation_finish: Finishes an unmounting operation using a #GMountOperation. Since 2.22.
 * @eject_with_operation: Starts ejecting a #GMount using a #GMountOperation. Since 2.22.
 * @eject_with_operation_finish: Finishes an eject operation using a #GMountOperation. Since 2.22.
 * @get_default_location: Gets a #GFile indication a start location that can be use as the entry point for this mount. Since 2.24.
 * @get_sort_key: Gets a key used for sorting #GMount instance or %NULL if no such key exists. Since 2.32.
 * @get_symbolic_icon: Gets a symbolic #GIcon for the #GMount. Since 2.34.
 *
 * Interface for implementing operations for mounts.
 * }
{ signals  }
{ Virtual Table  }
{ Signal, not VFunc  }
(* Const before type ignored *)
  PGMountIface = ^TGMountIface;
  TGMountIface = record
      g_iface : TGTypeInterface;
      changed : procedure (mount:PGMount);cdecl;
      unmounted : procedure (mount:PGMount);cdecl;
      get_root : function (mount:PGMount):PGFile;cdecl;
      get_name : function (mount:PGMount):Pchar;cdecl;
      get_icon : function (mount:PGMount):PGIcon;cdecl;
      get_uuid : function (mount:PGMount):Pchar;cdecl;
      get_volume : function (mount:PGMount):PGVolume;cdecl;
      get_drive : function (mount:PGMount):PGDrive;cdecl;
      can_unmount : function (mount:PGMount):Tgboolean;cdecl;
      can_eject : function (mount:PGMount):Tgboolean;cdecl;
      unmount : procedure (mount:PGMount; flags:TGMountUnmountFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      unmount_finish : function (mount:PGMount; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      eject : procedure (mount:PGMount; flags:TGMountUnmountFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      eject_finish : function (mount:PGMount; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      remount : procedure (mount:PGMount; flags:TGMountMountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      remount_finish : function (mount:PGMount; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      guess_content_type : procedure (mount:PGMount; force_rescan:Tgboolean; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      guess_content_type_finish : function (mount:PGMount; result:PGAsyncResult; error:PPGError):PPgchar;cdecl;
      guess_content_type_sync : function (mount:PGMount; force_rescan:Tgboolean; cancellable:PGCancellable; error:PPGError):PPgchar;cdecl;
      pre_unmount : procedure (mount:PGMount);cdecl;
      unmount_with_operation : procedure (mount:PGMount; flags:TGMountUnmountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      unmount_with_operation_finish : function (mount:PGMount; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      eject_with_operation : procedure (mount:PGMount; flags:TGMountUnmountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      eject_with_operation_finish : function (mount:PGMount; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      get_default_location : function (mount:PGMount):PGFile;cdecl;
      get_sort_key : function (mount:PGMount):Pgchar;cdecl;
      get_symbolic_icon : function (mount:PGMount):PGIcon;cdecl;
    end;


function g_mount_get_type:TGType;cdecl;external;
function g_mount_get_root(mount:PGMount):PGFile;cdecl;external;
function g_mount_get_default_location(mount:PGMount):PGFile;cdecl;external;
function g_mount_get_name(mount:PGMount):Pchar;cdecl;external;
function g_mount_get_icon(mount:PGMount):PGIcon;cdecl;external;
function g_mount_get_symbolic_icon(mount:PGMount):PGIcon;cdecl;external;
function g_mount_get_uuid(mount:PGMount):Pchar;cdecl;external;
function g_mount_get_volume(mount:PGMount):PGVolume;cdecl;external;
function g_mount_get_drive(mount:PGMount):PGDrive;cdecl;external;
function g_mount_can_unmount(mount:PGMount):Tgboolean;cdecl;external;
function g_mount_can_eject(mount:PGMount):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_FOR(g_mount_unmount_with_operation) }
procedure g_mount_unmount(mount:PGMount; flags:TGMountUnmountFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
{xxxxxGLIB_DEPRECATED_FOR(g_mount_unmount_with_operation_finish) }
function g_mount_unmount_finish(mount:PGMount; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_FOR(g_mount_eject_with_operation) }
procedure g_mount_eject(mount:PGMount; flags:TGMountUnmountFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
{xxxxxGLIB_DEPRECATED_FOR(g_mount_eject_with_operation_finish) }
function g_mount_eject_finish(mount:PGMount; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure g_mount_remount(mount:PGMount; flags:TGMountMountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_mount_remount_finish(mount:PGMount; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure g_mount_guess_content_type(mount:PGMount; force_rescan:Tgboolean; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_mount_guess_content_type_finish(mount:PGMount; result:PGAsyncResult; error:PPGError):^Pgchar;cdecl;external;
function g_mount_guess_content_type_sync(mount:PGMount; force_rescan:Tgboolean; cancellable:PGCancellable; error:PPGError):^Pgchar;cdecl;external;
function g_mount_is_shadowed(mount:PGMount):Tgboolean;cdecl;external;
procedure g_mount_shadow(mount:PGMount);cdecl;external;
procedure g_mount_unshadow(mount:PGMount);cdecl;external;
procedure g_mount_unmount_with_operation(mount:PGMount; flags:TGMountUnmountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_mount_unmount_with_operation_finish(mount:PGMount; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure g_mount_eject_with_operation(mount:PGMount; flags:TGMountUnmountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_mount_eject_with_operation_finish(mount:PGMount; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_mount_get_sort_key(mount:PGMount):Pgchar;cdecl;external;
{$endif}
{ __G_MOUNT_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_MOUNT : longint; { return type might be wrong }
  begin
    G_TYPE_MOUNT:=g_mount_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MOUNT(obj : longint) : longint;
begin
  G_MOUNT:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_MOUNT,GMount);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_MOUNT(obj : longint) : longint;
begin
  G_IS_MOUNT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_MOUNT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_MOUNT_GET_IFACE(obj : longint) : longint;
begin
  G_MOUNT_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_MOUNT,GMountIface);
end;


end.
