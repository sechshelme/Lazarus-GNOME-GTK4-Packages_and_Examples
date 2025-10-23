{$IFDEF read_interface}


type
  PsfVertexBufferUsage = ^TsfVertexBufferUsage;
  TsfVertexBufferUsage = longint;

const
  sfVertexBufferStream = 0;
  sfVertexBufferDynamic = 1;
  sfVertexBufferStatic = 2;

function sfVertexBuffer_create(vertexCount: dword; _type: TsfPrimitiveType; usage: TsfVertexBufferUsage): PsfVertexBuffer; cdecl; external libcsfml_graphics;
function sfVertexBuffer_copy(vertexBuffer: PsfVertexBuffer): PsfVertexBuffer; cdecl; external libcsfml_graphics;
procedure sfVertexBuffer_destroy(vertexBuffer: PsfVertexBuffer); cdecl; external libcsfml_graphics;
function sfVertexBuffer_getVertexCount(vertexBuffer: PsfVertexBuffer): dword; cdecl; external libcsfml_graphics;
function sfVertexBuffer_update(vertexBuffer: PsfVertexBuffer; vertices: PsfVertex; vertexCount: dword; offset: dword): TsfBool; cdecl; external libcsfml_graphics;
function sfVertexBuffer_updateFromVertexBuffer(vertexBuffer: PsfVertexBuffer; other: PsfVertexBuffer): TsfBool; cdecl; external libcsfml_graphics;
procedure sfVertexBuffer_swap(left: PsfVertexBuffer; right: PsfVertexBuffer); cdecl; external libcsfml_graphics;
function sfVertexBuffer_getNativeHandle(vertexBuffer: PsfVertexBuffer): dword; cdecl; external libcsfml_graphics;
procedure sfVertexBuffer_setPrimitiveType(vertexBuffer: PsfVertexBuffer; _type: TsfPrimitiveType); cdecl; external libcsfml_graphics;
function sfVertexBuffer_getPrimitiveType(vertexBuffer: PsfVertexBuffer): TsfPrimitiveType; cdecl; external libcsfml_graphics;
procedure sfVertexBuffer_setUsage(vertexBuffer: PsfVertexBuffer; usage: TsfVertexBufferUsage); cdecl; external libcsfml_graphics;
function sfVertexBuffer_getUsage(vertexBuffer: PsfVertexBuffer): TsfVertexBufferUsage; cdecl; external libcsfml_graphics;
procedure sfVertexBuffer_bind(vertexBuffer: PsfVertexBuffer); cdecl; external libcsfml_graphics;
function sfVertexBuffer_isAvailable: TsfBool; cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:54:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
