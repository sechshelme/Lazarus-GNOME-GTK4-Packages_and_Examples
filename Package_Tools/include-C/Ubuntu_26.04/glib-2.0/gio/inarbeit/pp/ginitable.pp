
unit ginitable;
interface

{
  Automatically converted by H2Pas 1.0.0 from ginitable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ginitable.h
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
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGInitable  = ^GInitable;
PGInitableIface  = ^GInitableIface;
PGObject  = ^GObject;
PGParameter  = ^GParameter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2009 Red Hat, Inc.
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
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_INITABLE_H__}
{$define __G_INITABLE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_INITABLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INITABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INITABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INITABLE_GET_IFACE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_INITABLE(_type : longint) : longint;

type
{*
 * GInitableIface:
 * @g_iface: The parent interface.
 * @init: Initializes the object.
 *
 * Provides an interface for initializing object such that initialization
 * may fail.
 *
 * Since: 2.22
 * }
{ Virtual Table  }
  PGInitableIface = ^TGInitableIface;
  TGInitableIface = record
      g_iface : TGTypeInterface;
      init : function (initable:PGInitable; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
    end;


function g_initable_get_type:TGType;cdecl;external;
function g_initable_init(initable:PGInitable; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_initable_new(object_type:TGType; cancellable:PGCancellable; error:PPGError; first_property_name:Pgchar; args:array of const):Tgpointer;cdecl;external;
function g_initable_new(object_type:TGType; cancellable:PGCancellable; error:PPGError; first_property_name:Pgchar):Tgpointer;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_54_FOR(g_object_new_with_properties and g_initable_init) }
function g_initable_newv(object_type:TGType; n_parameters:Tguint; parameters:PGParameter; cancellable:PGCancellable; error:PPGError):Tgpointer;cdecl;external;
(* Const before type ignored *)
function g_initable_new_valist(object_type:TGType; first_property_name:Pgchar; var_args:Tva_list; cancellable:PGCancellable; error:PPGError):PGObject;cdecl;external;
{$endif}
{ __G_INITABLE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_INITABLE : longint; { return type might be wrong }
  begin
    G_TYPE_INITABLE:=g_initable_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INITABLE(obj : longint) : longint;
begin
  G_INITABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_INITABLE,GInitable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INITABLE(obj : longint) : longint;
begin
  G_IS_INITABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_INITABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INITABLE_GET_IFACE(obj : longint) : longint;
begin
  G_INITABLE_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_INITABLE,GInitableIface);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_INITABLE(_type : longint) : longint;
begin
  G_TYPE_IS_INITABLE:=g_type_is_a(_type,G_TYPE_INITABLE);
end;


end.
