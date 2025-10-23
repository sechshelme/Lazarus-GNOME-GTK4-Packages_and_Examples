{$IFDEF read_interface}


function sfClock_create: PsfClock; cdecl; external libcsfml_system;
function sfClock_copy(clock: PsfClock): PsfClock; cdecl; external libcsfml_system;
procedure sfClock_destroy(clock: PsfClock); cdecl; external libcsfml_system;
function sfClock_getElapsedTime(clock: PsfClock): TsfTime; cdecl; external libcsfml_system;
function sfClock_restart(clock: PsfClock): TsfTime; cdecl; external libcsfml_system;

// === Konventiert am: 24-9-25 16:57:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
