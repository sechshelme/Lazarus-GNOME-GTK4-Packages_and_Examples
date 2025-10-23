{$IFDEF read_interface}


function sfConvexShape_create: PsfConvexShape; cdecl; external libcsfml_graphics;
function sfConvexShape_copy(shape: PsfConvexShape): PsfConvexShape; cdecl; external libcsfml_graphics;
procedure sfConvexShape_destroy(shape: PsfConvexShape); cdecl; external libcsfml_graphics;
procedure sfConvexShape_setPosition(shape: PsfConvexShape; position: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfConvexShape_setRotation(shape: PsfConvexShape; angle: single); cdecl; external libcsfml_graphics;
procedure sfConvexShape_setScale(shape: PsfConvexShape; scale: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfConvexShape_setOrigin(shape: PsfConvexShape; origin: TsfVector2f); cdecl; external libcsfml_graphics;
function sfConvexShape_getPosition(shape: PsfConvexShape): TsfVector2f; cdecl; external libcsfml_graphics;
function sfConvexShape_getRotation(shape: PsfConvexShape): single; cdecl; external libcsfml_graphics;
function sfConvexShape_getScale(shape: PsfConvexShape): TsfVector2f; cdecl; external libcsfml_graphics;
function sfConvexShape_getOrigin(shape: PsfConvexShape): TsfVector2f; cdecl; external libcsfml_graphics;
procedure sfConvexShape_move(shape: PsfConvexShape; offset: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfConvexShape_rotate(shape: PsfConvexShape; angle: single); cdecl; external libcsfml_graphics;
procedure sfConvexShape_scale(shape: PsfConvexShape; factors: TsfVector2f); cdecl; external libcsfml_graphics;
function sfConvexShape_getTransform(shape: PsfConvexShape): TsfTransform; cdecl; external libcsfml_graphics;
function sfConvexShape_getInverseTransform(shape: PsfConvexShape): TsfTransform; cdecl; external libcsfml_graphics;
procedure sfConvexShape_setTexture(shape: PsfConvexShape; texture: PsfTexture; resetRect: TsfBool); cdecl; external libcsfml_graphics;
procedure sfConvexShape_setTextureRect(shape: PsfConvexShape; rect: TsfIntRect); cdecl; external libcsfml_graphics;
procedure sfConvexShape_setFillColor(shape: PsfConvexShape; color: TsfColor); cdecl; external libcsfml_graphics;
procedure sfConvexShape_setOutlineColor(shape: PsfConvexShape; color: TsfColor); cdecl; external libcsfml_graphics;
procedure sfConvexShape_setOutlineThickness(shape: PsfConvexShape; thickness: single); cdecl; external libcsfml_graphics;
function sfConvexShape_getTexture(shape: PsfConvexShape): PsfTexture; cdecl; external libcsfml_graphics;
function sfConvexShape_getTextureRect(shape: PsfConvexShape): TsfIntRect; cdecl; external libcsfml_graphics;
function sfConvexShape_getFillColor(shape: PsfConvexShape): TsfColor; cdecl; external libcsfml_graphics;
function sfConvexShape_getOutlineColor(shape: PsfConvexShape): TsfColor; cdecl; external libcsfml_graphics;
function sfConvexShape_getOutlineThickness(shape: PsfConvexShape): single; cdecl; external libcsfml_graphics;
function sfConvexShape_getPointCount(shape: PsfConvexShape): Tsize_t; cdecl; external libcsfml_graphics;
function sfConvexShape_getPoint(shape: PsfConvexShape; index: Tsize_t): TsfVector2f; cdecl; external libcsfml_graphics;
procedure sfConvexShape_setPointCount(shape: PsfConvexShape; count: Tsize_t); cdecl; external libcsfml_graphics;
procedure sfConvexShape_setPoint(shape: PsfConvexShape; index: Tsize_t; point: TsfVector2f); cdecl; external libcsfml_graphics;
function sfConvexShape_getLocalBounds(shape: PsfConvexShape): TsfFloatRect; cdecl; external libcsfml_graphics;
function sfConvexShape_getGlobalBounds(shape: PsfConvexShape): TsfFloatRect; cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:55:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
