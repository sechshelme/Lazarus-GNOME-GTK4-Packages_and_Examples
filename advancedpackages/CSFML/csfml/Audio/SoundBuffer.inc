{$IFDEF read_interface}


function sfSoundBuffer_createFromFile(filename: pchar): PsfSoundBuffer; cdecl; external libcsfml_audio;
function sfSoundBuffer_createFromMemory(data: pointer; sizeInBytes: Tsize_t): PsfSoundBuffer; cdecl; external libcsfml_audio;
function sfSoundBuffer_createFromStream(stream: PsfInputStream): PsfSoundBuffer; cdecl; external libcsfml_audio;
function sfSoundBuffer_createFromSamples(samples: PsfInt16; sampleCount: TsfUint64; channelCount: dword; sampleRate: dword): PsfSoundBuffer; cdecl; external libcsfml_audio;
function sfSoundBuffer_copy(soundBuffer: PsfSoundBuffer): PsfSoundBuffer; cdecl; external libcsfml_audio;
procedure sfSoundBuffer_destroy(soundBuffer: PsfSoundBuffer); cdecl; external libcsfml_audio;
function sfSoundBuffer_saveToFile(soundBuffer: PsfSoundBuffer; filename: pchar): TsfBool; cdecl; external libcsfml_audio;
function sfSoundBuffer_getSamples(soundBuffer: PsfSoundBuffer): PsfInt16; cdecl; external libcsfml_audio;
function sfSoundBuffer_getSampleCount(soundBuffer: PsfSoundBuffer): TsfUint64; cdecl; external libcsfml_audio;
function sfSoundBuffer_getSampleRate(soundBuffer: PsfSoundBuffer): dword; cdecl; external libcsfml_audio;
function sfSoundBuffer_getChannelCount(soundBuffer: PsfSoundBuffer): dword; cdecl; external libcsfml_audio;
function sfSoundBuffer_getDuration(soundBuffer: PsfSoundBuffer): TsfTime; cdecl; external libcsfml_audio;

// === Konventiert am: 24-9-25 16:54:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
