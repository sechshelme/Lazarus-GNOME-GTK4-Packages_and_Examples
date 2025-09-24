unit Buffer;

interface

uses
  fp_sfml, Config, System_Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function sfBuffer_create: PsfBuffer; cdecl; external libsfml_system;
procedure sfBuffer_destroy(buffer: PsfBuffer); cdecl; external libsfml_system;
function sfBuffer_getSize(buffer: PsfBuffer): Tsize_t; cdecl; external libsfml_system;
function sfBuffer_getData(buffer: PsfBuffer): PsfUint8; cdecl; external libsfml_system;

// === Konventiert am: 24-9-25 16:57:32 ===


implementation



end.
