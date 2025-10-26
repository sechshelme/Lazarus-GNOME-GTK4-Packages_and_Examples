{$IFDEF read_interface}


const
  GLIBTOP_PROC_UID_UID = 0;
  GLIBTOP_PROC_UID_EUID = 1;
  GLIBTOP_PROC_UID_GID = 2;
  GLIBTOP_PROC_UID_EGID = 3;
  GLIBTOP_PROC_UID_SUID = 4;
  GLIBTOP_PROC_UID_SGID = 5;
  GLIBTOP_PROC_UID_FSUID = 6;
  GLIBTOP_PROC_UID_FSGID = 7;
  GLIBTOP_PROC_UID_PID = 8;
  GLIBTOP_PROC_UID_PPID = 9;
  GLIBTOP_PROC_UID_PGRP = 10;
  GLIBTOP_PROC_UID_SESSION = 11;
  GLIBTOP_PROC_UID_TTY = 12;
  GLIBTOP_PROC_UID_TPGID = 13;
  GLIBTOP_PROC_UID_PRIORITY = 14;
  GLIBTOP_PROC_UID_NICE = 15;
  GLIBTOP_PROC_UID_NGROUPS = 16;
  GLIBTOP_PROC_UID_GROUPS = 17;
  GLIBTOP_MAX_PROC_UID = 18;

const
  GLIBTOP_MAX_GROUPS = 64;

type
  Pglibtop_proc_uid = ^Tglibtop_proc_uid;

  Tglibtop_proc_uid = record
    flags: Tguint64;
    uid: Tgint32;
    euid: Tgint32;
    gid: Tgint32;
    egid: Tgint32;
    suid: Tgint32;
    sgid: Tgint32;
    fsuid: Tgint32;
    fsgid: Tgint32;
    pid: Tgint32;
    ppid: Tgint32;
    pgrp: Tgint32;
    session: Tgint32;
    tty: Tgint32;
    tpgid: Tgint32;
    priority: Tgint32;
    nice: Tgint32;
    ngroups: Tgint32;
    groups: array[0..(GLIBTOP_MAX_GROUPS) - 1] of Tgint32;
  end;

procedure glibtop_get_proc_uid(buf: Pglibtop_proc_uid; pid: Tpid_t); cdecl; external libgtop2;

procedure glibtop_get_proc_uid_r(server: Pglibtop; buf: Pglibtop_proc_uid; pid: Tpid_t); cdecl; external libgtop2 name 'glibtop_get_proc_uid_s';

procedure glibtop_get_proc_uid_l(server: Pglibtop; buf: Pglibtop_proc_uid; pid: Tpid_t); cdecl; external libgtop2;

procedure _glibtop_init_proc_uid_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_proc_uid_s(server: Pglibtop; buf: Pglibtop_proc_uid; pid: Tpid_t); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
