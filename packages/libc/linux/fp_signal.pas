unit fp_signal;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/signal.h

type
  Tsighandler_t = procedure(para1: longint); cdecl;

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
