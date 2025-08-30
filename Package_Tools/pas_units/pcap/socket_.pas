unit socket_;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Psuseconds_t = ^Tsuseconds_t;
  Tsuseconds_t = longint;

type
  TSOCKET = longint;

const
  INVALID_SOCKET = -(1);

  // === Konventiert am: 30-8-25 19:14:19 ===


implementation



end.
