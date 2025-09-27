{$IFDEF read_interface}


type
  TGlFunctionPointer = procedure(para1: pointer); cdecl;

function sfContext_create: PsfContext; cdecl; external libcsfml_window;
procedure sfContext_destroy(context: PsfContext); cdecl; external libcsfml_window;
function sfContext_isExtensionAvailable(name: pchar): TsfBool; cdecl; external libcsfml_window;
function sfContext_setActive(context: PsfContext; active: TsfBool): TsfBool; cdecl; external libcsfml_window;
function sfContext_getFunction(name: pchar): TGlFunctionPointer; cdecl; external libcsfml_window;
function sfContext_getSettings(context: PsfContext): TsfContextSettings; cdecl; external libcsfml_window;
function sfContext_getActiveContextId: TsfUint64; cdecl; external libcsfml_window;

// === Konventiert am: 24-9-25 16:58:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
