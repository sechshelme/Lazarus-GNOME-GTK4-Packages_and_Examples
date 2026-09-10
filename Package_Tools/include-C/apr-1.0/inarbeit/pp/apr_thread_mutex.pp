
unit apr_thread_mutex;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_thread_mutex.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_thread_mutex.h
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
Papr_pool_t  = ^apr_pool_t;
Papr_thread_mutex_t  = ^apr_thread_mutex_t;
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
{$ifndef APR_THREAD_MUTEX_H}
{$define APR_THREAD_MUTEX_H}
{*
 * @file apr_thread_mutex.h
 * @brief APR Thread Mutex Routines
  }
{$include "apr.h"}
{$include "apr_errno.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{$if APR_HAS_THREADS || defined(DOXYGEN)}
{*
 * @defgroup apr_thread_mutex Thread Mutex Routines
 * @ingroup APR 
 * @
  }
{* Opaque thread-local mutex structure  }
type
{*< platform-optimal lock behavior  }

const
  APR_THREAD_MUTEX_DEFAULT = $0;  
{*< enable nested (recursive) locks  }
  APR_THREAD_MUTEX_NESTED = $1;  
{*< disable nested locks  }
  APR_THREAD_MUTEX_UNNESTED = $2;  
{*< enable timed locks  }
  APR_THREAD_MUTEX_TIMED = $4;  
{ Delayed the include to avoid a circular reference  }
{$include "apr_pools.h"}
{$include "apr_time.h"}
{*
 * Create and initialize a mutex that can be used to synchronize threads.
 * @param mutex the memory address where the newly created mutex will be
 *        stored.
 * @param flags Or'ed value of:
 * <PRE>
 *           APR_THREAD_MUTEX_DEFAULT   platform-optimal lock behavior.
 *           APR_THREAD_MUTEX_NESTED    enable nested (recursive) locks.
 *           APR_THREAD_MUTEX_UNNESTED  disable nested locks (non-recursive).
 * </PRE>
 * @param pool the pool from which to allocate the mutex.
 * @warning Be cautious in using APR_THREAD_MUTEX_DEFAULT.  While this is the
 * most optimal mutex based on a given platform's performance characteristics,
 * it will behave as either a nested or an unnested lock.
  }

function apr_thread_mutex_create(mutex:PPapr_thread_mutex_t; flags:dword; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Acquire the lock for the given mutex. If the mutex is already locked,
 * the current thread will be put to sleep until the lock becomes available.
 * @param mutex the mutex on which to acquire the lock.
  }
function apr_thread_mutex_lock(mutex:Papr_thread_mutex_t):Tapr_status_t;cdecl;external;
{*
 * Attempt to acquire the lock for the given mutex. If the mutex has already
 * been acquired, the call returns immediately with APR_EBUSY. Note: it
 * is important that the APR_STATUS_IS_EBUSY(s) macro be used to determine
 * if the return value was APR_EBUSY, for portability reasons.
 * @param mutex the mutex on which to attempt the lock acquiring.
  }
function apr_thread_mutex_trylock(mutex:Papr_thread_mutex_t):Tapr_status_t;cdecl;external;
{*
 * Attempt to acquire the lock for the given mutex until timeout expires.
 * If the acquisition time outs, the call returns with APR_TIMEUP.
 * @param mutex the mutex on which to attempt the lock acquiring.
 * @param timeout the relative timeout (microseconds).
 * @note A timeout negative or nul means immediate attempt, returning
 *       APR_TIMEUP without blocking if it the lock is already acquired.
  }
function apr_thread_mutex_timedlock(mutex:Papr_thread_mutex_t; timeout:Tapr_interval_time_t):Tapr_status_t;cdecl;external;
{*
 * Release the lock for the given mutex.
 * @param mutex the mutex from which to release the lock.
  }
function apr_thread_mutex_unlock(mutex:Papr_thread_mutex_t):Tapr_status_t;cdecl;external;
{*
 * Destroy the mutex and free the memory associated with the lock.
 * @param mutex the mutex to destroy.
  }
function apr_thread_mutex_destroy(mutex:Papr_thread_mutex_t):Tapr_status_t;cdecl;external;
{*
 * Get the pool used by this thread_mutex.
 * @return apr_pool_t the pool
  }
  var
    thread_mutex : TAPR_POOL_DECLARE_ACCESSOR;cvar;public;
{$endif}
{ APR_HAS_THREADS  }
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_THREAD_MUTEX_H  }

implementation


end.
