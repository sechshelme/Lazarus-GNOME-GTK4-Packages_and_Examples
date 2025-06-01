{$IFDEF read_interface}


type
  PElm_Separator = ^TElm_Separator;
  TElm_Separator = TEo;

procedure elm_separator_horizontal_set(obj: PElm_Separator; horizontal: TEina_Bool); cdecl; external libelementary;
function elm_separator_horizontal_get(obj: PElm_Separator): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:10:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
