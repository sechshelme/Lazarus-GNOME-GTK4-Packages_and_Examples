unit ip;

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
{$ifndef __NETINET_IP_H}

const
  __NETINET_IP_H = 1;  
{$include <features.h>}
{$include <sys/types.h>}
{$include <netinet/in.h>}
type
  Ptimestamp = ^Ttimestamp;
  Ttimestamp = record
      len : Tuint8_t;
      ptr : Tuint8_t;
      flag0 : word;
      data : array[0..8] of Tuint32_t;
    end;


const
  bm_Ttimestamp_flags = $F;
  bp_Ttimestamp_flags = 0;
  bm_Ttimestamp_overflow = $F0;
  bp_Ttimestamp_overflow = 4;

function flags(var a : Ttimestamp) : dword;
procedure set_flags(var a : Ttimestamp; __flags : dword);
function overflow(var a : Ttimestamp) : dword;
procedure set_overflow(var a : Ttimestamp; __overflow : dword);
type
  Piphdr = ^Tiphdr;
  Tiphdr = record
      flag0 : word;
      tos : Tuint8_t;
      tot_len : Tuint16_t;
      id : Tuint16_t;
      frag_off : Tuint16_t;
      ttl : Tuint8_t;
      protocol : Tuint8_t;
      check : Tuint16_t;
      saddr : Tuint32_t;
      daddr : Tuint32_t;
    end;


const
  bm_Tiphdr_ihl = $F;
  bp_Tiphdr_ihl = 0;
  bm_Tiphdr_version = $F0;
  bp_Tiphdr_version = 4;

function ihl(var a : Tiphdr) : dword;
procedure set_ihl(var a : Tiphdr; __ihl : dword);
function version(var a : Tiphdr) : dword;
procedure set_version(var a : Tiphdr; __version : dword);
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
 *	@(#)ip.h	8.1 (Berkeley) 6/10/93
  }
{
 * Definitions for internet protocol version 4.
 * Per RFC 791, September 1981.
  }
{
 * Structure of an internet header, naked of options.
  }
{ header length  }
{ version  }
{ version  }
{ header length  }
{ type of service  }
{ total length  }
{ identification  }
{ fragment offset field  }
{ time to live  }
{ protocol  }
{ checksum  }
{ source and dest address  }
type
  Pip = ^Tip;
  Tip = record
      flag0 : word;
      ip_tos : Tuint8_t;
      ip_len : word;
      ip_id : word;
      ip_off : word;
      ip_ttl : Tuint8_t;
      ip_p : Tuint8_t;
      ip_sum : word;
      ip_src : Tin_addr;
      ip_dst : Tin_addr;
    end;


const
  bm_Tip_ip_hl = $F;
  bp_Tip_ip_hl = 0;
  bm_Tip_ip_v = $F0;
  bp_Tip_ip_v = 4;
  bm_Tip_ip_v = $F00;
  bp_Tip_ip_v = 8;
  bm_Tip_ip_hl = $F000;
  bp_Tip_ip_hl = 12;

function ip_hl(var a : Tip) : dword;
procedure set_ip_hl(var a : Tip; __ip_hl : dword);
function ip_v(var a : Tip) : dword;
procedure set_ip_v(var a : Tip; __ip_v : dword);
function ip_v(var a : Tip) : dword;
procedure set_ip_v(var a : Tip; __ip_v : dword);
function ip_hl(var a : Tip) : dword;
procedure set_ip_hl(var a : Tip; __ip_hl : dword);
{ reserved fragment flag  }

const
  IP_RF = $8000;  
{ dont fragment flag  }
  IP_DF = $4000;  
{ more fragments flag  }
  IP_MF = $2000;  
{ mask for fragmenting bits  }
  IP_OFFMASK = $1fff;  
{
 * Time stamp option structure.
  }
{ IPOPT_TS  }
{ size of structure (variable)  }
{ index of current entry  }
{ flags, see below  }
{ overflow counter  }
type
  Pip_timestamp = ^Tip_timestamp;
  Tip_timestamp = record
      ipt_code : Tuint8_t;
      ipt_len : Tuint8_t;
      ipt_ptr : Tuint8_t;
      flag0 : word;
      data : array[0..8] of Tuint32_t;
    end;


const
  bm_Tip_timestamp_ipt_flg = $F;
  bp_Tip_timestamp_ipt_flg = 0;
  bm_Tip_timestamp_ipt_oflw = $F0;
  bp_Tip_timestamp_ipt_oflw = 4;

function ipt_flg(var a : Tip_timestamp) : dword;
procedure set_ipt_flg(var a : Tip_timestamp; __ipt_flg : dword);
function ipt_oflw(var a : Tip_timestamp) : dword;
procedure set_ipt_oflw(var a : Tip_timestamp; __ipt_oflw : dword);
{$endif}
{ __USE_MISC  }
{ IP version number  }

const
  IPVERSION = 4;  
{ maximum packet size  }
  IP_MAXPACKET = 65535;  
{
 * Definitions for Explicit Congestion Notification (ECN)
 *
 * Taken from RFC-3168, Section 5.
  }
  IPTOS_ECN_MASK = $03;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function IPTOS_ECN(x : longint) : Tx;

const
  IPTOS_ECN_NOT_ECT = $00;  
  IPTOS_ECN_ECT1 = $01;  
  IPTOS_ECN_ECT0 = $02;  
  IPTOS_ECN_CE = $03;  
{
 * Definitions for IP differentiated services code points (DSCP)
 *
 * Taken from RFC-2597, Section 6 and RFC-2598, Section 2.3.
  }
  IPTOS_DSCP_MASK = $fc;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function IPTOS_DSCP(x : longint) : Tx;

const
  IPTOS_DSCP_AF11 = $28;  
  IPTOS_DSCP_AF12 = $30;  
  IPTOS_DSCP_AF13 = $38;  
  IPTOS_DSCP_AF21 = $48;  
  IPTOS_DSCP_AF22 = $50;  
  IPTOS_DSCP_AF23 = $58;  
  IPTOS_DSCP_AF31 = $68;  
  IPTOS_DSCP_AF32 = $70;  
  IPTOS_DSCP_AF33 = $78;  
  IPTOS_DSCP_AF41 = $88;  
  IPTOS_DSCP_AF42 = $90;  
  IPTOS_DSCP_AF43 = $98;  
  IPTOS_DSCP_EF = $b8;  
{
 * Voice-Admit DSCP code point from RFC-5865, Section 4.
  }
  IPTOS_DSCP_VA = $b0;  
{
 * Lower-Effort Per-Hop Behavior DSCP code point from RFC-8622, Section 12.
  }
  IPTOS_DSCP_LE = $04;  
{
 * In RFC 2474, Section 4.2.2.1, the Class Selector Codepoints subsume
 * the old ToS Precedence values.
  }
  IPTOS_CLASS_MASK = $e0;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function IPTOS_CLASS(klass : longint) : Tclass;

const
  IPTOS_CLASS_CS0 = $00;  
  IPTOS_CLASS_CS1 = $20;  
  IPTOS_CLASS_CS2 = $40;  
  IPTOS_CLASS_CS3 = $60;  
  IPTOS_CLASS_CS4 = $80;  
  IPTOS_CLASS_CS5 = $a0;  
  IPTOS_CLASS_CS6 = $c0;  
  IPTOS_CLASS_CS7 = $e0;  
  IPTOS_CLASS_DEFAULT = IPTOS_CLASS_CS0;  
{
 * Definitions for IP type of service (ip_tos) [deprecated; use DSCP
 * and CS definitions above instead.]
  }
  IPTOS_TOS_MASK = $1E;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function IPTOS_TOS(tos : longint) : Ttos;

const
  IPTOS_LOWDELAY = $10;  
  IPTOS_THROUGHPUT = $08;  
  IPTOS_RELIABILITY = $04;  
  IPTOS_LOWCOST = $02;  
  IPTOS_MINCOST = IPTOS_LOWCOST;  
{
 * Definitions for IP precedence (also in ip_tos) [also deprecated.]
  }
  IPTOS_PREC_MASK = IPTOS_CLASS_MASK;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function IPTOS_PREC(tos : longint) : longint;

const
  IPTOS_PREC_NETCONTROL = IPTOS_CLASS_CS7;  
  IPTOS_PREC_INTERNETCONTROL = IPTOS_CLASS_CS6;  
  IPTOS_PREC_CRITIC_ECP = IPTOS_CLASS_CS5;  
  IPTOS_PREC_FLASHOVERRIDE = IPTOS_CLASS_CS4;  
  IPTOS_PREC_FLASH = IPTOS_CLASS_CS3;  
  IPTOS_PREC_IMMEDIATE = IPTOS_CLASS_CS2;  
  IPTOS_PREC_PRIORITY = IPTOS_CLASS_CS1;  
  IPTOS_PREC_ROUTINE = IPTOS_CLASS_CS0;  
{
 * Definitions for options.
  }
  IPOPT_COPY = $80;  
  IPOPT_CLASS_MASK = $60;  
  IPOPT_NUMBER_MASK = $1f;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function IPOPT_COPIED(obj : longint) : To;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function IPOPT_CLASS(obj : longint) : To;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function IPOPT_NUMBER(obj : longint) : To;

const
  IPOPT_CONTROL = $00;  
  IPOPT_RESERVED1 = $20;  
  IPOPT_DEBMEAS = $40;  
  IPOPT_MEASUREMENT = IPOPT_DEBMEAS;  
  IPOPT_RESERVED2 = $60;  
{ end of option list  }
  IPOPT_EOL = 0;  
  IPOPT_END = IPOPT_EOL;  
{ no operation  }
  IPOPT_NOP = 1;  
  IPOPT_NOOP = IPOPT_NOP;  
{ record packet route  }
  IPOPT_RR = 7;  
{ timestamp  }
  IPOPT_TS = 68;  
  IPOPT_TIMESTAMP = IPOPT_TS;  
{ provide s,c,h,tcc  }
  IPOPT_SECURITY = 130;  
  IPOPT_SEC = IPOPT_SECURITY;  
{ loose source route  }
  IPOPT_LSRR = 131;  
{ satnet id  }
  IPOPT_SATID = 136;  
  IPOPT_SID = IPOPT_SATID;  
{ strict source route  }
  IPOPT_SSRR = 137;  
{ router alert  }
  IPOPT_RA = 148;  
{
 * Offsets to fields in options other than EOL and NOP.
  }
{ option ID  }
  IPOPT_OPTVAL = 0;  
{ option length  }
  IPOPT_OLEN = 1;  
{ offset within option  }
  IPOPT_OFFSET = 2;  
{ min value of above  }
  IPOPT_MINOFF = 4;  
  MAX_IPOPTLEN = 40;  
{ flag bits for ipt_flg  }
{ timestamps only  }
  IPOPT_TS_TSONLY = 0;  
{ timestamps and addresses  }
  IPOPT_TS_TSANDADDR = 1;  
{ specified modules only  }
  IPOPT_TS_PRESPEC = 3;  
{ bits for security (not byte swapped)  }
  IPOPT_SECUR_UNCLASS = $0000;  
  IPOPT_SECUR_CONFID = $f135;  
  IPOPT_SECUR_EFTO = $789a;  
  IPOPT_SECUR_MMMM = $bc4d;  
  IPOPT_SECUR_RESTR = $af13;  
  IPOPT_SECUR_SECRET = $d788;  
  IPOPT_SECUR_TOPSECRET = $6bc5;  
{
 * Internet implementation parameters.
  }
{ maximum time to live (seconds)  }
  MAXTTL = 255;  
{ default ttl, from RFC 1340  }
  IPDEFTTL = 64;  
{ time to live for frags, slowhz  }
  IPFRAGTTL = 60;  
{ subtracted when forwarding  }
  IPTTLDEC = 1;  
{ default maximum segment size  }
  IP_MSS = 576;  
{$endif}
{ netinet/ip.h  }

// === Konventiert am: 10-8-25 17:28:17 ===


implementation


function flags(var a : Ttimestamp) : dword;
begin
  flags:=(a.flag0 and bm_Ttimestamp_flags) shr bp_Ttimestamp_flags;
end;

procedure set_flags(var a : Ttimestamp; __flags : dword);
begin
  a.flag0:=a.flag0 or ((__flags shl bp_Ttimestamp_flags) and bm_Ttimestamp_flags);
end;

function overflow(var a : Ttimestamp) : dword;
begin
  overflow:=(a.flag0 and bm_Ttimestamp_overflow) shr bp_Ttimestamp_overflow;
end;

procedure set_overflow(var a : Ttimestamp; __overflow : dword);
begin
  a.flag0:=a.flag0 or ((__overflow shl bp_Ttimestamp_overflow) and bm_Ttimestamp_overflow);
end;

function ihl(var a : Tiphdr) : dword;
begin
  ihl:=(a.flag0 and bm_Tiphdr_ihl) shr bp_Tiphdr_ihl;
end;

procedure set_ihl(var a : Tiphdr; __ihl : dword);
begin
  a.flag0:=a.flag0 or ((__ihl shl bp_Tiphdr_ihl) and bm_Tiphdr_ihl);
end;

function version(var a : Tiphdr) : dword;
begin
  version:=(a.flag0 and bm_Tiphdr_version) shr bp_Tiphdr_version;
end;

procedure set_version(var a : Tiphdr; __version : dword);
begin
  a.flag0:=a.flag0 or ((__version shl bp_Tiphdr_version) and bm_Tiphdr_version);
end;

function ip_hl(var a : Tip) : dword;
begin
  ip_hl:=(a.flag0 and bm_Tip_ip_hl) shr bp_Tip_ip_hl;
end;

procedure set_ip_hl(var a : Tip; __ip_hl : dword);
begin
  a.flag0:=a.flag0 or ((__ip_hl shl bp_Tip_ip_hl) and bm_Tip_ip_hl);
end;

function ip_v(var a : Tip) : dword;
begin
  ip_v:=(a.flag0 and bm_Tip_ip_v) shr bp_Tip_ip_v;
end;

procedure set_ip_v(var a : Tip; __ip_v : dword);
begin
  a.flag0:=a.flag0 or ((__ip_v shl bp_Tip_ip_v) and bm_Tip_ip_v);
end;

function ip_v(var a : Tip) : dword;
begin
  ip_v:=(a.flag0 and bm_Tip_ip_v) shr bp_Tip_ip_v;
end;

procedure set_ip_v(var a : Tip; __ip_v : dword);
begin
  a.flag0:=a.flag0 or ((__ip_v shl bp_Tip_ip_v) and bm_Tip_ip_v);
end;

function ip_hl(var a : Tip) : dword;
begin
  ip_hl:=(a.flag0 and bm_Tip_ip_hl) shr bp_Tip_ip_hl;
end;

procedure set_ip_hl(var a : Tip; __ip_hl : dword);
begin
  a.flag0:=a.flag0 or ((__ip_hl shl bp_Tip_ip_hl) and bm_Tip_ip_hl);
end;

function ipt_flg(var a : Tip_timestamp) : dword;
begin
  ipt_flg:=(a.flag0 and bm_Tip_timestamp_ipt_flg) shr bp_Tip_timestamp_ipt_flg;
end;

procedure set_ipt_flg(var a : Tip_timestamp; __ipt_flg : dword);
begin
  a.flag0:=a.flag0 or ((__ipt_flg shl bp_Tip_timestamp_ipt_flg) and bm_Tip_timestamp_ipt_flg);
end;

function ipt_oflw(var a : Tip_timestamp) : dword;
begin
  ipt_oflw:=(a.flag0 and bm_Tip_timestamp_ipt_oflw) shr bp_Tip_timestamp_ipt_oflw;
end;

procedure set_ipt_oflw(var a : Tip_timestamp; __ipt_oflw : dword);
begin
  a.flag0:=a.flag0 or ((__ipt_oflw shl bp_Tip_timestamp_ipt_oflw) and bm_Tip_timestamp_ipt_oflw);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function IPTOS_ECN(x : longint) : Tx;
begin
  IPTOS_ECN:=Tx(@(IPTOS_ECN_MASK));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function IPTOS_DSCP(x : longint) : Tx;
begin
  IPTOS_DSCP:=Tx(@(IPTOS_DSCP_MASK));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function IPTOS_CLASS(klass : longint) : Tclass;
begin
  IPTOS_CLASS:=Tclass(@(IPTOS_CLASS_MASK));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function IPTOS_TOS(tos : longint) : Ttos;
begin
  IPTOS_TOS:=Ttos(@(IPTOS_TOS_MASK));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IPTOS_PREC(tos : longint) : longint;
begin
  IPTOS_PREC:=IPTOS_CLASS(tos);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function IPOPT_COPIED(obj : longint) : To;
begin
  IPOPT_COPIED:=To(@(IPOPT_COPY));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function IPOPT_CLASS(obj : longint) : To;
begin
  IPOPT_CLASS:=To(@(IPOPT_CLASS_MASK));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function IPOPT_NUMBER(obj : longint) : To;
begin
  IPOPT_NUMBER:=To(@(IPOPT_NUMBER_MASK));
end;


end.
