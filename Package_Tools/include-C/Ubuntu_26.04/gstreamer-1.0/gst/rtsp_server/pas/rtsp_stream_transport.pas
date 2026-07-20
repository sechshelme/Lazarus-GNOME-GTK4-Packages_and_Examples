unit rtsp_stream_transport;

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
{$include <gst/base/base.h>}
{$include <gst/rtsp/gstrtsprange.h>}
{$include <gst/rtsp/gstrtspurl.h>}
{$ifndef __GST_RTSP_STREAM_TRANSPORT_H__}
{$define __GST_RTSP_STREAM_TRANSPORT_H__}
{$include "rtsp-server-prelude.h"}
{ types for the media  }

{ was #define dname def_expr }
function GST_TYPE_RTSP_STREAM_TRANSPORT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_STREAM_TRANSPORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_STREAM_TRANSPORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_STREAM_TRANSPORT_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_STREAM_TRANSPORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_STREAM_TRANSPORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_STREAM_TRANSPORT_CAST(obj : longint) : PGstRTSPStreamTransport;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_STREAM_TRANSPORT_CLASS_CAST(klass : longint) : PGstRTSPStreamTransportClass;

type
{$include "rtsp-stream.h"}
{*
 * GstRTSPSendFunc:
 * @buffer: a #GstBuffer
 * @channel: a channel
 * @user_data: user data
 *
 * Function registered with gst_rtsp_stream_transport_set_callbacks() and
 * called when @buffer must be sent on @channel.
 *
 * Returns: %TRUE on success
  }
type

  TGstRTSPSendFunc = function (buffer:PGstBuffer; channel:Tguint8; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstRTSPSendListFunc:
 * @buffer_list: a #GstBufferList
 * @channel: a channel
 * @user_data: user data
 *
 * Function registered with gst_rtsp_stream_transport_set_callbacks() and
 * called when @buffer_list must be sent on @channel.
 *
 * Returns: %TRUE on success
 *
 * Since: 1.16
  }

  TGstRTSPSendListFunc = function (buffer_list:PGstBufferList; channel:Tguint8; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstRTSPKeepAliveFunc:
 * @user_data: user data
 *
 * Function registered with gst_rtsp_stream_transport_set_keepalive() and called
 * when the stream is active.
  }

  TGstRTSPKeepAliveFunc = procedure (user_data:Tgpointer);cdecl;
{*
 * GstRTSPMessageSentFunc:
 * @user_data: user data
 *
 * Function registered with gst_rtsp_stream_transport_set_message_sent()
 * and called when a message has been sent on the transport.
  }

  TGstRTSPMessageSentFunc = procedure (user_data:Tgpointer);cdecl;
{*
 * GstRTSPMessageSentFuncFull:
 * @user_data: user data
 *
 * Function registered with gst_rtsp_stream_transport_set_message_sent_full()
 * and called when a message has been sent on the transport.
 *
 * Since: 1.18
  }

  TGstRTSPMessageSentFuncFull = procedure (trans:PGstRTSPStreamTransport; user_data:Tgpointer);cdecl;
{*
 * GstRTSPStreamTransport:
 * @parent: parent instance
 *
 * A Transport description for a stream
  }
{< private > }
  PGstRTSPStreamTransport = ^TGstRTSPStreamTransport;
  TGstRTSPStreamTransport = record
      parent : TGObject;cdecl;
      priv : PGstRTSPStreamTransportPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstRTSPStreamTransportClass = ^TGstRTSPStreamTransportClass;
  TGstRTSPStreamTransportClass = record
      parent_class : TGObjectClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_stream_transport_get_type:TGType;cdecl;external libgstrtsp;
function gst_rtsp_stream_transport_new(stream:PGstRTSPStream; tr:PGstRTSPTransport):PGstRTSPStreamTransport;cdecl;external libgstrtsp;
function gst_rtsp_stream_transport_get_stream(trans:PGstRTSPStreamTransport):PGstRTSPStream;cdecl;external libgstrtsp;
procedure gst_rtsp_stream_transport_set_transport(trans:PGstRTSPStreamTransport; tr:PGstRTSPTransport);cdecl;external libgstrtsp;
function gst_rtsp_stream_transport_get_transport(trans:PGstRTSPStreamTransport):PGstRTSPTransport;cdecl;external libgstrtsp;
procedure gst_rtsp_stream_transport_set_url(trans:PGstRTSPStreamTransport; url:PGstRTSPUrl);cdecl;external libgstrtsp;
function gst_rtsp_stream_transport_get_url(trans:PGstRTSPStreamTransport):PGstRTSPUrl;cdecl;external libgstrtsp;
function gst_rtsp_stream_transport_get_rtpinfo(trans:PGstRTSPStreamTransport; start_time:TGstClockTime):Pgchar;cdecl;external libgstrtsp;
procedure gst_rtsp_stream_transport_set_callbacks(trans:PGstRTSPStreamTransport; send_rtp:TGstRTSPSendFunc; send_rtcp:TGstRTSPSendFunc; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgstrtsp;
procedure gst_rtsp_stream_transport_set_list_callbacks(trans:PGstRTSPStreamTransport; send_rtp_list:TGstRTSPSendListFunc; send_rtcp_list:TGstRTSPSendListFunc; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgstrtsp;
procedure gst_rtsp_stream_transport_set_keepalive(trans:PGstRTSPStreamTransport; keep_alive:TGstRTSPKeepAliveFunc; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgstrtsp;
procedure gst_rtsp_stream_transport_set_message_sent(trans:PGstRTSPStreamTransport; message_sent:TGstRTSPMessageSentFunc; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgstrtsp;
procedure gst_rtsp_stream_transport_set_message_sent_full(trans:PGstRTSPStreamTransport; message_sent:TGstRTSPMessageSentFuncFull; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgstrtsp;
procedure gst_rtsp_stream_transport_keep_alive(trans:PGstRTSPStreamTransport);cdecl;external libgstrtsp;
procedure gst_rtsp_stream_transport_message_sent(trans:PGstRTSPStreamTransport);cdecl;external libgstrtsp;
function gst_rtsp_stream_transport_set_active(trans:PGstRTSPStreamTransport; active:Tgboolean):Tgboolean;cdecl;external libgstrtsp;
procedure gst_rtsp_stream_transport_set_timed_out(trans:PGstRTSPStreamTransport; timedout:Tgboolean);cdecl;external libgstrtsp;
function gst_rtsp_stream_transport_is_timed_out(trans:PGstRTSPStreamTransport):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_stream_transport_send_rtp(trans:PGstRTSPStreamTransport; buffer:PGstBuffer):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_stream_transport_send_rtcp(trans:PGstRTSPStreamTransport; buffer:PGstBuffer):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_stream_transport_send_rtp_list(trans:PGstRTSPStreamTransport; buffer_list:PGstBufferList):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_stream_transport_send_rtcp_list(trans:PGstRTSPStreamTransport; buffer_list:PGstBufferList):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_stream_transport_recv_data(trans:PGstRTSPStreamTransport; channel:Tguint; buffer:PGstBuffer):TGstFlowReturn;cdecl;external libgstrtsp;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPStreamTransport, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_STREAM_TRANSPORT_H__  }

// === Konventiert am: 20-7-26 13:42:57 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_RTSP_STREAM_TRANSPORT : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_STREAM_TRANSPORT:=gst_rtsp_stream_transport_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_STREAM_TRANSPORT(obj : longint) : longint;
begin
  GST_IS_RTSP_STREAM_TRANSPORT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_STREAM_TRANSPORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_STREAM_TRANSPORT_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_STREAM_TRANSPORT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_STREAM_TRANSPORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_STREAM_TRANSPORT_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_STREAM_TRANSPORT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_STREAM_TRANSPORT,GstRTSPStreamTransportClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_STREAM_TRANSPORT(obj : longint) : longint;
begin
  GST_RTSP_STREAM_TRANSPORT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_STREAM_TRANSPORT,GstRTSPStreamTransport);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_STREAM_TRANSPORT_CLASS(klass : longint) : longint;
begin
  GST_RTSP_STREAM_TRANSPORT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_STREAM_TRANSPORT,GstRTSPStreamTransportClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_STREAM_TRANSPORT_CAST(obj : longint) : PGstRTSPStreamTransport;
begin
  GST_RTSP_STREAM_TRANSPORT_CAST:=PGstRTSPStreamTransport(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_STREAM_TRANSPORT_CLASS_CAST(klass : longint) : PGstRTSPStreamTransportClass;
begin
  GST_RTSP_STREAM_TRANSPORT_CLASS_CAST:=PGstRTSPStreamTransportClass(klass);
end;


end.
