{$IFDEF read_interface}


type
  PElm_Dayselector_Data = ^TElm_Dayselector_Data;
  TElm_Dayselector_Data = record
  end;

type
  TElm_Dayselector_Item_Data = record
    base: PElm_Widget_Item_Data;
    day: TElm_Dayselector_Day;
    day_style: pchar;
  end;
  PElm_Dayselector_Item_Data = ^TElm_Dayselector_Item_Data;

  // === Konventiert am: 1-6-25 15:41:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
