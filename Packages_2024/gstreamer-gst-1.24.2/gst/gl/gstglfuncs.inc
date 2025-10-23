
{$IFDEF read_interface}

type
  TGstGLFuncs = record
    padding: array[0..((GST_PADDING_LARGE * 6) - 2) - 1] of Tgpointer;
  end;
  PGstGLFuncs = ^TGstGLFuncs;

  // === Konventiert am: 9-10-24 09:55:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
