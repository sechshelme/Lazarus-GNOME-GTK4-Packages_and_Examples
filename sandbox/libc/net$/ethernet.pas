unit ethernet;

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
{ Based on the FreeBSD version of this file. Curiously, that file
   lacks a copyright in the header.  }
{$ifndef __NET_ETHERNET_H}

const
  __NET_ETHERNET_H = 1;  
{$include <sys/types.h>}
{$include <stdint.h>}
{$include <linux/if_ether.h>     /* IEEE 802.3 Ethernet constants */}
{ This is a name for the 48 bit ethernet address available on many
   systems.   }
type
  Pether_addr = ^Tether_addr;
  Tether_addr = record
      ether_addr_octet : array[0..(ETH_ALEN)-1] of Tuint8_t;
    end;

{ 10Mb/s ethernet header  }
{ destination eth addr	 }
{ source ether addr	 }
{ packet type ID field	 }
  Pether_header = ^Tether_header;
  Tether_header = record
      ether_dhost : array[0..(ETH_ALEN)-1] of Tuint8_t;
      ether_shost : array[0..(ETH_ALEN)-1] of Tuint8_t;
      ether_type : Tuint16_t;
    end;

{ Ethernet protocol ID's  }
{ Xerox PUP  }

const
  ETHERTYPE_PUP = $0200;  
{ Sprite  }
  ETHERTYPE_SPRITE = $0500;  
{ IP  }
  ETHERTYPE_IP = $0800;  
{ Address resolution  }
  ETHERTYPE_ARP = $0806;  
{ Reverse ARP  }
  ETHERTYPE_REVARP = $8035;  
{ AppleTalk protocol  }
  ETHERTYPE_AT = $809B;  
{ AppleTalk ARP  }
  ETHERTYPE_AARP = $80F3;  
{ IEEE 802.1Q VLAN tagging  }
  ETHERTYPE_VLAN = $8100;  
{ IPX  }
  ETHERTYPE_IPX = $8137;  
{ IP protocol version 6  }
  ETHERTYPE_IPV6 = $86dd;  
{ used to test interfaces  }
  ETHERTYPE_LOOPBACK = $9000;  
{ size of ethernet addr  }
  ETHER_ADDR_LEN = ETH_ALEN;  
{ bytes in type field  }
  ETHER_TYPE_LEN = 2;  
{ bytes in CRC field  }
  ETHER_CRC_LEN = 4;  
{ total octets in header  }
  ETHER_HDR_LEN = ETH_HLEN;  
{ min packet length  }
  ETHER_MIN_LEN = ETH_ZLEN+ETHER_CRC_LEN;  
{ max packet length  }
  ETHER_MAX_LEN = ETH_FRAME_LEN+ETHER_CRC_LEN;  
{ make sure ethernet length is valid  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ETHER_IS_VALID_LEN(foo : longint) : longint;

{
 * The ETHERTYPE_NTRAILER packet types starting at ETHERTYPE_TRAIL have
 * (type-ETHERTYPE_TRAIL)*512 bytes of data followed
 * by an ETHER type (as given above) and then the (variable-length) header.
  }
{ Trailer packet  }
const
  ETHERTYPE_TRAIL = $1000;  
  ETHERTYPE_NTRAILER = 16;  
  ETHERMTU = ETH_DATA_LEN;  
  ETHERMIN = (ETHER_MIN_LEN-ETHER_HDR_LEN)-ETHER_CRC_LEN;  
{$endif}
{ net/ethernet.h  }

// === Konventiert am: 12-8-25 17:05:44 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ETHER_IS_VALID_LEN(foo : longint) : longint;
begin
  ETHER_IS_VALID_LEN:=(foo>=(ETHER_MIN_LEN and (@(foo))))<=ETHER_MAX_LEN;
end;


end.
