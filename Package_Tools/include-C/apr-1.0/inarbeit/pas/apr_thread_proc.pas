unit apr_thread_proc;

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
{$ifndef APR_THREAD_PROC_H}
{$define APR_THREAD_PROC_H}
{*
 * @file apr_thread_proc.h
 * @brief APR Thread and Process Library
  }
{$include "apr.h"}
{$include "apr_file_io.h"}
{$include "apr_pools.h"}
{$include "apr_errno.h"}
{$include "apr_perms_set.h"}
{$if APR_HAVE_STRUCT_RLIMIT}
{$include <sys/time.h>}
{$include <sys/resource.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_thread_proc Threads and Process Functions
 * @ingroup APR 
 * @
  }
{*< use the shell to invoke the program  }
{*< invoke the program directly, no copied env  }
{*< invoke the program, replicating our environment  }
{*< find program on PATH, use our environment  }
{*< use the shell to invoke the program,
                             *   replicating our environment
                              }
type
  Papr_cmdtype_e = ^Tapr_cmdtype_e;
  Tapr_cmdtype_e =  Longint;
  Const
    APR_SHELLCMD = 0;
    APR_PROGRAM = 1;
    APR_PROGRAM_ENV = 2;
    APR_PROGRAM_PATH = 3;
    APR_SHELLCMD_ENV = 4;
;
{*< wait for the specified process to finish  }
{*< do not wait -- just see if it has finished  }
type
  Papr_wait_how_e = ^Tapr_wait_how_e;
  Tapr_wait_how_e =  Longint;
  Const
    APR_WAIT = 0;
    APR_NOWAIT = 1;
;
{ I am specifically calling out the values so that the macros below make
 * more sense.  Yes, I know I don't need to, but I am hoping this makes what
 * I am doing more clear.  If you want to add more reasons to exit, continue
 * to use bitmasks.
  }
{*< process exited normally  }
{*< process exited due to a signal  }
{*< process exited and dumped a core file  }
type
  Papr_exit_why_e = ^Tapr_exit_why_e;
  Tapr_exit_why_e =  Longint;
  Const
    APR_PROC_EXIT = 1;
    APR_PROC_SIGNAL = 2;
    APR_PROC_SIGNAL_CORE = 4;
;
{* did we exit the process  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function APR_PROC_CHECK_EXIT(x : longint) : longint;

{* did we get a signal  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function APR_PROC_CHECK_SIGNALED(x : longint) : longint;

{* did we get core  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function APR_PROC_CHECK_CORE_DUMP(x : longint) : longint;

{* @see apr_procattr_io_set  }
const
  APR_NO_PIPE = 0;  
{* @see apr_procattr_io_set and apr_file_pipe_create_ex  }
  APR_FULL_BLOCK = 1;  
{* @see apr_procattr_io_set and apr_file_pipe_create_ex  }
  APR_FULL_NONBLOCK = 2;  
{* @see apr_procattr_io_set  }
  APR_PARENT_BLOCK = 3;  
{* @see apr_procattr_io_set  }
  APR_CHILD_BLOCK = 4;  
{* @see apr_procattr_io_set  }
  APR_NO_FILE = 8;  
{* @see apr_file_pipe_create_ex  }
  APR_READ_BLOCK = 3;  
{* @see apr_file_pipe_create_ex  }
  APR_WRITE_BLOCK = 4;  
{* @see apr_procattr_io_set 
 * @note Win32 only effective with version 1.2.12, portably introduced in 1.3.0
  }
  APR_NO_FILE = 8;  
{* @see apr_procattr_limit_set  }
  APR_LIMIT_CPU = 0;  
{* @see apr_procattr_limit_set  }
  APR_LIMIT_MEM = 1;  
{* @see apr_procattr_limit_set  }
  APR_LIMIT_NPROC = 2;  
{* @see apr_procattr_limit_set  }
  APR_LIMIT_NOFILE = 3;  
{*
 * @defgroup APR_OC Other Child Flags
 * @
  }
{*< child has died, caller must call
                                           * unregister still  }
  APR_OC_REASON_DEATH = 0;  
{*< write_fd is unwritable  }
  APR_OC_REASON_UNWRITABLE = 1;  
{*< a restart is occurring, perform
                                           * any necessary cleanup (including
                                           * sending a special signal to child)
                                            }
  APR_OC_REASON_RESTART = 2;  
{*< unregister has been called, do
                                           * whatever is necessary (including
                                           * kill the child)  }
  APR_OC_REASON_UNREGISTER = 3;  
{*< somehow the child exited without
                                           * us knowing ... buggy os?  }
  APR_OC_REASON_LOST = 4;  
{*< a health check is occurring, 
                                           * for most maintainence functions
                                           * this is a no-op.
                                            }
  APR_OC_REASON_RUNNING = 5;  
{* @  }
{* The APR process type  }
type
  Papr_proc_t = ^Tapr_proc_t;
  Tapr_proc_t = record
      xxxxxxxx : longint;
    end;
{*
 * The prototype for APR child errfn functions.  (See the description
 * of apr_procattr_child_errfn_set() for more information.)
 * It is passed the following parameters:
 * @param pool Pool associated with the apr_proc_t.  If your child
 *             error function needs user data, associate it with this
 *             pool.
 * @param err APR error code describing the error
 * @param description Text description of type of processing which failed
  }

  Tapr_child_errfn_t = procedure (proc:Papr_pool_t; err:Tapr_status_t; description:Pchar);cdecl;
{* Opaque Thread structure.  }
{* Opaque Thread attributes structure.  }
{* Opaque Process attributes structure.  }
{* Opaque control variable for one-time atomic variables.   }
{* Opaque thread private address space.  }
{* Opaque record of child process.  }
{*
 * The prototype for any APR thread worker functions.
  }

  Papr_thread_start_t = ^Tapr_thread_start_t;
  Tapr_thread_start_t = function (para1:Papr_thread_t; para2:pointer):pointer;cdecl;
{*< process is never killed (i.e., never sent
                                 * any signals), but it will be reaped if it exits
                                 * before the pool is cleaned up  }
{*< process is sent SIGKILL on apr_pool_t cleanup  }
{*< SIGTERM, wait 3 seconds, SIGKILL  }
{*< wait forever for the process to complete  }
{*< send SIGTERM and then wait  }

  Papr_kill_conditions_e = ^Tapr_kill_conditions_e;
  Tapr_kill_conditions_e =  Longint;
  Const
    APR_KILL_NEVER = 0;
    APR_KILL_ALWAYS = 1;
    APR_KILL_AFTER_TIMEOUT = 2;
    APR_JUST_WAIT = 3;
    APR_KILL_ONLY_ONCE = 4;
;
{ Thread Function definitions  }
{$if APR_HAS_THREADS}
{*
 * Create and initialize a new threadattr variable
 * @param new_attr The newly created threadattr.
 * @param cont The pool to use
  }

function apr_threadattr_create(new_attr:PPapr_threadattr_t; cont:Papr_pool_t):Tapr_status_t;cdecl;external libapr;
{*
 * Set if newly created threads should be created in detached state.
 * @param attr The threadattr to affect 
 * @param on Non-zero if detached threads should be created.
  }
function apr_threadattr_detach_set(attr:Papr_threadattr_t; on:Tapr_int32_t):Tapr_status_t;cdecl;external libapr;
{*
 * Get the detach state for this threadattr.
 * @param attr The threadattr to reference
 * @return APR_DETACH if threads are to be detached, or APR_NOTDETACH
 * if threads are to be joinable. 
  }
function apr_threadattr_detach_get(attr:Papr_threadattr_t):Tapr_status_t;cdecl;external libapr;
{*
 * Set the stack size of newly created threads.
 * @param attr The threadattr to affect 
 * @param stacksize The stack size in bytes
  }
function apr_threadattr_stacksize_set(attr:Papr_threadattr_t; stacksize:Tapr_size_t):Tapr_status_t;cdecl;external libapr;
{*
 * Set the stack guard area size of newly created threads.
 * @param attr The threadattr to affect 
 * @param guardsize The stack guard area size in bytes
 * @note Thread library implementations commonly use a "guard area"
 * after each thread's stack which is not readable or writable such that
 * stack overflows cause a segfault; this consumes e.g. 4K of memory
 * and increases memory management overhead.  Setting the guard area
 * size to zero hence trades off reliable behaviour on stack overflow
 * for performance.  }
function apr_threadattr_guardsize_set(attr:Papr_threadattr_t; guardsize:Tapr_size_t):Tapr_status_t;cdecl;external libapr;
{*
 * Create a new thread of execution
 * @param new_thread The newly created thread handle.
 * @param attr The threadattr to use to determine how to create the thread
 * @param func The function to start the new thread in
 * @param data Any data to be passed to the starting function
 * @param cont The pool to use
  }
function apr_thread_create(new_thread:PPapr_thread_t; attr:Papr_threadattr_t; func:Tapr_thread_start_t; data:pointer; cont:Papr_pool_t):Tapr_status_t;cdecl;external libapr;
{*
 * stop the current thread
 * @param thd The thread to stop
 * @param retval The return value to pass back to any thread that cares
  }
function apr_thread_exit(thd:Papr_thread_t; retval:Tapr_status_t):Tapr_status_t;cdecl;external libapr;
{*
 * block until the desired thread stops executing.
 * @param retval The return value from the dead thread.
 * @param thd The thread to join
  }
function apr_thread_join(retval:Papr_status_t; thd:Papr_thread_t):Tapr_status_t;cdecl;external libapr;
{*
 * force the current thread to yield the processor
  }
procedure apr_thread_yield;cdecl;external libapr;
{*
 * Initialize the control variable for apr_thread_once.  If this isn't
 * called, apr_initialize won't work.
 * @param control The control variable to initialize
 * @param p The pool to allocate data from.
  }
function apr_thread_once_init(control:PPapr_thread_once_t; p:Papr_pool_t):Tapr_status_t;cdecl;external libapr;
{*
 * Run the specified function one time, regardless of how many threads
 * call it.
 * @param control The control variable.  The same variable should
 *                be passed in each time the function is tried to be
 *                called.  This is how the underlying functions determine
 *                if the function has ever been called before.
 * @param func The function to call.
  }
function apr_thread_once(control:Papr_thread_once_t; func:procedure ):Tapr_status_t;cdecl;external libapr;
{*
 * detach a thread
 * @param thd The thread to detach 
  }
function apr_thread_detach(thd:Papr_thread_t):Tapr_status_t;cdecl;external libapr;
{*
 * Return user data associated with the current thread.
 * @param data The user data associated with the thread.
 * @param key The key to associate with the data
 * @param thread The currently open thread.
  }
function apr_thread_data_get(data:Ppointer; key:Pchar; thread:Papr_thread_t):Tapr_status_t;cdecl;external libapr;
{*
 * Set user data associated with the current thread.
 * @param data The user data to associate with the thread.
 * @param key The key to use for associating the data with the thread
 * @param cleanup The cleanup routine to use when the thread is destroyed.
 * @param thread The currently open thread.
  }
function apr_thread_data_set(data:pointer; key:Pchar; cleanup:function (para1:pointer):Tapr_status_t; thread:Papr_thread_t):Tapr_status_t;cdecl;external libapr;
{*
 * Create and initialize a new thread private address space
 * @param key The thread private handle.
 * @param dest The destructor to use when freeing the private memory.
 * @param cont The pool to use
  }
function apr_threadkey_private_create(key:PPapr_threadkey_t; dest:procedure (para1:pointer); cont:Papr_pool_t):Tapr_status_t;cdecl;external libapr;
{*
 * Get a pointer to the thread private memory
 * @param new_mem The data stored in private memory 
 * @param key The handle for the desired thread private memory 
  }
function apr_threadkey_private_get(new_mem:Ppointer; key:Papr_threadkey_t):Tapr_status_t;cdecl;external libapr;
{*
 * Set the data to be stored in thread private memory
 * @param priv The data to be stored in private memory 
 * @param key The handle for the desired thread private memory 
  }
function apr_threadkey_private_set(priv:pointer; key:Papr_threadkey_t):Tapr_status_t;cdecl;external libapr;
{*
 * Free the thread private memory
 * @param key The handle for the desired thread private memory 
  }
function apr_threadkey_private_delete(key:Papr_threadkey_t):Tapr_status_t;cdecl;external libapr;
{*
 * Return the pool associated with the current threadkey.
 * @param data The user data associated with the threadkey.
 * @param key The key associated with the data
 * @param threadkey The currently open threadkey.
  }
function apr_threadkey_data_get(data:Ppointer; key:Pchar; threadkey:Papr_threadkey_t):Tapr_status_t;cdecl;external libapr;
{*
 * Return the pool associated with the current threadkey.
 * @param data The data to set.
 * @param key The key to associate with the data.
 * @param cleanup The cleanup routine to use when the file is destroyed.
 * @param threadkey The currently open threadkey.
  }
function apr_threadkey_data_set(data:pointer; key:Pchar; cleanup:function (para1:pointer):Tapr_status_t; threadkey:Papr_threadkey_t):Tapr_status_t;cdecl;external libapr;
{$endif}
{*
 * Create and initialize a new procattr variable
 * @param new_attr The newly created procattr. 
 * @param cont The pool to use
  }

function apr_procattr_create(new_attr:PPapr_procattr_t; cont:Papr_pool_t):Tapr_status_t;cdecl;external libapr;
{*
 * Determine if any of stdin, stdout, or stderr should be linked to pipes 
 * when starting a child process.
 * @param attr The procattr we care about. 
 * @param in Should stdin be a pipe back to the parent?
 * @param out Should stdout be a pipe back to the parent?
 * @param err Should stderr be a pipe back to the parent?
 * @note If APR_NO_PIPE, there will be no special channel, the child
 * inherits the parent's corresponding stdio stream.  If APR_NO_FILE is 
 * specified, that corresponding stream is closed in the child (and will
 * be INVALID_HANDLE_VALUE when inspected on Win32). This can have ugly 
 * side effects, as the next file opened in the child on Unix will fall
 * into the stdio stream fd slot!
  }
function apr_procattr_io_set(attr:Papr_procattr_t; in:Tapr_int32_t; out:Tapr_int32_t; err:Tapr_int32_t):Tapr_status_t;cdecl;external libapr;
{*
 * Set the child_in and/or parent_in values to existing apr_file_t values.
 * @param attr The procattr we care about. 
 * @param child_in apr_file_t value to use as child_in. Must be a valid file.
 * @param parent_in apr_file_t value to use as parent_in. Must be a valid file.
 * @remark  This is NOT a required initializer function. This is
 *          useful if you have already opened a pipe (or multiple files)
 *          that you wish to use, perhaps persistently across multiple
 *          process invocations - such as a log file. You can save some 
 *          extra function calls by not creating your own pipe since this
 *          creates one in the process space for you.
 * @bug Note that calling this function with two NULL files on some platforms
 * creates an APR_FULL_BLOCK pipe, but this behavior is neither portable nor
 * is it supported.  @see apr_procattr_io_set instead for simple pipes.
  }
function apr_procattr_child_in_set(attr:Papr_procattr_t; child_in:Papr_file_t; parent_in:Papr_file_t):Tapr_status_t;cdecl;external libapr;
{*
 * Set the child_out and parent_out values to existing apr_file_t values.
 * @param attr The procattr we care about. 
 * @param child_out apr_file_t value to use as child_out. Must be a valid file.
 * @param parent_out apr_file_t value to use as parent_out. Must be a valid file.
 * @remark This is NOT a required initializer function. This is
 *         useful if you have already opened a pipe (or multiple files)
 *         that you wish to use, perhaps persistently across multiple
 *         process invocations - such as a log file. 
 * @bug Note that calling this function with two NULL files on some platforms
 * creates an APR_FULL_BLOCK pipe, but this behavior is neither portable nor
 * is it supported.  @see apr_procattr_io_set instead for simple pipes.
  }
function apr_procattr_child_out_set(attr:Papr_procattr_t; child_out:Papr_file_t; parent_out:Papr_file_t):Tapr_status_t;cdecl;external libapr;
{*
 * Set the child_err and parent_err values to existing apr_file_t values.
 * @param attr The procattr we care about. 
 * @param child_err apr_file_t value to use as child_err. Must be a valid file.
 * @param parent_err apr_file_t value to use as parent_err. Must be a valid file.
 * @remark This is NOT a required initializer function. This is
 *         useful if you have already opened a pipe (or multiple files)
 *         that you wish to use, perhaps persistently across multiple
 *         process invocations - such as a log file. 
 * @bug Note that calling this function with two NULL files on some platforms
 * creates an APR_FULL_BLOCK pipe, but this behavior is neither portable nor
 * is it supported.  @see apr_procattr_io_set instead for simple pipes.
  }
function apr_procattr_child_err_set(attr:Papr_procattr_t; child_err:Papr_file_t; parent_err:Papr_file_t):Tapr_status_t;cdecl;external libapr;
{*
 * Set which directory the child process should start executing in.
 * @param attr The procattr we care about. 
 * @param dir Which dir to start in.  By default, this is the same dir as
 *            the parent currently resides in, when the createprocess call
 *            is made. 
  }
function apr_procattr_dir_set(attr:Papr_procattr_t; dir:Pchar):Tapr_status_t;cdecl;external libapr;
{*
 * Set what type of command the child process will call.
 * @param attr The procattr we care about. 
 * @param cmd The type of command.  One of:
 * <PRE>
 *            APR_SHELLCMD     --  Anything that the shell can handle
 *            APR_PROGRAM      --  Executable program   (default) 
 *            APR_PROGRAM_ENV  --  Executable program, copy environment
 *            APR_PROGRAM_PATH --  Executable program on PATH, copy env
 * </PRE>
  }
function apr_procattr_cmdtype_set(attr:Papr_procattr_t; cmd:Tapr_cmdtype_e):Tapr_status_t;cdecl;external libapr;
{*
 * Determine if the child should start in detached state.
 * @param attr The procattr we care about. 
 * @param detach Should the child start in detached state?  Default is no. 
  }
function apr_procattr_detach_set(attr:Papr_procattr_t; detach:Tapr_int32_t):Tapr_status_t;cdecl;external libapr;
{$if APR_HAVE_STRUCT_RLIMIT}
{*
 * Set the Resource Utilization limits when starting a new process.
 * @param attr The procattr we care about. 
 * @param what Which limit to set, one of:
 * <PRE>
 *                 APR_LIMIT_CPU
 *                 APR_LIMIT_MEM
 *                 APR_LIMIT_NPROC
 *                 APR_LIMIT_NOFILE
 * </PRE>
 * @param limit Value to set the limit to.
  }

function apr_procattr_limit_set(attr:Papr_procattr_t; what:Tapr_int32_t; limit:Prlimit):Tapr_status_t;cdecl;external libapr;
{$endif}
{*
 * Specify an error function to be called in the child process if APR
 * encounters an error in the child prior to running the specified program.
 * @param attr The procattr describing the child process to be created.
 * @param errfn The function to call in the child process.
 * @remark At the present time, it will only be called from apr_proc_create()
 *         on platforms where fork() is used.  It will never be called on other
 *         platforms, on those platforms apr_proc_create() will return the error
 *         in the parent process rather than invoke the callback in the now-forked
 *         child process.
  }

function apr_procattr_child_errfn_set(attr:Papr_procattr_t; errfn:Papr_child_errfn_t):Tapr_status_t;cdecl;external libapr;
{*
 * Specify that apr_proc_create() should do whatever it can to report
 * failures to the caller of apr_proc_create(), rather than find out in
 * the child.
 * @param attr The procattr describing the child process to be created.
 * @param chk Flag to indicate whether or not extra work should be done
 *            to try to report failures to the caller.
 * @remark This flag only affects apr_proc_create() on platforms where
 *         fork() is used.  This leads to extra overhead in the calling
 *         process, but that may help the application handle such
 *         errors more gracefully.
  }
function apr_procattr_error_check_set(attr:Papr_procattr_t; chk:Tapr_int32_t):Tapr_status_t;cdecl;external libapr;
{*
 * Determine if the child should start in its own address space or using the 
 * current one from its parent
 * @param attr The procattr we care about. 
 * @param addrspace Should the child start in its own address space?  Default
 *                  is no on NetWare and yes on other platforms.
  }
function apr_procattr_addrspace_set(attr:Papr_procattr_t; addrspace:Tapr_int32_t):Tapr_status_t;cdecl;external libapr;
{*
 * Set the username used for running process
 * @param attr The procattr we care about. 
 * @param username The username used
 * @param password User password if needed. Password is needed on WIN32
 *                 or any other platform having
 *                 APR_PROCATTR_USER_SET_REQUIRES_PASSWORD set.
  }
function apr_procattr_user_set(attr:Papr_procattr_t; username:Pchar; password:Pchar):Tapr_status_t;cdecl;external libapr;
{*
 * Set the group used for running process
 * @param attr The procattr we care about. 
 * @param groupname The group name  used
  }
function apr_procattr_group_set(attr:Papr_procattr_t; groupname:Pchar):Tapr_status_t;cdecl;external libapr;
{*
 * Register permission set function
 * @param attr The procattr we care about. 
 * @param perms_set_fn Permission set callback
 * @param data Data to pass to permission callback function
 * @param perms Permissions to set
  }
function apr_procattr_perms_set_register(attr:Papr_procattr_t; perms_set_fn:Papr_perms_setfn_t; data:pointer; perms:Tapr_fileperms_t):Tapr_status_t;cdecl;external libapr;
{$if APR_HAS_FORK}
{*
 * This is currently the only non-portable call in APR.  This executes 
 * a standard unix fork.
 * @param proc The resulting process handle. 
 * @param cont The pool to use. 
 * @remark returns APR_INCHILD for the child, and APR_INPARENT for the parent
 * or an error.
  }

function apr_proc_fork(proc:Papr_proc_t; cont:Papr_pool_t):Tapr_status_t;cdecl;external libapr;
{$endif}
{*
 * Create a new process and execute a new program within that process.
 * @param new_proc The resulting process handle.
 * @param progname The program to run 
 * @param args the arguments to pass to the new program.  The first 
 *             one should be the program name.
 * @param env The new environment table for the new process.  This 
 *            should be a list of NULL-terminated strings. This argument
 *            is ignored for APR_PROGRAM_ENV, APR_PROGRAM_PATH, and
 *            APR_SHELLCMD_ENV types of commands.
 * @param attr the procattr we should use to determine how to create the new
 *         process
 * @param pool The pool to use.
 * @note This function returns without waiting for the new process to terminate;
 * use apr_proc_wait for that.
  }

function apr_proc_create(new_proc:Papr_proc_t; progname:Pchar; args:PPchar; env:PPchar; attr:Papr_procattr_t; 
           pool:Papr_pool_t):Tapr_status_t;cdecl;external libapr;
{*
 * Wait for a child process to die
 * @param proc The process handle that corresponds to the desired child process 
 * @param exitcode The returned exit status of the child, if a child process 
 *                 dies, or the signal that caused the child to die.
 *                 On platforms that don't support obtaining this information, 
 *                 the status parameter will be returned as APR_ENOTIMPL.
 * @param exitwhy Why the child died, the bitwise or of:
 * <PRE>
 *            APR_PROC_EXIT         -- process terminated normally
 *            APR_PROC_SIGNAL       -- process was killed by a signal
 *            APR_PROC_SIGNAL_CORE  -- process was killed by a signal, and
 *                                     generated a core dump.
 * </PRE>
 * @param waithow How should we wait.  One of:
 * <PRE>
 *            APR_WAIT   -- block until the child process dies.
 *            APR_NOWAIT -- return immediately regardless of if the 
 *                          child is dead or not.
 * </PRE>
 * @remark The child's status is in the return code to this process.  It is one of:
 * <PRE>
 *            APR_CHILD_DONE     -- child is no longer running.
 *            APR_CHILD_NOTDONE  -- child is still running.
 * </PRE>
  }
function apr_proc_wait(proc:Papr_proc_t; exitcode:Plongint; exitwhy:Papr_exit_why_e; waithow:Tapr_wait_how_e):Tapr_status_t;cdecl;external libapr;
{*
 * Wait for any current child process to die and return information 
 * about that child.
 * @param proc Pointer to NULL on entry, will be filled out with child's 
 *             information 
 * @param exitcode The returned exit status of the child, if a child process 
 *                 dies, or the signal that caused the child to die.
 *                 On platforms that don't support obtaining this information, 
 *                 the status parameter will be returned as APR_ENOTIMPL.
 * @param exitwhy Why the child died, the bitwise or of:
 * <PRE>
 *            APR_PROC_EXIT         -- process terminated normally
 *            APR_PROC_SIGNAL       -- process was killed by a signal
 *            APR_PROC_SIGNAL_CORE  -- process was killed by a signal, and
 *                                     generated a core dump.
 * </PRE>
 * @param waithow How should we wait.  One of:
 * <PRE>
 *            APR_WAIT   -- block until the child process dies.
 *            APR_NOWAIT -- return immediately regardless of if the 
 *                          child is dead or not.
 * </PRE>
 * @param p Pool to allocate child information out of.
 * @bug Passing proc as a *proc rather than **proc was an odd choice
 * for some platforms... this should be revisited in 1.0
  }
function apr_proc_wait_all_procs(proc:Papr_proc_t; exitcode:Plongint; exitwhy:Papr_exit_why_e; waithow:Tapr_wait_how_e; p:Papr_pool_t):Tapr_status_t;cdecl;external libapr;
{*< Do not detach  }
const
  APR_PROC_DETACH_FOREGROUND = 0;  
{*< Detach  }
  APR_PROC_DETACH_DAEMONIZE = 1;  
{*
 * Detach the process from the controlling terminal.
 * @param daemonize set to non-zero if the process should daemonize
 *                  and become a background process, else it will
 *                  stay in the foreground.
  }

function apr_proc_detach(daemonize:longint):Tapr_status_t;cdecl;external libapr;
{*
 * Register an other_child -- a child associated to its registered 
 * maintence callback.  This callback is invoked when the process
 * dies, is disconnected or disappears.
 * @param proc The child process to register.
 * @param maintenance maintenance is a function that is invoked with a 
 *                    reason and the data pointer passed here.
 * @param data Opaque context data passed to the maintenance function.
 * @param write_fd An fd that is probed for writing.  If it is ever unwritable
 *                 then the maintenance is invoked with reason 
 *                 OC_REASON_UNWRITABLE.
 * @param p The pool to use for allocating memory.
 * @bug write_fd duplicates the proc->out stream, it's really redundant
 * and should be replaced in the APR 1.0 API with a bitflag of which
 * proc->in/out/err handles should be health checked.
 * @bug no platform currently tests the pipes health.
  }
procedure apr_proc_other_child_register(proc:Papr_proc_t; maintenance:procedure (reason:longint; para2:pointer; status:longint); data:pointer; write_fd:Papr_file_t; p:Papr_pool_t);cdecl;external libapr;
{*
 * Stop watching the specified other child.  
 * @param data The data to pass to the maintenance function.  This is
 *             used to find the process to unregister.
 * @warning Since this can be called by a maintenance function while we're
 *          scanning the other_children list, all scanners should protect 
 *          themself by loading ocr->next before calling any maintenance 
 *          function.
  }
procedure apr_proc_other_child_unregister(data:pointer);cdecl;external libapr;
{*
 * Notify the maintenance callback of a registered other child process
 * that application has detected an event, such as death.
 * @param proc The process to check
 * @param reason The reason code to pass to the maintenance function
 * @param status The status to pass to the maintenance function
 * @remark An example of code using this behavior;
 * <pre>
 * rv = apr_proc_wait_all_procs(&proc, &exitcode, &status, APR_WAIT, p);
 * if (APR_STATUS_IS_CHILD_DONE(rv)) 
 * \#if APR_HAS_OTHER_CHILD
 *     if (apr_proc_other_child_alert(&proc, APR_OC_REASON_DEATH, status)
 *             == APR_SUCCESS) 
 *         ;  (already handled)
 *     
 *     else
 * \#endif
 *         [... handling non-otherchild processes death ...]
 * </pre>
  }
function apr_proc_other_child_alert(proc:Papr_proc_t; reason:longint; status:longint):Tapr_status_t;cdecl;external libapr;
{*
 * Test one specific other child processes and invoke the maintenance callback 
 * with the appropriate reason code, if still running, or the appropriate reason 
 * code if the process is no longer healthy.
 * @param ocr The registered other child
 * @param reason The reason code (e.g. APR_OC_REASON_RESTART) if still running
  }
procedure apr_proc_other_child_refresh(ocr:Papr_other_child_rec_t; reason:longint);cdecl;external libapr;
{*
 * Test all registered other child processes and invoke the maintenance callback 
 * with the appropriate reason code, if still running, or the appropriate reason 
 * code if the process is no longer healthy.
 * @param reason The reason code (e.g. APR_OC_REASON_RESTART) to running processes
  }
procedure apr_proc_other_child_refresh_all(reason:longint);cdecl;external libapr;
{* 
 * Terminate a process.
 * @param proc The process to terminate.
 * @param sig How to kill the process.
  }
function apr_proc_kill(proc:Papr_proc_t; sig:longint):Tapr_status_t;cdecl;external libapr;
{*
 * Register a process to be killed when a pool dies.
 * @param a The pool to use to define the processes lifetime 
 * @param proc The process to register
 * @param how How to kill the process, one of:
 * <PRE>
 *         APR_KILL_NEVER         -- process is never sent any signals
 *         APR_KILL_ALWAYS        -- process is sent SIGKILL on apr_pool_t cleanup
 *         APR_KILL_AFTER_TIMEOUT -- SIGTERM, wait 3 seconds, SIGKILL
 *         APR_JUST_WAIT          -- wait forever for the process to complete
 *         APR_KILL_ONLY_ONCE     -- send SIGTERM and then wait
 * </PRE>
  }
procedure apr_pool_note_subprocess(a:Papr_pool_t; proc:Papr_proc_t; how:Tapr_kill_conditions_e);cdecl;external libapr;
{$if APR_HAS_THREADS }
{$if (APR_HAVE_SIGWAIT || APR_HAVE_SIGSUSPEND) && !defined(OS2)}
{*
 * Setup the process for a single thread to be used for all signal handling.
 * @warning This must be called before any threads are created
  }

function apr_setup_signal_thread:Tapr_status_t;cdecl;external libapr;
{*
 * Make the current thread listen for signals.  This thread will loop
 * forever, calling a provided function whenever it receives a signal.  That
 * functions should return 1 if the signal has been handled, 0 otherwise.
 * @param signal_handler The function to call when a signal is received
 * apr_status_t apr_signal_thread((int)(*signal_handler)(int signum))
 * @note Synchronous signals like SIGABRT/SIGSEGV/SIGBUS/... are ignored by
 * apr_signal_thread() and thus can't be waited by this function (they remain
 * handled by the operating system or its native signals interface).
 * @remark In APR version 1.6 and ealier, SIGUSR2 was part of these ignored
 * signals and thus was never passed in to the signal_handler. From APR 1.7
 * this is no more the case so SIGUSR2 can be handled in signal_handler and
 * acted upon like the other asynchronous signals.
  }
function apr_signal_thread(signal_handler:function (signum:longint):longint):Tapr_status_t;cdecl;external libapr;
{$endif}
{ (APR_HAVE_SIGWAIT || APR_HAVE_SIGSUSPEND) && !defined(OS2)  }
{*
 * Get the child-pool used by the thread from the thread info.
 * @return apr_pool_t the pool
  }
  var
    thread : TAPR_POOL_DECLARE_ACCESSOR;cvar;public;
{$endif}
{ APR_HAS_THREADS  }
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_THREAD_PROC_H  }

// === Konventiert am: 10-9-26 16:58:39 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function APR_PROC_CHECK_EXIT(x : longint) : longint;
begin
  APR_PROC_CHECK_EXIT:=x and APR_PROC_EXIT;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function APR_PROC_CHECK_SIGNALED(x : longint) : longint;
begin
  APR_PROC_CHECK_SIGNALED:=x and APR_PROC_SIGNAL;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function APR_PROC_CHECK_CORE_DUMP(x : longint) : longint;
begin
  APR_PROC_CHECK_CORE_DUMP:=x and APR_PROC_SIGNAL_CORE;
end;


end.
