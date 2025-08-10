unit in_systm;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pn_short = ^Tn_short;
  Tn_short = Tuint16_t;

  Pn_long = ^Tn_long;
  Tn_long = Tuint32_t;

  Pn_time = ^Tn_time;
  Tn_time = Tuint32_t;

  // === Konventiert am: 10-8-25 17:28:15 ===


implementation



end.
