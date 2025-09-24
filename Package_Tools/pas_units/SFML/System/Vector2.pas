unit Vector2;

interface

uses
  fp_sfml;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TsfVector2i = record
    x: longint;
    y: longint;
  end;
  PsfVector2i = ^TsfVector2i;

  TsfVector2u = record
    x: dword;
    y: dword;
  end;
  PsfVector2u = ^TsfVector2u;

  TsfVector2f = record
    x: single;
    y: single;
  end;
  PsfVector2f = ^TsfVector2f;

  // === Konventiert am: 24-9-25 16:57:10 ===


implementation



end.
