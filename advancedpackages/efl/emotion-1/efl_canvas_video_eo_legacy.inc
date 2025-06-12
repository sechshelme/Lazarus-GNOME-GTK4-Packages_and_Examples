{$IFDEF read_interface}


procedure emotion_object_module_option_set(obj: PEfl_Canvas_Video; opt: pchar; val: pchar); cdecl; external libemotion;
function emotion_object_init(obj: PEfl_Canvas_Video; module_filename: pchar): TEina_Bool; cdecl; external libemotion;

// === Konventiert am: 12-6-25 14:08:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
