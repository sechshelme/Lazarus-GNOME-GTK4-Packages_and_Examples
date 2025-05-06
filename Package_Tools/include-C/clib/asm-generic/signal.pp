
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
Pold_sigset_t  = ^old_sigset_t;
Psigaction  = ^sigaction;
Psigaltstack  = ^sigaltstack;
Psigset_t  = ^sigset_t;
Pstack_t  = ^stack_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note  }
{$ifndef __ASM_GENERIC_SIGNAL_H}
{$define __ASM_GENERIC_SIGNAL_H}
{$include <linux/types.h>}

const
  _NSIG = 64;  
  _NSIG_BPW = __BITS_PER_LONG;  
  _NSIG_WORDS = _NSIG/_NSIG_BPW;  
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
{
#define SIGLOST		29
 }
  SIGPWR = 30;  
  SIGSYS = 31;  
  SIGUNUSED = 31;  
{ These should not be considered constants from userland.   }
  SIGRTMIN = 32;  
{$ifndef SIGRTMAX}

const
  SIGRTMAX = _NSIG;  
{$endif}
{$if !defined MINSIGSTKSZ || !defined SIGSTKSZ}

const
  MINSIGSTKSZ = 2048;  
  SIGSTKSZ = 8192;  
{$endif}
{$ifndef __ASSEMBLY__}
type
  Psigset_t = ^Tsigset_t;
  Tsigset_t = record
      sig : array[0..(_NSIG_WORDS)-1] of dword;
    end;
{ not actually used, but required for linux/syscalls.h  }

  Pold_sigset_t = ^Told_sigset_t;
  Told_sigset_t = dword;
{$include <asm-generic/signal-defs.h>}
{$ifdef SA_RESTORER}
{$define __ARCH_HAS_SA_RESTORER}
{$endif}
{$ifdef SA_RESTORER}
{$endif}
{ mask last for extensibility  }
type
  Psigaction = ^Tsigaction;
  Tsigaction = record
      sa_handler : Tsighandler_t;
      sa_flags : dword;
      sa_restorer : Tsigrestore_t;
      sa_mask : Tsigset_t;
    end;


  Psigaltstack = ^Tsigaltstack;
  Tsigaltstack = record
      ss_sp : pointer;
      ss_flags : longint;
      ss_size : Tkernel_size_t;
    end;
  Tstack_t = Tsigaltstack;
  Pstack_t = ^Tstack_t;
{$endif}
{ __ASSEMBLY__  }
{$endif}
{ __ASM_GENERIC_SIGNAL_H  }

implementation


end.
