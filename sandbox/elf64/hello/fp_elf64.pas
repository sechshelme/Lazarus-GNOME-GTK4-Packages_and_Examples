unit fp_elf64;

interface

const
  {$IFDEF Linux}
  libelf64 = 'libelf';
  {$ENDIF}

  {$IFDEF Wwindows}
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tu16 = uint16;
  Tu32 = uint32;
  Tu64 = uint64;

  Ts16 = int16;
  Ts32 = int32;
  Ts64 = int64;

  Tsize_t=SizeInt;

  Tuintptr_t = PtrUInt;
  Puintptr_t = ^Tuintptr_t;

  Tlong_double = extended;

type // /usr/include/dlfcn.h
  TLmid_t=LongInt;

type
  TInt128_t = record
    Lo, Hi: uint64;
  end;


implementation

end.
