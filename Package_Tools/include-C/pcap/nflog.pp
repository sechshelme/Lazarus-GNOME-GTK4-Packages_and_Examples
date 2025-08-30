
unit nflog;
interface

{
  Automatically converted by H2Pas 1.0.0 from nflog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nflog.h
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
Pnflog_hdr  = ^nflog_hdr;
Pnflog_hdr_t  = ^nflog_hdr_t;
Pnflog_hwaddr  = ^nflog_hwaddr;
Pnflog_hwaddr_t  = ^nflog_hwaddr_t;
Pnflog_packet_hdr  = ^nflog_packet_hdr;
Pnflog_packet_hdr_t  = ^nflog_packet_hdr_t;
Pnflog_timestamp  = ^nflog_timestamp;
Pnflog_timestamp_t  = ^nflog_timestamp_t;
Pnflog_tlv  = ^nflog_tlv;
Pnflog_tlv_t  = ^nflog_tlv_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2013, Petar Alilovic,
 * Faculty of Electrical Engineering and Computing, University of Zagreb
 * All rights reserved
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice,
 *	 this list of conditions and the following disclaimer.
 * * Redistributions in binary form must reproduce the above copyright
 *	 notice, this list of conditions and the following disclaimer in the
 *	 documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
  }
{$ifndef lib_pcap_nflog_h}
{$define lib_pcap_nflog_h}
{$include <pcap/pcap-inttypes.h>}
{
 * Structure of an NFLOG header and TLV parts, as described at
 * https://www.tcpdump.org/linktypes/LINKTYPE_NFLOG.html
 *
 * The NFLOG header is big-endian.
 *
 * The TLV length and type are in host byte order.  The value is either
 * big-endian or is an array of bytes in some externally-specified byte
 * order (text string, link-layer address, link-layer header, packet
 * data, etc.).
  }
{ address family  }
{ version  }
{ resource ID  }
type
  Pnflog_hdr = ^Tnflog_hdr;
  Tnflog_hdr = record
      nflog_family : Tuint8_t;
      nflog_version : Tuint8_t;
      nflog_rid : Tuint16_t;
    end;
  Tnflog_hdr_t = Tnflog_hdr;
  Pnflog_hdr_t = ^Tnflog_hdr_t;
{ tlv length  }
{ tlv type  }
{ value follows this  }

  Pnflog_tlv = ^Tnflog_tlv;
  Tnflog_tlv = record
      tlv_length : Tuint16_t;
      tlv_type : Tuint16_t;
    end;
  Tnflog_tlv_t = Tnflog_tlv;
  Pnflog_tlv_t = ^Tnflog_tlv_t;
{ hw protocol  }
{ netfilter hook  }
{ padding to 32 bits  }

  Pnflog_packet_hdr = ^Tnflog_packet_hdr;
  Tnflog_packet_hdr = record
      hw_protocol : Tuint16_t;
      hook : Tuint8_t;
      pad : Tuint8_t;
    end;
  Tnflog_packet_hdr_t = Tnflog_packet_hdr;
  Pnflog_packet_hdr_t = ^Tnflog_packet_hdr_t;
{ address length  }
{ padding to 32-bit boundary  }
{ address, up to 8 bytes  }

  Pnflog_hwaddr = ^Tnflog_hwaddr;
  Tnflog_hwaddr = record
      hw_addrlen : Tuint16_t;
      pad : Tuint16_t;
      hw_addr : array[0..7] of Tuint8_t;
    end;
  Tnflog_hwaddr_t = Tnflog_hwaddr;
  Pnflog_hwaddr_t = ^Tnflog_hwaddr_t;

  Pnflog_timestamp = ^Tnflog_timestamp;
  Tnflog_timestamp = record
      sec : Tuint64_t;
      usec : Tuint64_t;
    end;
  Tnflog_timestamp_t = Tnflog_timestamp;
  Pnflog_timestamp_t = ^Tnflog_timestamp_t;
{
 * TLV types.
  }
{ nflog_packet_hdr_t  }

const
  NFULA_PACKET_HDR = 1;  
{ packet mark from skbuff  }
  NFULA_MARK = 2;  
{ nflog_timestamp_t for skbuff's time stamp  }
  NFULA_TIMESTAMP = 3;  
{ ifindex of device on which packet received (possibly bridge group)  }
  NFULA_IFINDEX_INDEV = 4;  
{ ifindex of device on which packet transmitted (possibly bridge group)  }
  NFULA_IFINDEX_OUTDEV = 5;  
{ ifindex of physical device on which packet received (not bridge group)  }
  NFULA_IFINDEX_PHYSINDEV = 6;  
{ ifindex of physical device on which packet transmitted (not bridge group)  }
  NFULA_IFINDEX_PHYSOUTDEV = 7;  
{ nflog_hwaddr_t for hardware address  }
  NFULA_HWADDR = 8;  
{ packet payload  }
  NFULA_PAYLOAD = 9;  
{ text string - null-terminated, count includes NUL  }
  NFULA_PREFIX = 10;  
{ UID owning socket on which packet was sent/received  }
  NFULA_UID = 11;  
{ sequence number of packets on this NFLOG socket  }
  NFULA_SEQ = 12;  
{ sequence number of pakets on all NFLOG sockets  }
  NFULA_SEQ_GLOBAL = 13;  
{ GID owning socket on which packet was sent/received  }
  NFULA_GID = 14;  
{ ARPHRD_ type of skbuff's device  }
  NFULA_HWTYPE = 15;  
{ skbuff's MAC-layer header  }
  NFULA_HWHEADER = 16;  
{ length of skbuff's MAC-layer header  }
  NFULA_HWLEN = 17;  
{$endif}

implementation


end.
