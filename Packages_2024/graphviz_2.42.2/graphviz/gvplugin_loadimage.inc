{$IFDEF read_interface}



function gvusershape_file_access(us: Pusershape_t): boolean; cdecl; external libgvc;
procedure gvusershape_file_release(us: Pusershape_t); cdecl; external libgvc;

// === Konventiert am: 3-12-25 15:07:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
