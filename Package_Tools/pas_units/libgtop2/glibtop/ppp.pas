unit ppp;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_PPP_STATE = 0;
  GLIBTOP_PPP_BYTES_IN = 1;
  GLIBTOP_PPP_BYTES_OUT = 2;
  GLIBTOP_MAX_PPP = 3;

const
  GLIBTOP_PPP_STATE_UNKNOWN = 0;
  GLIBTOP_PPP_STATE_HANGUP = 1;
  GLIBTOP_PPP_STATE_ONLINE = 2;

type
  Tglibtop_ppp = record
    flags: Tguint64;
    state: Tguint64;
    bytes_in: Tguint64;
    bytes_out: Tguint64;
  end;
  Pglibtop_ppp = ^Tglibtop_ppp;

procedure glibtop_get_ppp(buf: Pglibtop_ppp; device: word); cdecl; external libgtop2;

procedure glibtop_get_ppp_r(server: Pglibtop; buf: Pglibtop_ppp; device: word); cdecl; external libgtop2 name 'glibtop_get_ppp_s';

procedure glibtop_get_ppp_l(server: Pglibtop; buf: Pglibtop_ppp; device: word); cdecl; external libgtop2;

procedure _glibtop_init_ppp_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_ppp_s(server: Pglibtop; buf: Pglibtop_ppp; device: word); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:49 ===


implementation



end.
