{$IFDEF read_interface}


const
  GLIBTOP_PROC_MEM_SIZE = 0;
  GLIBTOP_PROC_MEM_VSIZE = 1;
  GLIBTOP_PROC_MEM_RESIDENT = 2;
  GLIBTOP_PROC_MEM_SHARE = 3;
  GLIBTOP_PROC_MEM_RSS = 4;
  GLIBTOP_PROC_MEM_RSS_RLIM = 5;
  GLIBTOP_MAX_PROC_MEM = 6;

type
  Tglibtop_proc_mem = record
    flags: Tguint64;
    size: Tguint64;
    vsize: Tguint64;
    resident: Tguint64;
    share: Tguint64;
    rss: Tguint64;
    rss_rlim: Tguint64;
  end;
  Pglibtop_proc_mem = ^Tglibtop_proc_mem;

procedure glibtop_get_proc_mem(buf: Pglibtop_proc_mem; pid: Tpid_t); cdecl; external libgtop2;

procedure glibtop_get_proc_mem_r(server: Pglibtop; buf: Pglibtop_proc_mem; pid: Tpid_t); cdecl; external libgtop2 name 'glibtop_get_proc_mem_s';

procedure glibtop_get_proc_mem_l(server: Pglibtop; buf: Pglibtop_proc_mem; pid: Tpid_t); cdecl; external libgtop2;

procedure _glibtop_init_proc_mem_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_proc_mem_s(server: Pglibtop; buf: Pglibtop_proc_mem; pid: Tpid_t); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
