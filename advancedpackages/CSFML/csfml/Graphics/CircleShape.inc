{$IFDEF read_interface}


function sfCircleShape_create: PsfCircleShape; cdecl; external libcsfml_graphics;
function sfCircleShape_copy(shape: PsfCircleShape): PsfCircleShape; cdecl; external libcsfml_graphics;
procedure sfCircleShape_destroy(shape: PsfCircleShape); cdecl; external libcsfml_graphics;
procedure sfCircleShape_setPosition(shape: PsfCircleShape; position: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfCircleShape_setRotation(shape: PsfCircleShape; angle: single); cdecl; external libcsfml_graphics;
procedure sfCircleShape_setScale(shape: PsfCircleShape; scale: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfCircleShape_setOrigin(shape: PsfCircleShape; origin: TsfVector2f); cdecl; external libcsfml_graphics;
function sfCircleShape_getPosition(shape: PsfCircleShape): TsfVector2f; cdecl; external libcsfml_graphics;
function sfCircleShape_getRotation(shape: PsfCircleShape): single; cdecl; external libcsfml_graphics;
function sfCircleShape_getScale(shape: PsfCircleShape): TsfVector2f; cdecl; external libcsfml_graphics;
function sfCircleShape_getOrigin(shape: PsfCircleShape): TsfVector2f; cdecl; external libcsfml_graphics;
procedure sfCircleShape_move(shape: PsfCircleShape; offset: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfCircleShape_rotate(shape: PsfCircleShape; angle: single); cdecl; external libcsfml_graphics;
procedure sfCircleShape_scale(shape: PsfCircleShape; factors: TsfVector2f); cdecl; external libcsfml_graphics;
function sfCircleShape_getTransform(shape: PsfCircleShape): TsfTransform; cdecl; external libcsfml_graphics;
function sfCircleShape_getInverseTransform(shape: PsfCircleShape): TsfTransform; cdecl; external libcsfml_graphics;
procedure sfCircleShape_setTexture(shape: PsfCircleShape; texture: PsfTexture; resetRect: TsfBool); cdecl; external libcsfml_graphics;
procedure sfCircleShape_setTextureRect(shape: PsfCircleShape; rect: TsfIntRect); cdecl; external libcsfml_graphics;
procedure sfCircleShape_setFillColor(shape: PsfCircleShape; color: TsfColor); cdecl; external libcsfml_graphics;
procedure sfCircleShape_setOutlineColor(shape: PsfCircleShape; color: TsfColor); cdecl; external libcsfml_graphics;
procedure sfCircleShape_setOutlineThickness(shape: PsfCircleShape; thickness: single); cdecl; external libcsfml_graphics;
function sfCircleShape_getTexture(shape: PsfCircleShape): PsfTexture; cdecl; external libcsfml_graphics;
function sfCircleShape_getTextureRect(shape: PsfCircleShape): TsfIntRect; cdecl; external libcsfml_graphics;
function sfCircleShape_getFillColor(shape: PsfCircleShape): TsfColor; cdecl; external libcsfml_graphics;
function sfCircleShape_getOutlineColor(shape: PsfCircleShape): TsfColor; cdecl; external libcsfml_graphics;
function sfCircleShape_getOutlineThickness(shape: PsfCircleShape): single; cdecl; external libcsfml_graphics;
function sfCircleShape_getPointCount(shape: PsfCircleShape): Tsize_t; cdecl; external libcsfml_graphics;
function sfCircleShape_getPoint(shape: PsfCircleShape; index: Tsize_t): TsfVector2f; cdecl; external libcsfml_graphics;
procedure sfCircleShape_setRadius(shape: PsfCircleShape; radius: single); cdecl; external libcsfml_graphics;
function sfCircleShape_getRadius(shape: PsfCircleShape): single; cdecl; external libcsfml_graphics;
procedure sfCircleShape_setPointCount(shape: PsfCircleShape; count: Tsize_t); cdecl; external libcsfml_graphics;
function sfCircleShape_getLocalBounds(shape: PsfCircleShape): TsfFloatRect; cdecl; external libcsfml_graphics;
function sfCircleShape_getGlobalBounds(shape: PsfCircleShape): TsfFloatRect; cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:55:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
