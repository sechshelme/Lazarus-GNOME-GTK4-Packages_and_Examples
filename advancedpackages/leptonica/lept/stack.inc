{$IFDEF read_interface}


type
  PPL_Stack = ^PL_Stack;
  PL_Stack = ^TL_Stack;
  TL_Stack = record
    nalloc: Tl_int32;
    n: Tl_int32;
    arr: ^pointer;
    auxstack: PL_Stack;
  end;

  // === Konventiert am: 17-8-25 13:40:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
