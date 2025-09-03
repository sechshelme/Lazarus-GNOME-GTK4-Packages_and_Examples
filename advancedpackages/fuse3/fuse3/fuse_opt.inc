{$IFDEF read_interface}


type
  Tfuse_opt = record
    templ: pchar;
    offset: dword;
    value: longint;
  end;
  Pfuse_opt = ^Tfuse_opt;

  Tfuse_args = record
    argc: longint;
    argv: ^pchar;
    allocated: longint;
  end;
  Pfuse_args = ^Tfuse_args;

const
  FUSE_OPT_KEY_OPT = -(1);
  FUSE_OPT_KEY_NONOPT = -(2);
  FUSE_OPT_KEY_KEEP = -(3);
  FUSE_OPT_KEY_DISCARD = -(4);

type
  Tfuse_opt_proc_t = function(data: pointer; arg: pchar; key: longint; outargs: Pfuse_args): longint; cdecl;

function fuse_opt_parse(args: Pfuse_args; data: pointer; opts: Pfuse_opt; proc: Tfuse_opt_proc_t): longint; cdecl; external libfuse3;
function fuse_opt_add_opt(opts: PPchar; opt: pchar): longint; cdecl; external libfuse3;
function fuse_opt_add_opt_escaped(opts: PPchar; opt: pchar): longint; cdecl; external libfuse3;
function fuse_opt_add_arg(args: Pfuse_args; arg: pchar): longint; cdecl; external libfuse3;
function fuse_opt_insert_arg(args: Pfuse_args; pos: longint; arg: pchar): longint; cdecl; external libfuse3;
procedure fuse_opt_free_args(args: Pfuse_args); cdecl; external libfuse3;
function fuse_opt_match(opts: Pfuse_opt; opt: pchar): longint; cdecl; external libfuse3;

// === Konventiert am: 31-8-25 17:01:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
