unit gsubprocess;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2012 Colin Walters <walters@verbum.org>
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Colin Walters <walters@verbum.org>
  }
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$ifndef __G_SUBPROCESS_H__}
{$define __G_SUBPROCESS_H__}
{$include <gio/giotypes.h>}

function g_subprocess_get_type:TGType;cdecl;external libgio2;
{*** Core API *** }
function g_subprocess_new(flags:TGSubprocessFlags; error:PPGError; argv0:Pgchar; args:array of const):PGSubprocess;cdecl;external libgio2;
function g_subprocess_new(flags:TGSubprocessFlags; error:PPGError; argv0:Pgchar):PGSubprocess;cdecl;external libgio2;
function g_subprocess_newv(argv:PPgchar; flags:TGSubprocessFlags; error:PPGError):PGSubprocess;cdecl;external libgio2;
function g_subprocess_get_stdin_pipe(subprocess:PGSubprocess):PGOutputStream;cdecl;external libgio2;
function g_subprocess_get_stdout_pipe(subprocess:PGSubprocess):PGInputStream;cdecl;external libgio2;
function g_subprocess_get_stderr_pipe(subprocess:PGSubprocess):PGInputStream;cdecl;external libgio2;
function g_subprocess_get_identifier(subprocess:PGSubprocess):Pgchar;cdecl;external libgio2;
{$ifdef G_OS_UNIX}
procedure g_subprocess_send_signal(subprocess:PGSubprocess; signal_num:Tgint);cdecl;external libgio2;
{$endif}

procedure g_subprocess_force_exit(subprocess:PGSubprocess);cdecl;external libgio2;
function g_subprocess_wait(subprocess:PGSubprocess; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
procedure g_subprocess_wait_async(subprocess:PGSubprocess; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_subprocess_wait_finish(subprocess:PGSubprocess; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_subprocess_wait_check(subprocess:PGSubprocess; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
procedure g_subprocess_wait_check_async(subprocess:PGSubprocess; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_subprocess_wait_check_finish(subprocess:PGSubprocess; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_subprocess_get_status(subprocess:PGSubprocess):Tgint;cdecl;external libgio2;
function g_subprocess_get_successful(subprocess:PGSubprocess):Tgboolean;cdecl;external libgio2;
function g_subprocess_get_if_exited(subprocess:PGSubprocess):Tgboolean;cdecl;external libgio2;
function g_subprocess_get_exit_status(subprocess:PGSubprocess):Tgint;cdecl;external libgio2;
function g_subprocess_get_if_signaled(subprocess:PGSubprocess):Tgboolean;cdecl;external libgio2;
function g_subprocess_get_term_sig(subprocess:PGSubprocess):Tgint;cdecl;external libgio2;
function g_subprocess_communicate(subprocess:PGSubprocess; stdin_buf:PGBytes; cancellable:PGCancellable; stdout_buf:PPGBytes; stderr_buf:PPGBytes; 
           error:PPGError):Tgboolean;cdecl;external libgio2;
procedure g_subprocess_communicate_async(subprocess:PGSubprocess; stdin_buf:PGBytes; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_subprocess_communicate_finish(subprocess:PGSubprocess; result:PGAsyncResult; stdout_buf:PPGBytes; stderr_buf:PPGBytes; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_subprocess_communicate_utf8(subprocess:PGSubprocess; stdin_buf:Pchar; cancellable:PGCancellable; stdout_buf:PPchar; stderr_buf:PPchar; 
           error:PPGError):Tgboolean;cdecl;external libgio2;
procedure g_subprocess_communicate_utf8_async(subprocess:PGSubprocess; stdin_buf:Pchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_subprocess_communicate_utf8_finish(subprocess:PGSubprocess; result:PGAsyncResult; stdout_buf:PPchar; stderr_buf:PPchar; error:PPGError):Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_SUBPROCESS_H__  }

// === Konventiert am: 26-6-26 20:00:13 ===

function G_TYPE_SUBPROCESS : TGType;
function G_SUBPROCESS(obj : Pointer) : PGSubprocess;
function G_IS_SUBPROCESS(obj : Pointer) : Tgboolean;

implementation

function G_TYPE_SUBPROCESS : TGType;
  begin
    G_TYPE_SUBPROCESS:=g_subprocess_get_type;
  end;

function G_SUBPROCESS(obj : Pointer) : PGSubprocess;
begin
  Result := PGSubprocess(g_type_check_instance_cast(obj, G_TYPE_SUBPROCESS));
end;

function G_IS_SUBPROCESS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_SUBPROCESS);
end;



end.
