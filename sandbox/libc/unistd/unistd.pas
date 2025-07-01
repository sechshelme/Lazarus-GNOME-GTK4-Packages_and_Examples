unit unistd;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


//const
//  _UNISTD_H = 1;  
//{$include <features.h>}
//{ These may be used to determine what facilities are present at compile time.
//   Their values can be obtained at run time from `sysconf'.   }
//{$ifdef __USE_XOPEN2K8}
//{ POSIX Standard approved as ISO/IEC 9945-1 as of September 2008.   }
//
//const
//  _POSIX_VERSION = 200809;  
//(*** was #elif ****){$else defined __USE_XOPEN2K}
//{ POSIX Standard approved as ISO/IEC 9945-1 as of December 2001.   }
//
//const
//  _POSIX_VERSION = 200112;  
//(*** was #elif ****){$else defined __USE_POSIX199506}
//{ POSIX Standard approved as ISO/IEC 9945-1 as of June 1995.   }
//
//const
//  _POSIX_VERSION = 199506;  
//(*** was #elif ****){$else defined __USE_POSIX199309}
//{ POSIX Standard approved as ISO/IEC 9945-1 as of September 1993.   }
//
//const
//  _POSIX_VERSION = 199309;  
//{$else}
//{ POSIX Standard approved as ISO/IEC 9945-1 as of September 1990.   }
//
//const
//  _POSIX_VERSION = 199009;  
//{$endif}
//{ These are not #ifdef __USE_POSIX2 because they are
//   in the theoretically application-owned namespace.   }
//{$ifdef __USE_XOPEN2K8}
//
//const
//  __POSIX2_THIS_VERSION = 200809;  
//{ The utilities on GNU systems also correspond to this version.   }
//(*** was #elif ****){$else defined __USE_XOPEN2K}
//{ The utilities on GNU systems also correspond to this version.   }
//
//const
//  __POSIX2_THIS_VERSION = 200112;  
//(*** was #elif ****){$else defined __USE_POSIX199506}
//{ The utilities on GNU systems also correspond to this version.   }
//
//const
//  __POSIX2_THIS_VERSION = 199506;  
//{$else}
//{ The utilities on GNU systems also correspond to this version.   }
//
//const
//  __POSIX2_THIS_VERSION = 199209;  
//{$endif}
//{ The utilities on GNU systems also correspond to this version.   }
//
//const
//  _POSIX2_VERSION = __POSIX2_THIS_VERSION;  
//{ This symbol was required until the 2001 edition of POSIX.   }
//  _POSIX2_C_VERSION = __POSIX2_THIS_VERSION;  
//{ If defined, the implementation supports the
//   C Language Bindings Option.   }
//  _POSIX2_C_BIND = __POSIX2_THIS_VERSION;  
//{ If defined, the implementation supports the
//   C Language Development Utilities Option.   }
//  _POSIX2_C_DEV = __POSIX2_THIS_VERSION;  
//{ If defined, the implementation supports the
//   Software Development Utilities Option.   }
//  _POSIX2_SW_DEV = __POSIX2_THIS_VERSION;  
//{ If defined, the implementation supports the
//   creation of locales with the localedef utility.   }
//  _POSIX2_LOCALEDEF = __POSIX2_THIS_VERSION;  
//{ X/Open version number to which the library conforms.  It is selectable.   }
//{$ifdef __USE_XOPEN2K8}
//  _XOPEN_VERSION = 700;  
//(*** was #elif ****){$else defined __USE_XOPEN2K}
//
//const
//  _XOPEN_VERSION = 600;  
//(*** was #elif ****){$else defined __USE_UNIX98}
//
//const
//  _XOPEN_VERSION = 500;  
//{$else}
//
//const
//  _XOPEN_VERSION = 4;  
//{$endif}
//{ Commands and utilities from XPG4 are available.   }
//
//const
//  _XOPEN_XCU_VERSION = 4;  
//{ We are compatible with the old published standards as well.   }
//  _XOPEN_XPG2 = 1;  
//  _XOPEN_XPG3 = 1;  
//  _XOPEN_XPG4 = 1;  
//{ The X/Open Unix extensions are available.   }
//  _XOPEN_UNIX = 1;  
//{ The enhanced internationalization capabilities according to XPG4.2
//   are present.   }
//  _XOPEN_ENH_I18N = 1;  
//{ The legacy interfaces are also available.   }
//  _XOPEN_LEGACY = 1;  
//{ Get values of POSIX options:
//
//   If these symbols are defined, the corresponding features are
//   always available.  If not, they may be available sometimes.
//   The current values can be obtained with `sysconf'.
//
//   _POSIX_JOB_CONTROL		Job control is supported.
//   _POSIX_SAVED_IDS		Processes have a saved set-user-ID
//				and a saved set-group-ID.
//   _POSIX_REALTIME_SIGNALS	Real-time, queued signals are supported.
//   _POSIX_PRIORITY_SCHEDULING	Priority scheduling is supported.
//   _POSIX_TIMERS		POSIX.4 clocks and timers are supported.
//   _POSIX_ASYNCHRONOUS_IO	Asynchronous I/O is supported.
//   _POSIX_PRIORITIZED_IO	Prioritized asynchronous I/O is supported.
//   _POSIX_SYNCHRONIZED_IO	Synchronizing file data is supported.
//   _POSIX_FSYNC			The fsync function is present.
//   _POSIX_MAPPED_FILES		Mapping of files to memory is supported.
//   _POSIX_MEMLOCK		Locking of all memory is supported.
//   _POSIX_MEMLOCK_RANGE		Locking of ranges of memory is supported.
//   _POSIX_MEMORY_PROTECTION	Setting of memory protections is supported.
//   _POSIX_MESSAGE_PASSING	POSIX.4 message queues are supported.
//   _POSIX_SEMAPHORES		POSIX.4 counting semaphores are supported.
//   _POSIX_SHARED_MEMORY_OBJECTS	POSIX.4 shared memory objects are supported.
//   _POSIX_THREADS		POSIX.1c pthreads are supported.
//   _POSIX_THREAD_ATTR_STACKADDR	Thread stack address attribute option supported.
//   _POSIX_THREAD_ATTR_STACKSIZE	Thread stack size attribute option supported.
//   _POSIX_THREAD_SAFE_FUNCTIONS	Thread-safe functions are supported.
//   _POSIX_THREAD_PRIORITY_SCHEDULING
//				POSIX.1c thread execution scheduling supported.
//   _POSIX_THREAD_PRIO_INHERIT	Thread priority inheritance option supported.
//   _POSIX_THREAD_PRIO_PROTECT	Thread priority protection option supported.
//   _POSIX_THREAD_PROCESS_SHARED	Process-shared synchronization supported.
//   _POSIX_PII			Protocol-independent interfaces are supported.
//   _POSIX_PII_XTI		XTI protocol-indep. interfaces are supported.
//   _POSIX_PII_SOCKET		Socket protocol-indep. interfaces are supported.
//   _POSIX_PII_INTERNET		Internet family of protocols supported.
//   _POSIX_PII_INTERNET_STREAM	Connection-mode Internet protocol supported.
//   _POSIX_PII_INTERNET_DGRAM	Connectionless Internet protocol supported.
//   _POSIX_PII_OSI		ISO/OSI family of protocols supported.
//   _POSIX_PII_OSI_COTS		Connection-mode ISO/OSI service supported.
//   _POSIX_PII_OSI_CLTS		Connectionless ISO/OSI service supported.
//   _POSIX_POLL			Implementation supports `poll' function.
//   _POSIX_SELECT		Implementation supports `select' and `pselect'.
//
//   _XOPEN_REALTIME		X/Open realtime support is available.
//   _XOPEN_REALTIME_THREADS	X/Open realtime thread support is available.
//   _XOPEN_SHM			Shared memory interface according to XPG4.2.
//
//   _XBS5_ILP32_OFF32		Implementation provides environment with 32-bit
//				int, long, pointer, and off_t types.
//   _XBS5_ILP32_OFFBIG		Implementation provides environment with 32-bit
//				int, long, and pointer and off_t with at least
//				64 bits.
//   _XBS5_LP64_OFF64		Implementation provides environment with 32-bit
//				int, and 64-bit long, pointer, and off_t types.
//   _XBS5_LPBIG_OFFBIG		Implementation provides environment with at
//				least 32 bits int and long, pointer, and off_t
//				with at least 64 bits.
//
//   If any of these symbols is defined as -1, the corresponding option is not
//   true for any file.  If any is defined as other than -1, the corresponding
//   option is true for all files.  If a symbol is not defined at all, the value
//   for a specific file can be obtained from `pathconf' and `fpathconf'.
//
//   _POSIX_CHOWN_RESTRICTED	Only the super user can use `chown' to change
//				the owner of a file.  `chown' can only be used
//				to change the group ID of a file to a group of
//				which the calling process is a member.
//   _POSIX_NO_TRUNC		Pathname components longer than
//				NAME_MAX generate an error.
//   _POSIX_VDISABLE		If defined, if the value of an element of the
//				`c_cc' member of `struct termios' is
//				_POSIX_VDISABLE, no character will have the
//				effect associated with that element.
//   _POSIX_SYNC_IO		Synchronous I/O may be performed.
//   _POSIX_ASYNC_IO		Asynchronous I/O may be performed.
//   _POSIX_PRIO_IO		Prioritized Asynchronous I/O may be performed.
//
//   Support for the Large File Support interface is not generally available.
//   If it is available the following constants are defined to one.
//   _LFS64_LARGEFILE		Low-level I/O supports large files.
//   _LFS64_STDIO			Standard I/O supports large files.
//    }
//{$include <bits/posix_opt.h>}
//{ Get the environment definitions from Unix98.   }
//{$if defined __USE_UNIX98 || defined __USE_XOPEN2K}
//{$include <bits/environments.h>}
//{$endif}
//{ Standard file descriptors.   }
//{ Standard input.   }

const
  STDIN_FILENO = 0;  
{ Standard output.   }
  STDOUT_FILENO = 1;  
{ Standard error output.   }
  STDERR_FILENO = 2;  
{ All functions that are not declared anywhere else.   }
{$include <bits/types.h>}
{$ifndef	__ssize_t_defined}
type
  Pssize_t = ^Tssize_t;
  Tssize_t = Tssize_t;
{$define __ssize_t_defined}
{$endif}
{$define __need_size_t}
{$define __need_NULL}
{$include <stddef.h>}
{$if defined __USE_XOPEN || defined __USE_XOPEN2K}
{ The Single Unix specification says that some more types are
   available here.   }
{$ifndef __gid_t_defined}
type
  Pgid_t = ^Tgid_t;
  Tgid_t = Tgid_t;
{$define __gid_t_defined}
{$endif}
{$ifndef __uid_t_defined}
type
  Puid_t = ^Tuid_t;
  Tuid_t = Tuid_t;
{$define __uid_t_defined}
{$endif}
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
{$ifndef __useconds_t_defined}
type
  Puseconds_t = ^Tuseconds_t;
  Tuseconds_t = Tuseconds_t;
{$define __useconds_t_defined}
{$endif}
{$ifndef __pid_t_defined}
type
  Ppid_t = ^Tpid_t;
  Tpid_t = Tpid_t;
{$define __pid_t_defined}
{$endif}
{$endif}
{ X/Open  }
{$if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K}
{$ifndef __intptr_t_defined}
type
  Pintptr_t = ^Tintptr_t;
  Tintptr_t = Tintptr_t;
{$define __intptr_t_defined}
{$endif}
{$endif}
{$if defined __USE_MISC || defined __USE_XOPEN}
{$ifndef __socklen_t_defined}
type
  Psocklen_t = ^Tsocklen_t;
  Tsocklen_t = Tsocklen_t;
{$define __socklen_t_defined}
{$endif}
{$endif}
{ Values for the second argument to access.
   These may be OR'd together.   }
{ Test for read permission.   }

const
  R_OK = 4;  
{ Test for write permission.   }
  W_OK = 2;  
{ Test for execute permission.   }
  X_OK = 1;  
{ Test for existence.   }
  F_OK = 0;  
{ Test for access to NAME using the real UID and real GID.   }

function access(__name:Pchar; __type:longint):longint;cdecl;external libc;
{$ifdef __USE_GNU}
{ Test for access to NAME using the effective UID and GID
   (as normal file operations use).   }
function euidaccess(__name:Pchar; __type:longint):longint;cdecl;external libc;
{ An alias for `euidaccess', used by some other systems.   }
function eaccess(__name:Pchar; __type:longint):longint;cdecl;external libc;
{ Execute program relative to a directory file descriptor.   }
function execveat(__fd:longint; __path:Pchar; __argv:PPchar; __envp:PPchar; __flags:longint):longint;cdecl;external libc;
{$endif}
{$ifdef __USE_ATFILE}
{ Test for access to FILE relative to the directory FD is open on.
   If AT_EACCESS is set in FLAG, then use effective IDs like `eaccess',
   otherwise use real IDs like `access'.   }

function faccessat(__fd:longint; __file:Pchar; __type:longint; __flag:longint):longint;cdecl;external libc;
{$endif}
{ Use GNU.   }
{ Values for the WHENCE argument to lseek.   }
{$ifndef	_STDIO_H		/* <stdio.h> has the same definitions.  */}
{ Seek from beginning of file.   }

const
  SEEK_SET = 0;  
{ Seek from current position.   }
  SEEK_CUR = 1;  
{ Seek from end of file.   }
  SEEK_END = 2;  
{$ifdef __USE_GNU}
{ Seek to next data.   }

const
  SEEK_DATA = 3;  
{ Seek to next hole.   }
  SEEK_HOLE = 4;  
{$endif}
{$endif}
{$if defined __USE_MISC && !defined L_SET}
{ Old BSD names for the same constants; just for compatibility.   }

const
  L_SET = SEEK_SET;  
  L_INCR = SEEK_CUR;  
  L_XTND = SEEK_END;  
{$endif}
{ Move FD's file position to OFFSET bytes from the
   beginning of the file (if WHENCE is SEEK_SET),
   the current position (if WHENCE is SEEK_CUR),
   or the end of the file (if WHENCE is SEEK_END).
   Return the new file position.   }
{$ifndef __USE_FILE_OFFSET64}

function lseek(__fd:longint; __offset:Toff_t; __whence:longint):Toff_t;cdecl;external libc;
{$else}
{$ifdef __REDIRECT_NTH}

function lseek(__fd:longint; __offset:Toff64_t; __whence:longint):Toff64_t;cdecl;external libc;
{$else}

const
  lseek = lseek64;  
{$endif}
{$endif}
{$ifdef __USE_LARGEFILE64}

function lseek64(__fd:longint; __offset:Toff64_t; __whence:longint):Toff64_t;cdecl;external libc;
{$endif}
{ Close the file descriptor FD.

   This function is a cancellation point and therefore not marked with
   .   }

function close(__fd:longint):longint;cdecl;external libc;
{$ifdef __USE_MISC}
{ Close all open file descriptors greater than or equal to LOWFD.
   Negative LOWFD is clamped to 0.   }
procedure closefrom(__lowfd:longint);cdecl;external libc;
{$endif}
{ Read NBYTES into BUF from FD.  Return the
   number read, -1 for errors or 0 for EOF.

   This function is a cancellation point and therefore not marked with
   .   }

function read(__fd:longint; __buf:pointer; __nbytes:Tsize_t):Tssize_t;cdecl;external libc;
{ Write N bytes of BUF to FD.  Return the number written, or -1.

   This function is a cancellation point and therefore not marked with
   .   }
function write(__fd:longint; __buf:pointer; __n:Tsize_t):Tssize_t;cdecl;external libc;
{$if defined __USE_UNIX98 || defined __USE_XOPEN2K8}
{$ifndef __USE_FILE_OFFSET64}
{ Read NBYTES into BUF from FD at the given position OFFSET without
   changing the file pointer.  Return the number read, -1 for errors
   or 0 for EOF.

   This function is a cancellation point and therefore not marked with
   .   }

function pread(__fd:longint; __buf:pointer; __nbytes:Tsize_t; __offset:Toff_t):Tssize_t;cdecl;external libc;
{ Write N bytes of BUF to FD at the given position OFFSET without
   changing the file pointer.  Return the number written, or -1.

   This function is a cancellation point and therefore not marked with
   .   }
function pwrite(__fd:longint; __buf:pointer; __n:Tsize_t; __offset:Toff_t):Tssize_t;cdecl;external libc;
{$else}
{$ifdef __REDIRECT}

function pread(__fd:longint; __buf:pointer; __nbytes:Tsize_t; __offset:Toff64_t):Tssize_t;cdecl;external libc;
function pwrite(__fd:longint; __buf:pointer; __nbytes:Tsize_t; __offset:Toff64_t):Tssize_t;cdecl;external libc;
{$else}

const
  pread = pread64;  
  pwrite = pwrite64;  
{$endif}
{$endif}
{$ifdef __USE_LARGEFILE64}
{ Read NBYTES into BUF from FD at the given position OFFSET without
   changing the file pointer.  Return the number read, -1 for errors
   or 0 for EOF.   }

function pread64(__fd:longint; __buf:pointer; __nbytes:Tsize_t; __offset:Toff64_t):Tssize_t;cdecl;external libc;
{ Write N bytes of BUF to FD at the given position OFFSET without
   changing the file pointer.  Return the number written, or -1.   }
function pwrite64(__fd:longint; __buf:pointer; __n:Tsize_t; __offset:Toff64_t):Tssize_t;cdecl;external libc;
{$endif}
{$endif}
{ Create a one-way communication channel (pipe).
   If successful, two file descriptors are stored in PIPEDES;
   bytes written on PIPEDES[1] can be read from PIPEDES[0].
   Returns 0 if successful, -1 if not.   }

function pipe(__pipedes:array[0..1] of longint):longint;cdecl;external libc;
{$ifdef __USE_GNU}
{ Same as pipe but apply flags passed in FLAGS to the new file
   descriptors.   }
function pipe2(__pipedes:array[0..1] of longint; __flags:longint):longint;cdecl;external libc;
{$endif}
{ Schedule an alarm.  In SECONDS seconds, the process will get a SIGALRM.
   If SECONDS is zero, any currently scheduled alarm will be cancelled.
   The function returns the number of seconds remaining until the last
   alarm scheduled would have signaled, or zero if there wasn't one.
   There is no return value to indicate an error, but you can set `errno'
   to 0 and check its value after calling `alarm', and this might tell you.
   The signal may come late due to processor scheduling.   }

function alarm(__seconds:dword):dword;cdecl;external libc;
{ Make the process sleep for SECONDS seconds, or until a signal arrives
   and is not ignored.  The function returns the number of seconds less
   than SECONDS which it actually slept (thus zero if it slept the full time).
   If a signal handler does a `longjmp' or modifies the handling of the
   SIGALRM signal while inside `sleep' call, the handling of the SIGALRM
   signal afterwards is undefined.  There is no return value to indicate
   error, but if `sleep' returns SECONDS, it probably didn't work.

   This function is a cancellation point and therefore not marked with
   .   }
function sleep(__seconds:dword):dword;cdecl;external libc;
function ualarm(__value:Tuseconds_t; __interval:Tuseconds_t):Tuseconds_t;cdecl;external libc;
{ Sleep USECONDS microseconds, or until a signal arrives that is not blocked
   or ignored.

   This function is a cancellation point and therefore not marked with
   .   }
function usleep(__useconds:Tuseconds_t):longint;cdecl;external libc;
{ Suspend the process until a signal arrives.
   This always returns -1 and sets `errno' to EINTR.

   This function is a cancellation point and therefore not marked with
   .   }
function pause:longint;cdecl;external libc;
{ Change the owner and group of FILE.   }
function chown(__file:Pchar; __owner:Tuid_t; __group:Tgid_t):longint;cdecl;external libc;
{$if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8}
{ Change the owner and group of the file that FD is open on.   }

function fchown(__fd:longint; __owner:Tuid_t; __group:Tgid_t):longint;cdecl;external libc;
{ Change owner and group of FILE, if it is a symbolic
   link the ownership of the symbolic link is changed.   }
function lchown(__file:Pchar; __owner:Tuid_t; __group:Tgid_t):longint;cdecl;external libc;
{$endif}
{ Use X/Open Unix.   }
{$ifdef __USE_ATFILE}
{ Change the owner and group of FILE relative to the directory FD is open
   on.   }

function fchownat(__fd:longint; __file:Pchar; __owner:Tuid_t; __group:Tgid_t; __flag:longint):longint;cdecl;external libc;
{$endif}
{ Use GNU.   }
{ Change the process's working directory to PATH.   }

function chdir(__path:Pchar):longint;cdecl;external libc;
{$if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8}
{ Change the process's working directory to the one FD is open on.   }

function fchdir(__fd:longint):longint;cdecl;external libc;
{$endif}
{ Get the pathname of the current working directory,
   and put it in SIZE bytes of BUF.  Returns NULL if the
   directory couldn't be determined or SIZE was too small.
   If successful, returns BUF.  In GNU, if BUF is NULL,
   an array is allocated with `malloc'; the array is SIZE
   bytes long, unless SIZE == 0, in which case it is as
   big as necessary.   }

function getcwd(__buf:Pchar; __size:Tsize_t):Pchar;cdecl;external libc;
{$ifdef __USE_GNU}
{ Return a malloc'd string containing the current directory name.
   If the environment variable `PWD' is set, and its value is correct,
   that value is used.   }
function get_current_dir_name:Pchar;cdecl;external libc;
{$endif}
{ Put the absolute pathname of the current working directory in BUF.
   If successful, return BUF.  If not, put an error message in
   BUF and return NULL.  BUF should be at least PATH_MAX bytes long.   }

function getwd(__buf:Pchar):Pchar;cdecl;external libc;
{ Duplicate FD, returning a new file descriptor on the same file.   }
function dup(__fd:longint):longint;cdecl;external libc;
{ Duplicate FD to FD2, closing FD2 and making it open on the same file.   }
function dup2(__fd:longint; __fd2:longint):longint;cdecl;external libc;
{$ifdef __USE_GNU}
{ Duplicate FD to FD2, closing FD2 and making it open on the same
   file while setting flags according to FLAGS.   }
function dup3(__fd:longint; __fd2:longint; __flags:longint):longint;cdecl;external libc;
{$endif}
{ NULL-terminated array of "NAME=VALUE" environment variables.   }
  var
    __environ : ^Pchar;cvar;external libc;
{$ifdef __USE_GNU}
    environ : ^Pchar;cvar;external libc;
{$endif}
{ Replace the current process, executing PATH with arguments ARGV and
   environment ENVP.  ARGV and ENVP are terminated by NULL pointers.   }

function execve(__path:Pchar; __argv:PPchar; __envp:PPchar):longint;cdecl;external libc;
{$ifdef __USE_XOPEN2K8}
{ Execute the file FD refers to, overlaying the running program image.
   ARGV and ENVP are passed to the new program, as for `execve'.   }
function fexecve(__fd:longint; __argv:PPchar; __envp:PPchar):longint;cdecl;external libc;
{$endif}
{ Execute PATH with arguments ARGV and environment from `environ'.   }

function execv(__path:Pchar; __argv:PPchar):longint;cdecl;external libc;
{ Execute PATH with all arguments after PATH until a NULL pointer,
   and the argument after that for environment.   }
function execle(__path:Pchar; __arg:Pchar; args:array of const):longint;cdecl;external libc;
function execle(__path:Pchar; __arg:Pchar):longint;cdecl;external libc;
{ Execute PATH with all arguments after PATH until
   a NULL pointer and environment from `environ'.   }
function execl(__path:Pchar; __arg:Pchar; args:array of const):longint;cdecl;external libc;
function execl(__path:Pchar; __arg:Pchar):longint;cdecl;external libc;
{ Execute FILE, searching in the `PATH' environment variable if it contains
   no slashes, with arguments ARGV and environment from `environ'.   }
function execvp(__file:Pchar; __argv:PPchar):longint;cdecl;external libc;
{ Execute FILE, searching in the `PATH' environment variable if
   it contains no slashes, with all arguments after FILE until a
   NULL pointer and environment from `environ'.   }
function execlp(__file:Pchar; __arg:Pchar; args:array of const):longint;cdecl;external libc;
function execlp(__file:Pchar; __arg:Pchar):longint;cdecl;external libc;
{$ifdef __USE_GNU}
{ Execute FILE, searching in the `PATH' environment variable if it contains
   no slashes, with arguments ARGV and environment from `environ'.   }
function execvpe(__file:Pchar; __argv:PPchar; __envp:PPchar):longint;cdecl;external libc;
{$endif}
{$if defined __USE_MISC || defined __USE_XOPEN}
{ Add INC to priority of the current process.   }

function nice(__inc:longint):longint;cdecl;external libc;
{$endif}
{ Terminate program execution with the low-order 8 bits of STATUS.   }

procedure _exit(__status:longint);cdecl;external libc;
{ Get the `_PC_*' symbols for the NAME argument to `pathconf' and `fpathconf';
   the `_SC_*' symbols for the NAME argument to `sysconf';
   and the `_CS_*' symbols for the NAME argument to `confstr'.   }
{$include <bits/confname.h>}
{ Get file-specific configuration information about PATH.   }

function pathconf(__path:Pchar; __name:longint):longint;cdecl;external libc;
{ Get file-specific configuration about descriptor FD.   }
function fpathconf(__fd:longint; __name:longint):longint;cdecl;external libc;
{ Get the value of the system variable NAME.   }
function sysconf(__name:longint):longint;cdecl;external libc;
{$ifdef __USE_POSIX2}
{ Get the value of the string-valued system variable NAME.   }
function confstr(__name:longint; __buf:Pchar; __len:Tsize_t):Tsize_t;cdecl;external libc;
{$endif}
{ Get the process ID of the calling process.   }

function getpid:Tpid_t;cdecl;external libc;
{ Get the process ID of the calling process's parent.   }
function getppid:Tpid_t;cdecl;external libc;
{ Get the process group ID of the calling process.   }
function getpgrp:Tpid_t;cdecl;external libc;
{ Get the process group ID of process PID.   }
function __getpgid(__pid:Tpid_t):Tpid_t;cdecl;external libc;
{$if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8}

function getpgid(__pid:Tpid_t):Tpid_t;cdecl;external libc;
{$endif}
{ Set the process group ID of the process matching PID to PGID.
   If PID is zero, the current process's process group ID is set.
   If PGID is zero, the process ID of the process is used.   }

function setpgid(__pid:Tpid_t; __pgid:Tpid_t):longint;cdecl;external libc;
{$if defined __USE_MISC || defined __USE_XOPEN_EXTENDED}
{ Both System V and BSD have `setpgrp' functions, but with different
   calling conventions.  The BSD function is the same as POSIX.1 `setpgid'
   (above).  The System V function takes no arguments and puts the calling
   process in its on group like `setpgid (0, 0)'.

   New programs should always use `setpgid' instead.

   GNU provides the POSIX.1 function.   }
{ Set the process group ID of the calling process to its own PID.
   This is exactly the same as `setpgid (0, 0)'.   }

function setpgrp:longint;cdecl;external libc;
{$endif}
{ Use misc or X/Open.   }
{ Create a new session with the calling process as its leader.
   The process group IDs of the session and the calling process
   are set to the process ID of the calling process, which is returned.   }

function setsid:Tpid_t;cdecl;external libc;
{$if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8}
{ Return the session ID of the given process.   }

function getsid(__pid:Tpid_t):Tpid_t;cdecl;external libc;
{$endif}
{ Get the real user ID of the calling process.   }

function getuid:Tuid_t;cdecl;external libc;
{ Get the effective user ID of the calling process.   }
function geteuid:Tuid_t;cdecl;external libc;
{ Get the real group ID of the calling process.   }
function getgid:Tgid_t;cdecl;external libc;
{ Get the effective group ID of the calling process.   }
function getegid:Tgid_t;cdecl;external libc;
{ If SIZE is zero, return the number of supplementary groups
   the calling process is in.  Otherwise, fill in the group IDs
   of its supplementary groups in LIST and return the number written.   }
function getgroups(__size:longint; __list:Pgid_t):longint;cdecl;external libc;
{$ifdef __USE_GNU}
{ Return nonzero iff the calling process is in group GID.   }
function group_member(__gid:Tgid_t):longint;cdecl;external libc;
{$endif}
{ Set the user ID of the calling process to UID.
   If the calling process is the super-user, set the real
   and effective user IDs, and the saved set-user-ID to UID;
   if not, the effective user ID is set to UID.   }

function setuid(__uid:Tuid_t):longint;cdecl;external libc;
{$if defined __USE_MISC || defined __USE_XOPEN_EXTENDED}
{ Set the real user ID of the calling process to RUID,
   and the effective user ID of the calling process to EUID.   }

function setreuid(__ruid:Tuid_t; __euid:Tuid_t):longint;cdecl;external libc;
{$endif}
{$ifdef __USE_XOPEN2K}
{ Set the effective user ID of the calling process to UID.   }

function seteuid(__uid:Tuid_t):longint;cdecl;external libc;
{$endif}
{ Use POSIX.1-2001.   }
{ Set the group ID of the calling process to GID.
   If the calling process is the super-user, set the real
   and effective group IDs, and the saved set-group-ID to GID;
   if not, the effective group ID is set to GID.   }

function setgid(__gid:Tgid_t):longint;cdecl;external libc;
{$if defined __USE_MISC || defined __USE_XOPEN_EXTENDED}
{ Set the real group ID of the calling process to RGID,
   and the effective group ID of the calling process to EGID.   }

function setregid(__rgid:Tgid_t; __egid:Tgid_t):longint;cdecl;external libc;
{$endif}
{$ifdef __USE_XOPEN2K}
{ Set the effective group ID of the calling process to GID.   }

function setegid(__gid:Tgid_t):longint;cdecl;external libc;
{$endif}
{ Use POSIX.1-2001.   }
{$ifdef __USE_GNU}
{ Fetch the real user ID, effective user ID, and saved-set user ID,
   of the calling process.   }

function getresuid(__ruid:Puid_t; __euid:Puid_t; __suid:Puid_t):longint;cdecl;external libc;
{ Fetch the real group ID, effective group ID, and saved-set group ID,
   of the calling process.   }
function getresgid(__rgid:Pgid_t; __egid:Pgid_t; __sgid:Pgid_t):longint;cdecl;external libc;
{ Set the real user ID, effective user ID, and saved-set user ID,
   of the calling process to RUID, EUID, and SUID, respectively.   }
function setresuid(__ruid:Tuid_t; __euid:Tuid_t; __suid:Tuid_t):longint;cdecl;external libc;
{ Set the real group ID, effective group ID, and saved-set group ID,
   of the calling process to RGID, EGID, and SGID, respectively.   }
function setresgid(__rgid:Tgid_t; __egid:Tgid_t; __sgid:Tgid_t):longint;cdecl;external libc;
{$endif}
{ Clone the calling process, creating an exact copy.
   Return -1 for errors, 0 to the new process,
   and the process ID of the new process to the old process.   }

function fork:Tpid_t;cdecl;external libc;
{ Clone the calling process, but without copying the whole address space.
   The calling process is suspended until the new process exits or is
   replaced by a call to `execve'.  Return -1 for errors, 0 to the new process,
   and the process ID of the new process to the old process.   }
function vfork:Tpid_t;cdecl;external libc;
{$ifdef __USE_GNU}
{ This is similar to fork, however it does not run the atfork handlers
   neither reinitialize any internal locks in multithread case.
   Different than fork, _Fork is async-signal-safe.   }
function _Fork:Tpid_t;cdecl;external libc;
{$endif}
{ Return the pathname of the terminal FD is open on, or NULL on errors.
   The returned storage is good only until the next call to this function.   }

function ttyname(__fd:longint):Pchar;cdecl;external libc;
{ Store at most BUFLEN characters of the pathname of the terminal FD is
   open on in BUF.  Return 0 on success, otherwise an error number.   }
function ttyname_r(__fd:longint; __buf:Pchar; __buflen:Tsize_t):longint;cdecl;external libc;
{ Return 1 if FD is a valid descriptor associated
   with a terminal, zero if not.   }
function isatty(__fd:longint):longint;cdecl;external libc;
{$ifdef __USE_MISC}
{ Return the index into the active-logins file (utmp) for
   the controlling terminal.   }
function ttyslot:longint;cdecl;external libc;
{$endif}
{ Make a link to FROM named TO.   }

function link(__from:Pchar; __to:Pchar):longint;cdecl;external libc;
{$ifdef __USE_ATFILE}
{ Like link but relative paths in TO and FROM are interpreted relative
   to FROMFD and TOFD respectively.   }
function linkat(__fromfd:longint; __from:Pchar; __tofd:longint; __to:Pchar; __flags:longint):longint;cdecl;external libc;
{$endif}
{$if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K}
{ Make a symbolic link to FROM named TO.   }

function symlink(__from:Pchar; __to:Pchar):longint;cdecl;external libc;
{ Read the contents of the symbolic link PATH into no more than
   LEN bytes of BUF.  The contents are not null-terminated.
   Returns the number of characters read, or -1 for errors.   }
function readlink(__path:Pchar; __buf:Pchar; __len:Tsize_t):Tssize_t;cdecl;external libc;
{$endif}
{ Use POSIX.1-2001.   }
{$ifdef __USE_ATFILE}
{ Like symlink but a relative path in TO is interpreted relative to TOFD.   }

function symlinkat(__from:Pchar; __tofd:longint; __to:Pchar):longint;cdecl;external libc;
{ Like readlink but a relative PATH is interpreted relative to FD.   }
function readlinkat(__fd:longint; __path:Pchar; __buf:Pchar; __len:Tsize_t):Tssize_t;cdecl;external libc;
{$endif}
{ Remove the link NAME.   }

function unlink(__name:Pchar):longint;cdecl;external libc;
{$ifdef __USE_ATFILE}
{ Remove the link NAME relative to FD.   }
function unlinkat(__fd:longint; __name:Pchar; __flag:longint):longint;cdecl;external libc;
{$endif}
{ Remove the directory PATH.   }

function rmdir(__path:Pchar):longint;cdecl;external libc;
{ Return the foreground process group ID of FD.   }
function tcgetpgrp(__fd:longint):Tpid_t;cdecl;external libc;
{ Set the foreground process group ID of FD set PGRP_ID.   }
function tcsetpgrp(__fd:longint; __pgrp_id:Tpid_t):longint;cdecl;external libc;
{ Return the login name of the user.

   This function is a possible cancellation point and therefore not
   marked with .   }
function getlogin:Pchar;cdecl;external libc;
{$ifdef __USE_POSIX199506}
{ Return at most NAME_LEN characters of the login name of the user in NAME.
   If it cannot be determined or some other error occurred, return the error
   code.  Otherwise return 0.

   This function is a possible cancellation point and therefore not
   marked with .   }
function getlogin_r(__name:Pchar; __name_len:Tsize_t):longint;cdecl;external libc;
{$endif}
{$ifdef __USE_MISC}
{ Set the login name returned by `getlogin'.   }

function setlogin(__name:Pchar):longint;cdecl;external libc;
{$endif}
{$ifdef __USE_POSIX2}
{ Get definitions and prototypes for functions to process the
   arguments in ARGV (ARGC of them, minus the program name) for
   options given in OPTS.   }
{$include <bits/getopt_posix.h>}
{$endif}
{$if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K}
{ Put the name of the current host in no more than LEN bytes of NAME.
   The result is null-terminated if LEN is large enough for the full
   name and the terminator.   }

function gethostname(__name:Pchar; __len:Tsize_t):longint;cdecl;external libc;
{$endif}
{$if defined __USE_MISC}
{ Set the name of the current host to NAME, which is LEN bytes long.
   This call is restricted to the super-user.   }

function sethostname(__name:Pchar; __len:Tsize_t):longint;cdecl;external libc;
{ Set the current machine's Internet number to ID.
   This call is restricted to the super-user.   }
function sethostid(__id:longint):longint;cdecl;external libc;
{ Get and set the NIS (aka YP) domain name, if any.
   Called just like `gethostname' and `sethostname'.
   The NIS domain name is usually the empty string when not using NIS.   }
function getdomainname(__name:Pchar; __len:Tsize_t):longint;cdecl;external libc;
function setdomainname(__name:Pchar; __len:Tsize_t):longint;cdecl;external libc;
{ Revoke access permissions to all processes currently communicating
   with the control terminal, and then send a SIGHUP signal to the process
   group of the control terminal.   }
function vhangup:longint;cdecl;external libc;
{ Revoke the access of all descriptors currently open on FILE.   }
function revoke(__file:Pchar):longint;cdecl;external libc;
{ Enable statistical profiling, writing samples of the PC into at most
   SIZE bytes of SAMPLE_BUFFER; every processor clock tick while profiling
   is enabled, the system examines the user PC and increments
   SAMPLE_BUFFER[((PC - OFFSET) / 2) * SCALE / 65536].  If SCALE is zero,
   disable profiling.  Returns zero on success, -1 on error.   }
function profil(__sample_buffer:Pword; __size:Tsize_t; __offset:Tsize_t; __scale:dword):longint;cdecl;external libc;
{ Turn accounting on if NAME is an existing file.  The system will then write
   a record for each process as it terminates, to this file.  If NAME is NULL,
   turn accounting off.  This call is restricted to the super-user.   }
function acct(__name:Pchar):longint;cdecl;external libc;
{ Successive calls return the shells listed in `/etc/shells'.   }
function getusershell:Pchar;cdecl;external libc;
procedure endusershell;cdecl;external libc;
{ Discard cached info.   }
procedure setusershell;cdecl;external libc;
{ Rewind and re-read the file.   }
{ Put the program in the background, and dissociate from the controlling
   terminal.  If NOCHDIR is zero, do `chdir ("/")'.  If NOCLOSE is zero,
   redirects stdin, stdout, and stderr to /dev/null.   }
function daemon(__nochdir:longint; __noclose:longint):longint;cdecl;external libc;
{$endif}
{ Use misc.   }
{$if defined __USE_MISC || (defined __USE_XOPEN && !defined __USE_XOPEN2K)}
{ Make PATH be the root directory (the starting point for absolute paths).
   This call is restricted to the super-user.   }

function chroot(__path:Pchar):longint;cdecl;external libc;
{ Prompt with PROMPT and read a string from the terminal without echoing.
   Uses /dev/tty if possible; otherwise stderr and stdin.   }
function getpass(__prompt:Pchar):Pchar;cdecl;external libc;
{$endif}
{ Use misc || X/Open.   }
{ Make all changes done to FD actually appear on disk.

   This function is a cancellation point and therefore not marked with
   .   }

function fsync(__fd:longint):longint;cdecl;external libc;
{$ifdef __USE_GNU}
{ Make all changes done to all files on the file system associated
   with FD actually appear on disk.   }
function syncfs(__fd:longint):longint;cdecl;external libc;
{$endif}
{$if defined __USE_MISC || defined __USE_XOPEN_EXTENDED}
{ Return identifier for the current host.   }

function gethostid:longint;cdecl;external libc;
{ Make all changes done to all files actually appear on disk.   }
procedure sync;cdecl;external libc;
{$if defined __USE_MISC || !defined __USE_XOPEN2K}
{ Return the number of bytes in a page.  This is the system's page size,
   which is not necessarily the same as the hardware page size.   }

function getpagesize:longint;cdecl;external libc;
{ Return the maximum number of file descriptors
   the current process could possibly have.   }
function getdtablesize:longint;cdecl;external libc;
{$endif}
{$endif}
{ Use misc || X/Open Unix.   }
{$if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8}
{ Truncate FILE to LENGTH bytes.   }
{$ifndef __USE_FILE_OFFSET64}

function truncate(__file:Pchar; __length:Toff_t):longint;cdecl;external libc;
{$else}
{$ifdef __REDIRECT_NTH}

function truncate(__file:Pchar; __length:Toff64_t):longint;cdecl;external libc;
{$else}

const
  truncate = truncate64;  
{$endif}
{$endif}
{$ifdef __USE_LARGEFILE64}

function truncate64(__file:Pchar; __length:Toff64_t):longint;cdecl;external libc;
{$endif}
{$endif}
{ Use X/Open Unix || POSIX 2008.   }
{ Truncate the file FD is open on to LENGTH bytes.   }
{$ifndef __USE_FILE_OFFSET64}

function ftruncate(__fd:longint; __length:Toff_t):longint;cdecl;external libc;
{$else}
{$ifdef __REDIRECT_NTH}

function ftruncate(__fd:longint; __length:Toff64_t):longint;cdecl;external libc;
{$else}

const
  ftruncate = ftruncate64;  
{$endif}
{$endif}
{$ifdef __USE_LARGEFILE64}

function ftruncate64(__fd:longint; __length:Toff64_t):longint;cdecl;external libc;
{$endif}
{ Use POSIX.1b || X/Open Unix || XPG6.   }
{ Set the end of accessible data space (aka "the break") to ADDR.
   Returns zero on success and -1 for errors (with errno set).   }

function brk(__addr:pointer):longint;cdecl;external libc;
{ Increase or decrease the end of accessible data space by DELTA bytes.
   If successful, returns the address the previous end of data space
   (i.e. the beginning of the new space, if DELTA > 0);
   returns (void *) -1 for errors (with errno set).   }
function sbrk(__delta:Tintptr_t):pointer;cdecl;external libc;
{$ifdef __USE_MISC}
{ Invoke `system call' number SYSNO, passing it the remaining arguments.
   This is completely system-dependent, and not often useful.

   In Unix, `syscall' sets `errno' for all errors and most calls return -1
   for errors; in many systems you cannot pass arguments or get return
   values for all system calls (`pipe', `fork', and `getppid' typically
   among them).

   In Mach, all system calls take normal arguments and always return an
   error code (zero for success).   }
function syscall(__sysno:longint; args:array of const):longint;cdecl;external libc;
function syscall(__sysno:longint):longint;cdecl;external libc;
{$endif}
{ Use misc.   }
{$if (defined __USE_MISC || defined __USE_XOPEN_EXTENDED) && !defined F_LOCK}
{ NOTE: These declarations also appear in <fcntl.h>; be sure to keep both
   files consistent.  Some systems have them there and some here, and some
   software depends on the macros being defined without including both.   }
{ `lockf' is a simpler interface to the locking facilities of `fcntl'.
   LEN is always relative to the current file position.
   The CMD argument is one of the following.

   This function is a cancellation point and therefore not marked with
   .   }
{ Unlock a previously locked region.   }

const
  F_ULOCK = 0;  
{ Lock a region for exclusive use.   }
  F_LOCK = 1;  
{ Test and lock a region for exclusive use.   }
  F_TLOCK = 2;  
{ Test a region for other processes locks.   }
  F_TEST = 3;  
{$ifndef __USE_FILE_OFFSET64}

function lockf(__fd:longint; __cmd:longint; __len:Toff_t):longint;cdecl;external libc;
{$else}
{$ifdef __REDIRECT}

function lockf(__fd:longint; __cmd:longint; __len:Toff64_t):longint;cdecl;external libc;
{$else}

const
  lockf = lockf64;  
{$endif}
{$endif}
{$ifdef __USE_LARGEFILE64}

function lockf64(__fd:longint; __cmd:longint; __len:Toff64_t):longint;cdecl;external libc;
{$endif}
{$endif}
{ Use misc and F_LOCK not already defined.   }
{$ifdef __USE_GNU}
{ Evaluate EXPRESSION, and repeat as long as it returns -1 with `errno'
   set to EINTR.   }
{ Copy LENGTH bytes from INFD to OUTFD.   }

function copy_file_range(__infd:longint; __pinoff:Poff64_t; __outfd:longint; __poutoff:Poff64_t; __length:Tsize_t; 
           __flags:dword):Tssize_t;cdecl;external libc;
{$endif}
{ __USE_GNU  }
{$if defined __USE_POSIX199309 || defined __USE_UNIX98}
{ Synchronize at least the data part of a file with the underlying
   media.   }

function fdatasync(__fildes:longint):longint;cdecl;external libc;
{$endif}
{ Use POSIX199309  }
{$ifdef __USE_MISC}
{ One-way hash PHRASE, returning a string suitable for storage in the
   user database.  SALT selects the one-way function to use, and
   ensures that no two users' hashes are the same, even if they use
   the same passphrase.  The return value points to static storage
   which will be overwritten by the next call to crypt.

   This declaration is deprecated; applications should include
   <crypt.h> instead.   }

function crypt(__key:Pchar; __salt:Pchar):Pchar;cdecl;external libc;
{$endif}
{$ifdef __USE_XOPEN}
{ Swab pairs bytes in the first N bytes of the area pointed to by
   FROM and copy the result to TO.  The value of TO must not be in the
   range [FROM - N + 1, FROM - 1].  If N is odd the first byte in FROM
   is without partner.   }

procedure swab(__from:pointer; __to:pointer; __n:Tssize_t);cdecl;external libc;
{$endif}
{ Prior to Issue 6, the Single Unix Specification required these
   prototypes to appear in this header.  They are also found in
   <stdio.h>.   }
{$if defined __USE_XOPEN && !defined __USE_XOPEN2K}
{ Return the name of the controlling terminal.   }

function ctermid(__s:Pchar):Pchar;cdecl;external libc;
{ Return the name of the current user.   }
function cuserid(__s:Pchar):Pchar;cdecl;external libc;
{$endif}
{ Unix98 requires this function to be declared here.  In other
   standards it is in <pthread.h>.   }
{$if defined __USE_UNIX98 && !defined __USE_XOPEN2K}

function pthread_atfork(__prepare:procedure ; __parent:procedure ; __child:procedure ):longint;cdecl;external libc;
{$endif}
{$ifdef __USE_MISC}
{ Write LENGTH bytes of randomness starting at BUFFER.  Return 0 on
   success or -1 on error.   }

function getentropy(__buffer:pointer; __length:Tsize_t):longint;cdecl;external libc;
{$endif}
{$ifdef __USE_GNU}
{ Close all file descriptors in the range FD up to MAX_FD.  The flag FLAGS
   are define by the CLOSE_RANGE prefix.  This function behaves like close
   on the range and gaps where the file descriptor is invalid or errors
   encountered while closing file descriptors are ignored.   Returns 0 on
   successor or -1 for failure (and sets errno accordingly).   }

function close_range(__fd:dword; __max_fd:dword; __flags:longint):longint;cdecl;external libc;
{$endif}
{ Define some macros helping to catch buffer overflows.   }
{$if __USE_FORTIFY_LEVEL > 0 && defined __fortify_function}
{$include <bits/unistd.h>}
{$endif}
{ System-specific extensions.   }
{$include <bits/unistd_ext.h>}
{$endif}
{ unistd.h   }

// === Konventiert am: 1-7-25 17:34:43 ===


implementation



end.
