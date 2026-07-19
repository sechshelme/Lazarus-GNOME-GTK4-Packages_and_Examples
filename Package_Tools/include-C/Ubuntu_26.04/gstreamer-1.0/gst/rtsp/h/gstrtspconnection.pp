
unit gstrtspconnection;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstrtspconnection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstrtspconnection.h
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
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGMainContext  = ^GMainContext;
Pgsize  = ^gsize;
PGSocket  = ^GSocket;
PGstRTSPConnection  = ^GstRTSPConnection;
PGstRTSPEvent  = ^GstRTSPEvent;
PGstRTSPMessage  = ^GstRTSPMessage;
PGstRTSPUrl  = ^GstRTSPUrl;
PGstRTSPWatch  = ^GstRTSPWatch;
PGstRTSPWatchFuncs  = ^GstRTSPWatchFuncs;
PGTimeVal  = ^GTimeVal;
PGTlsCertificate  = ^GTlsCertificate;
PGTlsConnection  = ^GTlsConnection;
PGTlsDatabase  = ^GTlsDatabase;
PGTlsInteraction  = ^GTlsInteraction;
Pguint  = ^guint;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2005,2009> Wim Taymans <wim.taymans@gmail.com>
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
{
 * Unless otherwise indicated, Source Code is licensed under MIT license.
 * See further explanation attached in License Statement (distributed in the file
 * LICENSE).
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is furnished to do
 * so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
  }
{$ifndef __GST_RTSP_CONNECTION_H__}
{$define __GST_RTSP_CONNECTION_H__}
{$include <glib.h>}
{$include <gst/gstconfig.h>}
{$include <gst/rtsp/gstrtspdefs.h>}
{$include <gst/rtsp/gstrtspurl.h>}
{$include <gst/rtsp/gstrtspmessage.h>}
{$include <gio/gio.h>}
{*
 * GstRTSPConnection:
 *
 * Opaque RTSP connection object.
  }
type
{ opening/closing a connection  }
(* Const before type ignored *)

function gst_rtsp_connection_create(url:PGstRTSPUrl; conn:PPGstRTSPConnection):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_rtsp_connection_create_from_socket(socket:PGSocket; ip:Pgchar; port:Tguint16; initial_buffer:Pgchar; conn:PPGstRTSPConnection):TGstRTSPResult;cdecl;external;
function gst_rtsp_connection_accept(socket:PGSocket; conn:PPGstRTSPConnection; cancellable:PGCancellable):TGstRTSPResult;cdecl;external;
function gst_rtsp_connection_connect_usec(conn:PGstRTSPConnection; timeout:Tgint64):TGstRTSPResult;cdecl;external;
function gst_rtsp_connection_connect_with_response_usec(conn:PGstRTSPConnection; timeout:Tgint64; response:PGstRTSPMessage):TGstRTSPResult;cdecl;external;
function gst_rtsp_connection_close(conn:PGstRTSPConnection):TGstRTSPResult;cdecl;external;
function gst_rtsp_connection_free(conn:PGstRTSPConnection):TGstRTSPResult;cdecl;external;
{ TLS connections  }
function gst_rtsp_connection_get_tls(conn:PGstRTSPConnection; error:PPGError):PGTlsConnection;cdecl;external;
function gst_rtsp_connection_set_tls_validation_flags(conn:PGstRTSPConnection; flags:TGTlsCertificateFlags):Tgboolean;cdecl;external;
function gst_rtsp_connection_get_tls_validation_flags(conn:PGstRTSPConnection):TGTlsCertificateFlags;cdecl;external;
procedure gst_rtsp_connection_set_tls_database(conn:PGstRTSPConnection; database:PGTlsDatabase);cdecl;external;
function gst_rtsp_connection_get_tls_database(conn:PGstRTSPConnection):PGTlsDatabase;cdecl;external;
procedure gst_rtsp_connection_set_tls_interaction(conn:PGstRTSPConnection; interaction:PGTlsInteraction);cdecl;external;
function gst_rtsp_connection_get_tls_interaction(conn:PGstRTSPConnection):PGTlsInteraction;cdecl;external;
type

  TGstRTSPConnectionAcceptCertificateFunc = function (conn:PGTlsConnection; peer_cert:PGTlsCertificate; errors:TGTlsCertificateFlags; user_data:Tgpointer):Tgboolean;cdecl;

procedure gst_rtsp_connection_set_accept_certificate_func(conn:PGstRTSPConnection; func:TGstRTSPConnectionAcceptCertificateFunc; user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external;
{ sending/receiving raw bytes  }
function gst_rtsp_connection_read_usec(conn:PGstRTSPConnection; data:Pguint8; size:Tguint; timeout:Tgint64):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_connection_write_usec(conn:PGstRTSPConnection; data:Pguint8; size:Tguint; timeout:Tgint64):TGstRTSPResult;cdecl;external;
{ sending/receiving messages  }
function gst_rtsp_connection_send_usec(conn:PGstRTSPConnection; message:PGstRTSPMessage; timeout:Tgint64):TGstRTSPResult;cdecl;external;
function gst_rtsp_connection_send_messages_usec(conn:PGstRTSPConnection; messages:PGstRTSPMessage; n_messages:Tguint; timeout:Tgint64):TGstRTSPResult;cdecl;external;
function gst_rtsp_connection_receive_usec(conn:PGstRTSPConnection; message:PGstRTSPMessage; timeout:Tgint64):TGstRTSPResult;cdecl;external;
{ status management  }
function gst_rtsp_connection_poll_usec(conn:PGstRTSPConnection; events:TGstRTSPEvent; revents:PGstRTSPEvent; timeout:Tgint64):TGstRTSPResult;cdecl;external;
{ reset the timeout  }
function gst_rtsp_connection_next_timeout_usec(conn:PGstRTSPConnection):Tgint64;cdecl;external;
function gst_rtsp_connection_reset_timeout(conn:PGstRTSPConnection):TGstRTSPResult;cdecl;external;
{ flushing state  }
function gst_rtsp_connection_flush(conn:PGstRTSPConnection; flush:Tgboolean):TGstRTSPResult;cdecl;external;
{ HTTP proxy support  }
(* Const before type ignored *)
function gst_rtsp_connection_set_proxy(conn:PGstRTSPConnection; host:Pgchar; port:Tguint):TGstRTSPResult;cdecl;external;
{ configure authentication data  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_rtsp_connection_set_auth(conn:PGstRTSPConnection; method:TGstRTSPAuthMethod; user:Pgchar; pass:Pgchar):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_rtsp_connection_set_auth_param(conn:PGstRTSPConnection; param:Pgchar; value:Pgchar);cdecl;external;
procedure gst_rtsp_connection_clear_auth_params(conn:PGstRTSPConnection);cdecl;external;
{ configure DSCP  }
function gst_rtsp_connection_set_qos_dscp(conn:PGstRTSPConnection; qos_dscp:Tguint):TGstRTSPResult;cdecl;external;
{ Content-Length limit  }
procedure gst_rtsp_connection_set_content_length_limit(conn:PGstRTSPConnection; limit:Tguint);cdecl;external;
{ accessors  }
(* Const before type ignored *)
function gst_rtsp_connection_get_url(conn:PGstRTSPConnection):PGstRTSPUrl;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_rtsp_connection_get_ip(conn:PGstRTSPConnection):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gst_rtsp_connection_set_ip(conn:PGstRTSPConnection; ip:Pgchar);cdecl;external;
(* Const before type ignored *)
function gst_rtsp_connection_get_read_socket(conn:PGstRTSPConnection):PGSocket;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_connection_get_write_socket(conn:PGstRTSPConnection):PGSocket;cdecl;external;
procedure gst_rtsp_connection_set_http_mode(conn:PGstRTSPConnection; enable:Tgboolean);cdecl;external;
{ tunneling  }
procedure gst_rtsp_connection_set_tunneled(conn:PGstRTSPConnection; tunneled:Tgboolean);cdecl;external;
(* Const before type ignored *)
function gst_rtsp_connection_is_tunneled(conn:PGstRTSPConnection):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_rtsp_connection_get_tunnelid(conn:PGstRTSPConnection):Pgchar;cdecl;external;
function gst_rtsp_connection_do_tunnel(conn:PGstRTSPConnection; conn2:PGstRTSPConnection):TGstRTSPResult;cdecl;external;
procedure gst_rtsp_connection_set_remember_session_id(conn:PGstRTSPConnection; remember:Tgboolean);cdecl;external;
function gst_rtsp_connection_get_remember_session_id(conn:PGstRTSPConnection):Tgboolean;cdecl;external;
procedure gst_rtsp_connection_set_ignore_x_server_reply(conn:PGstRTSPConnection; ignore:Tgboolean);cdecl;external;
(* Const before type ignored *)
function gst_rtsp_connection_get_ignore_x_server_reply(conn:PGstRTSPConnection):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_rtsp_connection_add_extra_http_request_header(conn:PGstRTSPConnection; key:Pgchar; value:Pgchar);cdecl;external;
{ async IO  }
{*
 * GstRTSPWatch:
 *
 * Opaque RTSP watch object that can be used for asynchronous RTSP
 * operations.
  }
type
{*
 * GstRTSPWatchFuncs:
 * @message_received: callback when a message was received
 * @message_sent: callback when a message was sent
 * @closed: callback when the connection is closed
 * @error: callback when an error occurred
 * @tunnel_start: a client started a tunneled connection. The tunnelid of the
 *   connection must be saved.
 * @tunnel_complete: a client finished a tunneled connection. In this callback
 *   you usually pair the tunnelid of this connection with the saved one using
 *   gst_rtsp_connection_do_tunnel().
 * @error_full: callback when an error occurred with more information than
 *   the @error callback.
 * @tunnel_lost: callback when the post connection of a tunnel is closed.
 * @tunnel_http_response: callback when an HTTP response to the GET request
 *   is about to be sent for a tunneled connection. The response can be
 *   modified in the callback. Since: 1.4.
 *
 * Callback functions from a #GstRTSPWatch.
  }
{< private > }

  PGstRTSPWatchFuncs = ^TGstRTSPWatchFuncs;
  TGstRTSPWatchFuncs = record
      message_received : function (watch:PGstRTSPWatch; message:PGstRTSPMessage; user_data:Tgpointer):TGstRTSPResult;cdecl;
      message_sent : function (watch:PGstRTSPWatch; id:Tguint; user_data:Tgpointer):TGstRTSPResult;cdecl;
      closed : function (watch:PGstRTSPWatch; user_data:Tgpointer):TGstRTSPResult;cdecl;
      error : function (watch:PGstRTSPWatch; result:TGstRTSPResult; user_data:Tgpointer):TGstRTSPResult;cdecl;
      tunnel_start : function (watch:PGstRTSPWatch; user_data:Tgpointer):TGstRTSPStatusCode;cdecl;
      tunnel_complete : function (watch:PGstRTSPWatch; user_data:Tgpointer):TGstRTSPResult;cdecl;
      error_full : function (watch:PGstRTSPWatch; result:TGstRTSPResult; message:PGstRTSPMessage; id:Tguint; user_data:Tgpointer):TGstRTSPResult;cdecl;
      tunnel_lost : function (watch:PGstRTSPWatch; user_data:Tgpointer):TGstRTSPResult;cdecl;
      tunnel_http_response : function (watch:PGstRTSPWatch; request:PGstRTSPMessage; response:PGstRTSPMessage; user_data:Tgpointer):TGstRTSPResult;cdecl;
      _gst_reserved : array[0..(GST_PADDING-1)-1] of Tgpointer;
    end;

function gst_rtsp_watch_new(conn:PGstRTSPConnection; funcs:PGstRTSPWatchFuncs; user_data:Tgpointer; notify:TGDestroyNotify):PGstRTSPWatch;cdecl;external;
procedure gst_rtsp_watch_reset(watch:PGstRTSPWatch);cdecl;external;
procedure gst_rtsp_watch_unref(watch:PGstRTSPWatch);cdecl;external;
function gst_rtsp_watch_attach(watch:PGstRTSPWatch; context:PGMainContext):Tguint;cdecl;external;
procedure gst_rtsp_watch_set_send_backlog(watch:PGstRTSPWatch; bytes:Tgsize; messages:Tguint);cdecl;external;
procedure gst_rtsp_watch_get_send_backlog(watch:PGstRTSPWatch; bytes:Pgsize; messages:Pguint);cdecl;external;
(* Const before type ignored *)
function gst_rtsp_watch_write_data(watch:PGstRTSPWatch; data:Pguint8; size:Tguint; id:Pguint):TGstRTSPResult;cdecl;external;
function gst_rtsp_watch_send_message(watch:PGstRTSPWatch; message:PGstRTSPMessage; id:Pguint):TGstRTSPResult;cdecl;external;
function gst_rtsp_watch_send_messages(watch:PGstRTSPWatch; messages:PGstRTSPMessage; n_messages:Tguint; id:Pguint):TGstRTSPResult;cdecl;external;
function gst_rtsp_watch_wait_backlog_usec(watch:PGstRTSPWatch; timeout:Tgint64):TGstRTSPResult;cdecl;external;
procedure gst_rtsp_watch_set_flushing(watch:PGstRTSPWatch; flushing:Tgboolean);cdecl;external;
{$ifndef GST_DISABLE_DEPRECATED}
{ Deprecated  }
{GST_RTSP_DEPRECATED_FOR (gst_rtsp_connection_connect_usec) }

function gst_rtsp_connection_connect(conn:PGstRTSPConnection; timeout:PGTimeVal):TGstRTSPResult;cdecl;external;
{GST_RTSP_DEPRECATED_FOR (gst_rtsp_connection_connect_with_response_usec) }
function gst_rtsp_connection_connect_with_response(conn:PGstRTSPConnection; timeout:PGTimeVal; response:PGstRTSPMessage):TGstRTSPResult;cdecl;external;
{GST_RTSP_DEPRECATED_FOR (gst_rtsp_connection_read_usec) }
function gst_rtsp_connection_read(conn:PGstRTSPConnection; data:Pguint8; size:Tguint; timeout:PGTimeVal):TGstRTSPResult;cdecl;external;
{GST_RTSP_DEPRECATED_FOR (gst_rtsp_connection_write_usec) }
(* Const before type ignored *)
function gst_rtsp_connection_write(conn:PGstRTSPConnection; data:Pguint8; size:Tguint; timeout:PGTimeVal):TGstRTSPResult;cdecl;external;
{GST_RTSP_DEPRECATED_FOR (gst_rtsp_connection_send_usec) }
function gst_rtsp_connection_send(conn:PGstRTSPConnection; message:PGstRTSPMessage; timeout:PGTimeVal):TGstRTSPResult;cdecl;external;
{GST_RTSP_DEPRECATED_FOR (gst_rtsp_connection_send_messages_usec) }
function gst_rtsp_connection_send_messages(conn:PGstRTSPConnection; messages:PGstRTSPMessage; n_messages:Tguint; timeout:PGTimeVal):TGstRTSPResult;cdecl;external;
{GST_RTSP_DEPRECATED_FOR (gst_rtsp_connection_receive_usec) }
function gst_rtsp_connection_receive(conn:PGstRTSPConnection; message:PGstRTSPMessage; timeout:PGTimeVal):TGstRTSPResult;cdecl;external;
{GST_RTSP_DEPRECATED_FOR (gst_rtsp_connection_poll_usec) }
function gst_rtsp_connection_poll(conn:PGstRTSPConnection; events:TGstRTSPEvent; revents:PGstRTSPEvent; timeout:PGTimeVal):TGstRTSPResult;cdecl;external;
{GST_RTSP_DEPRECATED_FOR (gst_rtsp_connection_next_timeout_usec) }
function gst_rtsp_connection_next_timeout(conn:PGstRTSPConnection; timeout:PGTimeVal):TGstRTSPResult;cdecl;external;
{GST_RTSP_DEPRECATED_FOR (gst_rtsp_watch_wait_backlog_usec) }
function gst_rtsp_watch_wait_backlog(watch:PGstRTSPWatch; timeout:PGTimeVal):TGstRTSPResult;cdecl;external;
{$endif}
{ GST_DISABLE_DEPRECATED  }
{$endif}
{ __GST_RTSP_CONNECTION_H__  }

implementation


end.
