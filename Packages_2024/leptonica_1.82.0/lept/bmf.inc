{$IFDEF read_interface}


const
  SPLIT_ON_LEADING_WHITE = 1;
  SPLIT_ON_BLANK_LINE = 2;
  SPLIT_ON_BOTH = 3;

type
  TL_Bmf = record
    pixa: PPixa;
    size: Tl_int32;
    directory: pchar;
    baseline1: Tl_int32;
    baseline2: Tl_int32;
    baseline3: Tl_int32;
    lineheight: Tl_int32;
    kernwidth: Tl_int32;
    spacewidth: Tl_int32;
    vertlinesep: Tl_int32;
    fonttab: Pl_int32;
    baselinetab: Pl_int32;
    widthtab: Pl_int32;
  end;
  PL_BMF = ^TL_Bmf;
  PPL_BMF = ^PL_BMF;

  // === Konventiert am: 16-8-25 19:57:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
