unit fuse_lowlevel;

interface

uses
  clib, fp_stdlib, fp_stat, fp_fuse, fuse_opt, fuse_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  FUSE_ROOT_ID = 1;

type
  Pfuse_ino_t = ^Tfuse_ino_t;
  Tfuse_ino_t = Tuint64_t;

  Tfuse_req_t = type Pointer;

  Pfuse_session = type Pointer;

  Tfuse_entry_param = record
    ino: Tfuse_ino_t;
    generation: Tuint64_t;
    attr: Tstat;
    attr_timeout: double;
    entry_timeout: double;
  end;
  Pfuse_entry_param = ^Tfuse_entry_param;

  Tfuse_ctx = record
    uid: Tuid_t;
    gid: Tgid_t;
    pid: Tpid_t;
    umask: Tmode_t;
  end;
  Pfuse_ctx = ^Tfuse_ctx;

  Tfuse_forget_data = record
    ino: Tfuse_ino_t;
    nlookup: Tuint64_t;
  end;
  Pfuse_forget_data = ^Tfuse_forget_data;

  Tfuse_custom_io = record
    writev: function(fd: longint; iov: Piovec; count: longint; userdata: pointer): Tssize_t; cdecl;
    read: function(fd: longint; buf: pointer; buf_len: Tsize_t; userdata: pointer): Tssize_t; cdecl;
    splice_receive: function(fdin: longint; offin: Poff_t; fdout: longint; offout: Poff_t; len: Tsize_t;
      flags: dword; userdata: pointer): Tssize_t; cdecl;
    splice_send: function(fdin: longint; offin: Poff_t; fdout: longint; offout: Poff_t; len: Tsize_t;
      flags: dword; userdata: pointer): Tssize_t; cdecl;
  end;
  Pfuse_custom_io = ^Tfuse_custom_io;

type
  Tfuse_expire_flags = longint;

const
  FUSE_LL_EXPIRE_ONLY = 1 shl 0;

  FUSE_SET_ATTR_MODE = 1 shl 0;
  FUSE_SET_ATTR_UID = 1 shl 1;
  FUSE_SET_ATTR_GID = 1 shl 2;
  FUSE_SET_ATTR_SIZE = 1 shl 3;
  FUSE_SET_ATTR_ATIME = 1 shl 4;
  FUSE_SET_ATTR_MTIME = 1 shl 5;
  FUSE_SET_ATTR_ATIME_NOW = 1 shl 7;
  FUSE_SET_ATTR_MTIME_NOW = 1 shl 8;
  FUSE_SET_ATTR_FORCE = 1 shl 9;
  FUSE_SET_ATTR_CTIME = 1 shl 10;
  FUSE_SET_ATTR_KILL_SUID = 1 shl 11;
  FUSE_SET_ATTR_KILL_SGID = 1 shl 12;
  FUSE_SET_ATTR_FILE = 1 shl 13;
  FUSE_SET_ATTR_KILL_PRIV = 1 shl 14;
  FUSE_SET_ATTR_OPEN = 1 shl 15;
  FUSE_SET_ATTR_TIMES_SET = 1 shl 16;
  FUSE_SET_ATTR_TOUCH = 1 shl 17;

type
  Pfuse_lowlevel_ops = ^Tfuse_lowlevel_ops;

  Tfuse_lowlevel_ops = record
    init: procedure(userdata: pointer; conn: Pfuse_conn_info); cdecl;
    destroy: procedure(userdata: pointer); cdecl;
    lookup: procedure(req: Tfuse_req_t; parent: Tfuse_ino_t; name: pchar); cdecl;
    forget: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; nlookup: Tuint64_t); cdecl;
    getattr: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; fi: Pfuse_file_info); cdecl;
    setattr: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; attr: Pstat; to_set: longint; fi: Pfuse_file_info); cdecl;
    readlink: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t); cdecl;
    mknod: procedure(req: Tfuse_req_t; parent: Tfuse_ino_t; name: pchar; mode: Tmode_t; rdev: Tdev_t); cdecl;
    mkdir: procedure(req: Tfuse_req_t; parent: Tfuse_ino_t; name: pchar; mode: Tmode_t); cdecl;
    unlink: procedure(req: Tfuse_req_t; parent: Tfuse_ino_t; name: pchar); cdecl;
    rmdir: procedure(req: Tfuse_req_t; parent: Tfuse_ino_t; name: pchar); cdecl;
    symlink: procedure(req: Tfuse_req_t; link: pchar; parent: Tfuse_ino_t; name: pchar); cdecl;
    rename: procedure(req: Tfuse_req_t; parent: Tfuse_ino_t; name: pchar; newparent: Tfuse_ino_t; newname: pchar;
      flags: dword); cdecl;
    link: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; newparent: Tfuse_ino_t; newname: pchar); cdecl;
    open: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; fi: Pfuse_file_info); cdecl;
    read: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; size: Tsize_t; off: Toff_t; fi: Pfuse_file_info); cdecl;
    write: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; buf: pchar; size: Tsize_t; off: Toff_t;
      fi: Pfuse_file_info); cdecl;
    flush: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; fi: Pfuse_file_info); cdecl;
    release: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; fi: Pfuse_file_info); cdecl;
    fsync: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; datasync: longint; fi: Pfuse_file_info); cdecl;
    opendir: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; fi: Pfuse_file_info); cdecl;
    readdir: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; size: Tsize_t; off: Toff_t; fi: Pfuse_file_info); cdecl;
    releasedir: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; fi: Pfuse_file_info); cdecl;
    fsyncdir: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; datasync: longint; fi: Pfuse_file_info); cdecl;
    statfs: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t); cdecl;
    setxattr: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; name: pchar; value: pchar; size: Tsize_t;
      flags: longint); cdecl;
    getxattr: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; name: pchar; size: Tsize_t); cdecl;
    listxattr: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; size: Tsize_t); cdecl;
    removexattr: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; name: pchar); cdecl;
    access: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; mask: longint); cdecl;
    create: procedure(req: Tfuse_req_t; parent: Tfuse_ino_t; name: pchar; mode: Tmode_t; fi: Pfuse_file_info); cdecl;
    getlk: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; fi: Pfuse_file_info; lock: Pflock); cdecl;
    setlk: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; fi: Pfuse_file_info; lock: Pflock; sleep: longint); cdecl;
    bmap: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; blocksize: Tsize_t; idx: Tuint64_t); cdecl;
    ioctl: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; cmd: dword; arg: pointer; fi: Pfuse_file_info;
      flags: dword; in_buf: pointer; in_bufsz: Tsize_t; out_bufsz: Tsize_t); cdecl;
    poll: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; fi: Pfuse_file_info; ph: Pfuse_pollhandle); cdecl;
    write_buf: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; bufv: Pfuse_bufvec; off: Toff_t; fi: Pfuse_file_info); cdecl;
    retrieve_reply: procedure(req: Tfuse_req_t; cookie: pointer; ino: Tfuse_ino_t; offset: Toff_t; bufv: Pfuse_bufvec); cdecl;
    forget_multi: procedure(req: Tfuse_req_t; count: Tsize_t; forgets: Pfuse_forget_data); cdecl;
    flock: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; fi: Pfuse_file_info; op: longint); cdecl;
    fallocate: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; mode: longint; offset: Toff_t; length: Toff_t;
      fi: Pfuse_file_info); cdecl;
    readdirplus: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; size: Tsize_t; off: Toff_t; fi: Pfuse_file_info); cdecl;
    copy_file_range: procedure(req: Tfuse_req_t; ino_in: Tfuse_ino_t; off_in: Toff_t; fi_in: Pfuse_file_info; ino_out: Tfuse_ino_t;
      off_out: Toff_t; fi_out: Pfuse_file_info; len: Tsize_t; flags: longint); cdecl;
    lseek: procedure(req: Tfuse_req_t; ino: Tfuse_ino_t; off: Toff_t; whence: longint; fi: Pfuse_file_info); cdecl;
  end;

function fuse_reply_err(req: Tfuse_req_t; err: longint): longint; cdecl; external libfuse3;
procedure fuse_reply_none(req: Tfuse_req_t); cdecl; external libfuse3;
function fuse_reply_entry(req: Tfuse_req_t; e: Pfuse_entry_param): longint; cdecl; external libfuse3;
function fuse_reply_create(req: Tfuse_req_t; e: Pfuse_entry_param; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_reply_attr(req: Tfuse_req_t; attr: Pstat; attr_timeout: double): longint; cdecl; external libfuse3;
function fuse_reply_readlink(req: Tfuse_req_t; link: pchar): longint; cdecl; external libfuse3;
function fuse_reply_open(req: Tfuse_req_t; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_reply_write(req: Tfuse_req_t; count: Tsize_t): longint; cdecl; external libfuse3;
function fuse_reply_buf(req: Tfuse_req_t; buf: pchar; size: Tsize_t): longint; cdecl; external libfuse3;
function fuse_reply_data(req: Tfuse_req_t; bufv: Pfuse_bufvec; flags: Tfuse_buf_copy_flags): longint; cdecl; external libfuse3;
function fuse_reply_iov(req: Tfuse_req_t; iov: Piovec; count: longint): longint; cdecl; external libfuse3;
function fuse_reply_statfs(req: Tfuse_req_t; stbuf: Pstatvfs): longint; cdecl; external libfuse3;
function fuse_reply_xattr(req: Tfuse_req_t; count: Tsize_t): longint; cdecl; external libfuse3;
function fuse_reply_lock(req: Tfuse_req_t; lock: Pflock): longint; cdecl; external libfuse3;
function fuse_reply_bmap(req: Tfuse_req_t; idx: Tuint64_t): longint; cdecl; external libfuse3;
function fuse_add_direntry(req: Tfuse_req_t; buf: pchar; bufsize: Tsize_t; name: pchar; stbuf: Pstat;
  off: Toff_t): Tsize_t; cdecl; external libfuse3;
function fuse_add_direntry_plus(req: Tfuse_req_t; buf: pchar; bufsize: Tsize_t; name: pchar; e: Pfuse_entry_param;
  off: Toff_t): Tsize_t; cdecl; external libfuse3;
function fuse_reply_ioctl_retry(req: Tfuse_req_t; in_iov: Piovec; in_count: Tsize_t; out_iov: Piovec; out_count: Tsize_t): longint; cdecl; external libfuse3;
function fuse_reply_ioctl(req: Tfuse_req_t; result: longint; buf: pointer; size: Tsize_t): longint; cdecl; external libfuse3;
function fuse_reply_ioctl_iov(req: Tfuse_req_t; result: longint; iov: Piovec; count: longint): longint; cdecl; external libfuse3;
function fuse_reply_poll(req: Tfuse_req_t; revents: dword): longint; cdecl; external libfuse3;
function fuse_reply_lseek(req: Tfuse_req_t; off: Toff_t): longint; cdecl; external libfuse3;
function fuse_lowlevel_notify_poll(ph: Pfuse_pollhandle): longint; cdecl; external libfuse3;
function fuse_lowlevel_notify_inval_inode(se: Pfuse_session; ino: Tfuse_ino_t; off: Toff_t; len: Toff_t): longint; cdecl; external libfuse3;
function fuse_lowlevel_notify_inval_entry(se: Pfuse_session; parent: Tfuse_ino_t; name: pchar; namelen: Tsize_t): longint; cdecl; external libfuse3;
function fuse_lowlevel_notify_expire_entry(se: Pfuse_session; parent: Tfuse_ino_t; name: pchar; namelen: Tsize_t; flags: Tfuse_expire_flags): longint; cdecl; external libfuse3;
function fuse_lowlevel_notify_delete(se: Pfuse_session; parent: Tfuse_ino_t; child: Tfuse_ino_t; name: pchar; namelen: Tsize_t): longint; cdecl; external libfuse3;
function fuse_lowlevel_notify_store(se: Pfuse_session; ino: Tfuse_ino_t; offset: Toff_t; bufv: Pfuse_bufvec; flags: Tfuse_buf_copy_flags): longint; cdecl; external libfuse3;
function fuse_lowlevel_notify_retrieve(se: Pfuse_session; ino: Tfuse_ino_t; size: Tsize_t; offset: Toff_t; cookie: pointer): longint; cdecl; external libfuse3;
function fuse_req_userdata(req: Tfuse_req_t): pointer; cdecl; external libfuse3;
function fuse_req_ctx(req: Tfuse_req_t): Pfuse_ctx; cdecl; external libfuse3;
function fuse_req_getgroups(req: Tfuse_req_t; size: longint; list: Pgid_t): longint; cdecl; external libfuse3;

type
  Tfuse_interrupt_func_t = procedure(req: Tfuse_req_t; data: pointer); cdecl;

procedure fuse_req_interrupt_func(req: Tfuse_req_t; func: Tfuse_interrupt_func_t; data: pointer); cdecl; external libfuse3;
function fuse_req_interrupted(req: Tfuse_req_t): longint; cdecl; external libfuse3;
procedure fuse_lowlevel_version; cdecl; external libfuse3;
procedure fuse_lowlevel_help; cdecl; external libfuse3;
procedure fuse_cmdline_help; cdecl; external libfuse3;

type
  Tfuse_cmdline_opts = record
    singlethread: longint;
    foreground: longint;
    debug: longint;
    nodefault_subtype: longint;
    mountpoint: pchar;
    show_version: longint;
    show_help: longint;
    clone_fd: longint;
    max_idle_threads: dword;
    max_threads: dword;
  end;
  Pfuse_cmdline_opts = ^Tfuse_cmdline_opts;

function fuse_parse_cmdline(args: Pfuse_args; opts: Pfuse_cmdline_opts): longint; cdecl; external libfuse3;
function fuse_parse_cmdline_30(args: Pfuse_args; opts: Pfuse_cmdline_opts): longint; cdecl; external libfuse3;

function fuse_parse_cmdline_312(args: Pfuse_args; opts: Pfuse_cmdline_opts): longint; cdecl; external libfuse3;

function fuse_session_new(args: Pfuse_args; op: Pfuse_lowlevel_ops; op_size: Tsize_t; userdata: pointer): Pfuse_session; cdecl; external libfuse3;
function fuse_session_custom_io(se: Pfuse_session; io: Pfuse_custom_io; fd: longint): longint; cdecl; external libfuse3;
function fuse_session_mount(se: Pfuse_session; mountpoint: pchar): longint; cdecl; external libfuse3;
function fuse_session_loop(se: Pfuse_session): longint; cdecl; external libfuse3;

function fuse_session_loop_mt_31(se: Pfuse_session; clone_fd: longint): longint; cdecl; external libfuse3;
function fuse_session_loop_mt_32(se: Pfuse_session; config: Pfuse_loop_config): longint; cdecl; external libfuse3;
function fuse_session_loop_mt(se: Pfuse_session; config: Pfuse_loop_config): longint; cdecl; external libfuse3;
function fuse_session_loop_mt_312(se: Pfuse_session; config: Pfuse_loop_config): longint; cdecl; external libfuse3;
procedure fuse_session_exit(se: Pfuse_session); cdecl; external libfuse3;
procedure fuse_session_reset(se: Pfuse_session); cdecl; external libfuse3;
function fuse_session_exited(se: Pfuse_session): longint; cdecl; external libfuse3;
procedure fuse_session_unmount(se: Pfuse_session); cdecl; external libfuse3;
procedure fuse_session_destroy(se: Pfuse_session); cdecl; external libfuse3;
function fuse_session_fd(se: Pfuse_session): longint; cdecl; external libfuse3;
procedure fuse_session_process_buf(se: Pfuse_session; buf: Pfuse_buf); cdecl; external libfuse3;
function fuse_session_receive_buf(se: Pfuse_session; buf: Pfuse_buf): longint; cdecl; external libfuse3;

// === Konventiert am: 31-8-25 17:01:40 ===


implementation


end.
