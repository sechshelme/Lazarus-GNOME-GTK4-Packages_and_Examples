
unit gvolume;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvolume.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvolume.h
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
PGMountOperation  = ^GMountOperation;
PGVolume  = ^GVolume;
PGVolumeIface  = ^GVolumeIface;
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
 *         David Zeuthen <davidz@redhat.com>
  }
{$ifndef __G_VOLUME_H__}
{$define __G_VOLUME_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{*
 * G_VOLUME_IDENTIFIER_KIND_HAL_UDI:
 *
 * The string used to obtain a Hal UDI with g_volume_get_identifier().
 *
 * Deprecated: 2.58: Do not use, HAL is deprecated.
  }

const
  G_VOLUME_IDENTIFIER_KIND_HAL_UDI = 'hal-udi';  
{*
 * G_VOLUME_IDENTIFIER_KIND_UNIX_DEVICE:
 *
 * The string used to obtain a Unix device path with g_volume_get_identifier().
  }
  G_VOLUME_IDENTIFIER_KIND_UNIX_DEVICE = 'unix-device';  
{*
 * G_VOLUME_IDENTIFIER_KIND_LABEL:
 *
 * The string used to obtain a filesystem label with g_volume_get_identifier().
  }
  G_VOLUME_IDENTIFIER_KIND_LABEL = 'label';  
{*
 * G_VOLUME_IDENTIFIER_KIND_UUID:
 *
 * The string used to obtain a UUID with g_volume_get_identifier().
  }
  G_VOLUME_IDENTIFIER_KIND_UUID = 'uuid';  
{*
 * G_VOLUME_IDENTIFIER_KIND_NFS_MOUNT:
 *
 * The string used to obtain a NFS mount with g_volume_get_identifier().
  }
  G_VOLUME_IDENTIFIER_KIND_NFS_MOUNT = 'nfs-mount';  
{*
 * G_VOLUME_IDENTIFIER_KIND_CLASS:
 *
 * The string used to obtain the volume class with g_volume_get_identifier().
 *
 * Known volume classes include `device`, `network`, and `loop`. Other
 * classes may be added in the future.
 *
 * This is intended to be used by applications to classify #GVolume
 * instances into different sections - for example a file manager or
 * file chooser can use this information to show `network` volumes under
 * a "Network" heading and `device` volumes under a "Devices" heading.
  }
  G_VOLUME_IDENTIFIER_KIND_CLASS = 'class';  

{ was #define dname def_expr }
function G_TYPE_VOLUME : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VOLUME(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_VOLUME(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VOLUME_GET_IFACE(obj : longint) : longint;

{*
 * GVolumeIface:
 * @g_iface: The parent interface.
 * @changed: Changed signal that is emitted when the volume's state has changed.
 * @removed: The removed signal that is emitted when the #GVolume have been removed. If the recipient is holding references to the object they should release them so the object can be finalized.
 * @get_name: Gets a string containing the name of the #GVolume.
 * @get_icon: Gets a #GIcon for the #GVolume.
 * @get_uuid: Gets the UUID for the #GVolume. The reference is typically based on the file system UUID for the mount in question and should be considered an opaque string. Returns %NULL if there is no UUID available.
 * @get_drive: Gets a #GDrive the volume is located on. Returns %NULL if the #GVolume is not associated with a #GDrive.
 * @get_mount: Gets a #GMount representing the mounted volume. Returns %NULL if the #GVolume is not mounted.
 * @can_mount: Returns %TRUE if the #GVolume can be mounted.
 * @can_eject: Checks if a #GVolume can be ejected.
 * @mount_fn: Mounts a given #GVolume. 
 *     #GVolume implementations must emit the #GMountOperation::aborted 
 *     signal before completing a mount operation that is aborted while 
 *     awaiting input from the user through a #GMountOperation instance.
 * @mount_finish: Finishes a mount operation.
 * @eject: Ejects a given #GVolume.
 * @eject_finish: Finishes an eject operation.
 * @get_identifier: Returns the [identifier](#volume-identifiers) of the given kind, or %NULL if
 *    the #GVolume doesn't have one.
 * @enumerate_identifiers: Returns an array strings listing the kinds
 *    of [identifiers](#volume-identifiers) which the #GVolume has.
 * @should_automount: Returns %TRUE if the #GVolume should be automatically mounted.
 * @get_activation_root: Returns the activation root for the #GVolume if it is known in advance or %NULL if
 *   it is not known.
 * @eject_with_operation: Starts ejecting a #GVolume using a #GMountOperation. Since 2.22.
 * @eject_with_operation_finish: Finishes an eject operation using a #GMountOperation. Since 2.22.
 * @get_sort_key: Gets a key used for sorting #GVolume instance or %NULL if no such key exists. Since 2.32.
 * @get_symbolic_icon: Gets a symbolic #GIcon for the #GVolume. Since 2.34.
 *
 * Interface for implementing operations for mountable volumes.
 * }
type
{ signals  }
{ Virtual Table  }
(* Const before type ignored *)
(* Const before type ignored *)
  PGVolumeIface = ^TGVolumeIface;
  TGVolumeIface = record
      g_iface : TGTypeInterface;
      changed : procedure (volume:PGVolume);cdecl;
      removed : procedure (volume:PGVolume);cdecl;
      get_name : function (volume:PGVolume):Pchar;cdecl;
      get_icon : function (volume:PGVolume):PGIcon;cdecl;
      get_uuid : function (volume:PGVolume):Pchar;cdecl;
      get_drive : function (volume:PGVolume):PGDrive;cdecl;
      get_mount : function (volume:PGVolume):PGMount;cdecl;
      can_mount : function (volume:PGVolume):Tgboolean;cdecl;
      can_eject : function (volume:PGVolume):Tgboolean;cdecl;
      mount_fn : procedure (volume:PGVolume; flags:TGMountMountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      mount_finish : function (volume:PGVolume; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      eject : procedure (volume:PGVolume; flags:TGMountUnmountFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      eject_finish : function (volume:PGVolume; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      get_identifier : function (volume:PGVolume; kind:Pchar):Pchar;cdecl;
      enumerate_identifiers : function (volume:PGVolume):PPchar;cdecl;
      should_automount : function (volume:PGVolume):Tgboolean;cdecl;
      get_activation_root : function (volume:PGVolume):PGFile;cdecl;
      eject_with_operation : procedure (volume:PGVolume; flags:TGMountUnmountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      eject_with_operation_finish : function (volume:PGVolume; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      get_sort_key : function (volume:PGVolume):Pgchar;cdecl;
      get_symbolic_icon : function (volume:PGVolume):PGIcon;cdecl;
    end;


function g_volume_get_type:TGType;cdecl;external;
function g_volume_get_name(volume:PGVolume):Pchar;cdecl;external;
function g_volume_get_icon(volume:PGVolume):PGIcon;cdecl;external;
function g_volume_get_symbolic_icon(volume:PGVolume):PGIcon;cdecl;external;
function g_volume_get_uuid(volume:PGVolume):Pchar;cdecl;external;
function g_volume_get_drive(volume:PGVolume):PGDrive;cdecl;external;
function g_volume_get_mount(volume:PGVolume):PGMount;cdecl;external;
function g_volume_can_mount(volume:PGVolume):Tgboolean;cdecl;external;
function g_volume_can_eject(volume:PGVolume):Tgboolean;cdecl;external;
function g_volume_should_automount(volume:PGVolume):Tgboolean;cdecl;external;
procedure g_volume_mount(volume:PGVolume; flags:TGMountMountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_volume_mount_finish(volume:PGVolume; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_FOR(g_volume_eject_with_operation) }
procedure g_volume_eject(volume:PGVolume; flags:TGMountUnmountFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
{xxxxxGLIB_DEPRECATED_FOR(g_volume_eject_with_operation_finish) }
function g_volume_eject_finish(volume:PGVolume; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_volume_get_identifier(volume:PGVolume; kind:Pchar):Pchar;cdecl;external;
function g_volume_enumerate_identifiers(volume:PGVolume):^Pchar;cdecl;external;
function g_volume_get_activation_root(volume:PGVolume):PGFile;cdecl;external;
procedure g_volume_eject_with_operation(volume:PGVolume; flags:TGMountUnmountFlags; mount_operation:PGMountOperation; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_volume_eject_with_operation_finish(volume:PGVolume; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_volume_get_sort_key(volume:PGVolume):Pgchar;cdecl;external;
{$endif}
{ __G_VOLUME_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_VOLUME : longint; { return type might be wrong }
  begin
    G_TYPE_VOLUME:=g_volume_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VOLUME(obj : longint) : longint;
begin
  G_VOLUME:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_VOLUME,GVolume);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_VOLUME(obj : longint) : longint;
begin
  G_IS_VOLUME:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_VOLUME);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VOLUME_GET_IFACE(obj : longint) : longint;
begin
  G_VOLUME_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_VOLUME,GVolumeIface);
end;


end.
