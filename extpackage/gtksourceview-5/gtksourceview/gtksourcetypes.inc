{$IFDEF read_interface}

type
  TGtkSourceView = record
    parent_instance: TGtkTextView;
  end;
  PGtkSourceView = ^TGtkSourceView;

  TGtkSourceCompletion = record
  end;
  PGtkSourceCompletion = ^TGtkSourceCompletion;

  TGtkSourceCompletionProvider = record
  end;
  PGtkSourceCompletionProvider = ^TGtkSourceCompletionProvider;

  TGtkSourceGutterLines = record
  end;
  PGtkSourceGutterLines = ^TGtkSourceGutterLines;


// === Konventiert am: 29-3-25 15:26:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
