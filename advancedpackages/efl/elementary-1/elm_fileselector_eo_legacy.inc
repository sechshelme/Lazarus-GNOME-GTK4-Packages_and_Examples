{$IFDEF read_interface}


type
  PElm_Fileselector = ^TElm_Fileselector;
  TElm_Fileselector = TEo;

procedure elm_fileselector_buttons_ok_cancel_set(obj: PElm_Fileselector; visible: TEina_Bool); cdecl; external libelementary;
function elm_fileselector_buttons_ok_cancel_get(obj: PElm_Fileselector): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 27-5-25 17:01:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
