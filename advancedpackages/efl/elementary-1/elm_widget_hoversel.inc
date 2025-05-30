{$IFDEF read_interface}


type
  PElm_Hoversel_Data = ^TElm_Hoversel_Data;
  TElm_Hoversel_Data = record
  end;

type
  TElm_Hoversel_Item_Data = record
    base: PElm_Widget_Item_Data;
    _label: pchar;
    icon_file: pchar;
    icon_group: pchar;
    icon_type: TElm_Icon_Type;
    func: TEvas_Smart_Cb;
  end;
  PElm_Hoversel_Item_Data = ^TElm_Hoversel_Item_Data;


  // === Konventiert am: 30-5-25 17:54:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
