
{$IFDEF read_interface}

const
  GST_RTP_VERSION = 2;

type
  TGstRTPBuffer = record
    buffer: PGstBuffer;
    state: Tguint;
    Data: array[0..3] of Tgpointer;
    size: array[0..3] of Tgsize;
    map: array[0..3] of TGstMapInfo;
  end;
  PGstRTPBuffer = ^TGstRTPBuffer;

procedure gst_rtp_buffer_allocate_data(buffer: PGstBuffer; payload_len: Tguint; pad_len: Tguint8; csrc_count: Tguint8); cdecl; external libgstrtp;
function gst_rtp_buffer_new_take_data(Data: Tgpointer; len: Tgsize): PGstBuffer; cdecl; external libgstrtp;
function gst_rtp_buffer_new_copy_data(Data: Tgconstpointer; len: Tgsize): PGstBuffer; cdecl; external libgstrtp;
function gst_rtp_buffer_new_allocate(payload_len: Tguint; pad_len: Tguint8; csrc_count: Tguint8): PGstBuffer; cdecl; external libgstrtp;
function gst_rtp_buffer_new_allocate_len(packet_len: Tguint; pad_len: Tguint8; csrc_count: Tguint8): PGstBuffer; cdecl; external libgstrtp;
function gst_rtp_buffer_calc_header_len(csrc_count: Tguint8): Tguint; cdecl; external libgstrtp;
function gst_rtp_buffer_calc_packet_len(payload_len: Tguint; pad_len: Tguint8; csrc_count: Tguint8): Tguint; cdecl; external libgstrtp;
function gst_rtp_buffer_calc_payload_len(packet_len: Tguint; pad_len: Tguint8; csrc_count: Tguint8): Tguint; cdecl; external libgstrtp;
function gst_rtp_buffer_map(buffer: PGstBuffer; flags: TGstMapFlags; rtp: PGstRTPBuffer): Tgboolean; cdecl; external libgstrtp;
procedure gst_rtp_buffer_unmap(rtp: PGstRTPBuffer); cdecl; external libgstrtp;
procedure gst_rtp_buffer_set_packet_len(rtp: PGstRTPBuffer; len: Tguint); cdecl; external libgstrtp;
function gst_rtp_buffer_get_packet_len(rtp: PGstRTPBuffer): Tguint; cdecl; external libgstrtp;
function gst_rtp_buffer_get_header_len(rtp: PGstRTPBuffer): Tguint; cdecl; external libgstrtp;
function gst_rtp_buffer_get_version(rtp: PGstRTPBuffer): Tguint8; cdecl; external libgstrtp;
procedure gst_rtp_buffer_set_version(rtp: PGstRTPBuffer; version: Tguint8); cdecl; external libgstrtp;
function gst_rtp_buffer_get_padding(rtp: PGstRTPBuffer): Tgboolean; cdecl; external libgstrtp;
procedure gst_rtp_buffer_set_padding(rtp: PGstRTPBuffer; padding: Tgboolean); cdecl; external libgstrtp;
procedure gst_rtp_buffer_pad_to(rtp: PGstRTPBuffer; len: Tguint); cdecl; external libgstrtp;
function gst_rtp_buffer_get_extension(rtp: PGstRTPBuffer): Tgboolean; cdecl; external libgstrtp;
procedure gst_rtp_buffer_set_extension(rtp: PGstRTPBuffer; extension: Tgboolean); cdecl; external libgstrtp;
function gst_rtp_buffer_get_extension_data(rtp: PGstRTPBuffer; bits: Pguint16; Data: Pgpointer; wordlen: Pguint): Tgboolean; cdecl; external libgstrtp;
function gst_rtp_buffer_get_extension_bytes(rtp: PGstRTPBuffer; bits: Pguint16): PGBytes; cdecl; external libgstrtp;
function gst_rtp_buffer_set_extension_data(rtp: PGstRTPBuffer; bits: Tguint16; length: Tguint16): Tgboolean; cdecl; external libgstrtp;
procedure gst_rtp_buffer_remove_extension_data(rtp: PGstRTPBuffer); cdecl; external libgstrtp;
function gst_rtp_buffer_get_ssrc(rtp: PGstRTPBuffer): Tguint32; cdecl; external libgstrtp;
procedure gst_rtp_buffer_set_ssrc(rtp: PGstRTPBuffer; ssrc: Tguint32); cdecl; external libgstrtp;
function gst_rtp_buffer_get_csrc_count(rtp: PGstRTPBuffer): Tguint8; cdecl; external libgstrtp;
function gst_rtp_buffer_get_csrc(rtp: PGstRTPBuffer; idx: Tguint8): Tguint32; cdecl; external libgstrtp;
procedure gst_rtp_buffer_set_csrc(rtp: PGstRTPBuffer; idx: Tguint8; csrc: Tguint32); cdecl; external libgstrtp;
function gst_rtp_buffer_get_marker(rtp: PGstRTPBuffer): Tgboolean; cdecl; external libgstrtp;
procedure gst_rtp_buffer_set_marker(rtp: PGstRTPBuffer; marker: Tgboolean); cdecl; external libgstrtp;
function gst_rtp_buffer_get_payload_type(rtp: PGstRTPBuffer): Tguint8; cdecl; external libgstrtp;
procedure gst_rtp_buffer_set_payload_type(rtp: PGstRTPBuffer; payload_type: Tguint8); cdecl; external libgstrtp;
function gst_rtp_buffer_get_seq(rtp: PGstRTPBuffer): Tguint16; cdecl; external libgstrtp;
procedure gst_rtp_buffer_set_seq(rtp: PGstRTPBuffer; seq: Tguint16); cdecl; external libgstrtp;
function gst_rtp_buffer_get_timestamp(rtp: PGstRTPBuffer): Tguint32; cdecl; external libgstrtp;
procedure gst_rtp_buffer_set_timestamp(rtp: PGstRTPBuffer; timestamp: Tguint32); cdecl; external libgstrtp;
function gst_rtp_buffer_get_payload_buffer(rtp: PGstRTPBuffer): PGstBuffer; cdecl; external libgstrtp;
function gst_rtp_buffer_get_payload_subbuffer(rtp: PGstRTPBuffer; offset: Tguint; len: Tguint): PGstBuffer; cdecl; external libgstrtp;
function gst_rtp_buffer_get_payload_len(rtp: PGstRTPBuffer): Tguint; cdecl; external libgstrtp;
function gst_rtp_buffer_get_payload(rtp: PGstRTPBuffer): Tgpointer; cdecl; external libgstrtp;
function gst_rtp_buffer_get_payload_bytes(rtp: PGstRTPBuffer): PGBytes; cdecl; external libgstrtp;
function gst_rtp_buffer_default_clock_rate(payload_type: Tguint8): Tguint32; cdecl; external libgstrtp;
function gst_rtp_buffer_compare_seqnum(seqnum1: Tguint16; seqnum2: Tguint16): Tgint; cdecl; external libgstrtp;
function gst_rtp_buffer_ext_timestamp(exttimestamp: Pguint64; timestamp: Tguint32): Tguint64; cdecl; external libgstrtp;
function gst_rtp_buffer_get_extension_onebyte_header(rtp: PGstRTPBuffer; id: Tguint8; nth: Tguint; Data: Pgpointer; size: Pguint): Tgboolean; cdecl; external libgstrtp;
function gst_rtp_buffer_get_extension_twobytes_header(rtp: PGstRTPBuffer; appbits: Pguint8; id: Tguint8; nth: Tguint; Data: Pgpointer;
  size: Pguint): Tgboolean; cdecl; external libgstrtp;
function gst_rtp_buffer_add_extension_onebyte_header(rtp: PGstRTPBuffer; id: Tguint8; Data: Tgconstpointer; size: Tguint): Tgboolean; cdecl; external libgstrtp;
function gst_rtp_buffer_add_extension_twobytes_header(rtp: PGstRTPBuffer; appbits: Tguint8; id: Tguint8; Data: Tgconstpointer; size: Tguint): Tgboolean; cdecl; external libgstrtp;
function gst_rtp_buffer_get_extension_onebyte_header_from_bytes(bytes: PGBytes; bit_pattern: Tguint16; id: Tguint8; nth: Tguint; Data: Pgpointer;
  size: Pguint): Tgboolean; cdecl; external libgstrtp;

type
  PGstRTPBufferFlags = ^TGstRTPBufferFlags;
  TGstRTPBufferFlags = longint;

const
  GST_RTP_BUFFER_FLAG_RETRANSMISSION = GST_BUFFER_FLAG_LAST shl 0;
  GST_RTP_BUFFER_FLAG_REDUNDANT = GST_BUFFER_FLAG_LAST shl 1;
  GST_RTP_BUFFER_FLAG_LAST = GST_BUFFER_FLAG_LAST shl 8;

type
  PGstRTPBufferMapFlags = ^TGstRTPBufferMapFlags;
  TGstRTPBufferMapFlags = longint;

const
  GST_RTP_BUFFER_MAP_FLAG_SKIP_PADDING = GST_MAP_FLAG_LAST shl 0;
  GST_RTP_BUFFER_MAP_FLAG_LAST = GST_MAP_FLAG_LAST shl 8;

  // === Konventiert am: 7-10-24 16:09:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
