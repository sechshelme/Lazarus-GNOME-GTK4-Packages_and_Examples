{$IFDEF read_interface}


const
  GLIBTOP_PROC_SIGNAL_SIGNAL = 0;
  GLIBTOP_PROC_SIGNAL_BLOCKED = 1;
  GLIBTOP_PROC_SIGNAL_SIGIGNORE = 2;
  GLIBTOP_PROC_SIGNAL_SIGCATCH = 3;
  GLIBTOP_MAX_PROC_SIGNAL = 4;

type
  Tglibtop_proc_signal = record
    flags: Tguint64;
    signal: array[0..1] of Tguint64;
    blocked: array[0..1] of Tguint64;
    sigignore: array[0..1] of Tguint64;
    sigcatch: array[0..1] of Tguint64;
  end;
  Pglibtop_proc_signal = ^Tglibtop_proc_signal;

procedure glibtop_get_proc_signal(buf: Pglibtop_proc_signal; pid: Tpid_t); cdecl; external libgtop2;

procedure glibtop_get_proc_signal_r(server: Pglibtop; buf: Pglibtop_proc_signal; pid: Tpid_t); cdecl; external libgtop2 name 'glibtop_get_proc_signal_s';

procedure glibtop_get_proc_signal_l(server: Pglibtop; buf: Pglibtop_proc_signal; pid: Tpid_t); cdecl; external libgtop2;

procedure _glibtop_init_proc_signal_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_proc_signal_s(server: Pglibtop; buf: Pglibtop_proc_signal; pid: Tpid_t); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
