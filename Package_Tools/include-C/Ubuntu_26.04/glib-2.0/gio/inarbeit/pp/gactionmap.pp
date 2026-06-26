
unit gactionmap;
interface

{
  Automatically converted by H2Pas 1.0.0 from gactionmap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gactionmap.h
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
PGAction  = ^GAction;
PGActionEntry  = ^GActionEntry;
PGActionMap  = ^GActionMap;
PGActionMapInterface  = ^GActionMapInterface;
Pgchar  = ^gchar;
PGSimpleAction  = ^GSimpleAction;
PGVariant  = ^GVariant;
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
{$ifndef __G_ACTION_MAP_H__}
{$define __G_ACTION_MAP_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_ACTION_MAP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ACTION_MAP(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ACTION_MAP(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ACTION_MAP_GET_IFACE(inst : longint) : longint;

type
(* Const before type ignored *)
(* Const before type ignored *)
  PGActionMapInterface = ^TGActionMapInterface;
  TGActionMapInterface = record
      g_iface : TGTypeInterface;
      lookup_action : function (action_map:PGActionMap; action_name:Pgchar):PGAction;cdecl;
      add_action : procedure (action_map:PGActionMap; action:PGAction);cdecl;
      remove_action : procedure (action_map:PGActionMap; action_name:Pgchar);cdecl;
    end;

(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
  PGActionEntry = ^TGActionEntry;
  TGActionEntry = record
      name : Pgchar;
      activate : procedure (action:PGSimpleAction; parameter:PGVariant; user_data:Tgpointer);cdecl;
      parameter_type : Pgchar;
      state : Pgchar;
      change_state : procedure (action:PGSimpleAction; value:PGVariant; user_data:Tgpointer);cdecl;
      padding : array[0..2] of Tgsize;
    end;


function g_action_map_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_action_map_lookup_action(action_map:PGActionMap; action_name:Pgchar):PGAction;cdecl;external;
procedure g_action_map_add_action(action_map:PGActionMap; action:PGAction);cdecl;external;
(* Const before type ignored *)
procedure g_action_map_remove_action(action_map:PGActionMap; action_name:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_action_map_add_action_entries(action_map:PGActionMap; entries:PGActionEntry; n_entries:Tgint; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure g_action_map_remove_action_entries(action_map:PGActionMap; entries:PGActionEntry; n_entries:Tgint);cdecl;external;
{$endif}
{ __G_ACTION_MAP_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_ACTION_MAP : longint; { return type might be wrong }
  begin
    G_TYPE_ACTION_MAP:=g_action_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ACTION_MAP(inst : longint) : longint;
begin
  G_ACTION_MAP:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_ACTION_MAP,GActionMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ACTION_MAP(inst : longint) : longint;
begin
  G_IS_ACTION_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_ACTION_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ACTION_MAP_GET_IFACE(inst : longint) : longint;
begin
  G_ACTION_MAP_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,G_TYPE_ACTION_MAP,GActionMapInterface);
end;


end.
