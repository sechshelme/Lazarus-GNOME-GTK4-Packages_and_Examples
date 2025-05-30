{$IFDEF read_interface}


type
  PElm_Entry_Data = ^TElm_Entry_Data;
  TElm_Entry_Data = record
  end;

  TElm_Entry_Item_Provider = record
    func: function(data: pointer; entry: PEvas_Object; item: pchar): PEvas_Object; cdecl;
    data: pointer;
  end;
  PElm_Entry_Item_Provider = ^TElm_Entry_Item_Provider;

  TElm_Entry_Markup_Filter = record
    func: TElm_Entry_Filter_Cb;
    data: pointer;
    orig_data: pointer;
  end;
  PElm_Entry_Markup_Filter = ^TElm_Entry_Markup_Filter;

  PLength_Unit = ^TLength_Unit;
  TLength_Unit = longint;

const
  LENGTH_UNIT_CHAR = 0;
  LENGTH_UNIT_BYTE = 1;
  LENGTH_UNIT_LAST = 2;

  // === Konventiert am: 28-5-25 17:40:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
