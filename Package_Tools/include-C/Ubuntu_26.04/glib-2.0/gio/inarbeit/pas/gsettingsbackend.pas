unit gsettingsbackend;

interface

uses
  fp_glib2;

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


function g_settings_backend_get_type:TGType;cdecl;external libgio2;
procedure g_settings_backend_changed(backend:PGSettingsBackend; key:Pgchar; origin_tag:Tgpointer);cdecl;external libgio2;
procedure g_settings_backend_path_changed(backend:PGSettingsBackend; path:Pgchar; origin_tag:Tgpointer);cdecl;external libgio2;
procedure g_settings_backend_flatten_tree(tree:PGTree; path:PPgchar; keys:PPPgchar; values:PPPGVariant);cdecl;external libgio2;
procedure g_settings_backend_keys_changed(backend:PGSettingsBackend; path:Pgchar; items:PPgchar; origin_tag:Tgpointer);cdecl;external libgio2;
procedure g_settings_backend_path_writable_changed(backend:PGSettingsBackend; path:Pgchar);cdecl;external libgio2;
procedure g_settings_backend_writable_changed(backend:PGSettingsBackend; key:Pgchar);cdecl;external libgio2;
procedure g_settings_backend_changed_tree(backend:PGSettingsBackend; tree:PGTree; origin_tag:Tgpointer);cdecl;external libgio2;
function g_settings_backend_get_default:PGSettingsBackend;cdecl;external libgio2;
function g_keyfile_settings_backend_new(filename:Pgchar; root_path:Pgchar; root_group:Pgchar):PGSettingsBackend;cdecl;external libgio2;
function g_null_settings_backend_new:PGSettingsBackend;cdecl;external libgio2;
function g_memory_settings_backend_new:PGSettingsBackend;cdecl;external libgio2;
{$endif}
{ __G_SETTINGS_BACKEND_H__  }

// === Konventiert am: 26-6-26 19:52:26 ===

function G_TYPE_SETTINGS_BACKEND : TGType;
function G_SETTINGS_BACKEND(obj : Pointer) : PGSettingsBackend;
function G_SETTINGS_BACKEND_CLASS(klass : Pointer) : PGSettingsBackendClass;
function G_IS_SETTINGS_BACKEND(obj : Pointer) : Tgboolean;
function G_IS_SETTINGS_BACKEND_CLASS(klass : Pointer) : Tgboolean;
function G_SETTINGS_BACKEND_GET_CLASS(obj : Pointer) : PGSettingsBackendClass;

implementation

function G_TYPE_SETTINGS_BACKEND : TGType;
  begin
    G_TYPE_SETTINGS_BACKEND:=g_settings_backend_get_type;
  end;

function G_SETTINGS_BACKEND(obj : Pointer) : PGSettingsBackend;
begin
  Result := PGSettingsBackend(g_type_check_instance_cast(obj, G_TYPE_SETTINGS_BACKEND));
end;

function G_SETTINGS_BACKEND_CLASS(klass : Pointer) : PGSettingsBackendClass;
begin
  Result := PGSettingsBackendClass(g_type_check_class_cast(klass, G_TYPE_SETTINGS_BACKEND));
end;

function G_IS_SETTINGS_BACKEND(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_SETTINGS_BACKEND);
end;

function G_IS_SETTINGS_BACKEND_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_SETTINGS_BACKEND);
end;

function G_SETTINGS_BACKEND_GET_CLASS(obj : Pointer) : PGSettingsBackendClass;
begin
  Result := PGSettingsBackendClass(PGTypeInstance(obj)^.g_class);
end;



end.
