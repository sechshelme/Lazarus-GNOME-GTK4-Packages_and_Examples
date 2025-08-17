{$IFDEF read_interface}


type
  TL_RegParams = record
    fp: PFILE;
    testname: pchar;
    tempfile: pchar;
    mode: Tl_int32;
    index: Tl_int32;
    success: Tl_int32;
    display: Tl_int32;
    tstart: TL_TIMER;
  end;
  PL_RegParams = ^TL_RegParams;
  PPL_RegParams = ^PL_RegParams;

const
  L_REG_GENERATE = 0;
  L_REG_COMPARE = 1;
  L_REG_DISPLAY = 2;


  // === Konventiert am: 17-8-25 13:40:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
