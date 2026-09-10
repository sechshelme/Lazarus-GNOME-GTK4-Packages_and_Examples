
unit apr_portable;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_portable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_portable.h
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
Papr_dir_t  = ^apr_dir_t;
Papr_dso_handle_t  = ^apr_dso_handle_t;
Papr_file_t  = ^apr_file_t;
Papr_global_mutex_t  = ^apr_global_mutex_t;
Papr_lockmech_e  = ^apr_lockmech_e;
Papr_os_dir_t  = ^apr_os_dir_t;
Papr_os_dso_handle_t  = ^apr_os_dso_handle_t;
Papr_os_exp_time_t  = ^apr_os_exp_time_t;
Papr_os_file_t  = ^apr_os_file_t;
Papr_os_global_mutex_t  = ^apr_os_global_mutex_t;
Papr_os_imp_time_t  = ^apr_os_imp_time_t;
Papr_os_proc_mutex_t  = ^apr_os_proc_mutex_t;
Papr_os_proc_t  = ^apr_os_proc_t;
Papr_os_shm_t  = ^apr_os_shm_t;
Papr_os_sock_info_t  = ^apr_os_sock_info_t;
Papr_os_sock_t  = ^apr_os_sock_t;
Papr_os_thread_t  = ^apr_os_thread_t;
Papr_os_threadkey_t  = ^apr_os_threadkey_t;
Papr_pool_t  = ^apr_pool_t;
Papr_proc_mutex_t  = ^apr_proc_mutex_t;
Papr_shm_t  = ^apr_shm_t;
Papr_socket_t  = ^apr_socket_t;
Papr_thread_mutex_t  = ^apr_thread_mutex_t;
Papr_thread_t  = ^apr_thread_t;
Papr_threadkey_t  = ^apr_threadkey_t;
Papr_time_exp_t  = ^apr_time_exp_t;
Papr_time_t  = ^apr_time_t;
Pbyte  = ^byte;
Pchar  = ^char;
Ppthread_mutex_t  = ^pthread_mutex_t;
Psem_t  = ^sem_t;
Psockaddr  = ^sockaddr;
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
{ This header file is where you should put ANY platform specific information.
 * This should be the only header file that programs need to include that 
 * actually has platform dependent code which refers to the .
  }
{$ifndef APR_PORTABLE_H}
{$define APR_PORTABLE_H}
{*
 * @file apr_portable.h
 * @brief APR Portability Routines
  }
{$include "apr.h"}
{$include "apr_pools.h"}
{$include "apr_thread_proc.h"}
{$include "apr_file_io.h"}
{$include "apr_network_io.h"}
{$include "apr_errno.h"}
{$include "apr_global_mutex.h"}
{$include "apr_proc_mutex.h"}
{$include "apr_time.h"}
{$include "apr_dso.h"}
{$include "apr_shm.h"}
{$if APR_HAVE_DIRENT_H}
{$include <dirent.h>}
{$endif}
{$if APR_HAVE_FCNTL_H}
{$include <fcntl.h>}
{$endif}
{$if APR_HAVE_PTHREAD_H}
{$include <pthread.h>}
{$endif}
{$if APR_HAVE_SEMAPHORE_H}
{$include <semaphore.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_portabile Portability Routines
 * @ingroup APR 
 * @
  }
{$ifdef WIN32}
{ The primitives for Windows types  }
type
  Papr_os_file_t = ^Tapr_os_file_t;
  Tapr_os_file_t = THANDLE;

  Papr_os_dir_t = ^Tapr_os_dir_t;
  Tapr_os_dir_t = THANDLE;

  Papr_os_sock_t = ^Tapr_os_sock_t;
  Tapr_os_sock_t = TSOCKET;

  Papr_os_proc_mutex_t = ^Tapr_os_proc_mutex_t;
  Tapr_os_proc_mutex_t = THANDLE;

  Papr_os_thread_t = ^Tapr_os_thread_t;
  Tapr_os_thread_t = THANDLE;

  Papr_os_proc_t = ^Tapr_os_proc_t;
  Tapr_os_proc_t = THANDLE;

  Papr_os_threadkey_t = ^Tapr_os_threadkey_t;
  Tapr_os_threadkey_t = TDWORD;

  Papr_os_imp_time_t = ^Tapr_os_imp_time_t;
  Tapr_os_imp_time_t = TFILETIME;

  Papr_os_exp_time_t = ^Tapr_os_exp_time_t;
  Tapr_os_exp_time_t = TSYSTEMTIME;

  Papr_os_dso_handle_t = ^Tapr_os_dso_handle_t;
  Tapr_os_dso_handle_t = THANDLE;

  Papr_os_shm_t = ^Tapr_os_shm_t;
  Tapr_os_shm_t = THANDLE;
(*** was #elif ****){$else defined(OS2)}
type
  Papr_os_file_t = ^Tapr_os_file_t;
  Tapr_os_file_t = THFILE;

  Papr_os_dir_t = ^Tapr_os_dir_t;
  Tapr_os_dir_t = THDIR;

  Papr_os_sock_t = ^Tapr_os_sock_t;
  Tapr_os_sock_t = longint;

  Papr_os_proc_mutex_t = ^Tapr_os_proc_mutex_t;
  Tapr_os_proc_mutex_t = THMTX;

  Papr_os_thread_t = ^Tapr_os_thread_t;
  Tapr_os_thread_t = TTID;

  Papr_os_proc_t = ^Tapr_os_proc_t;
  Tapr_os_proc_t = TPID;

  Papr_os_threadkey_t = ^Tapr_os_threadkey_t;
  Tapr_os_threadkey_t = TPULONG;
  Ttimeval = Tapr_os_imp_time_t;
  Ttm = Tapr_os_exp_time_t;

  Papr_os_dso_handle_t = ^Tapr_os_dso_handle_t;
  Tapr_os_dso_handle_t = THMODULE;

  Papr_os_shm_t = ^Tapr_os_shm_t;
  Tapr_os_shm_t = pointer;
(*** was #elif ****){$else defined(__BEOS__)}
{$include <kernel/OS.h>}
{$include <kernel/image.h>}
type
  Papr_os_proc_mutex_t = ^Tapr_os_proc_mutex_t;
  Tapr_os_proc_mutex_t = record
      sem : Tsem_id;
      ben : longint;
    end;


  Papr_os_file_t = ^Tapr_os_file_t;
  Tapr_os_file_t = longint;

  Papr_os_dir_t = ^Tapr_os_dir_t;
  Tapr_os_dir_t = TDIR;

  Papr_os_sock_t = ^Tapr_os_sock_t;
  Tapr_os_sock_t = longint;

  Papr_os_thread_t = ^Tapr_os_thread_t;
  Tapr_os_thread_t = Tthread_id;

  Papr_os_proc_t = ^Tapr_os_proc_t;
  Tapr_os_proc_t = Tthread_id;

  Papr_os_threadkey_t = ^Tapr_os_threadkey_t;
  Tapr_os_threadkey_t = longint;
  Ttimeval = Tapr_os_imp_time_t;
  Ttm = Tapr_os_exp_time_t;

  Papr_os_dso_handle_t = ^Tapr_os_dso_handle_t;
  Tapr_os_dso_handle_t = Timage_id;

  Papr_os_shm_t = ^Tapr_os_shm_t;
  Tapr_os_shm_t = pointer;
(*** was #elif ****){$else defined(NETWARE)}
type
  Papr_os_file_t = ^Tapr_os_file_t;
  Tapr_os_file_t = longint;

  Papr_os_dir_t = ^Tapr_os_dir_t;
  Tapr_os_dir_t = TDIR;

  Papr_os_sock_t = ^Tapr_os_sock_t;
  Tapr_os_sock_t = longint;

  Papr_os_proc_mutex_t = ^Tapr_os_proc_mutex_t;
  Tapr_os_proc_mutex_t = TNXMutex_t;

  Papr_os_thread_t = ^Tapr_os_thread_t;
  Tapr_os_thread_t = TNXThreadId_t;

  Papr_os_proc_t = ^Tapr_os_proc_t;
  Tapr_os_proc_t = longint;

  Papr_os_threadkey_t = ^Tapr_os_threadkey_t;
  Tapr_os_threadkey_t = TNXKey_t;
  Ttimeval = Tapr_os_imp_time_t;
  Ttm = Tapr_os_exp_time_t;

  Papr_os_dso_handle_t = ^Tapr_os_dso_handle_t;
  Tapr_os_dso_handle_t = pointer;

  Papr_os_shm_t = ^Tapr_os_shm_t;
  Tapr_os_shm_t = pointer;
{$else}
{ Any other OS should go above this one.  This is the lowest common
 * denominator typedefs for  all UNIX-like systems.  :)
  }
{* Basic OS process mutex structure.  }
{$if APR_HAS_SYSVSEM_SERIALIZE || APR_HAS_FCNTL_SERIALIZE || APR_HAS_FLOCK_SERIALIZE}
{* Value used for SYS V Semaphore, FCNTL and FLOCK serialization  }
{$endif}
{$if APR_HAS_PROC_PTHREAD_SERIALIZE}
{* Value used for PTHREAD serialization  }
{$endif}
{$if APR_HAS_THREADS}
{ If no threads, no need for thread locks  }
{$if APR_USE_PTHREAD_SERIALIZE}
{* This value is currently unused within APR and Apache  }{$endif}
{$endif}
{$if APR_HAS_POSIXSEM_SERIALIZE}
{* Value used for POSIX semaphores serialization  }
{$endif}
type
  Papr_os_proc_mutex_t = ^Tapr_os_proc_mutex_t;
  Tapr_os_proc_mutex_t = record
      crossproc : longint;
      pthread_interproc : Ppthread_mutex_t;
      intraproc : Ppthread_mutex_t;
      psem_interproc : Psem_t;
    end;


  Papr_os_file_t = ^Tapr_os_file_t;
  Tapr_os_file_t = longint;
{*< native file  }

  Papr_os_dir_t = ^Tapr_os_dir_t;
  Tapr_os_dir_t = TDIR;
{*< native dir  }

  Papr_os_sock_t = ^Tapr_os_sock_t;
  Tapr_os_sock_t = longint;
{*< native dir  }
{*< native process
                                                          *   mutex
                                                           }
{$if APR_HAS_THREADS && APR_HAVE_PTHREAD_H }
type
  Papr_os_thread_t = ^Tapr_os_thread_t;
  Tapr_os_thread_t = Tpthread_t;
{*< native thread  }

  Papr_os_threadkey_t = ^Tapr_os_threadkey_t;
  Tapr_os_threadkey_t = Tpthread_key_t;
{*< native thread address
                                                     *   space  }
{$endif}
type
  Papr_os_proc_t = ^Tapr_os_proc_t;
  Tapr_os_proc_t = Tpid_t;
{*< native pid  }
  Ttimeval = Tapr_os_imp_time_t;
{*< native timeval  }
  Ttm = Tapr_os_exp_time_t;
{*< native tm  }
{* @var apr_os_dso_handle_t
 * native dso types
  }
{$if defined(HPUX) || defined(HPUX10) || defined(HPUX11)}
{$include <dl.h>}
type
  Papr_os_dso_handle_t = ^Tapr_os_dso_handle_t;
  Tapr_os_dso_handle_t = Tshl_t;
(*** was #elif ****){$else defined(DARWIN)}
{$include <mach-o/dyld.h>}
type
  Papr_os_dso_handle_t = ^Tapr_os_dso_handle_t;
  Tapr_os_dso_handle_t = TNSModule;
{$else}
type
  Papr_os_dso_handle_t = ^Tapr_os_dso_handle_t;
  Tapr_os_dso_handle_t = pointer;
{$endif}
type
  Papr_os_shm_t = ^Tapr_os_shm_t;
  Tapr_os_shm_t = pointer;
{*< native SHM  }
{$endif}
{*
 * @typedef apr_os_sock_info_t
 * @brief alias for local OS socket
  }
{*
 * everything APR needs to know about an active socket to construct
 * an APR socket from it; currently, this is platform-independent
  }
{*< always required  }
{*< NULL if not yet bound  }
{*< NULL if not connected  }
{*< always required (APR_INET, APR_INET6, etc.)  }
{*< always required (SOCK_STREAM, SOCK_DGRAM, etc.)  }
{*< 0 or actual protocol (APR_PROTO_SCTP, APR_PROTO_TCP, etc.)  }
type
  Papr_os_sock_info_t = ^Tapr_os_sock_info_t;
  Tapr_os_sock_info_t = record
      os_sock : Papr_os_sock_t;
      local : Psockaddr;
      remote : Psockaddr;
      family : longint;
      _type : longint;
      protocol : longint;
    end;

{$if APR_PROC_MUTEX_IS_GLOBAL || defined(DOXYGEN)}
{* Opaque global mutex type  }

const
  apr_os_global_mutex_t = apr_os_proc_mutex_t;  
{* @return apr_os_global_mutex  }
  apr_os_global_mutex_get = apr_os_proc_mutex_get;  
{$else}
{* Thread and process mutex for those platforms where process mutexes
     *  are not held in threads.
      }
{$if APR_HAS_THREADS}
{$endif}
{ APR_HAS_THREADS  }
type
  Papr_os_global_mutex_t = ^Tapr_os_global_mutex_t;
  Tapr_os_global_mutex_t = record
      pool : Papr_pool_t;
      proc_mutex : Papr_proc_mutex_t;
      thread_mutex : Papr_thread_mutex_t;
    end;


function apr_os_global_mutex_get(ospmutex:Papr_os_global_mutex_t; pmutex:Papr_global_mutex_t):Tapr_status_t;cdecl;external;
{$endif}
{*
 * convert the file from apr type to os specific type.
 * @param thefile The os specific file we are converting to
 * @param file The apr file to convert.
 * @remark On Unix, it is only possible to get a file descriptor from 
 *         an apr file type.
  }

function apr_os_file_get(thefile:Papr_os_file_t; file:Papr_file_t):Tapr_status_t;cdecl;external;
{*
 * convert the dir from apr type to os specific type.
 * @param thedir The os specific dir we are converting to
 * @param dir The apr dir to convert.
  }function apr_os_dir_get(thedir:PPapr_os_dir_t; dir:Papr_dir_t):Tapr_status_t;cdecl;external;
{*
 * Convert the socket from an apr type to an OS specific socket
 * @param thesock The socket to convert.
 * @param sock The os specific equivalent of the apr socket..
  }
function apr_os_sock_get(thesock:Papr_os_sock_t; sock:Papr_socket_t):Tapr_status_t;cdecl;external;
{*
 * Convert the proc mutex from apr type to os specific type
 * @param ospmutex The os specific proc mutex we are converting to.
 * @param pmutex The apr proc mutex to convert.
  }
function apr_os_proc_mutex_get(ospmutex:Papr_os_proc_mutex_t; pmutex:Papr_proc_mutex_t):Tapr_status_t;cdecl;external;
{*
 * Convert the proc mutex from apr type to os specific type, also
 * providing the mechanism used by the apr mutex.
 * @param ospmutex The os specific proc mutex we are converting to.
 * @param pmutex The apr proc mutex to convert.
 * @param mech The mechanism used by the apr proc mutex (if not NULL).
 * @remark Allows for disambiguation for platforms with multiple mechanisms
 *         available.
  }
function apr_os_proc_mutex_get_ex(ospmutex:Papr_os_proc_mutex_t; pmutex:Papr_proc_mutex_t; mech:Papr_lockmech_e):Tapr_status_t;cdecl;external;
{*
 * Get the exploded time in the platforms native format.
 * @param ostime the native time format
 * @param aprtime the time to convert
  }
function apr_os_exp_time_get(ostime:PPapr_os_exp_time_t; aprtime:Papr_time_exp_t):Tapr_status_t;cdecl;external;
{*
 * Get the imploded time in the platforms native format.
 * @param ostime  the native time format
 * @param aprtime the time to convert
  }
function apr_os_imp_time_get(ostime:PPapr_os_imp_time_t; aprtime:Papr_time_t):Tapr_status_t;cdecl;external;
{*
 * convert the shm from apr type to os specific type.
 * @param osshm The os specific shm representation
 * @param shm The apr shm to convert.
  }function apr_os_shm_get(osshm:Papr_os_shm_t; shm:Papr_shm_t):Tapr_status_t;cdecl;external;
{$if APR_HAS_THREADS || defined(DOXYGEN)}
{* 
 * @defgroup apr_os_thread Thread portability Routines
 * @ 
  }
{*
 * convert the thread to os specific type from apr type.
 * @param thethd The apr thread to convert
 * @param thd The os specific thread we are converting to
  }

function apr_os_thread_get(thethd:PPapr_os_thread_t; thd:Papr_thread_t):Tapr_status_t;cdecl;external;
{*
 * convert the thread private memory key to os specific type from an apr type.
 * @param thekey The apr handle we are converting from.
 * @param key The os specific handle we are converting to.
  }
function apr_os_threadkey_get(thekey:Papr_os_threadkey_t; key:Papr_threadkey_t):Tapr_status_t;cdecl;external;
{*
 * convert the thread from os specific type to apr type.
 * @param thd The apr thread we are converting to.
 * @param thethd The os specific thread to convert
 * @param cont The pool to use if it is needed.
  }
function apr_os_thread_put(thd:PPapr_thread_t; thethd:Papr_os_thread_t; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * convert the thread private memory key from os specific type to apr type.
 * @param key The apr handle we are converting to.
 * @param thekey The os specific handle to convert
 * @param cont The pool to use if it is needed.
  }
function apr_os_threadkey_put(key:PPapr_threadkey_t; thekey:Papr_os_threadkey_t; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Get the thread ID
  }
function apr_os_thread_current:Tapr_os_thread_t;cdecl;external;
{*
 * Compare two thread id's
 * @param tid1 1st Thread ID to compare
 * @param tid2 2nd Thread ID to compare
 * @return non-zero if the two threads are equal, zero otherwise
  }function apr_os_thread_equal(tid1:Tapr_os_thread_t; tid2:Tapr_os_thread_t):longint;cdecl;external;
{* @  }
{$endif}
{ APR_HAS_THREADS  }
{*
 * convert the file from os specific type to apr type.
 * @param file The apr file we are converting to.
 * @param thefile The os specific file to convert
 * @param flags The flags that were used to open this file.
 * @param cont The pool to use if it is needed.
 * @remark On Unix, it is only possible to put a file descriptor into
 *         an apr file type.
  }

function apr_os_file_put(file:PPapr_file_t; thefile:Papr_os_file_t; flags:Tapr_int32_t; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * convert the file from os specific type to apr type.
 * @param file The apr file we are converting to.
 * @param thefile The os specific pipe to convert
 * @param cont The pool to use if it is needed.
 * @remark On Unix, it is only possible to put a file descriptor into
 *         an apr file type.
  }
function apr_os_pipe_put(file:PPapr_file_t; thefile:Papr_os_file_t; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * convert the file from os specific type to apr type.
 * @param file The apr file we are converting to.
 * @param thefile The os specific pipe to convert
 * @param register_cleanup A cleanup will be registered on the apr_file_t
 *   to issue apr_file_close().
 * @param cont The pool to use if it is needed.
 * @remark On Unix, it is only possible to put a file descriptor into
 *         an apr file type.
  }
function apr_os_pipe_put_ex(file:PPapr_file_t; thefile:Papr_os_file_t; register_cleanup:longint; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * convert the dir from os specific type to apr type.
 * @param dir The apr dir we are converting to.
 * @param thedir The os specific dir to convert
 * @param cont The pool to use when creating to apr directory.
  }
function apr_os_dir_put(dir:PPapr_dir_t; thedir:Papr_os_dir_t; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Convert a socket from the os specific type to the APR type. If
 * sock points to NULL, a socket will be created from the pool
 * provided. If **sock does not point to NULL, the structure pointed
 * to by sock will be reused and updated with the given socket.
 * @param sock The pool to use.
 * @param thesock The socket to convert to.
 * @param cont The socket we are converting to an apr type.
 * @remark If it is a true socket, it is best to call apr_os_sock_make()
 *         and provide APR with more information about the socket.
  }
function apr_os_sock_put(sock:PPapr_socket_t; thesock:Papr_os_sock_t; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Create a socket from an existing descriptor and local and remote
 * socket addresses.
 * @param apr_sock The new socket that has been set up
 * @param os_sock_info The os representation of the socket handle and
 *        other characteristics of the socket
 * @param cont The pool to use
 * @remark If you only know the descriptor/handle or if it isn't really
 *         a true socket, use apr_os_sock_put() instead.
  }
function apr_os_sock_make(apr_sock:PPapr_socket_t; os_sock_info:Papr_os_sock_info_t; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Convert the proc mutex from os specific type to apr type
 * @param pmutex The apr proc mutex we are converting to.
 * @param ospmutex The os specific proc mutex to convert.
 * @param cont The pool to use if it is needed.
  }
function apr_os_proc_mutex_put(pmutex:PPapr_proc_mutex_t; ospmutex:Papr_os_proc_mutex_t; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Convert the proc mutex from os specific type to apr type, using the
 * specified mechanism.
 * @param pmutex The apr proc mutex we are converting to.
 * @param ospmutex The os specific proc mutex to convert.
 * @param mech The apr mutex locking mechanism
 * @param register_cleanup Whether to destroy the os mutex with the apr
 *        one (either on explicit destroy or pool cleanup).
 * @param cont The pool to use if it is needed.
 * @remark Allows for disambiguation for platforms with multiple mechanisms
 *         available.
  }
function apr_os_proc_mutex_put_ex(pmutex:PPapr_proc_mutex_t; ospmutex:Papr_os_proc_mutex_t; mech:Tapr_lockmech_e; register_cleanup:longint; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Put the imploded time in the APR format.
 * @param aprtime the APR time format
 * @param ostime the time to convert
 * @param cont the pool to use if necessary
  }
function apr_os_imp_time_put(aprtime:Papr_time_t; ostime:PPapr_os_imp_time_t; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Put the exploded time in the APR format.
 * @param aprtime the APR time format
 * @param ostime the time to convert
 * @param cont the pool to use if necessary
  }
function apr_os_exp_time_put(aprtime:Papr_time_exp_t; ostime:PPapr_os_exp_time_t; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * convert the shared memory from os specific type to apr type.
 * @param shm The apr shm representation of osshm
 * @param osshm The os specific shm identity
 * @param cont The pool to use if it is needed.
 * @remark On fork()ed architectures, this is typically nothing more than
 * the memory block mapped.  On non-fork architectures, this is typically
 * some internal handle to pass the mapping from process to process.
  }
function apr_os_shm_put(shm:PPapr_shm_t; osshm:Papr_os_shm_t; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{$if APR_HAS_DSO || defined(DOXYGEN)}
{* 
 * @defgroup apr_os_dso DSO (Dynamic Loading) Portability Routines
 * @
  }
{*
 * convert the dso handle from os specific to apr
 * @param dso The apr handle we are converting to
 * @param thedso the os specific handle to convert
 * @param pool the pool to use if it is needed
  }

function apr_os_dso_handle_put(dso:PPapr_dso_handle_t; thedso:Tapr_os_dso_handle_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * convert the apr dso handle into an os specific one
 * @param aprdso The apr dso handle to convert
 * @param dso The os specific dso to return
  }
function apr_os_dso_handle_get(dso:Papr_os_dso_handle_t; aprdso:Papr_dso_handle_t):Tapr_status_t;cdecl;external;
{* @  }
{$endif}
{ APR_HAS_DSO  }
{$if APR_HAS_OS_UUID}
{*
 * Private: apr-util's apr_uuid module when supported by the platform
  }

function apr_os_uuid_get(uuid_data:Pbyte):Tapr_status_t;cdecl;external;
{$endif}
{*
 * Get the name of the system default character set.
 * @param pool the pool to allocate the name from, if needed
  }
(* Const before type ignored *)

function apr_os_default_encoding(pool:Papr_pool_t):Pchar;cdecl;external;
{*
 * Get the name of the current locale character set.
 * @param pool the pool to allocate the name from, if needed
 * @remark Defers to apr_os_default_encoding() if the current locale's
 * data can't be retrieved on this system.
  }
(* Const before type ignored *)
function apr_os_locale_encoding(pool:Papr_pool_t):Pchar;cdecl;external;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_PORTABLE_H  }

implementation


end.
