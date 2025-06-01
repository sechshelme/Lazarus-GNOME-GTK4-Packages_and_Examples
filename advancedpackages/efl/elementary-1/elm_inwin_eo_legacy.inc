{$IFDEF read_interface}


type
  PElm_Inwin = ^TElm_Inwin;
  TElm_Inwin = TEo;

procedure elm_win_inwin_activate(obj: PElm_Inwin); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:32:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
