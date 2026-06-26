unit gvfs;

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
{$ifndef __G_VFS_H__}
{$define __G_VFS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{*
 * GVfsFileLookupFunc:
 * @vfs: a #GVfs
 * @identifier: the identifier to look up a #GFile for. This can either
 *     be a URI or a parse name as returned by g_file_get_parse_name()
 * @user_data: (nullable): user data passed to the function, or %NULL
 *
 * This function type is used by g_vfs_register_uri_scheme() to make it
 * possible for a client to associate a URI scheme to a different #GFile
 * implementation.
 *
 * The client should return a reference to the new file that has been
 * created for @uri, or %NULL to continue with the default implementation.
 *
 * Returns: (nullable) (transfer full): a #GFile for @identifier.
 *
 * Since: 2.50
  }
type
  PGVfsFileLookupFunc = ^TGVfsFileLookupFunc;
  TGVfsFileLookupFunc = function (vfs:PGVfs; identifier:Pchar; user_data:Tgpointer):PGFile;cdecl;
{*
 * G_VFS_EXTENSION_POINT_NAME:
 *
 * Extension point for #GVfs functionality.
 * See [Extending GIO](overview.html#extending-gio).
  }

const
  G_VFS_EXTENSION_POINT_NAME = 'gio-vfs';  
type
  PGVfs = ^TGVfs;
  TGVfs = record
      parent_instance : TGObject;cdecl;
    end;

{ Virtual Table  }
{< private > }
{ Padding for future expansion  }
  PGVfsClass = ^TGVfsClass;
  TGVfsClass = record
      parent_class : TGObjectClass;
      is_active : function (vfs:PGVfs):Tgboolean;cdecl;
      get_file_for_path : function (vfs:PGVfs; path:Pchar):PGFile;cdecl;
      get_file_for_uri : function (vfs:PGVfs; uri:Pchar):PGFile;cdecl;
      get_supported_uri_schemes : function (vfs:PGVfs):PPgchar;cdecl;
      parse_name : function (vfs:PGVfs; parse_name:Pchar):PGFile;cdecl;
      local_file_add_info : procedure (vfs:PGVfs; filename:Pchar; device:Tguint64; attribute_matcher:PGFileAttributeMatcher; info:PGFileInfo; 
                    cancellable:PGCancellable; extra_data:Pgpointer; free_extra_data:PGDestroyNotify);cdecl;
      add_writable_namespaces : procedure (vfs:PGVfs; list:PGFileAttributeInfoList);cdecl;
      local_file_set_attributes : function (vfs:PGVfs; filename:Pchar; info:PGFileInfo; flags:TGFileQueryInfoFlags; cancellable:PGCancellable; 
                   error:PPGError):Tgboolean;cdecl;
      local_file_removed : procedure (vfs:PGVfs; filename:Pchar);cdecl;
      local_file_moved : procedure (vfs:PGVfs; source:Pchar; dest:Pchar);cdecl;
      deserialize_icon : function (vfs:PGVfs; value:PGVariant):PGIcon;cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
      _g_reserved6 : procedure ;cdecl;
    end;


function g_vfs_get_type:TGType;cdecl;external libgio2;
function g_vfs_is_active(vfs:PGVfs):Tgboolean;cdecl;external libgio2;
function g_vfs_get_file_for_path(vfs:PGVfs; path:Pchar):PGFile;cdecl;external libgio2;
function g_vfs_get_file_for_uri(vfs:PGVfs; uri:Pchar):PGFile;cdecl;external libgio2;
function g_vfs_get_supported_uri_schemes(vfs:PGVfs):^Pgchar;cdecl;external libgio2;
function g_vfs_parse_name(vfs:PGVfs; parse_name:Pchar):PGFile;cdecl;external libgio2;
function g_vfs_get_default:PGVfs;cdecl;external libgio2;
function g_vfs_get_local:PGVfs;cdecl;external libgio2;
function g_vfs_register_uri_scheme(vfs:PGVfs; scheme:Pchar; uri_func:TGVfsFileLookupFunc; uri_data:Tgpointer; uri_destroy:TGDestroyNotify; 
           parse_name_func:TGVfsFileLookupFunc; parse_name_data:Tgpointer; parse_name_destroy:TGDestroyNotify):Tgboolean;cdecl;external libgio2;
function g_vfs_unregister_uri_scheme(vfs:PGVfs; scheme:Pchar):Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_VFS_H__  }

// === Konventiert am: 26-6-26 20:07:19 ===

function G_TYPE_VFS : TGType;
function G_VFS(obj : Pointer) : PGVfs;
function G_VFS_CLASS(klass : Pointer) : PGVfsClass;
function G_VFS_GET_CLASS(obj : Pointer) : Tgboolean;
function G_IS_VFS(obj : Tgboolean) : longint;
function G_IS_VFS_CLASS(klass : PGVfsClass) : longint;

implementation

function G_TYPE_VFS : TGType;
  begin
    G_TYPE_VFS:=g_vfs_get_type;
  end;

function G_VFS(obj : Pointer) : PGVfs;
begin
  Result := PGVfs(g_type_check_instance_cast(obj, G_TYPE_VFS));
end;

function G_VFS_CLASS(klass : Pointer) : PGVfsClass;
begin
  Result := PGVfsClass(g_type_check_class_cast(klass, G_TYPE_VFS));
end;

function G_VFS_GET_CLASS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_VFS);
end;

function G_IS_VFS(obj : Tgboolean) : longint;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_VFS);
end;

function G_IS_VFS_CLASS(klass : PGVfsClass) : longint;
begin
  Result := PGVfsClass(PGTypeInstance(obj)^.g_class);
end;



end.
