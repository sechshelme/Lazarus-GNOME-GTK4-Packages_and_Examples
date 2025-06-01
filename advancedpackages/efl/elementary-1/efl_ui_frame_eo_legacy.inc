{$IFDEF read_interface}


procedure elm_frame_collapse_set(obj: PEfl_Ui_Frame; collapse: TEina_Bool); cdecl; external libelementary;
function elm_frame_collapse_get(obj: PEfl_Ui_Frame): TEina_Bool; cdecl; external libelementary;
procedure elm_frame_autocollapse_set(obj: PEfl_Ui_Frame; autocollapse: TEina_Bool); cdecl; external libelementary;
function elm_frame_autocollapse_get(obj: PEfl_Ui_Frame): TEina_Bool; cdecl; external libelementary;
procedure elm_frame_collapse_go(obj: PEfl_Ui_Frame; collapse: TEina_Bool); cdecl; external libelementary;

// === Konventiert am: 31-5-25 15:16:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
