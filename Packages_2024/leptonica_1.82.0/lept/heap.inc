{$IFDEF read_interface}


type
  TL_Heap = record
    nalloc: Tl_int32;
    n: Tl_int32;
    arr: ^pointer;
    direction: Tl_int32;
  end;
  PL_HEAP = ^TL_Heap;
  PPL_HEAP = ^PL_HEAP;

  // === Konventiert am: 17-8-25 13:40:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
