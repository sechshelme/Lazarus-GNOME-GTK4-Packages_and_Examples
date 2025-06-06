{$IFDEF read_interface}


type
  PEina_Trash = ^TEina_Trash;
  PPEina_Trash = ^PEina_Trash;
  TEina_Trash = record
    next: PEina_Trash;
  end;

  // === Konventiert am: 17-5-25 16:00:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
