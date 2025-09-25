unit Transform;

interface

uses
  fp_sfml, Config, Vector2, Rect;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TsfTransform = record
    matrix: array[0..8] of single;
  end;
  PsfTransform = ^TsfTransform;

var
  sfTransform_Identity: TsfTransform; cvar;external libsfml_graphics;

function sfTransform_fromMatrix(a00: single; a01: single; a02: single; a10: single; a11: single; a12: single; a20: single; a21: single; a22: single): TsfTransform; cdecl; external libsfml_graphics;
procedure sfTransform_getMatrix(transform: PsfTransform; matrix: Psingle); cdecl; external libsfml_graphics;
function sfTransform_getInverse(transform: PsfTransform): TsfTransform; cdecl; external libsfml_graphics;
function sfTransform_transformPoint(transform: PsfTransform; point: TsfVector2f): TsfVector2f; cdecl; external libsfml_graphics;
function sfTransform_transformRect(transform: PsfTransform; rectangle: TsfFloatRect): TsfFloatRect; cdecl; external libsfml_graphics;
procedure sfTransform_combine(transform: PsfTransform; other: PsfTransform); cdecl; external libsfml_graphics;
procedure sfTransform_translate(transform: PsfTransform; x: single; y: single); cdecl; external libsfml_graphics;
procedure sfTransform_rotate(transform: PsfTransform; angle: single); cdecl; external libsfml_graphics;
procedure sfTransform_rotateWithCenter(transform: PsfTransform; angle: single; centerX: single; centerY: single); cdecl; external libsfml_graphics;
procedure sfTransform_scale(transform: PsfTransform; scaleX: single; scaleY: single); cdecl; external libsfml_graphics;
procedure sfTransform_scaleWithCenter(transform: PsfTransform; scaleX: single; scaleY: single; centerX: single; centerY: single); cdecl; external libsfml_graphics;
function sfTransform_equal(left: PsfTransform; right: PsfTransform): TsfBool; cdecl; external libsfml_graphics;

// === Konventiert am: 24-9-25 16:54:53 ===


implementation



end.
