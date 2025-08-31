unit fuse_common;

interface

uses
  clib, fp_fuse, fuse_opt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  FUSE_MAJOR_VERSION = 3;
  FUSE_MINOR_VERSION = 14;

function FUSE_MAKE_VERSION(maj, min: longint): longint;

function FUSE_VERSION_: longint;

type
  Tfuse_file_info = bitpacked  record
    flags: longint;
    writepage: 0..1;
    direct_io: 0..1;
    keep_cache: 0..1;
    flush: 0..1;
    nonseekable: 0..1;
    flock_release: 0..1;
    cache_readdir: 0..1;
    noflush: 0..1;
    padding: 0..1 shl (24 - 1);
    padding2: 0..1 shl (32 - 1);

    fh: Tuint64_t;
    lock_owner: Tuint64_t;
    poll_events: Tuint32_t;
  end;
  Pfuse_file_info = ^Tfuse_file_info;

type
  Tfuse_loop_config_v1 = record
    clone_fd: longint;
    max_idle_threads: dword;
  end;
  Pfuse_loop_config_v1 = ^Tfuse_loop_config_v1;
  Pfuse_loop_config = Pfuse_loop_config_v1;

const
  FUSE_CAP_ASYNC_READ = 1 shl 0;
  FUSE_CAP_POSIX_LOCKS = 1 shl 1;
  FUSE_CAP_ATOMIC_O_TRUNC = 1 shl 3;
  FUSE_CAP_EXPORT_SUPPORT = 1 shl 4;
  FUSE_CAP_DONT_MASK = 1 shl 6;
  FUSE_CAP_SPLICE_WRITE = 1 shl 7;
  FUSE_CAP_SPLICE_MOVE = 1 shl 8;
  FUSE_CAP_SPLICE_READ = 1 shl 9;
  FUSE_CAP_FLOCK_LOCKS = 1 shl 10;
  FUSE_CAP_IOCTL_DIR = 1 shl 11;
  FUSE_CAP_AUTO_INVAL_DATA = 1 shl 12;
  FUSE_CAP_READDIRPLUS = 1 shl 13;
  FUSE_CAP_READDIRPLUS_AUTO = 1 shl 14;
  FUSE_CAP_ASYNC_DIO = 1 shl 15;
  FUSE_CAP_WRITEBACK_CACHE = 1 shl 16;
  FUSE_CAP_NO_OPEN_SUPPORT = 1 shl 17;
  FUSE_CAP_PARALLEL_DIROPS = 1 shl 18;
  FUSE_CAP_POSIX_ACL = 1 shl 19;
  FUSE_CAP_HANDLE_KILLPRIV = 1 shl 20;
  FUSE_CAP_CACHE_SYMLINKS = 1 shl 23;
  FUSE_CAP_NO_OPENDIR_SUPPORT = 1 shl 24;
  FUSE_CAP_EXPLICIT_INVAL_DATA = 1 shl 25;
  FUSE_CAP_EXPIRE_ONLY = 1 shl 26;
  FUSE_IOCTL_COMPAT = 1 shl 0;
  FUSE_IOCTL_UNRESTRICTED = 1 shl 1;
  FUSE_IOCTL_RETRY = 1 shl 2;
  FUSE_IOCTL_DIR = 1 shl 4;
  FUSE_IOCTL_MAX_IOV = 256;

type
  Tfuse_conn_info = record
    proto_major: dword;
    proto_minor: dword;
    max_write: dword;
    max_read: dword;
    max_readahead: dword;
    capable: dword;
    want: dword;
    max_background: dword;
    congestion_threshold: dword;
    time_gran: dword;
    reserved: array[0..21] of dword;
  end;
  Pfuse_conn_info = ^Tfuse_conn_info;

  Pfuse_session = type Pointer;
  Pfuse_pollhandle = type Pointer;
  Pfuse_conn_info_opts = type Pointer;

function fuse_parse_conn_info_opts(args: Pfuse_args): Pfuse_conn_info_opts; cdecl; external libfuse3;
procedure fuse_apply_conn_info_opts(opts: Pfuse_conn_info_opts; conn: Pfuse_conn_info); cdecl; external libfuse3;
function fuse_daemonize(foreground: longint): longint; cdecl; external libfuse3;
function fuse_version: longint; cdecl; external libfuse3;
function fuse_pkgversion: pchar; cdecl; external libfuse3;
procedure fuse_pollhandle_destroy(ph: Pfuse_pollhandle); cdecl; external libfuse3;

type
  Tfuse_buf_flags = longint;

const
  FUSE_BUF_IS_FD = 1 shl 1;
  FUSE_BUF_FD_SEEK = 1 shl 2;
  FUSE_BUF_FD_RETRY = 1 shl 3;

type
  Tfuse_buf_copy_flags = longint;

const
  FUSE_BUF_NO_SPLICE = 1 shl 1;
  FUSE_BUF_FORCE_SPLICE = 1 shl 2;
  FUSE_BUF_SPLICE_MOVE = 1 shl 3;
  FUSE_BUF_SPLICE_NONBLOCK = 1 shl 4;

type
  Tfuse_buf = record
    size: Tsize_t;
    flags: Tfuse_buf_flags;
    mem: pointer;
    fd: longint;
    pos: Toff_t;
  end;
  Pfuse_buf = ^Tfuse_buf;

  Tfuse_bufvec = record
    count: Tsize_t;
    idx: Tsize_t;
    off: Tsize_t;
    buf: array[0..0] of Tfuse_buf;
  end;
  Pfuse_bufvec = ^Tfuse_bufvec;
  PPfuse_bufvec = ^Pfuse_bufvec;

function fuse_buf_size(bufv: Pfuse_bufvec): Tsize_t; cdecl; external libfuse3;
function fuse_buf_copy(dst: Pfuse_bufvec; src: Pfuse_bufvec; flags: Tfuse_buf_copy_flags): Tssize_t; cdecl; external libfuse3;
function fuse_set_signal_handlers(se: Pfuse_session): longint; cdecl; external libfuse3;
procedure fuse_remove_signal_handlers(se: Pfuse_session); cdecl; external libfuse3;
function fuse_loop_cfg_create: Pfuse_loop_config; cdecl; external libfuse3;
procedure fuse_loop_cfg_destroy(config: Pfuse_loop_config); cdecl; external libfuse3;
procedure fuse_loop_cfg_set_idle_threads(config: Pfuse_loop_config; value: dword); cdecl; external libfuse3;
procedure fuse_loop_cfg_set_max_threads(config: Pfuse_loop_config; value: dword); cdecl; external libfuse3;
procedure fuse_loop_cfg_set_clone_fd(config: Pfuse_loop_config; value: dword); cdecl; external libfuse3;
procedure fuse_loop_cfg_convert(config: Pfuse_loop_config; v1_conf: Pfuse_loop_config_v1); cdecl; external libfuse3;

// === Konventiert am: 31-8-25 17:01:35 ===


implementation


function FUSE_MAKE_VERSION(maj, min: longint): longint;
begin
  FUSE_MAKE_VERSION := (maj * 100) + min;
end;

function FUSE_VERSION_: longint;
begin
  Result := FUSE_MAKE_VERSION(FUSE_MAJOR_VERSION, FUSE_MINOR_VERSION);
end;


end.
