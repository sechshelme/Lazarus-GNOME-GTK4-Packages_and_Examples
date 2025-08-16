unit bbuffer;

interface

uses
  fp_lept, environ;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TL_ByteBuffer = record
    nalloc: Tl_int32;
    n: Tl_int32;
    nwritten: Tl_int32;
    arr: Pl_uint8;
  end;
  PL_ByteBuffer = ^TL_ByteBuffer;

  TL_BBUFFER = TL_ByteBuffer;
  PL_BBUFFER = ^TL_BBUFFER;
  PPL_BBUFFER = ^PL_BBUFFER;

  // === Konventiert am: 16-8-25 19:50:51 ===


implementation



end.
