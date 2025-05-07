
unit signal;
interface

{
  Automatically converted by H2Pas 1.0.0 from signal.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    signal.h
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
Plongint  = ^longint;
Ppid_t  = ^pid_t;
Psig_t  = ^sig_t;
Psigaction  = ^sigaction;
Psigcontext  = ^sigcontext;
Psighandler_t  = ^sighandler_t;
Psiginfo_t  = ^siginfo_t;
Psigset_t  = ^sigset_t;
Pstack_t  = ^stack_t;
Ptimespec  = ^timespec;
Puid_t  = ^uid_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1991-2024 Free Software Foundation, Inc.
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
 *	ISO C99 Standard: 7.14 Signal handling <signal.h>
  }
{$ifndef	_SIGNAL_H}
{$define _SIGNAL_H}
{$include <features.h>}
{$include <bits/types.h>}
{$include <bits/signum-generic.h>}
{$include <bits/types/sig_atomic_t.h>}
{$if defined __USE_POSIX}
{$include <bits/types/sigset_t.h>}
{$endif}
{$if defined __USE_XOPEN || defined __USE_XOPEN2K}
{$ifndef __pid_t_defined}
type
  Ppid_t = ^Tpid_t;
  Tpid_t = Tpid_t;
{$define __pid_t_defined}
{$endif}
{$ifdef __USE_XOPEN}
{$endif}
{$ifndef __uid_t_defined}
type
  Puid_t = ^Tuid_t;
  Tuid_t = Tuid_t;
{$define __uid_t_defined}
{$endif}
{$endif}
{ Unix98  }
{$ifdef __USE_POSIX199309}
{ We need `struct timespec' later on.   }
{$include <bits/types/struct_timespec.h>}
{$endif}
{$ifdef __USE_MISC}
{$include <bits/types/sigval_t.h>}
{$endif}
{$ifdef __USE_POSIX199309}
{$include <bits/types/sigevent_t.h>}
{$include <bits/sigevent-consts.h>}
{$endif}
{ Type of a signal handler.   }
type

  T_sighandler_t = procedure (para1:longint);cdecl;
{ The X/Open definition of `signal' specifies the SVID semantic.  Use
   the additional function `sysv_signal' when X/Open compatibility is
   requested.   }

function __sysv_signal(__sig:longint; __handler:Tsighandler_t):Tsighandler_t;cdecl;external;
{$ifdef __USE_GNU}
function sysv_signal(__sig:longint; __handler:Tsighandler_t):Tsighandler_t;cdecl;external;
{$endif}
{ Set the handler for the signal SIG to HANDLER, returning the old
   handler, or SIG_ERR on error.
   By default `signal' has the BSD semantic.   }
{$ifdef __USE_MISC}

function signal(__sig:longint; __handler:Tsighandler_t):Tsighandler_t;cdecl;external;
{$else}
{ Make sure the used `signal' implementation is the SVID version.  }
{ Send signal SIG to process number PID.  If PID is zero,
   send SIG to all processes in the current process's process group.
   If PID is < -1, send SIG to all processes in process group - PID.   }
{$ifdef __USE_POSIX}

function kill(__pid:Tpid_t; __sig:longint):longint;cdecl;external;
{$endif}
{ Use POSIX.   }
{$if defined __USE_MISC || defined __USE_XOPEN_EXTENDED}
{ Send SIG to all processes in process group PGRP.
   If PGRP is zero, send SIG to all processes in
   the current process's process group.   }

function killpg(__pgrp:Tpid_t; __sig:longint):longint;cdecl;external;
{$endif}
{ Use misc || X/Open Unix.   }
{ Raise signal SIG, i.e., send SIG to yourself.   }

function raise(__sig:longint):longint;cdecl;external;
{$ifdef __USE_MISC}
{ SVID names for the same things.   }
function ssignal(__sig:longint; __handler:Tsighandler_t):Tsighandler_t;cdecl;external;
function gsignal(__sig:longint):longint;cdecl;external;
{$endif}
{ Use misc.   }
{$ifdef __USE_XOPEN2K8}
{ Print a message describing the meaning of the given signal number.   }
(* Const before type ignored *)

procedure psignal(__sig:longint; __s:Pchar);cdecl;external;
{ Print a message describing the meaning of the given signal information.   }
(* Const before type ignored *)
(* Const before type ignored *)
procedure psiginfo(__pinfo:Psiginfo_t; __s:Pchar);cdecl;external;
{$endif}
{ POSIX 2008.   }
{ The `sigpause' function in X/Open defines the argument as the
   signal number.  This requires redirecting to another function
   because the default version in glibc uses an old BSD interface.

   This function is a cancellation point and therefore not marked with
   .   }
{$ifdef __USE_MISC}
{ None of the following functions should be used anymore.  They are here
   only for compatibility.  A single word (`int') is not guaranteed to be
   enough to hold a complete signal mask and therefore these functions
   simply do not work in many situations.  Use `sigprocmask' instead.   }
{ Compute mask for signal SIG.   }
{ Block signals in MASK, returning the old mask.   }
{ __attribute_deprecated__ }

function sigblock(__mask:longint):longint;cdecl;external;
{ Set the mask of blocked signals to MASK, returning the old mask.   }
{ __attribute_deprecated__ }
function sigsetmask(__mask:longint):longint;cdecl;external;
{ Return currently selected signal mask.   }
{  __attribute_deprecated__ }
function siggetmask:longint;cdecl;external;
{$endif}
{ Use misc.   }
{$ifdef __USE_MISC}

const
  NSIG = _NSIG;  
{$endif}
{$ifdef __USE_GNU}
type
  Psighandler_t = ^Tsighandler_t;
  Tsighandler_t = Tsighandler_t;
{$endif}
{ 4.4 BSD uses the name `sig_t' for this.   }
{$ifdef __USE_MISC}
type
  Psig_t = ^Tsig_t;
  Tsig_t = Tsighandler_t;
{$endif}
{$ifdef __USE_POSIX}
{ Clear all signals from SET.   }

function sigemptyset(__set:Psigset_t):longint;cdecl;external;
{ Set all signals in SET.   }
function sigfillset(__set:Psigset_t):longint;cdecl;external;
{ Add SIGNO to SET.   }
function sigaddset(__set:Psigset_t; __signo:longint):longint;cdecl;external;
{ Remove SIGNO from SET.   }
function sigdelset(__set:Psigset_t; __signo:longint):longint;cdecl;external;
{ Return 1 if SIGNO is in SET, 0 if not.   }
(* Const before type ignored *)
function sigismember(__set:Psigset_t; __signo:longint):longint;cdecl;external;
{$ifdef __USE_GNU}
{ Return non-empty value is SET is not empty.   }
(* Const before type ignored *)

function sigisemptyset(__set:Psigset_t):longint;cdecl;external;
{ Build new signal set by combining the two inputs set using logical AND.   }
(* Const before type ignored *)
(* Const before type ignored *)
function sigandset(__set:Psigset_t; __left:Psigset_t; __right:Psigset_t):longint;cdecl;external;
{ Build new signal set by combining the two inputs set using logical OR.   }
(* Const before type ignored *)
(* Const before type ignored *)
function sigorset(__set:Psigset_t; __left:Psigset_t; __right:Psigset_t):longint;cdecl;external;
{$endif}
{ GNU  }
{ Get the system-specific definitions of `struct sigaction'
   and the `SA_*' and `SIG_*'. constants.   }
{$include <bits/sigaction.h>}
{ Get and/or change the set of blocked signals.   }
(* Const before type ignored *)

function sigprocmask(__how:longint; __set:Psigset_t; __oset:Psigset_t):longint;cdecl;external;
{ Change the set of blocked signals to SET,
   wait until a signal arrives, and restore the set of blocked signals.

   This function is a cancellation point and therefore not marked with
   .   }
(* Const before type ignored *)
function sigsuspend(__set:Psigset_t):longint;cdecl;external;
{ Get and/or set the action for signal SIG.   }
(* Const before type ignored *)
function sigaction(__sig:longint; __act:Psigaction; __oact:Psigaction):longint;cdecl;external;
{ Put in SET all signals that are blocked and waiting to be delivered.   }
function sigpending(__set:Psigset_t):longint;cdecl;external;
{$ifdef __USE_POSIX199506}
{ Select any of pending signals from SET or wait for any to arrive.

   This function is a cancellation point and therefore not marked with
   .   }
(* Const before type ignored *)

function sigwait(__set:Psigset_t; __sig:Plongint):longint;cdecl;external;
{$endif}
{ Use POSIX 1995.   }
{$ifdef __USE_POSIX199309}
{ Select any of pending signals from SET and place information in INFO.

   This function is a cancellation point and therefore not marked with
   .   }
(* Const before type ignored *)

function sigwaitinfo(__set:Psigset_t; __info:Psiginfo_t):longint;cdecl;external;
{ Select any of pending signals from SET and place information in INFO.
   Wait the time specified by TIMEOUT if no signal is pending.

   This function is a cancellation point and therefore not marked with
   .   }
{$ifndef __USE_TIME_BITS64}
(* Const before type ignored *)
(* Const before type ignored *)

function sigtimedwait(__set:Psigset_t; __info:Psiginfo_t; __timeout:Ptimespec):longint;cdecl;external;
{$else}
{$endif}
{ Send signal SIG to the process PID.  Associate data in VAL with the
   signal.   }
(* Const before type ignored *)

function sigqueue(__pid:Tpid_t; __sig:longint; __val:Tsigval):longint;cdecl;external;
{$endif}
{ Use POSIX 199306.   }
{$endif}
{ Use POSIX.   }
{$ifdef __USE_MISC}
{ Get machine-dependent `struct sigcontext' and signal subcodes.   }
{$include <bits/sigcontext.h>}
{ Restore the state saved in SCP.   }

function sigreturn(__scp:Psigcontext):longint;cdecl;external;
{$endif}
{ Use misc.   }
{$if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8}
{$define __need_size_t}
{$include <stddef.h>}
{$include <bits/types/stack_t.h>}
{$if defined __USE_XOPEN || defined __USE_XOPEN2K8}
{ This will define `ucontext_t' and `mcontext_t'.   }
{$include <sys/ucontext.h>}
{$endif}
{$endif}
{ Use POSIX.1-2008 or X/Open Unix.   }
{$if defined __USE_XOPEN_EXTENDED || defined __USE_MISC}
{ If INTERRUPT is nonzero, make signal SIG interrupt system calls
   (causing them to fail with EINTR); if INTERRUPT is zero, make system
   calls be restarted after signal SIG.   }
{ __attribute_deprecated_msg__ ("Use sigaction with SA_RESTART instead") }

function siginterrupt(__sig:longint; __interrupt:longint):longint;cdecl;external;
{$include <bits/sigstack.h>}
{$include <bits/sigstksz.h>}
{$include <bits/ss_flags.h>}
{ Alternate signal handler stack interface.
   This interface should always be preferred over `sigstack'.   }
(* Const before type ignored *)

function sigaltstack(__ss:Pstack_t; __oss:Pstack_t):longint;cdecl;external;
{$endif}
{ __USE_XOPEN_EXTENDED || __USE_MISC  }
{$if defined __USE_POSIX199506 || defined __USE_UNIX98}
{ Some of the functions for handling signals in threaded programs must
   be defined here.   }
{$include <bits/pthreadtypes.h>}
{$include <bits/sigthread.h>}
{$endif}
{ use Unix98  }
{ The following functions are used internally in the C library and in
   other code which need deep insights.   }
{ Return number of available real-time signal with highest priority.   }

function __libc_current_sigrtmin:longint;cdecl;external;
{ Return number of available real-time signal with lowest priority.   }
function __libc_current_sigrtmax:longint;cdecl;external;
{ was #define dname def_expr }
function SIGRTMIN : longint; { return type might be wrong }

{ was #define dname def_expr }
function SIGRTMAX : longint; { return type might be wrong }

{ System-specific extensions.   }
{$include <bits/signal_ext.h>}
{$endif}
{ not signal.h  }

implementation

{ was #define dname def_expr }
function SIGRTMIN : longint; { return type might be wrong }
  begin
    SIGRTMIN:=__libc_current_sigrtmin;
  end;

{ was #define dname def_expr }
function SIGRTMAX : longint; { return type might be wrong }
  begin
    SIGRTMAX:=__libc_current_sigrtmax;
  end;


end.
