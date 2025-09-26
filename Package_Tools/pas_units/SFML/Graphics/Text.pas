unit Text;

interface

uses
  fp_sfml, Config, Color, Rect, Vector2, Graphics_Types, Transform;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PsfTextStyle = ^TsfTextStyle;
  TsfTextStyle = longint;

const
  sfTextRegular = 0;
  sfTextBold = 1 shl 0;
  sfTextItalic = 1 shl 1;
  sfTextUnderlined = 1 shl 2;
  sfTextStrikeThrough = 1 shl 3;

function sfText_create: PsfText; cdecl; external libsfml_graphics;
function sfText_copy(text: PsfText): PsfText; cdecl; external libsfml_graphics;
procedure sfText_destroy(text: PsfText); cdecl; external libsfml_graphics;
procedure sfText_setPosition(text: PsfText; position: TsfVector2f); cdecl; external libsfml_graphics;
procedure sfText_setRotation(text: PsfText; angle: single); cdecl; external libsfml_graphics;
procedure sfText_setScale(text: PsfText; scale: TsfVector2f); cdecl; external libsfml_graphics;
procedure sfText_setOrigin(text: PsfText; origin: TsfVector2f); cdecl; external libsfml_graphics;
function sfText_getPosition(text: PsfText): TsfVector2f; cdecl; external libsfml_graphics;
function sfText_getRotation(text: PsfText): single; cdecl; external libsfml_graphics;
function sfText_getScale(text: PsfText): TsfVector2f; cdecl; external libsfml_graphics;
function sfText_getOrigin(text: PsfText): TsfVector2f; cdecl; external libsfml_graphics;
procedure sfText_move(text: PsfText; offset: TsfVector2f); cdecl; external libsfml_graphics;
procedure sfText_rotate(text: PsfText; angle: single); cdecl; external libsfml_graphics;
procedure sfText_scale(text: PsfText; factors: TsfVector2f); cdecl; external libsfml_graphics;
function sfText_getTransform(text: PsfText): TsfTransform; cdecl; external libsfml_graphics;
function sfText_getInverseTransform(text: PsfText): TsfTransform; cdecl; external libsfml_graphics;
procedure sfText_setString(text: PsfText; _string: pchar); cdecl; external libsfml_graphics;
procedure sfText_setUnicodeString(text: PsfText; _string: PsfUint32); cdecl; external libsfml_graphics;
procedure sfText_setFont(text: PsfText; font: PsfFont); cdecl; external libsfml_graphics;
procedure sfText_setCharacterSize(text: PsfText; size: dword); cdecl; external libsfml_graphics;
procedure sfText_setLineSpacing(text: PsfText; spacingFactor: single); cdecl; external libsfml_graphics;
procedure sfText_setLetterSpacing(text: PsfText; spacingFactor: single); cdecl; external libsfml_graphics;
procedure sfText_setStyle(text: PsfText; style: TsfUint32); cdecl; external libsfml_graphics;
procedure sfText_setColor(text: PsfText; color: TsfColor); cdecl; external libsfml_graphics;
procedure sfText_setFillColor(text: PsfText; color: TsfColor); cdecl; external libsfml_graphics;
procedure sfText_setOutlineColor(text: PsfText; color: TsfColor); cdecl; external libsfml_graphics;
procedure sfText_setOutlineThickness(text: PsfText; thickness: single); cdecl; external libsfml_graphics;
function sfText_getString(text: PsfText): pchar; cdecl; external libsfml_graphics;
function sfText_getUnicodeString(text: PsfText): PsfUint32; cdecl; external libsfml_graphics;
function sfText_getFont(text: PsfText): PsfFont; cdecl; external libsfml_graphics;
function sfText_getCharacterSize(text: PsfText): dword; cdecl; external libsfml_graphics;
function sfText_getLetterSpacing(text: PsfText): single; cdecl; external libsfml_graphics;
function sfText_getLineSpacing(text: PsfText): single; cdecl; external libsfml_graphics;
function sfText_getStyle(text: PsfText): TsfUint32; cdecl; external libsfml_graphics;
function sfText_getColor(text: PsfText): TsfColor; cdecl; external libsfml_graphics;
function sfText_getFillColor(text: PsfText): TsfColor; cdecl; external libsfml_graphics;
function sfText_getOutlineColor(text: PsfText): TsfColor; cdecl; external libsfml_graphics;
function sfText_getOutlineThickness(text: PsfText): single; cdecl; external libsfml_graphics;
function sfText_findCharacterPos(text: PsfText; index: Tsize_t): TsfVector2f; cdecl; external libsfml_graphics;
function sfText_getLocalBounds(text: PsfText): TsfFloatRect; cdecl; external libsfml_graphics;
function sfText_getGlobalBounds(text: PsfText): TsfFloatRect; cdecl; external libsfml_graphics;

// === Konventiert am: 24-9-25 16:54:58 ===


implementation



end.
