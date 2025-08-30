
unit bpf;
interface

{
  Automatically converted by H2Pas 1.0.0 from bpf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bpf.h
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
Pbpf_insn  = ^bpf_insn;
Pbpf_int32  = ^bpf_int32;
Pbpf_program  = ^bpf_program;
Pbpf_u_int32  = ^bpf_u_int32;
Pchar  = ^char;
Pu_char  = ^u_char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{-
 * Copyright (c) 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997
 *	The Regents of the University of California.  All rights reserved.
 *
 * This code is derived from the Stanford/CMU enet packet filter,
 * (net/enet.c) distributed as part of 4.3BSD, and code contributed
 * to Berkeley by Steven McCanne and Van Jacobson both of Lawrence
 * Berkeley Laboratory.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the University nor the names of its contributors
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
 *      @(#)bpf.h       7.1 (Berkeley) 5/7/91
  }
{
 * This is libpcap's cut-down version of bpf.h; it includes only
 * the stuff needed for the code generator and the userland BPF
 * interpreter, and the libpcap APIs for setting filters, etc..
 *
 * "pcap-bpf.c" will include the native OS version, as it deals with
 * the OS's BPF implementation.
 *
 * At least two programs found by Google Code Search explicitly includes
 * <pcap/bpf.h> (even though <pcap.h>/<pcap/pcap.h> includes it for you),
 * so moving that stuff to <pcap/pcap.h> would break the build for some
 * programs.
  }
{
 * If we've already included <net/bpf.h>, don't re-define this stuff.
 * We assume BSD-style multiple-include protection in <net/bpf.h>,
 * which is true of all but the oldest versions of FreeBSD and NetBSD,
 * or Tru64 UNIX-style multiple-include protection (or, at least,
 * Tru64 UNIX 5.x-style; I don't have earlier versions available to check),
 * or AIX-style multiple-include protection (or, at least, AIX 5.x-style;
 * I don't have earlier versions available to check), or QNX-style
 * multiple-include protection (as per GitHub pull request #394).
 *
 * We trust that they will define structures and macros and types in
 * a fashion that's source-compatible and binary-compatible with our
 * definitions.
 *
 * We do not check for BPF_MAJOR_VERSION, as that's defined by
 * <linux/filter.h>, which is directly or indirectly included in some
 * programs that also include pcap.h, and <linux/filter.h> doesn't
 * define stuff we need.  We *do* protect against <linux/filter.h>
 * defining various macros for BPF code itself; <linux/filter.h> says
 *
 *	Try and keep these values and structures similar to BSD, especially
 *	the BPF code definitions which need to match so you can share filters
 *
 * so we trust that it will define them in a fashion that's source-compatible
 * and binary-compatible with our definitions.
 *
 * This also provides our own multiple-include protection.
  }
{$if !defined(_NET_BPF_H_) && !defined(_NET_BPF_H_INCLUDED) && !defined(_BPF_H_) && !defined(_H_BPF) && !defined(lib_pcap_bpf_h)}
{$define lib_pcap_bpf_h}
{$include <pcap/funcattrs.h>}
{$include <pcap/dlt.h>}
{ C++ extern C conditionnal removed }
{ BSD style release date  }

const
  BPF_RELEASE = 199606;  
{$ifdef MSDOS /* must be 32-bit */}
type
  Pbpf_int32 = ^Tbpf_int32;
  Tbpf_int32 = longint;

  Pbpf_u_int32 = ^Tbpf_u_int32;
  Tbpf_u_int32 = dword;
{$else}
type
  Pbpf_int32 = ^Tbpf_int32;
  Tbpf_int32 = longint;

  Pbpf_u_int32 = ^Tbpf_u_int32;
  Tbpf_u_int32 = Tu_int;
{$endif}
{
 * Alignment macros.  BPF_WORDALIGN rounds up to the next
 * even multiple of BPF_ALIGNMENT.
 *
 * Tcpdump's print-pflog.c uses this, so we define it here.
  }
{$ifndef __NetBSD__}

{ was #define dname def_expr }
function BPF_ALIGNMENT : longint; { return type might be wrong }

{$else}

{ was #define dname def_expr }
function BPF_ALIGNMENT : longint; { return type might be wrong }

{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function BPF_WORDALIGN(x : longint) : longint;

{
 * Structure for "pcap_compile()", "pcap_setfilter()", etc..
  }
type
  Pbpf_program = ^Tbpf_program;
  Tbpf_program = record
      bf_len : Tu_int;
      bf_insns : Pbpf_insn;
    end;

{
 * The instruction encodings.
 *
 * Please inform tcpdump-workers@lists.tcpdump.org if you use any
 * of the reserved values, so that we can note that they're used
 * (and perhaps implement it in the reference BPF implementation
 * and encourage its implementation elsewhere).
  }
{
 * The upper 8 bits of the opcode aren't used. BSD/OS used 0x8000.
  }
{ instruction classes  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function BPF_CLASS(code : longint) : Tcode;

const
  BPF_LD = $00;  
  BPF_LDX = $01;  
  BPF_ST = $02;  
  BPF_STX = $03;  
  BPF_ALU = $04;  
  BPF_JMP = $05;  
  BPF_RET = $06;  
  BPF_MISC = $07;  
{ ld/ldx fields  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function BPF_SIZE(code : longint) : Tcode;

const
  BPF_W = $00;  
  BPF_H = $08;  
  BPF_B = $10;  
{				0x18	reserved; used by BSD/OS  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function BPF_MODE(code : longint) : Tcode;

const
  BPF_IMM = $00;  
  BPF_ABS = $20;  
  BPF_IND = $40;  
  BPF_MEM = $60;  
  BPF_LEN = $80;  
  BPF_MSH = $a0;  
{				0xc0	reserved; used by BSD/OS  }
{				0xe0	reserved; used by BSD/OS  }
{ alu/jmp fields  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function BPF_OP(code : longint) : Tcode;

const
  BPF_ADD = $00;  
  BPF_SUB = $10;  
  BPF_MUL = $20;  
  BPF_DIV = $30;  
  BPF_OR = $40;  
  BPF_AND = $50;  
  BPF_LSH = $60;  
  BPF_RSH = $70;  
  BPF_NEG = $80;  
  BPF_MOD = $90;  
  BPF_XOR = $a0;  
{				0xb0	reserved  }
{				0xc0	reserved  }
{				0xd0	reserved  }
{				0xe0	reserved  }
{				0xf0	reserved  }
  BPF_JA = $00;  
  BPF_JEQ = $10;  
  BPF_JGT = $20;  
  BPF_JGE = $30;  
  BPF_JSET = $40;  
{				0x50	reserved; used on BSD/OS  }
{				0x60	reserved  }
{				0x70	reserved  }
{				0x80	reserved  }
{				0x90	reserved  }
{				0xa0	reserved  }
{				0xb0	reserved  }
{				0xc0	reserved  }
{				0xd0	reserved  }
{				0xe0	reserved  }
{				0xf0	reserved  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function BPF_SRC(code : longint) : Tcode;

const
  BPF_K = $00;  
  BPF_X = $08;  
{ ret - BPF_K and BPF_X also apply  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function BPF_RVAL(code : longint) : Tcode;

const
  BPF_A = $10;  
{				0x18	reserved  }
{ misc  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function BPF_MISCOP(code : longint) : Tcode;

const
  BPF_TAX = $00;  
{				0x08	reserved  }
{				0x10	reserved  }
{				0x18	reserved  }
{ #define	BPF_COP		0x20	NetBSD "coprocessor" extensions  }
{				0x28	reserved  }
{				0x30	reserved  }
{				0x38	reserved  }
{ #define	BPF_COPX	0x40	NetBSD "coprocessor" extensions  }
{					also used on BSD/OS  }
{				0x48	reserved  }
{				0x50	reserved  }
{				0x58	reserved  }
{				0x60	reserved  }
{				0x68	reserved  }
{				0x70	reserved  }
{				0x78	reserved  }
  BPF_TXA = $80;  
{				0x88	reserved  }
{				0x90	reserved  }
{				0x98	reserved  }
{				0xa0	reserved  }
{				0xa8	reserved  }
{				0xb0	reserved  }
{				0xb8	reserved  }
{				0xc0	reserved; used on BSD/OS  }
{				0xc8	reserved  }
{				0xd0	reserved  }
{				0xd8	reserved  }
{				0xe0	reserved  }
{				0xe8	reserved  }
{				0xf0	reserved  }
{				0xf8	reserved  }
{
 * The instruction data structure.
  }
type
  Pbpf_insn = ^Tbpf_insn;
  Tbpf_insn = record
      code : Tu_short;
      jt : Tu_char;
      jf : Tu_char;
      k : Tbpf_u_int32;
    end;

{
 * Macros for insn array initializers.
 *
 * In case somebody's included <linux/filter.h>, or something else that
 * gives the kernel's definitions of BPF statements, get rid of its
 * definitions, so we can supply ours instead.  If some kernel's
 * definitions aren't *binary-compatible* with what BPF has had
 * since it first sprung from the brows of Van Jacobson and Steve
 * McCanne, that kernel should be fixed.
  }
(* Const before type ignored *)
(* Const before type ignored *)

function bpf_filter(para1:Pbpf_insn; para2:Pu_char; para3:Tu_int; para4:Tu_int):Tu_int;cdecl;external;
(* Const before type ignored *)
function bpf_validate(f:Pbpf_insn; len:longint):longint;cdecl;external;
(* Const before type ignored *)
function bpf_image(para1:Pbpf_insn; para2:longint):Pchar;cdecl;external;
(* Const before type ignored *)
procedure bpf_dump(para1:Pbpf_program; para2:longint);cdecl;external;
{
 * Number of scratch memory words (for BPF_LD|BPF_MEM and BPF_ST).
  }
const
  BPF_MEMWORDS = 16;  
{ C++ end of extern C conditionnal removed }
{$endif}
{ !defined(_NET_BPF_H_) && !defined(_BPF_H_) && !defined(_H_BPF) && !defined(lib_pcap_bpf_h)  }

implementation

{ was #define dname def_expr }
function BPF_ALIGNMENT : longint; { return type might be wrong }
  begin
    BPF_ALIGNMENT:=sizeof(bpf_int32);
  end;

{ was #define dname def_expr }
function BPF_ALIGNMENT : longint; { return type might be wrong }
  begin
    BPF_ALIGNMENT:=sizeof(longint);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BPF_WORDALIGN(x : longint) : longint;
begin
  BPF_WORDALIGN:=(Tx(+(BPF_ALIGNMENT-1))) and ( not (BPF_ALIGNMENT-1));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function BPF_CLASS(code : longint) : Tcode;
begin
  BPF_CLASS:=Tcode(@($07));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function BPF_SIZE(code : longint) : Tcode;
begin
  BPF_SIZE:=Tcode(@($18));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function BPF_MODE(code : longint) : Tcode;
begin
  BPF_MODE:=Tcode(@($e0));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function BPF_OP(code : longint) : Tcode;
begin
  BPF_OP:=Tcode(@($f0));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function BPF_SRC(code : longint) : Tcode;
begin
  BPF_SRC:=Tcode(@($08));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function BPF_RVAL(code : longint) : Tcode;
begin
  BPF_RVAL:=Tcode(@($18));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function BPF_MISCOP(code : longint) : Tcode;
begin
  BPF_MISCOP:=Tcode(@($f8));
end;


end.
