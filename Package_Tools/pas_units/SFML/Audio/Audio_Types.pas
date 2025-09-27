unit Audio_Types;

interface

uses
  fp_sfml;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PsfMusic = type Pointer;
  PsfSound = type Pointer;
  PsfSoundBuffer = type Pointer;
  PsfSoundBufferRecorder = type Pointer;
  PsfSoundRecorder = type Pointer;
  PsfSoundStream = type Pointer;

  // === Konventiert am: 24-9-25 16:53:54 ===


implementation



end.
