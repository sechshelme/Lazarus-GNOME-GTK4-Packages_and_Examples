unit efl;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  {$IFDEF Linux}
  libclib = 'c';
  libelementary = 'libelementary';
  libevas = 'libevas';
  libeina = 'libeina';
  libeo = 'libeo';
  libefl = 'libefl';
  libemile = 'libemile';
  libecore = 'libecore';

  libencore = 'libecore';
  {$ENDIF}

  {$IFDEF mswindows}
  libclib = 'msvcrt';
  libelementary = 'libelementary-1.dll';
  libevas = 'libevas-1.dll';
  libeina = 'libeina-1.dll';
  libeo = 'libeo-1.dll';
  libefl = 'libefl-1.dll';
  libemile = 'libemile-1.dll';
  libecore = 'libecore-1.dll';
  {$ENDIF}

  {$IFDEF darwin}
  libclib = 'libc.dylib';
  {$ENDIF}


  //  {$define EFL_BETA_API_SUPPORT}

  // === System

type
  Tva_list = Pointer;
  Ttime_t = uint64;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  Tssize_t = SizeInt;
  Pssize_t = ^Tssize_t;

  Tptrdiff_t = PtrInt;

  Tuintptr_t = PtrUInt;

  Twchar_t = widechar;

  PFILE = Pointer;

  // /usr/include/unistd.h
  Tpid_t = longint;

  // /usr/include/x86_64-linux-gnu/bits/types/struct_tm.h
type
  Ttm = record
    tm_sec: longint;
    tm_min: longint;
    tm_hour: longint;
    tm_mday: longint;
    tm_mon: longint;
    tm_year: longint;
    tm_wday: longint;
    tm_yday: longint;
    tm_isdst: longint;
    tm_gmtoff: int64;
    tm_zone: pchar;
  end;
  Ptm = ^Ttm;

  // /usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h
type
  Ptimeval = Pointer;

  // /usr/include/x86_64-linux-gnu/sys/select.h
type
  Pfd_set = Pointer;

  // /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h
type
  Tsiginfo_t = record
    // Muss aufgelöst werden
  end;
  Psiginfo_t = ^Tsiginfo_t;

function calloc(num, size: Tsize_t): Pointer; cdecl; external libclib;

// =====================

  // /usr/include/ecore-evas-1/Ecore_Evas_Types.h
type
  PEcore_Evas = Pointer;
  PEcore_Wl2_Window = Pointer;
  PEcore_Win32_Window = Pointer;
  TEcore_X_Window = uint32;
  PEcore_Cocoa_Window = Pointer;
  TEcore_Window = PtrUInt;

  // /usr/include/edje-1/Edje_Common.h
type
  TEdje_Signal_Cb = Pointer; // callproc

  TEdje_Entry_Change_Info = record
    // Muss aufgelöst werden
  end;
  PEdje_Entry_Change_Info = ^TEdje_Entry_Change_Info;

type
  // /usr/include/eina-1/eina/eina_inline_lock_posix.x
  TEina_Lock = Pointer;
  PEina_Lock = ^TEina_Lock;

  // /usr/include/eina-1/eina/eina_inline_lock_posix.x
  TEina_Spinlock = TEina_Lock;
  PEina_Spinlock = ^TEina_Spinlock;

  // Unbekannte Herkunft
type
  TEcore_Factorized_Idle = record
  end;



implementation

{$IF defined(CPUX86) or defined(CPUX64)}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;
//{$ENDIF}
{$ENDIF}

begin
  //  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);
  //{$IFDEF Linux}
  {$IF defined(CPUX86) or defined(CPUX64)}
  SetMXCSR;
  {$ENDIF}
end.
