unit Sprite;

interface

uses
  fp_sfml, Config, Transform, Rect, Color, Vector2, Graphics_Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function sfSprite_create: PsfSprite; cdecl; external libsfml_graphics;
function sfSprite_copy(sprite: PsfSprite): PsfSprite; cdecl; external libsfml_graphics;
procedure sfSprite_destroy(sprite: PsfSprite); cdecl; external libsfml_graphics;
procedure sfSprite_setPosition(sprite: PsfSprite; position: TsfVector2f); cdecl; external libsfml_graphics;
procedure sfSprite_setRotation(sprite: PsfSprite; angle: single); cdecl; external libsfml_graphics;
procedure sfSprite_setScale(sprite: PsfSprite; scale: TsfVector2f); cdecl; external libsfml_graphics;
procedure sfSprite_setOrigin(sprite: PsfSprite; origin: TsfVector2f); cdecl; external libsfml_graphics;
function sfSprite_getPosition(sprite: PsfSprite): TsfVector2f; cdecl; external libsfml_graphics;
function sfSprite_getRotation(sprite: PsfSprite): single; cdecl; external libsfml_graphics;
function sfSprite_getScale(sprite: PsfSprite): TsfVector2f; cdecl; external libsfml_graphics;
function sfSprite_getOrigin(sprite: PsfSprite): TsfVector2f; cdecl; external libsfml_graphics;
procedure sfSprite_move(sprite: PsfSprite; offset: TsfVector2f); cdecl; external libsfml_graphics;
procedure sfSprite_rotate(sprite: PsfSprite; angle: single); cdecl; external libsfml_graphics;
procedure sfSprite_scale(sprite: PsfSprite; factors: TsfVector2f); cdecl; external libsfml_graphics;
function sfSprite_getTransform(sprite: PsfSprite): TsfTransform; cdecl; external libsfml_graphics;
function sfSprite_getInverseTransform(sprite: PsfSprite): TsfTransform; cdecl; external libsfml_graphics;
procedure sfSprite_setTexture(sprite: PsfSprite; texture: PsfTexture; resetRect: TsfBool); cdecl; external libsfml_graphics;
procedure sfSprite_setTextureRect(sprite: PsfSprite; rectangle: TsfIntRect); cdecl; external libsfml_graphics;
procedure sfSprite_setColor(sprite: PsfSprite; color: TsfColor); cdecl; external libsfml_graphics;
function sfSprite_getTexture(sprite: PsfSprite): PsfTexture; cdecl; external libsfml_graphics;
function sfSprite_getTextureRect(sprite: PsfSprite): TsfIntRect; cdecl; external libsfml_graphics;
function sfSprite_getColor(sprite: PsfSprite): TsfColor; cdecl; external libsfml_graphics;
function sfSprite_getLocalBounds(sprite: PsfSprite): TsfFloatRect; cdecl; external libsfml_graphics;
function sfSprite_getGlobalBounds(sprite: PsfSprite): TsfFloatRect; cdecl; external libsfml_graphics;

// === Konventiert am: 24-9-25 16:55:01 ===


implementation



end.
