unit rtsp_stream;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, fp_gst_rtsp, rtsp_stream_transport, rtsp_session, rtsp_address_pool;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstRTSPStreamPrivate = type Pointer;

  PGstRTSPStream = ^TGstRTSPStream;
  TGstRTSPStream = record
    parent: TGObject;
    priv: PGstRTSPStreamPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPStreamClass = ^TGstRTSPStreamClass;
  TGstRTSPStreamClass = record
    parent_class: TGObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  TGstRTSPStreamTransportFilterFunc = function(stream: PGstRTSPStream; trans: PGstRTSPStreamTransport; user_data: Tgpointer): TGstRTSPFilterResult; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_stream_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_stream_new(idx: Tguint; payloader: PGstElement; pad: PGstPad): PGstRTSPStream; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_index(stream: PGstRTSPStream): Tguint; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_pt(stream: PGstRTSPStream): Tguint; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_srcpad(stream: PGstRTSPStream): PGstPad; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_sinkpad(stream: PGstRTSPStream): PGstPad; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_control(stream: PGstRTSPStream; control: Pgchar); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_control(stream: PGstRTSPStream): Pgchar; cdecl; external libgstrtsp;
function gst_rtsp_stream_has_control(stream: PGstRTSPStream; control: Pgchar): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_mtu(stream: PGstRTSPStream; mtu: Tguint); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_mtu(stream: PGstRTSPStream): Tguint; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_dscp_qos(stream: PGstRTSPStream; dscp_qos: Tgint); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_dscp_qos(stream: PGstRTSPStream): Tgint; cdecl; external libgstrtsp;
function gst_rtsp_stream_is_transport_supported(stream: PGstRTSPStream; transport: PGstRTSPTransport): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_profiles(stream: PGstRTSPStream; profiles: TGstRTSPProfile); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_profiles(stream: PGstRTSPStream): TGstRTSPProfile; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_protocols(stream: PGstRTSPStream; protocols: TGstRTSPLowerTrans); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_protocols(stream: PGstRTSPStream): TGstRTSPLowerTrans; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_address_pool(stream: PGstRTSPStream; pool: PGstRTSPAddressPool); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_address_pool(stream: PGstRTSPStream): PGstRTSPAddressPool; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_multicast_iface(stream: PGstRTSPStream; multicast_iface: Pgchar); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_multicast_iface(stream: PGstRTSPStream): Pgchar; cdecl; external libgstrtsp;
function gst_rtsp_stream_reserve_address(stream: PGstRTSPStream; address: Pgchar; port: Tguint; n_ports: Tguint; ttl: Tguint): PGstRTSPAddress; cdecl; external libgstrtsp;
function gst_rtsp_stream_join_bin(stream: PGstRTSPStream; bin: PGstBin; rtpbin: PGstElement; state: TGstState): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_leave_bin(stream: PGstRTSPStream; bin: PGstBin; rtpbin: PGstElement): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_joined_bin(stream: PGstRTSPStream): PGstBin; cdecl; external libgstrtsp;
function gst_rtsp_stream_set_blocked(stream: PGstRTSPStream; blocked: Tgboolean): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_is_blocking(stream: PGstRTSPStream): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_unblock_linked(stream: PGstRTSPStream): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_client_side(stream: PGstRTSPStream; client_side: Tgboolean); cdecl; external libgstrtsp;
function gst_rtsp_stream_is_client_side(stream: PGstRTSPStream): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_get_server_port(stream: PGstRTSPStream; server_port: PGstRTSPRange; family: TGSocketFamily); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_multicast_address(stream: PGstRTSPStream; family: TGSocketFamily): PGstRTSPAddress; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_rtpsession(stream: PGstRTSPStream): PGObject; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_srtp_encoder(stream: PGstRTSPStream): PGstElement; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_get_ssrc(stream: PGstRTSPStream; ssrc: Pguint); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_rtpinfo(stream: PGstRTSPStream; rtptime: Pguint; seq: Pguint; clock_rate: Pguint; running_time: PGstClockTime): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_rates(stream: PGstRTSPStream; rate: Pgdouble; applied_rate: Pgdouble): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_caps(stream: PGstRTSPStream): PGstCaps; cdecl; external libgstrtsp;
function gst_rtsp_stream_recv_rtp(stream: PGstRTSPStream; buffer: PGstBuffer): TGstFlowReturn; cdecl; external libgstrtsp;
function gst_rtsp_stream_recv_rtcp(stream: PGstRTSPStream; buffer: PGstBuffer): TGstFlowReturn; cdecl; external libgstrtsp;
function gst_rtsp_stream_add_transport(stream: PGstRTSPStream; trans: PGstRTSPStreamTransport): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_remove_transport(stream: PGstRTSPStream; trans: PGstRTSPStreamTransport): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_rtp_socket(stream: PGstRTSPStream; family: TGSocketFamily): PGSocket; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_rtcp_socket(stream: PGstRTSPStream; family: TGSocketFamily): PGSocket; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_rtp_multicast_socket(stream: PGstRTSPStream; family: TGSocketFamily): PGSocket; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_rtcp_multicast_socket(stream: PGstRTSPStream; family: TGSocketFamily): PGSocket; cdecl; external libgstrtsp;
function gst_rtsp_stream_add_multicast_client_address(stream: PGstRTSPStream; destination: Pgchar; rtp_port: Tguint; rtcp_port: Tguint; family: TGSocketFamily): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_multicast_client_addresses(stream: PGstRTSPStream): Pgchar; cdecl; external libgstrtsp;
function gst_rtsp_stream_update_crypto(stream: PGstRTSPStream; ssrc: Tguint; crypto: PGstCaps): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_query_position(stream: PGstRTSPStream; position: Pgint64): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_query_stop(stream: PGstRTSPStream; stop: Pgint64): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_seekable(stream: PGstRTSPStream): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_seqnum_offset(stream: PGstRTSPStream; seqnum: Tguint16); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_current_seqnum(stream: PGstRTSPStream): Tguint16; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_retransmission_time(stream: PGstRTSPStream; time: TGstClockTime); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_retransmission_time(stream: PGstRTSPStream): TGstClockTime; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_retransmission_pt(stream: PGstRTSPStream): Tguint; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_retransmission_pt(stream: PGstRTSPStream; rtx_pt: Tguint); cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_buffer_size(stream: PGstRTSPStream; size: Tguint); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_buffer_size(stream: PGstRTSPStream): Tguint; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_pt_map(stream: PGstRTSPStream; pt: Tguint; caps: PGstCaps); cdecl; external libgstrtsp;
function gst_rtsp_stream_request_aux_sender(stream: PGstRTSPStream; sessid: Tguint): PGstElement; cdecl; external libgstrtsp;
function gst_rtsp_stream_request_aux_receiver(stream: PGstRTSPStream; sessid: Tguint): PGstElement; cdecl; external libgstrtsp;
function gst_rtsp_stream_allocate_udp_sockets(stream: PGstRTSPStream; family: TGSocketFamily; transport: PGstRTSPTransport; use_client_settings: Tgboolean): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_publish_clock_mode(stream: PGstRTSPStream; mode: TGstRTSPPublishClockMode); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_publish_clock_mode(stream: PGstRTSPStream): TGstRTSPPublishClockMode; cdecl; external libgstrtsp;
function gst_rtsp_stream_set_max_mcast_ttl(stream: PGstRTSPStream; ttl: Tguint): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_max_mcast_ttl(stream: PGstRTSPStream): Tguint; cdecl; external libgstrtsp;
function gst_rtsp_stream_verify_mcast_ttl(stream: PGstRTSPStream; ttl: Tguint): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_bind_mcast_address(stream: PGstRTSPStream; bind_mcast_addr: Tgboolean); cdecl; external libgstrtsp;
function gst_rtsp_stream_is_bind_mcast_address(stream: PGstRTSPStream): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_complete_stream(stream: PGstRTSPStream; transport: PGstRTSPTransport): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_is_complete(stream: PGstRTSPStream): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_is_sender(stream: PGstRTSPStream): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_is_receiver(stream: PGstRTSPStream): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_handle_keymgmt(stream: PGstRTSPStream; keymgmt: Pgchar): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_stream_get_ulpfec_enabled(stream: PGstRTSPStream): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_ulpfec_pt(stream: PGstRTSPStream; pt: Tguint); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_ulpfec_pt(stream: PGstRTSPStream): Tguint; cdecl; external libgstrtsp;
function gst_rtsp_stream_request_ulpfec_decoder(stream: PGstRTSPStream; rtpbin: PGstElement; sessid: Tguint): PGstElement; cdecl; external libgstrtsp;
function gst_rtsp_stream_request_ulpfec_encoder(stream: PGstRTSPStream; sessid: Tguint): PGstElement; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_ulpfec_percentage(stream: PGstRTSPStream; percentage: Tguint); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_ulpfec_percentage(stream: PGstRTSPStream): Tguint; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_set_rate_control(stream: PGstRTSPStream; enabled: Tgboolean); cdecl; external libgstrtsp;
function gst_rtsp_stream_get_rate_control(stream: PGstRTSPStream): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_stream_unblock_rtcp(stream: PGstRTSPStream); cdecl; external libgstrtsp;

function gst_rtsp_stream_transport_filter(stream: PGstRTSPStream; func: TGstRTSPStreamTransportFilterFunc; user_data: Tgpointer): PGList; cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:43:03 ===

function GST_TYPE_RTSP_STREAM: TGType;
function GST_RTSP_STREAM(obj: Pointer): PGstRTSPStream;
function GST_RTSP_STREAM_CLASS(klass: Pointer): PGstRTSPStreamClass;
function GST_IS_RTSP_STREAM(obj: Pointer): Tgboolean;
function GST_IS_RTSP_STREAM_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_STREAM_GET_CLASS(obj: Pointer): PGstRTSPStreamClass;
function GST_RTSP_STREAM_CAST(obj: Pointer): PGstRTSPStream; inline;
function GST_RTSP_STREAM_CLASS_CAST(klass: Pointer): PGstRTSPStreamClass; inline;
{$ENDIF read_function}

implementation

function GST_TYPE_RTSP_STREAM: TGType;
begin
  Result := gst_rtsp_stream_get_type;
end;

function GST_RTSP_STREAM(obj: Pointer): PGstRTSPStream;
begin
  Result := PGstRTSPStream(g_type_check_instance_cast(obj, GST_TYPE_RTSP_STREAM));
end;

function GST_RTSP_STREAM_CLASS(klass: Pointer): PGstRTSPStreamClass;
begin
  Result := PGstRTSPStreamClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_STREAM));
end;

function GST_IS_RTSP_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_STREAM);
end;

function GST_IS_RTSP_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_STREAM);
end;

function GST_RTSP_STREAM_GET_CLASS(obj: Pointer): PGstRTSPStreamClass;
begin
  Result := PGstRTSPStreamClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_STREAM_CAST(obj: Pointer): PGstRTSPStream;
begin
  Result := PGstRTSPStream(obj);
end;

function GST_RTSP_STREAM_CLASS_CAST(klass: Pointer): PGstRTSPStreamClass;
begin
  Result := PGstRTSPStreamClass(klass);
end;

end.
