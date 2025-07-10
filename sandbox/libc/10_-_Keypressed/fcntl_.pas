unit fcntl_;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/fcntl.h

type
  Pmode_t = ^Tmode_t;
  Tmode_t = integer;

const
  S_IFMT = $F000;   // 0170000
  S_IFSOCK = $C000;   // 0140000
  S_IFLNK = $A000;   // 0120000
  S_IFREG = $8000;   // 0100000
  S_IFBLK = $6000;   // 0060000
  S_IFDIR = $4000;   // 0040000
  S_IFCHR = $2000;   // 0020000
  S_IFIFO = $1000;   // 0010000

  S_ISUID = $0800;   // 0004000
  S_ISGID = $0400;   // 0002000
  S_ISVTX = $0200;   // 0001000

  S_IRUSR = $0100;   // 0000400
  S_IWUSR = $0080;   // 0000200
  S_IXUSR = $0040;   // 0000100
  S_IRWXU = $01C0;   // 0000700

  S_IRGRP = $0020;   // 0000040
  S_IWGRP = $0010;   // 0000020
  S_IXGRP = $0008;   // 0000010
  S_IRWXG = $0038;   // 0000070

  S_IROTH = $0004;   // 0000004
  S_IWOTH = $0002;   // 0000002
  S_IXOTH = $0001;   // 0000001
  S_IRWXO = $0007;   // 0000007

const
  R_OK = 4;
  W_OK = 2;
  X_OK = 1;
  F_OK = 0;

const
  SEEK_SET = 0;
  SEEK_CUR = 1;
  SEEK_END = 2;

const
  AT_FDCWD = -(100);
  AT_SYMLINK_NOFOLLOW = $100;
  AT_REMOVEDIR = $200;
  AT_SYMLINK_FOLLOW = $400;

const
  AT_NO_AUTOMOUNT = $800;
  AT_EMPTY_PATH = $1000;
  AT_STATX_SYNC_TYPE = $6000;
  AT_STATX_SYNC_AS_STAT = $0000;
  AT_STATX_FORCE_SYNC = $2000;
  AT_STATX_DONT_SYNC = $4000;
  AT_RECURSIVE = $8000;

const
  AT_EACCESS = $200;

function fcntl(__fd: longint; __cmd: longint): longint; cdecl; varargs; external libc;
function fcntl64(__fd: longint; __cmd: longint): longint; cdecl; varargs; external libc;

function open(__file: pchar; __oflag: longint): longint; cdecl; varargs; external libc;
function open64(__file: pchar; __oflag: longint): longint; cdecl; varargs; external libc;

function openat(__fd: longint; __file: pchar; __oflag: longint): longint; cdecl; varargs; external libc;
function openat64(__fd: longint; __file: pchar; __oflag: longint): longint; cdecl; varargs; external libc;

function creat(__file: pchar; __mode: Tmode_t): longint; cdecl; external libc;
function creat64(__file: pchar; __mode: Tmode_t): longint; cdecl; external libc;

const
  F_ULOCK = 0;
  F_LOCK = 1;
  F_TLOCK = 2;
  F_TEST = 3;

function lockf(__fd: longint; __cmd: longint; __len: Toff_t): longint; cdecl; external libc;
function lockf64(__fd: longint; __cmd: longint; __len: Toff64_t): longint; cdecl; external libc;

function posix_fadvise(__fd: longint; __offset: Toff_t; __len: Toff_t; __advise: longint): longint; cdecl; external libc;
function posix_fadvise64(__fd: longint; __offset: Toff64_t; __len: Toff64_t; __advise: longint): longint; cdecl; external libc;

function posix_fallocate(__fd: longint; __offset: Toff_t; __len: Toff_t): longint; cdecl; external libc;
function posix_fallocate64(__fd: longint; __offset: Toff64_t; __len: Toff64_t): longint; cdecl; external libc;

// === Konventiert am: 10-7-25 16:19:17 ===


implementation



end.
