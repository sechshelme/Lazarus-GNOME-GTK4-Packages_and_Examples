
unit namedb;
interface

{
  Automatically converted by H2Pas 1.0.0 from namedb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    namedb.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Paddrinfo  = ^addrinfo;
Pbpf_u_int32  = ^bpf_u_int32;
Pchar  = ^char;
PFILE  = ^FILE;
Plongint  = ^longint;
Ppcap_etherent  = ^pcap_etherent;
Pu_char  = ^u_char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 1994, 1996
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
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by the Computer Systems
 *	Engineering Group at Lawrence Berkeley Laboratory.
 * 4. Neither the name of the University nor of the Laboratory may be used
 *    to endorse or promote products derived from this software without
 *    specific prior written permission.
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
{$ifndef lib_pcap_namedb_h}
{$define lib_pcap_namedb_h}
{ C++ extern C conditionnal removed }
{
 * As returned by the pcap_next_etherent()
 * XXX this stuff doesn't belong in this interface, but this
 * library already must do name to address translation, so
 * on systems that don't have support for /etc/ethers, we
 * export these hooks since they're already being used by
 * some applications (such as tcpdump) and already being
 * marked as exported in some OSes offering libpcap (such
 * as Debian).
  }
type
  Ppcap_etherent = ^Tpcap_etherent;
  Tpcap_etherent = record
      addr : array[0..5] of Tu_char;
      name : array[0..121] of char;
    end;

{$ifndef PCAP_ETHERS_FILE}

const
  PCAP_ETHERS_FILE = '/etc/ethers';  
{$endif}

function pcap_next_etherent(para1:PFILE):Ppcap_etherent;cdecl;external;
(* Const before type ignored *)
function pcap_ether_hostton(para1:Pchar):Pu_char;cdecl;external;
(* Const before type ignored *)
function pcap_ether_aton(para1:Pchar):Pu_char;cdecl;external;
{ PCAP_DEPRECATED("this is not reentrant; use 'pcap_nametoaddrinfo' instead") }
(* Const before type ignored *)
function pcap_nametoaddr(para1:Pchar):^Pbpf_u_int32;cdecl;external;
(* Const before type ignored *)
function pcap_nametoaddrinfo(para1:Pchar):Paddrinfo;cdecl;external;
(* Const before type ignored *)
function pcap_nametonetaddr(para1:Pchar):Tbpf_u_int32;cdecl;external;
(* Const before type ignored *)
function pcap_nametoport(para1:Pchar; para2:Plongint; para3:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function pcap_nametoportrange(para1:Pchar; para2:Plongint; para3:Plongint; para4:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function pcap_nametoproto(para1:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function pcap_nametoeproto(para1:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function pcap_nametollc(para1:Pchar):longint;cdecl;external;
{
 * If a protocol is unknown, PROTO_UNDEF is returned.
 * Also, pcap_nametoport() returns the protocol along with the port number.
 * If there are ambiguous entried in /etc/services (i.e. domain
 * can be either tcp or udp) PROTO_UNDEF is returned.
  }
const
  PROTO_UNDEF = -(1);  
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
