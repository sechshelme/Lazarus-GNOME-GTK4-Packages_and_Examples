unit fcntl_linux;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  O_ACCMODE = 0003;
  O_RDONLY = 00;
  O_WRONLY = 01;
  O_RDWR = 02;
  O_CREAT = 0100;
  O_EXCL = 0200;
  O_NOCTTY = 0400;
  O_TRUNC = 01000;
  O_APPEND = 02000;
  O_NONBLOCK = 04000;
  O_NDELAY = O_NONBLOCK;
  O_SYNC = 04010000;

  O_FSYNC = O_SYNC;
  O_ASYNC = 020000;
  __O_LARGEFILE = 0100000;
  __O_DIRECTORY = 0200000;
  __O_NOFOLLOW = 0400000;
  __O_CLOEXEC = 02000000;
  __O_DIRECT = 040000;
  __O_NOATIME = 01000000;
  __O_PATH = 010000000;
  __O_DSYNC = 010000;
  __O_TMPFILE = 020000000 or __O_DIRECTORY;

const
  F_GETLK = 5;
  F_SETLK = 6;
  F_SETLKW = 7;

const
  F_GETLK64 = 12;
  F_SETLK64 = 13;
  F_SETLKW64 = 14;

const
  F_OFD_GETLK = 36;
  F_OFD_SETLK = 37;
  F_OFD_SETLKW = 38;

const
  O_LARGEFILE = __O_LARGEFILE;
  O_DIRECTORY = __O_DIRECTORY;
  O_NOFOLLOW = __O_NOFOLLOW;
  O_CLOEXEC = __O_CLOEXEC;
  O_DIRECT = __O_DIRECT;
  O_NOATIME = __O_NOATIME;
  O_PATH = __O_PATH;
  O_TMPFILE = __O_TMPFILE;
  O_DSYNC = __O_DSYNC;
  O_RSYNC = O_SYNC;

const
  F_DUPFD = 0;
  F_GETFD = 1;
  F_SETFD = 2;
  F_GETFL = 3;
  F_SETFL = 4;

const
  __F_SETOWN = 8;
  __F_GETOWN = 9;

const
  F_SETOWN = __F_SETOWN;
  F_GETOWN = __F_GETOWN;

const
  __F_SETSIG = 10;
  __F_GETSIG = 11;

const
  __F_SETOWN_EX = 15;
  __F_GETOWN_EX = 16;

const
  F_SETSIG = __F_SETSIG;
  F_GETSIG = __F_GETSIG;
  F_SETOWN_EX = __F_SETOWN_EX;
  F_GETOWN_EX = __F_GETOWN_EX;

const
  F_SETLEASE = 1024;
  F_GETLEASE = 1025;
  F_NOTIFY = 1026;
  F_SETPIPE_SZ = 1031;
  F_GETPIPE_SZ = 1032;
  F_ADD_SEALS = 1033;
  F_GET_SEALS = 1034;
  F_GET_RW_HINT = 1035;
  F_SET_RW_HINT = 1036;
  F_GET_FILE_RW_HINT = 1037;
  F_SET_FILE_RW_HINT = 1038;

const
  F_DUPFD_CLOEXEC = 1030;

const
  FD_CLOEXEC = 1;

const
  F_RDLCK = 0;
  F_WRLCK = 1;
  F_UNLCK = 2;

const
  F_EXLCK = 4;
  F_SHLCK = 8;

const
  LOCK_SH = 1;
  LOCK_EX = 2;
  LOCK_NB = 4;
  LOCK_UN = 8;

const
  LOCK_MAND = 32;
  LOCK_READ = 64;
  LOCK_WRITE = 128;
  LOCK_RW = 192;

const
  DN_ACCESS = $00000001;
  DN_MODIFY = $00000002;
  DN_CREATE = $00000004;
  DN_DELETE = $00000008;
  DN_RENAME = $00000010;
  DN_ATTRIB = $00000020;
  DN_MULTISHOT = $80000000;

type
  T_pid_type = longint;

const
  F_OWNER_TID = 0;
  F_OWNER_PID = 1;
  F_OWNER_PGRP = 2;
  F_OWNER_GID = F_OWNER_PGRP;

type
  Tf_owner_ex = record
    _type: T_pid_type;
    pid: Tpid_t;
  end;
  Pf_owner_ex = ^Tf_owner_ex;

const
  F_SEAL_SEAL = $0001;
  F_SEAL_SHRINK = $0002;
  F_SEAL_GROW = $0004;
  F_SEAL_WRITE = $0008;
  F_SEAL_FUTURE_WRITE = $0010;
  F_SEAL_EXEC = $0020;

const
  RWH_WRITE_LIFE_NOT_SET = 0;
  RWF_WRITE_LIFE_NOT_SET = RWH_WRITE_LIFE_NOT_SET;
  RWH_WRITE_LIFE_NONE = 1;
  RWH_WRITE_LIFE_SHORT = 2;
  RWH_WRITE_LIFE_MEDIUM = 3;
  RWH_WRITE_LIFE_LONG = 4;
  RWH_WRITE_LIFE_EXTREME = 5;

const
  FAPPEND = O_APPEND;
  FFSYNC = O_FSYNC;
  FASYNC = O_ASYNC;
  FNONBLOCK = O_NONBLOCK;
  FNDELAY = O_NDELAY;

const
  __POSIX_FADV_DONTNEED = 4;
  __POSIX_FADV_NOREUSE = 5;

const
  POSIX_FADV_NORMAL = 0;
  POSIX_FADV_RANDOM = 1;
  POSIX_FADV_SEQUENTIAL = 2;
  POSIX_FADV_WILLNEED = 3;
  POSIX_FADV_DONTNEED = __POSIX_FADV_DONTNEED;
  POSIX_FADV_NOREUSE = __POSIX_FADV_NOREUSE;

const
  SYNC_FILE_RANGE_WAIT_BEFORE = 1;
  SYNC_FILE_RANGE_WRITE = 2;
  SYNC_FILE_RANGE_WAIT_AFTER = 4;
  SYNC_FILE_RANGE_WRITE_AND_WAIT = (SYNC_FILE_RANGE_WRITE or SYNC_FILE_RANGE_WAIT_BEFORE) or SYNC_FILE_RANGE_WAIT_AFTER;
  SPLICE_F_MOVE = 1;
  SPLICE_F_NONBLOCK = 2;
  SPLICE_F_MORE = 4;
  SPLICE_F_GIFT = 8;

type
  Tfile_handle = record
    handle_bytes: dword;
    handle_type: longint;
    //      f_handle : array[0..-1] of byte;
  end;
  Pfile_handle = ^Tfile_handle;

const
  MAX_HANDLE_SZ = 128;
  //  AT_HANDLE_FID = AT_REMOVEDIR;

function readahead(__fd: longint; __offset: Toff64_t; __count: Tsize_t): Tssize_t; cdecl; external libc;
function sync_file_range(__fd: longint; __offset: Toff64_t; __count: Toff64_t; __flags: dword): longint; cdecl; external libc;
function vmsplice(__fdout: longint; __iov: Piovec; __count: Tsize_t; __flags: dword): Tssize_t; cdecl; external libc;
function splice(__fdin: longint; __offin: Poff64_t; __fdout: longint; __offout: Poff64_t; __len: Tsize_t; __flags: dword): Tssize_t; cdecl; external libc;
function tee(__fdin: longint; __fdout: longint; __len: Tsize_t; __flags: dword): Tssize_t; cdecl; external libc;

function fallocate(__fd: longint; __mode: longint; __offset: Toff_t; __len: Toff_t): longint; cdecl; external libc;
function fallocate64(__fd: longint; __mode: longint; __offset: Toff64_t; __len: Toff64_t): longint; cdecl; external libc;

function name_to_handle_at(__dfd: longint; __name: pchar; __handle: Pfile_handle; __mnt_id: Plongint; __flags: longint): longint; cdecl; external libc;
function open_by_handle_at(__mountdirfd: longint; __handle: Pfile_handle; __flags: longint): longint; cdecl; external libc;

// === Konventiert am: 10-7-25 16:37:05 ===


implementation



end.
