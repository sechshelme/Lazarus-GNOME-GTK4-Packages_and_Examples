unit rtsp_context;

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
{$ifndef __GST_RTSP_CONTEXT_H__}
{$define __GST_RTSP_CONTEXT_H__}

type
{$include "rtsp-server-prelude.h"}
{$include "rtsp-server-object.h"}
{$include "rtsp-media.h"}
{$include "rtsp-media-factory.h"}
{$include "rtsp-session-media.h"}
{$include "rtsp-auth.h"}
{$include "rtsp-thread-pool.h"}
{$include "rtsp-token.h"}
{*
 * GstRTSPContext:
 * @server: the server
 * @conn: the connection
 * @client: the client
 * @request: the complete request
 * @uri: the complete url parsed from @request
 * @method: the parsed method of @uri
 * @auth: the current auth object or %NULL
 * @token: authorisation token
 * @session: the session, can be %NULL
 * @sessmedia: the session media for the url can be %NULL
 * @factory: the media factory for the url, can be %NULL
 * @media: the media for the url can be %NULL
 * @stream: the stream for the url can be %NULL
 * @response: the response
 * @trans: the stream transport, can be %NULL
 *
 * Information passed around containing the context of a request.
  }
{< private > }
type
  PGstRTSPContext = ^TGstRTSPContext;
  TGstRTSPContext = record
      server : PGstRTSPServer;
      conn : PGstRTSPConnection;
      client : PGstRTSPClient;
      request : PGstRTSPMessage;
      uri : PGstRTSPUrl;
      method : TGstRTSPMethod;
      auth : PGstRTSPAuth;
      token : PGstRTSPToken;
      session : PGstRTSPSession;
      sessmedia : PGstRTSPSessionMedia;
      factory : PGstRTSPMediaFactory;
      media : PGstRTSPMedia;
      stream : PGstRTSPStream;
      response : PGstRTSPMessage;
      trans : PGstRTSPStreamTransport;
      _gst_reserved : array[0..(GST_PADDING-1)-1] of Tgpointer;
    end;


function gst_rtsp_context_get_type:TGType;cdecl;external libgstrtsp;
function gst_rtsp_context_get_current:PGstRTSPContext;cdecl;external libgstrtsp;
procedure gst_rtsp_context_push_current(ctx:PGstRTSPContext);cdecl;external libgstrtsp;
procedure gst_rtsp_context_pop_current(ctx:PGstRTSPContext);cdecl;external libgstrtsp;
procedure gst_rtsp_context_set_token(ctx:PGstRTSPContext; token:PGstRTSPToken);cdecl;external libgstrtsp;
{$endif}
{ __GST_RTSP_CONTEXT_H__  }

// === Konventiert am: 20-7-26 13:45:41 ===

function GST_TYPE_RTSP_CONTEXT : TGType;

implementation

function GST_TYPE_RTSP_CONTEXT : TGType;
  begin
    GST_TYPE_RTSP_CONTEXT:=gst_rtsp_context_get_type;
  end;



end.
