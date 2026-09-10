unit apr_thread_cond;

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
{$ifndef APR_THREAD_COND_H}
{$define APR_THREAD_COND_H}
{*
 * @file apr_thread_cond.h
 * @brief APR Condition Variable Routines
  }
{$include "apr.h"}
{$include "apr_pools.h"}
{$include "apr_errno.h"}
{$include "apr_time.h"}
{$include "apr_thread_mutex.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{$if APR_HAS_THREADS || defined(DOXYGEN)}
{*
 * @defgroup apr_thread_cond Condition Variable Routines
 * @ingroup APR 
 * @
  }
{* Opaque structure for thread condition variables  }
type
{*
 * Note: destroying a condition variable (or likewise, destroying or
 * clearing the pool from which a condition variable was allocated) if
 * any threads are blocked waiting on it gives undefined results.
  }
{*
 * Create and initialize a condition variable that can be used to signal
 * and schedule threads in a single process.
 * @param cond the memory address where the newly created condition variable
 *        will be stored.
 * @param pool the pool from which to allocate the condition.
  }

function apr_thread_cond_create(cond:PPapr_thread_cond_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external libapr;
{*
 * Put the active calling thread to sleep until signaled to wake up. Each
 * condition variable must be associated with a mutex, and that mutex must
 * be locked before  calling this function, or the behavior will be
 * undefined. As the calling thread is put to sleep, the given mutex
 * will be simultaneously released; and as this thread wakes up the lock
 * is again simultaneously acquired.
 * @param cond the condition variable on which to block.
 * @param mutex the mutex that must be locked upon entering this function,
 *        is released while the thread is asleep, and is again acquired before
 *        returning from this function.
 * @remark Spurious wakeups may occur. Before and after every call to wait on
 * a condition variable, the caller should test whether the condition is already
 * met.
  }
function apr_thread_cond_wait(cond:Papr_thread_cond_t; mutex:Papr_thread_mutex_t):Tapr_status_t;cdecl;external libapr;
{*
 * Put the active calling thread to sleep until signaled to wake up or
 * the timeout is reached. Each condition variable must be associated
 * with a mutex, and that mutex must be locked before calling this
 * function, or the behavior will be undefined. As the calling thread
 * is put to sleep, the given mutex will be simultaneously released;
 * and as this thread wakes up the lock is again simultaneously acquired.
 * @param cond the condition variable on which to block.
 * @param mutex the mutex that must be locked upon entering this function,
 *        is released while the thread is asleep, and is again acquired before
 *        returning from this function.
 * @param timeout The amount of time in microseconds to wait. This is 
 *        a maximum, not a minimum. If the condition is signaled, we 
 *        will wake up before this time, otherwise the error APR_TIMEUP
 *        is returned.
  }
function apr_thread_cond_timedwait(cond:Papr_thread_cond_t; mutex:Papr_thread_mutex_t; timeout:Tapr_interval_time_t):Tapr_status_t;cdecl;external libapr;
{*
 * Signals a single thread, if one exists, that is blocking on the given
 * condition variable. That thread is then scheduled to wake up and acquire
 * the associated mutex. Although it is not required, if predictable scheduling
 * is desired, that mutex must be locked while calling this function.
 * @param cond the condition variable on which to produce the signal.
 * @remark If no threads are waiting on the condition variable, nothing happens.
  }
function apr_thread_cond_signal(cond:Papr_thread_cond_t):Tapr_status_t;cdecl;external libapr;
{*
 * Signals all threads blocking on the given condition variable.
 * Each thread that was signaled is then scheduled to wake up and acquire
 * the associated mutex. This will happen in a serialized manner.
 * @param cond the condition variable on which to produce the broadcast.
 * @remark If no threads are waiting on the condition variable, nothing happens.
  }
function apr_thread_cond_broadcast(cond:Papr_thread_cond_t):Tapr_status_t;cdecl;external libapr;
{*
 * Destroy the condition variable and free the associated memory.
 * @param cond the condition variable to destroy.
  }
function apr_thread_cond_destroy(cond:Papr_thread_cond_t):Tapr_status_t;cdecl;external libapr;
{*
 * Get the pool used by this thread_cond.
 * @return apr_pool_t the pool
  }
  var
    thread_cond : TAPR_POOL_DECLARE_ACCESSOR;cvar;public;
{$endif}
{ APR_HAS_THREADS  }
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_THREAD_COND_H  }

// === Konventiert am: 10-9-26 16:58:44 ===


implementation



end.
