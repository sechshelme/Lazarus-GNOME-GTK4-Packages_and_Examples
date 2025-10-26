{$IFDEF read_interface}


const
  GLIBTOP_PROC_TIME_START_TIME = 0;
  GLIBTOP_PROC_TIME_RTIME = 1;
  GLIBTOP_PROC_TIME_UTIME = 2;
  GLIBTOP_PROC_TIME_STIME = 3;
  GLIBTOP_PROC_TIME_CUTIME = 4;
  GLIBTOP_PROC_TIME_CSTIME = 5;
  GLIBTOP_PROC_TIME_TIMEOUT = 6;
  GLIBTOP_PROC_TIME_IT_REAL_VALUE = 7;
  GLIBTOP_PROC_TIME_FREQUENCY = 8;
  GLIBTOP_PROC_TIME_XCPU_UTIME = 9;
  GLIBTOP_PROC_TIME_XCPU_STIME = 10;
  GLIBTOP_MAX_PROC_TIME = 11;

type
  Tglibtop_proc_time = record
    flags: Tguint64;
    start_time: Tguint64;
    rtime: Tguint64;
    utime: Tguint64;
    stime: Tguint64;
    cutime: Tguint64;
    cstime: Tguint64;
    timeout: Tguint64;
    it_real_value: Tguint64;
    frequency: Tguint64;
    xcpu_utime: array[0..(GLIBTOP_NCPU) - 1] of Tguint64;
    xcpu_stime: array[0..(GLIBTOP_NCPU) - 1] of Tguint64;
  end;
  Pglibtop_proc_time = ^Tglibtop_proc_time;

procedure glibtop_get_proc_time(buf: Pglibtop_proc_time; pid: Tpid_t); cdecl; external libgtop2;

procedure glibtop_get_proc_time_r(server: Pglibtop; buf: Pglibtop_proc_time; pid: Tpid_t); cdecl; external libgtop2 name 'glibtop_get_proc_time_s';

procedure glibtop_get_proc_time_l(server: Pglibtop; buf: Pglibtop_proc_time; pid: Tpid_t); cdecl; external libgtop2;

procedure _glibtop_init_proc_time_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_proc_time_s(server: Pglibtop; buf: Pglibtop_proc_time; pid: Tpid_t); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
