{$IFDEF read_interface}


const
  _GLIBTOP_INIT_STATE_INIT = $10000;
  _GLIBTOP_INIT_STATE_OPEN = $20000;
  _GLIBTOP_INIT_STATE_SERVER = $40000;
  _GLIBTOP_INIT_STATE_SYSDEPS = $80000;
  GLIBTOP_INIT_NO_OPEN = 1;
  GLIBTOP_INIT_NO_INIT = 2;
  GLIBTOP_FEATURES_NO_SERVER = 4;
  GLIBTOP_FEATURES_EXCEPT = 8;
  GLIBTOP_METHOD_DIRECT = 1;
  GLIBTOP_METHOD_PIPE = 2;
  GLIBTOP_METHOD_INET = 3;
  GLIBTOP_METHOD_UNIX = 4;
  GLIBTOP_ERROR_METHOD_IGNORE = 0;
  GLIBTOP_ERROR_METHOD_WARN_ONCE = 1;
  GLIBTOP_ERROR_METHOD_WARN = 2;
  GLIBTOP_ERROR_METHOD_ABORT = 3;
  GLIBTOP_ERROR_METHOD_DEFAULT = GLIBTOP_ERROR_METHOD_WARN_ONCE;

procedure glibtop_open_l(server: Pglibtop; program_name: pchar; features: dword; flags: dword); cdecl; external libgtop2;
procedure glibtop_init_p(server: Pglibtop; features: dword; flags: dword); cdecl; external libgtop2;
procedure glibtop_open_p(server: Pglibtop; program_name: pchar; features: dword; flags: dword); cdecl; external libgtop2;
procedure glibtop_open_s(server: Pglibtop; program_name: pchar; features: dword; flags: dword); cdecl; external libgtop2;


// === Konventiert am: 26-10-25 12:04:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
