unit Rect;

interface

uses
  fp_sfml, Config, Vector2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TsfFloatRect = record
    left: single;
    top: single;
    width: single;
    height: single;
  end;
  PsfFloatRect = ^TsfFloatRect;

  TsfIntRect = record
    left: longint;
    top: longint;
    width: longint;
    height: longint;
  end;
  PsfIntRect = ^TsfIntRect;

function sfFloatRect_contains(rect: PsfFloatRect; x: single; y: single): TsfBool; cdecl; external libsfml_graphics;
function sfIntRect_contains(rect: PsfIntRect; x: longint; y: longint): TsfBool; cdecl; external libsfml_graphics;
function sfFloatRect_intersects(rect1: PsfFloatRect; rect2: PsfFloatRect; intersection: PsfFloatRect): TsfBool; cdecl; external libsfml_graphics;
function sfIntRect_intersects(rect1: PsfIntRect; rect2: PsfIntRect; intersection: PsfIntRect): TsfBool; cdecl; external libsfml_graphics;
function sfFloatRect_getPosition(rect: PsfFloatRect): TsfVector2f; cdecl; external libsfml_graphics;
function sfIntRect_getPosition(rect: PsfIntRect): TsfVector2i; cdecl; external libsfml_graphics;
function sfFloatRect_getSize(rect: PsfFloatRect): TsfVector2f; cdecl; external libsfml_graphics;
function sfIntRect_getSize(rect: PsfIntRect): TsfVector2i; cdecl; external libsfml_graphics;

// === Konventiert am: 24-9-25 16:55:21 ===


implementation



end.
