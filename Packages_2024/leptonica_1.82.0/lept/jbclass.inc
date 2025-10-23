{$IFDEF read_interface}


type
  TJbClasser = record
    safiles: PSarray;
    method: Tl_int32;
    components: Tl_int32;
    maxwidth: Tl_int32;
    maxheight: Tl_int32;
    npages: Tl_int32;
    baseindex: Tl_int32;
    nacomps: PNuma;
    sizehaus: Tl_int32;
    rankhaus: Tl_float32;
    thresh: Tl_float32;
    weightfactor: Tl_float32;
    naarea: PNuma;
    w: Tl_int32;
    h: Tl_int32;
    nclass: Tl_int32;
    keep_pixaa: Tl_int32;
    pixaa: PPixaa;
    pixat: PPixa;
    pixatd: PPixa;
    dahash: PL_DnaHash;
    nafgt: PNuma;
    ptac: PPta;
    ptact: PPta;
    naclass: PNuma;
    napage: PNuma;
    ptaul: PPta;
    ptall: PPta;
  end;
  PJbClasser = ^TJbClasser;
  PPJbClasser = ^PJbClasser;

  TJbData = record
    pix: PPix;
    npages: Tl_int32;
    w: Tl_int32;
    h: Tl_int32;
    nclass: Tl_int32;
    latticew: Tl_int32;
    latticeh: Tl_int32;
    naclass: PNuma;
    napage: PNuma;
    ptaul: PPta;
  end;
  PJbData = ^TJbData;
  PPJbData = ^PJbData;

const
  JB_RANKHAUS = 0;
  JB_CORRELATION = 1;

const
  JB_CONN_COMPS = 0;
  JB_CHARACTERS = 1;
  JB_WORDS = 2;


  // === Konventiert am: 17-8-25 13:40:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
