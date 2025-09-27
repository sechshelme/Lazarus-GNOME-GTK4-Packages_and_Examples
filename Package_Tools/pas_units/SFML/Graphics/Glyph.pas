unit Glyph;

interface

uses
  fp_sfml, Rect;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TsfGlyph = record
    advance: single;
    bounds: TsfFloatRect;
    textureRect: TsfIntRect;
  end;
  PsfGlyph = ^TsfGlyph;

  // === Konventiert am: 24-9-25 16:55:32 ===


implementation



end.
