{$IFDEF read_interface}


type
  TsfSoundStreamChunk = record
    samples: PsfInt16;
    sampleCount: dword;
  end;
  PsfSoundStreamChunk = ^TsfSoundStreamChunk;

  TsfSoundStreamGetDataCallback = function(para1: PsfSoundStreamChunk; para2: pointer): TsfBool; cdecl;
  TsfSoundStreamSeekCallback = procedure(para1: TsfTime; para2: pointer); cdecl;

function sfSoundStream_create(onGetData: TsfSoundStreamGetDataCallback; onSeek: TsfSoundStreamSeekCallback; channelCount: dword; sampleRate: dword; userData: pointer): PsfSoundStream; cdecl; external libcsfml_audio;
procedure sfSoundStream_destroy(soundStream: PsfSoundStream); cdecl; external libcsfml_audio;
procedure sfSoundStream_play(soundStream: PsfSoundStream); cdecl; external libcsfml_audio;
procedure sfSoundStream_pause(soundStream: PsfSoundStream); cdecl; external libcsfml_audio;
procedure sfSoundStream_stop(soundStream: PsfSoundStream); cdecl; external libcsfml_audio;
function sfSoundStream_getStatus(soundStream: PsfSoundStream): TsfSoundStatus; cdecl; external libcsfml_audio;
function sfSoundStream_getChannelCount(soundStream: PsfSoundStream): dword; cdecl; external libcsfml_audio;
function sfSoundStream_getSampleRate(soundStream: PsfSoundStream): dword; cdecl; external libcsfml_audio;
procedure sfSoundStream_setPitch(soundStream: PsfSoundStream; pitch: single); cdecl; external libcsfml_audio;
procedure sfSoundStream_setVolume(soundStream: PsfSoundStream; volume: single); cdecl; external libcsfml_audio;
procedure sfSoundStream_setPosition(soundStream: PsfSoundStream; position: TsfVector3f); cdecl; external libcsfml_audio;
procedure sfSoundStream_setRelativeToListener(soundStream: PsfSoundStream; relative: TsfBool); cdecl; external libcsfml_audio;
procedure sfSoundStream_setMinDistance(soundStream: PsfSoundStream; distance: single); cdecl; external libcsfml_audio;
procedure sfSoundStream_setAttenuation(soundStream: PsfSoundStream; attenuation: single); cdecl; external libcsfml_audio;
procedure sfSoundStream_setPlayingOffset(soundStream: PsfSoundStream; timeOffset: TsfTime); cdecl; external libcsfml_audio;
procedure sfSoundStream_setLoop(soundStream: PsfSoundStream; loop: TsfBool); cdecl; external libcsfml_audio;
function sfSoundStream_getPitch(soundStream: PsfSoundStream): single; cdecl; external libcsfml_audio;
function sfSoundStream_getVolume(soundStream: PsfSoundStream): single; cdecl; external libcsfml_audio;
function sfSoundStream_getPosition(soundStream: PsfSoundStream): TsfVector3f; cdecl; external libcsfml_audio;
function sfSoundStream_isRelativeToListener(soundStream: PsfSoundStream): TsfBool; cdecl; external libcsfml_audio;
function sfSoundStream_getMinDistance(soundStream: PsfSoundStream): single; cdecl; external libcsfml_audio;
function sfSoundStream_getAttenuation(soundStream: PsfSoundStream): single; cdecl; external libcsfml_audio;
function sfSoundStream_getLoop(soundStream: PsfSoundStream): TsfBool; cdecl; external libcsfml_audio;
function sfSoundStream_getPlayingOffset(soundStream: PsfSoundStream): TsfTime; cdecl; external libcsfml_audio;

// === Konventiert am: 24-9-25 16:54:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
