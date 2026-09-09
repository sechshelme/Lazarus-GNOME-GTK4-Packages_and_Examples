{$IFDEF read_interface}


function xrl_strdup(str: pchar): pchar; cdecl; external libxrl;
function xrl_strndup(str: pchar; len: Tsize_t): pchar; cdecl; external libxrl;
function xrl_malloc(size: Tsize_t): pointer; cdecl; external libxrl;

// === Konventiert am: 8-9-26 17:31:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
