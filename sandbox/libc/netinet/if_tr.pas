unit if_tr;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  TR_ALEN = 6;


  { xxxxxxxxxxx }
  {#define TR_HLEN   (sizeof (struct trh_hdr) + sizeof (struct trllc)) }
  AC = $10;
  LLC_FRAME = $40;
  EXTENDED_SAP = $AA;
  UI_CMD = $03;

type
  Ttrh_hdr = record
    ac: Tuint8_t;
    fc: Tuint8_t;
    daddr: array[0..(TR_ALEN) - 1] of Tuint8_t;
    saddr: array[0..(TR_ALEN) - 1] of Tuint8_t;
    rcf: Tuint16_t;
    rseg: array[0..7] of Tuint16_t;
  end;
  Ptrh_hdr = ^Ttrh_hdr;

  Ttrllc = record
    dsap: Tuint8_t;
    ssap: Tuint8_t;
    llc: Tuint8_t;
    protid: array[0..2] of Tuint8_t;
    ethertype: Tuint16_t;
  end;
  Ptrllc = ^Ttrllc;

const
  TR_HLEN = SizeOf(Ttrh_hdr) + SizeOf(Ttrllc);

type
  Ttr_statistics = record
    rx_packets: dword;
    tx_packets: dword;
    rx_bytes: dword;
    tx_bytes: dword;
    rx_errors: dword;
    tx_errors: dword;
    rx_dropped: dword;
    tx_dropped: dword;
    multicast: dword;
    transmit_collision: dword;
    line_errors: dword;
    internal_errors: dword;
    burst_errors: dword;
    A_C_errors: dword;
    abort_delimiters: dword;
    lost_frames: dword;
    recv_congest_count: dword;
    frame_copied_errors: dword;
    frequency_errors: dword;
    token_errors: dword;
    dummy1: dword;
  end;
  Ptr_statistics = ^Ttr_statistics;

const
  TR_RII = $80;
  TR_RCF_DIR_BIT = $80;
  TR_RCF_LEN_MASK = $1f00;
  TR_RCF_BROADCAST = $8000;
  TR_RCF_LIMITED_BROADCAST = $C000;
  TR_RCF_FRAME2K = $20;
  TR_RCF_BROADCAST_MASK = $C000;
  TR_MAXRIFLEN = 18;

type
  Ttrn_hdr = record
    trn_ac: Tuint8_t;
    trn_fc: Tuint8_t;
    trn_dhost: array[0..(TR_ALEN) - 1] of Tuint8_t;
    trn_shost: array[0..(TR_ALEN) - 1] of Tuint8_t;
    trn_rcf: Tuint16_t;
    trn_rseg: array[0..7] of Tuint16_t;
  end;
  Ptrn_hdr = ^Ttrn_hdr;


  // === Konventiert am: 10-8-25 17:28:06 ===


implementation



end.
