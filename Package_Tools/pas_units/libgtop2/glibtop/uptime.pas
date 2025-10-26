unit uptime;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_UPTIME_UPTIME = 0;
  GLIBTOP_UPTIME_IDLETIME = 1;
  GLIBTOP_UPTIME_BOOT_TIME = 2;
  GLIBTOP_MAX_UPTIME = 3;

type
  Tglibtop_uptime = record
    flags: Tguint64;
    uptime: double;
    idletime: double;
    boot_time: Tguint64;
  end;
  Pglibtop_uptime = ^Tglibtop_uptime;

procedure glibtop_get_uptime(buf: Pglibtop_uptime); cdecl; external libgtop2;

procedure glibtop_get_uptime_r(server: Pglibtop; buf: Pglibtop_uptime); cdecl; external libgtop2 name 'glibtop_get_uptime_s';

procedure glibtop_get_uptime_l(server: Pglibtop; buf: Pglibtop_uptime); cdecl; external libgtop2;

procedure _glibtop_init_uptime_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_uptime_s(server: Pglibtop; buf: Pglibtop_uptime); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:03:46 ===


implementation



end.
