{$IFDEF read_interface}


type
  PElm_Diskselector_Data = ^TElm_Diskselector_Data;
  TElm_Diskselector_Data = record
  end;

type
  TElm_Diskselector_Item_Data = record
    base: PElm_Widget_Item_Data;
    node: PEina_List;
    icon: PEvas_Object;
    _label: pchar;
    func: TEvas_Smart_Cb;
  end;
  PElm_Diskselector_Item_Data = ^TElm_Diskselector_Item_Data;


  // === Konventiert am: 30-5-25 13:11:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
