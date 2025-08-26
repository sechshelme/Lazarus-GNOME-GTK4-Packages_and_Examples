
unit thread;
interface

{
  Automatically converted by H2Pas 1.0.0 from thread.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    thread.h
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
Pevent_base  = ^event_base;
Pevthread_condition_callbacks  = ^evthread_condition_callbacks;
Pevthread_lock_callbacks  = ^evthread_lock_callbacks;
Ptimeval  = ^timeval;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2008-2012 Niels Provos and Nick Mathewson
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  }
{$ifndef EVENT2_THREAD_H_INCLUDED_}
{$define EVENT2_THREAD_H_INCLUDED_}
{* @file event2/thread.h

  Functions for multi-threaded applications using Libevent.

  When using a multi-threaded application in which multiple threads
  add and delete events from a single event base, Libevent needs to
  lock its data structures.

  Like the memory-management function hooks, all of the threading functions
  _must_ be set up before an event_base is created if you want the base to
  use them.

  Most programs will either be using Windows threads or Posix threads.  You
  can configure Libevent to use one of these event_use_windows_threads() or
  event_use_pthreads() respectively.  If you're using another threading
  library, you'll need to configure threading functions manually using
  evthread_set_lock_callbacks() and evthread_set_condition_callbacks().

  }
{$include <event2/visibility.h>}
{ C++ extern C conditionnal removed }
{$include <event2/event-config.h>}
{*
   @name Flags passed to lock functions

   @
 }
{* A flag passed to a locking callback when the lock was allocated as a
 * read-write lock, and we want to acquire or release the lock for writing.  }

const
  EVTHREAD_WRITE = $04;  
{* A flag passed to a locking callback when the lock was allocated as a
 * read-write lock, and we want to acquire or release the lock for reading.  }
  EVTHREAD_READ = $08;  
{* A flag passed to a locking callback when we don't want to block waiting
 * for the lock; if we can't get the lock immediately, we will instead
 * return nonzero from the locking callback.  }
  EVTHREAD_TRY = $10;  
{*@ }
{$if !defined(EVENT__DISABLE_THREAD_SUPPORT) || defined(EVENT_IN_DOXYGEN_)}

const
  EVTHREAD_LOCK_API_VERSION = 1;  
{*
   @name Types of locks

   @ }
{* A recursive lock is one that can be acquired multiple times at once by the
 * same thread.  No other process can allocate the lock until the thread that
 * has been holding it has unlocked it as many times as it locked it.  }
  EVTHREAD_LOCKTYPE_RECURSIVE = 1;  
{ A read-write lock is one that allows multiple simultaneous readers, but
 * where any one writer excludes all other writers and readers.  }
  EVTHREAD_LOCKTYPE_READWRITE = 2;  
{*@ }
{* This structure describes the interface a threading library uses for
 * locking.   It's used to tell evthread_set_lock_callbacks() how to use
 * locking on this platform.
  }
{* The current version of the locking API.  Set this to
	 * EVTHREAD_LOCK_API_VERSION  }
{* Which kinds of locks does this version of the locking API
	 * support?  A bitfield of EVTHREAD_LOCKTYPE_RECURSIVE and
	 * EVTHREAD_LOCKTYPE_READWRITE.
	 *
	 * (Note that RECURSIVE locks are currently mandatory, and
	 * READWRITE locks are not currently used.)
	 * }
{* Function to allocate and initialize new lock of type 'locktype'.
	 * Returns NULL on failure.  }
{* Funtion to release all storage held in 'lock', which was created
	 * with type 'locktype'.  }
{* Acquire an already-allocated lock at 'lock' with mode 'mode'.
	 * Returns 0 on success, and nonzero on failure.  }
{* Release a lock at 'lock' using mode 'mode'.  Returns 0 on success,
	 * and nonzero on failure.  }
type
  Pevthread_lock_callbacks = ^Tevthread_lock_callbacks;
  Tevthread_lock_callbacks = record
      lock_api_version : longint;
      supported_locktypes : dword;
      alloc : function (locktype:dword):pointer;cdecl;
      free : procedure (lock:pointer; locktype:dword);cdecl;
      lock : function (mode:dword; lock:pointer):longint;cdecl;
      unlock : function (mode:dword; lock:pointer):longint;cdecl;
    end;

{* Sets a group of functions that Libevent should use for locking.
 * For full information on the required callback API, see the
 * documentation for the individual members of evthread_lock_callbacks.
 *
 * Note that if you're using Windows or the Pthreads threading library, you
 * probably shouldn't call this function; instead, use
 * evthread_use_windows_threads() or evthread_use_posix_threads() if you can.
  }
(* Const before type ignored *)

function evthread_set_lock_callbacks(para1:Pevthread_lock_callbacks):longint;cdecl;external;
const
  EVTHREAD_CONDITION_API_VERSION = 1;  
type
  Ptimeval = ^Ttimeval;
  Ttimeval = record
      {undefined structure}
    end;

{* This structure describes the interface a threading library uses for
 * condition variables.  It's used to tell evthread_set_condition_callbacks
 * how to use locking on this platform.
  }
{* The current version of the conditions API.  Set this to
	 * EVTHREAD_CONDITION_API_VERSION  }
{* Function to allocate and initialize a new condition variable.
	 * Returns the condition variable on success, and NULL on failure.
	 * The 'condtype' argument will be 0 with this API version.
	  }
{* Function to free a condition variable.  }
{* Function to signal a condition variable.  If 'broadcast' is 1, all
	 * threads waiting on 'cond' should be woken; otherwise, only on one
	 * thread is worken.  Should return 0 on success, -1 on failure.
	 * This function will only be called while holding the associated
	 * lock for the condition.
	  }
{* Function to wait for a condition variable.  The lock 'lock'
	 * will be held when this function is called; should be released
	 * while waiting for the condition to be come signalled, and
	 * should be held again when this function returns.
	 * If timeout is provided, it is interval of seconds to wait for
	 * the event to become signalled; if it is NULL, the function
	 * should wait indefinitely.
	 *
	 * The function should return -1 on error; 0 if the condition
	 * was signalled, or 1 on a timeout.  }
(* Const before type ignored *)
  Pevthread_condition_callbacks = ^Tevthread_condition_callbacks;
  Tevthread_condition_callbacks = record
      condition_api_version : longint;
      alloc_condition : function (condtype:dword):pointer;cdecl;
      free_condition : procedure (cond:pointer);cdecl;
      signal_condition : function (cond:pointer; broadcast:longint):longint;cdecl;
      wait_condition : function (cond:pointer; lock:pointer; timeout:Ptimeval):longint;cdecl;
    end;

{* Sets a group of functions that Libevent should use for condition variables.
 * For full information on the required callback API, see the
 * documentation for the individual members of evthread_condition_callbacks.
 *
 * Note that if you're using Windows or the Pthreads threading library, you
 * probably shouldn't call this function; instead, use
 * evthread_use_windows_threads() or evthread_use_pthreads() if you can.
  }
(* Const before type ignored *)

function evthread_set_condition_callbacks(para1:Pevthread_condition_callbacks):longint;cdecl;external;
{*
   Sets the function for determining the thread id.

   @param base the event base for which to set the id function
   @param id_fn the identify function Libevent should invoke to
     determine the identity of a thread.
 }
procedure evthread_set_id_callback(id_fn:function :dword);cdecl;external;
{$if (defined(_WIN32) && !defined(EVENT__DISABLE_THREAD_SUPPORT)) || defined(EVENT_IN_DOXYGEN_)}
{* Sets up Libevent for use with Windows builtin locking and thread ID
    functions.  Unavailable if Libevent is not built for Windows.

    @return 0 on success, -1 on failure.  }

function evthread_use_windows_threads:longint;cdecl;external;
{*
   Defined if Libevent was built with support for evthread_use_windows_threads()
 }
const
  EVTHREAD_USE_WINDOWS_THREADS_IMPLEMENTED = 1;  
{$endif}
{$if defined(EVENT__HAVE_PTHREADS) || defined(EVENT_IN_DOXYGEN_)}
{* Sets up Libevent for use with Pthreads locking and thread ID functions.
    Unavailable if Libevent is not build for use with pthreads.  Requires
    libraries to link against Libevent_pthreads as well as Libevent.

    @return 0 on success, -1 on failure.  }

function evthread_use_pthreads:longint;cdecl;external;
{* Defined if Libevent was built with support for evthread_use_pthreads()  }
const
  EVTHREAD_USE_PTHREADS_IMPLEMENTED = 1;  
{$endif}
{* Enable debugging wrappers around the current lock callbacks.  If Libevent
 * makes one of several common locking errors, exit with an assertion failure.
 *
 * If you're going to call this function, you must do so before any locks are
 * allocated.
 * }

procedure evthread_enable_lock_debugging;cdecl;external;
{ Old (misspelled) version: This is deprecated; use
 * evthread_enable_log_debugging instead.  }
procedure evthread_enable_lock_debuging;cdecl;external;
{$endif}
{ EVENT__DISABLE_THREAD_SUPPORT  }
type
  Pevent_base = ^Tevent_base;
  Tevent_base = record
      {undefined structure}
    end;

{* Make sure it's safe to tell an event base to wake up from another thread
    or a signal handler.

    You shouldn't need to call this by hand; configuring the base with thread
    support should be necessary and sufficient.

    @return 0 on success, -1 on failure.
  }

function evthread_make_base_notifiable(base:Pevent_base):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ EVENT2_THREAD_H_INCLUDED_  }

implementation


end.
