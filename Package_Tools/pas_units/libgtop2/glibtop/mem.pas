unit mem;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GLIBTOP_MEM_TOTAL = 0;
  GLIBTOP_MEM_USED = 1;
  GLIBTOP_MEM_FREE = 2;
  GLIBTOP_MEM_SHARED = 3;
  GLIBTOP_MEM_BUFFER = 4;
  GLIBTOP_MEM_CACHED = 5;
  GLIBTOP_MEM_USER = 6;
  GLIBTOP_MEM_LOCKED = 7;
  GLIBTOP_MAX_MEM = 8;

type
  Tglibtop_mem = record
    flags: Tguint64;
    total: Tguint64;
    used: Tguint64;
    free: Tguint64;
    shared: Tguint64;
    buffer: Tguint64;
    cached: Tguint64;
    user: Tguint64;
    locked: Tguint64;
  end;
  Pglibtop_mem = ^Tglibtop_mem;


procedure glibtop_get_mem(buf: Pglibtop_mem); cdecl; external libgtop2;

procedure glibtop_get_mem_r(server: Pglibtop; buf: Pglibtop_mem); cdecl; external libgtop2 name 'glibtop_get_mem_s';

procedure glibtop_get_mem_l(server: Pglibtop; buf: Pglibtop_mem); cdecl; external libgtop2;

procedure _glibtop_init_mem_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_mem_s(server: Pglibtop; buf: Pglibtop_mem); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:05:16 ===


implementation



end.
