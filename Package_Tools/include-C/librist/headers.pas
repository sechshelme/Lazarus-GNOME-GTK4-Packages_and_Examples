unit headers;

interface

uses
  fp_rist;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  RIST_MAX_STRING_SHORT = 128;
  RIST_MAX_STRING_LONG = 256;
  RIST_PEER_UDPSOCKET_VERSION = 0;
  RIST_UDP_CONFIG_VERSION = 1;
  RIST_ERR_MALLOC = -(1);
  RIST_ERR_NULL_PEER = -(2);
  RIST_ERR_INVALID_STRING_LENGTH = -(3);
  RIST_ERR_INVALID_PROFILE = -(4);
  RIST_ERR_MISSING_CALLBACK_FUNCTION = -(5);
  RIST_ERR_NULL_CREDENTIALS = -(6);

type
  Trist_profile = longint;
const
  RIST_PROFILE_SIMPLE = 0;
  RIST_PROFILE_MAIN = 1;
  RIST_PROFILE_ADVANCED = 2;

type
  Trist_data_block_sender_flags = longint;
const
  RIST_DATA_FLAGS_USE_SEQ = 1;
  RIST_DATA_FLAGS_NEED_FREE = 2;

type
  Trist_data_block_receiver_flags = longint;
const
  RIST_DATA_FLAGS_DISCONTINUITY = 1 shl 0;
  RIST_DATA_FLAGS_FLOW_BUFFER_START = 1 shl 1;
  RIST_DATA_FLAGS_OVERFLOW = 1 shl 2;

type
  Tlibrist_multiplex_mode = longint;
const
  LIBRIST_MULTIPLEX_MODE_AUTO = -(1);
  LIBRIST_MULTIPLEX_MODE_VIRT_DESTINATION_PORT = 0;
  LIBRIST_MULTIPLEX_MODE_VIRT_SOURCE_PORT = 1;
  LIBRIST_MULTIPLEX_MODE_IPV4 = 2;

type
  Prist_ctx = type Pointer;
  PPrist_ctx = ^Prist_ctx;

  PPrist_data_block = ^Prist_data_block;
  Prist_data_block = ^Trist_data_block;
  Trist_data_block = record
    payload: pointer;
    payload_len: Tsize_t;
    ts_ntp: Tuint64_t;
    virt_src_port: Tuint16_t;
    virt_dst_port: Tuint16_t;
    peer: Pointer; // Prist_peer;
    flow_id: Tuint32_t;
    seq: Tuint64_t;
    flags: Tuint32_t;
    ref: Pointer; // Prist_ref;
  end;

  PPrist_udp_config = ^Prist_udp_config;
  Prist_udp_config = ^Trist_udp_config;
  Trist_udp_config = record
    version: longint;
    address_family: longint;
    initiate_conn: longint;
    address: array[0..(RIST_MAX_STRING_LONG) - 1] of char;
    miface: array[0..(RIST_MAX_STRING_SHORT) - 1] of char;
    physical_port: Tuint16_t;
    prefix: array[0..15] of char;
    rtp_timestamp: longint;
    rtp_sequence: longint;
    rtp: longint;
    rtp_ptype: Tuint8_t;
    stream_id: Tuint16_t;
    multiplex_mode: Tlibrist_multiplex_mode;
    multiplex_filter: array[0..(RIST_MAX_STRING_SHORT) - 1] of char;
  end;


  // === Konventiert am: 15-8-26 19:17:13 ===


implementation



end.
