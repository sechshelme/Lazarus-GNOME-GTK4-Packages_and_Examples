
unit rtsp_session_pool;
interface

{
  Automatically converted by H2Pas 1.0.0 from rtsp_session_pool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rtsp_session_pool.h
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
PGList  = ^GList;
PGSource  = ^GSource;
PGstRTSPSession  = ^GstRTSPSession;
PGstRTSPSessionPool  = ^GstRTSPSessionPool;
PGstRTSPSessionPoolClass  = ^GstRTSPSessionPoolClass;
PGstRTSPSessionPoolPrivate  = ^GstRTSPSessionPoolPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2008 Wim Taymans <wim.taymans at gmail.com>
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
{$ifndef __GST_RTSP_SESSION_POOL_H__}
{$define __GST_RTSP_SESSION_POOL_H__}
{$include "rtsp-server-prelude.h"}
type
{$include "rtsp-session.h"}

{ was #define dname def_expr }
function GST_TYPE_RTSP_SESSION_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SESSION_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SESSION_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_POOL_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SESSION_POOL_CAST(obj : longint) : PGstRTSPSessionPool;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SESSION_POOL_CLASS_CAST(klass : longint) : PGstRTSPSessionPoolClass;

{*
 * GstRTSPSessionPool:
 *
 * An object that keeps track of the active sessions. This object is usually
 * attached to a #GstRTSPServer object to manage the sessions in that server.
  }
{< private > }
type
  PGstRTSPSessionPool = ^TGstRTSPSessionPool;
  TGstRTSPSessionPool = record
      parent : TGObject;
      priv : PGstRTSPSessionPoolPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstRTSPSessionPoolClass:
 * @create_session_id: create a new random session id. Subclasses can create
 *    custom session ids and should not check if the session exists.
 * @create_session: make a new session object.
 * @session_removed: a session was removed from the pool
  }
(* Const before type ignored *)
{ signals  }
{< private > }
  PGstRTSPSessionPoolClass = ^TGstRTSPSessionPoolClass;
  TGstRTSPSessionPoolClass = record
      parent_class : TGObjectClass;
      create_session_id : function (pool:PGstRTSPSessionPool):Pgchar;cdecl;
      create_session : function (pool:PGstRTSPSessionPool; id:Pgchar):PGstRTSPSession;cdecl;
      session_removed : procedure (pool:PGstRTSPSessionPool; session:PGstRTSPSession);cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE-1)-1] of Tgpointer;
    end;

{*
 * GstRTSPSessionPoolFunc:
 * @pool: a #GstRTSPSessionPool object
 * @user_data: user data that has been given when registering the handler
 *
 * The function that will be called from the GSource watch on the session pool.
 *
 * The function will be called when the pool must be cleaned up because one or
 * more sessions timed out.
 *
 * Returns: %FALSE if the source should be removed.
  }

  TGstRTSPSessionPoolFunc = function (pool:PGstRTSPSessionPool; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstRTSPSessionPoolFilterFunc:
 * @pool: a #GstRTSPSessionPool object
 * @session: a #GstRTSPSession in @pool
 * @user_data: user data that has been given to gst_rtsp_session_pool_filter()
 *
 * This function will be called by the gst_rtsp_session_pool_filter(). An
 * implementation should return a value of #GstRTSPFilterResult.
 *
 * When this function returns #GST_RTSP_FILTER_REMOVE, @session will be removed
 * from @pool.
 *
 * A return value of #GST_RTSP_FILTER_KEEP will leave @session untouched in
 * @pool.
 *
 * A value of GST_RTSP_FILTER_REF will add @session to the result #GList of
 * gst_rtsp_session_pool_filter().
 *
 * Returns: a #GstRTSPFilterResult.
  }

  TGstRTSPSessionPoolFilterFunc = function (pool:PGstRTSPSessionPool; session:PGstRTSPSession; user_data:Tgpointer):TGstRTSPFilterResult;cdecl;

function gst_rtsp_session_pool_get_type:TGType;cdecl;external;
{ creating a session pool  }
function gst_rtsp_session_pool_new:PGstRTSPSessionPool;cdecl;external;
{ counting sessions  }
procedure gst_rtsp_session_pool_set_max_sessions(pool:PGstRTSPSessionPool; max:Tguint);cdecl;external;
function gst_rtsp_session_pool_get_max_sessions(pool:PGstRTSPSessionPool):Tguint;cdecl;external;
function gst_rtsp_session_pool_get_n_sessions(pool:PGstRTSPSessionPool):Tguint;cdecl;external;
{ managing sessions  }
function gst_rtsp_session_pool_create(pool:PGstRTSPSessionPool):PGstRTSPSession;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_session_pool_find(pool:PGstRTSPSessionPool; sessionid:Pgchar):PGstRTSPSession;cdecl;external;
function gst_rtsp_session_pool_remove(pool:PGstRTSPSessionPool; sess:PGstRTSPSession):Tgboolean;cdecl;external;
{ perform session maintenance  }
function gst_rtsp_session_pool_filter(pool:PGstRTSPSessionPool; func:TGstRTSPSessionPoolFilterFunc; user_data:Tgpointer):PGList;cdecl;external;
function gst_rtsp_session_pool_cleanup(pool:PGstRTSPSessionPool):Tguint;cdecl;external;
function gst_rtsp_session_pool_create_watch(pool:PGstRTSPSessionPool):PGSource;cdecl;external;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPSessionPool, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_SESSION_POOL_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_RTSP_SESSION_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_SESSION_POOL:=gst_rtsp_session_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SESSION_POOL(obj : longint) : longint;
begin
  GST_IS_RTSP_SESSION_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_SESSION_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SESSION_POOL_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_SESSION_POOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_SESSION_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_POOL_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_SESSION_POOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_SESSION_POOL,GstRTSPSessionPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_POOL(obj : longint) : longint;
begin
  GST_RTSP_SESSION_POOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_SESSION_POOL,GstRTSPSessionPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_POOL_CLASS(klass : longint) : longint;
begin
  GST_RTSP_SESSION_POOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_SESSION_POOL,GstRTSPSessionPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SESSION_POOL_CAST(obj : longint) : PGstRTSPSessionPool;
begin
  GST_RTSP_SESSION_POOL_CAST:=PGstRTSPSessionPool(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SESSION_POOL_CLASS_CAST(klass : longint) : PGstRTSPSessionPoolClass;
begin
  GST_RTSP_SESSION_POOL_CLASS_CAST:=PGstRTSPSessionPoolClass(klass);
end;


end.
