unit rtsp_stream_transport;

{$DEFINE read_enum}{$DEFINE read_function}{$DEFINE read_struct}

interface

uses
  fp_glib2, fp_gst, fp_gst_rtsp;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstRTSPStreamTransport = ^TGstRTSPStreamTransport;

  TGstRTSPSendFunc = function(buffer: PGstBuffer; channel: Tguint8; user_data: Tgpointer): Tgboolean; cdecl;
  TGstRTSPSendListFunc = function(buffer_list: PGstBufferList; channel: Tguint8; user_data: Tgpointer): Tgboolean; cdecl;
  TGstRTSPKeepAliveFunc = procedure(user_data: Tgpointer); cdecl;
  TGstRTSPMessageSentFunc = procedure(user_data: Tgpointer); cdecl;
  TGstRTSPMessageSentFuncFull = procedure(trans: PGstRTSPStreamTransport; user_data: Tgpointer); cdecl;

  PGstRTSPStreamTransportPrivate = type Pointer;

  TGstRTSPStreamTransport = record
    parent: TGObject;
    priv: PGstRTSPStreamTransportPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPStreamTransportClass = ^TGstRTSPStreamTransportClass;
  TGstRTSPStreamTransportClass = record
    parent_class: TGObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_stream_transport_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_stream_transport_new(stream: PGstRTSPStream; tr: PGstRTSPTransport): PGstRTSPStreamTransport; cdecl; external libgstrtsp;
function gst_rtsp_stream_transport_get_stream(trans: PGstRTSPStreamTransport): PGstRTSPStream; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_transport_set_transport(trans: PGstRTSPStreamTransport; tr: PGstRTSPTransport); cdecl; external libgstrtsp;
function gst_rtsp_stream_transport_get_transport(trans: PGstRTSPStreamTransport): PGstRTSPTransport; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_transport_set_url(trans: PGstRTSPStreamTransport; url: PGstRTSPUrl); cdecl; external libgstrtsp;
function gst_rtsp_stream_transport_get_url(trans: PGstRTSPStreamTransport): PGstRTSPUrl; cdecl; external libgstrtsp;
function gst_rtsp_stream_transport_get_rtpinfo(trans: PGstRTSPStreamTransport; start_time: TGstClockTime): Pgchar; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_transport_set_callbacks(trans: PGstRTSPStreamTransport; send_rtp: TGstRTSPSendFunc; send_rtcp: TGstRTSPSendFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstrtsp;
procedure gst_rtsp_stream_transport_set_list_callbacks(trans: PGstRTSPStreamTransport; send_rtp_list: TGstRTSPSendListFunc; send_rtcp_list: TGstRTSPSendListFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstrtsp;
procedure gst_rtsp_stream_transport_set_keepalive(trans: PGstRTSPStreamTransport; keep_alive: TGstRTSPKeepAliveFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstrtsp;
procedure gst_rtsp_stream_transport_set_message_sent(trans: PGstRTSPStreamTransport; message_sent: TGstRTSPMessageSentFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstrtsp;
procedure gst_rtsp_stream_transport_set_message_sent_full(trans: PGstRTSPStreamTransport; message_sent: TGstRTSPMessageSentFuncFull; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstrtsp;
procedure gst_rtsp_stream_transport_keep_alive(trans: PGstRTSPStreamTransport); cdecl; external libgstrtsp;
procedure gst_rtsp_stream_transport_message_sent(trans: PGstRTSPStreamTransport); cdecl; external libgstrtsp;
function gst_rtsp_stream_transport_set_active(trans: PGstRTSPStreamTransport; active: Tgboolean): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_transport_set_timed_out(trans: PGstRTSPStreamTransport; timedout: Tgboolean); cdecl; external libgstrtsp;
function gst_rtsp_stream_transport_is_timed_out(trans: PGstRTSPStreamTransport): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_transport_send_rtp(trans: PGstRTSPStreamTransport; buffer: PGstBuffer): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_transport_send_rtcp(trans: PGstRTSPStreamTransport; buffer: PGstBuffer): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_transport_send_rtp_list(trans: PGstRTSPStreamTransport; buffer_list: PGstBufferList): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_transport_send_rtcp_list(trans: PGstRTSPStreamTransport; buffer_list: PGstBufferList): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_transport_recv_data(trans: PGstRTSPStreamTransport; channel: Tguint; buffer: PGstBuffer): TGstFlowReturn; cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:42:57 ===

function GST_TYPE_RTSP_STREAM_TRANSPORT: TGType;
function GST_RTSP_STREAM_TRANSPORT(obj: Pointer): PGstRTSPStreamTransport;
function GST_RTSP_STREAM_TRANSPORT_CLASS(klass: Pointer): PGstRTSPStreamTransportClass;
function GST_IS_RTSP_STREAM_TRANSPORT(obj: Pointer): Tgboolean;
function GST_IS_RTSP_STREAM_TRANSPORT_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_STREAM_TRANSPORT_GET_CLASS(obj: Pointer): PGstRTSPStreamTransportClass;
function GST_RTSP_STREAM_TRANSPORT_CAST(obj: Pointer): PGstRTSPStreamTransport;
function GST_RTSP_STREAM_TRANSPORT_CLASS_CAST(klass: Pointer): PGstRTSPStreamTransportClass;
{$ENDIF read_function}

implementation

function GST_TYPE_RTSP_STREAM_TRANSPORT: TGType;
begin
  Result := gst_rtsp_stream_transport_get_type;
end;

function GST_RTSP_STREAM_TRANSPORT(obj: Pointer): PGstRTSPStreamTransport;
begin
  Result := PGstRTSPStreamTransport(g_type_check_instance_cast(obj, GST_TYPE_RTSP_STREAM_TRANSPORT));
end;

function GST_RTSP_STREAM_TRANSPORT_CLASS(klass: Pointer): PGstRTSPStreamTransportClass;
begin
  Result := PGstRTSPStreamTransportClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_STREAM_TRANSPORT));
end;

function GST_IS_RTSP_STREAM_TRANSPORT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_STREAM_TRANSPORT);
end;

function GST_IS_RTSP_STREAM_TRANSPORT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_STREAM_TRANSPORT);
end;

function GST_RTSP_STREAM_TRANSPORT_GET_CLASS(obj: Pointer): PGstRTSPStreamTransportClass;
begin
  Result := PGstRTSPStreamTransportClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_STREAM_TRANSPORT_CAST(obj: Pointer): PGstRTSPStreamTransport;
begin
  Result := PGstRTSPStreamTransport(obj);
end;

function GST_RTSP_STREAM_TRANSPORT_CLASS_CAST(klass: Pointer): PGstRTSPStreamTransportClass;
begin
  Result := PGstRTSPStreamTransportClass(klass);
end;


end.
