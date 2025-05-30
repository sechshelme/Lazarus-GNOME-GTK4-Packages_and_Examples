{$IFDEF read_interface}


type
  TGroup = record
    value: longint;
    valuep: Plongint;
    radios: PEina_List;
  end;
  PGroup = ^TGroup;

  TEfl_Ui_Radio_Data = record
    value: longint;
    group: PGroup;
  end;
  PEfl_Ui_Radio_Data = ^TEfl_Ui_Radio_Data;


  // === Konventiert am: 30-5-25 15:52:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
