{$IFDEF read_interface}


type
  TL_WShed = record
    pixs: PPix;
    pixm: PPix;
    mindepth: Tl_int32;
    pixlab: PPix;
    pixt: PPix;
    lines8: ^pointer;
    linem1: ^pointer;
    linelab32: ^pointer;
    linet1: ^pointer;
    pixad: PPixa;
    ptas: PPta;
    nasi: PNuma;
    nash: PNuma;
    namh: PNuma;
    nalevels: PNuma;
    nseeds: Tl_int32;
    nother: Tl_int32;
    lut: Pl_int32;
    links: ^PNuma;
    arraysize: Tl_int32;
    debug: Tl_int32;
  end;
  PL_WSHED = ^TL_WShed;
  PPL_WSHED = ^PL_WSHED;


  // === Konventiert am: 17-8-25 13:40:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
