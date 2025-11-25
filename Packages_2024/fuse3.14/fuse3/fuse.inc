{$IFDEF read_interface}


type
  Pfuse = type Pointer;

type
  Tfuse_readdir_flags = longint;

const
  FUSE_READDIR_PLUS = 1 shl 0;

type
  Tfuse_fill_dir_flags = longint;

const
  FUSE_FILL_DIR_PLUS = 1 shl 1;

type
  Tfuse_fill_dir_t = function(buf: pointer; name: pchar; stbuf: Pstat; off: Toff_t; flags: Tfuse_fill_dir_flags): longint; cdecl;

  Tfuse_config = record
    set_gid: longint;
    gid: dword;
    set_uid: longint;
    uid: dword;
    set_mode: longint;
    umask: dword;
    entry_timeout: double;
    negative_timeout: double;
    attr_timeout: double;
    intr: longint;
    intr_signal: longint;
    remember: longint;
    hard_remove: longint;
    use_ino: longint;
    readdir_ino: longint;
    direct_io: longint;
    kernel_cache: longint;
    auto_cache: longint;
    no_rofd_flush: longint;
    ac_attr_timeout_set: longint;
    ac_attr_timeout: double;
    nullpath_ok: longint;
    show_help: longint;
    modules: pchar;
    debug: longint;
  end;
  Pfuse_config = ^Tfuse_config;

type
  Tfuse_operations = record
    getattr: function(para1: pchar; para2: Pstat; fi: Pfuse_file_info): longint; cdecl;
    readlink: function(para1: pchar; para2: pchar; para3: Tsize_t): longint; cdecl;
    mknod: function(para1: pchar; para2: Tmode_t; para3: Tdev_t): longint; cdecl;
    mkdir: function(para1: pchar; para2: Tmode_t): longint; cdecl;
    unlink: function(para1: pchar): longint; cdecl;
    rmdir: function(para1: pchar): longint; cdecl;
    symlink: function(para1: pchar; para2: pchar): longint; cdecl;
    rename: function(para1: pchar; para2: pchar; flags: dword): longint; cdecl;
    link: function(para1: pchar; para2: pchar): longint; cdecl;
    chmod: function(para1: pchar; para2: Tmode_t; fi: Pfuse_file_info): longint; cdecl;
    chown: function(para1: pchar; para2: Tuid_t; para3: Tgid_t; fi: Pfuse_file_info): longint; cdecl;
    truncate: function(para1: pchar; para2: Toff_t; fi: Pfuse_file_info): longint; cdecl;
    open: function(para1: pchar; para2: Pfuse_file_info): longint; cdecl;
    read: function(para1: pchar; para2: pchar; para3: Tsize_t; para4: Toff_t; para5: Pfuse_file_info): longint; cdecl;
    write: function(para1: pchar; para2: pchar; para3: Tsize_t; para4: Toff_t; para5: Pfuse_file_info): longint; cdecl;
    statfs: function(para1: pchar; para2: Pstatvfs): longint; cdecl;
    flush: function(para1: pchar; para2: Pfuse_file_info): longint; cdecl;
    release: function(para1: pchar; para2: Pfuse_file_info): longint; cdecl;
    fsync: function(para1: pchar; para2: longint; para3: Pfuse_file_info): longint; cdecl;
    setxattr: function(para1: pchar; para2: pchar; para3: pchar; para4: Tsize_t; para5: longint): longint; cdecl;
    getxattr: function(para1: pchar; para2: pchar; para3: pchar; para4: Tsize_t): longint; cdecl;
    listxattr: function(para1: pchar; para2: pchar; para3: Tsize_t): longint; cdecl;
    removexattr: function(para1: pchar; para2: pchar): longint; cdecl;
    opendir: function(para1: pchar; para2: Pfuse_file_info): longint; cdecl;
    readdir: function(para1: pchar; para2: pointer; para3: Tfuse_fill_dir_t; para4: Toff_t; para5: Pfuse_file_info; para6: Tfuse_readdir_flags): longint; cdecl;
    releasedir: function(para1: pchar; para2: Pfuse_file_info): longint; cdecl;
    fsyncdir: function(para1: pchar; para2: longint; para3: Pfuse_file_info): longint; cdecl;
    init: function(conn: Pfuse_conn_info; cfg: Pfuse_config): pointer; cdecl;
    destroy: procedure(private_data: pointer); cdecl;
    access: function(para1: pchar; para2: longint): longint; cdecl;
    create: function(para1: pchar; para2: Tmode_t; para3: Pfuse_file_info): longint; cdecl;
    lock: function(para1: pchar; para2: Pfuse_file_info; cmd: longint; para4: Pflock): longint; cdecl;
    utimens: function(para1: pchar; tv: Ptimespec; fi: Pfuse_file_info): longint; cdecl;
    bmap: function(para1: pchar; blocksize: Tsize_t; idx: Puint64_t): longint; cdecl;
    ioctl: function(para1: pchar; cmd: dword; arg: pointer; para4: Pfuse_file_info; flags: dword; data: pointer): longint; cdecl;
    poll: function(para1: pchar; para2: Pfuse_file_info; ph: Pfuse_pollhandle; reventsp: Pdword): longint; cdecl;
    write_buf: function(para1: pchar; buf: Pfuse_bufvec; off: Toff_t; para4: Pfuse_file_info): longint; cdecl;
    read_buf: function(para1: pchar; bufp: PPfuse_bufvec; size: Tsize_t; off: Toff_t; para5: Pfuse_file_info): longint; cdecl;
    flock: function(para1: pchar; para2: Pfuse_file_info; op: longint): longint; cdecl;
    fallocate: function(para1: pchar; para2: longint; para3: Toff_t; para4: Toff_t; para5: Pfuse_file_info): longint; cdecl;
    copy_file_range: function(path_in: pchar; fi_in: Pfuse_file_info; offset_in: Toff_t; path_out: pchar; fi_out: Pfuse_file_info; offset_out: Toff_t; size: Tsize_t; flags: longint): Tssize_t; cdecl;
    lseek: function(para1: pchar; off: Toff_t; whence: longint; para4: Pfuse_file_info): Toff_t; cdecl;
  end;
  Pfuse_operations = ^Tfuse_operations;

  Tfuse_context = record
    fuse: Pfuse;
    uid: Tuid_t;
    gid: Tgid_t;
    pid: Tpid_t;
    private_data: pointer;
    umask: Tmode_t;
  end;
  Pfuse_context = ^Tfuse_context;

function fuse_main(argc: longint; argv: PPchar; op: Pfuse_operations; private_data: pointer): longint;

procedure fuse_lib_help(args: Pfuse_args); cdecl; external libfuse3;
function fuse_new_30(args: Pfuse_args; op: Pfuse_operations; op_size: Tsize_t; private_data: pointer): Pfuse; cdecl; external libfuse3;

function fuse_new(args: Pfuse_args; op: Pfuse_operations; op_size: Tsize_t; private_data: pointer): Pfuse; cdecl; external libfuse3;
function fuse_new_31(args: Pfuse_args; op: Pfuse_operations; op_size: Tsize_t; user_data: pointer): Pfuse; cdecl; external libfuse3;

function fuse_mount(f: Pfuse; mountpoint: pchar): longint; cdecl; external libfuse3;
procedure fuse_unmount(f: Pfuse); cdecl; external libfuse3;
procedure fuse_destroy(f: Pfuse); cdecl; external libfuse3;
function fuse_loop(f: Pfuse): longint; cdecl; external libfuse3;
procedure fuse_exit(f: Pfuse); cdecl; external libfuse3;

function fuse_loop_mt_31(f: Pfuse; clone_fd: longint): longint; cdecl; external libfuse3;
function fuse_loop_mt_32(f: Pfuse; config: Pfuse_loop_config): longint; cdecl; external libfuse3;
function fuse_loop_mt(f: Pfuse; config: Pfuse_loop_config): longint; cdecl; external libfuse3;

function fuse_get_context: Pfuse_context; cdecl; external libfuse3;
function fuse_getgroups(size: longint; list: Pgid_t): longint; cdecl; external libfuse3;
function fuse_interrupted: longint; cdecl; external libfuse3;
function fuse_invalidate_path(f: Pfuse; path: pchar): longint; cdecl; external libfuse3;
function fuse_main_real(argc: longint; argv: PPchar; op: Pfuse_operations; op_size: Tsize_t; private_data: pointer): longint; cdecl; external libfuse3;
function fuse_start_cleanup_thread(fuse: Pfuse): longint; cdecl; external libfuse3;
procedure fuse_stop_cleanup_thread(fuse: Pfuse); cdecl; external libfuse3;
function fuse_clean_cache(fuse: Pfuse): longint; cdecl; external libfuse3;

type
  Pfuse_fs = type Pointer;
  PPfuse_fs = ^Pfuse_fs;

function fuse_fs_getattr(fs: Pfuse_fs; path: pchar; buf: Pstat; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_rename(fs: Pfuse_fs; oldpath: pchar; newpath: pchar; flags: dword): longint; cdecl; external libfuse3;
function fuse_fs_unlink(fs: Pfuse_fs; path: pchar): longint; cdecl; external libfuse3;
function fuse_fs_rmdir(fs: Pfuse_fs; path: pchar): longint; cdecl; external libfuse3;
function fuse_fs_symlink(fs: Pfuse_fs; linkname: pchar; path: pchar): longint; cdecl; external libfuse3;
function fuse_fs_link(fs: Pfuse_fs; oldpath: pchar; newpath: pchar): longint; cdecl; external libfuse3;
function fuse_fs_release(fs: Pfuse_fs; path: pchar; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_open(fs: Pfuse_fs; path: pchar; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_read(fs: Pfuse_fs; path: pchar; buf: pchar; size: Tsize_t; off: Toff_t;
  fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_read_buf(fs: Pfuse_fs; path: pchar; bufp: PPfuse_bufvec; size: Tsize_t; off: Toff_t;
  fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_write(fs: Pfuse_fs; path: pchar; buf: pchar; size: Tsize_t; off: Toff_t;
  fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_write_buf(fs: Pfuse_fs; path: pchar; buf: Pfuse_bufvec; off: Toff_t; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_fsync(fs: Pfuse_fs; path: pchar; datasync: longint; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_flush(fs: Pfuse_fs; path: pchar; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_statfs(fs: Pfuse_fs; path: pchar; buf: Pstatvfs): longint; cdecl; external libfuse3;
function fuse_fs_opendir(fs: Pfuse_fs; path: pchar; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_readdir(fs: Pfuse_fs; path: pchar; buf: pointer; filler: Tfuse_fill_dir_t; off: Toff_t;
  fi: Pfuse_file_info; flags: Tfuse_readdir_flags): longint; cdecl; external libfuse3;
function fuse_fs_fsyncdir(fs: Pfuse_fs; path: pchar; datasync: longint; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_releasedir(fs: Pfuse_fs; path: pchar; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_create(fs: Pfuse_fs; path: pchar; mode: Tmode_t; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_lock(fs: Pfuse_fs; path: pchar; fi: Pfuse_file_info; cmd: longint; lock: Pflock): longint; cdecl; external libfuse3;
function fuse_fs_flock(fs: Pfuse_fs; path: pchar; fi: Pfuse_file_info; op: longint): longint; cdecl; external libfuse3;
function fuse_fs_chmod(fs: Pfuse_fs; path: pchar; mode: Tmode_t; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_chown(fs: Pfuse_fs; path: pchar; uid: Tuid_t; gid: Tgid_t; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_truncate(fs: Pfuse_fs; path: pchar; size: Toff_t; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_utimens(fs: Pfuse_fs; path: pchar; tv: Ptimespec; fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_access(fs: Pfuse_fs; path: pchar; mask: longint): longint; cdecl; external libfuse3;
function fuse_fs_readlink(fs: Pfuse_fs; path: pchar; buf: pchar; len: Tsize_t): longint; cdecl; external libfuse3;
function fuse_fs_mknod(fs: Pfuse_fs; path: pchar; mode: Tmode_t; rdev: Tdev_t): longint; cdecl; external libfuse3;
function fuse_fs_mkdir(fs: Pfuse_fs; path: pchar; mode: Tmode_t): longint; cdecl; external libfuse3;
function fuse_fs_setxattr(fs: Pfuse_fs; path: pchar; name: pchar; value: pchar; size: Tsize_t;
  flags: longint): longint; cdecl; external libfuse3;
function fuse_fs_getxattr(fs: Pfuse_fs; path: pchar; name: pchar; value: pchar; size: Tsize_t): longint; cdecl; external libfuse3;
function fuse_fs_listxattr(fs: Pfuse_fs; path: pchar; list: pchar; size: Tsize_t): longint; cdecl; external libfuse3;
function fuse_fs_removexattr(fs: Pfuse_fs; path: pchar; name: pchar): longint; cdecl; external libfuse3;
function fuse_fs_bmap(fs: Pfuse_fs; path: pchar; blocksize: Tsize_t; idx: Puint64_t): longint; cdecl; external libfuse3;
function fuse_fs_ioctl(fs: Pfuse_fs; path: pchar; cmd: dword; arg: pointer; fi: Pfuse_file_info;
  flags: dword; data: pointer): longint; cdecl; external libfuse3;
function fuse_fs_poll(fs: Pfuse_fs; path: pchar; fi: Pfuse_file_info; ph: Pfuse_pollhandle; reventsp: Pdword): longint; cdecl; external libfuse3;
function fuse_fs_fallocate(fs: Pfuse_fs; path: pchar; mode: longint; offset: Toff_t; length: Toff_t;
  fi: Pfuse_file_info): longint; cdecl; external libfuse3;
function fuse_fs_copy_file_range(fs: Pfuse_fs; path_in: pchar; fi_in: Pfuse_file_info; off_in: Toff_t; path_out: pchar;
  fi_out: Pfuse_file_info; off_out: Toff_t; len: Tsize_t; flags: longint): Tssize_t; cdecl; external libfuse3;
function fuse_fs_lseek(fs: Pfuse_fs; path: pchar; off: Toff_t; whence: longint; fi: Pfuse_file_info): Toff_t; cdecl; external libfuse3;
procedure fuse_fs_init(fs: Pfuse_fs; conn: Pfuse_conn_info; cfg: Pfuse_config); cdecl; external libfuse3;
procedure fuse_fs_destroy(fs: Pfuse_fs); cdecl; external libfuse3;
function fuse_notify_poll(ph: Pfuse_pollhandle): longint; cdecl; external libfuse3;
function fuse_fs_new(op: Pfuse_operations; op_size: Tsize_t; private_data: pointer): Pfuse_fs; cdecl; external libfuse3;

type
  Tfuse_module_factory_t = function(args: Pfuse_args; fs: PPfuse_fs): Pfuse_fs; cdecl;

function fuse_get_session(f: Pfuse): Pfuse_session; cdecl; external libfuse3;
function fuse_open_channel(mountpoint: pchar; options: pchar): longint; cdecl; external libfuse3;

// === Konventiert am: 31-8-25 17:01:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function fuse_main(argc: longint; argv: PPchar; op: Pfuse_operations;
  private_data: pointer): longint;
begin
  Result := fuse_main_real(argc, argv, op, SizeOf(op^), private_data);
end;


{$ENDIF read_implementation}
