unit struct_rwlock;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/x86_64-linux-gnu/bits/struct_rwlock.h

type
  T_pthread_rwlock_arch_t = record
    __readers: UInt32;
    __writers: UInt32;
    __wrphase_futex: UInt32;
    __writers_futex: UInt32;
    __pad3: UInt32;
    __pad4: UInt32;
    __cur_writer: integer;
    __shared: integer;
    __rwelision: Int8;
    __pad1: array[0..6] of byte;
    __pad2: uint64;
    __flags: UInt32;
  end;

  // === Konventiert am: 8-8-25 17:18:45 ===


implementation



end.
