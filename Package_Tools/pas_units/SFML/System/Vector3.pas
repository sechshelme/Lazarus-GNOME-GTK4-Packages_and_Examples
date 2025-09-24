unit Vector3;

interface

uses
  fp_sfml;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TsfVector3f = record
    x: single;
    y: single;
    z: single;
  end;
  PsfVector3f = ^TsfVector3f;

  // === Konventiert am: 24-9-25 16:57:06 ===


implementation



end.
