unit Touch;

interface

uses
  fp_sfml, Config, System_Types, Vector2, Window_Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function sfTouch_isDown(finger: dword): TsfBool; cdecl; external libsfml_window;
function sfTouch_getPosition(finger: dword; relativeTo: PsfWindow): TsfVector2i; cdecl; external libsfml_window;

// === Konventiert am: 24-9-25 16:58:06 ===


implementation



end.
