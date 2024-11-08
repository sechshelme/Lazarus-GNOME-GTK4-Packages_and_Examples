
unit glib_unix;
interface

{
  Automatically converted by H2Pas 1.0.0 from glib_unix.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    glib_unix.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
Pgint  = ^gint;
PGSource  = ^GSource;
PGUnixPipe  = ^GUnixPipe;
PGUnixPipeEnd  = ^GUnixPipeEnd;
Ppasswd  = ^passwd;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ glib-unix.h - Unix specific integration
 * Copyright (C) 2011 Red Hat, Inc.
 * Copyright 2023 Collabora Ltd.
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
{$ifndef __G_UNIX_H__}
{$define __G_UNIX_H__}
{ We need to include the UNIX headers needed to use the APIs below,
 * but we also take this opportunity to include a wide selection of
 * other UNIX headers.  If one of the headers below is broken on some
 * system, work around it here (or better, fix the system or tell
 * people to use a better one).
  }
{$include <unistd.h>}
{$include <errno.h>}
{$include <sys/wait.h>}
{$include <stdlib.h>}
{$include <fcntl.h>}
{$include <glib.h>}
{$include <glib/gstdio.h>}
{*
 * G_UNIX_ERROR:
 *
 * Error domain for API in the g_unix_ namespace. Note that there is no
 * exported enumeration mapping %errno. Instead, all functions ensure that
 * %errno is relevant. The code for all %G_UNIX_ERROR is always 0, and the
 * error message is always generated via g_strerror().
 *
 * It is expected that most code will not look at %errno from these APIs.
 * Important cases where one would want to differentiate between errors are
 * already covered by existing cross-platform GLib API, such as e.g. #GFile
 * wrapping `ENOENT`. However, it is provided for completeness, at least.
  }

{ was #define dname def_expr }
function G_UNIX_ERROR : longint; { return type might be wrong }

function g_unix_error_quark:TGQuark;cdecl;external;
function g_unix_open_pipe(fds:Pgint; flags:Tgint; error:PPGError):Tgboolean;cdecl;external;
function g_unix_set_fd_nonblocking(fd:Tgint; nonblock:Tgboolean; error:PPGError):Tgboolean;cdecl;external;
function g_unix_signal_source_new(signum:Tgint):PGSource;cdecl;external;
function g_unix_signal_add_full(priority:Tgint; signum:Tgint; handler:TGSourceFunc; user_data:Tgpointer; notify:TGDestroyNotify):Tguint;cdecl;external;
function g_unix_signal_add(signum:Tgint; handler:TGSourceFunc; user_data:Tgpointer):Tguint;cdecl;external;
{*
 * GUnixFDSourceFunc:
 * @fd: the fd that triggered the event
 * @condition: the IO conditions reported on @fd
 * @user_data: user data passed to g_unix_fd_add()
 *
 * The type of functions to be called when a UNIX fd watch source
 * triggers.
 *
 * Returns: %FALSE if the source should be removed
 * }
type

  TGUnixFDSourceFunc = function (fd:Tgint; condition:TGIOCondition; user_data:Tgpointer):Tgboolean;cdecl;

function g_unix_fd_source_new(fd:Tgint; condition:TGIOCondition):PGSource;cdecl;external;
function g_unix_fd_add_full(priority:Tgint; fd:Tgint; condition:TGIOCondition; _function:TGUnixFDSourceFunc; user_data:Tgpointer; 
           notify:TGDestroyNotify):Tguint;cdecl;external;
function g_unix_fd_add(fd:Tgint; condition:TGIOCondition; _function:TGUnixFDSourceFunc; user_data:Tgpointer):Tguint;cdecl;external;
(* Const before type ignored *)
function g_unix_get_passwd_entry(user_name:Pgchar; error:PPGError):Ppasswd;cdecl;external;
{*
 * GUnixPipe:
 * @fds: A pair of file descriptors, each negative if closed or not yet opened.
 *  The file descriptor with index %G_UNIX_PIPE_END_READ is readable.
 *  The file descriptor with index %G_UNIX_PIPE_END_WRITE is writable.
 *
 * A Unix pipe. The advantage of this type over `int[2]` is that it can
 * be closed automatically when it goes out of scope, using `g_auto(GUnixPipe)`,
 * on compilers that support that feature.
 *
 * Since: 2.80
  }
type
  PGUnixPipe = ^TGUnixPipe;
  TGUnixPipe = record
      fds : array[0..1] of longint;
    end;
{*
 * GUnixPipeEnd:
 * @G_UNIX_PIPE_END_READ: The readable file descriptor 0
 * @G_UNIX_PIPE_END_WRITE: The writable file descriptor 1
 *
 * Mnemonic constants for the ends of a Unix pipe.
 *
 * Since: 2.80
  }

  PGUnixPipeEnd = ^TGUnixPipeEnd;
  TGUnixPipeEnd =  Longint;
  Const
    G_UNIX_PIPE_END_READ = 0;
    G_UNIX_PIPE_END_WRITE = 1;
;
{*
 * G_UNIX_PIPE_INIT:
 *
 * Initializer for a #GUnixPipe that has not yet been opened.
 * Both of its file descriptors are initialized to `-1` (invalid),
 * the same as if they had been closed.
 *
 * Since: 2.80
  }
{ Suppress "Not available before" warnings when declaring the
 * implementations  }
{*
 * g_unix_pipe_open:
 * @self: A pair of file descriptors
 * @flags: Flags to pass to g_unix_open_pipe(), typically `O_CLOEXEC`
 * @error: Used to report an error on failure
 *
 * Open a pipe. This is the same as g_unix_open_pipe(), but uses the
 * #GUnixPipe data structure.
 *
 * Returns: %TRUE on success
 *
 * Since: 2.80
  }

function g_closefrom(lowfd:longint):longint;cdecl;external;
function g_fdwalk_set_cloexec(lowfd:longint):longint;cdecl;external;
{$endif}
{ __G_UNIX_H__  }

implementation

{ was #define dname def_expr }
function G_UNIX_ERROR : longint; { return type might be wrong }
  begin
    G_UNIX_ERROR:=g_unix_error_quark;
  end;


end.
