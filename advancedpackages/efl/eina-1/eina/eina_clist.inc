{$IFDEF read_interface}


type
  PEina_Clist = ^TEina_Clist;

  TEina_Clist = record
    next: PEina_Clist;
    prev: PEina_Clist;
  end;


  // === Konventiert am: 16-5-25 19:39:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
