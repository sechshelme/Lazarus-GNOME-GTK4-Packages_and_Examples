{$IFDEF read_interface}


type
  TsfShapeGetPointCountCallback = function(para1: pointer): Tsize_t; cdecl;
  TsfShapeGetPointCallback = function(para1: Tsize_t; para2: pointer): TsfVector2f; cdecl;

function sfShape_create(getPointCount: TsfShapeGetPointCountCallback; getPoint: TsfShapeGetPointCallback; userData: pointer): PsfShape; cdecl; external libcsfml_graphics;
procedure sfShape_destroy(shape: PsfShape); cdecl; external libcsfml_graphics;
procedure sfShape_setPosition(shape: PsfShape; position: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfShape_setRotation(shape: PsfShape; angle: single); cdecl; external libcsfml_graphics;
procedure sfShape_setScale(shape: PsfShape; scale: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfShape_setOrigin(shape: PsfShape; origin: TsfVector2f); cdecl; external libcsfml_graphics;
function sfShape_getPosition(shape: PsfShape): TsfVector2f; cdecl; external libcsfml_graphics;
function sfShape_getRotation(shape: PsfShape): single; cdecl; external libcsfml_graphics;
function sfShape_getScale(shape: PsfShape): TsfVector2f; cdecl; external libcsfml_graphics;
function sfShape_getOrigin(shape: PsfShape): TsfVector2f; cdecl; external libcsfml_graphics;
procedure sfShape_move(shape: PsfShape; offset: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfShape_rotate(shape: PsfShape; angle: single); cdecl; external libcsfml_graphics;
procedure sfShape_scale(shape: PsfShape; factors: TsfVector2f); cdecl; external libcsfml_graphics;
function sfShape_getTransform(shape: PsfShape): TsfTransform; cdecl; external libcsfml_graphics;
function sfShape_getInverseTransform(shape: PsfShape): TsfTransform; cdecl; external libcsfml_graphics;
procedure sfShape_setTexture(shape: PsfShape; texture: PsfTexture; resetRect: TsfBool); cdecl; external libcsfml_graphics;
procedure sfShape_setTextureRect(shape: PsfShape; rect: TsfIntRect); cdecl; external libcsfml_graphics;
procedure sfShape_setFillColor(shape: PsfShape; color: TsfColor); cdecl; external libcsfml_graphics;
procedure sfShape_setOutlineColor(shape: PsfShape; color: TsfColor); cdecl; external libcsfml_graphics;
procedure sfShape_setOutlineThickness(shape: PsfShape; thickness: single); cdecl; external libcsfml_graphics;
function sfShape_getTexture(shape: PsfShape): PsfTexture; cdecl; external libcsfml_graphics;
function sfShape_getTextureRect(shape: PsfShape): TsfIntRect; cdecl; external libcsfml_graphics;
function sfShape_getFillColor(shape: PsfShape): TsfColor; cdecl; external libcsfml_graphics;
function sfShape_getOutlineColor(shape: PsfShape): TsfColor; cdecl; external libcsfml_graphics;
function sfShape_getOutlineThickness(shape: PsfShape): single; cdecl; external libcsfml_graphics;
function sfShape_getPointCount(shape: PsfShape): Tsize_t; cdecl; external libcsfml_graphics;
function sfShape_getPoint(shape: PsfShape; index: Tsize_t): TsfVector2f; cdecl; external libcsfml_graphics;
function sfShape_getLocalBounds(shape: PsfShape): TsfFloatRect; cdecl; external libcsfml_graphics;
function sfShape_getGlobalBounds(shape: PsfShape): TsfFloatRect; cdecl; external libcsfml_graphics;
procedure sfShape_update(shape: PsfShape); cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:55:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
