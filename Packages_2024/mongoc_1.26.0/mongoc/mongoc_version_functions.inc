

{$IFDEF read_function}
function mongoc_get_major_version: longint; cdecl; external libmongoc;
function mongoc_get_minor_version: longint; cdecl; external libmongoc;
function mongoc_get_micro_version: longint; cdecl; external libmongoc;
function mongoc_get_version: pchar; cdecl; external libmongoc;
function mongoc_check_version(required_major: longint; required_minor: longint; required_micro: longint): Boolean; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:14:11 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
