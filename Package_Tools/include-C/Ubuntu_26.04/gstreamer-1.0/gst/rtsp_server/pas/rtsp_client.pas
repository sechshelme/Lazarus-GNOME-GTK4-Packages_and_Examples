unit rtsp_client;

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
{$include <gst/gst.h>}
{$include <gst/rtsp/gstrtspconnection.h>}
{$ifndef __GST_RTSP_CLIENT_H__}
{$define __GST_RTSP_CLIENT_H__}
type
{$include "rtsp-server-prelude.h"}
{$include "rtsp-context.h"}
{$include "rtsp-mount-points.h"}
{$include "rtsp-sdp.h"}
{$include "rtsp-auth.h"}

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_CLIENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_CLIENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_CLIENT_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_CLIENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_CLIENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_CLIENT_CAST(obj : longint) : PGstRTSPClient;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_CLIENT_CLASS_CAST(klass : longint) : PGstRTSPClientClass;

{*
 * GstRTSPClientSendFunc:
 * @client: a #GstRTSPClient
 * @message: a #GstRTSPMessage
 * @close: close the connection
 * @user_data: user data when registering the callback
 *
 * This callback is called when @client wants to send @message. When @close is
 * %TRUE, the connection should be closed when the message has been sent.
 *
 * Returns: %TRUE on success.
  }
type

  TGstRTSPClientSendFunc = function (client:PGstRTSPClient; message:PGstRTSPMessage; close:Tgboolean; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstRTSPClientSendMessagesFunc:
 * @client: a #GstRTSPClient
 * @messages: #GstRTSPMessage
 * @n_messages: number of messages
 * @close: close the connection
 * @user_data: user data when registering the callback
 *
 * This callback is called when @client wants to send @messages. When @close is
 * %TRUE, the connection should be closed when the message has been sent.
 *
 * Returns: %TRUE on success.
 *
 * Since: 1.16
  }

  TGstRTSPClientSendMessagesFunc = function (client:PGstRTSPClient; messages:PGstRTSPMessage; n_messages:Tguint; close:Tgboolean; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstRTSPClient:
 *
 * The client object represents the connection and its state with a client.
  }
{< private > }
  PGstRTSPClient = ^TGstRTSPClient;
  TGstRTSPClient = record
      parent : TGObject;cdecl;
      priv : PGstRTSPClientPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstRTSPClientClass:
 * @create_sdp: called when the SDP needs to be created for media.
 * @configure_client_media: called when the stream in media needs to be configured.
 *    The default implementation will configure the blocksize on the payloader when
 *    spcified in the request headers.
 * @configure_client_transport: called when the client transport needs to be
 *    configured.
 * @params_set: set parameters. This function should also initialize the
 *    RTSP response(ctx->response) via a call to gst_rtsp_message_init_response()
 * @params_get: get parameters. This function should also initialize the
 *    RTSP response(ctx->response) via a call to gst_rtsp_message_init_response()
 * @make_path_from_uri: called to create path from uri.
 * @adjust_play_mode: called to give the application the possibility to adjust
 *    the range, seek flags, rate and rate-control. Since 1.18
 * @adjust_play_response: called to give the implementation the possibility to
 *    adjust the response to a play request, for example if extra headers were
 *    parsed when #GstRTSPClientClass.adjust_play_mode was called. Since 1.18
 * @tunnel_http_response: called when a response to the GET request is about to
 *   be sent for a tunneled connection. The response can be modified. Since: 1.4
 *
 * The client class structure.
  }
{ signals  }
{*
   * GstRTSPClientClass::adjust_error_code:
   * @client: a #GstRTSPClient
   * @ctx: a #GstRTSPContext
   * @code: a #GstRTSPStatusCode
   *
   * Called before sending error response to give the application the
   * possibility to adjust the error code.
   *
   * Returns: a #GstRTSPStatusCode, containing the adjusted error code.
   *
   * Since: 1.22
    }
{< private > }
  PGstRTSPClientClass = ^TGstRTSPClientClass;
  TGstRTSPClientClass = record
      parent_class : TGObjectClass;
      create_sdp : function (client:PGstRTSPClient; media:PGstRTSPMedia):PGstSDPMessage;cdecl;
      configure_client_media : function (client:PGstRTSPClient; media:PGstRTSPMedia; stream:PGstRTSPStream; ctx:PGstRTSPContext):Tgboolean;cdecl;
      configure_client_transport : function (client:PGstRTSPClient; ctx:PGstRTSPContext; ct:PGstRTSPTransport):Tgboolean;cdecl;
      params_set : function (client:PGstRTSPClient; ctx:PGstRTSPContext):TGstRTSPResult;cdecl;
      params_get : function (client:PGstRTSPClient; ctx:PGstRTSPContext):TGstRTSPResult;cdecl;
      make_path_from_uri : function (client:PGstRTSPClient; uri:PGstRTSPUrl):Pgchar;cdecl;
      adjust_play_mode : function (client:PGstRTSPClient; context:PGstRTSPContext; range:PPGstRTSPTimeRange; flags:PGstSeekFlags; rate:Pgdouble; 
                   trickmode_interval:PGstClockTime; enable_rate_control:Pgboolean):TGstRTSPStatusCode;cdecl;
      adjust_play_response : function (client:PGstRTSPClient; context:PGstRTSPContext):TGstRTSPStatusCode;cdecl;
      closed : procedure (client:PGstRTSPClient);cdecl;
      new_session : procedure (client:PGstRTSPClient; session:PGstRTSPSession);cdecl;
      options_request : procedure (client:PGstRTSPClient; ctx:PGstRTSPContext);cdecl;
      describe_request : procedure (client:PGstRTSPClient; ctx:PGstRTSPContext);cdecl;
      setup_request : procedure (client:PGstRTSPClient; ctx:PGstRTSPContext);cdecl;
      play_request : procedure (client:PGstRTSPClient; ctx:PGstRTSPContext);cdecl;
      pause_request : procedure (client:PGstRTSPClient; ctx:PGstRTSPContext);cdecl;
      teardown_request : procedure (client:PGstRTSPClient; ctx:PGstRTSPContext);cdecl;
      set_parameter_request : procedure (client:PGstRTSPClient; ctx:PGstRTSPContext);cdecl;
      get_parameter_request : procedure (client:PGstRTSPClient; ctx:PGstRTSPContext);cdecl;
      handle_response : procedure (client:PGstRTSPClient; ctx:PGstRTSPContext);cdecl;
      tunnel_http_response : procedure (client:PGstRTSPClient; request:PGstRTSPMessage; response:PGstRTSPMessage);cdecl;
      send_message : procedure (client:PGstRTSPClient; ctx:PGstRTSPContext; response:PGstRTSPMessage);cdecl;
      handle_sdp : function (client:PGstRTSPClient; ctx:PGstRTSPContext; media:PGstRTSPMedia; sdp:PGstSDPMessage):Tgboolean;cdecl;
      announce_request : procedure (client:PGstRTSPClient; ctx:PGstRTSPContext);cdecl;
      record_request : procedure (client:PGstRTSPClient; ctx:PGstRTSPContext);cdecl;
      check_requirements : function (client:PGstRTSPClient; ctx:PGstRTSPContext; arr:PPgchar):Pgchar;cdecl;
      pre_options_request : function (client:PGstRTSPClient; ctx:PGstRTSPContext):TGstRTSPStatusCode;cdecl;
      pre_describe_request : function (client:PGstRTSPClient; ctx:PGstRTSPContext):TGstRTSPStatusCode;cdecl;
      pre_setup_request : function (client:PGstRTSPClient; ctx:PGstRTSPContext):TGstRTSPStatusCode;cdecl;
      pre_play_request : function (client:PGstRTSPClient; ctx:PGstRTSPContext):TGstRTSPStatusCode;cdecl;
      pre_pause_request : function (client:PGstRTSPClient; ctx:PGstRTSPContext):TGstRTSPStatusCode;cdecl;
      pre_teardown_request : function (client:PGstRTSPClient; ctx:PGstRTSPContext):TGstRTSPStatusCode;cdecl;
      pre_set_parameter_request : function (client:PGstRTSPClient; ctx:PGstRTSPContext):TGstRTSPStatusCode;cdecl;
      pre_get_parameter_request : function (client:PGstRTSPClient; ctx:PGstRTSPContext):TGstRTSPStatusCode;cdecl;
      pre_announce_request : function (client:PGstRTSPClient; ctx:PGstRTSPContext):TGstRTSPStatusCode;cdecl;
      pre_record_request : function (client:PGstRTSPClient; ctx:PGstRTSPContext):TGstRTSPStatusCode;cdecl;
      adjust_error_code : function (client:PGstRTSPClient; ctx:PGstRTSPContext; code:TGstRTSPStatusCode):TGstRTSPStatusCode;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE-19)-1] of Tgpointer;
    end;


function gst_rtsp_client_get_type:TGType;cdecl;external libgstrtsp;
function gst_rtsp_client_new:PGstRTSPClient;cdecl;external libgstrtsp;
procedure gst_rtsp_client_set_session_pool(client:PGstRTSPClient; pool:PGstRTSPSessionPool);cdecl;external libgstrtsp;
function gst_rtsp_client_get_session_pool(client:PGstRTSPClient):PGstRTSPSessionPool;cdecl;external libgstrtsp;
procedure gst_rtsp_client_set_mount_points(client:PGstRTSPClient; mounts:PGstRTSPMountPoints);cdecl;external libgstrtsp;
function gst_rtsp_client_get_mount_points(client:PGstRTSPClient):PGstRTSPMountPoints;cdecl;external libgstrtsp;
procedure gst_rtsp_client_set_content_length_limit(client:PGstRTSPClient; limit:Tguint);cdecl;external libgstrtsp;
function gst_rtsp_client_get_content_length_limit(client:PGstRTSPClient):Tguint;cdecl;external libgstrtsp;
procedure gst_rtsp_client_set_auth(client:PGstRTSPClient; auth:PGstRTSPAuth);cdecl;external libgstrtsp;
function gst_rtsp_client_get_auth(client:PGstRTSPClient):PGstRTSPAuth;cdecl;external libgstrtsp;
procedure gst_rtsp_client_set_thread_pool(client:PGstRTSPClient; pool:PGstRTSPThreadPool);cdecl;external libgstrtsp;
function gst_rtsp_client_get_thread_pool(client:PGstRTSPClient):PGstRTSPThreadPool;cdecl;external libgstrtsp;
function gst_rtsp_client_set_connection(client:PGstRTSPClient; conn:PGstRTSPConnection):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_client_get_connection(client:PGstRTSPClient):PGstRTSPConnection;cdecl;external libgstrtsp;
function gst_rtsp_client_attach(client:PGstRTSPClient; context:PGMainContext):Tguint;cdecl;external libgstrtsp;
procedure gst_rtsp_client_close(client:PGstRTSPClient);cdecl;external libgstrtsp;
procedure gst_rtsp_client_set_send_func(client:PGstRTSPClient; func:TGstRTSPClientSendFunc; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgstrtsp;
procedure gst_rtsp_client_set_send_messages_func(client:PGstRTSPClient; func:TGstRTSPClientSendMessagesFunc; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgstrtsp;
function gst_rtsp_client_handle_message(client:PGstRTSPClient; message:PGstRTSPMessage):TGstRTSPResult;cdecl;external libgstrtsp;
function gst_rtsp_client_send_message(client:PGstRTSPClient; session:PGstRTSPSession; message:PGstRTSPMessage):TGstRTSPResult;cdecl;external libgstrtsp;
{*
 * GstRTSPClientSessionFilterFunc:
 * @client: a #GstRTSPClient object
 * @sess: a #GstRTSPSession in @client
 * @user_data: user data that has been given to gst_rtsp_client_session_filter()
 *
 * This function will be called by the gst_rtsp_client_session_filter(). An
 * implementation should return a value of #GstRTSPFilterResult.
 *
 * When this function returns #GST_RTSP_FILTER_REMOVE, @sess will be removed
 * from @client.
 *
 * A return value of #GST_RTSP_FILTER_KEEP will leave @sess untouched in
 * @client.
 *
 * A value of #GST_RTSP_FILTER_REF will add @sess to the result #GList of
 * gst_rtsp_client_session_filter().
 *
 * Returns: a #GstRTSPFilterResult.
  }
type

  TGstRTSPClientSessionFilterFunc = function (client:PGstRTSPClient; sess:PGstRTSPSession; user_data:Tgpointer):TGstRTSPFilterResult;cdecl;

function gst_rtsp_client_session_filter(client:PGstRTSPClient; func:TGstRTSPClientSessionFilterFunc; user_data:Tgpointer):PGList;cdecl;external libgstrtsp;
function gst_rtsp_client_get_stream_transport(client:PGstRTSPClient; channel:Tguint8):PGstRTSPStreamTransport;cdecl;external libgstrtsp;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPClient, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_CLIENT_H__  }

// === Konventiert am: 20-7-26 13:45:46 ===

function GST_TYPE_RTSP_CLIENT : TGType;

implementation

function GST_TYPE_RTSP_CLIENT : TGType;
  begin
    GST_TYPE_RTSP_CLIENT:=gst_rtsp_client_get_type;
  end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_CLIENT(obj : longint) : longint;
begin
  GST_IS_RTSP_CLIENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_CLIENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_CLIENT_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_CLIENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_CLIENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_CLIENT_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_CLIENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_CLIENT,GstRTSPClientClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_CLIENT(obj : longint) : longint;
begin
  GST_RTSP_CLIENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_CLIENT,GstRTSPClient);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_CLIENT_CLASS(klass : longint) : longint;
begin
  GST_RTSP_CLIENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_CLIENT,GstRTSPClientClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_CLIENT_CAST(obj : longint) : PGstRTSPClient;
begin
  GST_RTSP_CLIENT_CAST:=PGstRTSPClient(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_CLIENT_CLASS_CAST(klass : longint) : PGstRTSPClientClass;
begin
  GST_RTSP_CLIENT_CLASS_CAST:=PGstRTSPClientClass(klass);
end;


end.
