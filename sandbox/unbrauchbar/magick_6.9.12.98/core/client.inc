{$IFDEF read_interface}



function GetClientPath: pchar; cdecl; external libmagickcore;
function GetClientName: pchar; cdecl; external libmagickcore;
function SetClientName(para1: pchar): pchar; cdecl; external libmagickcore;
function SetClientPath(para1: pchar): pchar; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:23:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
