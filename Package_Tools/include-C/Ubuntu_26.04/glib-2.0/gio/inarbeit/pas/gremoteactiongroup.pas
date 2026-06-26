unit gremoteactiongroup;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2011 Canonical Limited
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
{$ifndef __G_REMOTE_ACTION_GROUP_H__}
{$define __G_REMOTE_ACTION_GROUP_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
  PGRemoteActionGroupInterface = ^TGRemoteActionGroupInterface;
  TGRemoteActionGroupInterface = record
      g_iface : TGTypeInterface;
      activate_action_full : procedure (remote:PGRemoteActionGroup; action_name:Pgchar; parameter:PGVariant; platform_data:PGVariant);cdecl;
      change_action_state_full : procedure (remote:PGRemoteActionGroup; action_name:Pgchar; value:PGVariant; platform_data:PGVariant);cdecl;
    end;


function g_remote_action_group_get_type:TGType;cdecl;external libgio2;
procedure g_remote_action_group_activate_action_full(remote:PGRemoteActionGroup; action_name:Pgchar; parameter:PGVariant; platform_data:PGVariant);cdecl;external libgio2;
procedure g_remote_action_group_change_action_state_full(remote:PGRemoteActionGroup; action_name:Pgchar; value:PGVariant; platform_data:PGVariant);cdecl;external libgio2;
{$endif}
{ __G_REMOTE_ACTION_GROUP_H__  }

// === Konventiert am: 26-6-26 19:47:55 ===

function G_TYPE_REMOTE_ACTION_GROUP : TGType;
function G_REMOTE_ACTION_GROUP(obj : Pointer) : PGRemoteActionGroup;
function G_IS_REMOTE_ACTION_GROUP(obj : Pointer) : Tgboolean;
function G_REMOTE_ACTION_GROUP_GET_IFACE(obj : Pointer) : PGRemoteActionGroupInterface;

implementation

function G_TYPE_REMOTE_ACTION_GROUP : TGType;
  begin
    G_TYPE_REMOTE_ACTION_GROUP:=g_remote_action_group_get_type;
  end;

function G_REMOTE_ACTION_GROUP(obj : Pointer) : PGRemoteActionGroup;
begin
  Result := PGRemoteActionGroup(g_type_check_instance_cast(obj, G_TYPE_REMOTE_ACTION_GROUP));
end;

function G_IS_REMOTE_ACTION_GROUP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_REMOTE_ACTION_GROUP);
end;

function G_REMOTE_ACTION_GROUP_GET_IFACE(obj : Pointer) : PGRemoteActionGroupInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_REMOTE_ACTION_GROUP);
end;



end.
