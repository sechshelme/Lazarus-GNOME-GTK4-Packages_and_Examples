unit VertexBuffer;

interface

uses
  fp_sfml, Config, Graphics_Types, PrimitiveType, Vertex;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PsfVertexBufferUsage = ^TsfVertexBufferUsage;
  TsfVertexBufferUsage = longint;

const
  sfVertexBufferStream = 0;
  sfVertexBufferDynamic = 1;
  sfVertexBufferStatic = 2;

function sfVertexBuffer_create(vertexCount: dword; _type: TsfPrimitiveType; usage: TsfVertexBufferUsage): PsfVertexBuffer; cdecl; external libsfml_graphics;
function sfVertexBuffer_copy(vertexBuffer: PsfVertexBuffer): PsfVertexBuffer; cdecl; external libsfml_graphics;
procedure sfVertexBuffer_destroy(vertexBuffer: PsfVertexBuffer); cdecl; external libsfml_graphics;
function sfVertexBuffer_getVertexCount(vertexBuffer: PsfVertexBuffer): dword; cdecl; external libsfml_graphics;
function sfVertexBuffer_update(vertexBuffer: PsfVertexBuffer; vertices: PsfVertex; vertexCount: dword; offset: dword): TsfBool; cdecl; external libsfml_graphics;
function sfVertexBuffer_updateFromVertexBuffer(vertexBuffer: PsfVertexBuffer; other: PsfVertexBuffer): TsfBool; cdecl; external libsfml_graphics;
procedure sfVertexBuffer_swap(left: PsfVertexBuffer; right: PsfVertexBuffer); cdecl; external libsfml_graphics;
function sfVertexBuffer_getNativeHandle(vertexBuffer: PsfVertexBuffer): dword; cdecl; external libsfml_graphics;
procedure sfVertexBuffer_setPrimitiveType(vertexBuffer: PsfVertexBuffer; _type: TsfPrimitiveType); cdecl; external libsfml_graphics;
function sfVertexBuffer_getPrimitiveType(vertexBuffer: PsfVertexBuffer): TsfPrimitiveType; cdecl; external libsfml_graphics;
procedure sfVertexBuffer_setUsage(vertexBuffer: PsfVertexBuffer; usage: TsfVertexBufferUsage); cdecl; external libsfml_graphics;
function sfVertexBuffer_getUsage(vertexBuffer: PsfVertexBuffer): TsfVertexBufferUsage; cdecl; external libsfml_graphics;
procedure sfVertexBuffer_bind(vertexBuffer: PsfVertexBuffer); cdecl; external libsfml_graphics;
function sfVertexBuffer_isAvailable: TsfBool; cdecl; external libsfml_graphics;

// === Konventiert am: 24-9-25 16:54:41 ===


implementation



end.
