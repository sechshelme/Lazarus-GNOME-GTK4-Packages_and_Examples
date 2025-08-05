unit fenv;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ xxxxxxxxxxxxxxxxxxx
enum
  
    FE_INVALID =
#define FE_INVALID	0x01
      FE_INVALID,
    __FE_DENORM = 0x02,
    FE_DIVBYZERO =
#define FE_DIVBYZERO	0x04
      FE_DIVBYZERO,
    FE_OVERFLOW =
#define FE_OVERFLOW	0x08
      FE_OVERFLOW,
    FE_UNDERFLOW =
#define FE_UNDERFLOW	0x10
      FE_UNDERFLOW,
    FE_INEXACT =
#define FE_INEXACT	0x20
      FE_INEXACT
  ;

#define FE_ALL_EXCEPT \
	(FE_INEXACT | FE_DIVBYZERO | FE_UNDERFLOW | FE_OVERFLOW | FE_INVALID)
 }
{ The ix87 FPU supports all of the four defined rounding modes.  We
   use again the bit positions in the FPU control word as the values
   for the appropriate macros.   }
{ xxxxxxxxxxxxxx
enum
  
    FE_TONEAREST =
#define FE_TONEAREST	0
      FE_TONEAREST,
    FE_DOWNWARD =
#define FE_DOWNWARD	0x400
      FE_DOWNWARD,
    FE_UPWARD =
#define FE_UPWARD	0x800
      FE_UPWARD,
    FE_TOWARDZERO =
#define FE_TOWARDZERO	0xc00
      FE_TOWARDZERO
  ;
 }
{ Type representing exception flags.   }
type
  Pfexcept_t = ^Tfexcept_t;
  Tfexcept_t = word;
{ Type representing floating-point environment.  This structure
   corresponds to the layout of the block written by the `fstenv'
   instruction and has additional fields for the contents of the MXCSR
   register as written by the `stmxcsr' instruction.   }
{$ifdef __x86_64__}
{$endif}
type
  Pfenv_t = ^Tfenv_t;
  Tfenv_t = record
      __control_word : word;
      __glibc_reserved1 : word;
      __status_word : word;
      __glibc_reserved2 : word;
      __tags : word;
      __glibc_reserved3 : word;
      __eip : dword;
      __cs_selector : word;
      flag0 : word;
      __data_offset : dword;
      __data_selector : word;
      __glibc_reserved5 : word;
      __mxcsr : dword;
    end;

const
  bm_fenv_t___opcode = $7FF;
  bp_fenv_t___opcode = 0;
  bm_fenv_t___glibc_reserved4 = $F800;
  bp_fenv_t___glibc_reserved4 = 11;

function __opcode(var a : fenv_t) : dword;
procedure set___opcode(var a : fenv_t; ____opcode : dword);
function __glibc_reserved4(var a : fenv_t) : dword;
procedure set___glibc_reserved4(var a : fenv_t; ____glibc_reserved4 : dword);
{ If the default argument is used we use this value.   }

{ was #define dname def_expr }
function FE_DFL_ENV : Pfenv_t;  

{$ifdef __USE_GNU}
{ Floating-point environment where none of the exception is masked.   }
{ was #define dname def_expr }
function FE_NOMASK_ENV : Pfenv_t;  

{$endif}
{$if __GLIBC_USE (IEC_60559_BFP_EXT_C2X)}
{ Type representing floating-point control modes.   }
type
  Pfemode_t = ^Tfemode_t;
  Tfemode_t = record
      __control_word : word;
      __glibc_reserved : word;
      __mxcsr : dword;
    end;
{ Default floating-point control modes.   }

{ was #define dname def_expr }
function FE_DFL_MODE : Pfemode_t;  

{$endif}

// === Konventiert am: 5-8-25 17:32:32 ===


implementation


function __opcode(var a : fenv_t) : dword;
begin
  __opcode:=(a.flag0 and bm_fenv_t___opcode) shr bp_fenv_t___opcode;
end;

procedure set___opcode(var a : fenv_t; ____opcode : dword);
begin
  a.flag0:=a.flag0 or ((____opcode shl bp_fenv_t___opcode) and bm_fenv_t___opcode);
end;

function __glibc_reserved4(var a : fenv_t) : dword;
begin
  __glibc_reserved4:=(a.flag0 and bm_fenv_t___glibc_reserved4) shr bp_fenv_t___glibc_reserved4;
end;

procedure set___glibc_reserved4(var a : fenv_t; ____glibc_reserved4 : dword);
begin
  a.flag0:=a.flag0 or ((____glibc_reserved4 shl bp_fenv_t___glibc_reserved4) and bm_fenv_t___glibc_reserved4);
end;

{ was #define dname def_expr }
function FE_DFL_ENV : Pfenv_t;
  begin
    FE_DFL_ENV:=Pfenv_t(-(1));
  end;

{ was #define dname def_expr }
function FE_NOMASK_ENV : Pfenv_t;
  begin
    FE_NOMASK_ENV:=Pfenv_t(-(2));
  end;

{ was #define dname def_expr }
function FE_DFL_MODE : Pfemode_t;
  begin
    FE_DFL_MODE:=Pfemode_t(-(1));
  end;


end.
