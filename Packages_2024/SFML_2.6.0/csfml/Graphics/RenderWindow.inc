{$IFDEF read_interface}



function sfRenderWindow_create(mode: TsfVideoMode; title: pchar; style: TsfUint32; settings: PsfContextSettings): PsfRenderWindow; cdecl; external libcsfml_graphics;
function sfRenderWindow_createUnicode(mode: TsfVideoMode; title: PsfUint32; style: TsfUint32; settings: PsfContextSettings): PsfRenderWindow; cdecl; external libcsfml_graphics;
function sfRenderWindow_createFromHandle(handle: TsfWindowHandle; settings: PsfContextSettings): PsfRenderWindow; cdecl; external libcsfml_graphics;
procedure sfRenderWindow_destroy(renderWindow: PsfRenderWindow); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_close(renderWindow: PsfRenderWindow); cdecl; external libcsfml_graphics;
function sfRenderWindow_isOpen(renderWindow: PsfRenderWindow): TsfBool; cdecl; external libcsfml_graphics;
function sfRenderWindow_getSettings(renderWindow: PsfRenderWindow): TsfContextSettings; cdecl; external libcsfml_graphics;
function sfRenderWindow_pollEvent(renderWindow: PsfRenderWindow; event: PsfEvent): TsfBool; cdecl; external libcsfml_graphics;
function sfRenderWindow_waitEvent(renderWindow: PsfRenderWindow; event: PsfEvent): TsfBool; cdecl; external libcsfml_graphics;
function sfRenderWindow_getPosition(renderWindow: PsfRenderWindow): TsfVector2i; cdecl; external libcsfml_graphics;
procedure sfRenderWindow_setPosition(renderWindow: PsfRenderWindow; position: TsfVector2i); cdecl; external libcsfml_graphics;
function sfRenderWindow_getSize(renderWindow: PsfRenderWindow): TsfVector2u; cdecl; external libcsfml_graphics;
function sfRenderWindow_isSrgb(renderWindow: PsfRenderWindow): TsfBool; cdecl; external libcsfml_graphics;
procedure sfRenderWindow_setSize(renderWindow: PsfRenderWindow; size: TsfVector2u); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_setTitle(renderWindow: PsfRenderWindow; title: pchar); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_setUnicodeTitle(renderWindow: PsfRenderWindow; title: PsfUint32); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_setIcon(renderWindow: PsfRenderWindow; width: dword; height: dword; pixels: PsfUint8); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_setVisible(renderWindow: PsfRenderWindow; visible: TsfBool); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_setVerticalSyncEnabled(renderWindow: PsfRenderWindow; enabled: TsfBool); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_setMouseCursorVisible(renderWindow: PsfRenderWindow; show: TsfBool); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_setMouseCursorGrabbed(renderWindow: PsfRenderWindow; grabbed: TsfBool); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_setMouseCursor(window: PsfRenderWindow; cursor: PsfCursor); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_setKeyRepeatEnabled(renderWindow: PsfRenderWindow; enabled: TsfBool); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_setFramerateLimit(renderWindow: PsfRenderWindow; limit: dword); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_setJoystickThreshold(renderWindow: PsfRenderWindow; threshold: single); cdecl; external libcsfml_graphics;
function sfRenderWindow_setActive(renderWindow: PsfRenderWindow; active: TsfBool): TsfBool; cdecl; external libcsfml_graphics;
procedure sfRenderWindow_requestFocus(renderWindow: PsfRenderWindow); cdecl; external libcsfml_graphics;
function sfRenderWindow_hasFocus(renderWindow: PsfRenderWindow): TsfBool; cdecl; external libcsfml_graphics;
procedure sfRenderWindow_display(renderWindow: PsfRenderWindow); cdecl; external libcsfml_graphics;
function sfRenderWindow_getSystemHandle(renderWindow: PsfRenderWindow): TsfWindowHandle; cdecl; external libcsfml_graphics;
procedure sfRenderWindow_clear(renderWindow: PsfRenderWindow; color: TsfColor); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_setView(renderWindow: PsfRenderWindow; view: PsfView); cdecl; external libcsfml_graphics;
function sfRenderWindow_getView(renderWindow: PsfRenderWindow): PsfView; cdecl; external libcsfml_graphics;
function sfRenderWindow_getDefaultView(renderWindow: PsfRenderWindow): PsfView; cdecl; external libcsfml_graphics;
function sfRenderWindow_getViewport(renderWindow: PsfRenderWindow; view: PsfView): TsfIntRect; cdecl; external libcsfml_graphics;
function sfRenderWindow_mapPixelToCoords(renderWindow: PsfRenderWindow; point: TsfVector2i; view: PsfView): TsfVector2f; cdecl; external libcsfml_graphics;
function sfRenderWindow_mapCoordsToPixel(renderWindow: PsfRenderWindow; point: TsfVector2f; view: PsfView): TsfVector2i; cdecl; external libcsfml_graphics;
procedure sfRenderWindow_drawSprite(renderWindow: PsfRenderWindow; obj: PsfSprite; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_drawText(renderWindow: PsfRenderWindow; obj: PsfText; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_drawShape(renderWindow: PsfRenderWindow; obj: PsfShape; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_drawCircleShape(renderWindow: PsfRenderWindow; obj: PsfCircleShape; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_drawConvexShape(renderWindow: PsfRenderWindow; obj: PsfConvexShape; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_drawRectangleShape(renderWindow: PsfRenderWindow; obj: PsfRectangleShape; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_drawVertexArray(renderWindow: PsfRenderWindow; obj: PsfVertexArray; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_drawVertexBuffer(renderWindow: PsfRenderWindow; obj: PsfVertexBuffer; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_drawVertexBufferRange(renderWindow: PsfRenderWindow; obj: PsfVertexBuffer; firstVertex: Tsize_t; vertexCount: Tsize_t; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_drawPrimitives(renderWindow: PsfRenderWindow; vertices: PsfVertex; vertexCount: Tsize_t; _type: TsfPrimitiveType; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_pushGLStates(renderWindow: PsfRenderWindow); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_popGLStates(renderWindow: PsfRenderWindow); cdecl; external libcsfml_graphics;
procedure sfRenderWindow_resetGLStates(renderWindow: PsfRenderWindow); cdecl; external libcsfml_graphics;
function sfRenderWindow_capture(renderWindow: PsfRenderWindow): PsfImage; cdecl; external libcsfml_graphics; deprecated;
function sfMouse_getPositionRenderWindow(relativeTo: PsfRenderWindow): TsfVector2i; cdecl; external libcsfml_graphics;
procedure sfMouse_setPositionRenderWindow(position: TsfVector2i; relativeTo: PsfRenderWindow); cdecl; external libcsfml_graphics;
function sfTouch_getPositionRenderWindow(finger: dword; relativeTo: PsfRenderWindow): TsfVector2i; cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:55:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
