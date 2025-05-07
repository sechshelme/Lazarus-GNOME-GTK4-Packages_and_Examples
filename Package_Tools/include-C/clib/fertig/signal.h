/* Copyright (C) 1991-2024 Free Software Foundation, Inc.
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
   <https://www.gnu.org/licenses/>.  */

/*
 *	ISO C99 Standard: 7.14 Signal handling <signal.h>
 */

#ifndef	_SIGNAL_H
#define _SIGNAL_H

#include <features.h>

#include <bits/types.h>
#include <bits/signum-generic.h>

#include <bits/types/sig_atomic_t.h>

#if defined __USE_POSIX
#include <bits/types/sigset_t.h>
#endif

#if defined __USE_XOPEN || defined __USE_XOPEN2K
# ifndef __pid_t_defined
typedef __pid_t pid_t;
#  define __pid_t_defined
#endif
#ifdef __USE_XOPEN
# endif
# ifndef __uid_t_defined
typedef __uid_t uid_t;
#  define __uid_t_defined
# endif
#endif	/* Unix98 */

#ifdef __USE_POSIX199309
/* We need `struct timespec' later on.  */
# include <bits/types/struct_timespec.h>
#endif


#ifdef __USE_MISC
# include <bits/types/sigval_t.h>
#endif

#ifdef __USE_POSIX199309
# include <bits/types/sigevent_t.h>
# include <bits/sigevent-consts.h>
#endif


/* Type of a signal handler.  */
typedef void (*__sighandler_t) (int);

/* The X/Open definition of `signal' specifies the SVID semantic.  Use
   the additional function `sysv_signal' when X/Open compatibility is
   requested.  */
extern __sighandler_t __sysv_signal (int __sig, __sighandler_t __handler)
     ;
#ifdef __USE_GNU
extern __sighandler_t sysv_signal (int __sig, __sighandler_t __handler)
     ;
#endif

/* Set the handler for the signal SIG to HANDLER, returning the old
   handler, or SIG_ERR on error.
   By default `signal' has the BSD semantic.  */
#ifdef __USE_MISC
extern __sighandler_t signal (int __sig, __sighandler_t __handler)
     ;
#else
/* Make sure the used `signal' implementation is the SVID version. */


/* Send signal SIG to process number PID.  If PID is zero,
   send SIG to all processes in the current process's process group.
   If PID is < -1, send SIG to all processes in process group - PID.  */
#ifdef __USE_POSIX
extern int kill (__pid_t __pid, int __sig) ;
#endif /* Use POSIX.  */

#if defined __USE_MISC || defined __USE_XOPEN_EXTENDED
/* Send SIG to all processes in process group PGRP.
   If PGRP is zero, send SIG to all processes in
   the current process's process group.  */
extern int killpg (__pid_t __pgrp, int __sig) ;
#endif /* Use misc || X/Open Unix.  */

/* Raise signal SIG, i.e., send SIG to yourself.  */
extern int raise (int __sig) ;

#ifdef __USE_MISC
/* SVID names for the same things.  */
extern __sighandler_t ssignal (int __sig, __sighandler_t __handler)
     ;
extern int gsignal (int __sig) ;
#endif /* Use misc.  */

#ifdef __USE_XOPEN2K8
/* Print a message describing the meaning of the given signal number.  */
extern void psignal (int __sig, const char *__s);

/* Print a message describing the meaning of the given signal information.  */
extern void psiginfo (const siginfo_t *__pinfo, const char *__s);
#endif /* POSIX 2008.  */



/* The `sigpause' function in X/Open defines the argument as the
   signal number.  This requires redirecting to another function
   because the default version in glibc uses an old BSD interface.

   This function is a cancellation point and therefore not marked with
   .  */



#ifdef __USE_MISC
/* None of the following functions should be used anymore.  They are here
   only for compatibility.  A single word (`int') is not guaranteed to be
   enough to hold a complete signal mask and therefore these functions
   simply do not work in many situations.  Use `sigprocmask' instead.  */

/* Compute mask for signal SIG.  */

/* Block signals in MASK, returning the old mask.  */
// __attribute_deprecated__
extern int sigblock (int __mask)  ;

/* Set the mask of blocked signals to MASK, returning the old mask.  */
// __attribute_deprecated__
extern int sigsetmask (int __mask)  ;

/* Return currently selected signal mask.  */
//  __attribute_deprecated__
extern int siggetmask (void) ;
#endif /* Use misc.  */


#ifdef __USE_MISC
# define NSIG	_NSIG
#endif

#ifdef __USE_GNU
typedef __sighandler_t sighandler_t;
#endif

/* 4.4 BSD uses the name `sig_t' for this.  */
#ifdef __USE_MISC
typedef __sighandler_t sig_t;
#endif

#ifdef __USE_POSIX

/* Clear all signals from SET.  */
extern int sigemptyset (sigset_t *__set)  ;

/* Set all signals in SET.  */
extern int sigfillset (sigset_t *__set)  ;

/* Add SIGNO to SET.  */
extern int sigaddset (sigset_t *__set, int __signo)  ;

/* Remove SIGNO from SET.  */
extern int sigdelset (sigset_t *__set, int __signo)  ;

/* Return 1 if SIGNO is in SET, 0 if not.  */
extern int sigismember (const sigset_t *__set, int __signo)
      ;

# ifdef __USE_GNU
/* Return non-empty value is SET is not empty.  */
extern int sigisemptyset (const sigset_t *__set)  ;

/* Build new signal set by combining the two inputs set using logical AND.  */
extern int sigandset (sigset_t *__set, const sigset_t *__left,
		      const sigset_t *__right)  ;

/* Build new signal set by combining the two inputs set using logical OR.  */
extern int sigorset (sigset_t *__set, const sigset_t *__left,
		     const sigset_t *__right)  ;
# endif /* GNU */

/* Get the system-specific definitions of `struct sigaction'
   and the `SA_*' and `SIG_*'. constants.  */
# include <bits/sigaction.h>

/* Get and/or change the set of blocked signals.  */
extern int sigprocmask (int __how, const sigset_t * __set,
			sigset_t * __oset) ;

/* Change the set of blocked signals to SET,
   wait until a signal arrives, and restore the set of blocked signals.

   This function is a cancellation point and therefore not marked with
   .  */
extern int sigsuspend (const sigset_t *__set) ;

/* Get and/or set the action for signal SIG.  */
extern int sigaction (int __sig, const struct sigaction * __act,
		      struct sigaction * __oact) ;

/* Put in SET all signals that are blocked and waiting to be delivered.  */
extern int sigpending (sigset_t *__set)  ;


# ifdef __USE_POSIX199506
/* Select any of pending signals from SET or wait for any to arrive.

   This function is a cancellation point and therefore not marked with
   .  */
extern int sigwait (const sigset_t * __set, int * __sig)
     ;
# endif /* Use POSIX 1995.  */

# ifdef __USE_POSIX199309
/* Select any of pending signals from SET and place information in INFO.

   This function is a cancellation point and therefore not marked with
   .  */
extern int sigwaitinfo (const sigset_t * __set,
			siginfo_t * __info) ;

/* Select any of pending signals from SET and place information in INFO.
   Wait the time specified by TIMEOUT if no signal is pending.

   This function is a cancellation point and therefore not marked with
   .  */
#  ifndef __USE_TIME_BITS64
extern int sigtimedwait (const sigset_t * __set,
			 siginfo_t * __info,
			 const struct timespec * __timeout)
     ;
#  else
#  endif

/* Send signal SIG to the process PID.  Associate data in VAL with the
   signal.  */
extern int sigqueue (__pid_t __pid, int __sig, const union sigval __val)
     ;
# endif	/* Use POSIX 199306.  */

#endif /* Use POSIX.  */

#ifdef __USE_MISC

/* Get machine-dependent `struct sigcontext' and signal subcodes.  */
# include <bits/sigcontext.h>

/* Restore the state saved in SCP.  */
extern int sigreturn (struct sigcontext *__scp) ;

#endif /* Use misc.  */


#if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8
# define __need_size_t
# include <stddef.h>

# include <bits/types/stack_t.h>
# if defined __USE_XOPEN || defined __USE_XOPEN2K8
/* This will define `ucontext_t' and `mcontext_t'.  */
#  include <sys/ucontext.h>
# endif
#endif /* Use POSIX.1-2008 or X/Open Unix.  */

#if defined __USE_XOPEN_EXTENDED || defined __USE_MISC
/* If INTERRUPT is nonzero, make signal SIG interrupt system calls
   (causing them to fail with EINTR); if INTERRUPT is zero, make system
   calls be restarted after signal SIG.  */
// __attribute_deprecated_msg__ ("Use sigaction with SA_RESTART instead")
extern int siginterrupt (int __sig, int __interrupt) 
  ;

# include <bits/sigstack.h>
# include <bits/sigstksz.h>
# include <bits/ss_flags.h>

/* Alternate signal handler stack interface.
   This interface should always be preferred over `sigstack'.  */
extern int sigaltstack (const stack_t * __ss,
			stack_t * __oss) ;
#endif /* __USE_XOPEN_EXTENDED || __USE_MISC */




#if defined __USE_POSIX199506 || defined __USE_UNIX98
/* Some of the functions for handling signals in threaded programs must
   be defined here.  */
# include <bits/pthreadtypes.h>
# include <bits/sigthread.h>
#endif /* use Unix98 */

/* The following functions are used internally in the C library and in
   other code which need deep insights.  */

/* Return number of available real-time signal with highest priority.  */
extern int __libc_current_sigrtmin (void) ;
/* Return number of available real-time signal with lowest priority.  */
extern int __libc_current_sigrtmax (void) ;

#define SIGRTMIN        (__libc_current_sigrtmin ())
#define SIGRTMAX        (__libc_current_sigrtmax ())

/* System-specific extensions.  */
#include <bits/signal_ext.h>


#endif /* not signal.h */
