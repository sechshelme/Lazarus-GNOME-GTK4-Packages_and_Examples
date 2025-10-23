{$IFDEF read_interface}


type
  PsfSoundStatus = ^TsfSoundStatus;
  TsfSoundStatus = longint;

const
  sfStopped = 0;
  sfPaused = 1;
  sfPlaying = 2;

  // === Konventiert am: 24-9-25 16:54:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
