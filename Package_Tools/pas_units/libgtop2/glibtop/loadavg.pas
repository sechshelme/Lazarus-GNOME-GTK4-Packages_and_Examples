unit loadavg;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_LOADAVG_LOADAVG = 0;
  GLIBTOP_LOADAVG_NR_RUNNING = 1;
  GLIBTOP_LOADAVG_NR_TASKS = 2;
  GLIBTOP_LOADAVG_LAST_PID = 3;
  GLIBTOP_MAX_LOADAVG = 4;

type
  Tglibtop_loadavg = record
    flags: Tguint64;
    loadavg: array[0..2] of double;
    nr_running: Tguint64;
    nr_tasks: Tguint64;
    last_pid: Tguint64;
  end;
  Pglibtop_loadavg = ^Tglibtop_loadavg;

procedure glibtop_get_loadavg(buf: Pglibtop_loadavg); cdecl; external libgtop2;

procedure glibtop_get_loadavg_r(server: Pglibtop; buf: Pglibtop_loadavg); cdecl; external libgtop2 name 'glibtop_get_loadavg_s';

procedure glibtop_get_loadavg_l(server: Pglibtop; buf: Pglibtop_loadavg); cdecl; external libgtop2;

procedure _glibtop_init_loadavg_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_loadavg_s(server: Pglibtop; buf: Pglibtop_loadavg); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:05:20 ===


implementation



end.
