unit nameser_compat;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (c) 1983, 1989
 *    The Regents of the University of California.  All rights reserved.
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
  }
{$ifndef _ARPA_NAMESER_COMPAT_}
{$define _ARPA_NAMESER_COMPAT_}
{$include <endian.h>}
{%
 * Structure for query header.  The order of the fields is machine- and
 * compiler-dependent, depending on the byte/bit order and the layout
 * of bit fields.  We use bit fields only in int variables, as this
 * is all ANSI requires.  This requires a somewhat confusing rearrangement.
  }
{%< query identification number  }
{ fields in third byte  }
{%< recursion desired  }
{%< truncated message  }
{%< authoritative answer  }
{%< purpose of message  }
{%< response flag  }
{ fields in fourth byte  }
{%< response code  }
{%< checking disabled by resolver  }
{%< authentic data from named  }
{%< unused bits (MBZ as of 4.9.3a3)  }
{%< recursion available  }
{ remaining bytes  }
{%< number of question entries  }
{%< number of answer entries  }
{%< number of authority entries  }
{%< number of resource entries  }
type
  PHEADER = ^THEADER;
  THEADER = record
      flag0 : longint;
      flag1 : longint;
      flag2 : longint;
    end;

const
  bm_HEADER_id = $FFFF;
  bp_HEADER_id = 0;
  bm_HEADER_rd = $10000;
  bp_HEADER_rd = 16;
  bm_HEADER_tc = $20000;
  bp_HEADER_tc = 17;
  bm_HEADER_aa = $40000;
  bp_HEADER_aa = 18;
  bm_HEADER_opcode = $780000;
  bp_HEADER_opcode = 19;
  bm_HEADER_qr = $800000;
  bp_HEADER_qr = 23;
  bm_HEADER_rcode = $F000000;
  bp_HEADER_rcode = 24;
  bm_HEADER_cd = $10000000;
  bp_HEADER_cd = 28;
  bm_HEADER_ad = $20000000;
  bp_HEADER_ad = 29;
  bm_HEADER_unused = $40000000;
  bp_HEADER_unused = 30;
  bm_HEADER_ra = $80000000;
  bp_HEADER_ra = 31;
  bm_HEADER_qdcount = $FFFF;
  bp_HEADER_qdcount = 0;
  bm_HEADER_ancount = $FFFF0000;
  bp_HEADER_ancount = 16;
  bm_HEADER_nscount = $FFFF;
  bp_HEADER_nscount = 0;
  bm_HEADER_arcount = $FFFF0000;
  bp_HEADER_arcount = 16;

function id(var a : HEADER) : dword;
procedure set_id(var a : HEADER; __id : dword);
function rd(var a : HEADER) : dword;
procedure set_rd(var a : HEADER; __rd : dword);
function tc(var a : HEADER) : dword;
procedure set_tc(var a : HEADER; __tc : dword);
function aa(var a : HEADER) : dword;
procedure set_aa(var a : HEADER; __aa : dword);
function opcode(var a : HEADER) : dword;
procedure set_opcode(var a : HEADER; __opcode : dword);
function qr(var a : HEADER) : dword;
procedure set_qr(var a : HEADER; __qr : dword);
function rcode(var a : HEADER) : dword;
procedure set_rcode(var a : HEADER; __rcode : dword);
function cd(var a : HEADER) : dword;
procedure set_cd(var a : HEADER; __cd : dword);
function ad(var a : HEADER) : dword;
procedure set_ad(var a : HEADER; __ad : dword);
function unused(var a : HEADER) : dword;
procedure set_unused(var a : HEADER; __unused : dword);
function ra(var a : HEADER) : dword;
procedure set_ra(var a : HEADER; __ra : dword);
function qdcount(var a : HEADER) : dword;
procedure set_qdcount(var a : HEADER; __qdcount : dword);
function ancount(var a : HEADER) : dword;
procedure set_ancount(var a : HEADER; __ancount : dword);
function nscount(var a : HEADER) : dword;
procedure set_nscount(var a : HEADER; __nscount : dword);
function arcount(var a : HEADER) : dword;
procedure set_arcount(var a : HEADER; __arcount : dword);

const
  PACKETSZ = NS_PACKETSZ;  
  MAXDNAME = NS_MAXDNAME;  
  MAXCDNAME = NS_MAXCDNAME;  
  MAXLABEL = NS_MAXLABEL;  
  HFIXEDSZ = NS_HFIXEDSZ;  
  QFIXEDSZ = NS_QFIXEDSZ;  
  RRFIXEDSZ = NS_RRFIXEDSZ;  
  INT32SZ = NS_INT32SZ;  
  INT16SZ = NS_INT16SZ;  
  INT8SZ = NS_INT8SZ;  
  INADDRSZ = NS_INADDRSZ;  
  IN6ADDRSZ = NS_IN6ADDRSZ;  
  INDIR_MASK = NS_CMPRSFLGS;  
  NAMESERVER_PORT = NS_DEFAULTPORT;  
  S_ZONE = ns_s_zn;  
  S_PREREQ = ns_s_pr;  
  S_UPDATE = ns_s_ud;  
  S_ADDT = ns_s_ar;  
  QUERY = ns_o_query;  
  IQUERY = ns_o_iquery;  
  STATUS = ns_o_status;  
  NS_NOTIFY_OP = ns_o_notify;  
  NS_UPDATE_OP = ns_o_update;  
  NOERROR = ns_r_noerror;  
  FORMERR = ns_r_formerr;  
  SERVFAIL = ns_r_servfail;  
  NXDOMAIN = ns_r_nxdomain;  
  NOTIMP = ns_r_notimpl;  
  REFUSED = ns_r_refused;  
  YXDOMAIN = ns_r_yxdomain;  
  YXRRSET = ns_r_yxrrset;  
  NXRRSET = ns_r_nxrrset;  
  NOTAUTH = ns_r_notauth;  
  NOTZONE = ns_r_notzone;  
{#define BADSIG		ns_r_badsig }
{#define BADKEY		ns_r_badkey }
{#define BADTIME		ns_r_badtime }
  DELETE = ns_uop_delete;  
  ADD = ns_uop_add;  
  T_A = ns_t_a;  
  T_NS = ns_t_ns;  
  T_MD = ns_t_md;  
  T_MF = ns_t_mf;  
  T_CNAME = ns_t_cname;  
  T_SOA = ns_t_soa;  
  T_MB = ns_t_mb;  
  T_MG = ns_t_mg;  
  T_MR = ns_t_mr;  
  T_NULL = ns_t_null;  
  T_WKS = ns_t_wks;  
  T_PTR = ns_t_ptr;  
  T_HINFO = ns_t_hinfo;  
  T_MINFO = ns_t_minfo;  
  T_MX = ns_t_mx;  
  T_TXT = ns_t_txt;  
  T_RP = ns_t_rp;  
  T_AFSDB = ns_t_afsdb;  
  T_X25 = ns_t_x25;  
  T_ISDN = ns_t_isdn;  
  T_RT = ns_t_rt;  
  T_NSAP = ns_t_nsap;  
  T_NSAP_PTR = ns_t_nsap_ptr;  
  T_SIG = ns_t_sig;  
  T_KEY = ns_t_key;  
  T_PX = ns_t_px;  
  T_GPOS = ns_t_gpos;  
  T_AAAA = ns_t_aaaa;  
  T_LOC = ns_t_loc;  
  T_NXT = ns_t_nxt;  
  T_EID = ns_t_eid;  
  T_NIMLOC = ns_t_nimloc;  
  T_SRV = ns_t_srv;  
  T_ATMA = ns_t_atma;  
  T_NAPTR = ns_t_naptr;  
  T_KX = ns_t_kx;  
  T_CERT = ns_t_cert;  
  T_A6 = ns_t_a6;  
  T_DNAME = ns_t_dname;  
  T_SINK = ns_t_sink;  
  T_OPT = ns_t_opt;  
  T_APL = ns_t_apl;  
  T_DS = ns_t_ds;  
  T_SSHFP = ns_t_sshfp;  
  T_IPSECKEY = ns_t_ipseckey;  
  T_RRSIG = ns_t_rrsig;  
  T_NSEC = ns_t_nsec;  
  T_DNSKEY = ns_t_dnskey;  
  T_DHCID = ns_t_dhcid;  
  T_NSEC3 = ns_t_nsec3;  
  T_NSEC3PARAM = ns_t_nsec3param;  
  T_TLSA = ns_t_tlsa;  
  T_SMIMEA = ns_t_smimea;  
  T_HIP = ns_t_hip;  
  T_NINFO = ns_t_ninfo;  
  T_RKEY = ns_t_rkey;  
  T_TALINK = ns_t_talink;  
  T_CDS = ns_t_cds;  
  T_CDNSKEY = ns_t_cdnskey;  
  T_OPENPGPKEY = ns_t_openpgpkey;  
  T_CSYNC = ns_t_csync;  
  T_SPF = ns_t_spf;  
  T_UINFO = ns_t_uinfo;  
  T_UID = ns_t_uid;  
  T_GID = ns_t_gid;  
  T_UNSPEC = ns_t_unspec;  
  T_NID = ns_t_nid;  
  T_L32 = ns_t_l32;  
  T_L64 = ns_t_l64;  
  T_LP = ns_t_lp;  
  T_EUI48 = ns_t_eui48;  
  T_EUI64 = ns_t_eui64;  
  T_TKEY = ns_t_tkey;  
  T_TSIG = ns_t_tsig;  
  T_IXFR = ns_t_ixfr;  
  T_AXFR = ns_t_axfr;  
  T_MAILB = ns_t_mailb;  
  T_MAILA = ns_t_maila;  
  T_ANY = ns_t_any;  
  T_URI = ns_t_uri;  
  T_CAA = ns_t_caa;  
  T_AVC = ns_t_avc;  
  T_TA = ns_t_ta;  
  T_DLV = ns_t_dlv;  
  C_IN = ns_c_in;  
  C_CHAOS = ns_c_chaos;  
  C_HS = ns_c_hs;  
{ BIND_UPDATE  }
  C_NONE = ns_c_none;  
  C_ANY = ns_c_any;  
  GETSHORT = NS_GET16;  
  GETLONG = NS_GET32;  
  PUTSHORT = NS_PUT16;  
  PUTLONG = NS_PUT32;  
{$endif}
{ _ARPA_NAMESER_COMPAT_  }
{! \file  }

// === Konventiert am: 13-8-25 19:42:55 ===


implementation


function id(var a : HEADER) : dword;
begin
  id:=(a.flag0 and bm_HEADER_id) shr bp_HEADER_id;
end;

procedure set_id(var a : HEADER; __id : dword);
begin
  a.flag0:=a.flag0 or ((__id shl bp_HEADER_id) and bm_HEADER_id);
end;

function rd(var a : HEADER) : dword;
begin
  rd:=(a.flag0 and bm_HEADER_rd) shr bp_HEADER_rd;
end;

procedure set_rd(var a : HEADER; __rd : dword);
begin
  a.flag0:=a.flag0 or ((__rd shl bp_HEADER_rd) and bm_HEADER_rd);
end;

function tc(var a : HEADER) : dword;
begin
  tc:=(a.flag0 and bm_HEADER_tc) shr bp_HEADER_tc;
end;

procedure set_tc(var a : HEADER; __tc : dword);
begin
  a.flag0:=a.flag0 or ((__tc shl bp_HEADER_tc) and bm_HEADER_tc);
end;

function aa(var a : HEADER) : dword;
begin
  aa:=(a.flag0 and bm_HEADER_aa) shr bp_HEADER_aa;
end;

procedure set_aa(var a : HEADER; __aa : dword);
begin
  a.flag0:=a.flag0 or ((__aa shl bp_HEADER_aa) and bm_HEADER_aa);
end;

function opcode(var a : HEADER) : dword;
begin
  opcode:=(a.flag0 and bm_HEADER_opcode) shr bp_HEADER_opcode;
end;

procedure set_opcode(var a : HEADER; __opcode : dword);
begin
  a.flag0:=a.flag0 or ((__opcode shl bp_HEADER_opcode) and bm_HEADER_opcode);
end;

function qr(var a : HEADER) : dword;
begin
  qr:=(a.flag0 and bm_HEADER_qr) shr bp_HEADER_qr;
end;

procedure set_qr(var a : HEADER; __qr : dword);
begin
  a.flag0:=a.flag0 or ((__qr shl bp_HEADER_qr) and bm_HEADER_qr);
end;

function rcode(var a : HEADER) : dword;
begin
  rcode:=(a.flag0 and bm_HEADER_rcode) shr bp_HEADER_rcode;
end;

procedure set_rcode(var a : HEADER; __rcode : dword);
begin
  a.flag0:=a.flag0 or ((__rcode shl bp_HEADER_rcode) and bm_HEADER_rcode);
end;

function cd(var a : HEADER) : dword;
begin
  cd:=(a.flag0 and bm_HEADER_cd) shr bp_HEADER_cd;
end;

procedure set_cd(var a : HEADER; __cd : dword);
begin
  a.flag0:=a.flag0 or ((__cd shl bp_HEADER_cd) and bm_HEADER_cd);
end;

function ad(var a : HEADER) : dword;
begin
  ad:=(a.flag0 and bm_HEADER_ad) shr bp_HEADER_ad;
end;

procedure set_ad(var a : HEADER; __ad : dword);
begin
  a.flag0:=a.flag0 or ((__ad shl bp_HEADER_ad) and bm_HEADER_ad);
end;

function unused(var a : HEADER) : dword;
begin
  unused:=(a.flag0 and bm_HEADER_unused) shr bp_HEADER_unused;
end;

procedure set_unused(var a : HEADER; __unused : dword);
begin
  a.flag0:=a.flag0 or ((__unused shl bp_HEADER_unused) and bm_HEADER_unused);
end;

function ra(var a : HEADER) : dword;
begin
  ra:=(a.flag0 and bm_HEADER_ra) shr bp_HEADER_ra;
end;

procedure set_ra(var a : HEADER; __ra : dword);
begin
  a.flag0:=a.flag0 or ((__ra shl bp_HEADER_ra) and bm_HEADER_ra);
end;

function qdcount(var a : HEADER) : dword;
begin
  qdcount:=(a.flag0 and bm_HEADER_qdcount) shr bp_HEADER_qdcount;
end;

procedure set_qdcount(var a : HEADER; __qdcount : dword);
begin
  a.flag0:=a.flag0 or ((__qdcount shl bp_HEADER_qdcount) and bm_HEADER_qdcount);
end;

function ancount(var a : HEADER) : dword;
begin
  ancount:=(a.flag0 and bm_HEADER_ancount) shr bp_HEADER_ancount;
end;

procedure set_ancount(var a : HEADER; __ancount : dword);
begin
  a.flag0:=a.flag0 or ((__ancount shl bp_HEADER_ancount) and bm_HEADER_ancount);
end;

function nscount(var a : HEADER) : dword;
begin
  nscount:=(a.flag0 and bm_HEADER_nscount) shr bp_HEADER_nscount;
end;

procedure set_nscount(var a : HEADER; __nscount : dword);
begin
  a.flag0:=a.flag0 or ((__nscount shl bp_HEADER_nscount) and bm_HEADER_nscount);
end;

function arcount(var a : HEADER) : dword;
begin
  arcount:=(a.flag0 and bm_HEADER_arcount) shr bp_HEADER_arcount;
end;

procedure set_arcount(var a : HEADER; __arcount : dword);
begin
  a.flag0:=a.flag0 or ((__arcount shl bp_HEADER_arcount) and bm_HEADER_arcount);
end;


end.
