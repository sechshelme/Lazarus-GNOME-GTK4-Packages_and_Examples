{$IFDEF read_interface}


type
  PDoubleLinkedList = ^TDoubleLinkedList;
  TDoubleLinkedList = record
    prev: PDoubleLinkedList;
    next: PDoubleLinkedList;
    data: pointer;
  end;

  TDLLIST = TDoubleLinkedList;
  PDLLIST = ^TDLLIST;
  PPDLLIST = ^PDLLIST;

  // === Konventiert am: 17-8-25 13:40:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
