unit msg_limits;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_IPC_MSGPOOL = 0;
  GLIBTOP_IPC_MSGMAP = 1;
  GLIBTOP_IPC_MSGMAX = 2;
  GLIBTOP_IPC_MSGMNB = 3;
  GLIBTOP_IPC_MSGMNI = 4;
  GLIBTOP_IPC_MSGSSZ = 5;
  GLIBTOP_IPC_MSGTQL = 6;
  GLIBTOP_MAX_MSG_LIMITS = 7;

type
  Tglibtop_msg_limits = record
    flags: Tguint64;
    msgpool: Tguint64;
    msgmap: Tguint64;
    msgmax: Tguint64;
    msgmnb: Tguint64;
    msgmni: Tguint64;
    msgssz: Tguint64;
    msgtql: Tguint64;
  end;
  Pglibtop_msg_limits = ^Tglibtop_msg_limits;

procedure glibtop_get_msg_limits(buf: Pglibtop_msg_limits); cdecl; external libgtop2;

procedure glibtop_get_msg_limits_r(server: Pglibtop; buf: Pglibtop_msg_limits); cdecl; external libgtop2 name 'glibtop_get_msg_limits_s';

procedure glibtop_get_msg_limits_l(server: Pglibtop; buf: Pglibtop_msg_limits); cdecl; external libgtop2;

procedure _glibtop_init_msg_limits_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_msg_limits_s(server: Pglibtop; buf: Pglibtop_msg_limits); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:05:07 ===


implementation



end.
