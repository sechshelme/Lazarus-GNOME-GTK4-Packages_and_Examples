
unit link;
interface

{
  Automatically converted by H2Pas 1.0.0 from link.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    link.h
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
Pchar  = ^char;
Pdword  = ^dword;
PElf32_Sym  = ^Elf32_Sym;
PElf64_Sym  = ^Elf64_Sym;
PLa_i86_regs  = ^La_i86_regs;
PLa_i86_retval  = ^La_i86_retval;
PLa_x32_regs  = ^La_x32_regs;
PLa_x32_retval  = ^La_x32_retval;
PLa_x86_64_regs  = ^La_x86_64_regs;
PLa_x86_64_retval  = ^La_x86_64_retval;
PLa_x86_64_vector  = ^La_x86_64_vector;
PLa_x86_64_xmm  = ^La_x86_64_xmm;
PLa_x86_64_ymm  = ^La_x86_64_ymm;
PLa_x86_64_zmm  = ^La_x86_64_zmm;
Plongint  = ^longint;
Puintptr_t  = ^uintptr_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 2004-2024 Free Software Foundation, Inc.
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
{$ifndef	_LINK_H}
{$error "Never include <bits/link.h> directly; use <link.h> instead."}
{$endif}
{$ifndef __x86_64__}
{ Registers for entry into PLT on IA-32.   }
type
  PLa_i86_regs = ^TLa_i86_regs;
  TLa_i86_regs = record
      lr_edx : Tuint32_t;
      lr_ecx : Tuint32_t;
      lr_eax : Tuint32_t;
      lr_ebp : Tuint32_t;
      lr_esp : Tuint32_t;
    end;
{ Return values for calls from PLT on IA-32.   }

  PLa_i86_retval = ^TLa_i86_retval;
  TLa_i86_retval = record
      lrv_eax : Tuint32_t;
      lrv_edx : Tuint32_t;
      lrv_st0 : Tlong_double;
      lrv_st1 : Tlong_double;
      __glibc_unused1 : Tuint64_t;
      __glibc_unused2 : Tuint64_t;
    end;
(* Const before type ignored *)

function la_i86_gnu_pltenter(__sym:PElf32_Sym; __ndx:dword; __refcook:Puintptr_t; __defcook:Puintptr_t; __regs:PLa_i86_regs; 
           __flags:Pdword; __symname:Pchar; __framesizep:Plongint):TElf32_Addr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function la_i86_gnu_pltexit(__sym:PElf32_Sym; __ndx:dword; __refcook:Puintptr_t; __defcook:Puintptr_t; __inregs:PLa_i86_regs; 
           __outregs:PLa_i86_retval; symname:Pchar):dword;cdecl;external;
{$else}
{ Registers for entry into PLT on x86-64.   }
type
  PLa_x86_64_xmm = ^TLa_x86_64_xmm;
  TLa_x86_64_xmm = single;

  PLa_x86_64_ymm = ^TLa_x86_64_ymm;
  TLa_x86_64_ymm = single;

  PLa_x86_64_zmm = ^TLa_x86_64_zmm;
  TLa_x86_64_zmm = Tdouble;
{$if __GNUC_PREREQ (4,0)}
{$endif}
type
  PLa_x86_64_vector = ^TLa_x86_64_vector;
  TLa_x86_64_vector = record
      case longint of
        0 : ( ymm : array[0..1] of TLa_x86_64_ymm );
        1 : ( zmm : array[0..0] of TLa_x86_64_zmm );
        2 : ( xmm : array[0..3] of TLa_x86_64_xmm );
      end;
{$ifndef __ILP32__}
{$endif}
type
  PLa_x86_64_regs = ^TLa_x86_64_regs;
  TLa_x86_64_regs = record
      lr_rdx : Tuint64_t;
      lr_r8 : Tuint64_t;
      lr_r9 : Tuint64_t;
      lr_rcx : Tuint64_t;
      lr_rsi : Tuint64_t;
      lr_rdi : Tuint64_t;
      lr_rbp : Tuint64_t;
      lr_rsp : Tuint64_t;
      lr_xmm : array[0..7] of TLa_x86_64_xmm;
      lr_vector : array[0..7] of TLa_x86_64_vector;
      __glibc_unused1 : array[0..3] of Tint128_t;
    end;
{ Return values for calls from PLT on x86-64.   }
{$ifndef __ILP32__}
{$endif}
type
  PLa_x86_64_retval = ^TLa_x86_64_retval;
  TLa_x86_64_retval = record
      lrv_rax : Tuint64_t;
      lrv_rdx : Tuint64_t;
      lrv_xmm0 : TLa_x86_64_xmm;
      lrv_xmm1 : TLa_x86_64_xmm;
      lrv_st0 : Tlong_double;
      lrv_st1 : Tlong_double;
      lrv_vector0 : TLa_x86_64_vector;
      lrv_vector1 : TLa_x86_64_vector;
      __glibc_unused1 : Tint128_t;
      __glibc_unused2 : Tint128_t;
    end;

const
  La_x32_regs = La_x86_64_regs;  
  La_x32_retval = La_x86_64_retval;  
(* Const before type ignored *)

function la_x86_64_gnu_pltenter(__sym:PElf64_Sym; __ndx:dword; __refcook:Puintptr_t; __defcook:Puintptr_t; __regs:PLa_x86_64_regs; 
           __flags:Pdword; __symname:Pchar; __framesizep:Plongint):TElf64_Addr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function la_x86_64_gnu_pltexit(__sym:PElf64_Sym; __ndx:dword; __refcook:Puintptr_t; __defcook:Puintptr_t; __inregs:PLa_x86_64_regs; 
           __outregs:PLa_x86_64_retval; __symname:Pchar):dword;cdecl;external;
(* Const before type ignored *)
function la_x32_gnu_pltenter(__sym:PElf32_Sym; __ndx:dword; __refcook:Puintptr_t; __defcook:Puintptr_t; __regs:PLa_x32_regs; 
           __flags:Pdword; __symname:Pchar; __framesizep:Plongint):TElf32_Addr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function la_x32_gnu_pltexit(__sym:PElf32_Sym; __ndx:dword; __refcook:Puintptr_t; __defcook:Puintptr_t; __inregs:PLa_x32_regs; 
           __outregs:PLa_x32_retval; __symname:Pchar):dword;cdecl;external;
{$endif}

implementation


end.
