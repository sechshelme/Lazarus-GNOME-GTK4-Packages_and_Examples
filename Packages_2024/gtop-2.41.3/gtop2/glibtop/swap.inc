{$IFDEF read_interface}


const
  GLIBTOP_SWAP_TOTAL = 0;
  GLIBTOP_SWAP_USED = 1;
  GLIBTOP_SWAP_FREE = 2;
  GLIBTOP_SWAP_PAGEIN = 3;
  GLIBTOP_SWAP_PAGEOUT = 4;
  GLIBTOP_MAX_SWAP = 5;

type
  Tglibtop_swap = record
    flags: Tguint64;
    total: Tguint64;
    used: Tguint64;
    free: Tguint64;
    pagein: Tguint64;
    pageout: Tguint64;
  end;
  Pglibtop_swap = ^Tglibtop_swap;


procedure glibtop_get_swap(buf: Pglibtop_swap); cdecl; external libgtop2;

procedure glibtop_get_swap_r(server: Pglibtop; buf: Pglibtop_swap); cdecl; external libgtop2 name 'glibtop_get_swap_s';

procedure glibtop_get_swap_l(server: Pglibtop; buf: Pglibtop_swap); cdecl; external libgtop2;

procedure _glibtop_init_swap_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_swap_s(server: Pglibtop; buf: Pglibtop_swap); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:03:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
