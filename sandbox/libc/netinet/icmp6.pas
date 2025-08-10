unit icmp6;

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
{$ifndef _NETINET_ICMP6_H}

const
  _NETINET_ICMP6_H = 1;  
{$include <inttypes.h>}
{$include <string.h>}
{$include <sys/types.h>}
{$include <netinet/in.h>}

const
  ICMP6_FILTER = 1;  
  ICMP6_FILTER_BLOCK = 1;  
  ICMP6_FILTER_PASS = 2;  
  ICMP6_FILTER_BLOCKOTHERS = 3;  
  ICMP6_FILTER_PASSONLY = 4;  
type
  Picmp6_filter = ^Ticmp6_filter;
  Ticmp6_filter = record
      icmp6_filt : array[0..7] of Tuint32_t;
    end;

{ type field  }
{ code field  }
{ checksum field  }
{ type-specific field  }
{ type-specific field  }
{ type-specific field  }
  Picmp6_hdr = ^Ticmp6_hdr;
  Ticmp6_hdr = record
      icmp6_type : Tuint8_t;
      icmp6_code : Tuint8_t;
      icmp6_cksum : Tuint16_t;
      icmp6_dataun : record
          case longint of
            0 : ( icmp6_un_data32 : array[0..0] of Tuint32_t );
            1 : ( icmp6_un_data16 : array[0..1] of Tuint16_t );
            2 : ( icmp6_un_data8 : array[0..3] of Tuint8_t );
          end;
    end;


const
  icmp6_data32 = icmp6_dataun.icmp6_un_data32;  
  icmp6_data16 = icmp6_dataun.icmp6_un_data16;  
  icmp6_data8 = icmp6_dataun.icmp6_un_data8;  
{ parameter prob  }

{ was #define dname def_expr }
function icmp6_pptr : longint; { return type might be wrong }

{ packet too big  }
{ was #define dname def_expr }
function icmp6_mtu : longint; { return type might be wrong }

{ echo request/reply  }
{ was #define dname def_expr }
function icmp6_id : longint; { return type might be wrong }

{ echo request/reply  }
{ was #define dname def_expr }
function icmp6_seq : longint; { return type might be wrong }

{ mcast group membership  }
{ was #define dname def_expr }
function icmp6_maxdelay : longint; { return type might be wrong }

const
  ICMP6_DST_UNREACH = 1;  
  ICMP6_PACKET_TOO_BIG = 2;  
  ICMP6_TIME_EXCEEDED = 3;  
  ICMP6_PARAM_PROB = 4;  
{ all informational messages  }
  ICMP6_INFOMSG_MASK = $80;  
  ICMP6_ECHO_REQUEST = 128;  
  ICMP6_ECHO_REPLY = 129;  
  MLD_LISTENER_QUERY = 130;  
  MLD_LISTENER_REPORT = 131;  
  MLD_LISTENER_REDUCTION = 132;  
  ICMPV6_EXT_ECHO_REQUEST = 160;  
  ICMPV6_EXT_ECHO_REPLY = 161;  
{ no route to destination  }
  ICMP6_DST_UNREACH_NOROUTE = 0;  
{ communication with destination  }
  ICMP6_DST_UNREACH_ADMIN = 1;  
{ administratively prohibited  }
{ beyond scope of source address  }
  ICMP6_DST_UNREACH_BEYONDSCOPE = 2;  
{ address unreachable  }
  ICMP6_DST_UNREACH_ADDR = 3;  
{ bad port  }
  ICMP6_DST_UNREACH_NOPORT = 4;  
{ Hop Limit == 0 in transit  }
  ICMP6_TIME_EXCEED_TRANSIT = 0;  
{ Reassembly time out  }
  ICMP6_TIME_EXCEED_REASSEMBLY = 1;  
{ erroneous header field  }
  ICMP6_PARAMPROB_HEADER = 0;  
{ unrecognized Next Header  }
  ICMP6_PARAMPROB_NEXTHEADER = 1;  
{ unrecognized IPv6 option  }
  ICMP6_PARAMPROB_OPTION = 2;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ICMP6_FILTER_WILLPASS(_type,filterp : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ICMP6_FILTER_WILLBLOCK(_type,filterp : longint) : longint;

{ xxxxxxxxxxxxxxxxxxxxxxxx
#define ICMP6_FILTER_SETPASS(type, filterp) \
	((((filterp)->icmp6_filt[(type) >> 5]) &= ~(1U << ((type) & 31))))

#define ICMP6_FILTER_SETBLOCK(type, filterp) \
	((((filterp)->icmp6_filt[(type) >> 5]) |=  (1U << ((type) & 31))))

#define ICMP6_FILTER_SETPASSALL(filterp) \
	memset (filterp, 0, sizeof (struct icmp6_filter));

#define ICMP6_FILTER_SETBLOCKALL(filterp) \
	memset (filterp, 0xFF, sizeof (struct icmp6_filter));
 }
const
  ND_ROUTER_SOLICIT = 133;  
  ND_ROUTER_ADVERT = 134;  
  ND_NEIGHBOR_SOLICIT = 135;  
  ND_NEIGHBOR_ADVERT = 136;  
  ND_REDIRECT = 137;  
{ router solicitation  }
{ could be followed by options  }
type
  Pnd_router_solicit = ^Tnd_router_solicit;
  Tnd_router_solicit = record
      nd_rs_hdr : Ticmp6_hdr;
    end;


const
  nd_rs_type = nd_rs_hdr.icmp6_type;  
  nd_rs_code = nd_rs_hdr.icmp6_code;  
  nd_rs_cksum = nd_rs_hdr.icmp6_cksum;  

{ was #define dname def_expr }
function nd_rs_reserved : longint; { return type might be wrong }

{ router advertisement  }
{ reachable time  }
{ retransmit timer  }
{ could be followed by options  }
type
  Pnd_router_advert = ^Tnd_router_advert;
  Tnd_router_advert = record
      nd_ra_hdr : Ticmp6_hdr;
      nd_ra_reachable : Tuint32_t;
      nd_ra_retransmit : Tuint32_t;
    end;


const
  nd_ra_type = nd_ra_hdr.icmp6_type;  
  nd_ra_code = nd_ra_hdr.icmp6_code;  
  nd_ra_cksum = nd_ra_hdr.icmp6_cksum;  

{ was #define dname def_expr }
function nd_ra_curhoplimit : longint; { return type might be wrong }

{ was #define dname def_expr }
function nd_ra_flags_reserved : longint; { return type might be wrong }

const
  ND_RA_FLAG_MANAGED = $80;  
  ND_RA_FLAG_OTHER = $40;  
  ND_RA_FLAG_HOME_AGENT = $20;  

{ was #define dname def_expr }
function nd_ra_router_lifetime : longint; { return type might be wrong }

{ neighbor solicitation  }
{ target address  }
{ could be followed by options  }
type
  Pnd_neighbor_solicit = ^Tnd_neighbor_solicit;
  Tnd_neighbor_solicit = record
      nd_ns_hdr : Ticmp6_hdr;
      nd_ns_target : Tin6_addr;
    end;


const
  nd_ns_type = nd_ns_hdr.icmp6_type;  
  nd_ns_code = nd_ns_hdr.icmp6_code;  
  nd_ns_cksum = nd_ns_hdr.icmp6_cksum;  

{ was #define dname def_expr }
function nd_ns_reserved : longint; { return type might be wrong }

{ neighbor advertisement  }
{ target address  }
{ could be followed by options  }
type
  Pnd_neighbor_advert = ^Tnd_neighbor_advert;
  Tnd_neighbor_advert = record
      nd_na_hdr : Ticmp6_hdr;
      nd_na_target : Tin6_addr;
    end;


const
  nd_na_type = nd_na_hdr.icmp6_type;  
  nd_na_code = nd_na_hdr.icmp6_code;  
  nd_na_cksum = nd_na_hdr.icmp6_cksum;  

{ was #define dname def_expr }
function nd_na_flags_reserved : longint; { return type might be wrong }

{$if     __BYTE_ORDER == __BIG_ENDIAN}

const
  ND_NA_FLAG_ROUTER = $80000000;  
  ND_NA_FLAG_SOLICITED = $40000000;  
  ND_NA_FLAG_OVERRIDE = $20000000;  
{$else}
{ __BYTE_ORDER == __LITTLE_ENDIAN  }

const
  ND_NA_FLAG_ROUTER = $00000080;  
  ND_NA_FLAG_SOLICITED = $00000040;  
  ND_NA_FLAG_OVERRIDE = $00000020;  
{$endif}
{ redirect  }
{ target address  }
{ destination address  }
{ could be followed by options  }
type
  Pnd_redirect = ^Tnd_redirect;
  Tnd_redirect = record
      nd_rd_hdr : Ticmp6_hdr;
      nd_rd_target : Tin6_addr;
      nd_rd_dst : Tin6_addr;
    end;


const
  nd_rd_type = nd_rd_hdr.icmp6_type;  
  nd_rd_code = nd_rd_hdr.icmp6_code;  
  nd_rd_cksum = nd_rd_hdr.icmp6_cksum;  

{ was #define dname def_expr }
function nd_rd_reserved : longint; { return type might be wrong }

{ Neighbor discovery option header  }
{ in units of 8 octets  }
{ followed by option specific data  }
type
  Pnd_opt_hdr = ^Tnd_opt_hdr;
  Tnd_opt_hdr = record
      nd_opt_type : Tuint8_t;
      nd_opt_len : Tuint8_t;
    end;


const
  ND_OPT_SOURCE_LINKADDR = 1;  
  ND_OPT_TARGET_LINKADDR = 2;  
  ND_OPT_PREFIX_INFORMATION = 3;  
  ND_OPT_REDIRECTED_HEADER = 4;  
  ND_OPT_MTU = 5;  
  ND_OPT_RTR_ADV_INTERVAL = 7;  
  ND_OPT_HOME_AGENT_INFO = 8;  
{ prefix information  }
type
  Pnd_opt_prefix_info = ^Tnd_opt_prefix_info;
  Tnd_opt_prefix_info = record
      nd_opt_pi_type : Tuint8_t;
      nd_opt_pi_len : Tuint8_t;
      nd_opt_pi_prefix_len : Tuint8_t;
      nd_opt_pi_flags_reserved : Tuint8_t;
      nd_opt_pi_valid_time : Tuint32_t;
      nd_opt_pi_preferred_time : Tuint32_t;
      nd_opt_pi_reserved2 : Tuint32_t;
      nd_opt_pi_prefix : Tin6_addr;
    end;


const
  ND_OPT_PI_FLAG_ONLINK = $80;  
  ND_OPT_PI_FLAG_AUTO = $40;  
  ND_OPT_PI_FLAG_RADDR = $20;  
{ redirected header  }
{ followed by IP header and data  }
type
  Pnd_opt_rd_hdr = ^Tnd_opt_rd_hdr;
  Tnd_opt_rd_hdr = record
      nd_opt_rh_type : Tuint8_t;
      nd_opt_rh_len : Tuint8_t;
      nd_opt_rh_reserved1 : Tuint16_t;
      nd_opt_rh_reserved2 : Tuint32_t;
    end;

{ MTU option  }
  Pnd_opt_mtu = ^Tnd_opt_mtu;
  Tnd_opt_mtu = record
      nd_opt_mtu_type : Tuint8_t;
      nd_opt_mtu_len : Tuint8_t;
      nd_opt_mtu_reserved : Tuint16_t;
      nd_opt_mtu_mtu : Tuint32_t;
    end;

{ multicast address  }
  Pmld_hdr = ^Tmld_hdr;
  Tmld_hdr = record
      mld_icmp6_hdr : Ticmp6_hdr;
      mld_addr : Tin6_addr;
    end;


const
  mld_type = mld_icmp6_hdr.icmp6_type;  
  mld_code = mld_icmp6_hdr.icmp6_code;  
  mld_cksum = mld_icmp6_hdr.icmp6_cksum;  

{ was #define dname def_expr }
function mld_maxdelay : longint; { return type might be wrong }

{ was #define dname def_expr }
function mld_reserved : longint; { return type might be wrong }

const
  ICMP6_ROUTER_RENUMBERING = 138;  
{ router renumbering header  }
type
  Picmp6_router_renum = ^Ticmp6_router_renum;
  Ticmp6_router_renum = record
      rr_hdr : Ticmp6_hdr;
      rr_segnum : Tuint8_t;
      rr_flags : Tuint8_t;
      rr_maxdelay : Tuint16_t;
      rr_reserved : Tuint32_t;
    end;


const
  rr_type = rr_hdr.icmp6_type;  
  rr_code = rr_hdr.icmp6_code;  
  rr_cksum = rr_hdr.icmp6_cksum;  

{ was #define dname def_expr }
function rr_seqnum : longint; { return type might be wrong }

{ Router renumbering flags  }
const
  ICMP6_RR_FLAGS_TEST = $80;  
  ICMP6_RR_FLAGS_REQRESULT = $40;  
  ICMP6_RR_FLAGS_FORCEAPPLY = $20;  
  ICMP6_RR_FLAGS_SPECSITE = $10;  
  ICMP6_RR_FLAGS_PREVDONE = $08;  
{ match prefix part  }
type
  Prr_pco_match = ^Trr_pco_match;
  Trr_pco_match = record
      rpm_code : Tuint8_t;
      rpm_len : Tuint8_t;
      rpm_ordinal : Tuint8_t;
      rpm_matchlen : Tuint8_t;
      rpm_minlen : Tuint8_t;
      rpm_maxlen : Tuint8_t;
      rpm_reserved : Tuint16_t;
      rpm_prefix : Tin6_addr;
    end;

{ PCO code values  }

const
  RPM_PCO_ADD = 1;  
  RPM_PCO_CHANGE = 2;  
  RPM_PCO_SETGLOBAL = 3;  
{ use prefix part  }
type
  Prr_pco_use = ^Trr_pco_use;
  Trr_pco_use = record
      rpu_uselen : Tuint8_t;
      rpu_keeplen : Tuint8_t;
      rpu_ramask : Tuint8_t;
      rpu_raflags : Tuint8_t;
      rpu_vltime : Tuint32_t;
      rpu_pltime : Tuint32_t;
      rpu_flags : Tuint32_t;
      rpu_prefix : Tin6_addr;
    end;


const
  ICMP6_RR_PCOUSE_RAFLAGS_ONLINK = $20;  
  ICMP6_RR_PCOUSE_RAFLAGS_AUTO = $10;  
{$if __BYTE_ORDER == __BIG_ENDIAN}

const
  ICMP6_RR_PCOUSE_FLAGS_DECRVLTIME = $80000000;  
  ICMP6_RR_PCOUSE_FLAGS_DECRPLTIME = $40000000;  
(*** was #elif ****){$else __BYTE_ORDER == __LITTLE_ENDIAN}

const
  ICMP6_RR_PCOUSE_FLAGS_DECRVLTIME = $80;  
  ICMP6_RR_PCOUSE_FLAGS_DECRPLTIME = $40;  
{$endif}
{ router renumbering result message  }
type
  Prr_result = ^Trr_result;
  Trr_result = record
      rrr_flags : Tuint16_t;
      rrr_ordinal : Tuint8_t;
      rrr_matchedlen : Tuint8_t;
      rrr_ifid : Tuint32_t;
      rrr_prefix : Tin6_addr;
    end;

{$if __BYTE_ORDER == __BIG_ENDIAN}

const
  ICMP6_RR_RESULT_FLAGS_OOB = $0002;  
  ICMP6_RR_RESULT_FLAGS_FORBIDDEN = $0001;  
(*** was #elif ****){$else __BYTE_ORDER == __LITTLE_ENDIAN}

const
  ICMP6_RR_RESULT_FLAGS_OOB = $0200;  
  ICMP6_RR_RESULT_FLAGS_FORBIDDEN = $0100;  
{$endif}
{ Mobile IPv6 extension: Advertisement Interval.   }
type
  Pnd_opt_adv_interval = ^Tnd_opt_adv_interval;
  Tnd_opt_adv_interval = record
      nd_opt_adv_interval_type : Tuint8_t;
      nd_opt_adv_interval_len : Tuint8_t;
      nd_opt_adv_interval_reserved : Tuint16_t;
      nd_opt_adv_interval_ival : Tuint32_t;
    end;

{ Mobile IPv6 extension: Home Agent Info.   }
  Pnd_opt_home_agent_info = ^Tnd_opt_home_agent_info;
  Tnd_opt_home_agent_info = record
      nd_opt_home_agent_info_type : Tuint8_t;
      nd_opt_home_agent_info_len : Tuint8_t;
      nd_opt_home_agent_info_reserved : Tuint16_t;
      nd_opt_home_agent_info_preference : Tuint16_t;
      nd_opt_home_agent_info_lifetime : Tuint16_t;
    end;

{$endif}
{ netinet/icmpv6.h  }

// === Konventiert am: 10-8-25 17:27:59 ===


implementation


{ was #define dname def_expr }
function icmp6_pptr : longint; { return type might be wrong }
  begin
    icmp6_pptr:=icmp6_data32[0];
  end;

{ was #define dname def_expr }
function icmp6_mtu : longint; { return type might be wrong }
  begin
    icmp6_mtu:=icmp6_data32[0];
  end;

{ was #define dname def_expr }
function icmp6_id : longint; { return type might be wrong }
  begin
    icmp6_id:=icmp6_data16[0];
  end;

{ was #define dname def_expr }
function icmp6_seq : longint; { return type might be wrong }
  begin
    icmp6_seq:=icmp6_data16[1];
  end;

{ was #define dname def_expr }
function icmp6_maxdelay : longint; { return type might be wrong }
  begin
    icmp6_maxdelay:=icmp6_data16[0];
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ICMP6_FILTER_WILLPASS(_type,filterp : longint) : longint;
begin
  ICMP6_FILTER_WILLPASS:=((filterp^.(icmp6_filt[_type shr 5])) and (1 shl (Ttype(@(31)))))=0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ICMP6_FILTER_WILLBLOCK(_type,filterp : longint) : longint;
begin
  ICMP6_FILTER_WILLBLOCK:=((filterp^.(icmp6_filt[_type shr 5])) and (1 shl (Ttype(@(31)))))<>0;
end;

{ was #define dname def_expr }
function nd_rs_reserved : longint; { return type might be wrong }
  begin
    nd_rs_reserved:=nd_rs_hdr.(icmp6_data32[0]);
  end;

{ was #define dname def_expr }
function nd_ra_curhoplimit : longint; { return type might be wrong }
  begin
    nd_ra_curhoplimit:=nd_ra_hdr.(icmp6_data8[0]);
  end;

{ was #define dname def_expr }
function nd_ra_flags_reserved : longint; { return type might be wrong }
  begin
    nd_ra_flags_reserved:=nd_ra_hdr.(icmp6_data8[1]);
  end;

{ was #define dname def_expr }
function nd_ra_router_lifetime : longint; { return type might be wrong }
  begin
    nd_ra_router_lifetime:=nd_ra_hdr.(icmp6_data16[1]);
  end;

{ was #define dname def_expr }
function nd_ns_reserved : longint; { return type might be wrong }
  begin
    nd_ns_reserved:=nd_ns_hdr.(icmp6_data32[0]);
  end;

{ was #define dname def_expr }
function nd_na_flags_reserved : longint; { return type might be wrong }
  begin
    nd_na_flags_reserved:=nd_na_hdr.(icmp6_data32[0]);
  end;

{ was #define dname def_expr }
function nd_rd_reserved : longint; { return type might be wrong }
  begin
    nd_rd_reserved:=nd_rd_hdr.(icmp6_data32[0]);
  end;

{ was #define dname def_expr }
function mld_maxdelay : longint; { return type might be wrong }
  begin
    mld_maxdelay:=mld_icmp6_hdr.(icmp6_data16[0]);
  end;

{ was #define dname def_expr }
function mld_reserved : longint; { return type might be wrong }
  begin
    mld_reserved:=mld_icmp6_hdr.(icmp6_data16[1]);
  end;

{ was #define dname def_expr }
function rr_seqnum : longint; { return type might be wrong }
  begin
    rr_seqnum:=rr_hdr.(icmp6_data32[0]);
  end;


end.
