unit Types;

interface

uses
  fp_graphite2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pgr_uint8 = ^Tgr_uint8;
  Tgr_uint8 = uint8;

  Pgr_byte = ^Tgr_byte;
  Tgr_byte = uint8;

  Pgr_int8 = ^Tgr_int8;
  Tgr_int8 = uint8;

  Pgr_uint16 = ^Tgr_uint16;
  Tgr_uint16 = uint16;

  Pgr_int16 = ^Tgr_int16;
  Tgr_int16 = int16;

  Pgr_uint32 = ^Tgr_uint32;
  Tgr_uint32 = uint32;

  Pgr_int32 = ^Tgr_int32;
  Tgr_int32 = int32;

type
  Tgr_encform = longint;

const
  gr_utf8 = 1;
  gr_utf16 = 2;
  gr_utf32 = 4;


  // === Konventiert am: 27-7-25 17:44:07 ===


implementation


end.
