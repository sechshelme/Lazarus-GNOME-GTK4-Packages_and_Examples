{$IFDEF read_interface}


function sfVertexArray_create: PsfVertexArray; cdecl; external libcsfml_graphics;
function sfVertexArray_copy(vertexArray: PsfVertexArray): PsfVertexArray; cdecl; external libcsfml_graphics;
procedure sfVertexArray_destroy(vertexArray: PsfVertexArray); cdecl; external libcsfml_graphics;
function sfVertexArray_getVertexCount(vertexArray: PsfVertexArray): Tsize_t; cdecl; external libcsfml_graphics;
function sfVertexArray_getVertex(vertexArray: PsfVertexArray; index: Tsize_t): PsfVertex; cdecl; external libcsfml_graphics;
procedure sfVertexArray_clear(vertexArray: PsfVertexArray); cdecl; external libcsfml_graphics;
procedure sfVertexArray_resize(vertexArray: PsfVertexArray; vertexCount: Tsize_t); cdecl; external libcsfml_graphics;
procedure sfVertexArray_append(vertexArray: PsfVertexArray; vertex: TsfVertex); cdecl; external libcsfml_graphics;
procedure sfVertexArray_setPrimitiveType(vertexArray: PsfVertexArray; _type: TsfPrimitiveType); cdecl; external libcsfml_graphics;
function sfVertexArray_getPrimitiveType(vertexArray: PsfVertexArray): TsfPrimitiveType; cdecl; external libcsfml_graphics;
function sfVertexArray_getBounds(vertexArray: PsfVertexArray): TsfFloatRect; cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:54:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
