
{$IFDEF read_interface}

const
  GST_RTCP_VERSION = 2;

type
  PGstRTCPType = ^TGstRTCPType;
  TGstRTCPType = longint;

const
  GST_RTCP_TYPE_INVALID = 0;
  GST_RTCP_TYPE_SR = 200;
  GST_RTCP_TYPE_RR = 201;
  GST_RTCP_TYPE_SDES = 202;
  GST_RTCP_TYPE_BYE = 203;
  GST_RTCP_TYPE_APP = 204;
  GST_RTCP_TYPE_RTPFB = 205;
  GST_RTCP_TYPE_PSFB = 206;
  GST_RTCP_TYPE_XR = 207;

type
  PGstRTCPFBType = ^TGstRTCPFBType;
  TGstRTCPFBType = longint;

const
  GST_RTCP_FB_TYPE_INVALID = 0;
  GST_RTCP_RTPFB_TYPE_NACK = 1;
  GST_RTCP_RTPFB_TYPE_TMMBR = 3;
  GST_RTCP_RTPFB_TYPE_TMMBN = 4;
  GST_RTCP_RTPFB_TYPE_RTCP_SR_REQ = 5;
  GST_RTCP_RTPFB_TYPE_TWCC = 15;
  GST_RTCP_PSFB_TYPE_PLI = 1;
  GST_RTCP_PSFB_TYPE_SLI = 2;
  GST_RTCP_PSFB_TYPE_RPSI = 3;
  GST_RTCP_PSFB_TYPE_AFB = 15;
  GST_RTCP_PSFB_TYPE_FIR = 4;
  GST_RTCP_PSFB_TYPE_TSTR = 5;
  GST_RTCP_PSFB_TYPE_TSTN = 6;
  GST_RTCP_PSFB_TYPE_VBCN = 7;
const
  GST_RTCP_RTPFB_TYPE_RCTP_SR_REQ = GST_RTCP_RTPFB_TYPE_RTCP_SR_REQ;


type
  PGstRTCPSDESType = ^TGstRTCPSDESType;
  TGstRTCPSDESType = longint;

const
  GST_RTCP_SDES_INVALID = -(1);
  GST_RTCP_SDES_END = 0;
  GST_RTCP_SDES_CNAME = 1;
  GST_RTCP_SDES_NAME = 2;
  GST_RTCP_SDES_EMAIL = 3;
  GST_RTCP_SDES_PHONE = 4;
  GST_RTCP_SDES_LOC = 5;
  GST_RTCP_SDES_TOOL = 6;
  GST_RTCP_SDES_NOTE = 7;
  GST_RTCP_SDES_PRIV = 8;
  GST_RTCP_SDES_H323_CADDR = 9;
  GST_RTCP_SDES_APSI = 10;
  GST_RTCP_SDES_RGRP = 11;
  GST_RTCP_SDES_RTP_STREAM_ID = 12;
  GST_RTCP_SDES_REPAIRED_RTP_STREAM_ID = 13;
  GST_RTCP_SDES_CCID = 14;
  GST_RTCP_SDES_MID = 15;

type
  PGstRTCPXRType = ^TGstRTCPXRType;
  TGstRTCPXRType = longint;

const
  GST_RTCP_XR_TYPE_INVALID = -(1);
  GST_RTCP_XR_TYPE_LRLE = 1;
  GST_RTCP_XR_TYPE_DRLE = 2;
  GST_RTCP_XR_TYPE_PRT = 3;
  GST_RTCP_XR_TYPE_RRT = 4;
  GST_RTCP_XR_TYPE_DLRR = 5;
  GST_RTCP_XR_TYPE_SSUMM = 6;
  GST_RTCP_XR_TYPE_VOIP_METRICS = 7;

const
  GST_RTCP_MAX_SDES = 255;
  GST_RTCP_MAX_RB_COUNT = 31;
  GST_RTCP_MAX_SDES_ITEM_COUNT = 31;
  GST_RTCP_MAX_BYE_SSRC_COUNT = 31;
  GST_RTCP_VALID_MASK = ($c000 or $2000) or $fe;
  GST_RTCP_REDUCED_SIZE_VALID_MASK = $c000 or $f8;
  GST_RTCP_VALID_VALUE = (GST_RTCP_VERSION shl 14) or GST_RTCP_TYPE_SR;

type
  TGstRTCPBuffer = record
    buffer: PGstBuffer;
    map: TGstMapInfo;
  end;
  PGstRTCPBuffer = ^TGstRTCPBuffer;

  TGstRTCPPacket = record
    rtcp: PGstRTCPBuffer;
    offset: Tguint;
    padding: Tgboolean;
    Count: Tguint8;
    _type: TGstRTCPType;
    length: Tguint16;
    item_offset: Tguint;
    item_count: Tguint;
    entry_offset: Tguint;
  end;
  PGstRTCPPacket = ^TGstRTCPPacket;

function gst_rtcp_buffer_new_take_data(Data: Tgpointer; len: Tguint): PGstBuffer; cdecl; external libgstrtp;
function gst_rtcp_buffer_new_copy_data(Data: Tgconstpointer; len: Tguint): PGstBuffer; cdecl; external libgstrtp;
function gst_rtcp_buffer_validate_data(Data: Pguint8; len: Tguint): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_buffer_validate(buffer: PGstBuffer): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_buffer_validate_data_reduced(Data: Pguint8; len: Tguint): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_buffer_validate_reduced(buffer: PGstBuffer): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_buffer_new(mtu: Tguint): PGstBuffer; cdecl; external libgstrtp;
function gst_rtcp_buffer_map(buffer: PGstBuffer; flags: TGstMapFlags; rtcp: PGstRTCPBuffer): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_buffer_unmap(rtcp: PGstRTCPBuffer): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_buffer_get_packet_count(rtcp: PGstRTCPBuffer): Tguint; cdecl; external libgstrtp;
function gst_rtcp_buffer_get_first_packet(rtcp: PGstRTCPBuffer; packet: PGstRTCPPacket): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_move_to_next(packet: PGstRTCPPacket): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_buffer_add_packet(rtcp: PGstRTCPBuffer; _type: TGstRTCPType; packet: PGstRTCPPacket): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_remove(packet: PGstRTCPPacket): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_get_padding(packet: PGstRTCPPacket): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_get_count(packet: PGstRTCPPacket): Tguint8; cdecl; external libgstrtp;
function gst_rtcp_packet_get_type(packet: PGstRTCPPacket): TGstRTCPType; cdecl; external libgstrtp;
function gst_rtcp_packet_get_length(packet: PGstRTCPPacket): Tguint16; cdecl; external libgstrtp;
procedure gst_rtcp_packet_sr_get_sender_info(packet: PGstRTCPPacket; ssrc: Pguint32; ntptime: Pguint64; rtptime: Pguint32; packet_count: Pguint32;
  octet_count: Pguint32); cdecl; external libgstrtp;
procedure gst_rtcp_packet_sr_set_sender_info(packet: PGstRTCPPacket; ssrc: Tguint32; ntptime: Tguint64; rtptime: Tguint32; packet_count: Tguint32;
  octet_count: Tguint32); cdecl; external libgstrtp;
function gst_rtcp_packet_rr_get_ssrc(packet: PGstRTCPPacket): Tguint32; cdecl; external libgstrtp;
procedure gst_rtcp_packet_rr_set_ssrc(packet: PGstRTCPPacket; ssrc: Tguint32); cdecl; external libgstrtp;
function gst_rtcp_packet_get_rb_count(packet: PGstRTCPPacket): Tguint; cdecl; external libgstrtp;
procedure gst_rtcp_packet_get_rb(packet: PGstRTCPPacket; nth: Tguint; ssrc: Pguint32; fractionlost: Pguint8; packetslost: Pgint32;
  exthighestseq: Pguint32; jitter: Pguint32; lsr: Pguint32; dlsr: Pguint32); cdecl; external libgstrtp;
function gst_rtcp_packet_add_rb(packet: PGstRTCPPacket; ssrc: Tguint32; fractionlost: Tguint8; packetslost: Tgint32; exthighestseq: Tguint32;
  jitter: Tguint32; lsr: Tguint32; dlsr: Tguint32): Tgboolean; cdecl; external libgstrtp;
procedure gst_rtcp_packet_set_rb(packet: PGstRTCPPacket; nth: Tguint; ssrc: Tguint32; fractionlost: Tguint8; packetslost: Tgint32;
  exthighestseq: Tguint32; jitter: Tguint32; lsr: Tguint32; dlsr: Tguint32); cdecl; external libgstrtp;
function gst_rtcp_packet_add_profile_specific_ext(packet: PGstRTCPPacket; Data: Pguint8; len: Tguint): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_get_profile_specific_ext_length(packet: PGstRTCPPacket): Tguint16; cdecl; external libgstrtp;
function gst_rtcp_packet_get_profile_specific_ext(packet: PGstRTCPPacket; Data: PPguint8; len: Pguint): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_copy_profile_specific_ext(packet: PGstRTCPPacket; Data: PPguint8; len: Pguint): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_sdes_get_item_count(packet: PGstRTCPPacket): Tguint; cdecl; external libgstrtp;
function gst_rtcp_packet_sdes_first_item(packet: PGstRTCPPacket): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_sdes_next_item(packet: PGstRTCPPacket): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_sdes_get_ssrc(packet: PGstRTCPPacket): Tguint32; cdecl; external libgstrtp;
function gst_rtcp_packet_sdes_first_entry(packet: PGstRTCPPacket): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_sdes_next_entry(packet: PGstRTCPPacket): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_sdes_get_entry(packet: PGstRTCPPacket; _type: PGstRTCPSDESType; len: Pguint8; Data: PPguint8): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_sdes_copy_entry(packet: PGstRTCPPacket; _type: PGstRTCPSDESType; len: Pguint8; Data: PPguint8): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_sdes_add_item(packet: PGstRTCPPacket; ssrc: Tguint32): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_sdes_add_entry(packet: PGstRTCPPacket; _type: TGstRTCPSDESType; len: Tguint8; Data: Pguint8): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_bye_get_ssrc_count(packet: PGstRTCPPacket): Tguint; cdecl; external libgstrtp;
function gst_rtcp_packet_bye_get_nth_ssrc(packet: PGstRTCPPacket; nth: Tguint): Tguint32; cdecl; external libgstrtp;
function gst_rtcp_packet_bye_add_ssrc(packet: PGstRTCPPacket; ssrc: Tguint32): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_bye_add_ssrcs(packet: PGstRTCPPacket; ssrc: Pguint32; len: Tguint): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_bye_get_reason_len(packet: PGstRTCPPacket): Tguint8; cdecl; external libgstrtp;
function gst_rtcp_packet_bye_get_reason(packet: PGstRTCPPacket): Pgchar; cdecl; external libgstrtp;
function gst_rtcp_packet_bye_set_reason(packet: PGstRTCPPacket; reason: Pgchar): Tgboolean; cdecl; external libgstrtp;
procedure gst_rtcp_packet_app_set_subtype(packet: PGstRTCPPacket; subtype: Tguint8); cdecl; external libgstrtp;
function gst_rtcp_packet_app_get_subtype(packet: PGstRTCPPacket): Tguint8; cdecl; external libgstrtp;
procedure gst_rtcp_packet_app_set_ssrc(packet: PGstRTCPPacket; ssrc: Tguint32); cdecl; external libgstrtp;
function gst_rtcp_packet_app_get_ssrc(packet: PGstRTCPPacket): Tguint32; cdecl; external libgstrtp;
procedure gst_rtcp_packet_app_set_name(packet: PGstRTCPPacket; Name: Pgchar); cdecl; external libgstrtp;
function gst_rtcp_packet_app_get_name(packet: PGstRTCPPacket): Pgchar; cdecl; external libgstrtp;
function gst_rtcp_packet_app_get_data_length(packet: PGstRTCPPacket): Tguint16; cdecl; external libgstrtp;
function gst_rtcp_packet_app_set_data_length(packet: PGstRTCPPacket; wordlen: Tguint16): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_app_get_data(packet: PGstRTCPPacket): Pguint8; cdecl; external libgstrtp;
function gst_rtcp_packet_fb_get_sender_ssrc(packet: PGstRTCPPacket): Tguint32; cdecl; external libgstrtp;
procedure gst_rtcp_packet_fb_set_sender_ssrc(packet: PGstRTCPPacket; ssrc: Tguint32); cdecl; external libgstrtp;
function gst_rtcp_packet_fb_get_media_ssrc(packet: PGstRTCPPacket): Tguint32; cdecl; external libgstrtp;
procedure gst_rtcp_packet_fb_set_media_ssrc(packet: PGstRTCPPacket; ssrc: Tguint32); cdecl; external libgstrtp;
function gst_rtcp_packet_fb_get_type(packet: PGstRTCPPacket): TGstRTCPFBType; cdecl; external libgstrtp;
procedure gst_rtcp_packet_fb_set_type(packet: PGstRTCPPacket; _type: TGstRTCPFBType); cdecl; external libgstrtp;
function gst_rtcp_packet_fb_get_fci_length(packet: PGstRTCPPacket): Tguint16; cdecl; external libgstrtp;
function gst_rtcp_packet_fb_set_fci_length(packet: PGstRTCPPacket; wordlen: Tguint16): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_fb_get_fci(packet: PGstRTCPPacket): Pguint8; cdecl; external libgstrtp;
function gst_rtcp_ntp_to_unix(ntptime: Tguint64): Tguint64; cdecl; external libgstrtp;
function gst_rtcp_unix_to_ntp(unixtime: Tguint64): Tguint64; cdecl; external libgstrtp;
function gst_rtcp_sdes_type_to_name(_type: TGstRTCPSDESType): Pgchar; cdecl; external libgstrtp;
function gst_rtcp_sdes_name_to_type(Name: Pgchar): TGstRTCPSDESType; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_ssrc(packet: PGstRTCPPacket): Tguint32; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_first_rb(packet: PGstRTCPPacket): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_next_rb(packet: PGstRTCPPacket): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_block_type(packet: PGstRTCPPacket): TGstRTCPXRType; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_block_length(packet: PGstRTCPPacket): Tguint16; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_rle_info(packet: PGstRTCPPacket; ssrc: Pguint32; thinning: Pguint8; begin_seq: Pguint16; end_seq: Pguint16;
  chunk_count: Pguint32): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_rle_nth_chunk(packet: PGstRTCPPacket; nth: Tguint; chunk: Pguint16): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_prt_info(packet: PGstRTCPPacket; ssrc: Pguint32; thinning: Pguint8; begin_seq: Pguint16; end_seq: Pguint16): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_prt_by_seq(packet: PGstRTCPPacket; seq: Tguint16; receipt_time: Pguint32): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_rrt(packet: PGstRTCPPacket; timestamp: Pguint64): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_dlrr_block(packet: PGstRTCPPacket; nth: Tguint; ssrc: Pguint32; last_rr: Pguint32; delay: Pguint32): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_summary_info(packet: PGstRTCPPacket; ssrc: Pguint32; begin_seq: Pguint16; end_seq: Pguint16): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_summary_pkt(packet: PGstRTCPPacket; lost_packets: Pguint32; dup_packets: Pguint32): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_summary_jitter(packet: PGstRTCPPacket; min_jitter: Pguint32; max_jitter: Pguint32; mean_jitter: Pguint32; dev_jitter: Pguint32): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_summary_ttl(packet: PGstRTCPPacket; is_ipv4: Pgboolean; min_ttl: Pguint8; max_ttl: Pguint8; mean_ttl: Pguint8;
  dev_ttl: Pguint8): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_voip_metrics_ssrc(packet: PGstRTCPPacket; ssrc: Pguint32): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_voip_packet_metrics(packet: PGstRTCPPacket; loss_rate: Pguint8; discard_rate: Pguint8): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_voip_burst_metrics(packet: PGstRTCPPacket; burst_density: Pguint8; gap_density: Pguint8; burst_duration: Pguint16; gap_duration: Pguint16): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_voip_delay_metrics(packet: PGstRTCPPacket; roundtrip_delay: Pguint16; end_system_delay: Pguint16): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_voip_signal_metrics(packet: PGstRTCPPacket; signal_level: Pguint8; noise_level: Pguint8; rerl: Pguint8; gmin: Pguint8): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_voip_quality_metrics(packet: PGstRTCPPacket; r_factor: Pguint8; ext_r_factor: Pguint8; mos_lq: Pguint8; mos_cq: Pguint8): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_voip_configuration_params(packet: PGstRTCPPacket; gmin: Pguint8; rx_config: Pguint8): Tgboolean; cdecl; external libgstrtp;
function gst_rtcp_packet_xr_get_voip_jitter_buffer_params(packet: PGstRTCPPacket; jb_nominal: Pguint16; jb_maximum: Pguint16; jb_abs_max: Pguint16): Tgboolean; cdecl; external libgstrtp;

// === Konventiert am: 7-10-24 16:08:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
