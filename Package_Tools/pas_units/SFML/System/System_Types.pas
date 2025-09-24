unit System_Types;

interface

uses
  fp_sfml;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PsfBuffer = type Pointer;
  PsfClock = type Pointer;
  PsfMutex = type Pointer;
  PsfThread = type Pointer;


  // === Konventiert am: 24-9-25 16:57:19 ===


implementation



end.
