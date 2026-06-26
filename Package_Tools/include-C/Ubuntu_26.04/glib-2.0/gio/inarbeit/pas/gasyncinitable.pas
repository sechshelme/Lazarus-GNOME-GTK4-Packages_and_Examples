unit gasyncinitable;

interface

uses
  fp_glib2;

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


function g_async_initable_get_type:TGType;cdecl;external libgio2;
procedure g_async_initable_init_async(initable:PGAsyncInitable; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_async_initable_init_finish(initable:PGAsyncInitable; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libgio2;
procedure g_async_initable_new_async(object_type:TGType; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer; 
            first_property_name:Pgchar; args:array of const);cdecl;external libgio2;
procedure g_async_initable_new_async(object_type:TGType; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer; 
            first_property_name:Pgchar);cdecl;external libgio2;
{xxxxxGLIB_DEPRECATED_IN_2_54_FOR(g_object_new_with_properties and g_async_initable_init_async) }
procedure g_async_initable_newv_async(object_type:TGType; n_parameters:Tguint; parameters:PGParameter; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
procedure g_async_initable_new_valist_async(object_type:TGType; first_property_name:Pgchar; var_args:Tva_list; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_async_initable_new_finish(initable:PGAsyncInitable; res:PGAsyncResult; error:PPGError):PGObject;cdecl;external libgio2;
{$endif}
{ __G_ASYNC_INITABLE_H__  }

// === Konventiert am: 26-6-26 16:27:47 ===

function G_TYPE_ASYNC_INITABLE : TGType;
function G_ASYNC_INITABLE(obj : Pointer) : PGAsyncInitable;
function G_IS_ASYNC_INITABLE(obj : Pointer) : Tgboolean;
function G_ASYNC_INITABLE_GET_IFACE(obj : Pointer) : PGAsyncInitableIface;

implementation

function G_TYPE_ASYNC_INITABLE : TGType;
  begin
    G_TYPE_ASYNC_INITABLE:=g_async_initable_get_type;
  end;

function G_ASYNC_INITABLE(obj : Pointer) : PGAsyncInitable;
begin
  Result := PGAsyncInitable(g_type_check_instance_cast(obj, G_TYPE_ASYNC_INITABLE));
end;

function G_IS_ASYNC_INITABLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_ASYNC_INITABLE);
end;

function G_ASYNC_INITABLE_GET_IFACE(obj : Pointer) : PGAsyncInitableIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_ASYNC_INITABLE);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_ASYNC_INITABLE(_type : longint) : longint;
begin
  G_TYPE_IS_ASYNC_INITABLE:=g_type_is_a(_type,G_TYPE_ASYNC_INITABLE);
end;


end.
