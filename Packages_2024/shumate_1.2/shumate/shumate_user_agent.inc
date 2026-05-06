{$IFDEF read_interface}


function shumate_get_user_agent: pchar; cdecl; external libshumate;
procedure shumate_set_user_agent(new_user_agent: pchar); cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:48:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
