unit wint_t;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/x86_64-linux-gnu/bits/types/wint_t.h


type
  Pwint_t = ^Twint_t;
  Twint_t = DWord;

  // === Konventiert am: 23-8-25 14:10:26 ===


implementation



end.
