unit Clock;

interface

uses
  fp_sfml, Time, System_Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function sfClock_create: PsfClock; cdecl; external libsfml_system;
function sfClock_copy(clock: PsfClock): PsfClock; cdecl; external libsfml_system;
procedure sfClock_destroy(clock: PsfClock); cdecl; external libsfml_system;
function sfClock_getElapsedTime(clock: PsfClock): TsfTime; cdecl; external libsfml_system;
function sfClock_restart(clock: PsfClock): TsfTime; cdecl; external libsfml_system;

// === Konventiert am: 24-9-25 16:57:30 ===


implementation



end.
