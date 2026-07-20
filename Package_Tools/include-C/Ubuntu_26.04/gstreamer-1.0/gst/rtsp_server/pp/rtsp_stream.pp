
unit rtsp_stream;
interface

{
  Automatically converted by H2Pas 1.0.0 from rtsp_stream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rtsp_stream
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
Pgdouble  = ^gdouble;
Pgint64  = ^gint64;
PGList  = ^GList;
PGObject  = ^GObject;
PGSocket  = ^GSocket;
PGstBin  = ^GstBin;
PGstBuffer  = ^GstBuffer;
PGstCaps  = ^GstCaps;
PGstClockTime  = ^GstClockTime;
PGstElement  = ^GstElement;
PGstPad  = ^GstPad;
PGstRTSPAddress  = ^GstRTSPAddress;
PGstRTSPAddressPool  = ^GstRTSPAddressPool;
PGstRTSPRange  = ^GstRTSPRange;
PGstRTSPStream  = ^GstRTSPStream;
PGstRTSPStreamClass  = ^GstRTSPStreamClass;
PGstRTSPStreamPrivate  = ^GstRTSPStreamPrivate;
PGstRTSPStreamTransport  = ^GstRTSPStreamTransport;
PGstRTSPTransport  = ^GstRTSPTransport;
Pguint  = ^guint;
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
{$include <gst/rtsp/rtsp.h>}
{$include <gio/gio.h>}
{$ifndef __GST_RTSP_STREAM_H__}
{$define __GST_RTSP_STREAM_H__}
{$include "rtsp-server-prelude.h"}
{ types for the media stream  }

{ was #define dname def_expr }
function GST_TYPE_RTSP_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_STREAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_STREAM_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_STREAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_STREAM_CAST(obj : longint) : PGstRTSPStream;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_STREAM_CLASS_CAST(klass : longint) : PGstRTSPStreamClass;

type
{$include "rtsp-stream-transport.h"}
{$include "rtsp-address-pool.h"}
{$include "rtsp-session.h"}
{$include "rtsp-media.h"}
{*
 * GstRTSPStream:
 *
 * The definition of a media stream.
  }
{< private > }
type
  PGstRTSPStream = ^TGstRTSPStream;
  TGstRTSPStream = record
      parent : TGObject;
      priv : PGstRTSPStreamPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstRTSPStreamClass = ^TGstRTSPStreamClass;
  TGstRTSPStreamClass = record
      parent_class : TGObjectClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_stream_get_type:TGType;cdecl;external;
function gst_rtsp_stream_new(idx:Tguint; payloader:PGstElement; pad:PGstPad):PGstRTSPStream;cdecl;external;
function gst_rtsp_stream_get_index(stream:PGstRTSPStream):Tguint;cdecl;external;
function gst_rtsp_stream_get_pt(stream:PGstRTSPStream):Tguint;cdecl;external;
function gst_rtsp_stream_get_srcpad(stream:PGstRTSPStream):PGstPad;cdecl;external;
function gst_rtsp_stream_get_sinkpad(stream:PGstRTSPStream):PGstPad;cdecl;external;
(* Const before type ignored *)
procedure gst_rtsp_stream_set_control(stream:PGstRTSPStream; control:Pgchar);cdecl;external;
function gst_rtsp_stream_get_control(stream:PGstRTSPStream):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_stream_has_control(stream:PGstRTSPStream; control:Pgchar):Tgboolean;cdecl;external;
procedure gst_rtsp_stream_set_mtu(stream:PGstRTSPStream; mtu:Tguint);cdecl;external;
function gst_rtsp_stream_get_mtu(stream:PGstRTSPStream):Tguint;cdecl;external;
procedure gst_rtsp_stream_set_dscp_qos(stream:PGstRTSPStream; dscp_qos:Tgint);cdecl;external;
function gst_rtsp_stream_get_dscp_qos(stream:PGstRTSPStream):Tgint;cdecl;external;
function gst_rtsp_stream_is_transport_supported(stream:PGstRTSPStream; transport:PGstRTSPTransport):Tgboolean;cdecl;external;
procedure gst_rtsp_stream_set_profiles(stream:PGstRTSPStream; profiles:TGstRTSPProfile);cdecl;external;
function gst_rtsp_stream_get_profiles(stream:PGstRTSPStream):TGstRTSPProfile;cdecl;external;
procedure gst_rtsp_stream_set_protocols(stream:PGstRTSPStream; protocols:TGstRTSPLowerTrans);cdecl;external;
function gst_rtsp_stream_get_protocols(stream:PGstRTSPStream):TGstRTSPLowerTrans;cdecl;external;
procedure gst_rtsp_stream_set_address_pool(stream:PGstRTSPStream; pool:PGstRTSPAddressPool);cdecl;external;
function gst_rtsp_stream_get_address_pool(stream:PGstRTSPStream):PGstRTSPAddressPool;cdecl;external;
(* Const before type ignored *)
procedure gst_rtsp_stream_set_multicast_iface(stream:PGstRTSPStream; multicast_iface:Pgchar);cdecl;external;
function gst_rtsp_stream_get_multicast_iface(stream:PGstRTSPStream):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_stream_reserve_address(stream:PGstRTSPStream; address:Pgchar; port:Tguint; n_ports:Tguint; ttl:Tguint):PGstRTSPAddress;cdecl;external;
function gst_rtsp_stream_join_bin(stream:PGstRTSPStream; bin:PGstBin; rtpbin:PGstElement; state:TGstState):Tgboolean;cdecl;external;
function gst_rtsp_stream_leave_bin(stream:PGstRTSPStream; bin:PGstBin; rtpbin:PGstElement):Tgboolean;cdecl;external;
function gst_rtsp_stream_get_joined_bin(stream:PGstRTSPStream):PGstBin;cdecl;external;
function gst_rtsp_stream_set_blocked(stream:PGstRTSPStream; blocked:Tgboolean):Tgboolean;cdecl;external;
function gst_rtsp_stream_is_blocking(stream:PGstRTSPStream):Tgboolean;cdecl;external;
function gst_rtsp_stream_unblock_linked(stream:PGstRTSPStream):Tgboolean;cdecl;external;
procedure gst_rtsp_stream_set_client_side(stream:PGstRTSPStream; client_side:Tgboolean);cdecl;external;
function gst_rtsp_stream_is_client_side(stream:PGstRTSPStream):Tgboolean;cdecl;external;
procedure gst_rtsp_stream_get_server_port(stream:PGstRTSPStream; server_port:PGstRTSPRange; family:TGSocketFamily);cdecl;external;
function gst_rtsp_stream_get_multicast_address(stream:PGstRTSPStream; family:TGSocketFamily):PGstRTSPAddress;cdecl;external;
function gst_rtsp_stream_get_rtpsession(stream:PGstRTSPStream):PGObject;cdecl;external;
function gst_rtsp_stream_get_srtp_encoder(stream:PGstRTSPStream):PGstElement;cdecl;external;
procedure gst_rtsp_stream_get_ssrc(stream:PGstRTSPStream; ssrc:Pguint);cdecl;external;
function gst_rtsp_stream_get_rtpinfo(stream:PGstRTSPStream; rtptime:Pguint; seq:Pguint; clock_rate:Pguint; running_time:PGstClockTime):Tgboolean;cdecl;external;
function gst_rtsp_stream_get_rates(stream:PGstRTSPStream; rate:Pgdouble; applied_rate:Pgdouble):Tgboolean;cdecl;external;
function gst_rtsp_stream_get_caps(stream:PGstRTSPStream):PGstCaps;cdecl;external;
function gst_rtsp_stream_recv_rtp(stream:PGstRTSPStream; buffer:PGstBuffer):TGstFlowReturn;cdecl;external;
function gst_rtsp_stream_recv_rtcp(stream:PGstRTSPStream; buffer:PGstBuffer):TGstFlowReturn;cdecl;external;
function gst_rtsp_stream_add_transport(stream:PGstRTSPStream; trans:PGstRTSPStreamTransport):Tgboolean;cdecl;external;
function gst_rtsp_stream_remove_transport(stream:PGstRTSPStream; trans:PGstRTSPStreamTransport):Tgboolean;cdecl;external;
function gst_rtsp_stream_get_rtp_socket(stream:PGstRTSPStream; family:TGSocketFamily):PGSocket;cdecl;external;
function gst_rtsp_stream_get_rtcp_socket(stream:PGstRTSPStream; family:TGSocketFamily):PGSocket;cdecl;external;
function gst_rtsp_stream_get_rtp_multicast_socket(stream:PGstRTSPStream; family:TGSocketFamily):PGSocket;cdecl;external;
function gst_rtsp_stream_get_rtcp_multicast_socket(stream:PGstRTSPStream; family:TGSocketFamily):PGSocket;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_stream_add_multicast_client_address(stream:PGstRTSPStream; destination:Pgchar; rtp_port:Tguint; rtcp_port:Tguint; family:TGSocketFamily):Tgboolean;cdecl;external;
function gst_rtsp_stream_get_multicast_client_addresses(stream:PGstRTSPStream):Pgchar;cdecl;external;
function gst_rtsp_stream_update_crypto(stream:PGstRTSPStream; ssrc:Tguint; crypto:PGstCaps):Tgboolean;cdecl;external;
function gst_rtsp_stream_query_position(stream:PGstRTSPStream; position:Pgint64):Tgboolean;cdecl;external;
function gst_rtsp_stream_query_stop(stream:PGstRTSPStream; stop:Pgint64):Tgboolean;cdecl;external;
function gst_rtsp_stream_seekable(stream:PGstRTSPStream):Tgboolean;cdecl;external;
procedure gst_rtsp_stream_set_seqnum_offset(stream:PGstRTSPStream; seqnum:Tguint16);cdecl;external;
function gst_rtsp_stream_get_current_seqnum(stream:PGstRTSPStream):Tguint16;cdecl;external;
procedure gst_rtsp_stream_set_retransmission_time(stream:PGstRTSPStream; time:TGstClockTime);cdecl;external;
function gst_rtsp_stream_get_retransmission_time(stream:PGstRTSPStream):TGstClockTime;cdecl;external;
function gst_rtsp_stream_get_retransmission_pt(stream:PGstRTSPStream):Tguint;cdecl;external;
procedure gst_rtsp_stream_set_retransmission_pt(stream:PGstRTSPStream; rtx_pt:Tguint);cdecl;external;
procedure gst_rtsp_stream_set_buffer_size(stream:PGstRTSPStream; size:Tguint);cdecl;external;
function gst_rtsp_stream_get_buffer_size(stream:PGstRTSPStream):Tguint;cdecl;external;
procedure gst_rtsp_stream_set_pt_map(stream:PGstRTSPStream; pt:Tguint; caps:PGstCaps);cdecl;external;
function gst_rtsp_stream_request_aux_sender(stream:PGstRTSPStream; sessid:Tguint):PGstElement;cdecl;external;
function gst_rtsp_stream_request_aux_receiver(stream:PGstRTSPStream; sessid:Tguint):PGstElement;cdecl;external;
function gst_rtsp_stream_allocate_udp_sockets(stream:PGstRTSPStream; family:TGSocketFamily; transport:PGstRTSPTransport; use_client_settings:Tgboolean):Tgboolean;cdecl;external;
procedure gst_rtsp_stream_set_publish_clock_mode(stream:PGstRTSPStream; mode:TGstRTSPPublishClockMode);cdecl;external;
function gst_rtsp_stream_get_publish_clock_mode(stream:PGstRTSPStream):TGstRTSPPublishClockMode;cdecl;external;
function gst_rtsp_stream_set_max_mcast_ttl(stream:PGstRTSPStream; ttl:Tguint):Tgboolean;cdecl;external;
function gst_rtsp_stream_get_max_mcast_ttl(stream:PGstRTSPStream):Tguint;cdecl;external;
function gst_rtsp_stream_verify_mcast_ttl(stream:PGstRTSPStream; ttl:Tguint):Tgboolean;cdecl;external;
procedure gst_rtsp_stream_set_bind_mcast_address(stream:PGstRTSPStream; bind_mcast_addr:Tgboolean);cdecl;external;
function gst_rtsp_stream_is_bind_mcast_address(stream:PGstRTSPStream):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_stream_complete_stream(stream:PGstRTSPStream; transport:PGstRTSPTransport):Tgboolean;cdecl;external;
function gst_rtsp_stream_is_complete(stream:PGstRTSPStream):Tgboolean;cdecl;external;
function gst_rtsp_stream_is_sender(stream:PGstRTSPStream):Tgboolean;cdecl;external;
function gst_rtsp_stream_is_receiver(stream:PGstRTSPStream):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_stream_handle_keymgmt(stream:PGstRTSPStream; keymgmt:Pgchar):Tgboolean;cdecl;external;
{ ULP Forward Error Correction (RFC 5109)  }
function gst_rtsp_stream_get_ulpfec_enabled(stream:PGstRTSPStream):Tgboolean;cdecl;external;
procedure gst_rtsp_stream_set_ulpfec_pt(stream:PGstRTSPStream; pt:Tguint);cdecl;external;
function gst_rtsp_stream_get_ulpfec_pt(stream:PGstRTSPStream):Tguint;cdecl;external;
function gst_rtsp_stream_request_ulpfec_decoder(stream:PGstRTSPStream; rtpbin:PGstElement; sessid:Tguint):PGstElement;cdecl;external;
function gst_rtsp_stream_request_ulpfec_encoder(stream:PGstRTSPStream; sessid:Tguint):PGstElement;cdecl;external;
procedure gst_rtsp_stream_set_ulpfec_percentage(stream:PGstRTSPStream; percentage:Tguint);cdecl;external;
function gst_rtsp_stream_get_ulpfec_percentage(stream:PGstRTSPStream):Tguint;cdecl;external;
procedure gst_rtsp_stream_set_rate_control(stream:PGstRTSPStream; enabled:Tgboolean);cdecl;external;
function gst_rtsp_stream_get_rate_control(stream:PGstRTSPStream):Tgboolean;cdecl;external;
procedure gst_rtsp_stream_unblock_rtcp(stream:PGstRTSPStream);cdecl;external;
{*
 * GstRTSPStreamTransportFilterFunc:
 * @stream: a #GstRTSPStream object
 * @trans: a #GstRTSPStreamTransport in @stream
 * @user_data: user data that has been given to gst_rtsp_stream_transport_filter()
 *
 * This function will be called by the gst_rtsp_stream_transport_filter(). An
 * implementation should return a value of #GstRTSPFilterResult.
 *
 * When this function returns #GST_RTSP_FILTER_REMOVE, @trans will be removed
 * from @stream.
 *
 * A return value of #GST_RTSP_FILTER_KEEP will leave @trans untouched in
 * @stream.
 *
 * A value of #GST_RTSP_FILTER_REF will add @trans to the result #GList of
 * gst_rtsp_stream_transport_filter().
 *
 * Returns: a #GstRTSPFilterResult.
  }
type

  TGstRTSPStreamTransportFilterFunc = function (stream:PGstRTSPStream; trans:PGstRTSPStreamTransport; user_data:Tgpointer):TGstRTSPFilterResult;cdecl;

function gst_rtsp_stream_transport_filter(stream:PGstRTSPStream; func:TGstRTSPStreamTransportFilterFunc; user_data:Tgpointer):PGList;cdecl;external;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPStream, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_STREAM_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_RTSP_STREAM : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_STREAM:=gst_rtsp_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_STREAM(obj : longint) : longint;
begin
  GST_IS_RTSP_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_STREAM_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_STREAM_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_STREAM,GstRTSPStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_STREAM(obj : longint) : longint;
begin
  GST_RTSP_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_STREAM,GstRTSPStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_STREAM_CLASS(klass : longint) : longint;
begin
  GST_RTSP_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_STREAM,GstRTSPStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_STREAM_CAST(obj : longint) : PGstRTSPStream;
begin
  GST_RTSP_STREAM_CAST:=PGstRTSPStream(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_STREAM_CLASS_CAST(klass : longint) : PGstRTSPStreamClass;
begin
  GST_RTSP_STREAM_CLASS_CAST:=PGstRTSPStreamClass(klass);
end;


end.
