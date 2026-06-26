
unit gasyncresult;
interface

{
  Automatically converted by H2Pas 1.0.0 from gasyncresult.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gasyncresult.h
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
PGAsyncResult  = ^GAsyncResult;
PGAsyncResultIface  = ^GAsyncResultIface;
PGError  = ^GError;
PGObject  = ^GObject;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
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
{$ifndef __G_ASYNC_RESULT_H__}
{$define __G_ASYNC_RESULT_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_ASYNC_RESULT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ASYNC_RESULT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ASYNC_RESULT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ASYNC_RESULT_GET_IFACE(obj : longint) : longint;

type
{*
 * GAsyncResultIface:
 * @g_iface: The parent interface.
 * @get_user_data: Gets the user data passed to the callback.
 * @get_source_object: Gets the source object that issued the asynchronous operation.
 * @is_tagged: Checks if a result is tagged with a particular source.
 *
 * Interface definition for [iface@Gio.AsyncResult].
 * }
{ Virtual Table  }
  PGAsyncResultIface = ^TGAsyncResultIface;
  TGAsyncResultIface = record
      g_iface : TGTypeInterface;
      get_user_data : function (res:PGAsyncResult):Tgpointer;cdecl;
      get_source_object : function (res:PGAsyncResult):PGObject;cdecl;
      is_tagged : function (res:PGAsyncResult; source_tag:Tgpointer):Tgboolean;cdecl;
    end;


function g_async_result_get_type:TGType;cdecl;external;
function g_async_result_get_user_data(res:PGAsyncResult):Tgpointer;cdecl;external;
function g_async_result_get_source_object(res:PGAsyncResult):PGObject;cdecl;external;
function g_async_result_legacy_propagate_error(res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_async_result_is_tagged(res:PGAsyncResult; source_tag:Tgpointer):Tgboolean;cdecl;external;
{$endif}
{ __G_ASYNC_RESULT_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_ASYNC_RESULT : longint; { return type might be wrong }
  begin
    G_TYPE_ASYNC_RESULT:=g_async_result_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ASYNC_RESULT(obj : longint) : longint;
begin
  G_ASYNC_RESULT:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_ASYNC_RESULT,GAsyncResult);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ASYNC_RESULT(obj : longint) : longint;
begin
  G_IS_ASYNC_RESULT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_ASYNC_RESULT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ASYNC_RESULT_GET_IFACE(obj : longint) : longint;
begin
  G_ASYNC_RESULT_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_ASYNC_RESULT,GAsyncResultIface);
end;


end.
