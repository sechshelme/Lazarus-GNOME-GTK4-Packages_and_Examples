
unit stdio;
interface

{
  Automatically converted by H2Pas 1.0.0 from stdio.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    stdio.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PFILE  = ^FILE;
Pfpos64_t  = ^fpos64_t;
Pfpos_t  = ^fpos_t;
Pobstack  = ^obstack;
Poff64_t  = ^off64_t;
Poff_t  = ^off_t;
Psize_t  = ^size_t;
Pssize_t  = ^ssize_t;
Pva_list  = ^va_list;
Pwchar_t  = ^wchar_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Define ISO C stdio on top of C++ iostreams.
   Copyright (C) 1991-2024 Free Software Foundation, Inc.
   Copyright The GNU Toolchain Authors.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.   }
{
 *	ISO C99 Standard: 7.19 Input/output	<stdio.h>
  }
{$ifndef _STDIO_H}

const
  _STDIO_H = 1;  
{$define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION}
{$include <bits/libc-header-start.h>}
{$define __need_size_t}
{$define __need_NULL}
{$include <stddef.h>}
{$define __need___va_list}
{$include <stdarg.h>}
{$include <bits/types.h>}
{$include <bits/types/__fpos_t.h>}
{$include <bits/types/__fpos64_t.h>}
{$include <bits/types/__FILE.h>}
{$include <bits/types/FILE.h>}
{$include <bits/types/struct_FILE.h>}
{$ifdef __USE_MISC}
{$include <bits/types/cookie_io_functions_t.h>}
{$endif}
{$if defined __USE_XOPEN || defined __USE_XOPEN2K8}
{$ifdef __GNUC__}
{$ifndef _VA_LIST_DEFINED}
type
  Pva_list = ^Tva_list;
  Tva_list = Tgnuc_va_list;
{$define _VA_LIST_DEFINED}
{$endif}
{$else}
{$include <stdarg.h>}
{$endif}
{$endif}
{$if defined __USE_UNIX98 || defined __USE_XOPEN2K}
{$ifndef __off_t_defined}
{$ifndef __USE_FILE_OFFSET64}
type
  Poff_t = ^Toff_t;
  Toff_t = Toff_t;
{$else}
type
  Poff_t = ^Toff_t;
  Toff_t = Toff64_t;
{$endif}
{$define __off_t_defined}
{$endif}
{$if defined __USE_LARGEFILE64 && !defined __off64_t_defined}
type
  Poff64_t = ^Toff64_t;
  Toff64_t = Toff64_t;
{$define __off64_t_defined}
{$endif}
{$endif}
{$ifdef __USE_XOPEN2K8}
{$ifndef __ssize_t_defined}
type
  Pssize_t = ^Tssize_t;
  Tssize_t = Tssize_t;
{$define __ssize_t_defined}
{$endif}
{$endif}
{ The type of the second argument to `fgetpos' and `fsetpos'.   }
{$ifndef __USE_FILE_OFFSET64}
type
  Pfpos_t = ^Tfpos_t;
  Tfpos_t = Tfpos_t;
{$else}
type
  Pfpos_t = ^Tfpos_t;
  Tfpos_t = Tfpos64_t;
{$endif}
{$ifdef __USE_LARGEFILE64}
type
  Pfpos64_t = ^Tfpos64_t;
  Tfpos64_t = Tfpos64_t;
{$endif}
{ The possibilities for the third argument to `setvbuf'.   }
{ Fully buffered.   }

const
  _IOFBF = 0;  
{ Line buffered.   }
  _IOLBF = 1;  
{ No buffering.   }
  _IONBF = 2;  
{ Default buffer size.   }
  BUFSIZ = 8192;  
{ The value returned by fgetc and similar functions to indicate the
   end of the file.   }
  EOF = -(1);  
{ The possibilities for the third argument to `fseek'.
   These values should not be changed.   }
{ Seek from beginning of file.   }
  SEEK_SET = 0;  
{ Seek from current position.   }
  SEEK_CUR = 1;  
{ Seek from end of file.   }
  SEEK_END = 2;  
{$ifdef __USE_GNU}
{ Seek to next data.   }
  SEEK_DATA = 3;  
{ Seek to next hole.   }
  SEEK_HOLE = 4;  
{$endif}
{$if defined __USE_MISC || defined __USE_XOPEN}
{ Default path prefix for `tempnam' and `tmpnam'.   }

const
  P_tmpdir = '/tmp';  
{$endif}

const
  L_tmpnam = 20;  
  TMP_MAX = 238328;  
{ Get the values:
   FILENAME_MAX	Maximum length of a filename.   }
{$include <bits/stdio_lim.h>}
{$ifdef __USE_POSIX}

const
  L_ctermid = 9;  
{$if !defined __USE_XOPEN2K || defined __USE_GNU}

const
  L_cuserid = 9;  
{$endif}
{$endif}
{$undef  FOPEN_MAX}

const
  FOPEN_MAX = 16;  
{$if __GLIBC_USE (ISOC2X)}
{ Maximum length of printf output for a NaN.   }

const
  _PRINTF_NAN_LEN_MAX = 4;  
{$endif}
{ Standard streams.   }
  var
    stdin : PFILE;cvar;external;
{ Standard input stream.   }
    stdout : PFILE;cvar;external;
{ Standard output stream.   }
    stderr : PFILE;cvar;external;
{ Standard error output stream.   }
{ C89/C99 say they're macros.  Make them happy.   }

const
  stdin = stdin;  
  stdout = stdout;  
  stderr = stderr;  
{ Remove file FILENAME.   }
(* Const before type ignored *)

function remove(__filename:Pchar):longint;cdecl;external;
{ Rename file OLD to NEW.   }
(* Const before type ignored *)
(* Const before type ignored *)
function rename(__old:Pchar; __new:Pchar):longint;cdecl;external;
{$ifdef __USE_ATFILE}
{ Rename file OLD relative to OLDFD to NEW relative to NEWFD.   }
(* Const before type ignored *)
(* Const before type ignored *)
function renameat(__oldfd:longint; __old:Pchar; __newfd:longint; __new:Pchar):longint;cdecl;external;
{$endif}
{$ifdef __USE_GNU}
{ Flags for renameat2.   }

const
  RENAME_NOREPLACE = 1 shl 0;  
  RENAME_EXCHANGE = 1 shl 1;  
  RENAME_WHITEOUT = 1 shl 2;  
{ Rename file OLD relative to OLDFD to NEW relative to NEWFD, with
   additional flags.   }
(* Const before type ignored *)
(* Const before type ignored *)

function renameat2(__oldfd:longint; __old:Pchar; __newfd:longint; __new:Pchar; __flags:dword):longint;cdecl;external;
{$endif}
{ Close STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fclose(__stream:PFILE):longint;cdecl;external;
{ Create a temporary file and open it read/write.

   This function is a possible cancellation point and therefore not
   marked with .   }
{$ifndef __USE_FILE_OFFSET64}

function tmpfile:PFILE;cdecl;external;
{$else}
{$ifdef }
{$else}

const
  tmpfile = tmpfile64;  
{$endif}
{$endif}
{$ifdef __USE_LARGEFILE64}

function tmpfile64:PFILE;cdecl;external;
{$endif}
{ Generate a temporary filename.   }

function tmpnam(para1:array[0..(L_tmpnam)-1] of char):Pchar;cdecl;external;
{$ifdef __USE_MISC}
{ This is the reentrant variant of `tmpnam'.  The only difference is
   that it does not allow S to be NULL.   }
function tmpnam_r(__s:array[0..(L_tmpnam)-1] of char):Pchar;cdecl;external;
{$endif}
{$if defined __USE_MISC || defined __USE_XOPEN}
{ Generate a unique temporary filename using up to five characters of PFX
   if it is not NULL.  The directory to put this file in is searched for
   as follows: First the environment variable "TMPDIR" is checked.
   If it contains the name of a writable directory, that directory is used.
   If not and if DIR is not NULL, that value is checked.  If that fails,
   P_tmpdir is tried and finally "/tmp".  The storage for the filename
   is allocated by `malloc'.   }
(* Const before type ignored *)
(* Const before type ignored *)

function tempnam(__dir:Pchar; __pfx:Pchar):Pchar;cdecl;external;
{$endif}
{ Flush STREAM, or all streams if STREAM is NULL.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fflush(__stream:PFILE):longint;cdecl;external;
{$ifdef __USE_MISC}
{ Faster versions when locking is not required.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function fflush_unlocked(__stream:PFILE):longint;cdecl;external;
{$endif}
{$ifdef __USE_GNU}
{ Close all streams.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }

function fcloseall:longint;cdecl;external;
{$endif}
{$ifndef __USE_FILE_OFFSET64}
{ Open a file and create a new stream for it.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
(* Const before type ignored *)

function fopen(__filename:Pchar; __modes:Pchar):PFILE;cdecl;external;
{ Open a file, replacing an existing stream with it.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
(* Const before type ignored *)
function freopen(__filename:Pchar; __modes:Pchar; __stream:PFILE):PFILE;cdecl;external;
{$else}
{$ifdef }
{$else}
{$endif}
{$endif}
{$ifdef __USE_LARGEFILE64}
(* Const before type ignored *)
(* Const before type ignored *)

function fopen64(__filename:Pchar; __modes:Pchar):PFILE;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function freopen64(__filename:Pchar; __modes:Pchar; __stream:PFILE):PFILE;cdecl;external;
{$endif}
{$ifdef __USE_POSIX}
{ Create a new stream that refers to an existing system file descriptor.   }
(* Const before type ignored *)

function fdopen(__fd:longint; __modes:Pchar):PFILE;cdecl;external;
{$endif}
{$ifdef __USE_MISC}
{ Create a new stream that refers to the given magic cookie,
   and uses the given functions for input and output.   }
(* Const before type ignored *)

function fopencookie(__magic_cookie:pointer; __modes:Pchar; __io_funcs:Tcookie_io_functions_t):PFILE;cdecl;external;
{$endif}
{$if defined __USE_XOPEN2K8 || __GLIBC_USE (LIB_EXT2)}
{ Create a new stream that refers to a memory buffer.   }
(* Const before type ignored *)

function fmemopen(__s:pointer; __len:Tsize_t; __modes:Pchar):PFILE;cdecl;external;
{ Open a stream that writes into a malloc'd buffer that is expanded as
   necessary.  *BUFLOC and *SIZELOC are updated with the buffer's location
   and the number of characters written on fflush or fclose.   }
function open_memstream(__bufloc:PPchar; __sizeloc:Psize_t):PFILE;cdecl;external;
{$ifdef _WCHAR_H}
{ Like OPEN_MEMSTREAM, but the stream is wide oriented and produces
   a wide character string.  Declared here only to add attribute malloc
   and only if <wchar.h> has been previously #included.   }
function open_wmemstream(__bufloc:PPwchar_t; __sizeloc:Psize_t):PFILE;cdecl;external;
{$endif}
{$endif}
{ If BUF is NULL, make STREAM unbuffered.
   Else make it use buffer BUF, of size BUFSIZ.   }

procedure setbuf(__stream:PFILE; __buf:Pchar);cdecl;external;
{ Make STREAM use buffering mode MODE.
   If BUF is not NULL, use N bytes of it for buffering;
   else allocate an internal buffer N bytes long.   }
function setvbuf(__stream:PFILE; __buf:Pchar; __modes:longint; __n:Tsize_t):longint;cdecl;external;
{$ifdef __USE_MISC}
{ If BUF is NULL, make STREAM unbuffered.
   Else make it use SIZE bytes of BUF for buffering.   }
procedure setbuffer(__stream:PFILE; __buf:Pchar; __size:Tsize_t);cdecl;external;
{ Make STREAM line-buffered.   }
procedure setlinebuf(__stream:PFILE);cdecl;external;
{$endif}
{ Write formatted output to STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)

function fprintf(__stream:PFILE; __format:Pchar; args:array of const):longint;cdecl;external;
function fprintf(__stream:PFILE; __format:Pchar):longint;cdecl;external;
{ Write formatted output to stdout.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
function printf(__format:Pchar; args:array of const):longint;cdecl;external;
function printf(__format:Pchar):longint;cdecl;external;
{ Write formatted output to S.   }
(* Const before type ignored *)
function sprintf(__s:Pchar; __format:Pchar; args:array of const):longint;cdecl;external;
function sprintf(__s:Pchar; __format:Pchar):longint;cdecl;external;
{ Write formatted output to S from argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
function vfprintf(__s:PFILE; __format:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external;
{ Write formatted output to stdout from argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
function vprintf(__format:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external;
{ Write formatted output to S from argument list ARG.   }
(* Const before type ignored *)
function vsprintf(__s:Pchar; __format:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external;
{$if defined __USE_ISOC99 || defined __USE_UNIX98}
{ Maximum chars of output to write in MAXLEN.   }
(* Const before type ignored *)

function snprintf(__s:Pchar; __maxlen:Tsize_t; __format:Pchar; args:array of const):longint;cdecl;external;
function snprintf(__s:Pchar; __maxlen:Tsize_t; __format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function vsnprintf(__s:Pchar; __maxlen:Tsize_t; __format:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external;
{$endif}
{$if defined (__USE_MISC) || __GLIBC_USE (LIB_EXT2)}
{ Write formatted output to a string dynamically allocated with `malloc'.
   Store the address of the string in *PTR.   }
(* Const before type ignored *)

function vasprintf(__ptr:PPchar; __f:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external;
(* Const before type ignored *)
function __asprintf(__ptr:PPchar; __fmt:Pchar; args:array of const):longint;cdecl;external;
function __asprintf(__ptr:PPchar; __fmt:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function asprintf(__ptr:PPchar; __fmt:Pchar; args:array of const):longint;cdecl;external;
function asprintf(__ptr:PPchar; __fmt:Pchar):longint;cdecl;external;
{$endif}
{$ifdef __USE_XOPEN2K8}
{ Write formatted output to a file descriptor.   }
(* Const before type ignored *)

function vdprintf(__fd:longint; __fmt:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external;
(* Const before type ignored *)
function dprintf(__fd:longint; __fmt:Pchar; args:array of const):longint;cdecl;external;
function dprintf(__fd:longint; __fmt:Pchar):longint;cdecl;external;
{$endif}
{ Read formatted input from STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)

function fscanf(__stream:PFILE; __format:Pchar; args:array of const):longint;cdecl;external;
function fscanf(__stream:PFILE; __format:Pchar):longint;cdecl;external;
{ Read formatted input from stdin.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
function scanf(__format:Pchar; args:array of const):longint;cdecl;external;
function scanf(__format:Pchar):longint;cdecl;external;
{ Read formatted input from S.   }
(* Const before type ignored *)
(* Const before type ignored *)
function sscanf(__s:Pchar; __format:Pchar; args:array of const):longint;cdecl;external;
function sscanf(__s:Pchar; __format:Pchar):longint;cdecl;external;
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
(* Const before type ignored *)

function vfscanf(__s:PFILE; __format:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external;
{ Read formatted input from stdin into argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
function vscanf(__format:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external;
{ Read formatted input from S into argument list ARG.   }
(* Const before type ignored *)
(* Const before type ignored *)
function vsscanf(__s:Pchar; __format:Pchar; __arg:Tgnuc_va_list):longint;cdecl;external;
{ Read a character from STREAM.

   These functions are possible cancellation points and therefore not
   marked with .   }
function fgetc(__stream:PFILE):longint;cdecl;external;
function getc(__stream:PFILE):longint;cdecl;external;
{ Read a character from stdin.

   This function is a possible cancellation point and therefore not
   marked with .   }
function getchar:longint;cdecl;external;
{$ifdef __USE_POSIX199506}
{ These are defined in POSIX.1:1996.

   These functions are possible cancellation points and therefore not
   marked with .   }
function getc_unlocked(__stream:PFILE):longint;cdecl;external;
function getchar_unlocked:longint;cdecl;external;
{$endif}
{ Use POSIX.   }
{$ifdef __USE_MISC}
{ Faster version when locking is not necessary.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }

function fgetc_unlocked(__stream:PFILE):longint;cdecl;external;
{$endif}
{ Use MISC.   }
{ Write a character to STREAM.

   These functions are possible cancellation points and therefore not
   marked with .

   These functions is a possible cancellation point and therefore not
   marked with .   }

function fputc(__c:longint; __stream:PFILE):longint;cdecl;external;
function putc(__c:longint; __stream:PFILE):longint;cdecl;external;
{ Write a character to stdout.

   This function is a possible cancellation point and therefore not
   marked with .   }
function putchar(__c:longint):longint;cdecl;external;
{$ifdef __USE_MISC}
{ Faster version when locking is not necessary.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function fputc_unlocked(__c:longint; __stream:PFILE):longint;cdecl;external;
{$endif}
{ Use MISC.   }
{$ifdef __USE_POSIX199506}
{ These are defined in POSIX.1:1996.

   These functions are possible cancellation points and therefore not
   marked with .   }

function putc_unlocked(__c:longint; __stream:PFILE):longint;cdecl;external;
function putchar_unlocked(__c:longint):longint;cdecl;external;
{$endif}
{ Use POSIX.   }

function getw(__stream:PFILE):longint;cdecl;external;
{ Write a word (int) to STREAM.   }
function putw(__w:longint; __stream:PFILE):longint;cdecl;external;
{$endif}
{ Get a newline-terminated string of finite length from STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fgets(__s:Pchar; __n:longint; __stream:PFILE):Pchar;cdecl;external;
{$if __GLIBC_USE (DEPRECATED_GETS)}
{ Get a newline-terminated string from stdin, removing the newline.

   This function is impossible to use safely.  It has been officially
   removed from ISO C11 and ISO C++14, and we have also removed it
   from the _GNU_SOURCE feature list.  It remains available when
   explicitly using an old ISO C, Unix, or POSIX standard.

   This function is a possible cancellation point and therefore not
   marked with .   }

function gets(__s:Pchar):Pchar;cdecl;external;
{$endif}
{$ifdef __USE_GNU}
{ This function does the same as `fgets' but does not lock the stream.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }

function fgets_unlocked(__s:Pchar; __n:longint; __stream:PFILE):Pchar;cdecl;external;
{ Read up to (and including) a DELIMITER from STREAM into *LINEPTR
   (and null-terminate it). *LINEPTR is a pointer returned from malloc (or
   NULL), pointing to *N characters of space.  It is realloc'd as
   necessary.  Returns the number of characters read (not including the
   null terminator), or -1 on error or EOF.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with .   }
function __getdelim(__lineptr:PPchar; __n:Psize_t; __delimiter:longint; __stream:PFILE):Tssize_t;cdecl;external;
function getdelim(__lineptr:PPchar; __n:Psize_t; __delimiter:longint; __stream:PFILE):Tssize_t;cdecl;external;
{ Like `getdelim', but reads up to a newline.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function getline(__lineptr:PPchar; __n:Psize_t; __stream:PFILE):Tssize_t;cdecl;external;
{$endif}
{ Write a string to STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)

function fputs(__s:Pchar; __stream:PFILE):longint;cdecl;external;
{ Write a string, followed by a newline, to stdout.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
function puts(__s:Pchar):longint;cdecl;external;
{ Push a character back onto the input buffer of STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
function ungetc(__c:longint; __stream:PFILE):longint;cdecl;external;
{ Read chunks of generic data from STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
function fread(__ptr:pointer; __size:Tsize_t; __n:Tsize_t; __stream:PFILE):Tsize_t;cdecl;external;
{ Write chunks of generic data to STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
function fwrite(__ptr:pointer; __size:Tsize_t; __n:Tsize_t; __s:PFILE):Tsize_t;cdecl;external;
{$ifdef __USE_GNU}
{ This function does the same as `fputs' but does not lock the stream.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
(* Const before type ignored *)
function fputs_unlocked(__s:Pchar; __stream:PFILE):longint;cdecl;external;
{$endif}
{$ifdef __USE_MISC}
{ Faster versions when locking is not necessary.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with .   }

function fread_unlocked(__ptr:pointer; __size:Tsize_t; __n:Tsize_t; __stream:PFILE):Tsize_t;cdecl;external;
(* Const before type ignored *)
function fwrite_unlocked(__ptr:pointer; __size:Tsize_t; __n:Tsize_t; __stream:PFILE):Tsize_t;cdecl;external;
{$endif}
{ Seek to a certain position on STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fseek(__stream:PFILE; __off:longint; __whence:longint):longint;cdecl;external;
{ Return the current position of STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
function ftell(__stream:PFILE):longint;cdecl;external;
{ Rewind to the beginning of STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
procedure rewind(__stream:PFILE);cdecl;external;
{ The Single Unix Specification, Version 2, specifies an alternative,
   more adequate interface for the two functions above which deal with
   file offset.  `long int' is not the right type.  These definitions
   are originally defined in the Large File Support API.   }
{$if defined __USE_LARGEFILE || defined __USE_XOPEN2K}
{$ifndef __USE_FILE_OFFSET64}
{ Seek to a certain position on STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fseeko(__stream:PFILE; __off:Toff_t; __whence:longint):longint;cdecl;external;
{ Return the current position of STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
function ftello(__stream:PFILE):Toff_t;cdecl;external;
{$ifndef __USE_FILE_OFFSET64}
{ Get STREAM's position.

   This function is a possible cancellation point and therefore not
   marked with .   }

function fgetpos(__stream:PFILE; __pos:Pfpos_t):longint;cdecl;external;
{ Set STREAM's position.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
function fsetpos(__stream:PFILE; __pos:Pfpos_t):longint;cdecl;external;
{$ifdef __USE_LARGEFILE64}
function fseeko64(__stream:PFILE; __off:Toff64_t; __whence:longint):longint;cdecl;external;
function ftello64(__stream:PFILE):Toff64_t;cdecl;external;
function fgetpos64(__stream:PFILE; __pos:Pfpos64_t):longint;cdecl;external;
(* Const before type ignored *)
function fsetpos64(__stream:PFILE; __pos:Pfpos64_t):longint;cdecl;external;
{$endif}
{ Clear the error and EOF indicators for STREAM.   }

procedure clearerr(__stream:PFILE);cdecl;external;
{ Return the EOF indicator for STREAM.   }
function feof(__stream:PFILE):longint;cdecl;external;
{ Return the error indicator for STREAM.   }
function ferror(__stream:PFILE):longint;cdecl;external;
{$ifdef __USE_MISC}
{ Faster versions when locking is not required.   }
procedure clearerr_unlocked(__stream:PFILE);cdecl;external;
function feof_unlocked(__stream:PFILE):longint;cdecl;external;
function ferror_unlocked(__stream:PFILE):longint;cdecl;external;
{$endif}
{ Print a message describing the meaning of the value of errno.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)

procedure perror(__s:Pchar);cdecl;external;
{$ifdef __USE_POSIX}
{ Return the system file descriptor for STREAM.   }
function fileno(__stream:PFILE):longint;cdecl;external;
{$endif}
{ Use POSIX.   }
{$ifdef __USE_MISC}
{ Faster version when locking is not required.   }

function fileno_unlocked(__stream:PFILE):longint;cdecl;external;
{$endif}
{$ifdef __USE_POSIX2}
{ Close a stream opened by popen and return the status of its child.

   This function is a possible cancellation point and therefore not
   marked with .   }

function pclose(__stream:PFILE):longint;cdecl;external;
{ Create a new stream connected to a pipe running the given command.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
(* Const before type ignored *)
function popen(__command:Pchar; __modes:Pchar):PFILE;cdecl;external;
{$endif}
{$ifdef __USE_POSIX}
{ Return the name of the controlling terminal.   }

function ctermid(__s:Pchar):Pchar;cdecl;external;
{$endif}
{ Use POSIX.   }
{$if (defined __USE_XOPEN && !defined __USE_XOPEN2K) || defined __USE_GNU}
{ Return the name of the current user.   }

function cuserid(__s:Pchar):Pchar;cdecl;external;
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
(* Const before type ignored *)

function obstack_printf(__obstack:Pobstack; __format:Pchar; args:array of const):longint;cdecl;external;
function obstack_printf(__obstack:Pobstack; __format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function obstack_vprintf(__obstack:Pobstack; __format:Pchar; __args:Tgnuc_va_list):longint;cdecl;external;
{$endif}
{ Use GNU.   }
{$ifdef __USE_POSIX199506}
{ These are defined in POSIX.1:1996.   }
{ Acquire ownership of STREAM.   }

procedure flockfile(__stream:PFILE);cdecl;external;
{ Try to acquire ownership of STREAM but do not block if it is not
   possible.   }
function ftrylockfile(__stream:PFILE):longint;cdecl;external;
{ Relinquish the ownership granted for STREAM.   }
procedure funlockfile(__stream:PFILE);cdecl;external;
{$endif}
{ POSIX  }
{$if defined __USE_XOPEN && !defined __USE_XOPEN2K && !defined __USE_GNU}
{  X/Open Issues 1-5 required getopt to be declared in this
   header.  It was removed in Issue 6.  GNU follows Issue 6.   }
{$include <bits/getopt_posix.h>}
{$endif}
{ Slow-path routines used by the optimized inline functions in
   bits/stdio.h.   }

function __uflow(para1:PFILE):longint;cdecl;external;
function __overflow(para1:PFILE; para2:longint):longint;cdecl;external;
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

implementation


end.
