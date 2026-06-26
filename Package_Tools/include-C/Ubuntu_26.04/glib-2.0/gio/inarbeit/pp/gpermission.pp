
unit gpermission;
interface

{
  Automatically converted by H2Pas 1.0.0 from gpermission.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gpermission.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGPermission  = ^GPermission;
PGPermissionClass  = ^GPermissionClass;
PGPermissionPrivate  = ^GPermissionPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2010 Codethink Limited
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_PERMISSION_H__}
{$define __G_PERMISSION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_PERMISSION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PERMISSION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PERMISSION_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PERMISSION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PERMISSION_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PERMISSION_GET_CLASS(inst : longint) : longint;

type
{< private > }
  PGPermission = ^TGPermission;
  TGPermission = record
      parent_instance : TGObject;
      priv : PGPermissionPrivate;
    end;

  PGPermissionClass = ^TGPermissionClass;
  TGPermissionClass = record
      parent_class : TGObjectClass;
      acquire : function (permission:PGPermission; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      acquire_async : procedure (permission:PGPermission; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      acquire_finish : function (permission:PGPermission; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      release : function (permission:PGPermission; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      release_async : procedure (permission:PGPermission; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      release_finish : function (permission:PGPermission; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      reserved : array[0..15] of Tgpointer;
    end;


function g_permission_get_type:TGType;cdecl;external;
function g_permission_acquire(permission:PGPermission; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_permission_acquire_async(permission:PGPermission; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_permission_acquire_finish(permission:PGPermission; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_permission_release(permission:PGPermission; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_permission_release_async(permission:PGPermission; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_permission_release_finish(permission:PGPermission; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_permission_get_allowed(permission:PGPermission):Tgboolean;cdecl;external;
function g_permission_get_can_acquire(permission:PGPermission):Tgboolean;cdecl;external;
function g_permission_get_can_release(permission:PGPermission):Tgboolean;cdecl;external;
procedure g_permission_impl_update(permission:PGPermission; allowed:Tgboolean; can_acquire:Tgboolean; can_release:Tgboolean);cdecl;external;
{$endif}
{ __G_PERMISSION_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_PERMISSION : longint; { return type might be wrong }
  begin
    G_TYPE_PERMISSION:=g_permission_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PERMISSION(inst : longint) : longint;
begin
  G_PERMISSION:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_PERMISSION,GPermission);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PERMISSION_CLASS(_class : longint) : longint;
begin
  G_PERMISSION_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_PERMISSION,GPermissionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PERMISSION(inst : longint) : longint;
begin
  G_IS_PERMISSION:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_PERMISSION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_PERMISSION_CLASS(_class : longint) : longint;
begin
  G_IS_PERMISSION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_PERMISSION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_PERMISSION_GET_CLASS(inst : longint) : longint;
begin
  G_PERMISSION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_PERMISSION,GPermissionClass);
end;


end.
