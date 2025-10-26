{$IFDEF read_interface}


const
  GLIBTOP_PROC_SEGMENT_TEXT_RSS = 0;
  GLIBTOP_PROC_SEGMENT_SHLIB_RSS = 1;
  GLIBTOP_PROC_SEGMENT_DATA_RSS = 2;
  GLIBTOP_PROC_SEGMENT_STACK_RSS = 3;
  GLIBTOP_PROC_SEGMENT_DIRTY_SIZE = 4;
  GLIBTOP_PROC_SEGMENT_START_CODE = 5;
  GLIBTOP_PROC_SEGMENT_END_CODE = 6;
  GLIBTOP_PROC_SEGMENT_START_STACK = 7;
  GLIBTOP_MAX_PROC_SEGMENT = 8;

type
  Tglibtop_proc_segment = record
    flags: Tguint64;
    text_rss: Tguint64;
    shlib_rss: Tguint64;
    data_rss: Tguint64;
    stack_rss: Tguint64;
    dirty_size: Tguint64;
    start_code: Tguint64;
    end_code: Tguint64;
    start_stack: Tguint64;
  end;
  Pglibtop_proc_segment = ^Tglibtop_proc_segment;

procedure glibtop_get_proc_segment(buf: Pglibtop_proc_segment; pid: Tpid_t); cdecl; external libgtop2;

procedure glibtop_get_proc_segment_r(server: Pglibtop; buf: Pglibtop_proc_segment; pid: Tpid_t); cdecl; external libgtop2 name 'glibtop_get_proc_segment_s';

procedure glibtop_get_proc_segment_l(server: Pglibtop; buf: Pglibtop_proc_segment; pid: Tpid_t); cdecl; external libgtop2;

procedure _glibtop_init_proc_segment_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_get_proc_segment_s(server: Pglibtop; buf: Pglibtop_proc_segment; pid: Tpid_t); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
