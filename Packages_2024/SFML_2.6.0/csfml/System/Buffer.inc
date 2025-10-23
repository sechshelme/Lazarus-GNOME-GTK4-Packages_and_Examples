{$IFDEF read_interface}



function sfBuffer_create: PsfBuffer; cdecl; external libcsfml_system;
procedure sfBuffer_destroy(buffer: PsfBuffer); cdecl; external libcsfml_system;
function sfBuffer_getSize(buffer: PsfBuffer): Tsize_t; cdecl; external libcsfml_system;
function sfBuffer_getData(buffer: PsfBuffer): PsfUint8; cdecl; external libcsfml_system;

// === Konventiert am: 24-9-25 16:57:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
