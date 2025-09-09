unit link_bits;

interface

uses
  clib, fp_elf64, elf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/x86_64-linux-gnu/bits/link.h

type
  TLa_i86_regs = record
    lr_edx: Tuint32_t;
    lr_ecx: Tuint32_t;
    lr_eax: Tuint32_t;
    lr_ebp: Tuint32_t;
    lr_esp: Tuint32_t;
  end;
  PLa_i86_regs = ^TLa_i86_regs;

  TLa_i86_retval = record
    lrv_eax: Tuint32_t;
    lrv_edx: Tuint32_t;
    lrv_st0: Tlong_double;
    lrv_st1: Tlong_double;
    __glibc_unused1: Tuint64_t;
    __glibc_unused2: Tuint64_t;
  end;
  PLa_i86_retval = ^TLa_i86_retval;

function la_i86_gnu_pltenter(__sym: PElf32_Sym; __ndx: dword; __refcook: Puintptr_t; __defcook: Puintptr_t; __regs: PLa_i86_regs;
  __flags: Pdword; __symname: pchar; __framesizep: Plongint): TElf32_Addr; cdecl; external libtcod;
function la_i86_gnu_pltexit(__sym: PElf32_Sym; __ndx: dword; __refcook: Puintptr_t; __defcook: Puintptr_t; __inregs: PLa_i86_regs;
  __outregs: PLa_i86_retval; symname: pchar): dword; cdecl; external libtcod;

type
  PLa_x86_64_xmm = ^TLa_x86_64_xmm;
  TLa_x86_64_xmm = single;

  PLa_x86_64_ymm = ^TLa_x86_64_ymm;
  TLa_x86_64_ymm = single;

  PLa_x86_64_zmm = ^TLa_x86_64_zmm;
  TLa_x86_64_zmm = double;

type
  TLa_x86_64_vector = record
    case longint of
      0: (ymm: array[0..1] of TLa_x86_64_ymm);
      1: (zmm: array[0..0] of TLa_x86_64_zmm);
      2: (xmm: array[0..3] of TLa_x86_64_xmm);
  end;
  PLa_x86_64_vector = ^TLa_x86_64_vector;

type
  TLa_x86_64_regs = record
    lr_rdx: Tuint64_t;
    lr_r8: Tuint64_t;
    lr_r9: Tuint64_t;
    lr_rcx: Tuint64_t;
    lr_rsi: Tuint64_t;
    lr_rdi: Tuint64_t;
    lr_rbp: Tuint64_t;
    lr_rsp: Tuint64_t;
    lr_xmm: array[0..7] of TLa_x86_64_xmm;
    lr_vector: array[0..7] of TLa_x86_64_vector;
    __glibc_unused1: array[0..3] of Tint128_t;
  end;
  PLa_x86_64_regs = ^TLa_x86_64_regs;

type
  TLa_x86_64_retval = record
    lrv_rax: Tuint64_t;
    lrv_rdx: Tuint64_t;
    lrv_xmm0: TLa_x86_64_xmm;
    lrv_xmm1: TLa_x86_64_xmm;
    lrv_st0: Tlong_double;
    lrv_st1: Tlong_double;
    lrv_vector0: TLa_x86_64_vector;
    lrv_vector1: TLa_x86_64_vector;
    __glibc_unused1: Tint128_t;
    __glibc_unused2: Tint128_t;
  end;
  PLa_x86_64_retval = ^TLa_x86_64_retval;

type
  TLa_x32_regs = TLa_x86_64_regs;
  PLa_x32_regs = ^TLa_x32_regs;
  TLa_x32_retval = TLa_x86_64_retval;
  PLa_x32_retval = ^TLa_x32_retval;

function la_x86_64_gnu_pltenter(__sym: PElf64_Sym; __ndx: dword; __refcook: Puintptr_t; __defcook: Puintptr_t; __regs: PLa_x86_64_regs;
  __flags: Pdword; __symname: pchar; __framesizep: Plongint): TElf64_Addr; cdecl; external libtcod;
function la_x86_64_gnu_pltexit(__sym: PElf64_Sym; __ndx: dword; __refcook: Puintptr_t; __defcook: Puintptr_t; __inregs: PLa_x86_64_regs;
  __outregs: PLa_x86_64_retval; __symname: pchar): dword; cdecl; external libtcod;
function la_x32_gnu_pltenter(__sym: PElf32_Sym; __ndx: dword; __refcook: Puintptr_t; __defcook: Puintptr_t; __regs: PLa_x32_regs;
  __flags: Pdword; __symname: pchar; __framesizep: Plongint): TElf32_Addr; cdecl; external libtcod;
function la_x32_gnu_pltexit(__sym: PElf32_Sym; __ndx: dword; __refcook: Puintptr_t; __defcook: Puintptr_t; __inregs: PLa_x32_regs;
  __outregs: PLa_x32_retval; __symname: pchar): dword; cdecl; external libtcod;

// === Konventiert am: 8-9-25 19:15:29 ===


implementation



end.
