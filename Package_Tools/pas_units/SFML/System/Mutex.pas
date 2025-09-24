unit Mutex;

interface

uses
  fp_sfml, System_Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function sfMutex_create: PsfMutex; cdecl; external libsfml_system;
procedure sfMutex_destroy(mutex: PsfMutex); cdecl; external libsfml_system;
procedure sfMutex_lock(mutex: PsfMutex); cdecl; external libsfml_system;
procedure sfMutex_unlock(mutex: PsfMutex); cdecl; external libsfml_system;

// === Konventiert am: 24-9-25 16:57:25 ===


implementation



end.
