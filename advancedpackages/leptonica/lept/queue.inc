{$IFDEF read_interface}


type
  TL_Queue = record
    nalloc: Tl_int32;
    nhead: Tl_int32;
    nelem: Tl_int32;
    arr: ^pointer;
    stack: PL_Stack;
  end;
  PL_QUEUE = ^TL_Queue;
  PPL_QUEUE = ^PL_QUEUE;

  // === Konventiert am: 17-8-25 13:40:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
