
unit gsimpleaction;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsimpleaction.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsimpleaction.h
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
PGSimpleAction  = ^GSimpleAction;
PGVariant  = ^GVariant;
PGVariantType  = ^GVariantType;
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

{ was #define dname def_expr }
function G_TYPE_SIMPLE_ACTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_ACTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SIMPLE_ACTION(inst : longint) : longint;

function g_simple_action_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_simple_action_new(name:Pgchar; parameter_type:PGVariantType):PGSimpleAction;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_simple_action_new_stateful(name:Pgchar; parameter_type:PGVariantType; state:PGVariant):PGSimpleAction;cdecl;external;
procedure g_simple_action_set_enabled(simple:PGSimpleAction; enabled:Tgboolean);cdecl;external;
procedure g_simple_action_set_state(simple:PGSimpleAction; value:PGVariant);cdecl;external;
procedure g_simple_action_set_state_hint(simple:PGSimpleAction; state_hint:PGVariant);cdecl;external;
{$endif}
{ __G_SIMPLE_ACTION_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SIMPLE_ACTION : longint; { return type might be wrong }
  begin
    G_TYPE_SIMPLE_ACTION:=g_simple_action_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_ACTION(inst : longint) : longint;
begin
  G_SIMPLE_ACTION:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_SIMPLE_ACTION,GSimpleAction);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SIMPLE_ACTION(inst : longint) : longint;
begin
  G_IS_SIMPLE_ACTION:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_SIMPLE_ACTION);
end;


end.
