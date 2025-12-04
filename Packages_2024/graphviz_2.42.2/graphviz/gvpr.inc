{$IFDEF read_interface}


const
  GV_USE_EXIT = 1;
  GV_USE_OUTGRAPH = 2;
  GV_USE_JUMP = 4;
  GV_NEXT_SET = 8;

type
  Tgvprwr = function(para1: pointer; buf: pchar; nbyte: Tsize_t; para4: pointer): Tssize_t; cdecl;
  Tgvpruserfn = function(para1: pchar): longint; cdecl;

  Tgvprbinding = record
    name: pchar;
    fn: Tgvpruserfn;
  end;
  Pgvprbinding = ^Tgvprbinding;

  Tgvpropts = record
    ingraphs: ^PAgraph_t;
    n_outgraphs: longint;
    outgraphs: ^PAgraph_t;
    out_: Tgvprwr;
    err: Tgvprwr;
    flags: longint;
    bindings: Pgvprbinding;
  end;
  Pgvpropts = ^Tgvpropts;

// Löst eine SIGSEV aus !
// function gvpr(argc: longint; argv: PPchar; opts: Pgvpropts): longint; cdecl; external libgvpr;

// === Konventiert am: 3-12-25 15:07:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
