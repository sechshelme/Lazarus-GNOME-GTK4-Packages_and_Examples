{$IFDEF read_interface}


type
  TElm_Multibuttonentry_Item_Filter_Cb = function(obj: PEvas_Object; item_label: pchar; item_data: pointer; data: pointer): TEina_Bool; cdecl;

  PElm_Multibuttonentry_Format_Cb = ^TElm_Multibuttonentry_Format_Cb;
  TElm_Multibuttonentry_Format_Cb = function(count: longint; data: pointer): pchar; cdecl;

  // === Konventiert am: 28-5-25 16:05:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
