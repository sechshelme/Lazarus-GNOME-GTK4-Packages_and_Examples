unit gsimpleactiongroup;

interface

uses
  fp_glib2;

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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_SIMPLE_ACTION_GROUP_H__}
{$define __G_SIMPLE_ACTION_GROUP_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include "gactiongroup.h"}
{$include "gactionmap.h"}

type
{< private > }
  PGSimpleActionGroup = ^TGSimpleActionGroup;
  TGSimpleActionGroup = record
      parent_instance : TGObject;
      priv : PGSimpleActionGroupPrivate;
    end;

{< private > }
{< private > }
  PGSimpleActionGroupClass = ^TGSimpleActionGroupClass;
  TGSimpleActionGroupClass = record
      parent_class : TGObjectClass;
      padding : array[0..11] of Tgpointer;
    end;


function g_simple_action_group_get_type:TGType;cdecl;external libgio2;
function g_simple_action_group_new:PGSimpleActionGroup;cdecl;external libgio2;
{xxxxxGLIB_DEPRECATED_IN_2_38_FOR (g_action_map_lookup_action) }
function g_simple_action_group_lookup(simple:PGSimpleActionGroup; action_name:Pgchar):PGAction;cdecl;external libgio2;
{xxxxxGLIB_DEPRECATED_IN_2_38_FOR (g_action_map_add_action) }
procedure g_simple_action_group_insert(simple:PGSimpleActionGroup; action:PGAction);cdecl;external libgio2;
{xxxxxGLIB_DEPRECATED_IN_2_38_FOR (g_action_map_remove_action) }
procedure g_simple_action_group_remove(simple:PGSimpleActionGroup; action_name:Pgchar);cdecl;external libgio2;
{xxxxxGLIB_DEPRECATED_IN_2_38_FOR (g_action_map_add_action_entries) }
procedure g_simple_action_group_add_entries(simple:PGSimpleActionGroup; entries:PGActionEntry; n_entries:Tgint; user_data:Tgpointer);cdecl;external libgio2;
{$endif}
{ __G_SIMPLE_ACTION_GROUP_H__  }

// === Konventiert am: 26-6-26 19:51:58 ===

function G_TYPE_SIMPLE_ACTION_GROUP : TGType;
function G_SIMPLE_ACTION_GROUP(obj : Pointer) : PGSimpleActionGroup;
function G_SIMPLE_ACTION_GROUP_CLASS(klass : Pointer) : PGSimpleActionGroupClass;
function G_IS_SIMPLE_ACTION_GROUP(obj : Pointer) : Tgboolean;
function G_IS_SIMPLE_ACTION_GROUP_CLASS(klass : Pointer) : Tgboolean;
function G_SIMPLE_ACTION_GROUP_GET_CLASS(obj : Pointer) : PGSimpleActionGroupClass;

implementation

function G_TYPE_SIMPLE_ACTION_GROUP : TGType;
  begin
    G_TYPE_SIMPLE_ACTION_GROUP:=g_simple_action_group_get_type;
  end;

function G_SIMPLE_ACTION_GROUP(obj : Pointer) : PGSimpleActionGroup;
begin
  Result := PGSimpleActionGroup(g_type_check_instance_cast(obj, G_TYPE_SIMPLE_ACTION_GROUP));
end;

function G_SIMPLE_ACTION_GROUP_CLASS(klass : Pointer) : PGSimpleActionGroupClass;
begin
  Result := PGSimpleActionGroupClass(g_type_check_class_cast(klass, G_TYPE_SIMPLE_ACTION_GROUP));
end;

function G_IS_SIMPLE_ACTION_GROUP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_SIMPLE_ACTION_GROUP);
end;

function G_IS_SIMPLE_ACTION_GROUP_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_SIMPLE_ACTION_GROUP);
end;

function G_SIMPLE_ACTION_GROUP_GET_CLASS(obj : Pointer) : PGSimpleActionGroupClass;
begin
  Result := PGSimpleActionGroupClass(PGTypeInstance(obj)^.g_class);
end;



end.
