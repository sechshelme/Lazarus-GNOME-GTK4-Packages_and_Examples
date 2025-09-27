{$IFDEF read_interface}


type
  TsfVideoMode = record
    width: dword;
    height: dword;
    bitsPerPixel: dword;
  end;
  PsfVideoMode = ^TsfVideoMode;

function sfVideoMode_getDesktopMode: TsfVideoMode; cdecl; external libcsfml_window;
function sfVideoMode_getFullscreenModes(count: Psize_t): PsfVideoMode; cdecl; external libcsfml_window;
function sfVideoMode_isValid(mode: TsfVideoMode): TsfBool; cdecl; external libcsfml_window;

// === Konventiert am: 24-9-25 16:58:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
