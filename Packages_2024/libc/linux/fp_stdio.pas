unit fp_stdio;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  Pva_list = ^Tva_list;
  Tva_list = Tgnuc_va_list;

const
  _IOFBF = 0;
  _IOLBF = 1;
  _IONBF = 2;
  BUFSIZ = 8192;
  EOF = -(1);
  SEEK_SET = 0;
  SEEK_CUR = 1;
  SEEK_END = 2;
  SEEK_DATA = 3;
  SEEK_HOLE = 4;

const
  P_tmpdir = '/tmp';

const
  L_tmpnam = 20;
  TMP_MAX = 238328;

const
  L_ctermid = 9;
  L_cuserid = 9;
  FOPEN_MAX = 16;

const
  _PRINTF_NAN_LEN_MAX = 4;

var
  stdin: PFILE; cvar;external libc;
  stdout: PFILE; cvar;external libc;
  stderr: PFILE; cvar;external libc;


function remove(__filename: pchar): longint; cdecl; external libc;
function rename(__old: pchar; __new: pchar): longint; cdecl; external libc;
function renameat(__oldfd: longint; __old: pchar; __newfd: longint; __new: pchar): longint; cdecl; external libc;

const
  RENAME_NOREPLACE = 1 shl 0;
  RENAME_EXCHANGE = 1 shl 1;
  RENAME_WHITEOUT = 1 shl 2;

function renameat2(__oldfd: longint; __old: pchar; __newfd: longint; __new: pchar; __flags: dword): longint; cdecl; external libc;

function fclose(__stream: PFILE): longint; cdecl; external libc;
function tmpfile: PFILE; cdecl; external libc;
function tmpfile64: PFILE; cdecl; external libc;

function tmpnam(para1: pchar): pchar; cdecl; external libc;
function tmpnam_r(__s: pchar): pchar; cdecl; external libc;

function tempnam(__dir: pchar; __pfx: pchar): pchar; cdecl; external libc;
function fflush(__stream: PFILE): longint; cdecl; external libc;
function fflush_unlocked(__stream: PFILE): longint; cdecl; external libc;
function fcloseall: longint; cdecl; external libc;
function fopen(__filename: pchar; __modes: pchar): PFILE; cdecl; external libc;
function freopen(__filename: pchar; __modes: pchar; __stream: PFILE): PFILE; cdecl; external libc;
function fopen64(__filename: pchar; __modes: pchar): PFILE; cdecl; external libc;
function freopen64(__filename: pchar; __modes: pchar; __stream: PFILE): PFILE; cdecl; external libc;
function fdopen(__fd: longint; __modes: pchar): PFILE; cdecl; external libc;
function fopencookie(__magic_cookie: pointer; __modes: pchar; __io_funcs: Tcookie_io_functions_t): PFILE; cdecl; external libc;
function fmemopen(__s: pointer; __len: Tsize_t; __modes: pchar): PFILE; cdecl; external libc;
function open_memstream(__bufloc: PPchar; __sizeloc: Psize_t): PFILE; cdecl; external libc;
function open_wmemstream(__bufloc: PPwchar_t; __sizeloc: Psize_t): PFILE; cdecl; external libc;
procedure setbuf(__stream: PFILE; __buf: pchar); cdecl; external libc;
function setvbuf(__stream: PFILE; __buf: pchar; __modes: longint; __n: Tsize_t): longint; cdecl; external libc;
procedure setbuffer(__stream: PFILE; __buf: pchar; __size: Tsize_t); cdecl; external libc;
procedure setlinebuf(__stream: PFILE); cdecl; external libc;
function fprintf(__stream: PFILE; __format: pchar): longint; cdecl; varargs; external libc;
function printf(__format: pchar): longint; cdecl; varargs; external libc;
function sprintf(__s: pchar; __format: pchar): longint; cdecl; varargs; external libc;
function vfprintf(__s: PFILE; __format: pchar; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function vprintf(__format: pchar; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function vsprintf(__s: pchar; __format: pchar; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function snprintf(__s: pchar; __maxlen: Tsize_t; __format: pchar): longint; cdecl; varargs; external libc;
function vsnprintf(__s: pchar; __maxlen: Tsize_t; __format: pchar; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function vasprintf(__ptr: PPchar; __f: pchar; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function asprintf(__ptr: PPchar; __fmt: pchar): longint; cdecl; varargs; external libc;
function vdprintf(__fd: longint; __fmt: pchar; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function dprintf(__fd: longint; __fmt: pchar; args: array of const): longint; cdecl; external libc;
function dprintf(__fd: longint; __fmt: pchar): longint; cdecl; external libc;
function fscanf(__stream: PFILE; __format: pchar): longint; cdecl; varargs; external libc;
function scanf(__format: pchar): longint; cdecl; varargs; external libc;
function sscanf(__s: pchar; __format: pchar): longint; cdecl; varargs; external libc;

function vfscanf(__s: PFILE; __format: pchar; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function vscanf(__format: pchar; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function vsscanf(__s: pchar; __format: pchar; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function fgetc(__stream: PFILE): longint; cdecl; external libc;
function getc(__stream: PFILE): longint; cdecl; external libc;
function getchar: longint; cdecl; external libc;
function getc_unlocked(__stream: PFILE): longint; cdecl; external libc;
function getchar_unlocked: longint; cdecl; external libc;
function fgetc_unlocked(__stream: PFILE): longint; cdecl; external libc;
function fputc(__c: longint; __stream: PFILE): longint; cdecl; external libc;
function putc(__c: longint; __stream: PFILE): longint; cdecl; external libc;
function putchar(__c: longint): longint; cdecl; external libc;
function fputc_unlocked(__c: longint; __stream: PFILE): longint; cdecl; external libc;
function putc_unlocked(__c: longint; __stream: PFILE): longint; cdecl; external libc;
function putchar_unlocked(__c: longint): longint; cdecl; external libc;
function getw(__stream: PFILE): longint; cdecl; external libc;
function putw(__w: longint; __stream: PFILE): longint; cdecl; external libc;
function fgets(__s: pchar; __n: longint; __stream: PFILE): pchar; cdecl; external libc;
function gets(__s: pchar): pchar; cdecl; external libc; deprecated;
function fgets_unlocked(__s: pchar; __n: longint; __stream: PFILE): pchar; cdecl; external libc;
function getdelim(__lineptr: PPchar; __n: Psize_t; __delimiter: longint; __stream: PFILE): Tssize_t; cdecl; external libc;
function getline(__lineptr: PPchar; __n: Psize_t; __stream: PFILE): Tssize_t; cdecl; external libc;
function fputs(__s: pchar; __stream: PFILE): longint; cdecl; external libc;
function puts(__s: pchar): longint; cdecl; external libc;
function ungetc(__c: longint; __stream: PFILE): longint; cdecl; external libc;
function fread(__ptr: pointer; __size: Tsize_t; __n: Tsize_t; __stream: PFILE): Tsize_t; cdecl; external libc;
function fwrite(__ptr: pointer; __size: Tsize_t; __n: Tsize_t; __s: PFILE): Tsize_t; cdecl; external libc;
function fputs_unlocked(__s: pchar; __stream: PFILE): longint; cdecl; external libc;
function fread_unlocked(__ptr: pointer; __size: Tsize_t; __n: Tsize_t; __stream: PFILE): Tsize_t; cdecl; external libc;
function fwrite_unlocked(__ptr: pointer; __size: Tsize_t; __n: Tsize_t; __stream: PFILE): Tsize_t; cdecl; external libc;
function fseek(__stream: PFILE; __off: longint; __whence: longint): longint; cdecl; external libc;
function ftell(__stream: PFILE): longint; cdecl; external libc;
procedure rewind(__stream: PFILE); cdecl; external libc;
function fseeko(__stream: PFILE; __off: Toff_t; __whence: longint): longint; cdecl; external libc;
function ftello(__stream: PFILE): Toff_t; cdecl; external libc;
function fgetpos(__stream: PFILE; __pos: Pfpos_t): longint; cdecl; external libc;
function fsetpos(__stream: PFILE; __pos: Pfpos_t): longint; cdecl; external libc;
function fseeko64(__stream: PFILE; __off: Toff64_t; __whence: longint): longint; cdecl; external libc;
function ftello64(__stream: PFILE): Toff64_t; cdecl; external libc;
function fgetpos64(__stream: PFILE; __pos: Pfpos64_t): longint; cdecl; external libc;
function fsetpos64(__stream: PFILE; __pos: Pfpos64_t): longint; cdecl; external libc;
procedure clearerr(__stream: PFILE); cdecl; external libc;
function feof(__stream: PFILE): longint; cdecl; external libc;
function ferror(__stream: PFILE): longint; cdecl; external libc;
procedure clearerr_unlocked(__stream: PFILE); cdecl; external libc;
function feof_unlocked(__stream: PFILE): longint; cdecl; external libc;
function ferror_unlocked(__stream: PFILE): longint; cdecl; external libc;
procedure perror(__s: pchar); cdecl; external libc;
function fileno(__stream: PFILE): longint; cdecl; external libc;
function fileno_unlocked(__stream: PFILE): longint; cdecl; external libc;
function pclose(__stream: PFILE): longint; cdecl; external libc;
function popen(__command: pchar; __modes: pchar): PFILE; cdecl; external libc;
function ctermid(__s: pchar): pchar; cdecl; external libc;
function cuserid(__s: pchar): pchar; cdecl; external libc;

type
  Pobstack = type Pointer;

function obstack_printf(__obstack: Pobstack; __format: pchar): longint; cdecl; varargs; external libc;
function obstack_vprintf(__obstack: Pobstack; __format: pchar; __args: Tgnuc_va_list): longint; cdecl; external libc;

procedure flockfile(__stream: PFILE); cdecl; external libc;
function ftrylockfile(__stream: PFILE): longint; cdecl; external libc;
procedure funlockfile(__stream: PFILE); cdecl; external libc;


// === Konventiert am: 15-7-25 17:51:16 ===


implementation



end.
