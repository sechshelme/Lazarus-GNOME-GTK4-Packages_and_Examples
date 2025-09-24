unit WindowHandle;

interface

uses
  fp_sfml;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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


implementation



end.
