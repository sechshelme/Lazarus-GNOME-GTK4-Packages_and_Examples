unit Transformable;

interface

uses
  fp_sfml, Graphics_Types, Vector2, Transform;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function sfTransformable_create: PsfTransformable; cdecl; external libsfml_graphics;
function sfTransformable_copy(transformable: PsfTransformable): PsfTransformable; cdecl; external libsfml_graphics;
procedure sfTransformable_destroy(transformable: PsfTransformable); cdecl; external libsfml_graphics;
procedure sfTransformable_setPosition(transformable: PsfTransformable; position: TsfVector2f); cdecl; external libsfml_graphics;
procedure sfTransformable_setRotation(transformable: PsfTransformable; angle: single); cdecl; external libsfml_graphics;
procedure sfTransformable_setScale(transformable: PsfTransformable; scale: TsfVector2f); cdecl; external libsfml_graphics;
procedure sfTransformable_setOrigin(transformable: PsfTransformable; origin: TsfVector2f); cdecl; external libsfml_graphics;
function sfTransformable_getPosition(transformable: PsfTransformable): TsfVector2f; cdecl; external libsfml_graphics;
function sfTransformable_getRotation(transformable: PsfTransformable): single; cdecl; external libsfml_graphics;
function sfTransformable_getScale(transformable: PsfTransformable): TsfVector2f; cdecl; external libsfml_graphics;
function sfTransformable_getOrigin(transformable: PsfTransformable): TsfVector2f; cdecl; external libsfml_graphics;
procedure sfTransformable_move(transformable: PsfTransformable; offset: TsfVector2f); cdecl; external libsfml_graphics;
procedure sfTransformable_rotate(transformable: PsfTransformable; angle: single); cdecl; external libsfml_graphics;
procedure sfTransformable_scale(transformable: PsfTransformable; factors: TsfVector2f); cdecl; external libsfml_graphics;
function sfTransformable_getTransform(transformable: PsfTransformable): TsfTransform; cdecl; external libsfml_graphics;
function sfTransformable_getInverseTransform(transformable: PsfTransformable): TsfTransform; cdecl; external libsfml_graphics;

// === Konventiert am: 24-9-25 16:54:51 ===


implementation



end.
