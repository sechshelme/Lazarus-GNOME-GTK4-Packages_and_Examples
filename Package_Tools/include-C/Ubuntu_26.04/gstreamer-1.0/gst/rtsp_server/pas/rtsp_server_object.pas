unit rtsp_server_object;

interface

uses
  fp_glib2, fp_gst;

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
{$ifndef __GST_RTSP_SERVER_OBJECT_H__}
{$define __GST_RTSP_SERVER_OBJECT_H__}
{$include <gst/gst.h>}
type
{$include "rtsp-server-prelude.h"}
{$include "rtsp-session-pool.h"}
{$include "rtsp-session.h"}
{$include "rtsp-media.h"}
{$include "rtsp-stream.h"}
{$include "rtsp-stream-transport.h"}
{$include "rtsp-address-pool.h"}
{$include "rtsp-thread-pool.h"}
{$include "rtsp-client.h"}
{$include "rtsp-context.h"}
{$include "rtsp-mount-points.h"}
{$include "rtsp-media-factory.h"}
{$include "rtsp-permissions.h"}
{$include "rtsp-auth.h"}
{$include "rtsp-token.h"}
{$include "rtsp-session-media.h"}
{$include "rtsp-sdp.h"}
{$include "rtsp-media-factory-uri.h"}
{$include "rtsp-params.h"}

{ was #define dname def_expr }
function GST_TYPE_RTSP_SERVER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SERVER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SERVER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SERVER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SERVER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SERVER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SERVER_CAST(obj : longint) : PGstRTSPServer;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SERVER_CLASS_CAST(klass : longint) : PGstRTSPServerClass;

{*
 * GstRTSPServer:
 *
 * This object listens on a port, creates and manages the clients connected to
 * it.
  }
{< private > }
type
  PGstRTSPServer = ^TGstRTSPServer;
  TGstRTSPServer = record
      parent : TGObject;
      priv : PGstRTSPServerPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstRTSPServerClass:
 * @create_client: Create, configure a new GstRTSPClient
 *          object that handles the new connection on @socket. The default
 *          implementation will create a GstRTSPClient and will configure the
 *          mount-points, auth, session-pool and thread-pool on the client.
 * @client_connected: emitted when a new client connected.
 *
 * The RTSP server class structure
  }
{ signals  }
{< private > }
  PGstRTSPServerClass = ^TGstRTSPServerClass;
  TGstRTSPServerClass = record
      parent_class : TGObjectClass;
      create_client : function (server:PGstRTSPServer):PGstRTSPClient;cdecl;
      client_connected : procedure (server:PGstRTSPServer; client:PGstRTSPClient);cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;


function gst_rtsp_server_get_type:TGType;cdecl;external libgstrtsp;
function gst_rtsp_server_new:PGstRTSPServer;cdecl;external libgstrtsp;
procedure gst_rtsp_server_set_address(server:PGstRTSPServer; address:Pgchar);cdecl;external libgstrtsp;
function gst_rtsp_server_get_address(server:PGstRTSPServer):Pgchar;cdecl;external libgstrtsp;
procedure gst_rtsp_server_set_service(server:PGstRTSPServer; service:Pgchar);cdecl;external libgstrtsp;
function gst_rtsp_server_get_service(server:PGstRTSPServer):Pgchar;cdecl;external libgstrtsp;
procedure gst_rtsp_server_set_backlog(server:PGstRTSPServer; backlog:Tgint);cdecl;external libgstrtsp;
function gst_rtsp_server_get_backlog(server:PGstRTSPServer):Tgint;cdecl;external libgstrtsp;
function gst_rtsp_server_get_bound_port(server:PGstRTSPServer):longint;cdecl;external libgstrtsp;
procedure gst_rtsp_server_set_session_pool(server:PGstRTSPServer; pool:PGstRTSPSessionPool);cdecl;external libgstrtsp;
function gst_rtsp_server_get_session_pool(server:PGstRTSPServer):PGstRTSPSessionPool;cdecl;external libgstrtsp;
procedure gst_rtsp_server_set_mount_points(server:PGstRTSPServer; mounts:PGstRTSPMountPoints);cdecl;external libgstrtsp;
function gst_rtsp_server_get_mount_points(server:PGstRTSPServer):PGstRTSPMountPoints;cdecl;external libgstrtsp;
procedure gst_rtsp_server_set_content_length_limit(server:PGstRTSPServer; limit:Tguint);cdecl;external libgstrtsp;
function gst_rtsp_server_get_content_length_limit(server:PGstRTSPServer):Tguint;cdecl;external libgstrtsp;
procedure gst_rtsp_server_set_auth(server:PGstRTSPServer; auth:PGstRTSPAuth);cdecl;external libgstrtsp;
function gst_rtsp_server_get_auth(server:PGstRTSPServer):PGstRTSPAuth;cdecl;external libgstrtsp;
procedure gst_rtsp_server_set_thread_pool(server:PGstRTSPServer; pool:PGstRTSPThreadPool);cdecl;external libgstrtsp;
function gst_rtsp_server_get_thread_pool(server:PGstRTSPServer):PGstRTSPThreadPool;cdecl;external libgstrtsp;
function gst_rtsp_server_transfer_connection(server:PGstRTSPServer; socket:PGSocket; ip:Pgchar; port:Tgint; initial_buffer:Pgchar):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_server_io_func(socket:PGSocket; condition:TGIOCondition; server:PGstRTSPServer):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_server_create_socket(server:PGstRTSPServer; cancellable:PGCancellable; error:PPGError):PGSocket;cdecl;external libgstrtsp;
function gst_rtsp_server_create_source(server:PGstRTSPServer; cancellable:PGCancellable; error:PPGError):PGSource;cdecl;external libgstrtsp;
function gst_rtsp_server_attach(server:PGstRTSPServer; context:PGMainContext):Tguint;cdecl;external libgstrtsp;
{*
 * GstRTSPServerClientFilterFunc:
 * @server: a #GstRTSPServer object
 * @client: a #GstRTSPClient in @server
 * @user_data: user data that has been given to gst_rtsp_server_client_filter()
 *
 * This function will be called by the gst_rtsp_server_client_filter(). An
 * implementation should return a value of #GstRTSPFilterResult.
 *
 * When this function returns #GST_RTSP_FILTER_REMOVE, @client will be removed
 * from @server.
 *
 * A return value of #GST_RTSP_FILTER_KEEP will leave @client untouched in
 * @server.
 *
 * A value of #GST_RTSP_FILTER_REF will add @client to the result #GList of
 * gst_rtsp_server_client_filter().
 *
 * Returns: a #GstRTSPFilterResult.
  }
type

  TGstRTSPServerClientFilterFunc = function (server:PGstRTSPServer; client:PGstRTSPClient; user_data:Tgpointer):TGstRTSPFilterResult;cdecl;

function gst_rtsp_server_client_filter(server:PGstRTSPServer; func:TGstRTSPServerClientFilterFunc; user_data:Tgpointer):PGList;cdecl;external libgstrtsp;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPServer, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_SERVER_OBJECT_H__  }

// === Konventiert am: 20-7-26 13:44:21 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_RTSP_SERVER : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_SERVER:=gst_rtsp_server_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SERVER(obj : longint) : longint;
begin
  GST_IS_RTSP_SERVER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_SERVER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SERVER_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_SERVER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_SERVER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SERVER_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_SERVER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_SERVER,GstRTSPServerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SERVER(obj : longint) : longint;
begin
  GST_RTSP_SERVER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_SERVER,GstRTSPServer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SERVER_CLASS(klass : longint) : longint;
begin
  GST_RTSP_SERVER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_SERVER,GstRTSPServerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SERVER_CAST(obj : longint) : PGstRTSPServer;
begin
  GST_RTSP_SERVER_CAST:=PGstRTSPServer(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SERVER_CLASS_CAST(klass : longint) : PGstRTSPServerClass;
begin
  GST_RTSP_SERVER_CLASS_CAST:=PGstRTSPServerClass(klass);
end;


end.
