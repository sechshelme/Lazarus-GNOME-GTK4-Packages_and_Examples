{$IFDEF read_interface}


type
  TThread_Create_Proc = procedure(para1: pointer); cdecl;

function sfThread_create(_function: TThread_Create_Proc; userData: pointer): PsfThread; cdecl; external libcsfml_system;
procedure sfThread_destroy(thread: PsfThread); cdecl; external libcsfml_system;
procedure sfThread_launch(thread: PsfThread); cdecl; external libcsfml_system;
procedure sfThread_wait(thread: PsfThread); cdecl; external libcsfml_system;
procedure sfThread_terminate(thread: PsfThread); cdecl; external libcsfml_system;

// === Konventiert am: 24-9-25 16:57:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
