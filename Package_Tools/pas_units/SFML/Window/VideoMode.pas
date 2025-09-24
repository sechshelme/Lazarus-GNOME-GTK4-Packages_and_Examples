unit VideoMode;

interface

uses
  fp_sfml, Config;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TsfVideoMode = record
    width: dword;
    height: dword;
    bitsPerPixel: dword;
  end;
  PsfVideoMode = ^TsfVideoMode;

function sfVideoMode_getDesktopMode: TsfVideoMode; cdecl; external libsfml_window;
function sfVideoMode_getFullscreenModes(count: Psize_t): PsfVideoMode; cdecl; external libsfml_window;
function sfVideoMode_isValid(mode: TsfVideoMode): TsfBool; cdecl; external libsfml_window;

// === Konventiert am: 24-9-25 16:58:03 ===


implementation



end.
