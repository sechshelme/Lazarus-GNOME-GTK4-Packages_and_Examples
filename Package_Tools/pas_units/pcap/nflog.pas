unit nflog;

interface

uses
  pcap_inttypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tnflog_hdr = record
    nflog_family: Tuint8_t;
    nflog_version: Tuint8_t;
    nflog_rid: Tuint16_t;
  end;
  Pnflog_hdr = ^Tnflog_hdr;
  Tnflog_hdr_t = Tnflog_hdr;
  Pnflog_hdr_t = ^Tnflog_hdr_t;

  Tnflog_tlv = record
    tlv_length: Tuint16_t;
    tlv_type: Tuint16_t;
  end;
  Pnflog_tlv = ^Tnflog_tlv;
  Tnflog_tlv_t = Tnflog_tlv;
  Pnflog_tlv_t = ^Tnflog_tlv_t;

  Tnflog_packet_hdr = record
    hw_protocol: Tuint16_t;
    hook: Tuint8_t;
    pad: Tuint8_t;
  end;
  Pnflog_packet_hdr = ^Tnflog_packet_hdr;
  Tnflog_packet_hdr_t = Tnflog_packet_hdr;
  Pnflog_packet_hdr_t = ^Tnflog_packet_hdr_t;

  Tnflog_hwaddr = record
    hw_addrlen: Tuint16_t;
    pad: Tuint16_t;
    hw_addr: array[0..7] of Tuint8_t;
  end;
  Pnflog_hwaddr = ^Tnflog_hwaddr;
  Tnflog_hwaddr_t = Tnflog_hwaddr;
  Pnflog_hwaddr_t = ^Tnflog_hwaddr_t;

  Tnflog_timestamp = record
    sec: Tuint64_t;
    usec: Tuint64_t;
  end;
  Pnflog_timestamp = ^Tnflog_timestamp;
  Tnflog_timestamp_t = Tnflog_timestamp;
  Pnflog_timestamp_t = ^Tnflog_timestamp_t;

const
  NFULA_PACKET_HDR = 1;
  NFULA_MARK = 2;
  NFULA_TIMESTAMP = 3;
  NFULA_IFINDEX_INDEV = 4;
  NFULA_IFINDEX_OUTDEV = 5;
  NFULA_IFINDEX_PHYSINDEV = 6;
  NFULA_IFINDEX_PHYSOUTDEV = 7;
  NFULA_HWADDR = 8;
  NFULA_PAYLOAD = 9;
  NFULA_PREFIX = 10;
  NFULA_UID = 11;
  NFULA_SEQ = 12;
  NFULA_SEQ_GLOBAL = 13;
  NFULA_GID = 14;
  NFULA_HWTYPE = 15;
  NFULA_HWHEADER = 16;
  NFULA_HWLEN = 17;

  // === Konventiert am: 30-8-25 19:14:10 ===


implementation



end.
