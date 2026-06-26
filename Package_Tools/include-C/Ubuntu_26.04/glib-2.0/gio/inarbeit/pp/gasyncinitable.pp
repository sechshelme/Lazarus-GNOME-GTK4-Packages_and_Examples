
unit gasyncinitable;
interface

{
  Automatically converted by H2Pas 1.0.0 from gasyncinitable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gasyncinitable.h
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
PGAsyncInitable  = ^GAsyncInitable;
PGAsyncInitableIface  = ^GAsyncInitableIface;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
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
{$ifndef __G_ASYNC_INITABLE_H__}
{$define __G_ASYNC_INITABLE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{$include <gio/ginitable.h>}

{ was #define dname def_expr }
function G_TYPE_ASYNC_INITABLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ASYNC_INITABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ASYNC_INITABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ASYNC_INITABLE_GET_IFACE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_ASYNC_INITABLE(_type : longint) : longint;

type
{*
 * GAsyncInitableIface:
 * @g_iface: The parent interface.
 * @init_async: Starts initialization of the object.
 * @init_finish: Finishes initialization of the object.
 *
 * Provides an interface for asynchronous initializing object such that
 * initialization may fail.
 *
 * Since: 2.22
 * }
{ Virtual Table  }
  PGAsyncInitableIface = ^TGAsyncInitableIface;
  TGAsyncInitableIface = record
      g_iface : TGTypeInterface;
      init_async : procedure (initable:PGAsyncInitable; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      init_finish : function (initable:PGAsyncInitable; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
    end;


function g_async_initable_get_type:TGType;cdecl;external;
procedure g_async_initable_init_async(initable:PGAsyncInitable; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_async_initable_init_finish(initable:PGAsyncInitable; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure g_async_initable_new_async(object_type:TGType; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer; 
            first_property_name:Pgchar; args:array of const);cdecl;external;
procedure g_async_initable_new_async(object_type:TGType; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer; 
            first_property_name:Pgchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_54_FOR(g_object_new_with_properties and g_async_initable_init_async) }
procedure g_async_initable_newv_async(object_type:TGType; n_parameters:Tguint; parameters:PGParameter; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure g_async_initable_new_valist_async(object_type:TGType; first_property_name:Pgchar; var_args:Tva_list; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_async_initable_new_finish(initable:PGAsyncInitable; res:PGAsyncResult; error:PPGError):PGObject;cdecl;external;
{$endif}
{ __G_ASYNC_INITABLE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_ASYNC_INITABLE : longint; { return type might be wrong }
  begin
    G_TYPE_ASYNC_INITABLE:=g_async_initable_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ASYNC_INITABLE(obj : longint) : longint;
begin
  G_ASYNC_INITABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_ASYNC_INITABLE,GAsyncInitable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ASYNC_INITABLE(obj : longint) : longint;
begin
  G_IS_ASYNC_INITABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_ASYNC_INITABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ASYNC_INITABLE_GET_IFACE(obj : longint) : longint;
begin
  G_ASYNC_INITABLE_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_ASYNC_INITABLE,GAsyncInitableIface);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_ASYNC_INITABLE(_type : longint) : longint;
begin
  G_TYPE_IS_ASYNC_INITABLE:=g_type_is_a(_type,G_TYPE_ASYNC_INITABLE);
end;


end.
