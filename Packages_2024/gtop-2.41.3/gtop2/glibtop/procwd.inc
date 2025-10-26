{$IFDEF read_interface}


const
  GLIBTOP_PROC_WD_NUMBER = 0;
  GLIBTOP_PROC_WD_ROOT = 1;
  GLIBTOP_PROC_WD_EXE = 2;
  GLIBTOP_MAX_PROC_WD = 3;
  GLIBTOP_PROC_WD_ROOT_LEN = 215;
  GLIBTOP_PROC_WD_EXE_LEN = 215;

type
  Tglibtop_proc_wd = record
    flags: Tguint64;
    number: Tguint32;
    root: array[0..(GLIBTOP_PROC_WD_ROOT_LEN + 1) - 1] of char;
    exe: array[0..(GLIBTOP_PROC_WD_EXE_LEN + 1) - 1] of char;
  end;
  Pglibtop_proc_wd = ^Tglibtop_proc_wd;

function glibtop_get_proc_wd(buf: Pglibtop_proc_wd; pid: Tpid_t): Ppchar; cdecl; external libgtop2;
function glibtop_get_proc_wd_l(server: Pglibtop; buf: Pglibtop_proc_wd; pid: Tpid_t): Ppchar; cdecl; external libgtop2;

function glibtop_get_proc_wd_r(server: Pglibtop; buf: Pglibtop_proc_wd; pid: Tpid_t): Ppchar; cdecl; external libgtop2 name 'glibtop_get_proc_wd_s';

procedure _glibtop_init_proc_wd_s(server: Pglibtop); cdecl; external libgtop2;
function glibtop_get_proc_wd_s(server: Pglibtop; buf: Pglibtop_proc_wd; pid: Tpid_t): Ppchar; cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
