{$IFDEF read_interface}


function Read_ParamNames(in_: PFILE; m: longint): Ppchar; cdecl; external libpolylib;
procedure Free_ParamNames(params: PPchar; m: longint); cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:36:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
