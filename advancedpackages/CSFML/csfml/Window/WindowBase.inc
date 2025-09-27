{$IFDEF read_interface}


type
  PsfWindowStyle = ^TsfWindowStyle;
  TsfWindowStyle = longint;

const
  sfNone = 0;
  sfTitlebar = 1 shl 0;
  sfResize = 1 shl 1;
  sfClose = 1 shl 2;
  sfFullscreen = 1 shl 3;
  sfDefaultStyle = (sfTitlebar or sfResize) or sfClose;

function sfWindowBase_create(mode: TsfVideoMode; title: pchar; style: TsfUint32): PsfWindowBase; cdecl; external libcsfml_window;
function sfWindowBase_createUnicode(mode: TsfVideoMode; title: PsfUint32; style: TsfUint32): PsfWindowBase; cdecl; external libcsfml_window;
function sfWindowBase_createFromHandle(handle: TsfWindowHandle): PsfWindowBase; cdecl; external libcsfml_window;
procedure sfWindowBase_destroy(windowBase: PsfWindowBase); cdecl; external libcsfml_window;
procedure sfWindowBase_close(windowBase: PsfWindowBase); cdecl; external libcsfml_window;
function sfWindowBase_isOpen(windowBase: PsfWindowBase): TsfBool; cdecl; external libcsfml_window;
function sfWindowBase_pollEvent(windowBase: PsfWindowBase; event: PsfEvent): TsfBool; cdecl; external libcsfml_window;
function sfWindowBase_waitEvent(windowBase: PsfWindowBase; event: PsfEvent): TsfBool; cdecl; external libcsfml_window;
function sfWindowBase_getPosition(windowBase: PsfWindowBase): TsfVector2i; cdecl; external libcsfml_window;
procedure sfWindowBase_setPosition(windowBase: PsfWindowBase; position: TsfVector2i); cdecl; external libcsfml_window;
function sfWindowBase_getSize(windowBase: PsfWindowBase): TsfVector2u; cdecl; external libcsfml_window;
procedure sfWindowBase_setSize(windowBase: PsfWindowBase; size: TsfVector2u); cdecl; external libcsfml_window;
procedure sfWindowBase_setTitle(windowBase: PsfWindowBase; title: pchar); cdecl; external libcsfml_window;
procedure sfWindowBase_setUnicodeTitle(windowBase: PsfWindowBase; title: PsfUint32); cdecl; external libcsfml_window;
procedure sfWindowBase_setIcon(windowBase: PsfWindowBase; width: dword; height: dword; pixels: PsfUint8); cdecl; external libcsfml_window;
procedure sfWindowBase_setVisible(windowBase: PsfWindowBase; visible: TsfBool); cdecl; external libcsfml_window;
procedure sfWindowBase_setMouseCursorVisible(windowBase: PsfWindowBase; visible: TsfBool); cdecl; external libcsfml_window;
procedure sfWindowBase_setMouseCursorGrabbed(windowBase: PsfWindowBase; grabbed: TsfBool); cdecl; external libcsfml_window;
procedure sfWindowBase_setMouseCursor(windowBase: PsfWindowBase; cursor: PsfCursor); cdecl; external libcsfml_window;
procedure sfWindowBase_setKeyRepeatEnabled(windowBase: PsfWindowBase; enabled: TsfBool); cdecl; external libcsfml_window;
procedure sfWindowBase_setJoystickThreshold(windowBase: PsfWindowBase; threshold: single); cdecl; external libcsfml_window;
procedure sfWindowBase_requestFocus(windowBase: PsfWindowBase); cdecl; external libcsfml_window;
function sfWindowBase_hasFocus(windowBase: PsfWindowBase): TsfBool; cdecl; external libcsfml_window;
function sfWindowBase_getSystemHandle(windowBase: PsfWindowBase): TsfWindowHandle; cdecl; external libcsfml_window;
function sfWindowBase_createVulkanSurface(windowBase: PsfWindowBase; instance: PVkInstance; surface: PVkSurfaceKHR; allocator: PVkAllocationCallbacks): TsfBool; cdecl; external libcsfml_window;

// === Konventiert am: 24-9-25 16:57:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
