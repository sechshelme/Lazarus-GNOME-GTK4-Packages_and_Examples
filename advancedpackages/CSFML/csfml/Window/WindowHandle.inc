{$IFDEF read_interface}


  {$ifdef windows}
type
  PHWND__ = type Pointer;

  PsfWindowHandle = ^TsfWindowHandle;
  TsfWindowHandle = PHWND__;
  {$endif}

  {$ifdef linux}
type
  PsfWindowHandle = ^TsfWindowHandle;
  TsfWindowHandle = dword;
  {$endif}

  {$ifdef darwin}
type
  PsfWindowHandle = ^TsfWindowHandle;
  TsfWindowHandle = pointer;
  {$endif}

  // === Konventiert am: 24-9-25 16:58:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
