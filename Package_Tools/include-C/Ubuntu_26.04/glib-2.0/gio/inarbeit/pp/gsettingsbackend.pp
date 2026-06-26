
unit gsettingsbackend;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsettingsbackend.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsettingsbackend.h
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
PGPermission  = ^GPermission;
PGSettingsBackend  = ^GSettingsBackend;
PGSettingsBackendClass  = ^GSettingsBackendClass;
PGSettingsBackendPrivate  = ^GSettingsBackendPrivate;
PGTree  = ^GTree;
PGVariant  = ^GVariant;
PGVariantType  = ^GVariantType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2009, 2010 Codethink Limited
 * Copyright © 2010 Red Hat, Inc.
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
 * Authors: Ryan Lortie <desrt@desrt.ca>
 *          Matthias Clasen <mclasen@redhat.com>
  }
{$ifndef __G_SETTINGS_BACKEND_H__}
{$define __G_SETTINGS_BACKEND_H__}
{$if !defined (G_SETTINGS_ENABLE_BACKEND) && !defined (GIO_COMPILATION)}
{$error "You must define G_SETTINGS_ENABLE_BACKEND before including <gio/gsettingsbackend.h>."}
{$endif}
{$define __GIO_GIO_H_INSIDE__}
{$include <gio/giotypes.h>}
{$undef __GIO_GIO_H_INSIDE__}

{ was #define dname def_expr }
function G_TYPE_SETTINGS_BACKEND : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SETTINGS_BACKEND(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SETTINGS_BACKEND_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SETTINGS_BACKEND(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SETTINGS_BACKEND_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SETTINGS_BACKEND_GET_CLASS(inst : longint) : longint;

{*
 * G_SETTINGS_BACKEND_EXTENSION_POINT_NAME:
 *
 * Extension point for #GSettingsBackend functionality.
 * }
const
  G_SETTINGS_BACKEND_EXTENSION_POINT_NAME = 'gsettings-backend';  
type
{*
 * GSettingsBackendClass:
 * @read: virtual method to read a key's value
 * @get_writable: virtual method to get if a key is writable
 * @write: virtual method to change key's value
 * @write_tree: virtual method to change a tree of keys
 * @reset: virtual method to reset state
 * @subscribe: virtual method to subscribe to key changes
 * @unsubscribe: virtual method to unsubscribe to key changes
 * @sync: virtual method to sync state
 * @get_permission: virtual method to get permission of a key
 * @read_user_value: virtual method to read user's key value
 *
 * Class structure for #GSettingsBackend.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
  PGSettingsBackendClass = ^TGSettingsBackendClass;
  TGSettingsBackendClass = record
      parent_class : TGObjectClass;
      read : function (backend:PGSettingsBackend; key:Pgchar; expected_type:PGVariantType; default_value:Tgboolean):PGVariant;cdecl;
      get_writable : function (backend:PGSettingsBackend; key:Pgchar):Tgboolean;cdecl;
      write : function (backend:PGSettingsBackend; key:Pgchar; value:PGVariant; origin_tag:Tgpointer):Tgboolean;cdecl;
      write_tree : function (backend:PGSettingsBackend; tree:PGTree; origin_tag:Tgpointer):Tgboolean;cdecl;
      reset : procedure (backend:PGSettingsBackend; key:Pgchar; origin_tag:Tgpointer);cdecl;
      subscribe : procedure (backend:PGSettingsBackend; name:Pgchar);cdecl;
      unsubscribe : procedure (backend:PGSettingsBackend; name:Pgchar);cdecl;
      sync : procedure (backend:PGSettingsBackend);cdecl;
      get_permission : function (backend:PGSettingsBackend; path:Pgchar):PGPermission;cdecl;
      read_user_value : function (backend:PGSettingsBackend; key:Pgchar; expected_type:PGVariantType):PGVariant;cdecl;
      padding : array[0..22] of Tgpointer;
    end;

{< private > }
  PGSettingsBackend = ^TGSettingsBackend;
  TGSettingsBackend = record
      parent_instance : TGObject;
      priv : PGSettingsBackendPrivate;
    end;


function g_settings_backend_get_type:TGType;cdecl;external;
(* Const before type ignored *)
procedure g_settings_backend_changed(backend:PGSettingsBackend; key:Pgchar; origin_tag:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure g_settings_backend_path_changed(backend:PGSettingsBackend; path:Pgchar; origin_tag:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure g_settings_backend_flatten_tree(tree:PGTree; path:PPgchar; keys:PPPgchar; values:PPPGVariant);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before declarator ignored *)
procedure g_settings_backend_keys_changed(backend:PGSettingsBackend; path:Pgchar; items:PPgchar; origin_tag:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure g_settings_backend_path_writable_changed(backend:PGSettingsBackend; path:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_settings_backend_writable_changed(backend:PGSettingsBackend; key:Pgchar);cdecl;external;
procedure g_settings_backend_changed_tree(backend:PGSettingsBackend; tree:PGTree; origin_tag:Tgpointer);cdecl;external;
function g_settings_backend_get_default:PGSettingsBackend;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_keyfile_settings_backend_new(filename:Pgchar; root_path:Pgchar; root_group:Pgchar):PGSettingsBackend;cdecl;external;
function g_null_settings_backend_new:PGSettingsBackend;cdecl;external;
function g_memory_settings_backend_new:PGSettingsBackend;cdecl;external;
{$endif}
{ __G_SETTINGS_BACKEND_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SETTINGS_BACKEND : longint; { return type might be wrong }
  begin
    G_TYPE_SETTINGS_BACKEND:=g_settings_backend_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SETTINGS_BACKEND(inst : longint) : longint;
begin
  G_SETTINGS_BACKEND:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_SETTINGS_BACKEND,GSettingsBackend);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SETTINGS_BACKEND_CLASS(_class : longint) : longint;
begin
  G_SETTINGS_BACKEND_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_SETTINGS_BACKEND,GSettingsBackendClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SETTINGS_BACKEND(inst : longint) : longint;
begin
  G_IS_SETTINGS_BACKEND:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_SETTINGS_BACKEND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SETTINGS_BACKEND_CLASS(_class : longint) : longint;
begin
  G_IS_SETTINGS_BACKEND_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_SETTINGS_BACKEND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SETTINGS_BACKEND_GET_CLASS(inst : longint) : longint;
begin
  G_SETTINGS_BACKEND_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_SETTINGS_BACKEND,GSettingsBackendClass);
end;


end.
