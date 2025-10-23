unit fp_stat;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // /usr/include/x86_64-linux-gnu/bits/struct_stat.h

type
  Tstat = record
    st_dev: Tdev_t;
    st_ino: Tino_t;
    st_nlink: Tnlink_t;
    st_mode: Tmode_t;
    st_uid: Tuid_t;
    st_gid: Tgid_t;
    __pad0: longint;
    st_rdev: Tdev_t;
    st_size: Toff_t;
    st_blksize: Tblksize_t;
    st_blocks: Tblkcnt_t;
    st_atime: Ttimespec;
    st_mtime: Ttimespec;
    st_ctime: Ttimespec;
    __glibc_reserved: array[0..2] of Tsyscall_slong_t;
  end;
  Pstat = ^Tstat;


  // /usr/include/x86_64-linux-gnu/bits/stat.h

const
  __S_IFMT = &170000;
  __S_IFDIR = &0040000;
  __S_IFCHR = &0020000;
  __S_IFBLK = &0060000;
  __S_IFREG = &0100000;
  __S_IFIFO = &0010000;
  __S_IFLNK = &0120000;
  __S_IFSOCK = &0140000;

const
  __S_ISUID = &04000;
  __S_ISGID = &02000;
  __S_ISVTX = &01000;
  __S_IREAD = &0400;
  __S_IWRITE = &0200;
  __S_IEXEC = &0100;


  // /usr/include/x86_64-linux-gnu/sys/stat.h

const
  S_IFMT = __S_IFMT;
  S_IFDIR = __S_IFDIR;
  S_IFCHR = __S_IFCHR;
  S_IFBLK = __S_IFBLK;
  S_IFREG = __S_IFREG;
  S_IFIFO = __S_IFIFO;
  S_IFLNK = __S_IFLNK;
  S_IFSOCK = __S_IFSOCK;

function __S_ISTYPE(mode, mask: DWord): boolean;

function S_ISDIR(mode: DWord): boolean;
function S_ISCHR(mode: DWord): boolean;
function S_ISBLK(mode: DWord): boolean;
function S_ISREG(mode: DWord): boolean;
function S_ISFIFO(mode: DWord): boolean;
function S_ISLNK(mode: DWord): boolean;

const
  S_TYPEISMQ = 0;
  S_TYPEISSEM = 0;
  S_TYPEISSHM = 0;

const
  S_ISUID = __S_ISUID;
  S_ISGID = __S_ISGID;
  S_ISVTX = __S_ISVTX;

const
  S_IRUSR = __S_IREAD;
  S_IWUSR = __S_IWRITE;
  S_IXUSR = __S_IEXEC;
  S_IRWXU = __S_IREAD or __S_IWRITE or __S_IEXEC;

const
  S_IRGRP = S_IRUSR shr 3;
  S_IWGRP = S_IWUSR shr 3;
  S_IXGRP = S_IXUSR shr 3;
  S_IRWXG = S_IRWXU shr 3;
  S_IROTH = S_IRGRP shr 3;
  S_IWOTH = S_IWGRP shr 3;
  S_IXOTH = S_IXGRP shr 3;
  S_IRWXO = S_IRWXG shr 3;
  ACCESSPERMS = (S_IRWXU or S_IRWXG) or S_IRWXO;
  ALLPERMS = ((((S_ISUID or S_ISGID) or S_ISVTX) or S_IRWXU) or S_IRWXG) or S_IRWXO;
  DEFFILEMODE = ((((S_IRUSR or S_IWUSR) or S_IRGRP) or S_IWGRP) or S_IROTH) or S_IWOTH;
  S_BLKSIZE = 512;

function stat(__file: pchar; __buf: Pstat): longint; cdecl; external libc;
function fstat(__fd: longint; __buf: Pstat): longint; cdecl; external libc;
function fstatat(__fd: longint; __file: pchar; __buf: Pstat; __flag: longint): longint; cdecl; external libc;
function lstat(__file: pchar; __buf: Pstat): longint; cdecl; external libc;

function chmod(__file: pchar; __mode: Tmode_t): longint; cdecl; external libc;
function lchmod(__file: pchar; __mode: Tmode_t): longint; cdecl; external libc;
function fchmod(__fd: longint; __mode: Tmode_t): longint; cdecl; external libc;
function fchmodat(__fd: longint; __file: pchar; __mode: Tmode_t; __flag: longint): longint; cdecl; external libc;
function umask(__mask: Tmode_t): Tmode_t; cdecl; external libc;
function getumask: Tmode_t; cdecl; external libc;
function mkdir(__path: pchar; __mode: Tmode_t): longint; cdecl; external libc;
function mkdirat(__fd: longint; __path: pchar; __mode: Tmode_t): longint; cdecl; external libc;
function mknod(__path: pchar; __mode: Tmode_t; __dev: Tdev_t): longint; cdecl; external libc;
function mknodat(__fd: longint; __path: pchar; __mode: Tmode_t; __dev: Tdev_t): longint; cdecl; external libc;
function mkfifo(__path: pchar; __mode: Tmode_t): longint; cdecl; external libc;
function mkfifoat(__fd: longint; __path: pchar; __mode: Tmode_t): longint; cdecl; external libc;
function utimensat(__fd: longint; __path: pchar; __times: Ptimespec; __flags: longint): longint; cdecl; external libc;

function futimens(__fd: longint; __times: Ptimespec): longint; cdecl; external libc;

// === Konventiert am: 2-9-25 13:35:54 ===


implementation


function __S_ISTYPE(mode, mask: DWord): boolean;
begin
  __S_ISTYPE := mode and __S_IFMT = mask;
end;

function S_ISDIR(mode: DWord): boolean;
begin
  S_ISDIR := __S_ISTYPE(mode, __S_IFDIR);
end;

function S_ISCHR(mode: DWord): boolean;
begin
  S_ISCHR := __S_ISTYPE(mode, __S_IFCHR);
end;

function S_ISBLK(mode: DWord): boolean;
begin
  S_ISBLK := __S_ISTYPE(mode, __S_IFBLK);
end;

function S_ISREG(mode: DWord): boolean;
begin
  S_ISREG := __S_ISTYPE(mode, __S_IFREG);
end;

function S_ISFIFO(mode: DWord): boolean;
begin
  S_ISFIFO := __S_ISTYPE(mode, __S_IFIFO);
end;

function S_ISLNK(mode: DWord): boolean;
begin
  S_ISLNK := __S_ISTYPE(mode, __S_IFLNK);
end;


end.
