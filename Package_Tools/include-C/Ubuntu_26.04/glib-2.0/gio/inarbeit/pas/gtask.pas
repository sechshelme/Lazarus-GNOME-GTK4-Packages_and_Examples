unit gtask;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright 2011 Red Hat, Inc.
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
  }
{$ifndef __G_TASK_H__}
{$define __G_TASK_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type

function g_task_get_type:TGType;cdecl;external libgio2;
function g_task_new(source_object:Tgpointer; cancellable:PGCancellable; callback:TGAsyncReadyCallback; callback_data:Tgpointer):PGTask;cdecl;external libgio2;
procedure g_task_report_error(source_object:Tgpointer; callback:TGAsyncReadyCallback; callback_data:Tgpointer; source_tag:Tgpointer; error:PGError);cdecl;external libgio2;
procedure g_task_report_new_error(source_object:Tgpointer; callback:TGAsyncReadyCallback; callback_data:Tgpointer; source_tag:Tgpointer; domain:TGQuark; 
            code:Tgint; format:Pchar; args:array of const);cdecl;external libgio2;
procedure g_task_report_new_error(source_object:Tgpointer; callback:TGAsyncReadyCallback; callback_data:Tgpointer; source_tag:Tgpointer; domain:TGQuark; 
            code:Tgint; format:Pchar);cdecl;external libgio2;
procedure g_task_set_task_data(task:PGTask; task_data:Tgpointer; task_data_destroy:TGDestroyNotify);cdecl;external libgio2;
procedure g_task_set_priority(task:PGTask; priority:Tgint);cdecl;external libgio2;
procedure g_task_set_check_cancellable(task:PGTask; check_cancellable:Tgboolean);cdecl;external libgio2;
procedure g_task_set_source_tag(task:PGTask; source_tag:Tgpointer);cdecl;external libgio2;
procedure g_task_set_name(task:PGTask; name:Pgchar);cdecl;external libgio2;
procedure g_task_set_static_name(task:PGTask; name:Pgchar);cdecl;external libgio2;
function g_task_get_source_object(task:PGTask):Tgpointer;cdecl;external libgio2;
function g_task_get_task_data(task:PGTask):Tgpointer;cdecl;external libgio2;
function g_task_get_priority(task:PGTask):Tgint;cdecl;external libgio2;
function g_task_get_context(task:PGTask):PGMainContext;cdecl;external libgio2;
function g_task_get_cancellable(task:PGTask):PGCancellable;cdecl;external libgio2;
function g_task_get_check_cancellable(task:PGTask):Tgboolean;cdecl;external libgio2;
function g_task_get_source_tag(task:PGTask):Tgpointer;cdecl;external libgio2;
function g_task_get_name(task:PGTask):Pgchar;cdecl;external libgio2;
function g_task_is_valid(result:Tgpointer; source_object:Tgpointer):Tgboolean;cdecl;external libgio2;
type

  TGTaskThreadFunc = procedure (task:PGTask; source_object:Tgpointer; task_data:Tgpointer; cancellable:PGCancellable);cdecl;

procedure g_task_run_in_thread(task:PGTask; task_func:TGTaskThreadFunc);cdecl;external libgio2;
procedure g_task_run_in_thread_sync(task:PGTask; task_func:TGTaskThreadFunc);cdecl;external libgio2;
function g_task_set_return_on_cancel(task:PGTask; return_on_cancel:Tgboolean):Tgboolean;cdecl;external libgio2;
function g_task_get_return_on_cancel(task:PGTask):Tgboolean;cdecl;external libgio2;
procedure g_task_attach_source(task:PGTask; source:PGSource; callback:TGSourceFunc);cdecl;external libgio2;
procedure g_task_return_pointer(task:PGTask; result:Tgpointer; result_destroy:TGDestroyNotify);cdecl;external libgio2;
procedure g_task_return_boolean(task:PGTask; result:Tgboolean);cdecl;external libgio2;
procedure g_task_return_int(task:PGTask; result:Tgssize);cdecl;external libgio2;
procedure g_task_return_error(task:PGTask; error:PGError);cdecl;external libgio2;
procedure g_task_return_prefixed_error(task:PGTask; error:PGError; format:Pchar; args:array of const);cdecl;external libgio2;
procedure g_task_return_prefixed_error(task:PGTask; error:PGError; format:Pchar);cdecl;external libgio2;
procedure g_task_return_new_error(task:PGTask; domain:TGQuark; code:Tgint; format:Pchar; args:array of const);cdecl;external libgio2;
procedure g_task_return_new_error(task:PGTask; domain:TGQuark; code:Tgint; format:Pchar);cdecl;external libgio2;
procedure g_task_return_new_error_literal(task:PGTask; domain:TGQuark; code:Tgint; message:Pchar);cdecl;external libgio2;
procedure g_task_return_value(task:PGTask; result:PGValue);cdecl;external libgio2;
function g_task_return_error_if_cancelled(task:PGTask):Tgboolean;cdecl;external libgio2;
function g_task_propagate_pointer(task:PGTask; error:PPGError):Tgpointer;cdecl;external libgio2;
function g_task_propagate_boolean(task:PGTask; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_task_propagate_int(task:PGTask; error:PPGError):Tgssize;cdecl;external libgio2;
function g_task_propagate_value(task:PGTask; value:PGValue; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_task_had_error(task:PGTask):Tgboolean;cdecl;external libgio2;
function g_task_get_completed(task:PGTask):Tgboolean;cdecl;external libgio2;
{< private > }
{$ifndef __GTK_DOC_IGNORE__}
{$ifndef __GI_SCANNER__}
{ Debugging API, not part of the public API  }

procedure g_task_print_alive_tasks;cdecl;external libgio2;
{$endif}
{ !__GI_SCANNER__  }
{$endif}
{ !__GTK_DOC_IGNORE__  }
{$endif}
{ __G_TASK_H__  }

// === Konventiert am: 26-6-26 19:59:45 ===

function G_TYPE_TASK : TGType;
function G_TASK(obj : Pointer) : PGTask;
function G_TASK_CLASS(klass : Pointer) : PGTaskClass;
function G_IS_TASK(obj : Pointer) : Tgboolean;
function G_IS_TASK_CLASS(klass : Pointer) : Tgboolean;
function G_TASK_GET_CLASS(obj : Pointer) : PGTaskClass;

implementation

function G_TYPE_TASK : TGType;
  begin
    G_TYPE_TASK:=g_task_get_type;
  end;

function G_TASK(obj : Pointer) : PGTask;
begin
  Result := PGTask(g_type_check_instance_cast(obj, G_TYPE_TASK));
end;

function G_TASK_CLASS(klass : Pointer) : PGTaskClass;
begin
  Result := PGTaskClass(g_type_check_class_cast(klass, G_TYPE_TASK));
end;

function G_IS_TASK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_TASK);
end;

function G_IS_TASK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_TASK);
end;

function G_TASK_GET_CLASS(obj : Pointer) : PGTaskClass;
begin
  Result := PGTaskClass(PGTypeInstance(obj)^.g_class);
end;



end.
