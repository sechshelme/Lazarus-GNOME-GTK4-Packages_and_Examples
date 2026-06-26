
unit gsimpleasyncresult;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsimpleasyncresult.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsimpleasyncresult.h
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
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGObject  = ^GObject;
PGSimpleAsyncResult  = ^GSimpleAsyncResult;
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
{$ifndef __G_SIMPLE_ASYNC_RESULT_H__}
{$define __G_SIMPLE_ASYNC_RESULT_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_SIMPLE_ASYNC_RESULT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_ASYNC_RESULT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_ASYNC_RESULT_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SIMPLE_ASYNC_RESULT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SIMPLE_ASYNC_RESULT_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_ASYNC_RESULT_GET_CLASS(o : longint) : longint;

type

function g_simple_async_result_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46_FOR(g_task_new) }
function g_simple_async_result_new(source_object:PGObject; callback:TGAsyncReadyCallback; user_data:Tgpointer; source_tag:Tgpointer):PGSimpleAsyncResult;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46_FOR(g_task_new) }
(* Const before type ignored *)
function g_simple_async_result_new_error(source_object:PGObject; callback:TGAsyncReadyCallback; user_data:Tgpointer; domain:TGQuark; code:Tgint; 
           format:Pchar; args:array of const):PGSimpleAsyncResult;cdecl;external;
function g_simple_async_result_new_error(source_object:PGObject; callback:TGAsyncReadyCallback; user_data:Tgpointer; domain:TGQuark; code:Tgint; 
           format:Pchar):PGSimpleAsyncResult;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46_FOR(g_task_new) }
(* Const before type ignored *)
function g_simple_async_result_new_from_error(source_object:PGObject; callback:TGAsyncReadyCallback; user_data:Tgpointer; error:PGError):PGSimpleAsyncResult;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46_FOR(g_task_new) }
function g_simple_async_result_new_take_error(source_object:PGObject; callback:TGAsyncReadyCallback; user_data:Tgpointer; error:PGError):PGSimpleAsyncResult;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
procedure g_simple_async_result_set_op_res_gpointer(simple:PGSimpleAsyncResult; op_res:Tgpointer; destroy_op_res:TGDestroyNotify);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
function g_simple_async_result_get_op_res_gpointer(simple:PGSimpleAsyncResult):Tgpointer;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
procedure g_simple_async_result_set_op_res_gssize(simple:PGSimpleAsyncResult; op_res:Tgssize);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
function g_simple_async_result_get_op_res_gssize(simple:PGSimpleAsyncResult):Tgssize;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
procedure g_simple_async_result_set_op_res_gboolean(simple:PGSimpleAsyncResult; op_res:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
function g_simple_async_result_get_op_res_gboolean(simple:PGSimpleAsyncResult):Tgboolean;cdecl;external;
{ Also deprecated, but can't mark something both AVAILABLE and DEPRECATED  }
procedure g_simple_async_result_set_check_cancellable(simple:PGSimpleAsyncResult; check_cancellable:PGCancellable);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
function g_simple_async_result_get_source_tag(simple:PGSimpleAsyncResult):Tgpointer;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
procedure g_simple_async_result_set_handle_cancellation(simple:PGSimpleAsyncResult; handle_cancellation:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
procedure g_simple_async_result_complete(simple:PGSimpleAsyncResult);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
procedure g_simple_async_result_complete_in_idle(simple:PGSimpleAsyncResult);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
procedure g_simple_async_result_run_in_thread(simple:PGSimpleAsyncResult; func:TGSimpleAsyncThreadFunc; io_priority:longint; cancellable:PGCancellable);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
(* Const before type ignored *)
procedure g_simple_async_result_set_from_error(simple:PGSimpleAsyncResult; error:PGError);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
procedure g_simple_async_result_take_error(simple:PGSimpleAsyncResult; error:PGError);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
function g_simple_async_result_propagate_error(simple:PGSimpleAsyncResult; dest:PPGError):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
(* Const before type ignored *)
procedure g_simple_async_result_set_error(simple:PGSimpleAsyncResult; domain:TGQuark; code:Tgint; format:Pchar; args:array of const);cdecl;external;
procedure g_simple_async_result_set_error(simple:PGSimpleAsyncResult; domain:TGQuark; code:Tgint; format:Pchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
(* Const before type ignored *)
procedure g_simple_async_result_set_error_va(simple:PGSimpleAsyncResult; domain:TGQuark; code:Tgint; format:Pchar; args:Tva_list);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46 }
function g_simple_async_result_is_valid(result:PGAsyncResult; source:PGObject; source_tag:Tgpointer):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46_FOR(g_task_report_error) }
(* Const before type ignored *)
procedure g_simple_async_report_error_in_idle(object:PGObject; callback:TGAsyncReadyCallback; user_data:Tgpointer; domain:TGQuark; code:Tgint; 
            format:Pchar; args:array of const);cdecl;external;
procedure g_simple_async_report_error_in_idle(object:PGObject; callback:TGAsyncReadyCallback; user_data:Tgpointer; domain:TGQuark; code:Tgint; 
            format:Pchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46_FOR(g_task_report_error) }
(* Const before type ignored *)
procedure g_simple_async_report_gerror_in_idle(object:PGObject; callback:TGAsyncReadyCallback; user_data:Tgpointer; error:PGError);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_46_FOR(g_task_report_error) }
procedure g_simple_async_report_take_gerror_in_idle(object:PGObject; callback:TGAsyncReadyCallback; user_data:Tgpointer; error:PGError);cdecl;external;
{$endif}
{ __G_SIMPLE_ASYNC_RESULT_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SIMPLE_ASYNC_RESULT : longint; { return type might be wrong }
  begin
    G_TYPE_SIMPLE_ASYNC_RESULT:=g_simple_async_result_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_ASYNC_RESULT(o : longint) : longint;
begin
  G_SIMPLE_ASYNC_RESULT:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_SIMPLE_ASYNC_RESULT,GSimpleAsyncResult);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_ASYNC_RESULT_CLASS(k : longint) : longint;
begin
  G_SIMPLE_ASYNC_RESULT_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_SIMPLE_ASYNC_RESULT,GSimpleAsyncResultClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SIMPLE_ASYNC_RESULT(o : longint) : longint;
begin
  G_IS_SIMPLE_ASYNC_RESULT:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_SIMPLE_ASYNC_RESULT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SIMPLE_ASYNC_RESULT_CLASS(k : longint) : longint;
begin
  G_IS_SIMPLE_ASYNC_RESULT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_SIMPLE_ASYNC_RESULT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_ASYNC_RESULT_GET_CLASS(o : longint) : longint;
begin
  G_SIMPLE_ASYNC_RESULT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_SIMPLE_ASYNC_RESULT,GSimpleAsyncResultClass);
end;


end.
