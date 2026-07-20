unit rtsp_thread_pool;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2010 Wim Taymans <wim.taymans at gmail.com>
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
{$include <gst/gst.h>}
{$ifndef __GST_RTSP_THREAD_POOL_H__}
{$define __GST_RTSP_THREAD_POOL_H__}
type
{$include "rtsp-client.h"}

{ was #define dname def_expr }
function GST_TYPE_RTSP_THREAD_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_THREAD_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_THREAD_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_THREAD_POOL_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_THREAD_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_THREAD_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_THREAD_POOL_CAST(obj : longint) : PGstRTSPThreadPool;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_THREAD_POOL_CLASS_CAST(klass : longint) : PGstRTSPThreadPoolClass;

function gst_rtsp_thread_get_type:TGType;cdecl;external libgstrtsp;
{ was #define dname def_expr }
function GST_TYPE_RTSP_THREAD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_THREAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_THREAD_CAST(obj : longint) : PGstRTSPThread;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_THREAD(obj : longint) : longint;

{*
 * GstRTSPThreadType:
 * @GST_RTSP_THREAD_TYPE_CLIENT: a thread to handle the client communication
 * @GST_RTSP_THREAD_TYPE_MEDIA: a thread to handle media 
 *
 * Different thread types
  }
type
  PGstRTSPThreadType = ^TGstRTSPThreadType;
  TGstRTSPThreadType =  Longint;
  Const
    GST_RTSP_THREAD_TYPE_CLIENT = 0;
    GST_RTSP_THREAD_TYPE_MEDIA = 1;
;
{*
 * GstRTSPThread:
 * @mini_object: parent #GstMiniObject
 * @type: the thread type
 * @context: a #GMainContext
 * @loop: a #GMainLoop
 *
 * Structure holding info about a mainloop running in a thread
  }
type
  PGstRTSPThread = ^TGstRTSPThread;
  TGstRTSPThread = record
      mini_object : TGstMiniObject;
      _type : TGstRTSPThreadType;
      context : PGMainContext;
      loop : PGMainLoop;
    end;


function gst_rtsp_thread_new(_type:TGstRTSPThreadType):PGstRTSPThread;cdecl;external libgstrtsp;
function gst_rtsp_thread_reuse(thread:PGstRTSPThread):Tgboolean;cdecl;external libgstrtsp;
procedure gst_rtsp_thread_stop(thread:PGstRTSPThread);cdecl;external libgstrtsp;
{*xxxxxxx
static inline GstRTSPThread *
gst_rtsp_thread_ref (GstRTSPThread * thread)

  return (GstRTSPThread *) gst_mini_object_ref (GST_MINI_OBJECT_CAST (thread));


static inline void
gst_rtsp_thread_unref (GstRTSPThread * thread)

  gst_mini_object_unref (GST_MINI_OBJECT_CAST (thread));

  }
{*
 * GstRTSPThreadPool:
 *
 * The thread pool structure.
  }
{< private > }
type
  PGstRTSPThreadPool = ^TGstRTSPThreadPool;
  TGstRTSPThreadPool = record
      parent : TGObject;
      priv : PGstRTSPThreadPoolPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstRTSPThreadPoolClass:
 * @pool: a #GThreadPool used internally
 * @get_thread: this function should make or reuse an existing thread that runs
 *        a mainloop.
 * @configure_thread: configure a thread object. this vmethod is called when
 *       a new thread has been created and should be configured.
 * @thread_enter: called from the thread when it is entered
 * @thread_leave: called from the thread when it is left
 *
 * Class for managing threads.
  }
{< private > }
  PGstRTSPThreadPoolClass = ^TGstRTSPThreadPoolClass;
  TGstRTSPThreadPoolClass = record
      parent_class : TGObjectClass;
      pool : PGThreadPool;
      get_thread : function (pool:PGstRTSPThreadPool; _type:TGstRTSPThreadType; ctx:PGstRTSPContext):PGstRTSPThread;cdecl;
      configure_thread : procedure (pool:PGstRTSPThreadPool; thread:PGstRTSPThread; ctx:PGstRTSPContext);cdecl;
      thread_enter : procedure (pool:PGstRTSPThreadPool; thread:PGstRTSPThread);cdecl;
      thread_leave : procedure (pool:PGstRTSPThreadPool; thread:PGstRTSPThread);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_thread_pool_get_type:TGType;cdecl;external libgstrtsp;
function gst_rtsp_thread_pool_new:PGstRTSPThreadPool;cdecl;external libgstrtsp;
procedure gst_rtsp_thread_pool_set_max_threads(pool:PGstRTSPThreadPool; max_threads:Tgint);cdecl;external libgstrtsp;
function gst_rtsp_thread_pool_get_max_threads(pool:PGstRTSPThreadPool):Tgint;cdecl;external libgstrtsp;
function gst_rtsp_thread_pool_get_thread(pool:PGstRTSPThreadPool; _type:TGstRTSPThreadType; ctx:PGstRTSPContext):PGstRTSPThread;cdecl;external libgstrtsp;
procedure gst_rtsp_thread_pool_cleanup;cdecl;external libgstrtsp;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPThread, gst_rtsp_thread_unref) }
{$endif}
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPThreadPool, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_THREAD_POOL_H__  }

// === Konventiert am: 20-7-26 13:42:30 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_RTSP_THREAD_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_THREAD_POOL:=gst_rtsp_thread_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_THREAD_POOL(obj : longint) : longint;
begin
  GST_IS_RTSP_THREAD_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_THREAD_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_THREAD_POOL_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_THREAD_POOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_THREAD_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_THREAD_POOL_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_THREAD_POOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_THREAD_POOL,GstRTSPThreadPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_THREAD_POOL(obj : longint) : longint;
begin
  GST_RTSP_THREAD_POOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_THREAD_POOL,GstRTSPThreadPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_THREAD_POOL_CLASS(klass : longint) : longint;
begin
  GST_RTSP_THREAD_POOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_THREAD_POOL,GstRTSPThreadPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_THREAD_POOL_CAST(obj : longint) : PGstRTSPThreadPool;
begin
  GST_RTSP_THREAD_POOL_CAST:=PGstRTSPThreadPool(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_THREAD_POOL_CLASS_CAST(klass : longint) : PGstRTSPThreadPoolClass;
begin
  GST_RTSP_THREAD_POOL_CLASS_CAST:=PGstRTSPThreadPoolClass(klass);
end;

{ was #define dname def_expr }
function GST_TYPE_RTSP_THREAD : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_THREAD:=gst_rtsp_thread_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_THREAD(obj : longint) : longint;
begin
  GST_IS_RTSP_THREAD:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_RTSP_THREAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_THREAD_CAST(obj : longint) : PGstRTSPThread;
begin
  GST_RTSP_THREAD_CAST:=PGstRTSPThread(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_THREAD(obj : longint) : longint;
begin
  GST_RTSP_THREAD:=GST_RTSP_THREAD_CAST(obj);
end;


end.
