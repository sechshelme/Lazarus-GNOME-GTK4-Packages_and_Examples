unit ip6;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1991-2024 Free Software Foundation, Inc.
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
{$ifndef _NETINET_IP6_H}

const
  _NETINET_IP6_H = 1;  
{$include <inttypes.h>}
{$include <netinet/in.h>}
{ 4 bits version, 8 bits TC,
					20 bits flow-ID  }
{ payload length  }
{ next header  }
{ hop limit  }
{ 4 bits version, top 4 bits tclass  }
{ source address  }
{ destination address  }
type
  Pip6_hdr = ^Tip6_hdr;
  Tip6_hdr = record
      ip6_ctlun : record
          case longint of
            0 : ( ip6_un1 : record
                ip6_un1_flow : Tuint32_t;
                ip6_un1_plen : Tuint16_t;
                ip6_un1_nxt : Tuint8_t;
                ip6_un1_hlim : Tuint8_t;
              end );
            1 : ( ip6_un2_vfc : Tuint8_t );
          end;
      ip6_src : Tin6_addr;
      ip6_dst : Tin6_addr;
    end;


const
  ip6_vfc = ip6_ctlun.ip6_un2_vfc;  
  ip6_flow = ip6_ctlun.(ip6_un1.ip6_un1_flow);  
  ip6_plen = ip6_ctlun.(ip6_un1.ip6_un1_plen);  
  ip6_nxt = ip6_ctlun.(ip6_un1.ip6_un1_nxt);  
  ip6_hlim = ip6_ctlun.(ip6_un1.ip6_un1_hlim);  
  ip6_hops = ip6_ctlun.(ip6_un1.ip6_un1_hlim);  
{ Generic extension header.   }
{ next header.   }
{ length in units of 8 octets.   }
type
  Pip6_ext = ^Tip6_ext;
  Tip6_ext = record
      ip6e_nxt : Tuint8_t;
      ip6e_len : Tuint8_t;
    end;

{ Hop-by-Hop options header.   }
{ next header.   }
{ length in units of 8 octets.   }
{ followed by options  }
  Pip6_hbh = ^Tip6_hbh;
  Tip6_hbh = record
      ip6h_nxt : Tuint8_t;
      ip6h_len : Tuint8_t;
    end;

{ Destination options header  }
{ next header  }
{ length in units of 8 octets  }
{ followed by options  }
  Pip6_dest = ^Tip6_dest;
  Tip6_dest = record
      ip6d_nxt : Tuint8_t;
      ip6d_len : Tuint8_t;
    end;

{ Routing header  }
{ next header  }
{ length in units of 8 octets  }
{ routing type  }
{ segments left  }
{ followed by routing type specific data  }
  Pip6_rthdr = ^Tip6_rthdr;
  Tip6_rthdr = record
      ip6r_nxt : Tuint8_t;
      ip6r_len : Tuint8_t;
      ip6r_type : Tuint8_t;
      ip6r_segleft : Tuint8_t;
    end;

{ Type 0 Routing header  }
{ next header  }
{ length in units of 8 octets  }
{ always zero  }
{ segments left  }
{ reserved field  }
{ strict/loose bit map  }
{ followed by up to 127 struct in6_addr  }
  Pip6_rthdr0 = ^Tip6_rthdr0;
  Tip6_rthdr0 = record
      ip6r0_nxt : Tuint8_t;
      ip6r0_len : Tuint8_t;
      ip6r0_type : Tuint8_t;
      ip6r0_segleft : Tuint8_t;
      ip6r0_reserved : Tuint8_t;
      ip6r0_slmap : array[0..2] of Tuint8_t;
      ip6r0_addr : array[0..-1] of Tin6_addr;
    end;

{ Fragment header  }
{ next header  }
{ reserved field  }
{ offset, reserved, and flag  }
{ identification  }
  Pip6_frag = ^Tip6_frag;
  Tip6_frag = record
      ip6f_nxt : Tuint8_t;
      ip6f_reserved : Tuint8_t;
      ip6f_offlg : Tuint16_t;
      ip6f_ident : Tuint32_t;
    end;

{$if __BYTE_ORDER == __BIG_ENDIAN}
{ mask out offset from _offlg  }

const
  IP6F_OFF_MASK = $fff8;  
{ reserved bits in ip6f_offlg  }
  IP6F_RESERVED_MASK = $0006;  
{ more-fragments flag  }
  IP6F_MORE_FRAG = $0001;  
{$else}
{ __BYTE_ORDER == __LITTLE_ENDIAN  }
{ mask out offset from _offlg  }

const
  IP6F_OFF_MASK = $f8ff;  
{ reserved bits in ip6f_offlg  }
  IP6F_RESERVED_MASK = $0600;  
{ more-fragments flag  }
  IP6F_MORE_FRAG = $0100;  
{$endif}
{ IPv6 options  }
type
  Pip6_opt = ^Tip6_opt;
  Tip6_opt = record
      ip6o_type : Tuint8_t;
      ip6o_len : Tuint8_t;
    end;

{ The high-order 3 bits of the option type define the behavior
 * when processing an unknown option and whether or not the option
 * content changes in flight.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function IP6OPT_TYPE(obj : longint) : To;

const
  IP6OPT_TYPE_SKIP = $00;  
  IP6OPT_TYPE_DISCARD = $40;  
  IP6OPT_TYPE_FORCEICMP = $80;  
  IP6OPT_TYPE_ICMP = $c0;  
  IP6OPT_TYPE_MUTABLE = $20;  
{ Special option types for padding.   }
  IP6OPT_PAD1 = 0;  
  IP6OPT_PADN = 1;  
  IP6OPT_JUMBO = $c2;  
  IP6OPT_NSAP_ADDR = $c3;  
  IP6OPT_TUNNEL_LIMIT = $04;  
  IP6OPT_ROUTER_ALERT = $05;  
{ Jumbo Payload Option  }
type
  Pip6_opt_jumbo = ^Tip6_opt_jumbo;
  Tip6_opt_jumbo = record
      ip6oj_type : Tuint8_t;
      ip6oj_len : Tuint8_t;
      ip6oj_jumbo_len : array[0..3] of Tuint8_t;
    end;


const
  IP6OPT_JUMBO_LEN = 6;  
{ NSAP Address Option  }
{ followed by source NSAP  }
{ followed by destination NSAP  }
type
  Pip6_opt_nsap = ^Tip6_opt_nsap;
  Tip6_opt_nsap = record
      ip6on_type : Tuint8_t;
      ip6on_len : Tuint8_t;
      ip6on_src_nsap_len : Tuint8_t;
      ip6on_dst_nsap_len : Tuint8_t;
    end;

{ Tunnel Limit Option  }
  Pip6_opt_tunnel = ^Tip6_opt_tunnel;
  Tip6_opt_tunnel = record
      ip6ot_type : Tuint8_t;
      ip6ot_len : Tuint8_t;
      ip6ot_encap_limit : Tuint8_t;
    end;

{ Router Alert Option  }
  Pip6_opt_router = ^Tip6_opt_router;
  Tip6_opt_router = record
      ip6or_type : Tuint8_t;
      ip6or_len : Tuint8_t;
      ip6or_value : array[0..1] of Tuint8_t;
    end;

{ Router alert values (in network byte order)  }
{$if __BYTE_ORDER == __BIG_ENDIAN}

const
  IP6_ALERT_MLD = $0000;  
  IP6_ALERT_RSVP = $0001;  
  IP6_ALERT_AN = $0002;  
{$else}
{ __BYTE_ORDER == __LITTLE_ENDIAN  }

const
  IP6_ALERT_MLD = $0000;  
  IP6_ALERT_RSVP = $0100;  
  IP6_ALERT_AN = $0200;  
{$endif}
{$endif}
{ netinet/ip6.h  }

// === Konventiert am: 10-8-25 17:28:20 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function IP6OPT_TYPE(obj : longint) : To;
begin
  IP6OPT_TYPE:=To(@($c0));
end;


end.
