unit fp_signal;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tsighandler_t = procedure(para1: longint); cdecl;

{$IFDEF unix}
function __sysv_signal(__sig: longint; __handler: Tsighandler_t): Tsighandler_t; cdecl; external libc;
function sysv_signal(__sig: longint; __handler: Tsighandler_t): Tsighandler_t; cdecl; external libc;
{$ENDIF}

function signal(__sig: longint; __handler: Tsighandler_t): Tsighandler_t; cdecl; external libc;

{$IFDEF unix}
function kill(__pid: Tpid_t; __sig: longint): longint; cdecl; external libc;
function killpg(__pgrp: Tpid_t; __sig: longint): longint; cdecl; external libc;
{$ENDIF}

function raise_(__sig: longint): longint; cdecl; external libc name 'raise';

{$IFDEF unix}
function ssignal(__sig: longint; __handler: Tsighandler_t): Tsighandler_t; cdecl; external libc;
function gsignal(__sig: longint): longint; cdecl; external libc;

procedure psignal(__sig: longint; __s: pchar); cdecl; external libc;
procedure psiginfo(__pinfo: Psiginfo_t; __s: pchar); cdecl; external libc;

function sigblock(__mask: longint): longint; cdecl; external libc; deprecated;
function sigsetmask(__mask: longint): longint; cdecl; external libc; deprecated;
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
function siginterrupt(__sig: longint; __interrupt: longint): longint; cdecl; external libc; deprecated 'Use sigaction with SA_RESTART instead';
function sigaltstack(__ss: Pstack_t; __oss: Pstack_t): longint; cdecl; external libc;
function __libc_current_sigrtmin: longint; cdecl; external libc;
function __libc_current_sigrtmax: longint; cdecl; external libc;

function SIGRTMIN: longint;
function SIGRTMAX: longint;
{$ENDIF}

// === Konventiert am: 6-5-25 16:02:55 ===

// === asm-generic ===========

const
   {$IFDEF unix}
  _NSIG = 64;
  _NSIG_BPW = __BITS_PER_LONG;
  _NSIG_WORDS = _NSIG div _NSIG_BPW;
  SIGHUP = 1;
  SIGINT = 2;
  SIGQUIT = 3;
  SIGILL = 4;
  SIGTRAP = 5;
  SIGABRT = 6;
  SIGIOT = 6;
  SIGBUS = 7;
  SIGFPE = 8;
  SIGKILL = 9;
  SIGUSR1 = 10;
  SIGSEGV = 11;
  SIGUSR2 = 12;
  SIGPIPE = 13;
  SIGALRM = 14;
  SIGTERM = 15;
  SIGSTKFLT = 16;
  SIGCHLD = 17;
  SIGCONT = 18;
  SIGSTOP = 19;
  SIGTSTP = 20;
  SIGTTIN = 21;
  SIGTTOU = 22;
  SIGURG = 23;
  SIGXCPU = 24;
  SIGXFSZ = 25;
  SIGVTALRM = 26;
  SIGPROF = 27;
  SIGWINCH = 28;
  SIGIO = 29;
  SIGPOLL = SIGIO;
  SIGPWR = 30;
  SIGSYS = 31;
  SIGUNUSED = 31;
  //  SIGRTMIN = 32;
  {$ENDIF}

  {$IFDEF mswindows}
   NSIG =23;
   SIGINT =2;
   SIGILL =4;
   SIGABRT_COMPAT =6;
   SIGFPE =8;
   SIGSEGV =11;
   SIGTERM =15;
   SIGBREAK =21;
   SIGABRT =22;
   SIGABRT2 =22;
   {$ENDIF}

const
  //  SIGRTMAX = _NSIG;

  MINSIGSTKSZ = 2048;
  SIGSTKSZ = 8192;

//type
//  Psigset_t = ^Tsigset_t;
//
//  Tsigset_t = record
//    sig: array[0..(_NSIG_WORDS) - 1] of dword;
//  end;
//
//  Pold_sigset_t = ^Told_sigset_t;
//  Told_sigset_t = dword;
//
//type
//  Psigaction = ^Tsigaction;
//
//  Tsigaction = record
//    sa_handler: Tsighandler_t;
//    sa_flags: dword;
//    sa_restorer: Tsigrestore_t;
//    sa_mask: Tsigset_t;
//  end;
//
//  Psigaltstack = ^Tsigaltstack;
//
//  Tsigaltstack = record
//    ss_sp: pointer;
//    ss_flags: longint;
//    ss_size: Tkernel_size_t;
//  end;
//  Tstack_t = Tsigaltstack;
//  Pstack_t = ^Tstack_t;

  // === end   asm-generic ===========

implementation


{$IFDEF unix}
function SIGRTMIN: longint;
begin
  SIGRTMIN := __libc_current_sigrtmin;
end;

function SIGRTMAX: longint;
begin
  SIGRTMAX := __libc_current_sigrtmax;
end;
{$ENDIF}


end.
