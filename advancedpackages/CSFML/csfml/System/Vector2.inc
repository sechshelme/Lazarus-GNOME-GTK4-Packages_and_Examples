{$IFDEF read_interface}


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


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
