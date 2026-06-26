unit gsimpleaction;

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
{$ifndef __G_SIMPLE_ACTION_H__}
{$define __G_SIMPLE_ACTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

function g_simple_action_get_type:TGType;cdecl;external libgio2;
function g_simple_action_new(name:Pgchar; parameter_type:PGVariantType):PGSimpleAction;cdecl;external libgio2;
function g_simple_action_new_stateful(name:Pgchar; parameter_type:PGVariantType; state:PGVariant):PGSimpleAction;cdecl;external libgio2;
procedure g_simple_action_set_enabled(simple:PGSimpleAction; enabled:Tgboolean);cdecl;external libgio2;
procedure g_simple_action_set_state(simple:PGSimpleAction; value:PGVariant);cdecl;external libgio2;
procedure g_simple_action_set_state_hint(simple:PGSimpleAction; state_hint:PGVariant);cdecl;external libgio2;
{$endif}
{ __G_SIMPLE_ACTION_H__  }

// === Konventiert am: 26-6-26 19:52:07 ===

function G_TYPE_SIMPLE_ACTION : TGType;
function G_SIMPLE_ACTION(obj : Pointer) : PGSimpleAction;
function G_IS_SIMPLE_ACTION(obj : Pointer) : Tgboolean;

implementation

function G_TYPE_SIMPLE_ACTION : TGType;
  begin
    G_TYPE_SIMPLE_ACTION:=g_simple_action_get_type;
  end;

function G_SIMPLE_ACTION(obj : Pointer) : PGSimpleAction;
begin
  Result := PGSimpleAction(g_type_check_instance_cast(obj, G_TYPE_SIMPLE_ACTION));
end;

function G_IS_SIMPLE_ACTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_SIMPLE_ACTION);
end;



end.
