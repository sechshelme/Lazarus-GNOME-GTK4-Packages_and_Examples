{$IFDEF read_interface}


function sfSound_create: PsfSound; cdecl; external libcsfml_audio;
function sfSound_copy(sound: PsfSound): PsfSound; cdecl; external libcsfml_audio;
procedure sfSound_destroy(sound: PsfSound); cdecl; external libcsfml_audio;
procedure sfSound_play(sound: PsfSound); cdecl; external libcsfml_audio;
procedure sfSound_pause(sound: PsfSound); cdecl; external libcsfml_audio;
procedure sfSound_stop(sound: PsfSound); cdecl; external libcsfml_audio;
procedure sfSound_setBuffer(sound: PsfSound; buffer: PsfSoundBuffer); cdecl; external libcsfml_audio;
function sfSound_getBuffer(sound: PsfSound): PsfSoundBuffer; cdecl; external libcsfml_audio;
procedure sfSound_setLoop(sound: PsfSound; loop: TsfBool); cdecl; external libcsfml_audio;
function sfSound_getLoop(sound: PsfSound): TsfBool; cdecl; external libcsfml_audio;
function sfSound_getStatus(sound: PsfSound): TsfSoundStatus; cdecl; external libcsfml_audio;
procedure sfSound_setPitch(sound: PsfSound; pitch: single); cdecl; external libcsfml_audio;
procedure sfSound_setVolume(sound: PsfSound; volume: single); cdecl; external libcsfml_audio;
procedure sfSound_setPosition(sound: PsfSound; position: TsfVector3f); cdecl; external libcsfml_audio;
procedure sfSound_setRelativeToListener(sound: PsfSound; relative: TsfBool); cdecl; external libcsfml_audio;
procedure sfSound_setMinDistance(sound: PsfSound; distance: single); cdecl; external libcsfml_audio;
procedure sfSound_setAttenuation(sound: PsfSound; attenuation: single); cdecl; external libcsfml_audio;
procedure sfSound_setPlayingOffset(sound: PsfSound; timeOffset: TsfTime); cdecl; external libcsfml_audio;
function sfSound_getPitch(sound: PsfSound): single; cdecl; external libcsfml_audio;
function sfSound_getVolume(sound: PsfSound): single; cdecl; external libcsfml_audio;
function sfSound_getPosition(sound: PsfSound): TsfVector3f; cdecl; external libcsfml_audio;
function sfSound_isRelativeToListener(sound: PsfSound): TsfBool; cdecl; external libcsfml_audio;
function sfSound_getMinDistance(sound: PsfSound): single; cdecl; external libcsfml_audio;
function sfSound_getAttenuation(sound: PsfSound): single; cdecl; external libcsfml_audio;
function sfSound_getPlayingOffset(sound: PsfSound): TsfTime; cdecl; external libcsfml_audio;

// === Konventiert am: 24-9-25 16:54:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
