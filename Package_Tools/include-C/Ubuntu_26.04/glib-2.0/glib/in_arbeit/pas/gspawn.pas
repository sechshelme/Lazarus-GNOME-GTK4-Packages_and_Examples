unit gspawn;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gspawn.h - Process launching
 *
 *  Copyright 2000 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_SPAWN_H__}
{$define __G_SPAWN_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gerror.h>}
{ I'm not sure I remember our proposed naming convention here.  }
{*
 * G_SPAWN_ERROR:
 *
 * Error domain for spawning processes. Errors in this domain will
 * be from the #GSpawnError enumeration. See #GError for information on
 * error domains.
  }

{ was #define dname def_expr }
function G_SPAWN_ERROR : longint; { return type might be wrong }

{*
 * GSpawnError:
 * @G_SPAWN_ERROR_FORK: Fork failed due to lack of memory.
 * @G_SPAWN_ERROR_READ: Read or select on pipes failed.
 * @G_SPAWN_ERROR_CHDIR: Changing to working directory failed.
 * @G_SPAWN_ERROR_ACCES: execv() returned `EACCES`
 * @G_SPAWN_ERROR_PERM: execv() returned `EPERM`
 * @G_SPAWN_ERROR_TOO_BIG: execv() returned `E2BIG`
 * @G_SPAWN_ERROR_2BIG: deprecated alias for %G_SPAWN_ERROR_TOO_BIG (deprecated since GLib 2.32)
 * @G_SPAWN_ERROR_NOEXEC: execv() returned `ENOEXEC`
 * @G_SPAWN_ERROR_NAMETOOLONG: execv() returned `ENAMETOOLONG`
 * @G_SPAWN_ERROR_NOENT: execv() returned `ENOENT`
 * @G_SPAWN_ERROR_NOMEM: execv() returned `ENOMEM`
 * @G_SPAWN_ERROR_NOTDIR: execv() returned `ENOTDIR`
 * @G_SPAWN_ERROR_LOOP: execv() returned `ELOOP`
 * @G_SPAWN_ERROR_TXTBUSY: execv() returned `ETXTBUSY`
 * @G_SPAWN_ERROR_IO: execv() returned `EIO`
 * @G_SPAWN_ERROR_NFILE: execv() returned `ENFILE`
 * @G_SPAWN_ERROR_MFILE: execv() returned `EMFILE`
 * @G_SPAWN_ERROR_INVAL: execv() returned `EINVAL`
 * @G_SPAWN_ERROR_ISDIR: execv() returned `EISDIR`
 * @G_SPAWN_ERROR_LIBBAD: execv() returned `ELIBBAD`
 * @G_SPAWN_ERROR_FAILED: Some other fatal failure,
 *   `error->message` should explain.
 *
 * Error codes returned by spawning processes.
  }
{ fork failed due to lack of memory  }
{ read or select on pipes failed  }
{ changing to working dir failed  }
{ execv() returned EACCES  }
{ execv() returned EPERM  }
{ execv() returned E2BIG  }
{ execv() returned ENOEXEC  }
{ ""  "" ENAMETOOLONG  }
{ ""  "" ENOENT  }
{ ""  "" ENOMEM  }
{ ""  "" ENOTDIR  }
{ ""  "" ELOOP    }
{ ""  "" ETXTBUSY  }
{ ""  "" EIO  }
{ ""  "" ENFILE  }
{ ""  "" EMFLE  }
{ ""  "" EINVAL  }
{ ""  "" EISDIR  }
{ ""  "" ELIBBAD  }
{ other fatal failure, error->message
                              * should explain
                               }
type
  PGSpawnError = ^TGSpawnError;
  TGSpawnError =  Longint;
  Const
    G_SPAWN_ERROR_FORK = 0;
    G_SPAWN_ERROR_READ = 1;
    G_SPAWN_ERROR_CHDIR = 2;
    G_SPAWN_ERROR_ACCES = 3;
    G_SPAWN_ERROR_PERM = 4;
    G_SPAWN_ERROR_TOO_BIG = 5;
    G_SPAWN_ERROR_2BIG = G_SPAWN_ERROR_TOO_BIG;
    G_SPAWN_ERROR_NOEXEC = (G_SPAWN_ERROR_TOO_BIG)+1;
    G_SPAWN_ERROR_NAMETOOLONG = (G_SPAWN_ERROR_TOO_BIG)+2;
    G_SPAWN_ERROR_NOENT = (G_SPAWN_ERROR_TOO_BIG)+3;
    G_SPAWN_ERROR_NOMEM = (G_SPAWN_ERROR_TOO_BIG)+4;
    G_SPAWN_ERROR_NOTDIR = (G_SPAWN_ERROR_TOO_BIG)+5;
    G_SPAWN_ERROR_LOOP = (G_SPAWN_ERROR_TOO_BIG)+6;
    G_SPAWN_ERROR_TXTBUSY = (G_SPAWN_ERROR_TOO_BIG)+7;
    G_SPAWN_ERROR_IO = (G_SPAWN_ERROR_TOO_BIG)+8;
    G_SPAWN_ERROR_NFILE = (G_SPAWN_ERROR_TOO_BIG)+9;
    G_SPAWN_ERROR_MFILE = (G_SPAWN_ERROR_TOO_BIG)+10;
    G_SPAWN_ERROR_INVAL = (G_SPAWN_ERROR_TOO_BIG)+11;
    G_SPAWN_ERROR_ISDIR = (G_SPAWN_ERROR_TOO_BIG)+12;
    G_SPAWN_ERROR_LIBBAD = (G_SPAWN_ERROR_TOO_BIG)+13;
    G_SPAWN_ERROR_FAILED = (G_SPAWN_ERROR_TOO_BIG)+14;
;
{*
 * G_SPAWN_EXIT_ERROR:
 *
 * Error domain used by g_spawn_check_wait_status().  The code
 * will be the program exit code.
  }

{ was #define dname def_expr }
function G_SPAWN_EXIT_ERROR : longint; { return type might be wrong }

{*
 * GSpawnChildSetupFunc:
 * @data: user data passed to the function.
 *
 * Specifies the type of the setup function passed to g_spawn_async(),
 * g_spawn_sync() and g_spawn_async_with_pipes(), which can, in very
 * limited ways, be used to affect the child's execution.
 *
 * On POSIX platforms, the function is called in the child after GLib
 * has performed all the setup it plans to perform, but before calling
 * exec(). Actions taken in this function will only affect the child,
 * not the parent.
 *
 * On Windows, the function is called in the parent. Its usefulness on
 * Windows is thus questionable. In many cases executing the child setup
 * function in the parent can have ill effects, and you should be very
 * careful when porting software to Windows that uses child setup
 * functions.
 *
 * However, even on POSIX, you are extremely limited in what you can
 * safely do from a #GSpawnChildSetupFunc, because any mutexes that were
 * held by other threads in the parent process at the time of the fork()
 * will still be locked in the child process, and they will never be
 * unlocked (since the threads that held them don't exist in the child).
 * POSIX allows only async-signal-safe functions (see signal(7)) to be
 * called in the child between fork() and exec(), which drastically limits
 * the usefulness of child setup functions.
 *
 * In particular, it is not safe to call any function which may
 * call malloc(), which includes POSIX functions such as setenv().
 * If you need to set up the child environment differently from
 * the parent, you should use g_get_environ(), g_environ_setenv(),
 * and g_environ_unsetenv(), and then pass the complete environment
 * list to the `g_spawn...` function.
  }
type

  TGSpawnChildSetupFunc = procedure (data:Tgpointer);cdecl;
{*
 * GSpawnFlags:
 * @G_SPAWN_DEFAULT: no flags, default behaviour
 * @G_SPAWN_LEAVE_DESCRIPTORS_OPEN: the parent's open file descriptors will
 *     be inherited by the child; otherwise all descriptors except stdin,
 *     stdout and stderr will be closed before calling exec() in the child.
 * @G_SPAWN_DO_NOT_REAP_CHILD: the child will not be automatically reaped;
 *     you must use g_child_watch_add() yourself (or call waitpid() or handle
 *     `SIGCHLD` yourself), or the child will become a zombie.
 * @G_SPAWN_SEARCH_PATH: `argv[0]` need not be an absolute path, it will be
 *     looked for in the user's `PATH`.
 * @G_SPAWN_STDOUT_TO_DEV_NULL: the child's standard output will be discarded,
 *     instead of going to the same location as the parent's standard output.
 * @G_SPAWN_STDERR_TO_DEV_NULL: the child's standard error will be discarded.
 * @G_SPAWN_CHILD_INHERITS_STDIN: the child will inherit the parent's standard
 *     input (by default, the child's standard input is attached to `/dev/null`).
 * @G_SPAWN_FILE_AND_ARGV_ZERO: the first element of `argv` is the file to
 *     execute, while the remaining elements are the actual argument vector
 *     to pass to the file. Normally g_spawn_async_with_pipes() uses `argv[0]`
 *     as the file to execute, and passes all of `argv` to the child.
 * @G_SPAWN_SEARCH_PATH_FROM_ENVP: if `argv[0]` is not an absolute path,
 *     it will be looked for in the `PATH` from the passed child environment.
 *     Since: 2.34
 * @G_SPAWN_CLOEXEC_PIPES: create all pipes with the `O_CLOEXEC` flag set.
 *     Since: 2.40
 * @G_SPAWN_CHILD_INHERITS_STDOUT: the child will inherit the parent's standard output.
 *     Since: 2.74
 * @G_SPAWN_CHILD_INHERITS_STDERR: the child will inherit the parent's standard error.
 *     Since: 2.74
 * @G_SPAWN_STDIN_FROM_DEV_NULL: the child's standard input is attached to `/dev/null`.
 *     Since: 2.74
 *
 * Flags passed to g_spawn_sync(), g_spawn_async() and g_spawn_async_with_pipes().
  }
{ look for argv[0] in the path i.e. use execvp()  }
{ Dump output to /dev/null  }
{*
   * G_SPAWN_CHILD_INHERITS_STDOUT:
   *
   * The child will inherit the parent's standard output.
   *
   * Since: 2.74
    }
{*
   * G_SPAWN_CHILD_INHERITS_STDERR:
   *
   * The child will inherit the parent's standard error.
   *
   * Since: 2.74
    }
{*
   * G_SPAWN_STDIN_FROM_DEV_NULL:
   *
   * The child's standard input is attached to `/dev/null`.
   *
   * Since: 2.74
    }

  PGSpawnFlags = ^TGSpawnFlags;
  TGSpawnFlags =  Longint;
  Const
    G_SPAWN_DEFAULT = 0;
    G_SPAWN_LEAVE_DESCRIPTORS_OPEN = 1 shl 0;
    G_SPAWN_DO_NOT_REAP_CHILD = 1 shl 1;
    G_SPAWN_SEARCH_PATH = 1 shl 2;
    G_SPAWN_STDOUT_TO_DEV_NULL = 1 shl 3;
    G_SPAWN_STDERR_TO_DEV_NULL = 1 shl 4;
    G_SPAWN_CHILD_INHERITS_STDIN = 1 shl 5;
    G_SPAWN_FILE_AND_ARGV_ZERO = 1 shl 6;
    G_SPAWN_SEARCH_PATH_FROM_ENVP = 1 shl 7;
    G_SPAWN_CLOEXEC_PIPES = 1 shl 8;
    G_SPAWN_CHILD_INHERITS_STDOUT = 1 shl 9;
    G_SPAWN_CHILD_INHERITS_STDERR = 1 shl 10;
    G_SPAWN_STDIN_FROM_DEV_NULL = 1 shl 11;
;

function g_spawn_error_quark:TGQuark;cdecl;external libglib2;
function g_spawn_exit_error_quark:TGQuark;cdecl;external libglib2;
function g_spawn_async(working_directory:Pgchar; argv:PPgchar; envp:PPgchar; flags:TGSpawnFlags; child_setup:TGSpawnChildSetupFunc; 
           user_data:Tgpointer; child_pid:PGPid; error:PPGError):Tgboolean;cdecl;external libglib2;
{ Opens pipes for non-NULL standard_output, standard_input, standard_error,
 * and returns the parent's end of the pipes.
  }
function g_spawn_async_with_pipes(working_directory:Pgchar; argv:PPgchar; envp:PPgchar; flags:TGSpawnFlags; child_setup:TGSpawnChildSetupFunc; 
           user_data:Tgpointer; child_pid:PGPid; standard_input:Pgint; standard_output:Pgint; standard_error:Pgint; 
           error:PPGError):Tgboolean;cdecl;external libglib2;
function g_spawn_async_with_pipes_and_fds(working_directory:Pgchar; argv:PPgchar; envp:PPgchar; flags:TGSpawnFlags; child_setup:TGSpawnChildSetupFunc; 
           user_data:Tgpointer; stdin_fd:Tgint; stdout_fd:Tgint; stderr_fd:Tgint; source_fds:Pgint; 
           target_fds:Pgint; n_fds:Tgsize; child_pid_out:PGPid; stdin_pipe_out:Pgint; stdout_pipe_out:Pgint; 
           stderr_pipe_out:Pgint; error:PPGError):Tgboolean;cdecl;external libglib2;
{ Lets you provide fds for stdin/stdout/stderr  }
function g_spawn_async_with_fds(working_directory:Pgchar; argv:PPgchar; envp:PPgchar; flags:TGSpawnFlags; child_setup:TGSpawnChildSetupFunc; 
           user_data:Tgpointer; child_pid:PGPid; stdin_fd:Tgint; stdout_fd:Tgint; stderr_fd:Tgint; 
           error:PPGError):Tgboolean;cdecl;external libglib2;
{ If standard_output or standard_error are non-NULL, the full
 * standard output or error of the command will be placed there.
  }
function g_spawn_sync(working_directory:Pgchar; argv:PPgchar; envp:PPgchar; flags:TGSpawnFlags; child_setup:TGSpawnChildSetupFunc; 
           user_data:Tgpointer; standard_output:PPgchar; standard_error:PPgchar; wait_status:Pgint; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_spawn_command_line_sync(command_line:Pgchar; standard_output:PPgchar; standard_error:PPgchar; wait_status:Pgint; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_spawn_command_line_async(command_line:Pgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_spawn_check_wait_status(wait_status:Tgint; error:PPGError):Tgboolean;cdecl;external libglib2;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_70_FOR(g_spawn_check_wait_status) }
function g_spawn_check_exit_status(wait_status:Tgint; error:PPGError):Tgboolean;cdecl;external libglib2;
procedure g_spawn_close_pid(pid:TGPid);cdecl;external libglib2;
{$endif}
{ __G_SPAWN_H__  }

// === Konventiert am: 22-6-26 19:22:59 ===


implementation


{ was #define dname def_expr }
function G_SPAWN_ERROR : longint; { return type might be wrong }
  begin
    G_SPAWN_ERROR:=g_spawn_error_quark;
  end;

{ was #define dname def_expr }
function G_SPAWN_EXIT_ERROR : longint; { return type might be wrong }
  begin
    G_SPAWN_EXIT_ERROR:=g_spawn_exit_error_quark;
  end;


end.
