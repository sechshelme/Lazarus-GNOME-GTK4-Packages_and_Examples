unit gpropertyaction;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2013 Canonical Limited
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
{$ifndef __G_PROPERTY_ACTION_H__}
{$define __G_PROPERTY_ACTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

function g_property_action_get_type:TGType;cdecl;external libgio2;
function g_property_action_new(name:Pgchar; object:Tgpointer; property_name:Pgchar):PGPropertyAction;cdecl;external libgio2;
{$endif}
{ __G_PROPERTY_ACTION_H__  }

// === Konventiert am: 26-6-26 19:48:32 ===

function G_TYPE_PROPERTY_ACTION : TGType;
function G_PROPERTY_ACTION(obj : Pointer) : PGPropertyAction;
function G_IS_PROPERTY_ACTION(obj : Pointer) : Tgboolean;

implementation

function G_TYPE_PROPERTY_ACTION : TGType;
  begin
    G_TYPE_PROPERTY_ACTION:=g_property_action_get_type;
  end;

function G_PROPERTY_ACTION(obj : Pointer) : PGPropertyAction;
begin
  Result := PGPropertyAction(g_type_check_instance_cast(obj, G_TYPE_PROPERTY_ACTION));
end;

function G_IS_PROPERTY_ACTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_PROPERTY_ACTION);
end;



end.
