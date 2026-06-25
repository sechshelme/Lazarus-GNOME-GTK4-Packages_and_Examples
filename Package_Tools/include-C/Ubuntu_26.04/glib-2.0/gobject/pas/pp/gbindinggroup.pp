
unit gbindinggroup;
interface

{
  Automatically converted by H2Pas 1.0.0 from gbindinggroup.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gbindinggroup.h
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
PGBindingGroup  = ^GBindingGroup;
Pgchar  = ^gchar;
PGClosure  = ^GClosure;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GObject - GLib Type, Object, Parameter and Signal Library
 *
 * Copyright (C) 2015-2022 Christian Hergert <christian@hergert.me>
 * Copyright (C) 2015 Garrett Regier <garrettregier@gmail.com>
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
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
{$ifndef __G_BINDING_GROUP_H__}
{$define __G_BINDING_GROUP_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include <glib.h>}
{$include <gobject/gobject.h>}
{$include <gobject/gbinding.h>}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_BINDING_GROUP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_BINDING_GROUP(obj : longint) : longint;

{ was #define dname def_expr }
function G_TYPE_BINDING_GROUP : longint; { return type might be wrong }

type

function g_binding_group_get_type:TGType;cdecl;external;
function g_binding_group_new:PGBindingGroup;cdecl;external;
function g_binding_group_dup_source(self:PGBindingGroup):Tgpointer;cdecl;external;
procedure g_binding_group_set_source(self:PGBindingGroup; source:Tgpointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_binding_group_bind(self:PGBindingGroup; source_property:Pgchar; target:Tgpointer; target_property:Pgchar; flags:TGBindingFlags);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_binding_group_bind_full(self:PGBindingGroup; source_property:Pgchar; target:Tgpointer; target_property:Pgchar; flags:TGBindingFlags; 
            transform_to:TGBindingTransformFunc; transform_from:TGBindingTransformFunc; user_data:Tgpointer; user_data_destroy:TGDestroyNotify);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_binding_group_bind_with_closures(self:PGBindingGroup; source_property:Pgchar; target:Tgpointer; target_property:Pgchar; flags:TGBindingFlags; 
            transform_to:PGClosure; transform_from:PGClosure);cdecl;external;
{$endif}
{ __G_BINDING_GROUP_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_BINDING_GROUP(obj : longint) : longint;
begin
  G_BINDING_GROUP:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_BINDING_GROUP,GBindingGroup);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_BINDING_GROUP(obj : longint) : longint;
begin
  G_IS_BINDING_GROUP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_BINDING_GROUP);
end;

{ was #define dname def_expr }
function G_TYPE_BINDING_GROUP : longint; { return type might be wrong }
  begin
    G_TYPE_BINDING_GROUP:=g_binding_group_get_type;
  end;


end.
