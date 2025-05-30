{$IFDEF read_interface}


type
  TElm_Slideshow_Item_Data = record
    base: PElm_Widget_Item_Data;
    l: PEina_List;
    l_built: PEina_List;
    itc: PElm_Slideshow_Item_Class;
  end;
  PElm_Slideshow_Item_Data = ^TElm_Slideshow_Item_Data;

  PElm_Slideshow_Data = ^TElm_Slideshow_Data;
  TElm_Slideshow_Data = record
  end;


  // === Konventiert am: 30-5-25 17:55:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
