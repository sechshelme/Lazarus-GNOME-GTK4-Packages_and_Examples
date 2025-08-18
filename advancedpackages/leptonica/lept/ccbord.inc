{$IFDEF read_interface}


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
  PCCBORD = ^TCCBord;
  PPCCBORD = ^PCCBORD;

  TCCBorda = record
    pix: PPix;
    w: Tl_int32;
    h: Tl_int32;
    n: Tl_int32;
    nalloc: Tl_int32;
    ccb: ^PCCBord;
  end;
  PCCBORDA = ^TCCBorda;
  PPCCBORDA = ^PCCBORDA;


  // === Konventiert am: 16-8-25 20:03:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
