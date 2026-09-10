unit apr_proc_mutex;

interface

uses
  fp_apr;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$ifndef APR_PROC_MUTEX_H}
{$define APR_PROC_MUTEX_H}
{*
 * @file apr_proc_mutex.h
 * @brief APR Process Locking Routines
  }
{$include "apr.h"}
{$include "apr_pools.h"}
{$include "apr_errno.h"}
{$include "apr_perms_set.h"}
{$include "apr_time.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_proc_mutex Process Locking Routines
 * @ingroup APR 
 * @
  }
{* 
 * Enumerated potential types for APR process locking methods
 * @warning Check APR_HAS_foo_SERIALIZE defines to see if the platform supports
 *          APR_LOCK_foo.  Only APR_LOCK_DEFAULT is portable.
  }
{*< fcntl()  }
{*< flock()  }
{*< System V Semaphores  }
{*< POSIX pthread process-based locking  }
{*< POSIX semaphore process-based locking  }
{*< Use the default process lock  }
{*< Use the default process timed lock  }
type
  Papr_lockmech_e = ^Tapr_lockmech_e;
  Tapr_lockmech_e =  Longint;
  Const
    APR_LOCK_FCNTL = 0;
    APR_LOCK_FLOCK = 1;
    APR_LOCK_SYSVSEM = 2;
    APR_LOCK_PROC_PTHREAD = 3;
    APR_LOCK_POSIXSEM = 4;
    APR_LOCK_DEFAULT = 5;
    APR_LOCK_DEFAULT_TIMED = 6;
;
{* Opaque structure representing a process mutex.  }
type
{   Function definitions  }
{*
 * Create and initialize a mutex that can be used to synchronize processes.
 * @param mutex the memory address where the newly created mutex will be
 *        stored.
 * @param fname A file name to use if the lock mechanism requires one.  This
 *        argument should always be provided.  The lock code itself will
 *        determine if it should be used.
 * @param mech The mechanism to use for the interprocess lock, if any; one of
 * <PRE>
 *            APR_LOCK_FCNTL
 *            APR_LOCK_FLOCK
 *            APR_LOCK_SYSVSEM
 *            APR_LOCK_POSIXSEM
 *            APR_LOCK_PROC_PTHREAD
 *            APR_LOCK_DEFAULT     pick the default mechanism for the platform
 * </PRE>
 * @param pool the pool from which to allocate the mutex.
 * @see apr_lockmech_e
 * @warning Check APR_HAS_foo_SERIALIZE defines to see if the platform supports
 *          APR_LOCK_foo.  Only APR_LOCK_DEFAULT is portable.
  }

function apr_proc_mutex_create(mutex:PPapr_proc_mutex_t; fname:Pchar; mech:Tapr_lockmech_e; pool:Papr_pool_t):Tapr_status_t;cdecl;external libapr;
{*
 * Re-open a mutex in a child process.
 * @param mutex The newly re-opened mutex structure.
 * @param fname A file name to use if the mutex mechanism requires one.  This
 *              argument should always be provided.  The mutex code itself will
 *              determine if it should be used.  This filename should be the 
 *              same one that was passed to apr_proc_mutex_create().
 * @param pool The pool to operate on.
 * @remark This function must be called to maintain portability, even
 *         if the underlying lock mechanism does not require it.
  }
function apr_proc_mutex_child_init(mutex:PPapr_proc_mutex_t; fname:Pchar; pool:Papr_pool_t):Tapr_status_t;cdecl;external libapr;
{*
 * Acquire the lock for the given mutex. If the mutex is already locked,
 * the current thread will be put to sleep until the lock becomes available.
 * @param mutex the mutex on which to acquire the lock.
  }
function apr_proc_mutex_lock(mutex:Papr_proc_mutex_t):Tapr_status_t;cdecl;external libapr;
{*
 * Attempt to acquire the lock for the given mutex. If the mutex has already
 * been acquired, the call returns immediately with APR_EBUSY. Note: it
 * is important that the APR_STATUS_IS_EBUSY(s) macro be used to determine
 * if the return value was APR_EBUSY, for portability reasons.
 * @param mutex the mutex on which to attempt the lock acquiring.
  }
function apr_proc_mutex_trylock(mutex:Papr_proc_mutex_t):Tapr_status_t;cdecl;external libapr;
{*
 * Attempt to acquire the lock for the given mutex until timeout expires.
 * If the acquisition time outs, the call returns with APR_TIMEUP.
 * @param mutex the mutex on which to attempt the lock acquiring.
 * @param timeout the relative timeout (microseconds).
 * @note A negative or nul timeout means immediate attempt, returning
 *       APR_TIMEUP without blocking if it the lock is already acquired.
  }
function apr_proc_mutex_timedlock(mutex:Papr_proc_mutex_t; timeout:Tapr_interval_time_t):Tapr_status_t;cdecl;external libapr;
{*
 * Release the lock for the given mutex.
 * @param mutex the mutex from which to release the lock.
  }
function apr_proc_mutex_unlock(mutex:Papr_proc_mutex_t):Tapr_status_t;cdecl;external libapr;
{*
 * Destroy the mutex and free the memory associated with the lock.
 * @param mutex the mutex to destroy.
  }
function apr_proc_mutex_destroy(mutex:Papr_proc_mutex_t):Tapr_status_t;cdecl;external libapr;
{*
 * Destroy the mutex and free the memory associated with the lock.
 * @param mutex the mutex to destroy.
 * @note This function is generally used to kill a cleanup on an already
 *       created mutex
  }
function apr_proc_mutex_cleanup(mutex:pointer):Tapr_status_t;cdecl;external libapr;
{*
 * Return the name of the lockfile for the mutex, or NULL
 * if the mutex doesn't use a lock file
  }
function apr_proc_mutex_lockfile(mutex:Papr_proc_mutex_t):Pchar;cdecl;external libapr;
{*
 * Get the mechanism of the mutex, as it relates to the actual method
 * used for the underlying apr_proc_mutex_t.
 * @param mutex the mutex to get the mechanism from.
  }
function apr_proc_mutex_mech(mutex:Papr_proc_mutex_t):Tapr_lockmech_e;cdecl;external libapr;
{*
 * Get the mechanism's name of the mutex, as it relates to the actual method
 * used for the underlying apr_proc_mutex_t.
 * @param mutex the mutex to get the mechanism's name from.
  }
function apr_proc_mutex_name(mutex:Papr_proc_mutex_t):Pchar;cdecl;external libapr;
{*
 * Display the name of the default mutex: APR_LOCK_DEFAULT
  }
function apr_proc_mutex_defname:Pchar;cdecl;external libapr;
{*
 * Set mutex permissions.
  }
  var
    proc_mutex : TAPR_PERMS_SET_IMPLEMENT;cvar;public;
{*
 * Get the pool used by this proc_mutex.
 * @return apr_pool_t the pool
  }
    proc_mutex : TAPR_POOL_DECLARE_ACCESSOR;cvar;public;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_PROC_MUTEX_H  }

// === Konventiert am: 10-9-26 16:47:42 ===


implementation



end.
