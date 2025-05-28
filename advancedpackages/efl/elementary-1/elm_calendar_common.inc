{$IFDEF read_interface}


type
  PElm_Calendar_Format_Cb = ^TElm_Calendar_Format_Cb;
  TElm_Calendar_Format_Cb = function(stime: Ptm): pchar; cdecl;

  // === Konventiert am: 26-5-25 19:44:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
