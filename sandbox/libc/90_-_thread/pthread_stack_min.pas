unit pthread_stack_min;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/x86_64-linux-gnu/bits/pthread_stack_min.h

const
  PTHREAD_STACK_MIN = 16384;

  // === Konventiert am: 8-8-25 14:52:45 ===


implementation



end.
