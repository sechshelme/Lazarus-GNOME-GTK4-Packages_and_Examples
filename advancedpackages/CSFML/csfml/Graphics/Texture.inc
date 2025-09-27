{$IFDEF read_interface}


type
  PsfTextureCoordinateType = ^TsfTextureCoordinateType;
  TsfTextureCoordinateType = longint;

const
  sfTextureNormalized = 0;
  sfTexturePixels = 1;

function sfTexture_create(width: dword; height: dword): PsfTexture; cdecl; external libcsfml_graphics;
function sfTexture_createFromFile(filename: pchar; area: PsfIntRect): PsfTexture; cdecl; external libcsfml_graphics;
function sfTexture_createSrgbFromFile(filename: pchar; area: PsfIntRect): PsfTexture; cdecl; external libcsfml_graphics;
function sfTexture_createFromMemory(data: pointer; sizeInBytes: Tsize_t; area: PsfIntRect): PsfTexture; cdecl; external libcsfml_graphics;
function sfTexture_createSrgbFromMemory(data: pointer; sizeInBytes: Tsize_t; area: PsfIntRect): PsfTexture; cdecl; external libcsfml_graphics;
function sfTexture_createFromStream(stream: PsfInputStream; area: PsfIntRect): PsfTexture; cdecl; external libcsfml_graphics;
function sfTexture_createSrgbFromStream(stream: PsfInputStream; area: PsfIntRect): PsfTexture; cdecl; external libcsfml_graphics;
function sfTexture_createFromImage(image: PsfImage; area: PsfIntRect): PsfTexture; cdecl; external libcsfml_graphics;
function sfTexture_createSrgbFromImage(image: PsfImage; area: PsfIntRect): PsfTexture; cdecl; external libcsfml_graphics;
function sfTexture_copy(texture: PsfTexture): PsfTexture; cdecl; external libcsfml_graphics;
procedure sfTexture_destroy(texture: PsfTexture); cdecl; external libcsfml_graphics;
function sfTexture_getSize(texture: PsfTexture): TsfVector2u; cdecl; external libcsfml_graphics;
function sfTexture_copyToImage(texture: PsfTexture): PsfImage; cdecl; external libcsfml_graphics;
procedure sfTexture_updateFromPixels(texture: PsfTexture; pixels: PsfUint8; width: dword; height: dword; x: dword; y: dword); cdecl; external libcsfml_graphics;
procedure sfTexture_updateFromTexture(destination: PsfTexture; source: PsfTexture; x: dword; y: dword); cdecl; external libcsfml_graphics;
procedure sfTexture_updateFromImage(texture: PsfTexture; image: PsfImage; x: dword; y: dword); cdecl; external libcsfml_graphics;
procedure sfTexture_updateFromWindow(texture: PsfTexture; window: PsfWindow; x: dword; y: dword); cdecl; external libcsfml_graphics;
procedure sfTexture_updateFromRenderWindow(texture: PsfTexture; renderWindow: PsfRenderWindow; x: dword; y: dword); cdecl; external libcsfml_graphics;
procedure sfTexture_setSmooth(texture: PsfTexture; smooth: TsfBool); cdecl; external libcsfml_graphics;
function sfTexture_isSmooth(texture: PsfTexture): TsfBool; cdecl; external libcsfml_graphics;
function sfTexture_isSrgb(texture: PsfTexture): TsfBool; cdecl; external libcsfml_graphics;
procedure sfTexture_setRepeated(texture: PsfTexture; repeated: TsfBool); cdecl; external libcsfml_graphics;
function sfTexture_isRepeated(texture: PsfTexture): TsfBool; cdecl; external libcsfml_graphics;
function sfTexture_generateMipmap(texture: PsfTexture): TsfBool; cdecl; external libcsfml_graphics;
procedure sfTexture_swap(left: PsfTexture; right: PsfTexture); cdecl; external libcsfml_graphics;
function sfTexture_getNativeHandle(texture: PsfTexture): dword; cdecl; external libcsfml_graphics;
procedure sfTexture_bind(texture: PsfTexture; _type: TsfTextureCoordinateType); cdecl; external libcsfml_graphics;
function sfTexture_getMaximumSize: dword; cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:54:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
