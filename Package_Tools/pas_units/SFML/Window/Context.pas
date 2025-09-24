unit Context;

interface

uses
  fp_sfml, Config, Window_Types, Window;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGlFunctionPointer = procedure(para1: pointer); cdecl;

function sfContext_create: PsfContext; cdecl; external libsfml_window;
procedure sfContext_destroy(context: PsfContext); cdecl; external libsfml_window;
function sfContext_isExtensionAvailable(name: pchar): TsfBool; cdecl; external libsfml_window;
function sfContext_setActive(context: PsfContext; active: TsfBool): TsfBool; cdecl; external libsfml_window;
function sfContext_getFunction(name: pchar): TGlFunctionPointer; cdecl; external libsfml_window;
function sfContext_getSettings(context: PsfContext): TsfContextSettings; cdecl; external libsfml_window;
function sfContext_getActiveContextId: TsfUint64; cdecl; external libsfml_window;

// === Konventiert am: 24-9-25 16:58:29 ===


implementation



end.
