{$IFDEF read_interface}


procedure sfListener_setGlobalVolume(volume: single); cdecl; external libcsfml_audio;
function sfListener_getGlobalVolume: single; cdecl; external libcsfml_audio;
procedure sfListener_setPosition(position: TsfVector3f); cdecl; external libcsfml_audio;
function sfListener_getPosition: TsfVector3f; cdecl; external libcsfml_audio;
procedure sfListener_setDirection(direction: TsfVector3f); cdecl; external libcsfml_audio;
function sfListener_getDirection: TsfVector3f; cdecl; external libcsfml_audio;
procedure sfListener_setUpVector(upVector: TsfVector3f); cdecl; external libcsfml_audio;
function sfListener_getUpVector: TsfVector3f; cdecl; external libcsfml_audio;

// === Konventiert am: 24-9-25 16:53:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
