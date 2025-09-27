{$IFDEF read_interface}


function sfTouch_isDown(finger: dword): TsfBool; cdecl; external libcsfml_window;
function sfTouch_getPosition(finger: dword; relativeTo: PsfWindow): TsfVector2i; cdecl; external libcsfml_window;

// === Konventiert am: 24-9-25 16:58:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
