{$IFDEF read_interface}


function sfRectangleShape_create: PsfRectangleShape; cdecl; external libcsfml_graphics;
function sfRectangleShape_copy(shape: PsfRectangleShape): PsfRectangleShape; cdecl; external libcsfml_graphics;
procedure sfRectangleShape_destroy(shape: PsfRectangleShape); cdecl; external libcsfml_graphics;
procedure sfRectangleShape_setPosition(shape: PsfRectangleShape; position: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfRectangleShape_setRotation(shape: PsfRectangleShape; angle: single); cdecl; external libcsfml_graphics;
procedure sfRectangleShape_setScale(shape: PsfRectangleShape; scale: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfRectangleShape_setOrigin(shape: PsfRectangleShape; origin: TsfVector2f); cdecl; external libcsfml_graphics;
function sfRectangleShape_getPosition(shape: PsfRectangleShape): TsfVector2f; cdecl; external libcsfml_graphics;
function sfRectangleShape_getRotation(shape: PsfRectangleShape): single; cdecl; external libcsfml_graphics;
function sfRectangleShape_getScale(shape: PsfRectangleShape): TsfVector2f; cdecl; external libcsfml_graphics;
function sfRectangleShape_getOrigin(shape: PsfRectangleShape): TsfVector2f; cdecl; external libcsfml_graphics;
procedure sfRectangleShape_move(shape: PsfRectangleShape; offset: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfRectangleShape_rotate(shape: PsfRectangleShape; angle: single); cdecl; external libcsfml_graphics;
procedure sfRectangleShape_scale(shape: PsfRectangleShape; factors: TsfVector2f); cdecl; external libcsfml_graphics;
function sfRectangleShape_getTransform(shape: PsfRectangleShape): TsfTransform; cdecl; external libcsfml_graphics;
function sfRectangleShape_getInverseTransform(shape: PsfRectangleShape): TsfTransform; cdecl; external libcsfml_graphics;
procedure sfRectangleShape_setTexture(shape: PsfRectangleShape; texture: PsfTexture; resetRect: TsfBool); cdecl; external libcsfml_graphics;
procedure sfRectangleShape_setTextureRect(shape: PsfRectangleShape; rect: TsfIntRect); cdecl; external libcsfml_graphics;
procedure sfRectangleShape_setFillColor(shape: PsfRectangleShape; color: TsfColor); cdecl; external libcsfml_graphics;
procedure sfRectangleShape_setOutlineColor(shape: PsfRectangleShape; color: TsfColor); cdecl; external libcsfml_graphics;
procedure sfRectangleShape_setOutlineThickness(shape: PsfRectangleShape; thickness: single); cdecl; external libcsfml_graphics;
function sfRectangleShape_getTexture(shape: PsfRectangleShape): PsfTexture; cdecl; external libcsfml_graphics;
function sfRectangleShape_getTextureRect(shape: PsfRectangleShape): TsfIntRect; cdecl; external libcsfml_graphics;
function sfRectangleShape_getFillColor(shape: PsfRectangleShape): TsfColor; cdecl; external libcsfml_graphics;
function sfRectangleShape_getOutlineColor(shape: PsfRectangleShape): TsfColor; cdecl; external libcsfml_graphics;
function sfRectangleShape_getOutlineThickness(shape: PsfRectangleShape): single; cdecl; external libcsfml_graphics;
function sfRectangleShape_getPointCount(shape: PsfRectangleShape): Tsize_t; cdecl; external libcsfml_graphics;
function sfRectangleShape_getPoint(shape: PsfRectangleShape; index: Tsize_t): TsfVector2f; cdecl; external libcsfml_graphics;
procedure sfRectangleShape_setSize(shape: PsfRectangleShape; size: TsfVector2f); cdecl; external libcsfml_graphics;
function sfRectangleShape_getSize(shape: PsfRectangleShape): TsfVector2f; cdecl; external libcsfml_graphics;
function sfRectangleShape_getLocalBounds(shape: PsfRectangleShape): TsfFloatRect; cdecl; external libcsfml_graphics;
function sfRectangleShape_getGlobalBounds(shape: PsfRectangleShape): TsfFloatRect; cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:55:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
