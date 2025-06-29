unit types;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pu8 = ^Tu8;
  Tu8 = uint8;

  Pu16 = ^Tu16;
  Tu16 = uint16;

  Pu32 = ^Tu32;
  Tu32 = uint32;

  Pu64 = ^Tu64;
  Tu64 = uint64;

type
  Ppciaddr_t = ^Tpciaddr_t;
  Tpciaddr_t = Tu64;

  // === Konventiert am: 28-6-25 19:49:19 ===


implementation



end.
