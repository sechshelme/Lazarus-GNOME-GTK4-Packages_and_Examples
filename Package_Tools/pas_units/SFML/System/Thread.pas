unit Thread;

interface

uses
  fp_sfml, System_Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TThread_Create_Proc = procedure(para1: pointer);

function sfThread_create(_function: TThread_Create_Proc; userData: pointer): PsfThread; cdecl; external libsfml_system;
procedure sfThread_destroy(thread: PsfThread); cdecl; external libsfml_system;
procedure sfThread_launch(thread: PsfThread); cdecl; external libsfml_system;
procedure sfThread_wait(thread: PsfThread); cdecl; external libsfml_system;
procedure sfThread_terminate(thread: PsfThread); cdecl; external libsfml_system;

// === Konventiert am: 24-9-25 16:57:16 ===


implementation



end.
