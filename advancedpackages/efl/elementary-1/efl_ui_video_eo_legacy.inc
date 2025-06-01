{$IFDEF read_interface}


procedure elm_video_remember_position_set(obj: PEfl_Ui_Video; remember: TEina_Bool); cdecl; external libelementary;
function elm_video_remember_position_get(obj: PEfl_Ui_Video): TEina_Bool; cdecl; external libelementary;
function elm_video_emotion_get(obj: PEfl_Ui_Video): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_video_title_get(obj: PEfl_Ui_Video): pchar; cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:26:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
