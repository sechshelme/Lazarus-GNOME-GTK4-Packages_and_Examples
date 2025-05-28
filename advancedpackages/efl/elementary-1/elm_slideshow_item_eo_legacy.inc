{$IFDEF read_interface}


type
  PElm_Slideshow_Item = ^TElm_Slideshow_Item;
  TElm_Slideshow_Item = TEo;

procedure elm_slideshow_item_show(obj: PElm_Slideshow_Item); cdecl; external libelementary;
function elm_slideshow_item_object_get(obj: PElm_Slideshow_Item): PEfl_Canvas_Object; cdecl; external libelementary;

// === Konventiert am: 27-5-25 17:53:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
