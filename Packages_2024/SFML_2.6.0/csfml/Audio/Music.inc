{$IFDEF read_interface}


type
  TsfTimeSpan = record
    offset: TsfTime;
    length: TsfTime;
  end;
  PsfTimeSpan = ^TsfTimeSpan;

function sfMusic_createFromFile(filename: pchar): PsfMusic; cdecl; external libcsfml_audio;
function sfMusic_createFromMemory(data: pointer; sizeInBytes: Tsize_t): PsfMusic; cdecl; external libcsfml_audio;
function sfMusic_createFromStream(stream: PsfInputStream): PsfMusic; cdecl; external libcsfml_audio;
procedure sfMusic_destroy(music: PsfMusic); cdecl; external libcsfml_audio;
procedure sfMusic_setLoop(music: PsfMusic; loop: TsfBool); cdecl; external libcsfml_audio;
function sfMusic_getLoop(music: PsfMusic): TsfBool; cdecl; external libcsfml_audio;
function sfMusic_getDuration(music: PsfMusic): TsfTime; cdecl; external libcsfml_audio;
function sfMusic_getLoopPoints(music: PsfMusic): TsfTimeSpan; cdecl; external libcsfml_audio;
procedure sfMusic_setLoopPoints(music: PsfMusic; timePoints: TsfTimeSpan); cdecl; external libcsfml_audio;
procedure sfMusic_play(music: PsfMusic); cdecl; external libcsfml_audio;
procedure sfMusic_pause(music: PsfMusic); cdecl; external libcsfml_audio;
procedure sfMusic_stop(music: PsfMusic); cdecl; external libcsfml_audio;
function sfMusic_getChannelCount(music: PsfMusic): dword; cdecl; external libcsfml_audio;
function sfMusic_getSampleRate(music: PsfMusic): dword; cdecl; external libcsfml_audio;
function sfMusic_getStatus(music: PsfMusic): TsfSoundStatus; cdecl; external libcsfml_audio;
function sfMusic_getPlayingOffset(music: PsfMusic): TsfTime; cdecl; external libcsfml_audio;
procedure sfMusic_setPitch(music: PsfMusic; pitch: single); cdecl; external libcsfml_audio;
procedure sfMusic_setVolume(music: PsfMusic; volume: single); cdecl; external libcsfml_audio;
procedure sfMusic_setPosition(music: PsfMusic; position: TsfVector3f); cdecl; external libcsfml_audio;
procedure sfMusic_setRelativeToListener(music: PsfMusic; relative: TsfBool); cdecl; external libcsfml_audio;
procedure sfMusic_setMinDistance(music: PsfMusic; distance: single); cdecl; external libcsfml_audio;
procedure sfMusic_setAttenuation(music: PsfMusic; attenuation: single); cdecl; external libcsfml_audio;
procedure sfMusic_setPlayingOffset(music: PsfMusic; timeOffset: TsfTime); cdecl; external libcsfml_audio;
function sfMusic_getPitch(music: PsfMusic): single; cdecl; external libcsfml_audio;
function sfMusic_getVolume(music: PsfMusic): single; cdecl; external libcsfml_audio;
function sfMusic_getPosition(music: PsfMusic): TsfVector3f; cdecl; external libcsfml_audio;
function sfMusic_isRelativeToListener(music: PsfMusic): TsfBool; cdecl; external libcsfml_audio;
function sfMusic_getMinDistance(music: PsfMusic): single; cdecl; external libcsfml_audio;
function sfMusic_getAttenuation(music: PsfMusic): single; cdecl; external libcsfml_audio;

// === Konventiert am: 24-9-25 16:54:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
