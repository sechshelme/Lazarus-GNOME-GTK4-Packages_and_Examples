
unit gsttask;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsttask.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttask
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
PGRecMutex  = ^GRecMutex;
PGstTask  = ^GstTask;
PGstTaskClass  = ^GstTaskClass;
PGstTaskPool  = ^GstTaskPool;
PGstTaskPrivate  = ^GstTaskPrivate;
PGstTaskState  = ^GstTaskState;
PGThread  = ^GThread;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <1999> Erik Walthinsen <omega@cse.ogi.edu>
 *               <2005> Wim Taymans <wim@fluendo.com>
 *
 * gsttask.h: Streaming tasks
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_TASK_H__}
{$define __GST_TASK_H__}
{$include <gst/gstobject.h>}
{$include <gst/gsttaskpool.h>}
{*
 * GstTaskFunction:
 * @user_data: user data passed to the function
 *
 * A function that will repeatedly be called in the thread created by
 * a #GstTask.
  }
type

  TGstTaskFunction = procedure (user_data:Tgpointer);cdecl;
{ --- standard type macros ---  }

{ was #define dname def_expr }
function GST_TYPE_TASK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK(task : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TASK(task : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_CLASS(tclass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TASK_CLASS(tclass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_GET_CLASS(task : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TASK_CAST(task : longint) : PGstTask;

type
{*
 * GstTaskState:
 * @GST_TASK_STARTED: the task is started and running
 * @GST_TASK_STOPPED: the task is stopped
 * @GST_TASK_PAUSED: the task is paused
 *
 * The different states a task can be in
  }

  PGstTaskState = ^TGstTaskState;
  TGstTaskState =  Longint;
  Const
    GST_TASK_STARTED = 0;
    GST_TASK_STOPPED = 1;
    GST_TASK_PAUSED = 2;
;
{*
 * GST_TASK_STATE:
 * @task: Task to get the state of
 *
 * Get access to the state of the task.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_TASK_STATE(task : longint) : longint;

{*
 * GST_TASK_GET_COND:
 * @task: Task to get the cond of
 *
 * Get access to the cond of the task.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_GET_COND(task : longint) : longint;

{*
 * GST_TASK_WAIT:
 * @task: Task to wait for
 *
 * Wait for the task cond to be signalled
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_WAIT(task : longint) : longint;

{*
 * GST_TASK_SIGNAL:
 * @task: Task to signal
 *
 * Signal the task cond
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_SIGNAL(task : longint) : longint;

{*
 * GST_TASK_BROADCAST:
 * @task: Task to broadcast
 *
 * Send a broadcast signal to all waiting task conds
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_BROADCAST(task : longint) : longint;

{*
 * GST_TASK_GET_LOCK:
 * @task: Task to get the lock of
 *
 * Get access to the task lock.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_GET_LOCK(task : longint) : longint;

{*
 * GstTaskThreadFunc:
 * @task: The #GstTask
 * @thread: The #GThread
 * @user_data: user data
 *
 * Custom GstTask thread callback functions that can be installed.
  }
type

  TGstTaskThreadFunc = procedure (task:PGstTask; thread:PGThread; user_data:Tgpointer);cdecl;
{*
 * GstTask:
 * @state: the state of the task
 * @cond: used to pause/resume the task
 * @lock: The lock taken when iterating the task function
 * @func: the function executed by this task
 * @user_data: user_data passed to the task function
 * @notify: GDestroyNotify for @user_data
 * @running: a flag indicating that the task is running
 *
 * The #GstTask object.
  }
{< public > }{ with LOCK  }
{< private > }
  PGstTask = ^TGstTask;
  TGstTask = record
      object : TGstObject;cdecl;
      state : TGstTaskState;
      cond : TGCond;
      lock : PGRecMutex;
      func : TGstTaskFunction;
      user_data : Tgpointer;
      notify : TGDestroyNotify;
      running : Tgboolean;
      thread : PGThread;
      priv : PGstTaskPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
{< private > }
  PGstTaskClass = ^TGstTaskClass;
  TGstTaskClass = record
      parent_class : TGstObjectClass;
      pool : PGstTaskPool;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


procedure gst_task_cleanup_all;cdecl;external;
function gst_task_get_type:TGType;cdecl;external;
function gst_task_new(func:TGstTaskFunction; user_data:Tgpointer; notify:TGDestroyNotify):PGstTask;cdecl;external;
procedure gst_task_set_lock(task:PGstTask; mutex:PGRecMutex);cdecl;external;
function gst_task_get_pool(task:PGstTask):PGstTaskPool;cdecl;external;
procedure gst_task_set_pool(task:PGstTask; pool:PGstTaskPool);cdecl;external;
procedure gst_task_set_enter_callback(task:PGstTask; enter_func:TGstTaskThreadFunc; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure gst_task_set_leave_callback(task:PGstTask; leave_func:TGstTaskThreadFunc; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
function gst_task_get_state(task:PGstTask):TGstTaskState;cdecl;external;
function gst_task_set_state(task:PGstTask; state:TGstTaskState):Tgboolean;cdecl;external;
function gst_task_start(task:PGstTask):Tgboolean;cdecl;external;
function gst_task_stop(task:PGstTask):Tgboolean;cdecl;external;
function gst_task_pause(task:PGstTask):Tgboolean;cdecl;external;
function gst_task_resume(task:PGstTask):Tgboolean;cdecl;external;
function gst_task_join(task:PGstTask):Tgboolean;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstTask, gst_object_unref) }
{$endif}
{ __GST_TASK_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_TASK : longint; { return type might be wrong }
  begin
    GST_TYPE_TASK:=gst_task_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK(task : longint) : longint;
begin
  GST_TASK:=G_TYPE_CHECK_INSTANCE_CAST(task,GST_TYPE_TASK,GstTask);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TASK(task : longint) : longint;
begin
  GST_IS_TASK:=G_TYPE_CHECK_INSTANCE_TYPE(task,GST_TYPE_TASK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_CLASS(tclass : longint) : longint;
begin
  GST_TASK_CLASS:=G_TYPE_CHECK_CLASS_CAST(tclass,GST_TYPE_TASK,GstTaskClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TASK_CLASS(tclass : longint) : longint;
begin
  GST_IS_TASK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(tclass,GST_TYPE_TASK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_GET_CLASS(task : longint) : longint;
begin
  GST_TASK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(task,GST_TYPE_TASK,GstTaskClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TASK_CAST(task : longint) : PGstTask;
begin
  GST_TASK_CAST:=PGstTask(task);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_STATE(task : longint) : longint;
begin
  GST_TASK_STATE:=(GST_TASK_CAST(task))^.state;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_GET_COND(task : longint) : longint;
begin
  GST_TASK_GET_COND:=@((GST_TASK_CAST(task))^.cond);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_WAIT(task : longint) : longint;
begin
  GST_TASK_WAIT:=g_cond_wait(GST_TASK_GET_COND(task),GST_OBJECT_GET_LOCK(task));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_SIGNAL(task : longint) : longint;
begin
  GST_TASK_SIGNAL:=g_cond_signal(GST_TASK_GET_COND(task));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_BROADCAST(task : longint) : longint;
begin
  GST_TASK_BROADCAST:=g_cond_broadcast(GST_TASK_GET_COND(task));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_GET_LOCK(task : longint) : longint;
begin
  GST_TASK_GET_LOCK:=(GST_TASK_CAST(task))^.lock;
end;


end.
