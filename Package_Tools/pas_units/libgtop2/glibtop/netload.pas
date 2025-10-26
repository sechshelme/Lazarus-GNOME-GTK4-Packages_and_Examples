unit netload;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_NETLOAD_IF_FLAGS = 0;
  GLIBTOP_NETLOAD_MTU = 1;
  GLIBTOP_NETLOAD_SUBNET = 2;
  GLIBTOP_NETLOAD_ADDRESS = 3;
  GLIBTOP_NETLOAD_PACKETS_IN = 4;
  GLIBTOP_NETLOAD_PACKETS_OUT = 5;
  GLIBTOP_NETLOAD_PACKETS_TOTAL = 6;
  GLIBTOP_NETLOAD_BYTES_IN = 7;
  GLIBTOP_NETLOAD_BYTES_OUT = 8;
  GLIBTOP_NETLOAD_BYTES_TOTAL = 9;
  GLIBTOP_NETLOAD_ERRORS_IN = 10;
  GLIBTOP_NETLOAD_ERRORS_OUT = 11;
  GLIBTOP_NETLOAD_ERRORS_TOTAL = 12;
  GLIBTOP_NETLOAD_COLLISIONS = 13;
  GLIBTOP_NETLOAD_ADDRESS6 = 14;
  GLIBTOP_NETLOAD_PREFIX6 = 15;
  GLIBTOP_NETLOAD_SCOPE6 = 16;
  GLIBTOP_NETLOAD_HWADDRESS = 17;
  GLIBTOP_MAX_NETLOAD = 18;

const
  GLIBTOP_IF_FLAGS_UP = 1;
  GLIBTOP_IF_FLAGS_BROADCAST = 2;
  GLIBTOP_IF_FLAGS_DEBUG = 3;
  GLIBTOP_IF_FLAGS_LOOPBACK = 4;
  GLIBTOP_IF_FLAGS_POINTOPOINT = 5;
  GLIBTOP_IF_FLAGS_RUNNING = 6;
  GLIBTOP_IF_FLAGS_NOARP = 7;
  GLIBTOP_IF_FLAGS_PROMISC = 8;
  GLIBTOP_IF_FLAGS_ALLMULTI = 9;
  GLIBTOP_IF_FLAGS_OACTIVE = 10;
  GLIBTOP_IF_FLAGS_SIMPLEX = 11;
  GLIBTOP_IF_FLAGS_LINK0 = 12;
  GLIBTOP_IF_FLAGS_LINK1 = 13;
  GLIBTOP_IF_FLAGS_LINK2 = 14;
  GLIBTOP_IF_FLAGS_ALTPHYS = 15;
  GLIBTOP_IF_FLAGS_MULTICAST = 16;
  GLIBTOP_IF_FLAGS_WIRELESS = 17;

type
  TGLIBTOP_IF_IN6_SCOPE = longint;

const
  GLIBTOP_IF_IN6_SCOPE_UNKNOWN = 0;
  GLIBTOP_IF_IN6_SCOPE_LINK = 1;
  GLIBTOP_IF_IN6_SCOPE_SITE = 2;
  GLIBTOP_IF_IN6_SCOPE_GLOBAL = 4;
  GLIBTOP_IF_IN6_SCOPE_HOST = 8;

type
  Tglibtop_netload = record
    flags: Tguint64;
    if_flags: Tguint64;
    mtu: Tguint32;
    subnet: Tguint32;
    address: Tguint32;
    packets_in: Tguint64;
    packets_out: Tguint64;
    packets_total: Tguint64;
    bytes_in: Tguint64;
    bytes_out: Tguint64;
    bytes_total: Tguint64;
    errors_in: Tguint64;
    errors_out: Tguint64;
    errors_total: Tguint64;
    collisions: Tguint64;
    address6: array[0..15] of Tguint8;
    prefix6: array[0..15] of Tguint8;
    scope6: Tguint8;
    hwaddress: array[0..7] of Tguint8;
  end;
  Pglibtop_netload = ^Tglibtop_netload;

procedure glibtop_get_netload(buf: Pglibtop_netload; iface: pchar); cdecl; external libgtop2;

procedure glibtop_get_netload_r(server: Pglibtop; buf: Pglibtop_netload; iface: pchar); cdecl; external libgtop2 name 'glibtop_get_netload_s';

procedure glibtop_get_netload_l(server: Pglibtop; buf: Pglibtop_netload; iface: pchar); cdecl; external libgtop2;

procedure _glibtop_init_netload_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_netload_s(server: Pglibtop; buf: Pglibtop_netload; iface: pchar); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:05:00 ===


implementation



end.
