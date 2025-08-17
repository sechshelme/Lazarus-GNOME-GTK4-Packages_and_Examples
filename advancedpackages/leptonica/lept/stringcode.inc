{$IFDEF read_interface}


type
  TL_StrCode = record
    fileno: Tl_int32;
    ifunc: Tl_int32;
    _function: PSARRAY;
    data: PSARRAY;
    descr: PSARRAY;
    n: Tl_int32;
  end;
  PL_StrCode = ^TL_StrCode;
  PPL_StrCode = ^PL_StrCode;

const
  L_STR_TYPE = 0;
  L_STR_NAME = 1;
  L_STR_READER = 2;
  L_STR_MEMREADER = 3;


  // === Konventiert am: 17-8-25 13:40:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
