
unit dbus_threads;
interface

{
  Automatically converted by H2Pas 1.0.0 from dbus_threads.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dbus_threads.h
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
PDBusCondVar  = ^DBusCondVar;
PDBusCondVarNewFunction  = ^DBusCondVarNewFunction;
PDBusMutex  = ^DBusMutex;
PDBusMutexNewFunction  = ^DBusMutexNewFunction;
PDBusRecursiveMutexNewFunction  = ^DBusRecursiveMutexNewFunction;
PDBusThreadFunctions  = ^DBusThreadFunctions;
PDBusThreadFunctionsMask  = ^DBusThreadFunctionsMask;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
{ dbus-threads.h  D-Bus threads handling
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
  }
{$if !defined (DBUS_INSIDE_DBUS_H) && !defined (DBUS_COMPILATION)}
{$error "Only <dbus/dbus.h> can be included directly, this file may disappear or change contents."}
{$endif}
{$ifndef DBUS_THREADS_H}
{$define DBUS_THREADS_H}
{$include <dbus/dbus-macros.h>}
{$include <dbus/dbus-types.h>}
{*
 * @addtogroup DBusThreads
 * @
  }
{* An opaque mutex type provided by the #DBusThreadFunctions implementation installed by dbus_threads_init().  }
type
{* An opaque condition variable type provided by the #DBusThreadFunctions implementation installed by dbus_threads_init().  }
{* Deprecated, provide DBusRecursiveMutexNewFunction instead.  }

  PDBusMutexNewFunction = ^TDBusMutexNewFunction;
  TDBusMutexNewFunction = function :PDBusMutex;cdecl;
{* Deprecated, provide DBusRecursiveMutexFreeFunction instead.  }

  TDBusMutexFreeFunction = procedure (mutex:PDBusMutex);cdecl;
{* Deprecated, provide DBusRecursiveMutexLockFunction instead. Return value is lock success, but gets ignored in practice.  }

  TDBusMutexLockFunction = function (mutex:PDBusMutex):Tdbus_bool_t;cdecl;
{* Deprecated, provide DBusRecursiveMutexUnlockFunction instead. Return value is unlock success, but gets ignored in practice.  }

  TDBusMutexUnlockFunction = function (mutex:PDBusMutex):Tdbus_bool_t;cdecl;
{* Creates a new recursively-lockable mutex, or returns #NULL if not
 * enough memory.  Can only fail due to lack of memory.  Found in
 * #DBusThreadFunctions. Do not just use PTHREAD_MUTEX_RECURSIVE for
 * this, because it does not save/restore the recursion count when
 * waiting on a condition. libdbus requires the Java-style behavior
 * where the mutex is fully unlocked to wait on a condition.
  }

  PDBusRecursiveMutexNewFunction = ^TDBusRecursiveMutexNewFunction;
  TDBusRecursiveMutexNewFunction = function :PDBusMutex;cdecl;
{* Frees a recursively-lockable mutex.  Found in #DBusThreadFunctions.
  }

  TDBusRecursiveMutexFreeFunction = procedure (mutex:PDBusMutex);cdecl;
{* Locks a recursively-lockable mutex.  Found in #DBusThreadFunctions.
 * Can only fail due to lack of memory.
  }

  TDBusRecursiveMutexLockFunction = procedure (mutex:PDBusMutex);cdecl;
{* Unlocks a recursively-lockable mutex.  Found in #DBusThreadFunctions.
 * Can only fail due to lack of memory.
  }

  TDBusRecursiveMutexUnlockFunction = procedure (mutex:PDBusMutex);cdecl;
{* Creates a new condition variable.  Found in #DBusThreadFunctions.
 * Can only fail (returning #NULL) due to lack of memory.
  }

  PDBusCondVarNewFunction = ^TDBusCondVarNewFunction;
  TDBusCondVarNewFunction = function :PDBusCondVar;cdecl;
{* Frees a condition variable.  Found in #DBusThreadFunctions.
  }

  TDBusCondVarFreeFunction = procedure (cond:PDBusCondVar);cdecl;
{* Waits on a condition variable.  Found in
 * #DBusThreadFunctions. Must work with either a recursive or
 * nonrecursive mutex, whichever the thread implementation
 * provides. Note that PTHREAD_MUTEX_RECURSIVE does not work with
 * condition variables (does not save/restore the recursion count) so
 * don't try using simply pthread_cond_wait() and a
 * PTHREAD_MUTEX_RECURSIVE to implement this, it won't work right.
 *
 * Has no error conditions. Must succeed if it returns.
  }

  TDBusCondVarWaitFunction = procedure (cond:PDBusCondVar; mutex:PDBusMutex);cdecl;
{* Waits on a condition variable with a timeout.  Found in
 *  #DBusThreadFunctions. Returns #TRUE if the wait did not
 *  time out, and #FALSE if it did.
 *
 * Has no error conditions. Must succeed if it returns. 
  }

  TDBusCondVarWaitTimeoutFunction = function (cond:PDBusCondVar; mutex:PDBusMutex; timeout_milliseconds:longint):Tdbus_bool_t;cdecl;
{* Wakes one waiting thread on a condition variable.  Found in #DBusThreadFunctions.
 *
 * Has no error conditions. Must succeed if it returns.
  }

  TDBusCondVarWakeOneFunction = procedure (cond:PDBusCondVar);cdecl;
{* Wakes all waiting threads on a condition variable.  Found in #DBusThreadFunctions.
 *
 * Has no error conditions. Must succeed if it returns.
  }

  TDBusCondVarWakeAllFunction = procedure (cond:PDBusCondVar);cdecl;
{*
 * Flags indicating which functions are present in #DBusThreadFunctions. Used to allow
 * the library to detect older callers of dbus_threads_init() if new possible functions
 * are added to #DBusThreadFunctions.
  }

  PDBusThreadFunctionsMask = ^TDBusThreadFunctionsMask;
  TDBusThreadFunctionsMask =  Longint;
  Const
    DBUS_THREAD_FUNCTIONS_MUTEX_NEW_MASK = 1 shl 0;
    DBUS_THREAD_FUNCTIONS_MUTEX_FREE_MASK = 1 shl 1;
    DBUS_THREAD_FUNCTIONS_MUTEX_LOCK_MASK = 1 shl 2;
    DBUS_THREAD_FUNCTIONS_MUTEX_UNLOCK_MASK = 1 shl 3;
    DBUS_THREAD_FUNCTIONS_CONDVAR_NEW_MASK = 1 shl 4;
    DBUS_THREAD_FUNCTIONS_CONDVAR_FREE_MASK = 1 shl 5;
    DBUS_THREAD_FUNCTIONS_CONDVAR_WAIT_MASK = 1 shl 6;
    DBUS_THREAD_FUNCTIONS_CONDVAR_WAIT_TIMEOUT_MASK = 1 shl 7;
    DBUS_THREAD_FUNCTIONS_CONDVAR_WAKE_ONE_MASK = 1 shl 8;
    DBUS_THREAD_FUNCTIONS_CONDVAR_WAKE_ALL_MASK = 1 shl 9;
    DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_NEW_MASK = 1 shl 10;
    DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_FREE_MASK = 1 shl 11;
    DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_LOCK_MASK = 1 shl 12;
    DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_UNLOCK_MASK = 1 shl 13;
    DBUS_THREAD_FUNCTIONS_ALL_MASK = (1 shl 14)-1;
;
{*
 * Functions that must be implemented to make the D-Bus library
 * thread-aware.
 *
 * If you supply both recursive and non-recursive mutexes,
 * libdbus will use the non-recursive version for condition variables,
 * and the recursive version in other contexts.
 *
 * The condition variable functions have to work with nonrecursive
 * mutexes if you provide those, or with recursive mutexes if you
 * don't.
  }
{*< Mask indicating which functions are present.  }
{*< Function to create a mutex; optional and deprecated.  }
{*< Function to free a mutex; optional and deprecated.  }
{*< Function to lock a mutex; optional and deprecated.  }
{*< Function to unlock a mutex; optional and deprecated.  }
{*< Function to create a condition variable  }
{*< Function to free a condition variable  }
{*< Function to wait on a condition  }
{*< Function to wait on a condition with a timeout  }
{*< Function to wake one thread waiting on the condition  }
{*< Function to wake all threads waiting on the condition  }
{*< Function to create a recursive mutex  }
{*< Function to free a recursive mutex  }
{*< Function to lock a recursive mutex  }
{*< Function to unlock a recursive mutex  }
{*< Reserved for future expansion  }
{*< Reserved for future expansion  }
{*< Reserved for future expansion  }
{*< Reserved for future expansion  }
type
  PDBusThreadFunctions = ^TDBusThreadFunctions;
  TDBusThreadFunctions = record
      mask : dword;
      mutex_new : TDBusMutexNewFunction;
      mutex_free : TDBusMutexFreeFunction;
      mutex_lock : TDBusMutexLockFunction;
      mutex_unlock : TDBusMutexUnlockFunction;
      condvar_new : TDBusCondVarNewFunction;
      condvar_free : TDBusCondVarFreeFunction;
      condvar_wait : TDBusCondVarWaitFunction;
      condvar_wait_timeout : TDBusCondVarWaitTimeoutFunction;
      condvar_wake_one : TDBusCondVarWakeOneFunction;
      condvar_wake_all : TDBusCondVarWakeAllFunction;
      recursive_mutex_new : TDBusRecursiveMutexNewFunction;
      recursive_mutex_free : TDBusRecursiveMutexFreeFunction;
      recursive_mutex_lock : TDBusRecursiveMutexLockFunction;
      recursive_mutex_unlock : TDBusRecursiveMutexUnlockFunction;
      padding1 : procedure ;cdecl;
      padding2 : procedure ;cdecl;
      padding3 : procedure ;cdecl;
      padding4 : procedure ;cdecl;
    end;
(* Const before type ignored *)

function dbus_threads_init(functions:PDBusThreadFunctions):Tdbus_bool_t;cdecl;external;
function dbus_threads_init_default:Tdbus_bool_t;cdecl;external;
{* @  }
{$endif}
{ DBUS_THREADS_H  }

implementation


end.
