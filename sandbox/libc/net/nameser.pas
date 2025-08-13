unit nameser;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 1983, 1989, 1993
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
{
 * Copyright (c) 2004 by Internet Systems Consortium, Inc. ("ISC")
 * Copyright (c) 1996-1999 by Internet Software Consortium.
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND INTERNET SOFTWARE CONSORTIUM DISCLAIMS
 * ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL INTERNET SOFTWARE
 * CONSORTIUM BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
 * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
 * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
 * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
 * SOFTWARE.
  }
{$ifndef _ARPA_NAMESER_H_}
{$define _ARPA_NAMESER_H_}
{$include <sys/param.h>}
{$include <sys/types.h>}
{$include <stdint.h>}
{$ifdef _LIBC}
{$define __NAMESER_DEPRECATED}
{$else}

const
  __NAMESER_DEPRECATED = __attribute_deprecated__;  
{$endif}
{
 * Define constants based on RFC 883, RFC 1034, RFC 1035
  }
{%< default UDP packet size  }

const
  NS_PACKETSZ = 512;  
{%< maximum domain name  }
  NS_MAXDNAME = 1025;  
{%< maximum message size  }
  NS_MAXMSG = 65535;  
{%< maximum compressed domain name  }
  NS_MAXCDNAME = 255;  
{%< maximum length of domain label  }
  NS_MAXLABEL = 63;  
{%< #/bytes of fixed data in header  }
  NS_HFIXEDSZ = 12;  
{%< #/bytes of fixed data in query  }
  NS_QFIXEDSZ = 4;  
{%< #/bytes of fixed data in r record  }
  NS_RRFIXEDSZ = 10;  
{%< #/bytes of data in a uint32_t  }
  NS_INT32SZ = 4;  
{%< #/bytes of data in a uint16_t  }
  NS_INT16SZ = 2;  
{%< #/bytes of data in a uint8_t  }
  NS_INT8SZ = 1;  
{%< IPv4 T_A  }
  NS_INADDRSZ = 4;  
{%< IPv6 T_AAAA  }
  NS_IN6ADDRSZ = 16;  
{%< Flag bits indicating name compression.  }
  NS_CMPRSFLGS = $c0;  
{%< For both TCP and UDP.  }
  NS_DEFAULTPORT = 53;  
{
 * These can be expanded with synonyms, just keep ns_parse.c:ns_parserecord()
 * in synch with it.
  }
{%< Query: Question.  }
{%< Update: Zone.  }
{%< Query: Answer.  }
{%< Update: Prerequisites.  }
{%< Query: Name servers.  }
{%< Update: Update.  }
{%< Query|Update: Additional records.  }
type
  P_ns_sect = ^T_ns_sect;
  T_ns_sect =  Longint;
  Const
    ns_s_qd = 0;
    ns_s_zn = 0;
    ns_s_an = 1;
    ns_s_pr = 1;
    ns_s_ns = 2;
    ns_s_ud = 2;
    ns_s_ar = 3;
    ns_s_max = 4;
;
  Tns_sect = T_ns_sect;
  Pns_sect = ^Tns_sect;
{%
 * This is a message handle.  It is caller allocated and has no dynamic data.
 * This structure is intended to be opaque to all but ns_parse.c, thus the
 * leading _'s on the member names.  Use the accessor functions, not the _'s.
  }
type
  P_ns_msg = ^T_ns_msg;
  T_ns_msg = record
      _msg : Pbyte;
      _eom : Pbyte;
      _id : Tuint16_t;
      _flags : Tuint16_t;
      _counts : array[0..(ns_s_max)-1] of Tuint16_t;
      _sections : array[0..(ns_s_max)-1] of Pbyte;
      _sect : Tns_sect;
      _rrnum : longint;
      _msg_ptr : Pbyte;
    end;
  Tns_msg = T_ns_msg;
  Pns_msg = ^Tns_msg;
{ Private data structure - do not use from outside library.  }
  Pns_flagdata = ^Tns_flagdata;
  Tns_flagdata = record
      mask : longint;
      shift : longint;
    end;

  var
    _ns_flagdata : Pns_flagdata;cvar;external libc;
{ Accessor macros - this is part of the public interface.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ns_msg_id(handle : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_msg_base(handle : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_msg_end(handle : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_msg_size(handle : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_msg_count(handle,section : longint) : longint;

{%
 * This is a parsed record.  It is caller allocated and has no dynamic data.
  }
type
  P_ns_rr = ^T_ns_rr;
  T_ns_rr = record
      name : array[0..(NS_MAXDNAME)-1] of char;
      _type : Tuint16_t;
      rr_class : Tuint16_t;
      ttl : Tuint32_t;
      rdlength : Tuint16_t;
      rdata : Pbyte;
    end;
  Tns_rr = T_ns_rr;
  Pns_rr = ^Tns_rr;
{ Accessor macros - this is part of the public interface.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ns_rr_name(rr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ns_rr_type(rr : longint) : Tns_type;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ns_rr_class(rr : longint) : Tns_class;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_rr_ttl(rr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_rr_rdlen(rr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_rr_rdata(rr : longint) : longint;

{%
 * These don't have to be in the same order as in the packet flags word,
 * and they can even overlap in some cases, but they will need to be kept
 * in synch with ns_parse.c:ns_flagdata[].
  }
{%< Question/Response.  }
{%< Operation code.  }
{%< Authoritative Answer.  }
{%< Truncation occurred.  }
{%< Recursion Desired.  }
{%< Recursion Available.  }
{%< MBZ.  }
{%< Authentic Data (DNSSEC).  }
{%< Checking Disabled (DNSSEC).  }
{%< Response code.  }
type
  P_ns_flag = ^T_ns_flag;
  T_ns_flag =  Longint;
  Const
    ns_f_qr = 0;
    ns_f_opcode = 1;
    ns_f_aa = 2;
    ns_f_tc = 3;
    ns_f_rd = 4;
    ns_f_ra = 5;
    ns_f_z = 6;
    ns_f_ad = 7;
    ns_f_cd = 8;
    ns_f_rcode = 9;
    ns_f_max = 10;
;
  Tns_flag = T_ns_flag;
  Pns_flag = ^Tns_flag;
{%
 * Currently defined opcodes.
  }
{%< Standard query.  }
{%< Inverse query (deprecated/unsupported).  }
{%< Name server status query (unsupported).  }
{ Opcode 3 is undefined/reserved.  }
{%< Zone change notification.  }
{%< Zone update message.  }
type
  P_ns_opcode = ^T_ns_opcode;
  T_ns_opcode =  Longint;
  Const
    ns_o_query = 0;
    ns_o_iquery = 1;
    ns_o_status = 2;
    ns_o_notify = 4;
    ns_o_update = 5;
    ns_o_max = 6;
;
  Tns_opcode = T_ns_opcode;
  Pns_opcode = ^Tns_opcode;
{%
 * Currently defined response codes.
  }
{%< No error occurred.  }
{%< Format error.  }
{%< Server failure.  }
{%< Name error.  }
{%< Unimplemented.  }
{%< Operation refused.  }
{ these are for BIND_UPDATE  }
{%< Name exists  }
{%< RRset exists  }
{%< RRset does not exist  }
{%< Not authoritative for zone  }
{%< Zone of record different from zone section  }
{ The following are EDNS extended rcodes  }
{ The following are TSIG errors  }
type
  P_ns_rcode = ^T_ns_rcode;
  T_ns_rcode =  Longint;
  Const
    ns_r_noerror = 0;
    ns_r_formerr = 1;
    ns_r_servfail = 2;
    ns_r_nxdomain = 3;
    ns_r_notimpl = 4;
    ns_r_refused = 5;
    ns_r_yxdomain = 6;
    ns_r_yxrrset = 7;
    ns_r_nxrrset = 8;
    ns_r_notauth = 9;
    ns_r_notzone = 10;
    ns_r_max = 11;
    ns_r_badvers = 16;
    ns_r_badsig = 16;
    ns_r_badkey = 17;
    ns_r_badtime = 18;
;
  Tns_rcode = T_ns_rcode;
  Pns_rcode = ^Tns_rcode;
{ BIND_UPDATE  }
type
  P_ns_update_operation = ^T_ns_update_operation;
  T_ns_update_operation =  Longint;
  Const
    ns_uop_delete = 0;
    ns_uop_add = 1;
    ns_uop_max = 2;
;
  Tns_update_operation = T_ns_update_operation;
  Pns_update_operation = ^Tns_update_operation;
{%
 * This structure is used for TSIG authenticated messages
  }
type
  Pns_tsig_key = ^Tns_tsig_key;
  Tns_tsig_key = record
      name : array[0..(NS_MAXDNAME)-1] of char;
      alg : array[0..(NS_MAXDNAME)-1] of char;
      data : Pbyte;
      len : longint;
    end;

{%
 * This structure is used for TSIG authenticated TCP messages
  }
  Pns_tcp_tsig_state = ^Tns_tcp_tsig_state;
  Tns_tcp_tsig_state = record
      counter : longint;
      key : Pdst_key;
      ctx : pointer;
      sig : array[0..(NS_PACKETSZ)-1] of byte;
      siglen : longint;
    end;


const
  NS_TSIG_FUDGE = 300;  
  NS_TSIG_TCP_COUNT = 100;  
  NS_TSIG_ALG_HMAC_MD5 = 'HMAC-MD5.SIG-ALG.REG.INT';  
  NS_TSIG_ERROR_NO_TSIG = -(10);  
  NS_TSIG_ERROR_NO_SPACE = -(11);  
  NS_TSIG_ERROR_FORMERR = -(12);  
{%
 * Currently defined type values for resources and queries.
  }
type
  P_ns_type = ^T_ns_type;
  T_ns_type =  Longint;
  Const
    ns_t_invalid = 0;
    ns_t_a = 1;
    ns_t_ns = 2;
    ns_t_md = 3;
    ns_t_mf = 4;
    ns_t_cname = 5;
    ns_t_soa = 6;
    ns_t_mb = 7;
    ns_t_mg = 8;
    ns_t_mr = 9;
    ns_t_null = 10;
    ns_t_wks = 11;
    ns_t_ptr = 12;
    ns_t_hinfo = 13;
    ns_t_minfo = 14;
    ns_t_mx = 15;
    ns_t_txt = 16;
    ns_t_rp = 17;
    ns_t_afsdb = 18;
    ns_t_x25 = 19;
    ns_t_isdn = 20;
    ns_t_rt = 21;
    ns_t_nsap = 22;
    ns_t_nsap_ptr = 23;
    ns_t_sig = 24;
    ns_t_key = 25;
    ns_t_px = 26;
    ns_t_gpos = 27;
    ns_t_aaaa = 28;
    ns_t_loc = 29;
    ns_t_nxt = 30;
    ns_t_eid = 31;
    ns_t_nimloc = 32;
    ns_t_srv = 33;
    ns_t_atma = 34;
    ns_t_naptr = 35;
    ns_t_kx = 36;
    ns_t_cert = 37;
    ns_t_a6 = 38;
    ns_t_dname = 39;
    ns_t_sink = 40;
    ns_t_opt = 41;
    ns_t_apl = 42;
    ns_t_ds = 43;
    ns_t_sshfp = 44;
    ns_t_ipseckey = 45;
    ns_t_rrsig = 46;
    ns_t_nsec = 47;
    ns_t_dnskey = 48;
    ns_t_dhcid = 49;
    ns_t_nsec3 = 50;
    ns_t_nsec3param = 51;
    ns_t_tlsa = 52;
    ns_t_smimea = 53;
    ns_t_hip = 55;
    ns_t_ninfo = 56;
    ns_t_rkey = 57;
    ns_t_talink = 58;
    ns_t_cds = 59;
    ns_t_cdnskey = 60;
    ns_t_openpgpkey = 61;
    ns_t_csync = 62;
    ns_t_spf = 99;
    ns_t_uinfo = 100;
    ns_t_uid = 101;
    ns_t_gid = 102;
    ns_t_unspec = 103;
    ns_t_nid = 104;
    ns_t_l32 = 105;
    ns_t_l64 = 106;
    ns_t_lp = 107;
    ns_t_eui48 = 108;
    ns_t_eui64 = 109;
    ns_t_tkey = 249;
    ns_t_tsig = 250;
    ns_t_ixfr = 251;
    ns_t_axfr = 252;
    ns_t_mailb = 253;
    ns_t_maila = 254;
    ns_t_any = 255;
    ns_t_uri = 256;
    ns_t_caa = 257;
    ns_t_avc = 258;
    ns_t_ta = 32768;
    ns_t_dlv = 32769;
    ns_t_max = 65536;
;
  Tns_type = T_ns_type;
  Pns_type = ^Tns_type;
{%
 * Values for class field
  }
{%< Cookie.  }
{%< Internet.  }
{%< unallocated/unsupported.  }
{%< MIT Chaos-net.  }
{%< MIT Hesiod.  }
{ Query class values which do not appear in resource records  }
{%< for prereq. sections in update requests  }
{%< Wildcard match.  }
type
  P_ns_class = ^T_ns_class;
  T_ns_class =  Longint;
  Const
    ns_c_invalid = 0;
    ns_c_in = 1;
    ns_c_2 = 2;
    ns_c_chaos = 3;
    ns_c_hs = 4;
    ns_c_none = 254;
    ns_c_any = 255;
    ns_c_max = 65536;
;
  Tns_class = T_ns_class;
  Pns_class = ^Tns_class;
{ Certificate type values in CERT resource records.   }
{%< PKIX (X.509v3)  }
{%< SPKI  }
{%< PGP  }
{%< URL private type  }
{%< OID private type  }
type
  P_ns_cert_types = ^T_ns_cert_types;
  T_ns_cert_types =  Longint;
  Const
    cert_t_pkix = 1;
    cert_t_spki = 2;
    cert_t_pgp = 3;
    cert_t_url = 253;
    cert_t_oid = 254;
;
  Tns_cert_types = T_ns_cert_types;
  Pns_cert_types = ^Tns_cert_types;
{%
 * EDNS0 extended flags and option codes, host order.
  }
  NS_OPT_DNSSEC_OK = $8000;  
  NS_OPT_NSID = 3;  
{%
 * Inline versions of get/put short/long.  Pointer is advanced.
  }
{ xxxxxxxxxxxxxx
#define NS_GET16(s, cp) do  \
	const unsigned char *t_cp = (const unsigned char *)(cp); \
	(s) = ((uint16_t)t_cp[0] << 8) \
	    | ((uint16_t)t_cp[1]) \
	    ; \
	(cp) += NS_INT16SZ; \
 while (0)

#define NS_GET32(l, cp) do  \
	const unsigned char *t_cp = (const unsigned char *)(cp); \
	(l) = ((uint32_t)t_cp[0] << 24) \
	    | ((uint32_t)t_cp[1] << 16) \
	    | ((uint32_t)t_cp[2] << 8) \
	    | ((uint32_t)t_cp[3]) \
	    ; \
	(cp) += NS_INT32SZ; \
 while (0)

#define NS_PUT16(s, cp) do  \
	uint16_t t_s = (uint16_t)(s); \
	unsigned char *t_cp = (unsigned char *)(cp); \
	*t_cp++ = t_s >> 8; \
	*t_cp   = t_s; \
	(cp) += NS_INT16SZ; \
 while (0)

#define NS_PUT32(l, cp) do  \
	uint32_t t_l = (uint32_t)(l); \
	unsigned char *t_cp = (unsigned char *)(cp); \
	*t_cp++ = t_l >> 24; \
	*t_cp++ = t_l >> 16; \
	*t_cp++ = t_l >> 8; \
	*t_cp   = t_l; \
	(cp) += NS_INT32SZ; \
 while (0)
 }

function ns_msg_getflag(para1:Tns_msg; para2:longint):longint;cdecl;external libc;
function ns_get16(para1:Pbyte):dword;cdecl;external libc;
function ns_get32(para1:Pbyte):dword;cdecl;external libc;
procedure ns_put16(para1:dword; para2:Pbyte);cdecl;external libc;
procedure ns_put32(para1:dword; para2:Pbyte);cdecl;external libc;
function ns_initparse(para1:Pbyte; para2:longint; para3:Pns_msg):longint;cdecl;external libc;
function ns_skiprr(para1:Pbyte; para2:Pbyte; para3:Tns_sect; para4:longint):longint;cdecl;external libc;
function ns_parserr(para1:Pns_msg; para2:Tns_sect; para3:longint; para4:Pns_rr):longint;cdecl;external libc;
function ns_sprintrr(para1:Pns_msg; para2:Pns_rr; para3:Pchar; para4:Pchar; para5:Pchar; 
           para6:Tsize_t):longint;cdecl;external libc;
{   __NAMESER_DEPRECATED; }
function ns_sprintrrf(para1:Pbyte; para2:Tsize_t; para3:Pchar; para4:Tns_class; para5:Tns_type; 
           para6:dword; para7:Pbyte; para8:Tsize_t; para9:Pchar; para10:Pchar; 
           para11:Pchar; para12:Tsize_t):longint;cdecl;external libc;
{   __NAMESER_DEPRECATED; }
function ns_format_ttl(para1:dword; para2:Pchar; para3:Tsize_t):longint;cdecl;external libc;
{/   __NAMESER_DEPRECATED; }
function ns_parse_ttl(para1:Pchar; para2:Pdword):longint;cdecl;external libc;
{   __NAMESER_DEPRECATED; }
function ns_datetosecs(para1:Pchar; para2:Plongint):Tuint32_t;cdecl;external libc;
{   __NAMESER_DEPRECATED; }
function ns_name_ntol(para1:Pbyte; para2:Pbyte; para3:Tsize_t):longint;cdecl;external libc;
function ns_name_ntop(para1:Pbyte; para2:Pchar; para3:Tsize_t):longint;cdecl;external libc;
function ns_name_pton(para1:Pchar; para2:Pbyte; para3:Tsize_t):longint;cdecl;external libc;
function ns_name_unpack(para1:Pbyte; para2:Pbyte; para3:Pbyte; para4:Pbyte; para5:Tsize_t):longint;cdecl;external libc;
function ns_name_pack(para1:Pbyte; para2:Pbyte; para3:longint; para4:PPbyte; para5:PPbyte):longint;cdecl;external libc;
function ns_name_uncompress(para1:Pbyte; para2:Pbyte; para3:Pbyte; para4:Pchar; para5:Tsize_t):longint;cdecl;external libc;
function ns_name_compress(para1:Pchar; para2:Pbyte; para3:Tsize_t; para4:PPbyte; para5:PPbyte):longint;cdecl;external libc;
function ns_name_skip(para1:PPbyte; para2:Pbyte):longint;cdecl;external libc;
procedure ns_name_rollback(para1:Pbyte; para2:PPbyte; para3:PPbyte);cdecl;external libc;
function ns_samedomain(para1:Pchar; para2:Pchar):longint;cdecl;external libc;
{  __NAMESER_DEPRECATED; }
function ns_subdomain(para1:Pchar; para2:Pchar):longint;cdecl;external libc;
{  __NAMESER_DEPRECATED; }
function ns_makecanon(para1:Pchar; para2:Pchar; para3:Tsize_t):longint;cdecl;external libc;
{  __NAMESER_DEPRECATED; }
function ns_samename(para1:Pchar; para2:Pchar):longint;cdecl;external libc;
{  __NAMESER_DEPRECATED; }
{$include <arpa/nameser_compat.h>}
{$endif}
{ !_ARPA_NAMESER_H_  }
{! \file  }

// === Konventiert am: 13-8-25 19:42:52 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_msg_id(handle : longint) : longint;
begin
  ns_msg_id:=(handle._id)+0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_msg_base(handle : longint) : longint;
begin
  ns_msg_base:=(handle._msg)+0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_msg_end(handle : longint) : longint;
begin
  ns_msg_end:=(handle._eom)+0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_msg_size(handle : longint) : longint;
begin
  ns_msg_size:=(handle._eom)-(handle._msg);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_msg_count(handle,section : longint) : longint;
begin
  ns_msg_count:=(handle.(_counts[section]))+0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_rr_name(rr : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if (rr.(name[0]))<>'\0' then
    if_local1:=rr.name
  else
    if_local1:='.';
  ns_rr_name:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ns_rr_type(rr : longint) : Tns_type;
begin
  ns_rr_type:=Tns_type((rr._type)+0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function ns_rr_class(rr : longint) : Tns_class;
begin
  ns_rr_class:=Tns_class((rr.rr_class)+0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_rr_ttl(rr : longint) : longint;
begin
  ns_rr_ttl:=(rr.ttl)+0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_rr_rdlen(rr : longint) : longint;
begin
  ns_rr_rdlen:=(rr.rdlength)+0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ns_rr_rdata(rr : longint) : longint;
begin
  ns_rr_rdata:=(rr.rdata)+0;
end;


end.
