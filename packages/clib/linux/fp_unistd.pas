unit fp_unistd;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // ========= /usr/include/x86_64-linux-gnu/bits/unistd_ext.h

function gettid: Tpid_t; cdecl; external libc;

const
  CLOSE_RANGE_UNSHARE = 1 shl 1;
  CLOSE_RANGE_CLOEXEC = 1 shl 2;


  // ========= /usr/include/unistd.h

const
  STDIN_FILENO = 0;
  STDOUT_FILENO = 1;
  STDERR_FILENO = 2;

type
  Puseconds_t = ^Tuseconds_t;
  Tuseconds_t = uint32;

type
  Pintptr_t = ^Tintptr_t;
  Tintptr_t = longint;

type
  Psocklen_t = ^Tsocklen_t;
  Tsocklen_t = uint32;

const
  R_OK = 4;
  W_OK = 2;
  X_OK = 1;
  F_OK = 0;

function access(__name: pchar; __type: longint): longint; cdecl; external libc;
function euidaccess(__name: pchar; __type: longint): longint; cdecl; external libc;
function eaccess(__name: pchar; __type: longint): longint; cdecl; external libc;
function execveat(__fd: longint; __path: pchar; __argv: PPchar; __envp: PPchar; __flags: longint): longint; cdecl; external libc;
function faccessat(__fd: longint; __file: pchar; __type: longint; __flag: longint): longint; cdecl; external libc;

const
  SEEK_SET = 0;
  SEEK_CUR = 1;
  SEEK_END = 2;

const
  SEEK_DATA = 3;
  SEEK_HOLE = 4;

const
  L_SET = SEEK_SET;
  L_INCR = SEEK_CUR;
  L_XTND = SEEK_END;

function lseek(__fd: longint; __offset: Toff_t; __whence: longint): Toff_t; cdecl; external libc;
function lseek64(__fd: longint; __offset: Toff64_t; __whence: longint): Toff64_t; cdecl; external libc;

function close(__fd: longint): longint; cdecl; external libc;
procedure closefrom(__lowfd: longint); cdecl; external libc;
function read(__fd: longint; __buf: pointer; __nbytes: Tsize_t): Tssize_t; cdecl; external libc;
function write(__fd: longint; __buf: pointer; __n: Tsize_t): Tssize_t; cdecl; external libc;

function pread(__fd: longint; __buf: pointer; __nbytes: Tsize_t; __offset: Toff_t): Tssize_t; cdecl; external libc;
function pwrite(__fd: longint; __buf: pointer; __n: Tsize_t; __offset: Toff_t): Tssize_t; cdecl; external libc;
function pread64(__fd: longint; __buf: pointer; __nbytes: Tsize_t; __offset: Toff64_t): Tssize_t; cdecl; external libc;
function pwrite64(__fd: longint; __buf: pointer; __n: Tsize_t; __offset: Toff64_t): Tssize_t; cdecl; external libc;

function pipe(__pipedes: plongint): longint; cdecl; external libc;
function pipe2(__pipedes: PLongint; __flags: longint): longint; cdecl; external libc;
function alarm(__seconds: dword): dword; cdecl; external libc;
function sleep(__seconds: dword): dword; cdecl; external libc;
function ualarm(__value: Tuseconds_t; __interval: Tuseconds_t): Tuseconds_t; cdecl; external libc;
function usleep(__useconds: Tuseconds_t): longint; cdecl; external libc;
function pause: longint; cdecl; external libc;
function chown(__file: pchar; __owner: Tuid_t; __group: Tgid_t): longint; cdecl; external libc;
function fchown(__fd: longint; __owner: Tuid_t; __group: Tgid_t): longint; cdecl; external libc;
function lchown(__file: pchar; __owner: Tuid_t; __group: Tgid_t): longint; cdecl; external libc;
function fchownat(__fd: longint; __file: pchar; __owner: Tuid_t; __group: Tgid_t; __flag: longint): longint; cdecl; external libc;
function chdir(__path: pchar): longint; cdecl; external libc;
function fchdir(__fd: longint): longint; cdecl; external libc;
function getcwd(__buf: pchar; __size: Tsize_t): pchar; cdecl; external libc;
function get_current_dir_name: pchar; cdecl; external libc;
function getwd(__buf: pchar): pchar; cdecl; external libc;
function dup(__fd: longint): longint; cdecl; external libc;
function dup2(__fd: longint; __fd2: longint): longint; cdecl; external libc;
function dup3(__fd: longint; __fd2: longint; __flags: longint): longint; cdecl; external libc;

var
  environ: PPchar; cvar;external libc;

function execve(__path: pchar; __argv: PPchar; __envp: PPchar): longint; cdecl; external libc;
function fexecve(__fd: longint; __argv: PPchar; __envp: PPchar): longint; cdecl; external libc;
function execv(__path: pchar; __argv: PPchar): longint; cdecl; external libc;
function execle(__path: pchar; __arg: pchar): longint; cdecl; varargs; external libc;
function execl(__path: pchar; __arg: pchar): longint; cdecl; varargs; external libc;
function execvp(__file: pchar; __argv: PPchar): longint; cdecl; external libc;
function execlp(__file: pchar; __arg: pchar): longint; cdecl; varargs; external libc;
function execvpe(__file: pchar; __argv: PPchar; __envp: PPchar): longint; cdecl; external libc;
function nice(__inc: longint): longint; cdecl; external libc;
procedure _exit(__status: longint); cdecl; external libc;
function pathconf(__path: pchar; __name: longint): longint; cdecl; external libc;
function fpathconf(__fd: longint; __name: longint): longint; cdecl; external libc;
function sysconf(__name: longint): longint; cdecl; external libc;
function confstr(__name: longint; __buf: pchar; __len: Tsize_t): Tsize_t; cdecl; external libc;

function getpid: Tpid_t; cdecl; external libc;
function getppid: Tpid_t; cdecl; external libc;
function getpgrp: Tpid_t; cdecl; external libc;
function __getpgid(__pid: Tpid_t): Tpid_t; cdecl; external libc;
function getpgid(__pid: Tpid_t): Tpid_t; cdecl; external libc;
function setpgid(__pid: Tpid_t; __pgid: Tpid_t): longint; cdecl; external libc;
function setpgrp: longint; cdecl; external libc;
function setsid: Tpid_t; cdecl; external libc;
function getsid(__pid: Tpid_t): Tpid_t; cdecl; external libc;
function getuid: Tuid_t; cdecl; external libc;
function geteuid: Tuid_t; cdecl; external libc;
function getgid: Tgid_t; cdecl; external libc;
function getegid: Tgid_t; cdecl; external libc;
function getgroups(__size: longint; __list: Pgid_t): longint; cdecl; external libc;
function group_member(__gid: Tgid_t): longint; cdecl; external libc;
function setuid(__uid: Tuid_t): longint; cdecl; external libc;
function setreuid(__ruid: Tuid_t; __euid: Tuid_t): longint; cdecl; external libc;
function seteuid(__uid: Tuid_t): longint; cdecl; external libc;
function setgid(__gid: Tgid_t): longint; cdecl; external libc;
function setregid(__rgid: Tgid_t; __egid: Tgid_t): longint; cdecl; external libc;
function setegid(__gid: Tgid_t): longint; cdecl; external libc;
function getresuid(__ruid: Puid_t; __euid: Puid_t; __suid: Puid_t): longint; cdecl; external libc;
function getresgid(__rgid: Pgid_t; __egid: Pgid_t; __sgid: Pgid_t): longint; cdecl; external libc;
function setresuid(__ruid: Tuid_t; __euid: Tuid_t; __suid: Tuid_t): longint; cdecl; external libc;
function setresgid(__rgid: Tgid_t; __egid: Tgid_t; __sgid: Tgid_t): longint; cdecl; external libc;
function fork: Tpid_t; cdecl; external libc;
function vfork: Tpid_t; cdecl; external libc;
function _Fork: Tpid_t; cdecl; external libc;
function ttyname(__fd: longint): pchar; cdecl; external libc;
function ttyname_r(__fd: longint; __buf: pchar; __buflen: Tsize_t): longint; cdecl; external libc;
function isatty(__fd: longint): longint; cdecl; external libc;
function ttyslot: longint; cdecl; external libc;
function link(__from: pchar; __to: pchar): longint; cdecl; external libc;
function linkat(__fromfd: longint; __from: pchar; __tofd: longint; __to: pchar; __flags: longint): longint; cdecl; external libc;
function symlink(__from: pchar; __to: pchar): longint; cdecl; external libc;
function readlink(__path: pchar; __buf: pchar; __len: Tsize_t): Tssize_t; cdecl; external libc;
function symlinkat(__from: pchar; __tofd: longint; __to: pchar): longint; cdecl; external libc;
function readlinkat(__fd: longint; __path: pchar; __buf: pchar; __len: Tsize_t): Tssize_t; cdecl; external libc;
function unlink(__name: pchar): longint; cdecl; external libc;
function unlinkat(__fd: longint; __name: pchar; __flag: longint): longint; cdecl; external libc;
function rmdir(__path: pchar): longint; cdecl; external libc;
function tcgetpgrp(__fd: longint): Tpid_t; cdecl; external libc;
function tcsetpgrp(__fd: longint; __pgrp_id: Tpid_t): longint; cdecl; external libc;

function getlogin: pchar; cdecl; external libc;
function getlogin_r(__name: pchar; __name_len: Tsize_t): longint; cdecl; external libc;
function setlogin(__name: pchar): longint; cdecl; external libc;
function gethostname(__name: pchar; __len: Tsize_t): longint; cdecl; external libc;
function sethostname(__name: pchar; __len: Tsize_t): longint; cdecl; external libc;
function sethostid(__id: longint): longint; cdecl; external libc;
function getdomainname(__name: pchar; __len: Tsize_t): longint; cdecl; external libc;
function setdomainname(__name: pchar; __len: Tsize_t): longint; cdecl; external libc;
function vhangup: longint; cdecl; external libc;
function revoke(__file: pchar): longint; cdecl; external libc;
function profil(__sample_buffer: Pword; __size: Tsize_t; __offset: Tsize_t; __scale: dword): longint; cdecl; external libc;
function acct(__name: pchar): longint; cdecl; external libc;
function getusershell: pchar; cdecl; external libc;
procedure endusershell; cdecl; external libc;
procedure setusershell; cdecl; external libc;
function daemon(__nochdir: longint; __noclose: longint): longint; cdecl; external libc;
function chroot(__path: pchar): longint; cdecl; external libc;
function getpass(__prompt: pchar): pchar; cdecl; external libc;
function fsync(__fd: longint): longint; cdecl; external libc;
function syncfs(__fd: longint): longint; cdecl; external libc;
function gethostid: longint; cdecl; external libc;
procedure sync; cdecl; external libc;
function getpagesize: longint; cdecl; external libc;
function getdtablesize: longint; cdecl; external libc;

function truncate(__file: pchar; __length: Toff_t): longint; cdecl; external libc;
function truncate64(__file: pchar; __length: Toff64_t): longint; cdecl; external libc;

function ftruncate(__fd: longint; __length: Toff_t): longint; cdecl; external libc;
function ftruncate64(__fd: longint; __length: Toff64_t): longint; cdecl; external libc;

function brk(__addr: pointer): longint; cdecl; external libc;
function sbrk(__delta: Tintptr_t): pointer; cdecl; external libc;
function syscall(__sysno: longint): longint; cdecl; varargs; external libc;

const
  F_ULOCK = 0;
  F_LOCK = 1;
  F_TLOCK = 2;
  F_TEST = 3;

function lockf(__fd: longint; __cmd: longint; __len: Toff_t): longint; cdecl; external libc;
function lockf64(__fd: longint; __cmd: longint; __len: Toff64_t): longint; cdecl; external libc;

function copy_file_range(__infd: longint; __pinoff: Poff64_t; __outfd: longint; __poutoff: Poff64_t; __length: Tsize_t; __flags: dword): Tssize_t; cdecl; external libc;
function fdatasync(__fildes: longint): longint; cdecl; external libc;
function crypt(__key: pchar; __salt: pchar): pchar; cdecl; external libc;
procedure swab(__from: pointer; __to: pointer; __n: Tssize_t); cdecl; external libc;
function ctermid(__s: pchar): pchar; cdecl; external libc;
function cuserid(__s: pchar): pchar; cdecl; external libc;

type
  TProc = procedure; libc;

function pthread_atfork(__prepare: TProc; __parent: TProc; __child: TProc): longint; cdecl; external libc;
function getentropy(__buffer: pointer; __length: Tsize_t): longint; cdecl; external libc;
function close_range(__fd: dword; __max_fd: dword; __flags: longint): longint; cdecl; external libc;

// === Konventiert am: 1-7-25 17:34:43 ===


implementation



end.
