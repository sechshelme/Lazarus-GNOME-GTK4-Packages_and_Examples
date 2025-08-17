unit ccbord;

interface

uses
  fp_lept, environ, pix_, array_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  CCB_LOCAL_COORDS = 1;
  CCB_GLOBAL_COORDS = 2;

const
  CCB_SAVE_ALL_PTS = 1;
  CCB_SAVE_TURNING_PTS = 2;

type
  TCCBord = record
    pix: PPix;
    boxa: PBoxa;
    start: PPta;
    refcount: Tl_int32;
    local: PPtaa;
    global: PPtaa;
    step: PNumaa;
    splocal: PPta;
    spglobal: PPta;
  end;
  PCCBord = ^TCCBord;
  PPCCBord = ^PCCBord;

  TCCBorda = record
    pix: PPix;
    w: Tl_int32;
    h: Tl_int32;
    n: Tl_int32;
    nalloc: Tl_int32;
    ccb: ^PCCBord;
  end;
  PCCBorda = ^TCCBorda;
  PPCCBorda = ^PCCBorda;


  // === Konventiert am: 16-8-25 20:03:42 ===


implementation



end.
