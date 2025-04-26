unit stdio;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

// ============

const
  libc='c';

type
  Tgnuc_va_list=Pointer;

  Toff64_t=SizeUInt;
  Poff64_t = ^Toff64_t;

  Tssize_t = SizeUInt;
  Pssize_t = ^Tssize_t;

  Tfpos64_t=SizeUInt;

  Tfpos_t = Tfpos64_t;
  Pfpos_t = ^Tfpos_t;

  PFILE=Pointer;

// ============

const
  _STDIO_H = 1;  
type
  Pva_list = ^Tva_list;
  Tva_list = Tgnuc_va_list;
type
  Poff_t = ^Toff_t;
  Toff_t = Toff64_t;

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
  _PRINTF_NAN_LEN_MAX = 4;
  var
    stdin : PFILE;cvar;external libc;
    stdout : PFILE;cvar;external libc;
    stderr : PFILE;cvar;external libc;


function remove(__filename:Pchar):longint;cdecl;external libc;
function rename(__old:Pchar; __new:Pchar):longint;cdecl;external libc;
function renameat(__oldfd:longint; __old:Pchar; __newfd:longint; __new:Pchar):longint;cdecl;external libc;
const
  RENAME_NOREPLACE = 1 shl 0;  
  RENAME_EXCHANGE = 1 shl 1;  
  RENAME_WHITEOUT = 1 shl 2;  

function renameat2(__oldfd:longint; __old:Pchar; __newfd:longint; __new:Pchar; __flags:dword):longint;cdecl;external libc;

function fclose(__stream:PFILE):longint;cdecl;external libc;

function tmpfile:PFILE;cdecl;external libc;
//const
//tmpfile = tmpfile64;

function tmpfile64:PFILE;cdecl;external libc;

function tmpnam(para1:array[0..(L_tmpnam)-1] of char):Pchar;cdecl;external libc;
function tmpnam_r(__s:array[0..(L_tmpnam)-1] of char):Pchar;cdecl;external libc;

function tempnam(__dir:Pchar; __pfx:Pchar):Pchar;cdecl;external libc;
{$endif}
{ Flush STREAM, or all streams if STREAM is NULL.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fflush(__stream:PFILE):longint;cdecl;external libc;
{$ifdef __USE_MISC}
{ Faster versions when locking is not required.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function fflush_unlocked(__stream:PFILE):longint;cdecl;external libc;
{$endif}
{$ifdef __USE_GNU}
{ Close all streams.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }

function fcloseall:longint;cdecl;external libc;
{$endif}
{$ifndef __USE_FILE_OFFSET64}
{ Open a file and create a new stream for it.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fopen(__filename:Pchar; __modes:Pchar):PFILE;cdecl;external libc;
{ Open a file, replacing an existing stream with it.

   This function is a possible cancellation point and therefore not
   marked with .   }
function freopen(__filename:Pchar; __modes:Pchar; __stream:PFILE):PFILE;cdecl;external libc;
{$else}
{$ifdef }
{$else}
{$endif}
{$endif}
{$ifdef __USE_LARGEFILE64}

function fopen64(__filename:Pchar; __modes:Pchar):PFILE;cdecl;external libc;
function freopen64(__filename:Pchar; __modes:Pchar; __stream:PFILE):PFILE;cdecl;external libc;
{$endif}
{$ifdef __USE_POSIX}
{ Create a new stream that refers to an existing system file descriptor.   }

function fdopen(__fd:longint; __modes:Pchar):PFILE;cdecl;external libc;
{$endif}
{$ifdef __USE_MISC}
{ Create a new stream that refers to the given magic cookie,
   and uses the given functions for input and output.   }

function fopencookie(__magic_cookie:pointer; __modes:Pchar; __io_funcs:Tcookie_io_functions_t):PFILE;cdecl;external libc;
{$endif}
{$if defined __USE_XOPEN2K8 || __GLIBC_USE (LIB_EXT2)}
{ Create a new stream that refers to a memory buffer.   }

function fmemopen(__s:pointer; __len:Tsize_t; __modes:Pchar):PFILE;cdecl;external libc;
{ Open a stream that writes into a malloc'd buffer that is expanded as
   necessary.  *BUFLOC and *SIZELOC are updated with the buffer's location
   and the number of characters written on fflush or fclose.   }
function open_memstream(__bufloc:PPchar; __sizeloc:Psize_t):PFILE;cdecl;external libc;
{$ifdef _WCHAR_H}
{ Like OPEN_MEMSTREAM, but the stream is wide oriented and produces
   a wide character string.  Declared here only to add attribute malloc
   and only if <wchar.h> has been previously #included.   }
function open_wmemstream(__bufloc:PPwchar_t; __sizeloc:Psize_t):PFILE;cdecl;external libc;
{$endif}
{$endif}
{ If BUF is NULL, make STREAM unbuffered.
   Else make it use buffer BUF, of size BUFSIZ.   }

procedure setbuf(__stream:PFILE; __buf:Pchar);cdecl;external libc;
{ Make STREAM use buffering mode MODE.
   If BUF is not NULL, use N bytes of it for buffering;
   else allocate an internal buffer N bytes long.   }
function setvbuf(__stream:PFILE; __buf:Pchar; __modes:longint; __n:Tsize_t):longint;cdecl;external libc;
{$ifdef __USE_MISC}
{ If BUF is NULL, make STREAM unbuffered.
   Else make it use SIZE bytes of BUF for buffering.   }
procedure setbuffer(__stream:PFILE; __buf:Pchar; __size:Tsize_t);cdecl;external libc;
{ Make STREAM line-buffered.   }
procedure setlinebuf(__stream:PFILE);cdecl;external libc;
{$endif}
{ Write formatted output to STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fprintf(__stream:PFILE; __format:Pchar; args:array of const):longint;cdecl;external libc;
function fprintf(__stream:PFILE; __format:Pchar):longint;cdecl;external libc;
{ Write formatted output to stdout.

   This function is a possible cancellation point and therefore not
   marked with .   }
function printf(__format:Pchar; args:array of const):longint;cdecl;external libc;
function printf(__format:Pchar):longint;cdecl;external libc;
{ Write formatted output to S.   }
function sprintf(__s:Pchar; __format:Pchar; args:array of const):longint;cdecl;external libc;
function sprintf(__s:Pchar; __format:Pchar):longint;cdecl;external libc;
{ Write formatted output to S from argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .   }
function vfprintf(__s:PFILE; __format:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external libc;
{ Write formatted output to stdout from argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .   }
function vprintf(__format:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external libc;
{ Write formatted output to S from argument list ARG.   }
function vsprintf(__s:Pchar; __format:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external libc;
{$if defined __USE_ISOC99 || defined __USE_UNIX98}
{ Maximum chars of output to write in MAXLEN.   }

function snprintf(__s:Pchar; __maxlen:Tsize_t; __format:Pchar; args:array of const):longint;cdecl;external libc;
function snprintf(__s:Pchar; __maxlen:Tsize_t; __format:Pchar):longint;cdecl;external libc;
function vsnprintf(__s:Pchar; __maxlen:Tsize_t; __format:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external libc;
{$endif}
{$if defined (__USE_MISC) || __GLIBC_USE (LIB_EXT2)}
{ Write formatted output to a string dynamically allocated with `malloc'.
   Store the address of the string in *PTR.   }

function vasprintf(__ptr:PPchar; __f:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external libc;
function __asprintf(__ptr:PPchar; __fmt:Pchar; args:array of const):longint;cdecl;external libc;
function __asprintf(__ptr:PPchar; __fmt:Pchar):longint;cdecl;external libc;
function asprintf(__ptr:PPchar; __fmt:Pchar; args:array of const):longint;cdecl;external libc;
function asprintf(__ptr:PPchar; __fmt:Pchar):longint;cdecl;external libc;
{$endif}
{$ifdef __USE_XOPEN2K8}
{ Write formatted output to a file descriptor.   }

function vdprintf(__fd:longint; __fmt:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external libc;
function dprintf(__fd:longint; __fmt:Pchar; args:array of const):longint;cdecl;external libc;
function dprintf(__fd:longint; __fmt:Pchar):longint;cdecl;external libc;
{$endif}
{ Read formatted input from STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fscanf(__stream:PFILE; __format:Pchar; args:array of const):longint;cdecl;external libc;
function fscanf(__stream:PFILE; __format:Pchar):longint;cdecl;external libc;
{ Read formatted input from stdin.

   This function is a possible cancellation point and therefore not
   marked with .   }
function scanf(__format:Pchar; args:array of const):longint;cdecl;external libc;
function scanf(__format:Pchar):longint;cdecl;external libc;
{ Read formatted input from S.   }
function sscanf(__s:Pchar; __format:Pchar; args:array of const):longint;cdecl;external libc;
function sscanf(__s:Pchar; __format:Pchar):longint;cdecl;external libc;
{ For historical reasons, the C99-compliant versions of the scanf
   functions are at alternative names.  When __LDBL_COMPAT or
   __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI are in effect, this is handled in
   bits/stdio-ldbl.h.   }
{$include <bits/floatn.h>}
{$else}
{$ifdef }
{$ifdef __USE_ISOC99}
{ Read formatted input from S into argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .   }

function vfscanf(__s:PFILE; __format:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external libc;
{ Read formatted input from stdin into argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .   }
function vscanf(__format:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external libc;
{ Read formatted input from S into argument list ARG.   }
function vsscanf(__s:Pchar; __format:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external libc;
{ Read a character from STREAM.

   These functions are possible cancellation points and therefore not
   marked with .   }
function fgetc(__stream:PFILE):longint;cdecl;external libc;
function getc(__stream:PFILE):longint;cdecl;external libc;
{ Read a character from stdin.

   This function is a possible cancellation point and therefore not
   marked with .   }
function getchar:longint;cdecl;external libc;
{$ifdef __USE_POSIX199506}
{ These are defined in POSIX.1:1996.

   These functions are possible cancellation points and therefore not
   marked with .   }
function getc_unlocked(__stream:PFILE):longint;cdecl;external libc;
function getchar_unlocked:longint;cdecl;external libc;
{$endif}
{ Use POSIX.   }
{$ifdef __USE_MISC}
{ Faster version when locking is not necessary.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }

function fgetc_unlocked(__stream:PFILE):longint;cdecl;external libc;
{$endif}
{ Use MISC.   }
{ Write a character to STREAM.

   These functions are possible cancellation points and therefore not
   marked with .

   These functions is a possible cancellation point and therefore not
   marked with .   }

function fputc(__c:longint; __stream:PFILE):longint;cdecl;external libc;
function putc(__c:longint; __stream:PFILE):longint;cdecl;external libc;
{ Write a character to stdout.

   This function is a possible cancellation point and therefore not
   marked with .   }
function putchar(__c:longint):longint;cdecl;external libc;
{$ifdef __USE_MISC}
{ Faster version when locking is not necessary.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function fputc_unlocked(__c:longint; __stream:PFILE):longint;cdecl;external libc;
{$endif}
{ Use MISC.   }
{$ifdef __USE_POSIX199506}
{ These are defined in POSIX.1:1996.

   These functions are possible cancellation points and therefore not
   marked with .   }

function putc_unlocked(__c:longint; __stream:PFILE):longint;cdecl;external libc;
function putchar_unlocked(__c:longint):longint;cdecl;external libc;
{$endif}
{ Use POSIX.   }

function getw(__stream:PFILE):longint;cdecl;external libc;
{ Write a word (int) to STREAM.   }
function putw(__w:longint; __stream:PFILE):longint;cdecl;external libc;
{$endif}
{ Get a newline-terminated string of finite length from STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fgets(__s:Pchar; __n:longint; __stream:PFILE):Pchar;cdecl;external libc;
{$if __GLIBC_USE (DEPRECATED_GETS)}
{ Get a newline-terminated string from stdin, removing the newline.

   This function is impossible to use safely.  It has been officially
   removed from ISO C11 and ISO C++14, and we have also removed it
   from the _GNU_SOURCE feature list.  It remains available when
   explicitly using an old ISO C, Unix, or POSIX standard.

   This function is a possible cancellation point and therefore not
   marked with .   }

function gets(__s:Pchar):Pchar;cdecl;external libc;
{$endif}
{$ifdef __USE_GNU}
{ This function does the same as `fgets' but does not lock the stream.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }

function fgets_unlocked(__s:Pchar; __n:longint; __stream:PFILE):Pchar;cdecl;external libc;
{ Read up to (and including) a DELIMITER from STREAM into *LINEPTR
   (and null-terminate it). *LINEPTR is a pointer returned from malloc (or
   NULL), pointing to *N characters of space.  It is realloc'd as
   necessary.  Returns the number of characters read (not including the
   null terminator), or -1 on error or EOF.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with .   }
function __getdelim(__lineptr:PPchar; __n:Psize_t; __delimiter:longint; __stream:PFILE):Tssize_t;cdecl;external libc;
function getdelim(__lineptr:PPchar; __n:Psize_t; __delimiter:longint; __stream:PFILE):Tssize_t;cdecl;external libc;
{ Like `getdelim', but reads up to a newline.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function getline(__lineptr:PPchar; __n:Psize_t; __stream:PFILE):Tssize_t;cdecl;external libc;
{$endif}
{ Write a string to STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fputs(__s:Pchar; __stream:PFILE):longint;cdecl;external libc;
{ Write a string, followed by a newline, to stdout.

   This function is a possible cancellation point and therefore not
   marked with .   }
function puts(__s:Pchar):longint;cdecl;external libc;
{ Push a character back onto the input buffer of STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
function ungetc(__c:longint; __stream:PFILE):longint;cdecl;external libc;
{ Read chunks of generic data from STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
function fread(__ptr:pointer; __size:Tsize_t; __n:Tsize_t; __stream:PFILE):Tsize_t;cdecl;external libc;
{ Write chunks of generic data to STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
function fwrite(__ptr:pointer; __size:Tsize_t; __n:Tsize_t; __s:PFILE):Tsize_t;cdecl;external libc;
{$ifdef __USE_GNU}
{ This function does the same as `fputs' but does not lock the stream.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function fputs_unlocked(__s:Pchar; __stream:PFILE):longint;cdecl;external libc;
{$endif}
{$ifdef __USE_MISC}
{ Faster versions when locking is not necessary.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with .   }

function fread_unlocked(__ptr:pointer; __size:Tsize_t; __n:Tsize_t; __stream:PFILE):Tsize_t;cdecl;external libc;
function fwrite_unlocked(__ptr:pointer; __size:Tsize_t; __n:Tsize_t; __stream:PFILE):Tsize_t;cdecl;external libc;
{$endif}
{ Seek to a certain position on STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fseek(__stream:PFILE; __off:longint; __whence:longint):longint;cdecl;external libc;
{ Return the current position of STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
function ftell(__stream:PFILE):longint;cdecl;external libc;
{ Rewind to the beginning of STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
procedure rewind(__stream:PFILE);cdecl;external libc;
{ The Single Unix Specification, Version 2, specifies an alternative,
   more adequate interface for the two functions above which deal with
   file offset.  `long int' is not the right type.  These definitions
   are originally defined in the Large File Support API.   }
{$if defined __USE_LARGEFILE || defined __USE_XOPEN2K}
{$ifndef __USE_FILE_OFFSET64}
{ Seek to a certain position on STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fseeko(__stream:PFILE; __off:Toff_t; __whence:longint):longint;cdecl;external libc;
{ Return the current position of STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
function ftello(__stream:PFILE):Toff_t;cdecl;external libc;
{$ifndef __USE_FILE_OFFSET64}
{ Get STREAM's position.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fgetpos(__stream:PFILE; __pos:Pfpos_t):longint;cdecl;external libc;
{ Set STREAM's position.

   This function is a possible cancellation point and therefore not
   marked with .   }
function fsetpos(__stream:PFILE; __pos:Pfpos_t):longint;cdecl;external libc;
{$ifdef __USE_LARGEFILE64}
function fseeko64(__stream:PFILE; __off:Toff64_t; __whence:longint):longint;cdecl;external libc;
function ftello64(__stream:PFILE):Toff64_t;cdecl;external libc;
function fgetpos64(__stream:PFILE; __pos:Pfpos64_t):longint;cdecl;external libc;
function fsetpos64(__stream:PFILE; __pos:Pfpos64_t):longint;cdecl;external libc;
{$endif}
{ Clear the error and EOF indicators for STREAM.   }

procedure clearerr(__stream:PFILE);cdecl;external libc;
{ Return the EOF indicator for STREAM.   }
function feof(__stream:PFILE):longint;cdecl;external libc;
{ Return the error indicator for STREAM.   }
function ferror(__stream:PFILE):longint;cdecl;external libc;
{$ifdef __USE_MISC}
{ Faster versions when locking is not required.   }
procedure clearerr_unlocked(__stream:PFILE);cdecl;external libc;
function feof_unlocked(__stream:PFILE):longint;cdecl;external libc;
function ferror_unlocked(__stream:PFILE):longint;cdecl;external libc;
{$endif}
{ Print a message describing the meaning of the value of errno.

   This function is a possible cancellation point and therefore not
   marked with .   }

procedure perror(__s:Pchar);cdecl;external libc;
{$ifdef __USE_POSIX}
{ Return the system file descriptor for STREAM.   }
function fileno(__stream:PFILE):longint;cdecl;external libc;
{$endif}
{ Use POSIX.   }
{$ifdef __USE_MISC}
{ Faster version when locking is not required.   }

function fileno_unlocked(__stream:PFILE):longint;cdecl;external libc;
{$endif}
{$ifdef __USE_POSIX2}
{ Close a stream opened by popen and return the status of its child.

   This function is a possible cancellation point and therefore not
   marked with .   }

function pclose(__stream:PFILE):longint;cdecl;external libc;
{ Create a new stream connected to a pipe running the given command.

   This function is a possible cancellation point and therefore not
   marked with .   }
function popen(__command:Pchar; __modes:Pchar):PFILE;cdecl;external libc;
{$endif}
{$ifdef __USE_POSIX}
{ Return the name of the controlling terminal.   }

function ctermid(__s:Pchar):Pchar;cdecl;external libc;
{$endif}
{ Use POSIX.   }
{$if (defined __USE_XOPEN && !defined __USE_XOPEN2K) || defined __USE_GNU}
{ Return the name of the current user.   }

function cuserid(__s:Pchar):Pchar;cdecl;external libc;
{$endif}
{ Use X/Open, but not issue 6.   }
{$ifdef __USE_GNU}
type
  Pobstack = ^Tobstack;
  Tobstack = record
      {undefined structure}
    end;

{ See <obstack.h>.   }
{ Write formatted output to an obstack.   }

function obstack_printf(__obstack:Pobstack; __format:Pchar; args:array of const):longint;cdecl;external libc;
function obstack_printf(__obstack:Pobstack; __format:Pchar):longint;cdecl;external libc;
function obstack_vprintf(__obstack:Pobstack; __format:Pchar; __args:Tgnuc_va_list):longint;cdecl;external libc;
{$endif}
{ Use GNU.   }
{$ifdef __USE_POSIX199506}
{ These are defined in POSIX.1:1996.   }
{ Acquire ownership of STREAM.   }

procedure flockfile(__stream:PFILE);cdecl;external libc;
{ Try to acquire ownership of STREAM but do not block if it is not
   possible.   }
function ftrylockfile(__stream:PFILE):longint;cdecl;external libc;
{ Relinquish the ownership granted for STREAM.   }
procedure funlockfile(__stream:PFILE);cdecl;external libc;
{$endif}
{ POSIX  }
{$if defined __USE_XOPEN && !defined __USE_XOPEN2K && !defined __USE_GNU}
{  X/Open Issues 1-5 required getopt to be declared in this
   header.  It was removed in Issue 6.  GNU follows Issue 6.   }
{$include <bits/getopt_posix.h>}
{$endif}
{ Slow-path routines used by the optimized inline functions in
   bits/stdio.h.   }

function __uflow(para1:PFILE):longint;cdecl;external libc;
function __overflow(para1:PFILE; para2:longint):longint;cdecl;external libc;
{$if __USE_FORTIFY_LEVEL > 0 && defined __fortify_function}
{ Declare all functions from bits/stdio2-decl.h first.   }
{$include <bits/stdio2-decl.h>}
{$endif}
{ The following headers provide asm redirections.  These redirections must
   appear before the first usage of these functions, e.g. in bits/stdio.h.   }
{$if defined __LDBL_COMPAT || __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI == 1}
{$include <bits/stdio-ldbl.h>}
{$endif}
{ If we are compiling with optimizing read this file.  It contains
   several optimizing inline functions and macros.   }
{$ifdef __USE_EXTERN_INLINES}
{$include <bits/stdio.h>}
{$endif}
{$if __USE_FORTIFY_LEVEL > 0 && defined __fortify_function}
{ Now include the function definitions and redirects too.   }
{$include <bits/stdio2.h>}
{$endif}
{$endif}
{ <stdio.h> included.   }

// === Konventiert am: 26-4-25 17:13:16 ===


implementation



end.
