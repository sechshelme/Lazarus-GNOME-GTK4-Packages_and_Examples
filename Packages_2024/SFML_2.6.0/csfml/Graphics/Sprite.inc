{$IFDEF read_interface}


function sfSprite_create: PsfSprite; cdecl; external libcsfml_graphics;
function sfSprite_copy(sprite: PsfSprite): PsfSprite; cdecl; external libcsfml_graphics;
procedure sfSprite_destroy(sprite: PsfSprite); cdecl; external libcsfml_graphics;
procedure sfSprite_setPosition(sprite: PsfSprite; position: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfSprite_setRotation(sprite: PsfSprite; angle: single); cdecl; external libcsfml_graphics;
procedure sfSprite_setScale(sprite: PsfSprite; scale: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfSprite_setOrigin(sprite: PsfSprite; origin: TsfVector2f); cdecl; external libcsfml_graphics;
function sfSprite_getPosition(sprite: PsfSprite): TsfVector2f; cdecl; external libcsfml_graphics;
function sfSprite_getRotation(sprite: PsfSprite): single; cdecl; external libcsfml_graphics;
function sfSprite_getScale(sprite: PsfSprite): TsfVector2f; cdecl; external libcsfml_graphics;
function sfSprite_getOrigin(sprite: PsfSprite): TsfVector2f; cdecl; external libcsfml_graphics;
procedure sfSprite_move(sprite: PsfSprite; offset: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfSprite_rotate(sprite: PsfSprite; angle: single); cdecl; external libcsfml_graphics;
procedure sfSprite_scale(sprite: PsfSprite; factors: TsfVector2f); cdecl; external libcsfml_graphics;
function sfSprite_getTransform(sprite: PsfSprite): TsfTransform; cdecl; external libcsfml_graphics;
function sfSprite_getInverseTransform(sprite: PsfSprite): TsfTransform; cdecl; external libcsfml_graphics;
procedure sfSprite_setTexture(sprite: PsfSprite; texture: PsfTexture; resetRect: TsfBool); cdecl; external libcsfml_graphics;
procedure sfSprite_setTextureRect(sprite: PsfSprite; rectangle: TsfIntRect); cdecl; external libcsfml_graphics;
procedure sfSprite_setColor(sprite: PsfSprite; color: TsfColor); cdecl; external libcsfml_graphics;
function sfSprite_getTexture(sprite: PsfSprite): PsfTexture; cdecl; external libcsfml_graphics;
function sfSprite_getTextureRect(sprite: PsfSprite): TsfIntRect; cdecl; external libcsfml_graphics;
function sfSprite_getColor(sprite: PsfSprite): TsfColor; cdecl; external libcsfml_graphics;
function sfSprite_getLocalBounds(sprite: PsfSprite): TsfFloatRect; cdecl; external libcsfml_graphics;
function sfSprite_getGlobalBounds(sprite: PsfSprite): TsfFloatRect; cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:55:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
