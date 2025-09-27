{$IFDEF read_interface}


type
  PsfContextAttribute = ^TsfContextAttribute;
  TsfContextAttribute = longint;

const
  sfContextDefault = 0;
  sfContextCore = 1 shl 0;
  sfContextDebug = 1 shl 2;

type
  TsfContextSettings = record
    depthBits: dword;
    stencilBits: dword;
    antialiasingLevel: dword;
    majorVersion: dword;
    minorVersion: dword;
    attributeFlags: TsfUint32;
    sRgbCapable: TsfBool;
  end;
  PsfContextSettings = ^TsfContextSettings;

function sfWindow_create(mode: TsfVideoMode; title: pchar; style: TsfUint32; settings: PsfContextSettings): PsfWindow; cdecl; external libcsfml_window;
function sfWindow_createUnicode(mode: TsfVideoMode; title: PsfUint32; style: TsfUint32; settings: PsfContextSettings): PsfWindow; cdecl; external libcsfml_window;
function sfWindow_createFromHandle(handle: TsfWindowHandle; settings: PsfContextSettings): PsfWindow; cdecl; external libcsfml_window;
procedure sfWindow_destroy(window: PsfWindow); cdecl; external libcsfml_window;
procedure sfWindow_close(window: PsfWindow); cdecl; external libcsfml_window;
function sfWindow_isOpen(window: PsfWindow): TsfBool; cdecl; external libcsfml_window;
function sfWindow_getSettings(window: PsfWindow): TsfContextSettings; cdecl; external libcsfml_window;
function sfWindow_pollEvent(window: PsfWindow; event: PsfEvent): TsfBool; cdecl; external libcsfml_window;
function sfWindow_waitEvent(window: PsfWindow; event: PsfEvent): TsfBool; cdecl; external libcsfml_window;
function sfWindow_getPosition(window: PsfWindow): TsfVector2i; cdecl; external libcsfml_window;
procedure sfWindow_setPosition(window: PsfWindow; position: TsfVector2i); cdecl; external libcsfml_window;
function sfWindow_getSize(window: PsfWindow): TsfVector2u; cdecl; external libcsfml_window;
procedure sfWindow_setSize(window: PsfWindow; size: TsfVector2u); cdecl; external libcsfml_window;
procedure sfWindow_setTitle(window: PsfWindow; title: pchar); cdecl; external libcsfml_window;
procedure sfWindow_setUnicodeTitle(window: PsfWindow; title: PsfUint32); cdecl; external libcsfml_window;
procedure sfWindow_setIcon(window: PsfWindow; width: dword; height: dword; pixels: PsfUint8); cdecl; external libcsfml_window;
procedure sfWindow_setVisible(window: PsfWindow; visible: TsfBool); cdecl; external libcsfml_window;
procedure sfWindow_setVerticalSyncEnabled(window: PsfWindow; enabled: TsfBool); cdecl; external libcsfml_window;
procedure sfWindow_setMouseCursorVisible(window: PsfWindow; visible: TsfBool); cdecl; external libcsfml_window;
procedure sfWindow_setMouseCursorGrabbed(window: PsfWindow; grabbed: TsfBool); cdecl; external libcsfml_window;
procedure sfWindow_setMouseCursor(window: PsfWindow; cursor: PsfCursor); cdecl; external libcsfml_window;
procedure sfWindow_setKeyRepeatEnabled(window: PsfWindow; enabled: TsfBool); cdecl; external libcsfml_window;
procedure sfWindow_setFramerateLimit(window: PsfWindow; limit: dword); cdecl; external libcsfml_window;
procedure sfWindow_setJoystickThreshold(window: PsfWindow; threshold: single); cdecl; external libcsfml_window;
function sfWindow_setActive(window: PsfWindow; active: TsfBool): TsfBool; cdecl; external libcsfml_window;
procedure sfWindow_requestFocus(window: PsfWindow); cdecl; external libcsfml_window;
function sfWindow_hasFocus(window: PsfWindow): TsfBool; cdecl; external libcsfml_window;
procedure sfWindow_display(window: PsfWindow); cdecl; external libcsfml_window;
function sfWindow_getSystemHandle(window: PsfWindow): TsfWindowHandle; cdecl; external libcsfml_window;

// === Konventiert am: 24-9-25 16:57:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
