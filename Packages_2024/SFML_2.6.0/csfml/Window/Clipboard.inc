{$IFDEF read_interface}


function sfClipboard_getString: pchar; cdecl; external libcsfml_window;
function sfClipboard_getUnicodeString: PsfUint32; cdecl; external libcsfml_window;
procedure sfClipboard_setString(text: pchar); cdecl; external libcsfml_window;
procedure sfClipboard_setUnicodeString(text: PsfUint32); cdecl; external libcsfml_window;

// === Konventiert am: 24-9-25 16:58:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
