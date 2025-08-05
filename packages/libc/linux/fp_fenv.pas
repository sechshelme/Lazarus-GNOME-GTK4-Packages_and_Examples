unit fp_fenv;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // /usr/include/x86_64-linux-gnu/bits/fenv.h

const
  FE_INVALID = $1;
  FE_DENORM = $2;
  FE_DIVBYZERO = $4;
  FE_OVERFLOW = $8;
  FE_UNDERFLOW = $10;
  FE_INEXACT = $20;

const
  FE_ALL_EXCEPT = FE_INEXACT or FE_DIVBYZERO or FE_UNDERFLOW or FE_OVERFLOW or FE_INVALID;

const
  FE_TONEAREST = $0;
  FE_DOWNWARD = $400;
  FE_UPWARD = $800;
  FE_TOWARDZERO = $C00;

type
  Pfexcept_t = ^Tfexcept_t;
  Tfexcept_t = word;

type
  Tfenv_t = bitpacked record
    __control_word: word;
    __glibc_reserved1: word;
    __status_word: word;
    __glibc_reserved2: word;
    __tags: word;
    __glibc_reserved3: word;
    __eip: dword;
    __cs_selector: word;
    __opcode: 0..2047;
    __glibc_reserved4: 0..31;
    __data_offset: dword;
    __data_selector: word;
    __glibc_reserved5: word;
    __mxcsr: dword;
  end;
  Pfenv_t = ^Tfenv_t;

const
  FE_DFL_ENV = Pfenv_t(-(1));
  FE_NOMASK_ENV = Pfenv_t(-(2));

type
  Tfemode_t = record
    __control_word: word;
    __glibc_reserved: word;
    __mxcsr: dword;
  end;
  Pfemode_t = ^Tfemode_t;

const
  FE_DFL_MODE = Pfemode_t(-(1));


  // /usr/include/fenv.h

function feclearexcept(__excepts: longint): longint; cdecl; external libm;
function fegetexceptflag(__flagp: Pfexcept_t; __excepts: longint): longint; cdecl; external libm;
function feraiseexcept(__excepts: longint): longint; cdecl; external libm;
function fesetexcept(__excepts: longint): longint; cdecl; external libm;
function fesetexceptflag(__flagp: Pfexcept_t; __excepts: longint): longint; cdecl; external libm;
function fetestexcept(__excepts: longint): longint; cdecl; external libm;
function fetestexceptflag(__flagp: Pfexcept_t; __excepts: longint): longint; cdecl; external libm;
function fegetround: longint; cdecl; external libm;
function fesetround(__rounding_direction: longint): longint; cdecl; external libm;
function fegetenv(__envp: Pfenv_t): longint; cdecl; external libm;
function feholdexcept(__envp: Pfenv_t): longint; cdecl; external libm;
function fesetenv(__envp: Pfenv_t): longint; cdecl; external libm;
function feupdateenv(__envp: Pfenv_t): longint; cdecl; external libm;
function fegetmode(__modep: Pfemode_t): longint; cdecl; external libm;
function fesetmode(__modep: Pfemode_t): longint; cdecl; external libm;
function feenableexcept(__excepts: longint): longint; cdecl; external libm;
function fedisableexcept(__excepts: longint): longint; cdecl; external libm;
function fegetexcept: longint; cdecl; external libm;

// === Konventiert am: 5-8-25 17:32:36 ===


implementation


end.
