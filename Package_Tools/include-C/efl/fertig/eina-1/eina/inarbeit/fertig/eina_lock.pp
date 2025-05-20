
unit eina_lock;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_lock.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_lock.h
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
PEina_Lock  = ^Eina_Lock;
PEina_Lock_Result  = ^Eina_Lock_Result;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2011 Vincent Torri
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef EINA_LOCK_H_}
{$define EINA_LOCK_H_}
{$include "eina_config.h"}
{$include "eina_types.h"}
{$include "eina_error.h"}
{$include "eina_main.h"}
{*
 * @defgroup Eina_Lock_Group Lock
 * @ingroup Eina_Tools_Group
 * @brief This group provides thread locking and synchronization capabilities.
 *
 * Similar to POSIX threads (pthreads), but it takes care of the platform specific
 * details so you don't have to.
 *
 * If you know how @c pthreads work, this library will look familiar to you.
 * If you are not familiar with @c pthreads, a good overview is available
 * <a href="https://computing.llnl.gov/tutorials/pthreads/">here</a>
 *
 * The Eina lock functions are grouped into several categories to handle different
 * thread locking and synchronization methods:
 * @li eina_lock_* - Functions that implement locking.
 * @li eina_condition_* - Functions that implement condition variables.
 * @li eina_rwlock_* - Functions that implement read/write locks.
 * @li eina_tls_* - Functions that implement thread level storage.
 * @li eina_semaphore_* - Functions that implement semaphores.
 * @li eina_barrier_* - Functions that implement barriers.
 * @li eina_spinlock_* - Functions that implement spinlocks if they are available
 * on the platform.  If they are not available, these functions degrade to plain locks.
 *
 *
 *
 * @
  }
{*
* @typedef Eina_Barrier
* @brief An opaque type for working with barrier locks.
 }
{*
* @typedef Eina_Lock
* @brief An opaque type for working with locks.
 }
{*
* @typedef Eina_Condition
* @brief An opaque type that represents a condition variable.
 }
{*
* @typedef Eina_RWLock
* @brief An opaque type for working with read/write locks.
 }
{*
* @typedef Eina_TLS
* @brief An opaque type for working with thread level storage.
 }
{*
* @typedef Eina_Semaphore
* @brief An opaque type for working with semaphores.
 }
{*
* @typedef Eina_Spinlock
* @brief An opaque type for working with spinlocks.
 }
{*
 * @typedef Eina_Lock_Result
 * @brief Return codes for lock operations.
  }
{*< Indicates that the lock operation failed.  }
{*< Indicates that the lock operation succeeded.  }
{*< Indicates that the lock is deadlocked.  }
type
  PEina_Lock_Result = ^TEina_Lock_Result;
  TEina_Lock_Result =  Longint;
  Const
    EINA_LOCK_FAIL = EINA_FALSE;
    EINA_LOCK_SUCCEED = EINA_TRUE;
    EINA_LOCK_DEADLOCK = (EINA_TRUE)+1;
;
{*
 * @brief A callback type for deallocation of thread level storage data.
  }
type

  TEina_TLS_Delete_Cb = procedure (ptr:pointer);cdecl;
{$include "eina_inline_lock_posix.x"}
{*
 * @brief A type definition for warning that a function was called from
 *        somewhere other than the EFL main loop.
  }
  var
    EINA_ERROR_NOT_MAIN_LOOP : TEina_Error;cvar;external;
{*
 * @brief Initializes a new #Eina_Lock.
 *
 * @param[in] mutex The #Eina_Lock structure to be initialized
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise
 *
 * @details This function initializes an #Eina_Lock with appropriate values.
 *          These values are platform dependent as is the structure of the
 *          #Eina_Lock itself.
 *
 * @see eina_lock_free()
  }
{*
 * @brief Prints debug information about a lock.
 * @details This function prints debug information for @p mutex.  The information is
 *          platform dependent.  On POSIX systems it prints the address of @p mutex,
 *          lock state, thread number and a backtrace.
 *
 * @param[in] mutex The #Eina_Lock to print debug info for.
 *
 * @note If @c EINA_HAVE_DEBUG_THREADS is not defined, this function does nothing.
 *
 * @since 1.19
  }
(* Const before type ignored *)

procedure eina_lock_debug(mutex:PEina_Lock);cdecl;external;
{*
 * @brief Initializes a new condition variable.
 * @details This function initializes an #Eina_Condition structure and associates it with
 *          an existing lock.
 *
 * @param[in] cond The condition variable to create
 * @param[in] mutex The #Eina_Lock structure that controls access to this condition variable
 *
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * Condition variables are used to coordinate actions between threads.  See
 * <a href="https://computing.llnl.gov/tutorials/pthreads/#ConVarOverview"> Condition Variable Overview </a>
 * for an introduction to condition variables and their use.
 *
 * @see eina_condition_free()
  }
{*
 * @brief Deallocates a condition variable.
 * @details This function deallocates a condition variable and does any platform dependent
 *          cleanup that is required.
 *
 * @param[in] cond The condition variable to be deallocated.
 *
 * @see eina_condition_new()
  }
{*
 * @brief Deallocates an #Eina_Spinlock.
 * @details This function deallocates an #Eina_Spinlock and does any platform dependent
 *          cleanup that is required.
 *
 * @param[in] spinlock The #Eina_Spinlock to be deallocated.
 *
  }
{*
 * @def EINA_MAIN_LOOP_CHECK_RETURN_VAL
 * @brief Definition for the macro that doesn't do anything unless @c EINA_HAVE_DEBUG_THREADS is defined.
 * @param[in] val The value to be returned
  }
{*
 * @
  }
{$endif}

implementation


end.
