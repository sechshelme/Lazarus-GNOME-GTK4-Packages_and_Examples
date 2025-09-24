unit Cursor;

interface

uses
  fp_sfml, Config, Vector2, Window_Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PsfCursorType = ^TsfCursorType;
  TsfCursorType = longint;

const
  sfCursorArrow = 0;
  sfCursorArrowWait = 1;
  sfCursorWait = 2;
  sfCursorText = 3;
  sfCursorHand = 4;
  sfCursorSizeHorizontal = 5;
  sfCursorSizeVertical = 6;
  sfCursorSizeTopLeftBottomRight = 7;
  sfCursorSizeBottomLeftTopRight = 8;
  sfCursorSizeLeft = 9;
  sfCursorSizeRight = 10;
  sfCursorSizeTop = 11;
  sfCursorSizeBottom = 12;
  sfCursorSizeTopLeft = 13;
  sfCursorSizeBottomRight = 14;
  sfCursorSizeBottomLeft = 15;
  sfCursorSizeTopRight = 16;
  sfCursorSizeAll = 17;
  sfCursorCross = 18;
  sfCursorHelp = 19;
  sfCursorNotAllowed = 20;

function sfCursor_createFromPixels(pixels: PsfUint8; size: TsfVector2u; hotspot: TsfVector2u): PsfCursor; cdecl; external libsfml_window;
function sfCursor_createFromSystem(_type: TsfCursorType): PsfCursor; cdecl; external libsfml_window;
procedure sfCursor_destroy(cursor: PsfCursor); cdecl; external libsfml_window;

// === Konventiert am: 24-9-25 16:58:26 ===


implementation



end.
