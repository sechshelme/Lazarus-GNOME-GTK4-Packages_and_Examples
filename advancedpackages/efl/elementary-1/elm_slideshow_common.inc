{$IFDEF read_interface}


type
  PSlideshowItemGetFunc = ^TSlideshowItemGetFunc;
  TSlideshowItemGetFunc = function(data: pointer; obj: PEvas_Object): PEvas_Object; cdecl;

  TSlideshowItemDelFunc = procedure(data: pointer; obj: PEvas_Object); cdecl;

  TElm_Slideshow_Item_Class = record
    func: record
      get: TSlideshowItemGetFunc;
      del: TSlideshowItemDelFunc;
      end;
  end;
  PElm_Slideshow_Item_Class = ^TElm_Slideshow_Item_Class;

  // === Konventiert am: 27-5-25 17:53:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
