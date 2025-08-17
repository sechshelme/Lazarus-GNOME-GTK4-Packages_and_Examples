{$IFDEF read_interface}


var
  MaxInitPtraSize: Tl_uint32; cvar;external libleptb;

type
  TL_Ptra = record
    nalloc: Tl_int32;
    imax: Tl_int32;
    nactual: Tl_int32;
    arr: ^pointer;
  end;
  PL_Ptra = ^TL_Ptra;
  PPL_Ptra = ^PL_Ptra;

  TL_Ptraa = record
    nalloc: Tl_int32;
    ptra: ^PL_Ptra;
  end;
  PL_Ptraa = ^TL_Ptraa;
  PPL_Ptraa = ^PL_Ptraa;

const
  L_NO_COMPACTION = 1;
  L_COMPACTION = 2;

const
  L_AUTO_DOWNSHIFT = 0;
  L_MIN_DOWNSHIFT = 1;
  L_FULL_DOWNSHIFT = 2;

const
  L_HANDLE_ONLY = 0;
  L_REMOVE = 1;


  // === Konventiert am: 17-8-25 13:40:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
