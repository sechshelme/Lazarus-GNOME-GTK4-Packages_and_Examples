{$IFDEF read_interface}


function sfFont_createFromFile(filename: pchar): PsfFont; cdecl; external libcsfml_graphics;
function sfFont_createFromMemory(data: pointer; sizeInBytes: Tsize_t): PsfFont; cdecl; external libcsfml_graphics;
function sfFont_createFromStream(stream: PsfInputStream): PsfFont; cdecl; external libcsfml_graphics;
function sfFont_copy(font: PsfFont): PsfFont; cdecl; external libcsfml_graphics;
procedure sfFont_destroy(font: PsfFont); cdecl; external libcsfml_graphics;
function sfFont_getGlyph(font: PsfFont; codePoint: TsfUint32; characterSize: dword; bold: TsfBool; outlineThickness: single): TsfGlyph; cdecl; external libcsfml_graphics;
function sfFont_getKerning(font: PsfFont; first: TsfUint32; second: TsfUint32; characterSize: dword): single; cdecl; external libcsfml_graphics;
function sfFont_getBoldKerning(font: PsfFont; first: TsfUint32; second: TsfUint32; characterSize: dword): single; cdecl; external libcsfml_graphics;
function sfFont_getLineSpacing(font: PsfFont; characterSize: dword): single; cdecl; external libcsfml_graphics;
function sfFont_getUnderlinePosition(font: PsfFont; characterSize: dword): single; cdecl; external libcsfml_graphics;
function sfFont_getUnderlineThickness(font: PsfFont; characterSize: dword): single; cdecl; external libcsfml_graphics;
function sfFont_getTexture(font: PsfFont; characterSize: dword): PsfTexture; cdecl; external libcsfml_graphics;
procedure sfFont_setSmooth(font: PsfFont; smooth: TsfBool); cdecl; external libcsfml_graphics;
function sfFont_isSmooth(font: PsfFont): TsfBool; cdecl; external libcsfml_graphics;
function sfFont_getInfo(font: PsfFont): TsfFontInfo; cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:55:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
