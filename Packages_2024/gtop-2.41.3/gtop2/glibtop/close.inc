{$IFDEF read_interface}



procedure glibtop_close; cdecl; external libgtop2;
procedure glibtop_close_r(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_close_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_close_p(server: Pglibtop); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:05:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
