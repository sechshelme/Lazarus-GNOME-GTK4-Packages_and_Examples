{$IFDEF read_interface}


function sfRenderTexture_create(width: dword; height: dword; depthBuffer: TsfBool): PsfRenderTexture; cdecl; external libcsfml_graphics;
function sfRenderTexture_createWithSettings(width: dword; height: dword; settings: PsfContextSettings): PsfRenderTexture; cdecl; external libcsfml_graphics;
procedure sfRenderTexture_destroy(renderTexture: PsfRenderTexture); cdecl; external libcsfml_graphics;
function sfRenderTexture_getSize(renderTexture: PsfRenderTexture): TsfVector2u; cdecl; external libcsfml_graphics;
function sfRenderTexture_isSrgb(renderTexture: PsfRenderTexture): TsfBool; cdecl; external libcsfml_graphics;
function sfRenderTexture_setActive(renderTexture: PsfRenderTexture; active: TsfBool): TsfBool; cdecl; external libcsfml_graphics;
procedure sfRenderTexture_display(renderTexture: PsfRenderTexture); cdecl; external libcsfml_graphics;
procedure sfRenderTexture_clear(renderTexture: PsfRenderTexture; color: TsfColor); cdecl; external libcsfml_graphics;
procedure sfRenderTexture_setView(renderTexture: PsfRenderTexture; view: PsfView); cdecl; external libcsfml_graphics;
function sfRenderTexture_getView(renderTexture: PsfRenderTexture): PsfView; cdecl; external libcsfml_graphics;
function sfRenderTexture_getDefaultView(renderTexture: PsfRenderTexture): PsfView; cdecl; external libcsfml_graphics;
function sfRenderTexture_getViewport(renderTexture: PsfRenderTexture; view: PsfView): TsfIntRect; cdecl; external libcsfml_graphics;
function sfRenderTexture_mapPixelToCoords(renderTexture: PsfRenderTexture; point: TsfVector2i; view: PsfView): TsfVector2f; cdecl; external libcsfml_graphics;
function sfRenderTexture_mapCoordsToPixel(renderTexture: PsfRenderTexture; point: TsfVector2f; view: PsfView): TsfVector2i; cdecl; external libcsfml_graphics;
procedure sfRenderTexture_drawSprite(renderTexture: PsfRenderTexture; obj: PsfSprite; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderTexture_drawText(renderTexture: PsfRenderTexture; obj: PsfText; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderTexture_drawShape(renderTexture: PsfRenderTexture; obj: PsfShape; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderTexture_drawCircleShape(renderTexture: PsfRenderTexture; obj: PsfCircleShape; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderTexture_drawConvexShape(renderTexture: PsfRenderTexture; obj: PsfConvexShape; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderTexture_drawRectangleShape(renderTexture: PsfRenderTexture; obj: PsfRectangleShape; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderTexture_drawVertexArray(renderTexture: PsfRenderTexture; obj: PsfVertexArray; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderTexture_drawVertexBuffer(renderTexture: PsfRenderTexture; obj: PsfVertexBuffer; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderTexture_drawVertexBufferRange(renderTexture: PsfRenderTexture; obj: PsfVertexBuffer; firstVertex: Tsize_t; vertexCount: Tsize_t; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderTexture_drawPrimitives(renderTexture: PsfRenderTexture; vertices: PsfVertex; vertexCount: Tsize_t; _type: TsfPrimitiveType; states: PsfRenderStates); cdecl; external libcsfml_graphics;
procedure sfRenderTexture_pushGLStates(renderTexture: PsfRenderTexture); cdecl; external libcsfml_graphics;
procedure sfRenderTexture_popGLStates(renderTexture: PsfRenderTexture); cdecl; external libcsfml_graphics;
procedure sfRenderTexture_resetGLStates(renderTexture: PsfRenderTexture); cdecl; external libcsfml_graphics;
function sfRenderTexture_getTexture(renderTexture: PsfRenderTexture): PsfTexture; cdecl; external libcsfml_graphics;
function sfRenderTexture_getMaximumAntialiasingLevel: dword; cdecl; external libcsfml_graphics;
procedure sfRenderTexture_setSmooth(renderTexture: PsfRenderTexture; smooth: TsfBool); cdecl; external libcsfml_graphics;
function sfRenderTexture_isSmooth(renderTexture: PsfRenderTexture): TsfBool; cdecl; external libcsfml_graphics;
procedure sfRenderTexture_setRepeated(renderTexture: PsfRenderTexture; repeated: TsfBool); cdecl; external libcsfml_graphics;
function sfRenderTexture_isRepeated(renderTexture: PsfRenderTexture): TsfBool; cdecl; external libcsfml_graphics;
function sfRenderTexture_generateMipmap(renderTexture: PsfRenderTexture): TsfBool; cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:55:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
