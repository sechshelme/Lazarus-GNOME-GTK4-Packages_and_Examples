{$IFDEF read_interface}


const
  GLIBTOP_NETLIST_NUMBER = 0;
  GLIBTOP_MAX_NETLIST = 1;

type
  Tglibtop_netlist = record
    flags: Tguint64;
    number: Tguint32;
  end;
  Pglibtop_netlist = ^Tglibtop_netlist;

function glibtop_get_netlist(buf: Pglibtop_netlist): Ppchar; cdecl; external libgtop2;

function glibtop_get_netlist_r(server: Pglibtop; buf: Pglibtop_netlist): Ppchar; cdecl; external libgtop2 name 'glibtop_get_netlist_s';

function glibtop_get_netlist_l(server: Pglibtop; buf: Pglibtop_netlist): Ppchar; cdecl; external libgtop2;

procedure _glibtop_init_netlist_s(server: Pglibtop); cdecl; external libgtop2;
function glibtop_get_netlist_s(server: Pglibtop; buf: Pglibtop_netlist): Ppchar; cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:05:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
