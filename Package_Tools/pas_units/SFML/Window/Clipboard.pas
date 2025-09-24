unit Clipboard;

interface

uses
  fp_sfml, Config;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function sfClipboard_getString: pchar; cdecl; external libsfml_window;
function sfClipboard_getUnicodeString: PsfUint32; cdecl; external libsfml_window;
procedure sfClipboard_setString(text: pchar); cdecl; external libsfml_window;
procedure sfClipboard_setUnicodeString(text: PsfUint32); cdecl; external libsfml_window;

// === Konventiert am: 24-9-25 16:58:32 ===


implementation



end.
