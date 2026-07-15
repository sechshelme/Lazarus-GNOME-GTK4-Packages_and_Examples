

  {$IFDEF read_struct}
type
  PGstGLFuncs = ^TGstGLFuncs;
  TGstGLFuncs = record
    padding: array[0..((GST_PADDING_LARGE * 6) - 8) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

  // === Konventiert am: 14-7-26 13:01:27 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
