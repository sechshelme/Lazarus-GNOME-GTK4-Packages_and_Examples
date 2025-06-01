{$IFDEF read_interface}


type
  PElm_Frame = ^TElm_Frame;
  TElm_Frame = TEo;

function elm_frame_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;

// === Konventiert am: 31-5-25 15:17:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
