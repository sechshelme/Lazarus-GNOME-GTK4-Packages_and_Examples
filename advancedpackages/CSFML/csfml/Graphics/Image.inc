{$IFDEF read_interface}


function sfImage_create(width: dword; height: dword): PsfImage; cdecl; external libcsfml_graphics;
function sfImage_createFromColor(width: dword; height: dword; color: TsfColor): PsfImage; cdecl; external libcsfml_graphics;
function sfImage_createFromPixels(width: dword; height: dword; pixels: PsfUint8): PsfImage; cdecl; external libcsfml_graphics;
function sfImage_createFromFile(filename: pchar): PsfImage; cdecl; external libcsfml_graphics;
function sfImage_createFromMemory(data: pointer; size: Tsize_t): PsfImage; cdecl; external libcsfml_graphics;
function sfImage_createFromStream(stream: PsfInputStream): PsfImage; cdecl; external libcsfml_graphics;
function sfImage_copy(image: PsfImage): PsfImage; cdecl; external libcsfml_graphics;
procedure sfImage_destroy(image: PsfImage); cdecl; external libcsfml_graphics;
function sfImage_saveToFile(image: PsfImage; filename: pchar): TsfBool; cdecl; external libcsfml_graphics;
function sfImage_saveToMemory(image: PsfImage; output: PsfBuffer; format: pchar): TsfBool; cdecl; external libcsfml_graphics;
function sfImage_getSize(image: PsfImage): TsfVector2u; cdecl; external libcsfml_graphics;
procedure sfImage_createMaskFromColor(image: PsfImage; color: TsfColor; alpha: TsfUint8); cdecl; external libcsfml_graphics;
procedure sfImage_copyImage(image: PsfImage; source: PsfImage; destX: dword; destY: dword; sourceRect: TsfIntRect; applyAlpha: TsfBool); cdecl; external libcsfml_graphics;
procedure sfImage_setPixel(image: PsfImage; x: dword; y: dword; color: TsfColor); cdecl; external libcsfml_graphics;
function sfImage_getPixel(image: PsfImage; x: dword; y: dword): TsfColor; cdecl; external libcsfml_graphics;
function sfImage_getPixelsPtr(image: PsfImage): PsfUint8; cdecl; external libcsfml_graphics;
procedure sfImage_flipHorizontally(image: PsfImage); cdecl; external libcsfml_graphics;
procedure sfImage_flipVertically(image: PsfImage); cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:55:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
