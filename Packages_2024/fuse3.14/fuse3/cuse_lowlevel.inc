{$IFDEF read_interface}


const
  FUSE_USE_VERSION = 29;

const
  CUSE_UNRESTRICTED_IOCTL = 1 shl 0;

type
  Tcuse_info = record
    dev_major: dword;
    dev_minor: dword;
    dev_info_argc: dword;
    dev_info_argv: ^pchar;
    flags: dword;
  end;
  Pcuse_info = ^Tcuse_info;

  Tcuse_lowlevel_ops = record
    init: procedure(userdata: pointer; conn: Pfuse_conn_info); cdecl;
    init_done: procedure(userdata: pointer); cdecl;
    destroy: procedure(userdata: pointer); cdecl;
    open: procedure(req: Tfuse_req_t; fi: Pfuse_file_info); cdecl;
    read: procedure(req: Tfuse_req_t; size: Tsize_t; off: Toff_t; fi: Pfuse_file_info); cdecl;
    write: procedure(req: Tfuse_req_t; buf: pchar; size: Tsize_t; off: Toff_t; fi: Pfuse_file_info); cdecl;
    flush: procedure(req: Tfuse_req_t; fi: Pfuse_file_info); cdecl;
    release: procedure(req: Tfuse_req_t; fi: Pfuse_file_info); cdecl;
    fsync: procedure(req: Tfuse_req_t; datasync: longint; fi: Pfuse_file_info); cdecl;
    ioctl: procedure(req: Tfuse_req_t; cmd: longint; arg: pointer; fi: Pfuse_file_info; flags: dword;
      in_buf: pointer; in_bufsz: Tsize_t; out_bufsz: Tsize_t); cdecl;
    poll: procedure(req: Tfuse_req_t; fi: Pfuse_file_info; ph: Pfuse_pollhandle); cdecl;
  end;
  Pcuse_lowlevel_ops = ^Tcuse_lowlevel_ops;

function cuse_lowlevel_new(args: Pfuse_args; ci: Pcuse_info; clop: Pcuse_lowlevel_ops; userdata: pointer): Pfuse_session; cdecl; external libfuse3;
function cuse_lowlevel_setup(argc: longint; argv: PPchar; ci: Pcuse_info; clop: Pcuse_lowlevel_ops; multithreaded: Plongint;
  userdata: pointer): Pfuse_session; cdecl; external libfuse3;
procedure cuse_lowlevel_teardown(se: Pfuse_session); cdecl; external libfuse3;
function cuse_lowlevel_main(argc: longint; argv: PPchar; ci: Pcuse_info; clop: Pcuse_lowlevel_ops; userdata: pointer): longint; cdecl; external libfuse3;

// === Konventiert am: 31-8-25 17:01:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
