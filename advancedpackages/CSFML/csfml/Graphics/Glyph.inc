{$IFDEF read_interface}


type
  TsfGlyph = record
    advance: single;
    bounds: TsfFloatRect;
    textureRect: TsfIntRect;
  end;
  PsfGlyph = ^TsfGlyph;

  // === Konventiert am: 24-9-25 16:55:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
