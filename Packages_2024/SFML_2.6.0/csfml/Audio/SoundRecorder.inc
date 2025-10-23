{$IFDEF read_interface}


type
  TsfSoundRecorderStartCallback = function(para1: pointer): TsfBool; cdecl;
  TsfSoundRecorderProcessCallback = function(para1: PsfInt16; para2: Tsize_t; para3: pointer): TsfBool; cdecl;
  TsfSoundRecorderStopCallback = procedure(para1: pointer); cdecl;

function sfSoundRecorder_create(onStart: TsfSoundRecorderStartCallback; onProcess: TsfSoundRecorderProcessCallback; onStop: TsfSoundRecorderStopCallback; userData: pointer): PsfSoundRecorder; cdecl; external libcsfml_audio;
procedure sfSoundRecorder_destroy(soundRecorder: PsfSoundRecorder); cdecl; external libcsfml_audio;
function sfSoundRecorder_start(soundRecorder: PsfSoundRecorder; sampleRate: dword): TsfBool; cdecl; external libcsfml_audio;
procedure sfSoundRecorder_stop(soundRecorder: PsfSoundRecorder); cdecl; external libcsfml_audio;
function sfSoundRecorder_getSampleRate(soundRecorder: PsfSoundRecorder): dword; cdecl; external libcsfml_audio;
function sfSoundRecorder_isAvailable: TsfBool; cdecl; external libcsfml_audio;
procedure sfSoundRecorder_setProcessingInterval(soundRecorder: PsfSoundRecorder; interval: TsfTime); cdecl; external libcsfml_audio;
function sfSoundRecorder_getAvailableDevices(count: Psize_t): PPchar; cdecl; external libcsfml_audio;
function sfSoundRecorder_getDefaultDevice: pchar; cdecl; external libcsfml_audio;
function sfSoundRecorder_setDevice(soundRecorder: PsfSoundRecorder; name: pchar): TsfBool; cdecl; external libcsfml_audio;
function sfSoundRecorder_getDevice(soundRecorder: PsfSoundRecorder): pchar; cdecl; external libcsfml_audio;
procedure sfSoundRecorder_setChannelCount(soundRecorder: PsfSoundRecorder; channelCount: dword); cdecl; external libcsfml_audio;
function sfSoundRecorder_getChannelCount(soundRecorder: PsfSoundRecorder): dword; cdecl; external libcsfml_audio;

// === Konventiert am: 24-9-25 16:54:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
