{$IFDEF read_interface}



function sfMutex_create: PsfMutex; cdecl; external libcsfml_system;
procedure sfMutex_destroy(mutex: PsfMutex); cdecl; external libcsfml_system;
procedure sfMutex_lock(mutex: PsfMutex); cdecl; external libcsfml_system;
procedure sfMutex_unlock(mutex: PsfMutex); cdecl; external libcsfml_system;

// === Konventiert am: 24-9-25 16:57:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
