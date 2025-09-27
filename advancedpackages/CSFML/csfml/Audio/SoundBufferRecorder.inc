{$IFDEF read_interface}


function sfSoundBufferRecorder_create: PsfSoundBufferRecorder; cdecl; external libcsfml_audio;
procedure sfSoundBufferRecorder_destroy(soundBufferRecorder: PsfSoundBufferRecorder); cdecl; external libcsfml_audio;
function sfSoundBufferRecorder_start(soundBufferRecorder: PsfSoundBufferRecorder; sampleRate: dword): TsfBool; cdecl; external libcsfml_audio;
procedure sfSoundBufferRecorder_stop(soundBufferRecorder: PsfSoundBufferRecorder); cdecl; external libcsfml_audio;
function sfSoundBufferRecorder_getSampleRate(soundBufferRecorder: PsfSoundBufferRecorder): dword; cdecl; external libcsfml_audio;
function sfSoundBufferRecorder_getBuffer(soundBufferRecorder: PsfSoundBufferRecorder): PsfSoundBuffer; cdecl; external libcsfml_audio;
function sfSoundBufferRecorder_setDevice(soundBufferRecorder: PsfSoundBufferRecorder; name: pchar): TsfBool; cdecl; external libcsfml_audio;
function sfSoundBufferRecorder_getDevice(soundBufferRecorder: PsfSoundBufferRecorder): pchar; cdecl; external libcsfml_audio;

// === Konventiert am: 24-9-25 16:54:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
