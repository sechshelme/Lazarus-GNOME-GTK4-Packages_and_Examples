unit proclist;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_PROCLIST_NUMBER = 0;
  GLIBTOP_PROCLIST_TOTAL = 1;
  GLIBTOP_PROCLIST_SIZE = 2;
  GLIBTOP_MAX_PROCLIST = 3;

  GLIBTOP_KERN_PROC_ALL = 0;
  GLIBTOP_KERN_PROC_PID = 1;
  GLIBTOP_KERN_PROC_PGRP = 2;
  GLIBTOP_KERN_PROC_SESSION = 3;
  GLIBTOP_KERN_PROC_TTY = 4;
  GLIBTOP_KERN_PROC_UID = 5;
  GLIBTOP_KERN_PROC_RUID = 6;
  GLIBTOP_KERN_PROC_MASK = 15;

  GLIBTOP_EXCLUDE_IDLE = $1000;
  GLIBTOP_EXCLUDE_SYSTEM = $2000;
  GLIBTOP_EXCLUDE_NOTTY = $4000;

type
  Tglibtop_proclist = record
    flags: Tguint64;
    number: Tguint64;
    total: Tguint64;
    size: Tguint64;
  end;
  Pglibtop_proclist = ^Tglibtop_proclist;

function glibtop_get_proclist(buf: Pglibtop_proclist; which: Tgint64; arg: Tgint64): Ppid_t; cdecl; external libgtop2;

function glibtop_get_proclist_r(server: Pglibtop; buf: Pglibtop_proclist; which: Tgint64; arg: Tgint64): Ppid_t; cdecl; external libgtop2 name 'glibtop_get_proclist_s';

function glibtop_get_proclist_l(server: Pglibtop; buf: Pglibtop_proclist; which: Tgint64; arg: Tgint64): Ppid_t; cdecl; external libgtop2;

procedure _glibtop_init_proclist_s(server: Pglibtop); cdecl; external libgtop2;
function glibtop_get_proclist_s(server: Pglibtop; buf: Pglibtop_proclist; which: Tgint64; arg: Tgint64): Ppid_t; cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:35 ===


implementation



end.
