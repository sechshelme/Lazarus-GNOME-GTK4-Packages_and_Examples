
unit gsignalgroup;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsignalgroup.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsignalgroup.h
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
PGClosure  = ^GClosure;
PGSignalGroup  = ^GSignalGroup;
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
{$ifndef __G_SIGNAL_GROUP_H__}
{$define __G_SIGNAL_GROUP_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include <glib.h>}
{$include <gobject/gobject.h>}
{$include <gobject/gsignal.h>}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_SIGNAL_GROUP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SIGNAL_GROUP(obj : longint) : longint;

{ was #define dname def_expr }
function G_TYPE_SIGNAL_GROUP : longint; { return type might be wrong }

type

function g_signal_group_get_type:TGType;cdecl;external;
function g_signal_group_new(target_type:TGType):PGSignalGroup;cdecl;external;
procedure g_signal_group_set_target(self:PGSignalGroup; target:Tgpointer);cdecl;external;
function g_signal_group_dup_target(self:PGSignalGroup):Tgpointer;cdecl;external;
procedure g_signal_group_block(self:PGSignalGroup);cdecl;external;
procedure g_signal_group_unblock(self:PGSignalGroup);cdecl;external;
(* Const before type ignored *)
procedure g_signal_group_connect_closure(self:PGSignalGroup; detailed_signal:Pgchar; closure:PGClosure; after:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure g_signal_group_connect_object(self:PGSignalGroup; detailed_signal:Pgchar; c_handler:TGCallback; object:Tgpointer; flags:TGConnectFlags);cdecl;external;
(* Const before type ignored *)
procedure g_signal_group_connect_data(self:PGSignalGroup; detailed_signal:Pgchar; c_handler:TGCallback; data:Tgpointer; notify:TGClosureNotify; 
            flags:TGConnectFlags);cdecl;external;
(* Const before type ignored *)
procedure g_signal_group_connect(self:PGSignalGroup; detailed_signal:Pgchar; c_handler:TGCallback; data:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure g_signal_group_connect_after(self:PGSignalGroup; detailed_signal:Pgchar; c_handler:TGCallback; data:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure g_signal_group_connect_swapped(self:PGSignalGroup; detailed_signal:Pgchar; c_handler:TGCallback; data:Tgpointer);cdecl;external;
{$endif}
{ __G_SIGNAL_GROUP_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIGNAL_GROUP(obj : longint) : longint;
begin
  G_SIGNAL_GROUP:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_SIGNAL_GROUP,GSignalGroup);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SIGNAL_GROUP(obj : longint) : longint;
begin
  G_IS_SIGNAL_GROUP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_SIGNAL_GROUP);
end;

{ was #define dname def_expr }
function G_TYPE_SIGNAL_GROUP : longint; { return type might be wrong }
  begin
    G_TYPE_SIGNAL_GROUP:=g_signal_group_get_type;
  end;


end.
