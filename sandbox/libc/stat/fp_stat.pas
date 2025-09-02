unit fp_stat;

interface

uses
  clib, stat_bits, struct_stat;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  S_IFMT = __S_IFMT;
  S_IFDIR = __S_IFDIR;
  S_IFCHR = __S_IFCHR;
  S_IFBLK = __S_IFBLK;
  S_IFREG = __S_IFREG;
  S_IFIFO = __S_IFIFO;
  S_IFLNK = __S_IFLNK;
  S_IFSOCK = __S_IFSOCK;

function __S_ISTYPE(mode, mask: DWord): Boolean;

function S_ISDIR(mode: DWord): Boolean;
function S_ISCHR(mode: DWord): Boolean;
function S_ISBLK(mode: DWord): Boolean;
function S_ISREG(mode: DWord): Boolean;
function S_ISFIFO(mode: DWord): Boolean;
function S_ISLNK(mode: DWord): Boolean;

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
  S_IRWXU = (__S_IREAD or __S_IWRITE) or __S_IEXEC;
  //{$ifdef __USE_MISC}
  //  S_IREAD = S_IRUSR;
  //  S_IWRITE = S_IWUSR;
  //  S_IEXEC = S_IXUSR;
  //{$endif}
  { Read by group.   }

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


function __S_ISTYPE(mode, mask: DWord): Boolean;
begin
  __S_ISTYPE := mode and __S_IFMT = mask;
end;

function S_ISDIR(mode: DWord): Boolean;
begin
  S_ISDIR := __S_ISTYPE(mode, __S_IFDIR);
end;

function S_ISCHR(mode: DWord): Boolean;
begin
  S_ISCHR := __S_ISTYPE(mode, __S_IFCHR);
end;

function S_ISBLK(mode: DWord): Boolean;
begin
  S_ISBLK := __S_ISTYPE(mode, __S_IFBLK);
end;

function S_ISREG(mode: DWord): Boolean;
begin
  S_ISREG := __S_ISTYPE(mode, __S_IFREG);
end;

function S_ISFIFO(mode: DWord): Boolean;
begin
  S_ISFIFO := __S_ISTYPE(mode, __S_IFIFO);
end;

function S_ISLNK(mode: DWord): Boolean;
begin
  S_ISLNK := False;
end;


end.
