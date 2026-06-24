{$IFDEF read_interface}


procedure g_on_error_query(prg_name: Pgchar); cdecl; external libglib2;
procedure g_on_error_stack_trace(prg_name: Pgchar); cdecl; external libglib2;

// === Konventiert am: 22-6-26 16:00:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
