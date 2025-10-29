{$IFDEF read_interface}


type
  {$ifdef windows}
  PHWND__ = type Pointer;
  TsfWindowHandle = PHWND__;
  {$endif}

  {$ifdef linux}
  TsfWindowHandle = UInt64;
  {$endif}

  {$ifdef darwin}
  TsfWindowHandle = pointer;
  {$endif}
  PsfWindowHandle = ^TsfWindowHandle;

  // === Konventiert am: 24-9-25 16:58:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
