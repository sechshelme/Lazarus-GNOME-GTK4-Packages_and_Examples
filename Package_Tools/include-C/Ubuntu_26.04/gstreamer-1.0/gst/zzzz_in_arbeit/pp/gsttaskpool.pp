
unit gsttaskpool;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsttaskpool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttaskpool.h
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
PGError  = ^GError;
PGstContext  = ^GstContext;
PGstSharedTaskPool  = ^GstSharedTaskPool;
PGstSharedTaskPoolClass  = ^GstSharedTaskPoolClass;
PGstSharedTaskPoolPrivate  = ^GstSharedTaskPoolPrivate;
PGstTaskPool  = ^GstTaskPool;
PGstTaskPoolClass  = ^GstTaskPoolClass;
PGThreadPool  = ^GThreadPool;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2009> Wim Taymans <wim.taymans@gmail.com>
 *
 * gsttaskpool.h: Pool for creating streaming threads
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
{$ifndef __GST_TASK_POOL_H__}
{$define __GST_TASK_POOL_H__}
{$include <gst/gstcontext.h>}
{$include <gst/gstobject.h>}
{ --- standard type macros ---  }

{ was #define dname def_expr }
function GST_TYPE_TASK_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_POOL(pool : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TASK_POOL(pool : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_POOL_CLASS(pclass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TASK_POOL_CLASS(pclass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_POOL_GET_CLASS(pool : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TASK_POOL_CAST(pool : longint) : PGstTaskPool;

type
{*
 * GstTaskPoolFunction:
 * @user_data: user data for the task function
 *
 * Task function, see gst_task_pool_push().
  }

  TGstTaskPoolFunction = procedure (user_data:pointer);cdecl;
{*
 * GstTaskPool:
 *
 * The #GstTaskPool object.
  }
{< private > }
  PGstTaskPool = ^TGstTaskPool;
  TGstTaskPool = record
      object : TGstObject;cdecl;
      pool : PGThreadPool;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstTaskPoolClass:
 * @parent_class: the parent class structure
 * @prepare: prepare the threadpool
 * @cleanup: make sure all threads are stopped
 * @push: start a new thread
 * @join: join a thread
 *
 * The #GstTaskPoolClass object.
  }
{< public > }
{*
   * GstTaskPoolClass::dispose_handle:
   * @pool: a #GstTaskPool
   * @id: (transfer full): the handle to dispose of
   *
   * free / unref the handle returned in GstTaskPoolClass::push.
   *
   * Since: 1.20
    }
{< private > }
  PGstTaskPoolClass = ^TGstTaskPoolClass;
  TGstTaskPoolClass = record
      parent_class : TGstObjectClass;
      prepare : procedure (pool:PGstTaskPool; error:PPGError);cdecl;
      cleanup : procedure (pool:PGstTaskPool);cdecl;
      push : function (pool:PGstTaskPool; func:TGstTaskPoolFunction; user_data:Tgpointer; error:PPGError):Tgpointer;cdecl;
      join : procedure (pool:PGstTaskPool; id:Tgpointer);cdecl;
      dispose_handle : procedure (pool:PGstTaskPool; id:Tgpointer);cdecl;
      _gst_reserved : array[0..(GST_PADDING-1)-1] of Tgpointer;
    end;


function gst_task_pool_get_type:TGType;cdecl;external;
function gst_task_pool_new:PGstTaskPool;cdecl;external;
procedure gst_task_pool_prepare(pool:PGstTaskPool; error:PPGError);cdecl;external;
function gst_task_pool_push(pool:PGstTaskPool; func:TGstTaskPoolFunction; user_data:Tgpointer; error:PPGError):Tgpointer;cdecl;external;
procedure gst_task_pool_join(pool:PGstTaskPool; id:Tgpointer);cdecl;external;
procedure gst_task_pool_dispose_handle(pool:PGstTaskPool; id:Tgpointer);cdecl;external;
procedure gst_task_pool_cleanup(pool:PGstTaskPool);cdecl;external;
{*
 * GST_TASK_POOL_CONTEXT_TYPE:
 *
 * The well-known context type for sharing a #GstTaskPool between elements
 * in a pipeline.
 *
 * Elements that support this context will post a %GST_MESSAGE_NEED_CONTEXT
 * message on the bus when they need a task pool. Applications can respond
 * by setting the context on the element or the pipeline. Elements will not
 * query neighbors for this context type as the task pool is optional and
 * elements will fall back to their default behavior if no pool is provided.
 *
 * Since: 1.28
  }
const
  GST_TASK_POOL_CONTEXT_TYPE = 'gst.task.pool';  

procedure gst_context_set_task_pool(context:PGstContext; pool:PGstTaskPool);cdecl;external;
function gst_context_get_task_pool(context:PGstContext; pool:PPGstTaskPool):Tgboolean;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstTaskPool, gst_object_unref) }
type

{ was #define dname def_expr }
function GST_TYPE_SHARED_TASK_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SHARED_TASK_POOL(pool : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SHARED_TASK_POOL(pool : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SHARED_TASK_POOL_CLASS(pclass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SHARED_TASK_POOL_CLASS(pclass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SHARED_TASK_POOL_GET_CLASS(pool : longint) : longint;

{*
 * GstSharedTaskPool:
 *
 * The #GstSharedTaskPool object.
 *
 * since: 1.20
  }
{< private > }
type
  PGstSharedTaskPool = ^TGstSharedTaskPool;
  TGstSharedTaskPool = record
      parent : TGstTaskPool;
      priv : PGstSharedTaskPoolPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstSharedTaskPoolClass:
 *
 * The #GstSharedTaskPoolClass object.
 *
 * Since: 1.20
  }
{< private > }
  PGstSharedTaskPoolClass = ^TGstSharedTaskPoolClass;
  TGstSharedTaskPoolClass = record
      parent_class : TGstTaskPoolClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_shared_task_pool_get_type:TGType;cdecl;external;
procedure gst_shared_task_pool_set_max_threads(pool:PGstSharedTaskPool; max_threads:Tguint);cdecl;external;
function gst_shared_task_pool_get_max_threads(pool:PGstSharedTaskPool):Tguint;cdecl;external;
function gst_shared_task_pool_new:PGstTaskPool;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstSharedTaskPool, gst_object_unref) }
{$endif}
{ __GST_TASK_POOL_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_TASK_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_TASK_POOL:=gst_task_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_POOL(pool : longint) : longint;
begin
  GST_TASK_POOL:=G_TYPE_CHECK_INSTANCE_CAST(pool,GST_TYPE_TASK_POOL,GstTaskPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TASK_POOL(pool : longint) : longint;
begin
  GST_IS_TASK_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(pool,GST_TYPE_TASK_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_POOL_CLASS(pclass : longint) : longint;
begin
  GST_TASK_POOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(pclass,GST_TYPE_TASK_POOL,GstTaskPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TASK_POOL_CLASS(pclass : longint) : longint;
begin
  GST_IS_TASK_POOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(pclass,GST_TYPE_TASK_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TASK_POOL_GET_CLASS(pool : longint) : longint;
begin
  GST_TASK_POOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(pool,GST_TYPE_TASK_POOL,GstTaskPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TASK_POOL_CAST(pool : longint) : PGstTaskPool;
begin
  GST_TASK_POOL_CAST:=PGstTaskPool(pool);
end;

{ was #define dname def_expr }
function GST_TYPE_SHARED_TASK_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_SHARED_TASK_POOL:=gst_shared_task_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SHARED_TASK_POOL(pool : longint) : longint;
begin
  GST_SHARED_TASK_POOL:=G_TYPE_CHECK_INSTANCE_CAST(pool,GST_TYPE_TASK_POOL,GstSharedTaskPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SHARED_TASK_POOL(pool : longint) : longint;
begin
  GST_IS_SHARED_TASK_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(pool,GST_TYPE_SHARED_TASK_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SHARED_TASK_POOL_CLASS(pclass : longint) : longint;
begin
  GST_SHARED_TASK_POOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(pclass,GST_TYPE_SHARED_TASK_POOL,GstSharedTaskPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SHARED_TASK_POOL_CLASS(pclass : longint) : longint;
begin
  GST_IS_SHARED_TASK_POOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(pclass,GST_TYPE_SHARED_TASK_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SHARED_TASK_POOL_GET_CLASS(pool : longint) : longint;
begin
  GST_SHARED_TASK_POOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(pool,GST_TYPE_SHARED_TASK_POOL,GstSharedTaskPoolClass);
end;


end.
