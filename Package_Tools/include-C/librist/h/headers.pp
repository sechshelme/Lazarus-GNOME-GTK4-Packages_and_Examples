
unit headers;
interface

{
  Automatically converted by H2Pas 1.0.0 from headers.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    headers.h
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
Plibrist_multiplex_mode  = ^librist_multiplex_mode;
Prist_ctx  = ^rist_ctx;
Prist_data_block  = ^rist_data_block;
Prist_data_block_receiver_flags  = ^rist_data_block_receiver_flags;
Prist_data_block_sender_flags  = ^rist_data_block_sender_flags;
Prist_peer  = ^rist_peer;
Prist_profile  = ^rist_profile;
Prist_ref  = ^rist_ref;
Prist_udp_config  = ^rist_udp_config;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020, VideoLAN and librist authors
 * Copyright © 2019-2020 SipRadius LLC
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-2-Clause
  }
{$ifndef LIBRIST_HEADERS_H}
{$define LIBRIST_HEADERS_H}
{$include <stdint.h>}
{$include <stdlib.h>}
{$include <stdbool.h>}
{$include "urlparam.h"}
{ C++ extern C conditionnal removed }
{ Used for cname, miface and shared secret  }

const
  RIST_MAX_STRING_SHORT = 128;  
{ Used for url/address  }
  RIST_MAX_STRING_LONG = 256;  
{ Track PROTOCOL and API changes  }
  RIST_PEER_UDPSOCKET_VERSION = 0;  
  RIST_UDP_CONFIG_VERSION = 1;  
{ Error Codes  }
  RIST_ERR_MALLOC = -(1);  
  RIST_ERR_NULL_PEER = -(2);  
  RIST_ERR_INVALID_STRING_LENGTH = -(3);  
  RIST_ERR_INVALID_PROFILE = -(4);  
  RIST_ERR_MISSING_CALLBACK_FUNCTION = -(5);  
  RIST_ERR_NULL_CREDENTIALS = -(6);  
type
  Trist_profile =  Longint;
  Const
    RIST_PROFILE_SIMPLE = 0;
    RIST_PROFILE_MAIN = 1;
    RIST_PROFILE_ADVANCED = 2;

type
  Trist_data_block_sender_flags =  Longint;
  Const
    RIST_DATA_FLAGS_USE_SEQ = 1;
    RIST_DATA_FLAGS_NEED_FREE = 2;

type
  Trist_data_block_receiver_flags =  Longint;
  Const
    RIST_DATA_FLAGS_DISCONTINUITY = 1 shl 0;
    RIST_DATA_FLAGS_FLOW_BUFFER_START = 1 shl 1;
    RIST_DATA_FLAGS_OVERFLOW = 1 shl 2;

{Autoselect between multiplex modes below. }
{Multiplexed flows are selected based on their GRE destination port (data packets) }
{ Multiplexed flows are selected based on their GRE source port (data packets). libRIST ONLY }
{ Multiple IP flows are multiplexed into a single RIST flow, to be output via a TUN device. libRIST ONLY }
type
  Tlibrist_multiplex_mode =  Longint;
  Const
    LIBRIST_MULTIPLEX_MODE_AUTO = -(1);
    LIBRIST_MULTIPLEX_MODE_VIRT_DESTINATION_PORT = 0;
    LIBRIST_MULTIPLEX_MODE_VIRT_SOURCE_PORT = 1;
    LIBRIST_MULTIPLEX_MODE_IPV4 = 2;

type
  Prist_ctx = ^Trist_ctx;
  Trist_ctx = record
      {undefined structure}
    end;

(* Const before type ignored *)
{ The virtual source and destination ports are not used for simple profile  }
{ These next fields are not needed/used by rist_sender_data_write  }
{ Get's populated by librist with the rtp_seq on output, can be used on input to tell librist which rtp_seq to use  }
  Prist_data_block = ^Trist_data_block;
  Trist_data_block = record
      payload : pointer;
      payload_len : Tsize_t;
      ts_ntp : Tuint64_t;
      virt_src_port : Tuint16_t;
      virt_dst_port : Tuint16_t;
      peer : Prist_peer;
      flow_id : Tuint32_t;
      seq : Tuint64_t;
      flags : Tuint32_t;
      ref : Prist_ref;
    end;

{ Communication parameters  }
{ If a value of 0 is specified for address family, the library }
{ will parse the address and populate all communication parameters. }
{ Alternatively, use either AF_INET or AF_INET6 and address will be }
{ treated like an IP address or hostname }
{Future usage }
  Prist_udp_config = ^Trist_udp_config;
  Trist_udp_config = record
      version : longint;
      address_family : longint;
      initiate_conn : longint;
      address : array[0..(RIST_MAX_STRING_LONG)-1] of char;
      miface : array[0..(RIST_MAX_STRING_SHORT)-1] of char;
      physical_port : Tuint16_t;
      prefix : array[0..15] of char;
      rtp_timestamp : longint;
      rtp_sequence : longint;
      rtp : longint;
      rtp_ptype : Tuint8_t;
      stream_id : Tuint16_t;
      multiplex_mode : Tlibrist_multiplex_mode;
      multiplex_filter : array[0..(RIST_MAX_STRING_SHORT)-1] of char;
    end;

{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
