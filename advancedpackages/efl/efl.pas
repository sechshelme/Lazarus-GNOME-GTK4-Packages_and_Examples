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
  libecore_file = 'libecore_file';
  libecore_eva = 'libecore_evas';
  libedje = 'libedje';
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
  libecore_file = 'libecore_file-1.dll';
  libecore_evas = 'libecore_evas-1.dll';
  libedje = 'libedje-1.dll';
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

// /usr/local/include/eet-1/Eet.h
type
  TEet_File_Mode=LongInt;



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
