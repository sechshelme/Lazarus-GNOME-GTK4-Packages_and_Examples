unit ip_icmp;

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
{$ifndef __NETINET_IP_ICMP_H}

const
  __NETINET_IP_ICMP_H = 1;  
{$include <sys/types.h>}
{$include <stdint.h>}
{ message type  }
{ type sub-code  }
{ echo datagram  }
{ gateway address  }
{ path mtu discovery  }
type
  Picmphdr = ^Ticmphdr;
  Ticmphdr = record
      _type : Tuint8_t;
      code : Tuint8_t;
      checksum : Tuint16_t;
      un : record
          case longint of
            0 : ( echo : record
                id : Tuint16_t;
                sequence : Tuint16_t;
              end );
            1 : ( gateway : Tuint32_t );
            2 : ( frag : record
                __glibc_reserved : Tuint16_t;
                mtu : Tuint16_t;
              end );
          end;
    end;

{ Echo Reply			 }

const
  ICMP_ECHOREPLY = 0;  
{ Destination Unreachable	 }
  ICMP_DEST_UNREACH = 3;  
{ Source Quench		 }
  ICMP_SOURCE_QUENCH = 4;  
{ Redirect (change route)	 }
  ICMP_REDIRECT = 5;  
{ Echo Request			 }
  ICMP_ECHO = 8;  
{ Time Exceeded		 }
  ICMP_TIME_EXCEEDED = 11;  
{ Parameter Problem		 }
  ICMP_PARAMETERPROB = 12;  
{ Timestamp Request		 }
  ICMP_TIMESTAMP = 13;  
{ Timestamp Reply		 }
  ICMP_TIMESTAMPREPLY = 14;  
{ Information Request		 }
  ICMP_INFO_REQUEST = 15;  
{ Information Reply		 }
  ICMP_INFO_REPLY = 16;  
{ Address Mask Request		 }
  ICMP_ADDRESS = 17;  
{ Address Mask Reply		 }
  ICMP_ADDRESSREPLY = 18;  
  NR_ICMP_TYPES = 18;  
{ Codes for UNREACH.  }
{ Network Unreachable		 }
  ICMP_NET_UNREACH = 0;  
{ Host Unreachable		 }
  ICMP_HOST_UNREACH = 1;  
{ Protocol Unreachable		 }
  ICMP_PROT_UNREACH = 2;  
{ Port Unreachable		 }
  ICMP_PORT_UNREACH = 3;  
{ Fragmentation Needed/DF set	 }
  ICMP_FRAG_NEEDED = 4;  
{ Source Route failed		 }
  ICMP_SR_FAILED = 5;  
  ICMP_NET_UNKNOWN = 6;  
  ICMP_HOST_UNKNOWN = 7;  
  ICMP_HOST_ISOLATED = 8;  
  ICMP_NET_ANO = 9;  
  ICMP_HOST_ANO = 10;  
  ICMP_NET_UNR_TOS = 11;  
  ICMP_HOST_UNR_TOS = 12;  
{ Packet filtered  }
  ICMP_PKT_FILTERED = 13;  
{ Precedence violation  }
  ICMP_PREC_VIOLATION = 14;  
{ Precedence cut off  }
  ICMP_PREC_CUTOFF = 15;  
{ instead of hardcoding immediate value  }
  NR_ICMP_UNREACH = 15;  
{ Codes for REDIRECT.  }
{ Redirect Net			 }
  ICMP_REDIR_NET = 0;  
{ Redirect Host		 }
  ICMP_REDIR_HOST = 1;  
{ Redirect Net for TOS		 }
  ICMP_REDIR_NETTOS = 2;  
{ Redirect Host for TOS	 }
  ICMP_REDIR_HOSTTOS = 3;  
{ Codes for TIME_EXCEEDED.  }
{ TTL count exceeded		 }
  ICMP_EXC_TTL = 0;  
{ Fragment Reass time exceeded	 }
  ICMP_EXC_FRAGTIME = 1;  
{ Codes for ICMP_EXT_ECHO (PROBE)  }
  ICMP_EXT_ECHO = 42;  
  ICMP_EXT_ECHOREPLY = 43;  
{ Malformed Query  }
  ICMP_EXT_CODE_MAL_QUERY = 1;  
{ No such Interface  }
  ICMP_EXT_CODE_NO_IF = 2;  
{ No table entry  }
  ICMP_EXT_CODE_NO_TABLE_ENT = 3;  
{ Multiple Interfaces Satisfy Query  }
  ICMP_EXT_CODE_MULT_IFS = 4;  
{ Constants for EXT_ECHO (PROBE)  }
{ active bit in reply  }
  ICMP_EXT_ECHOREPLY_ACTIVE = 1 shl 2;  
{ ipv4 bit in reply  }
  ICMP_EXT_ECHOREPLY_IPV4 = 1 shl 1;  
{ ipv6 bit in reply  }
  ICMP_EXT_ECHOREPLY_IPV6 = 1;  
  ICMP_EXT_ECHO_CTYPE_NAME = 1;  
  ICMP_EXT_ECHO_CTYPE_INDEX = 2;  
  ICMP_EXT_ECHO_CTYPE_ADDR = 3;  
{ Address Family Identifier for IPV4  }
  ICMP_AFI_IP = 1;  
{ Address Family Identifier for IPV6  }
  ICMP_AFI_IP6 = 2;  
{$ifdef __USE_MISC}
{
 * Copyright (c) 1982, 1986, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 *	@(#)ip_icmp.h	8.1 (Berkeley) 6/10/93
  }
{$include <netinet/in.h>}
{$include <netinet/ip.h>}
{
 * Internal of an ICMP Router Advertisement
  }
type
  Picmp_ra_addr = ^Ticmp_ra_addr;
  Ticmp_ra_addr = record
      ira_addr : Tuint32_t;
      ira_preference : Tuint32_t;
    end;

{ type of message, see below  }
{ type sub code  }
{ ones complement checksum of struct  }
{ ICMP_PARAMPROB  }
{ gateway address  }
{ echo datagram  }
{ ICMP_UNREACH_NEEDFRAG -- Path MTU Discovery (RFC1191)  }
{ options and then 64 bits of data  }
  Picmp = ^Ticmp;
  Ticmp = record
      icmp_type : Tuint8_t;
      icmp_code : Tuint8_t;
      icmp_cksum : Tuint16_t;
      icmp_hun : record
          case longint of
            0 : ( ih_pptr : byte );
            1 : ( ih_gwaddr : Tin_addr );
            2 : ( ih_idseq : record
                icd_id : Tuint16_t;
                icd_seq : Tuint16_t;
              end );
            3 : ( ih_void : Tuint32_t );
            4 : ( ih_pmtu : record
                ipm_void : Tuint16_t;
                ipm_nextmtu : Tuint16_t;
              end );
            5 : ( ih_rtradv : record
                irt_num_addrs : Tuint8_t;
                irt_wpa : Tuint8_t;
                irt_lifetime : Tuint16_t;
              end );
          end;
      icmp_dun : record
          case longint of
            0 : ( id_ts : record
                its_otime : Tuint32_t;
                its_rtime : Tuint32_t;
                its_ttime : Tuint32_t;
              end );
            1 : ( id_ip : record
                idi_ip : Tip;
              end );
            2 : ( id_radv : Ticmp_ra_addr );
            3 : ( id_mask : Tuint32_t );
            4 : ( id_data : array[0..0] of Tuint8_t );
          end;
    end;

{
 * Lower bounds on packet lengths for various types.
 * For the error advice packets must first insure that the
 * packet is large enough to contain the returned ip header.
 * Only then can we do the check to see if 64 bits of packet
 * data have been returned, since we need to check the returned
 * ip header length.
  }
{ abs minimum  }

const
  ICMP_MINLEN = 8;  
{ timestamp  }

{ was #define dname def_expr }
function ICMP_TSLEN : longint; { return type might be wrong }

{ address mask  }
const
  ICMP_MASKLEN = 12;  
{ xxxxxxxxx #define	ICMP_ADVLENMIN	(8 + sizeof (struct ip) + 8)	/* min */ }
{$ifndef _IP_VHL}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ICMP_ADVLEN(p : longint) : longint;

{ N.B.: must separately check that ip_hl >= 5  }
{$else}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ICMP_ADVLEN(p : longint) : longint;

{ N.B.: must separately check that header length >= 5  }
{$endif}
{ Definition of type and code fields.  }
{ defined above: ICMP_ECHOREPLY, ICMP_REDIRECT, ICMP_ECHO  }
{ dest unreachable, codes:  }

const
  ICMP_UNREACH = 3;  
{ packet lost, slow down  }
  ICMP_SOURCEQUENCH = 4;  
{ router advertisement  }
  ICMP_ROUTERADVERT = 9;  
{ router solicitation  }
  ICMP_ROUTERSOLICIT = 10;  
{ time exceeded, code:  }
  ICMP_TIMXCEED = 11;  
{ ip header bad  }
  ICMP_PARAMPROB = 12;  
{ timestamp request  }
  ICMP_TSTAMP = 13;  
{ timestamp reply  }
  ICMP_TSTAMPREPLY = 14;  
{ information request  }
  ICMP_IREQ = 15;  
{ information reply  }
  ICMP_IREQREPLY = 16;  
{ address mask request  }
  ICMP_MASKREQ = 17;  
{ address mask reply  }
  ICMP_MASKREPLY = 18;  
  ICMP_MAXTYPE = 18;  
{ UNREACH codes  }
{ bad net  }
  ICMP_UNREACH_NET = 0;  
{ bad host  }
  ICMP_UNREACH_HOST = 1;  
{ bad protocol  }
  ICMP_UNREACH_PROTOCOL = 2;  
{ bad port  }
  ICMP_UNREACH_PORT = 3;  
{ IP_DF caused drop  }
  ICMP_UNREACH_NEEDFRAG = 4;  
{ src route failed  }
  ICMP_UNREACH_SRCFAIL = 5;  
{ unknown net  }
  ICMP_UNREACH_NET_UNKNOWN = 6;  
{ unknown host  }
  ICMP_UNREACH_HOST_UNKNOWN = 7;  
{ src host isolated  }
  ICMP_UNREACH_ISOLATED = 8;  
{ net denied  }
  ICMP_UNREACH_NET_PROHIB = 9;  
{ host denied  }
  ICMP_UNREACH_HOST_PROHIB = 10;  
{ bad tos for net  }
  ICMP_UNREACH_TOSNET = 11;  
{ bad tos for host  }
  ICMP_UNREACH_TOSHOST = 12;  
{ admin prohib  }
  ICMP_UNREACH_FILTER_PROHIB = 13;  
{ host prec vio.  }
  ICMP_UNREACH_HOST_PRECEDENCE = 14;  
{ prec cutoff  }
  ICMP_UNREACH_PRECEDENCE_CUTOFF = 15;  
{ REDIRECT codes  }
{ for network  }
  ICMP_REDIRECT_NET = 0;  
{ for host  }
  ICMP_REDIRECT_HOST = 1;  
{ for tos and net  }
  ICMP_REDIRECT_TOSNET = 2;  
{ for tos and host  }
  ICMP_REDIRECT_TOSHOST = 3;  
{ TIMEXCEED codes  }
{ ttl==0 in transit  }
  ICMP_TIMXCEED_INTRANS = 0;  
{ ttl==0 in reass  }
  ICMP_TIMXCEED_REASS = 1;  
{ PARAMPROB code  }
{ req. opt. absent  }
  ICMP_PARAMPROB_OPTABSENT = 1;  
{ xxxxxxxxxxxxxxxx"
#define	ICMP_INFOTYPE(type) \
	((type) == ICMP_ECHOREPLY || (type) == ICMP_ECHO \
	 || (type) == ICMP_ROUTERADVERT || (type) == ICMP_ROUTERSOLICIT \
	 || (type) == ICMP_TSTAMP || (type) == ICMP_TSTAMPREPLY \
	 || (type) == ICMP_IREQ || (type) == ICMP_IREQREPLY \
	 || (type) == ICMP_MASKREQ || (type) == ICMP_MASKREPLY)
 }
{$endif}
{ __USE_MISC  }
{$endif}
{ netinet/ip_icmp.h  }

// === Konventiert am: 10-8-25 17:28:23 ===


implementation


{ was #define dname def_expr }
function ICMP_TSLEN : longint; { return type might be wrong }
  begin
    ICMP_TSLEN:=8+(3*(sizeof(n_time)));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ICMP_ADVLEN(p : longint) : longint;
begin
  ICMP_ADVLEN:=(8+((p^.(icmp_ip.ip_hl)) shl 2))+8;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ICMP_ADVLEN(p : longint) : longint;
begin
  ICMP_ADVLEN:=(8+((IP_VHL_HL(p^.(icmp_ip.ip_vhl))) shl 2))+8;
end;


end.
