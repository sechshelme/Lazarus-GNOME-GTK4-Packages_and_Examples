unit FontInfo;

interface

uses
  fp_sfml;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TsfFontInfo = record
    family: pchar;
  end;
  PsfFontInfo = ^TsfFontInfo;

  // === Konventiert am: 24-9-25 16:55:37 ===


implementation



end.
