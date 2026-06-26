
unit gfileinfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from gfileinfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gfileinfo.h
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
PGDateTime  = ^GDateTime;
PGFileAttributeMatcher  = ^GFileAttributeMatcher;
PGFileAttributeStatus  = ^GFileAttributeStatus;
PGFileAttributeType  = ^GFileAttributeType;
PGFileInfo  = ^GFileInfo;
PGIcon  = ^GIcon;
PGObject  = ^GObject;
Pgpointer  = ^gpointer;
PGTimeVal  = ^GTimeVal;
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
{$ifndef __G_FILE_INFO_H__}
{$define __G_FILE_INFO_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_FILE_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_INFO(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_INFO_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_INFO(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_INFO_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_INFO_GET_CLASS(o : longint) : longint;

type
{ Common Attributes:   }
{*
 * G_FILE_ATTRIBUTE_STANDARD_TYPE:
 *
 * A key in the "standard" namespace for storing file types.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 *
 * The value for this key should contain a #GFileType.
 * }
{ uint32 (GFileType)  }

const
  G_FILE_ATTRIBUTE_STANDARD_TYPE = 'standard::type';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_IS_HIDDEN:
 *
 * A key in the "standard" namespace for checking if a file is hidden.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_STANDARD_IS_HIDDEN = 'standard::is-hidden';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_IS_BACKUP:
 *
 * A key in the "standard" namespace for checking if a file is a backup file.
 *
 * The exact semantics of what constitutes a backup file are backend-specific.
 * For local files, a file is considered a backup if its name ends with `~`
 * and it is a regular file. This follows the POSIX convention used by text
 * editors such as Emacs.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_STANDARD_IS_BACKUP = 'standard::is-backup';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK:
 *
 * A key in the "standard" namespace for checking if the file is a symlink.
 * Typically the actual type is something else, if we followed the symlink
 * to get the type.
 *
 * On Windows NTFS mountpoints are considered to be symlinks as well.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK = 'standard::is-symlink';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_IS_VIRTUAL:
 *
 * A key in the "standard" namespace for checking if a file is virtual.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_STANDARD_IS_VIRTUAL = 'standard::is-virtual';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_IS_VOLATILE:
 *
 * A key in the "standard" namespace for checking if a file is
 * volatile. This is meant for opaque, non-POSIX-like backends to
 * indicate that the URI is not persistent. Applications should look
 * at %G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET for the persistent URI.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.46
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_STANDARD_IS_VOLATILE = 'standard::is-volatile';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_NAME:
 *
 * A key in the "standard" namespace for getting the name of the file.
 *
 * The name is the on-disk filename which may not be in any known encoding,
 * and can thus not be generally displayed as is. It is guaranteed to be set on
 * every file.
 *
 * Use %G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME if you need to display the
 * name in a user interface.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING.
 * }
{ byte string  }
  G_FILE_ATTRIBUTE_STANDARD_NAME = 'standard::name';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME:
 *
 * A key in the "standard" namespace for getting the display name of the file.
 *
 * A display name is guaranteed to be in UTF-8 and can thus be displayed in
 * the UI. It is guaranteed to be set on every file.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 * }
{ string  }
  G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME = 'standard::display-name';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME:
 *
 * A key in the "standard" namespace for edit name of the file.
 *
 * An edit name is similar to the display name, but it is meant to be
 * used when you want to rename the file in the UI. The display name
 * might contain information you don't want in the new filename (such as
 * "(invalid unicode)" if the filename was in an invalid encoding).
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 * }
{ string  }
  G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME = 'standard::edit-name';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_COPY_NAME:
 *
 * A key in the "standard" namespace for getting the copy name of the file.
 *
 * The copy name is an optional version of the name. If available it's always
 * in UTF8, and corresponds directly to the original filename (only transcoded to
 * UTF8). This is useful if you want to copy the file to another filesystem that
 * might have a different encoding. If the filename is not a valid string in the
 * encoding selected for the filesystem it is in then the copy name will not be set.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 * }
{ string  }
  G_FILE_ATTRIBUTE_STANDARD_COPY_NAME = 'standard::copy-name';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_DESCRIPTION:
 *
 * A key in the "standard" namespace for getting the description of the file.
 *
 * The description is a utf8 string that describes the file, generally containing
 * the filename, but can also contain further information. Example descriptions
 * could be "filename (on hostname)" for a remote file or "filename (in trash)"
 * for a file in the trash. This is useful for instance as the window title
 * when displaying a directory or for a bookmarks menu.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 * }
{ string  }
  G_FILE_ATTRIBUTE_STANDARD_DESCRIPTION = 'standard::description';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_ICON:
 *
 * A key in the "standard" namespace for getting the icon for the file.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_OBJECT.
 *
 * The value for this key should contain a #GIcon.
 * }
{ object (GIcon)  }
  G_FILE_ATTRIBUTE_STANDARD_ICON = 'standard::icon';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON:
 *
 * A key in the "standard" namespace for getting the symbolic icon for the file.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_OBJECT.
 *
 * The value for this key should contain a #GIcon.
 *
 * Since: 2.34
 * }
{ object (GIcon)  }
  G_FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON = 'standard::symbolic-icon';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE:
 *
 * A key in the "standard" namespace for getting the content type of the file.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 *
 * The value for this key should contain a valid content type.
 * }
{ string  }
  G_FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE = 'standard::content-type';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_FAST_CONTENT_TYPE:
 *
 * A key in the "standard" namespace for getting the fast content type.
 *
 * The fast content type isn't as reliable as the regular one, as it
 * only uses the filename to guess it, but it is faster to calculate than the
 * regular content type.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 *
 * }
{ string  }
  G_FILE_ATTRIBUTE_STANDARD_FAST_CONTENT_TYPE = 'standard::fast-content-type';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_SIZE:
 *
 * A key in the "standard" namespace for getting the file's size (in bytes).
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64.
 * }
{ uint64  }
  G_FILE_ATTRIBUTE_STANDARD_SIZE = 'standard::size';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_ALLOCATED_SIZE:
 *
 * A key in the "standard" namespace for getting the amount of disk space
 * that is consumed by the file (in bytes).
 *
 * This will generally be larger than the file size (due to block size
 * overhead) but can occasionally be smaller (for example, for sparse files).
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64.
 *
 * Since: 2.20
 * }
{ uint64  }
  G_FILE_ATTRIBUTE_STANDARD_ALLOCATED_SIZE = 'standard::allocated-size';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET:
 *
 * A key in the "standard" namespace for getting the symlink target, if the file
 * is a symlink.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING.
 * }
{ byte string  }
  G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET = 'standard::symlink-target';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_TARGET_URI:
 *
 * A key in the "standard" namespace for getting the target URI for the file, in
 * the case of %G_FILE_TYPE_SHORTCUT or %G_FILE_TYPE_MOUNTABLE files.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 * }
{ string  }
  G_FILE_ATTRIBUTE_STANDARD_TARGET_URI = 'standard::target-uri';  
{*
 * G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER:
 *
 * A key in the "standard" namespace for setting the sort order of a file.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_INT32.
 *
 * An example use would be in file managers, which would use this key
 * to set the order files are displayed. Files with smaller sort order
 * should be sorted first, and files without sort order as if sort order
 * was zero.
 * }
{ int32   }
  G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER = 'standard::sort-order';  
{ Entity tags, used to avoid missing updates on save  }
{*
 * G_FILE_ATTRIBUTE_ETAG_VALUE:
 *
 * A key in the "etag" namespace for getting the value of the file's
 * entity tag.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 * }
{ string  }
  G_FILE_ATTRIBUTE_ETAG_VALUE = 'etag::value';  
{ File identifier, for e.g. avoiding loops when doing recursive
 * directory scanning
  }
{*
 * G_FILE_ATTRIBUTE_ID_FILE:
 *
 * A key in the "id" namespace for getting a file identifier.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 *
 * An example use would be during listing files, to avoid recursive
 * directory scanning.
 *
 * For local files on Linux, this is a combination of the file’s device number
 * and inode, so is invariant with respect to hard linking. The format used by
 * other VFS implementations may vary, and some VFS backends may not set it.
 *
 * For simply seeing if two [iface@Gio.File] instances refer to the same path
 * on disk, see [method@Gio.File.equal].
 * }
{ string  }
  G_FILE_ATTRIBUTE_ID_FILE = 'id::file';  
{*
 * G_FILE_ATTRIBUTE_ID_FILESYSTEM:
 *
 * A key in the "id" namespace for getting the file system identifier.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 *
 * An example use would be during drag and drop to see if the source
 * and target are on the same filesystem (default to move) or not (default
 * to copy).
 * }
{ string  }
  G_FILE_ATTRIBUTE_ID_FILESYSTEM = 'id::filesystem';  
{ Calculated Access Rights for current user  }
{*
 * G_FILE_ATTRIBUTE_ACCESS_CAN_READ:
 *
 * A key in the "access" namespace for getting read privileges.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * This attribute will be %TRUE if the user is able to read the file.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_ACCESS_CAN_READ = 'access::can-read';  
{*
 * G_FILE_ATTRIBUTE_ACCESS_CAN_WRITE:
 *
 * A key in the "access" namespace for getting write privileges.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * This attribute will be %TRUE if the user is able to write to the file.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_ACCESS_CAN_WRITE = 'access::can-write';  
{*
 * G_FILE_ATTRIBUTE_ACCESS_CAN_EXECUTE:
 *
 * A key in the "access" namespace for getting execution privileges.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * This attribute will be %TRUE if the user is able to execute the file.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_ACCESS_CAN_EXECUTE = 'access::can-execute';  
{*
 * G_FILE_ATTRIBUTE_ACCESS_CAN_DELETE:
 *
 * A key in the "access" namespace for checking deletion privileges.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * This attribute will be %TRUE if the user is able to delete the file.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_ACCESS_CAN_DELETE = 'access::can-delete';  
{*
 * G_FILE_ATTRIBUTE_ACCESS_CAN_TRASH:
 *
 * A key in the "access" namespace for checking trashing privileges.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * This attribute will be %TRUE if the user is able to move the file to
 * the trash.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_ACCESS_CAN_TRASH = 'access::can-trash';  
{*
 * G_FILE_ATTRIBUTE_ACCESS_CAN_RENAME:
 *
 * A key in the "access" namespace for checking renaming privileges.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * This attribute will be %TRUE if the user is able to rename the file.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_ACCESS_CAN_RENAME = 'access::can-rename';  
{ TODO: Should we have special version for directories? can_enumerate, etc  }
{ Mountable attributes  }
{*
 * G_FILE_ATTRIBUTE_MOUNTABLE_CAN_MOUNT:
 *
 * A key in the "mountable" namespace for checking if a file (of
 * type G_FILE_TYPE_MOUNTABLE) is mountable.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_MOUNTABLE_CAN_MOUNT = 'mountable::can-mount';  
{*
 * G_FILE_ATTRIBUTE_MOUNTABLE_CAN_UNMOUNT:
 *
 * A key in the "mountable" namespace for checking if a file (of
 * type G_FILE_TYPE_MOUNTABLE)  is unmountable.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_MOUNTABLE_CAN_UNMOUNT = 'mountable::can-unmount';  
{*
 * G_FILE_ATTRIBUTE_MOUNTABLE_CAN_EJECT:
 *
 * A key in the "mountable" namespace for checking if a file (of
 * type G_FILE_TYPE_MOUNTABLE) can be ejected.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_MOUNTABLE_CAN_EJECT = 'mountable::can-eject';  
{*
 * G_FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE:
 *
 * A key in the "mountable" namespace for getting the unix device.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE = 'mountable::unix-device';  
{*
 * G_FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE_FILE:
 *
 * A key in the "mountable" namespace for getting the unix device file.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 *
 * Since: 2.22
 * }
{ string  }
  G_FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE_FILE = 'mountable::unix-device-file';  
{*
 * G_FILE_ATTRIBUTE_MOUNTABLE_HAL_UDI:
 *
 * A key in the "mountable" namespace for getting the HAL UDI for the mountable
 * file.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 * }
{ string  }
  G_FILE_ATTRIBUTE_MOUNTABLE_HAL_UDI = 'mountable::hal-udi';  
{*
 * G_FILE_ATTRIBUTE_MOUNTABLE_CAN_START:
 *
 * A key in the "mountable" namespace for checking if a file (of
 * type G_FILE_TYPE_MOUNTABLE) can be started.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.22
  }
{ boolean  }
  G_FILE_ATTRIBUTE_MOUNTABLE_CAN_START = 'mountable::can-start';  
{*
 * G_FILE_ATTRIBUTE_MOUNTABLE_CAN_START_DEGRADED:
 *
 * A key in the "mountable" namespace for checking if a file (of
 * type G_FILE_TYPE_MOUNTABLE) can be started degraded.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.22
  }
{ boolean  }
  G_FILE_ATTRIBUTE_MOUNTABLE_CAN_START_DEGRADED = 'mountable::can-start-degraded';  
{*
 * G_FILE_ATTRIBUTE_MOUNTABLE_CAN_STOP:
 *
 * A key in the "mountable" namespace for checking if a file (of
 * type G_FILE_TYPE_MOUNTABLE) can be stopped.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.22
  }
{ boolean  }
  G_FILE_ATTRIBUTE_MOUNTABLE_CAN_STOP = 'mountable::can-stop';  
{*
 * G_FILE_ATTRIBUTE_MOUNTABLE_START_STOP_TYPE:
 *
 * A key in the "mountable" namespace for getting the #GDriveStartStopType.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 *
 * Since: 2.22
  }
{ uint32 (GDriveStartStopType)  }
  G_FILE_ATTRIBUTE_MOUNTABLE_START_STOP_TYPE = 'mountable::start-stop-type';  
{*
 * G_FILE_ATTRIBUTE_MOUNTABLE_CAN_POLL:
 *
 * A key in the "mountable" namespace for checking if a file (of
 * type G_FILE_TYPE_MOUNTABLE) can be polled.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.22
  }
{ boolean  }
  G_FILE_ATTRIBUTE_MOUNTABLE_CAN_POLL = 'mountable::can-poll';  
{*
 * G_FILE_ATTRIBUTE_MOUNTABLE_IS_MEDIA_CHECK_AUTOMATIC:
 *
 * A key in the "mountable" namespace for checking if a file (of
 * type G_FILE_TYPE_MOUNTABLE) is automatically polled for media.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.22
  }
{ boolean  }
  G_FILE_ATTRIBUTE_MOUNTABLE_IS_MEDIA_CHECK_AUTOMATIC = 'mountable::is-media-check-automatic';  
{ Time attributes  }
{*
 * G_FILE_ATTRIBUTE_TIME_MODIFIED:
 *
 * A key in the "time" namespace for getting the time the file was last
 * modified.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64, and
 * contains the time since the file was modified, in seconds since the UNIX
 * epoch.
 * }
{ uint64  }
  G_FILE_ATTRIBUTE_TIME_MODIFIED = 'time::modified';  
{*
 * G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC:
 *
 * A key in the "time" namespace for getting the microseconds of the time
 * the file was last modified.
 *
 * This should be used in conjunction with %G_FILE_ATTRIBUTE_TIME_MODIFIED.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC = 'time::modified-usec';  
{*
 * G_FILE_ATTRIBUTE_TIME_MODIFIED_NSEC:
 *
 * A key in the "time" namespace for getting the nanoseconds of the time
 * the file was last modified. This should be used in conjunction with
 * #G_FILE_ATTRIBUTE_TIME_MODIFIED. Corresponding #GFileAttributeType is
 * %G_FILE_ATTRIBUTE_TYPE_UINT32.
 *
 * Since: 2.74
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_TIME_MODIFIED_NSEC = 'time::modified-nsec';  
{*
 * G_FILE_ATTRIBUTE_TIME_ACCESS:
 *
 * A key in the "time" namespace for getting the time the file was last
 * accessed.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64, and
 * contains the time since the file was last accessed, in seconds since the
 * UNIX epoch.
 * }
{ uint64  }
  G_FILE_ATTRIBUTE_TIME_ACCESS = 'time::access';  
{*
 * G_FILE_ATTRIBUTE_TIME_ACCESS_USEC:
 *
 * A key in the "time" namespace for getting the microseconds of the time
 * the file was last accessed.
 *
 * This should be used in conjunction with %G_FILE_ATTRIBUTE_TIME_ACCESS.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_TIME_ACCESS_USEC = 'time::access-usec';  
{*
 * G_FILE_ATTRIBUTE_TIME_ACCESS_NSEC:
 *
 * A key in the "time" namespace for getting the nanoseconds of the time
 * the file was last accessed. This should be used in conjunction with
 * #G_FILE_ATTRIBUTE_TIME_ACCESS. Corresponding #GFileAttributeType is
 * %G_FILE_ATTRIBUTE_TYPE_UINT32.
 *
 * Since: 2.74
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_TIME_ACCESS_NSEC = 'time::access-nsec';  
{*
 * G_FILE_ATTRIBUTE_TIME_CHANGED:
 *
 * A key in the "time" namespace for getting the time the file was last
 * changed.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64,
 * and contains the time since the file was last changed, in seconds since
 * the UNIX epoch.
 *
 * This corresponds to the traditional UNIX ctime.
 * }
{ uint64  }
  G_FILE_ATTRIBUTE_TIME_CHANGED = 'time::changed';  
{*
 * G_FILE_ATTRIBUTE_TIME_CHANGED_USEC:
 *
 * A key in the "time" namespace for getting the microseconds of the time
 * the file was last changed.
 *
 * This should be used in conjunction with %G_FILE_ATTRIBUTE_TIME_CHANGED.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_TIME_CHANGED_USEC = 'time::changed-usec';  
{*
 * G_FILE_ATTRIBUTE_TIME_CHANGED_NSEC:
 *
 * A key in the "time" namespace for getting the nanoseconds of the time
 * the file was last changed. This should be used in conjunction with
 * #G_FILE_ATTRIBUTE_TIME_CHANGED. Corresponding #GFileAttributeType is
 * %G_FILE_ATTRIBUTE_TYPE_UINT32.
 *
 * Since: 2.74
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_TIME_CHANGED_NSEC = 'time::changed-nsec';  
{*
 * G_FILE_ATTRIBUTE_TIME_CREATED:
 *
 * A key in the "time" namespace for getting the time the file was created.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64,
 * and contains the time since the file was created, in seconds since the UNIX
 * epoch.
 *
 * This may correspond to Linux `stx_btime`, FreeBSD `st_birthtim`, NetBSD
 * `st_birthtime` or NTFS `ctime`.
 * }
{ uint64  }
  G_FILE_ATTRIBUTE_TIME_CREATED = 'time::created';  
{*
 * G_FILE_ATTRIBUTE_TIME_CREATED_USEC:
 *
 * A key in the "time" namespace for getting the microseconds of the time
 * the file was created.
 *
 * This should be used in conjunction with %G_FILE_ATTRIBUTE_TIME_CREATED.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_TIME_CREATED_USEC = 'time::created-usec';  
{*
 * G_FILE_ATTRIBUTE_TIME_CREATED_NSEC:
 *
 * A key in the "time" namespace for getting the nanoseconds of the time
 * the file was created. This should be used in conjunction with
 * #G_FILE_ATTRIBUTE_TIME_CREATED. Corresponding #GFileAttributeType is
 * %G_FILE_ATTRIBUTE_TYPE_UINT32.
 *
 * Since: 2.74
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_TIME_CREATED_NSEC = 'time::created-nsec';  
{ Unix specific attributes  }
{*
 * G_FILE_ATTRIBUTE_UNIX_DEVICE:
 *
 * A key in the "unix" namespace for getting the device id of the device the
 * file is located on (see stat() documentation).
 *
 * This attribute is only available for UNIX file systems.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_UNIX_DEVICE = 'unix::device';  
{*
 * G_FILE_ATTRIBUTE_UNIX_INODE:
 *
 * A key in the "unix" namespace for getting the inode of the file.
 *
 * This attribute is only available for UNIX file systems.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64.
 * }
{ uint64  }
  G_FILE_ATTRIBUTE_UNIX_INODE = 'unix::inode';  
{*
 * G_FILE_ATTRIBUTE_UNIX_MODE:
 *
 * A key in the "unix" namespace for getting the mode of the file
 * (e.g. whether the file is a regular file, symlink, etc).
 *
 * See the documentation for `lstat()`: this attribute is equivalent to
 * the `st_mode` member of `struct stat`, and includes both the file type
 * and permissions.
 *
 * This attribute is only available for UNIX file systems.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_UNIX_MODE = 'unix::mode';  
{*
 * G_FILE_ATTRIBUTE_UNIX_NLINK:
 *
 * A key in the "unix" namespace for getting the number of hard links
 * for a file.
 *
 * See the documentation for `lstat()`.
 *
 * This attribute is only available for UNIX file systems.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_UNIX_NLINK = 'unix::nlink';  
{*
 * G_FILE_ATTRIBUTE_UNIX_UID:
 *
 * A key in the "unix" namespace for getting the user ID for the file.
 *
 * This attribute is only available for UNIX file systems.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_UNIX_UID = 'unix::uid';  
{*
 * G_FILE_ATTRIBUTE_UNIX_GID:
 *
 * A key in the "unix" namespace for getting the group ID for the file.
 *
 * This attribute is only available for UNIX file systems.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_UNIX_GID = 'unix::gid';  
{*
 * G_FILE_ATTRIBUTE_UNIX_RDEV:
 *
 * A key in the "unix" namespace for getting the device ID for the file
 * (if it is a special file).
 *
 * See the documentation for `lstat()`.
 *
 * This attribute is only available for UNIX file systems.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_UNIX_RDEV = 'unix::rdev';  
{*
 * G_FILE_ATTRIBUTE_UNIX_BLOCK_SIZE:
 *
 * A key in the "unix" namespace for getting the block size for the file
 * system.
 *
 * This attribute is only available for UNIX file systems.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_UNIX_BLOCK_SIZE = 'unix::block-size';  
{*
 * G_FILE_ATTRIBUTE_UNIX_BLOCKS:
 *
 * A key in the "unix" namespace for getting the number of blocks allocated
 * for the file.
 *
 * This attribute is only available for UNIX file systems.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64.
 * }
{ uint64  }
  G_FILE_ATTRIBUTE_UNIX_BLOCKS = 'unix::blocks';  
{*
 * G_FILE_ATTRIBUTE_UNIX_IS_MOUNTPOINT:
 *
 * A key in the "unix" namespace for checking if the file represents a
 * UNIX mount point.
 *
 * This attribute is %TRUE if the file is a UNIX mount point.
 *
 * Since 2.58, `/` is considered to be a mount point.
 *
 * This attribute is only available for UNIX file systems.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_UNIX_IS_MOUNTPOINT = 'unix::is-mountpoint';  
{ DOS specific attributes  }
{*
 * G_FILE_ATTRIBUTE_DOS_IS_ARCHIVE:
 *
 * A key in the "dos" namespace for checking if the file's archive flag
 * is set.
 *
 * This attribute is %TRUE if the archive flag is set.
 *
 * This attribute is only available for DOS file systems.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_DOS_IS_ARCHIVE = 'dos::is-archive';  
{*
 * G_FILE_ATTRIBUTE_DOS_IS_SYSTEM:
 *
 * A key in the "dos" namespace for checking if the file's backup flag
 * is set.
 *
 * This attribute is %TRUE if the backup flag is set.
 *
 * This attribute is only available for DOS file systems.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_DOS_IS_SYSTEM = 'dos::is-system';  
{*
 * G_FILE_ATTRIBUTE_DOS_IS_MOUNTPOINT:
 *
 * A key in the "dos" namespace for checking if the file is a NTFS mount point
 * (a volume mount or a junction point).
 *
 * This attribute is %TRUE if file is a reparse point of type
 * [IO_REPARSE_TAG_MOUNT_POINT](https://msdn.microsoft.com/en-us/library/dd541667.aspx).
 *
 * This attribute is only available for DOS file systems.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.60
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_DOS_IS_MOUNTPOINT = 'dos::is-mountpoint';  
{*
 * G_FILE_ATTRIBUTE_DOS_REPARSE_POINT_TAG:
 *
 * A key in the "dos" namespace for getting the file NTFS reparse tag.
 *
 * This value is 0 for files that are not reparse points.
 *
 * See the [Reparse Tags](https://msdn.microsoft.com/en-us/library/dd541667.aspx)
 * page for possible reparse tag values.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 *
 * Since: 2.60
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_DOS_REPARSE_POINT_TAG = 'dos::reparse-point-tag';  
{ Owner attributes  }
{*
 * G_FILE_ATTRIBUTE_OWNER_USER:
 *
 * A key in the "owner" namespace for getting the user name of the
 * file's owner.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 * }
{ string  }
  G_FILE_ATTRIBUTE_OWNER_USER = 'owner::user';  
{*
 * G_FILE_ATTRIBUTE_OWNER_USER_REAL:
 *
 * A key in the "owner" namespace for getting the real name of the
 * user that owns the file.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 * }
{ string  }
  G_FILE_ATTRIBUTE_OWNER_USER_REAL = 'owner::user-real';  
{*
 * G_FILE_ATTRIBUTE_OWNER_GROUP:
 *
 * A key in the "owner" namespace for getting the file owner's group.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 * }
{ string  }
  G_FILE_ATTRIBUTE_OWNER_GROUP = 'owner::group';  
{ Thumbnails  }
{*
 * G_FILE_ATTRIBUTE_THUMBNAIL_PATH:
 *
 * A key in the "thumbnail" namespace for getting the path to the thumbnail
 * image with the biggest size available.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING.
 * }
{ bytestring  }
  G_FILE_ATTRIBUTE_THUMBNAIL_PATH = 'thumbnail::path';  
{*
 * G_FILE_ATTRIBUTE_THUMBNAILING_FAILED:
 *
 * A key in the "thumbnail" namespace for checking if thumbnailing failed.
 *
 * This attribute is %TRUE if thumbnailing failed.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_THUMBNAILING_FAILED = 'thumbnail::failed';  
{*
 * G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID:
 *
 * A key in the "thumbnail" namespace for checking whether the thumbnail is outdated.
 *
 * This attribute is %TRUE if the thumbnail is up-to-date with the file it represents,
 * and %FALSE if the file has been modified since the thumbnail was generated.
 *
 * If %G_FILE_ATTRIBUTE_THUMBNAILING_FAILED is %TRUE and this attribute is %FALSE,
 * it indicates that thumbnailing may be attempted again and may succeed.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.40
  }
{ boolean  }
  G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID = 'thumbnail::is-valid';  
{*
 * G_FILE_ATTRIBUTE_THUMBNAIL_PATH_NORMAL:
 *
 * A key in the "thumbnail" namespace for getting the path to the normal
 * thumbnail image.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING.
 *
 * Since: 2.76
  }
{ bytestring  }
  G_FILE_ATTRIBUTE_THUMBNAIL_PATH_NORMAL = 'thumbnail::path-normal';  
{*
 * G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_NORMAL:
 *
 * A key in the "thumbnail" namespace for checking if thumbnailing failed
 * for the normal image.
 *
 * This attribute is %TRUE if thumbnailing failed.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.76
  }
{ boolean  }
  G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_NORMAL = 'thumbnail::failed-normal';  
{*
 * G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_NORMAL:
 *
 * A key in the "thumbnail" namespace for checking whether the normal
 * thumbnail is outdated.
 *
 * This attribute is %TRUE if the normal thumbnail is up-to-date with the file
 * it represents, and %FALSE if the file has been modified since the thumbnail
 * was generated.
 *
 * If %G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_NORMAL is %TRUE and this attribute
 * is %FALSE, it indicates that thumbnailing may be attempted again and may
 * succeed.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.76
  }
{ boolean  }
  G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_NORMAL = 'thumbnail::is-valid-normal';  
{*
 * G_FILE_ATTRIBUTE_THUMBNAIL_PATH_LARGE:
 *
 * A key in the "thumbnail" namespace for getting the path to the large
 * thumbnail image.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING.
 *
 * Since: 2.76
  }
{ bytestring  }
  G_FILE_ATTRIBUTE_THUMBNAIL_PATH_LARGE = 'thumbnail::path-large';  
{*
 * G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_LARGE:
 *
 * A key in the "thumbnail" namespace for checking if thumbnailing failed
 * for the large image.
 *
 * This attribute is %TRUE if thumbnailing failed.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.76
  }
{ boolean  }
  G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_LARGE = 'thumbnail::failed-large';  
{*
 * G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_LARGE:
 *
 * A key in the "thumbnail" namespace for checking whether the large
 * thumbnail is outdated.
 *
 * This attribute is %TRUE if the large thumbnail is up-to-date with the file
 * it represents, and %FALSE if the file has been modified since the thumbnail
 * was generated.
 *
 * If %G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_LARGE is %TRUE and this attribute
 * is %FALSE, it indicates that thumbnailing may be attempted again and may
 * succeed.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.76
  }
{ boolean  }
  G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_LARGE = 'thumbnail::is-valid-large';  
{*
 * G_FILE_ATTRIBUTE_THUMBNAIL_PATH_XLARGE:
 *
 * A key in the "thumbnail" namespace for getting the path to the x-large
 * thumbnail image.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING.
 *
 * Since: 2.76
  }
{ bytestring  }
  G_FILE_ATTRIBUTE_THUMBNAIL_PATH_XLARGE = 'thumbnail::path-xlarge';  
{*
 * G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_XLARGE:
 *
 * A key in the "thumbnail" namespace for checking if thumbnailing failed
 * for the x-large image.
 *
 * This attribute is %TRUE if thumbnailing failed.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.76
  }
{ boolean  }
  G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_XLARGE = 'thumbnail::failed-xlarge';  
{*
 * G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_XLARGE:
 *
 * A key in the "thumbnail" namespace for checking whether the x-large
 * thumbnail is outdated.
 *
 * This attribute is %TRUE if the x-large thumbnail is up-to-date with the file
 * it represents, and %FALSE if the file has been modified since the thumbnail
 * was generated.
 *
 * If %G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_XLARGE is %TRUE and this attribute
 * is %FALSE, it indicates that thumbnailing may be attempted again and may
 * succeed.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.76
  }
{ boolean  }
  G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_XLARGE = 'thumbnail::is-valid-xlarge';  
{*
 * G_FILE_ATTRIBUTE_THUMBNAIL_PATH_XXLARGE:
 *
 * A key in the "thumbnail" namespace for getting the path to the xx-large
 * thumbnail image.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING.
 *
 * Since: 2.76
  }
{ bytestring  }
  G_FILE_ATTRIBUTE_THUMBNAIL_PATH_XXLARGE = 'thumbnail::path-xxlarge';  
{*
 * G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_XXLARGE:
 *
 * A key in the "thumbnail" namespace for checking if thumbnailing failed
 * for the xx-large image.
 *
 * This attribute is %TRUE if thumbnailing failed.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.76
  }
{ boolean  }
  G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_XXLARGE = 'thumbnail::failed-xxlarge';  
{*
 * G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_XXLARGE:
 *
 * A key in the "thumbnail" namespace for checking whether the xx-large
 * thumbnail is outdated.
 *
 * This attribute is %TRUE if the x-large thumbnail is up-to-date with the file
 * it represents, and %FALSE if the file has been modified since the thumbnail
 * was generated.
 *
 * If %G_FILE_ATTRIBUTE_THUMBNAILING_FAILED_XXLARGE is %TRUE and this attribute
 * is %FALSE, it indicates that thumbnailing may be attempted again and may
 * succeed.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 *
 * Since: 2.76
  }
{ boolean  }
  G_FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_XXLARGE = 'thumbnail::is-valid-xxlarge';  
{ Preview  }
{*
 * G_FILE_ATTRIBUTE_PREVIEW_ICON:
 *
 * A key in the "preview" namespace for getting a #GIcon that can be
 * used to get preview of the file.
 *
 * For example, it may be a low resolution thumbnail without metadata.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_OBJECT.
 *
 * The value for this key should contain a #GIcon.
 *
 * Since: 2.20
 * }
{ object (GIcon)  }
  G_FILE_ATTRIBUTE_PREVIEW_ICON = 'preview::icon';  
{ File system info (for g_file_get_filesystem_info)  }
{*
 * G_FILE_ATTRIBUTE_FILESYSTEM_SIZE:
 *
 * A key in the "filesystem" namespace for getting the total size (in
 * bytes) of the file system, used in g_file_query_filesystem_info().
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64.
 * }
{ uint64  }
  G_FILE_ATTRIBUTE_FILESYSTEM_SIZE = 'filesystem::size';  
{*
 * G_FILE_ATTRIBUTE_FILESYSTEM_FREE:
 *
 * A key in the "filesystem" namespace for getting the number of bytes
 * of free space left on the file system.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64.
 * }
{ uint64  }
  G_FILE_ATTRIBUTE_FILESYSTEM_FREE = 'filesystem::free';  
{*
 * G_FILE_ATTRIBUTE_FILESYSTEM_USED:
 *
 * A key in the "filesystem" namespace for getting the number of bytes
 * used by data on the file system.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT64.
 *
 * Since: 2.32
  }
{ uint64  }
  G_FILE_ATTRIBUTE_FILESYSTEM_USED = 'filesystem::used';  
{*
 * G_FILE_ATTRIBUTE_FILESYSTEM_TYPE:
 *
 * A key in the "filesystem" namespace for getting the file system's type.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 * }
{ string  }
  G_FILE_ATTRIBUTE_FILESYSTEM_TYPE = 'filesystem::type';  
{*
 * G_FILE_ATTRIBUTE_FILESYSTEM_READONLY:
 *
 * A key in the "filesystem" namespace for checking if the file system
 * is read only.
 *
 * Is set to %TRUE if the file system is read only.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_FILESYSTEM_READONLY = 'filesystem::readonly';  
{*
 * G_FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW:
 *
 * A key in the "filesystem" namespace for hinting a file manager
 * application whether it should preview (e.g. thumbnail) files on the
 * file system.
 *
 * The value for this key contain a #GFilesystemPreviewType.
 * }
{ uint32 (GFilesystemPreviewType)  }
  G_FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW = 'filesystem::use-preview';  
{*
 * G_FILE_ATTRIBUTE_FILESYSTEM_REMOTE:
 *
 * A key in the "filesystem" namespace for checking if the file system
 * is remote.
 *
 * Is set to %TRUE if the file system is remote.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BOOLEAN.
 * }
{ boolean  }
  G_FILE_ATTRIBUTE_FILESYSTEM_REMOTE = 'filesystem::remote';  
{*
 * G_FILE_ATTRIBUTE_GVFS_BACKEND:
 *
 * A key in the "gvfs" namespace that gets the name of the current
 * GVFS backend in use.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 * }
{ string  }
  G_FILE_ATTRIBUTE_GVFS_BACKEND = 'gvfs::backend';  
{*
 * G_FILE_ATTRIBUTE_SELINUX_CONTEXT:
 *
 * A key in the "selinux" namespace for getting the file's SELinux
 * context.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 *
 * Note that this attribute is only available if GLib has been built
 * with SELinux support.
 * }
{ string  }
  G_FILE_ATTRIBUTE_SELINUX_CONTEXT = 'selinux::context';  
{*
 * G_FILE_ATTRIBUTE_TRASH_ITEM_COUNT:
 *
 * A key in the "trash" namespace for getting the number of (toplevel) items
 * that are present in the `trash:///` folder.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_UINT32.
 * }
{ uint32  }
  G_FILE_ATTRIBUTE_TRASH_ITEM_COUNT = 'trash::item-count';  
{*
 * G_FILE_ATTRIBUTE_TRASH_ORIG_PATH:
 *
 * A key in the "trash" namespace for getting the original path of a file
 * inside the `trash:///` folder before it was trashed.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING.
 *
 * Since: 2.24
 * }
{ byte string  }
  G_FILE_ATTRIBUTE_TRASH_ORIG_PATH = 'trash::orig-path';  
{*
 * G_FILE_ATTRIBUTE_TRASH_DELETION_DATE:
 *
 * A key in the "trash" namespace for getting the deletion date and time
 * of a file inside the `trash:///` folder.
 *
 * The format of the returned string is `YYYY-MM-DDThh:mm:ss`.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_STRING.
 *
 * Since: 2.24
 * }
{ string  }
  G_FILE_ATTRIBUTE_TRASH_DELETION_DATE = 'trash::deletion-date';  
{*
 * G_FILE_ATTRIBUTE_RECENT_MODIFIED:
 *
 * A key in the "recent" namespace for getting time, when the metadata for the
 * file in `recent:///` was last changed.
 *
 * Corresponding #GFileAttributeType is %G_FILE_ATTRIBUTE_TYPE_INT64.
 *
 * Since: 2.52
 * }
{ int64 (time_t)  }
  G_FILE_ATTRIBUTE_RECENT_MODIFIED = 'recent::modified';  

function g_file_info_get_type:TGType;cdecl;external;
function g_file_info_new:PGFileInfo;cdecl;external;
function g_file_info_dup(other:PGFileInfo):PGFileInfo;cdecl;external;
procedure g_file_info_copy_into(src_info:PGFileInfo; dest_info:PGFileInfo);cdecl;external;
(* Const before type ignored *)
function g_file_info_has_attribute(info:PGFileInfo; attribute:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_info_has_namespace(info:PGFileInfo; name_space:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_info_list_attributes(info:PGFileInfo; name_space:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_attribute_data(info:PGFileInfo; attribute:Pchar; _type:PGFileAttributeType; value_pp:Pgpointer; status:PGFileAttributeStatus):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_attribute_type(info:PGFileInfo; attribute:Pchar):TGFileAttributeType;cdecl;external;
(* Const before type ignored *)
procedure g_file_info_remove_attribute(info:PGFileInfo; attribute:Pchar);cdecl;external;
(* Const before type ignored *)
function g_file_info_get_attribute_status(info:PGFileInfo; attribute:Pchar):TGFileAttributeStatus;cdecl;external;
(* Const before type ignored *)
function g_file_info_set_attribute_status(info:PGFileInfo; attribute:Pchar; status:TGFileAttributeStatus):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_attribute_as_string(info:PGFileInfo; attribute:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_file_info_get_attribute_string(info:PGFileInfo; attribute:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_file_info_get_attribute_byte_string(info:PGFileInfo; attribute:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_attribute_boolean(info:PGFileInfo; attribute:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_attribute_uint32(info:PGFileInfo; attribute:Pchar):Tguint32;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_attribute_int32(info:PGFileInfo; attribute:Pchar):Tgint32;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_attribute_uint64(info:PGFileInfo; attribute:Pchar):Tguint64;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_attribute_int64(info:PGFileInfo; attribute:Pchar):Tgint64;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_attribute_object(info:PGFileInfo; attribute:Pchar):PGObject;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_attribute_stringv(info:PGFileInfo; attribute:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_file_info_get_attribute_file_path(info:PGFileInfo; attribute:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_file_info_set_attribute(info:PGFileInfo; attribute:Pchar; _type:TGFileAttributeType; value_p:Tgpointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_file_info_set_attribute_string(info:PGFileInfo; attribute:Pchar; attr_value:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_file_info_set_attribute_byte_string(info:PGFileInfo; attribute:Pchar; attr_value:Pchar);cdecl;external;
(* Const before type ignored *)
procedure g_file_info_set_attribute_boolean(info:PGFileInfo; attribute:Pchar; attr_value:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure g_file_info_set_attribute_uint32(info:PGFileInfo; attribute:Pchar; attr_value:Tguint32);cdecl;external;
(* Const before type ignored *)
procedure g_file_info_set_attribute_int32(info:PGFileInfo; attribute:Pchar; attr_value:Tgint32);cdecl;external;
(* Const before type ignored *)
procedure g_file_info_set_attribute_uint64(info:PGFileInfo; attribute:Pchar; attr_value:Tguint64);cdecl;external;
(* Const before type ignored *)
procedure g_file_info_set_attribute_int64(info:PGFileInfo; attribute:Pchar; attr_value:Tgint64);cdecl;external;
(* Const before type ignored *)
procedure g_file_info_set_attribute_object(info:PGFileInfo; attribute:Pchar; attr_value:PGObject);cdecl;external;
(* Const before type ignored *)
procedure g_file_info_set_attribute_stringv(info:PGFileInfo; attribute:Pchar; attr_value:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_file_info_set_attribute_file_path(info:PGFileInfo; attribute:Pchar; attr_value:Pchar);cdecl;external;
procedure g_file_info_clear_status(info:PGFileInfo);cdecl;external;
{ Helper getters:  }
function g_file_info_get_deletion_date(info:PGFileInfo):PGDateTime;cdecl;external;
function g_file_info_get_file_type(info:PGFileInfo):TGFileType;cdecl;external;
function g_file_info_get_is_hidden(info:PGFileInfo):Tgboolean;cdecl;external;
function g_file_info_get_is_backup(info:PGFileInfo):Tgboolean;cdecl;external;
function g_file_info_get_is_symlink(info:PGFileInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_name(info:PGFileInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_display_name(info:PGFileInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_edit_name(info:PGFileInfo):Pchar;cdecl;external;
function g_file_info_get_icon(info:PGFileInfo):PGIcon;cdecl;external;
function g_file_info_get_symbolic_icon(info:PGFileInfo):PGIcon;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_content_type(info:PGFileInfo):Pchar;cdecl;external;
function g_file_info_get_size(info:PGFileInfo):Tgoffset;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_62_FOR(g_file_info_get_modification_date_time) }
procedure g_file_info_get_modification_time(info:PGFileInfo; result:PGTimeVal);cdecl;external;
function g_file_info_get_modification_date_time(info:PGFileInfo):PGDateTime;cdecl;external;
function g_file_info_get_access_date_time(info:PGFileInfo):PGDateTime;cdecl;external;
function g_file_info_get_creation_date_time(info:PGFileInfo):PGDateTime;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_symlink_target(info:PGFileInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function g_file_info_get_etag(info:PGFileInfo):Pchar;cdecl;external;
function g_file_info_get_sort_order(info:PGFileInfo):Tgint32;cdecl;external;
procedure g_file_info_set_attribute_mask(info:PGFileInfo; mask:PGFileAttributeMatcher);cdecl;external;
procedure g_file_info_unset_attribute_mask(info:PGFileInfo);cdecl;external;
{ Helper setters:  }
procedure g_file_info_set_file_type(info:PGFileInfo; _type:TGFileType);cdecl;external;
procedure g_file_info_set_is_hidden(info:PGFileInfo; is_hidden:Tgboolean);cdecl;external;
procedure g_file_info_set_is_symlink(info:PGFileInfo; is_symlink:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure g_file_info_set_name(info:PGFileInfo; name:Pchar);cdecl;external;
(* Const before type ignored *)
procedure g_file_info_set_display_name(info:PGFileInfo; display_name:Pchar);cdecl;external;
(* Const before type ignored *)
procedure g_file_info_set_edit_name(info:PGFileInfo; edit_name:Pchar);cdecl;external;
procedure g_file_info_set_icon(info:PGFileInfo; icon:PGIcon);cdecl;external;
procedure g_file_info_set_symbolic_icon(info:PGFileInfo; icon:PGIcon);cdecl;external;
(* Const before type ignored *)
procedure g_file_info_set_content_type(info:PGFileInfo; content_type:Pchar);cdecl;external;
procedure g_file_info_set_size(info:PGFileInfo; size:Tgoffset);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_62_FOR(g_file_info_set_modification_date_time) }
procedure g_file_info_set_modification_time(info:PGFileInfo; mtime:PGTimeVal);cdecl;external;
procedure g_file_info_set_modification_date_time(info:PGFileInfo; mtime:PGDateTime);cdecl;external;
procedure g_file_info_set_access_date_time(info:PGFileInfo; atime:PGDateTime);cdecl;external;
procedure g_file_info_set_creation_date_time(info:PGFileInfo; creation_time:PGDateTime);cdecl;external;
(* Const before type ignored *)
procedure g_file_info_set_symlink_target(info:PGFileInfo; symlink_target:Pchar);cdecl;external;
procedure g_file_info_set_sort_order(info:PGFileInfo; sort_order:Tgint32);cdecl;external;
{ was #define dname def_expr }
function G_TYPE_FILE_ATTRIBUTE_MATCHER : longint; { return type might be wrong }

function g_file_attribute_matcher_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_file_attribute_matcher_new(attributes:Pchar):PGFileAttributeMatcher;cdecl;external;
function g_file_attribute_matcher_ref(matcher:PGFileAttributeMatcher):PGFileAttributeMatcher;cdecl;external;
procedure g_file_attribute_matcher_unref(matcher:PGFileAttributeMatcher);cdecl;external;
function g_file_attribute_matcher_subtract(matcher:PGFileAttributeMatcher; subtract:PGFileAttributeMatcher):PGFileAttributeMatcher;cdecl;external;
(* Const before type ignored *)
function g_file_attribute_matcher_matches(matcher:PGFileAttributeMatcher; attribute:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_attribute_matcher_matches_only(matcher:PGFileAttributeMatcher; attribute:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_attribute_matcher_enumerate_namespace(matcher:PGFileAttributeMatcher; ns:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_file_attribute_matcher_enumerate_next(matcher:PGFileAttributeMatcher):Pchar;cdecl;external;
function g_file_attribute_matcher_to_string(matcher:PGFileAttributeMatcher):Pchar;cdecl;external;
{$endif}
{ __G_FILE_INFO_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_FILE_INFO : longint; { return type might be wrong }
  begin
    G_TYPE_FILE_INFO:=g_file_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_INFO(o : longint) : longint;
begin
  G_FILE_INFO:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_FILE_INFO,GFileInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_INFO_CLASS(k : longint) : longint;
begin
  G_FILE_INFO_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_FILE_INFO,GFileInfoClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_INFO(o : longint) : longint;
begin
  G_IS_FILE_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_FILE_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_INFO_CLASS(k : longint) : longint;
begin
  G_IS_FILE_INFO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_FILE_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_INFO_GET_CLASS(o : longint) : longint;
begin
  G_FILE_INFO_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_FILE_INFO,GFileInfoClass);
end;

{ was #define dname def_expr }
function G_TYPE_FILE_ATTRIBUTE_MATCHER : longint; { return type might be wrong }
  begin
    G_TYPE_FILE_ATTRIBUTE_MATCHER:=g_file_attribute_matcher_get_type;
  end;


end.
