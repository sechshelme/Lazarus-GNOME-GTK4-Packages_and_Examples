unit if_tr;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1997-2024 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.   }
{$ifndef _NETINET_IF_TR_H}

const
  _NETINET_IF_TR_H = 1;  
{$include <sys/types.h>}
{$include <stdint.h>}
{ IEEE 802.5 Token-Ring magic constants.  The frame sizes omit the preamble
   and FCS/CRC (frame check sequence).  }
{ Octets in one token-ring addr  }

const
  TR_ALEN = 6;  
{ xxxxxxxxxxx }
{#define TR_HLEN 	(sizeof (struct trh_hdr) + sizeof (struct trllc)) }
  AC = $10;  
  LLC_FRAME = $40;  
{ LLC and SNAP constants  }
  EXTENDED_SAP = $AA;  
  UI_CMD = $03;  
{ This is an Token-Ring frame header.  }
{ access control field  }
{ frame control field  }
{ destination address  }
{ source address  }
{ route control field  }
{ routing registers  }
type
  Ptrh_hdr = ^Ttrh_hdr;
  Ttrh_hdr = record
      ac : Tuint8_t;
      fc : Tuint8_t;
      daddr : array[0..(TR_ALEN)-1] of Tuint8_t;
      saddr : array[0..(TR_ALEN)-1] of Tuint8_t;
      rcf : Tuint16_t;
      rseg : array[0..7] of Tuint16_t;
    end;

{ This is an Token-Ring LLC structure  }
{ destination SAP  }
{ source SAP  }
{ LLC control field  }
{ protocol id  }
{ ether type field  }
  Ptrllc = ^Ttrllc;
  Ttrllc = record
      dsap : Tuint8_t;
      ssap : Tuint8_t;
      llc : Tuint8_t;
      protid : array[0..2] of Tuint8_t;
      ethertype : Tuint16_t;
    end;

{ Token-Ring statistics collection data.  }
{ total packets received	 }
{ total packets transmitted	 }
{ total bytes received   	 }
{ total bytes transmitted	 }
{ bad packets received		 }
{ packet transmit problems	 }
{ no space in linux buffers	 }
{ no space available in linux	 }
{ multicast packets received	 }
{ detailed Token-Ring errors. See IBM Token-Ring Network
     Architecture for more info  }
  Ptr_statistics = ^Ttr_statistics;
  Ttr_statistics = record
      rx_packets : dword;
      tx_packets : dword;
      rx_bytes : dword;
      tx_bytes : dword;
      rx_errors : dword;
      tx_errors : dword;
      rx_dropped : dword;
      tx_dropped : dword;
      multicast : dword;
      transmit_collision : dword;
      line_errors : dword;
      internal_errors : dword;
      burst_errors : dword;
      A_C_errors : dword;
      abort_delimiters : dword;
      lost_frames : dword;
      recv_congest_count : dword;
      frame_copied_errors : dword;
      frequency_errors : dword;
      token_errors : dword;
      dummy1 : dword;
    end;

{ source routing stuff  }

const
  TR_RII = $80;  
  TR_RCF_DIR_BIT = $80;  
  TR_RCF_LEN_MASK = $1f00;  
{ all-routes broadcast  }
  TR_RCF_BROADCAST = $8000;  
{ single-route broadcast  }
  TR_RCF_LIMITED_BROADCAST = $C000;  
  TR_RCF_FRAME2K = $20;  
  TR_RCF_BROADCAST_MASK = $C000;  
  TR_MAXRIFLEN = 18;  
{$ifdef __USE_MISC}
{ access control field  }
{ field control field  }
{ destination host  }
{ source host  }
{ route control field  }
{ routing registers  }
type
  Ptrn_hdr = ^Ttrn_hdr;
  Ttrn_hdr = record
      trn_ac : Tuint8_t;
      trn_fc : Tuint8_t;
      trn_dhost : array[0..(TR_ALEN)-1] of Tuint8_t;
      trn_shost : array[0..(TR_ALEN)-1] of Tuint8_t;
      trn_rcf : Tuint16_t;
      trn_rseg : array[0..7] of Tuint16_t;
    end;

{$endif}
{$endif}
{ netinet/if_tr.h  }

// === Konventiert am: 10-8-25 17:28:06 ===


implementation



end.
