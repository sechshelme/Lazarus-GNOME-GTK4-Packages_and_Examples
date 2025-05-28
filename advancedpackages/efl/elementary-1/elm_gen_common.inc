{$IFDEF read_interface}


type
  TElm_Gen_Item_Tooltip = bitpacked record
    data: pointer;
    content_cb: TElm_Tooltip_Item_Content_Cb;
    del_cb: TEvas_Smart_Cb;
    style: pchar;
    free_size: 0..1;
  end;
  PElm_Gen_Item_Tooltip = ^TElm_Gen_Item_Tooltip;


  // === Konventiert am: 26-5-25 19:23:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
