unit fp_signal;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tsighandler_t = procedure(para1: longint); cdecl;

  // /usr/include/x86_64-linux-gnu/bits/sigaction.h

type
  Psigaction = ^Tsigaction;
  Tsigaction = record
    case longint of
      0: (
        sa_handler: Tsighandler_t;
        sa_mask: Tsigset_t;
        sa_flags: longint;
        sa_restorer: procedure; cdecl;
      );
      1: (
        sa_sigaction: procedure(signum: longint; info: Psiginfo_t; context: Pointer); cdecl;
//        sa_mask2: Tsigset_t;
//        sa_flags2: longint;
//        sa_restorer2: procedure; cdecl;
      );
  end;

const
  SA_NOCLDSTOP = 1;
  SA_NOCLDWAIT = 2;
  SA_SIGINFO = 4;

const
  SA_ONSTACK = $08000000;
  SA_RESTART = $10000000;
  SA_NODEFER = $40000000;
  SA_RESETHAND = $80000000;
  SA_INTERRUPT = $20000000;

  SA_NOMASK = SA_NODEFER;
  SA_ONESHOT = SA_RESETHAND;
  SA_STACK = SA_ONSTACK;

const
  SIG_BLOCK = 0;
  SIG_UNBLOCK = 1;
  SIG_SETMASK = 2;

  // /usr/include/signal.h


function sysv_signal(__sig: longint; __handler: Tsighandler_t): Tsighandler_t; cdecl; external libc;
function signal(__sig: longint; __handler: Tsighandler_t): Tsighandler_t; cdecl; external libc;

function bsd_signal(__sig: longint; __handler: Tsighandler_t): Tsighandler_t; cdecl; external libc;
function kill(__pid: Tpid_t; __sig: longint): longint; cdecl; external libc;
function killpg(__pgrp: Tpid_t; __sig: longint): longint; cdecl; external libc;
//function raise(__sig:longint):longint;cdecl;external libc;
function c_raise(__sig: longint): longint; cdecl; external 'c' name 'raise';
function ssignal(__sig: longint; __handler: Tsighandler_t): Tsighandler_t; cdecl; external libc;
function gsignal(__sig: longint): longint; cdecl; external libc;
procedure psignal(__sig: longint; __s: pchar); cdecl; external libc;
procedure psiginfo(__pinfo: Psiginfo_t; __s: pchar); cdecl; external libc;
function sigpause(__sig: longint): longint; cdecl; external libc;
function sigblock(__mask: longint): longint; cdecl; external libc;
function siggetmask: longint; cdecl; external libc; deprecated;

type
  Psig_t = ^Tsig_t;
  Tsig_t = Tsighandler_t;

function sigemptyset(__set: Psigset_t): longint; cdecl; external libc;
function sigfillset(__set: Psigset_t): longint; cdecl; external libc;
function sigaddset(__set: Psigset_t; __signo: longint): longint; cdecl; external libc;
function sigdelset(__set: Psigset_t; __signo: longint): longint; cdecl; external libc;
function sigismember(__set: Psigset_t; __signo: longint): longint; cdecl; external libc;
function sigisemptyset(__set: Psigset_t): longint; cdecl; external libc;
function sigandset(__set: Psigset_t; __left: Psigset_t; __right: Psigset_t): longint; cdecl; external libc;
function sigorset(__set: Psigset_t; __left: Psigset_t; __right: Psigset_t): longint; cdecl; external libc;
function sigprocmask(__how: longint; __set: Psigset_t; __oset: Psigset_t): longint; cdecl; external libc;
function sigsuspend(__set: Psigset_t): longint; cdecl; external libc;
function sigaction(__sig: longint; __act: Psigaction; __oact: Psigaction): longint; cdecl; external libc;
function sigpending(__set: Psigset_t): longint; cdecl; external libc;
function sigwait(__set: Psigset_t; __sig: Plongint): longint; cdecl; external libc;
function sigwaitinfo(__set: Psigset_t; __info: Psiginfo_t): longint; cdecl; external libc;
function sigtimedwait(__set: Psigset_t; __info: Psiginfo_t; __timeout: Ptimespec): longint; cdecl; external libc;
function sigqueue(__pid: Tpid_t; __sig: longint; __val: Tsigval): longint; cdecl; external libc;
function sigreturn(__scp: Psigcontext): longint; cdecl; external libc;
function siginterrupt(__sig: longint; __interrupt: longint): longint; cdecl; external libc;
function sigaltstack(__ss: Pstack_t; __oss: Pstack_t): longint; cdecl; external libc;
function sigstack(__ss: Psigstack; __oss: Psigstack): longint; cdecl; external libc;
function sighold(__sig: longint): longint; cdecl; external libc;

function __libc_current_sigrtmin: longint; cdecl; external libc;
function __libc_current_sigrtmax: longint; cdecl; external libc;

function SIGRTMIN: longint;
function SIGRTMAX: longint;


// /usr/include/x86_64-linux-gnu/bits/signal_ext.h

function tgkill(__tgid: Tpid_t; __tid: Tpid_t; __signal: longint): longint; cdecl; external libc;


// /usr/include/x86_64-linux-gnu/bits/signum-generic.h

function SIG_ERR: Tsighandler_t;
function SIG_DFL: Tsighandler_t;
function SIG_IGN: Tsighandler_t;
function SIG_HOLD: Tsighandler_t;

const
  SIGINT = 2;
  SIGILL = 4;
  SIGABRT = 6;
  SIGFPE = 8;
  SIGSEGV = 11;
  SIGTERM = 15;
  SIGHUP = 1;
  SIGQUIT = 3;
  SIGTRAP = 5;
  SIGKILL = 9;
  SIGPIPE = 13;
  SIGALRM = 14;


  // /usr/include/x86_64-linux-gnu/bits/signum-arch.h

const
  SIGSTKFLT = 16;
  SIGPWR = 30;
  SIGBUS = 7;
  SIGSYS = 31;
  SIGURG = 23;
  SIGSTOP = 19;
  SIGTSTP = 20;
  SIGCONT = 18;
  SIGCHLD = 17;
  SIGTTIN = 21;
  SIGTTOU = 22;
  SIGPOLL = 29;
  SIGXFSZ = 25;
  SIGXCPU = 24;
  SIGVTALRM = 26;
  SIGPROF = 27;
  SIGUSR1 = 10;
  SIGUSR2 = 12;
  SIGWINCH = 28;
  SIGIO = SIGPOLL;
  SIGIOT = SIGABRT;
  SIGCLD = SIGCHLD;


  // === Konventiert am: 15-7-25 19:49:45 ===


implementation

function SIGRTMIN: longint;
begin
  SIGRTMIN := __libc_current_sigrtmin;
end;

function SIGRTMAX: longint;
begin
  SIGRTMAX := __libc_current_sigrtmax;
end;

// =================

function SIG_ERR: Tsighandler_t;
begin
  SIG_ERR := Tsighandler_t(-(1));
end;

function SIG_DFL: Tsighandler_t;
begin
  SIG_DFL := Tsighandler_t(0);
end;

function SIG_IGN: Tsighandler_t;
begin
  SIG_IGN := Tsighandler_t(1);
end;

function SIG_HOLD: Tsighandler_t;
begin
  SIG_HOLD := Tsighandler_t(2);
end;


end.
