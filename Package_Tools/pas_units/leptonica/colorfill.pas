unit colorfill;

interface

uses
  fp_lept, environ, pix_, array_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TL_Colorfill = record
    pixs: PPix;
    pixst: PPix;
    nx: Tl_int32;
    ny: Tl_int32;
    tw: Tl_int32;
    th: Tl_int32;
    minarea: Tl_int32;
    boxas: PBoxa;
    pixas: PPixa;
    pixam: PPixa;
    naa: PNumaa;
    dnaa: PL_Dnaa;
    pixadb: PPixa;
  end;
  PL_Colorfill = ^TL_Colorfill;
  PPL_Colorfill = ^PL_Colorfill;


  // === Konventiert am: 17-8-25 13:39:58 ===


implementation



end.
