
unit gsubprocess;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsubprocess.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsubprocess
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
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGBytes  = ^GBytes;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGInputStream  = ^GInputStream;
PGOutputStream  = ^GOutputStream;
PGSubprocess  = ^GSubprocess;
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

{ was #define dname def_expr }
function G_TYPE_SUBPROCESS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SUBPROCESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SUBPROCESS(o : longint) : longint;

function g_subprocess_get_type:TGType;cdecl;external;
{*** Core API *** }
(* Const before type ignored *)
function g_subprocess_new(flags:TGSubprocessFlags; error:PPGError; argv0:Pgchar; args:array of const):PGSubprocess;cdecl;external;
function g_subprocess_new(flags:TGSubprocessFlags; error:PPGError; argv0:Pgchar):PGSubprocess;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function g_subprocess_newv(argv:PPgchar; flags:TGSubprocessFlags; error:PPGError):PGSubprocess;cdecl;external;
function g_subprocess_get_stdin_pipe(subprocess:PGSubprocess):PGOutputStream;cdecl;external;
function g_subprocess_get_stdout_pipe(subprocess:PGSubprocess):PGInputStream;cdecl;external;
function g_subprocess_get_stderr_pipe(subprocess:PGSubprocess):PGInputStream;cdecl;external;
(* Const before type ignored *)
function g_subprocess_get_identifier(subprocess:PGSubprocess):Pgchar;cdecl;external;
{$ifdef G_OS_UNIX}
procedure g_subprocess_send_signal(subprocess:PGSubprocess; signal_num:Tgint);cdecl;external;
{$endif}

procedure g_subprocess_force_exit(subprocess:PGSubprocess);cdecl;external;
function g_subprocess_wait(subprocess:PGSubprocess; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_subprocess_wait_async(subprocess:PGSubprocess; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_subprocess_wait_finish(subprocess:PGSubprocess; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_subprocess_wait_check(subprocess:PGSubprocess; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_subprocess_wait_check_async(subprocess:PGSubprocess; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_subprocess_wait_check_finish(subprocess:PGSubprocess; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_subprocess_get_status(subprocess:PGSubprocess):Tgint;cdecl;external;
function g_subprocess_get_successful(subprocess:PGSubprocess):Tgboolean;cdecl;external;
function g_subprocess_get_if_exited(subprocess:PGSubprocess):Tgboolean;cdecl;external;
function g_subprocess_get_exit_status(subprocess:PGSubprocess):Tgint;cdecl;external;
function g_subprocess_get_if_signaled(subprocess:PGSubprocess):Tgboolean;cdecl;external;
function g_subprocess_get_term_sig(subprocess:PGSubprocess):Tgint;cdecl;external;
function g_subprocess_communicate(subprocess:PGSubprocess; stdin_buf:PGBytes; cancellable:PGCancellable; stdout_buf:PPGBytes; stderr_buf:PPGBytes; 
           error:PPGError):Tgboolean;cdecl;external;
procedure g_subprocess_communicate_async(subprocess:PGSubprocess; stdin_buf:PGBytes; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_subprocess_communicate_finish(subprocess:PGSubprocess; result:PGAsyncResult; stdout_buf:PPGBytes; stderr_buf:PPGBytes; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_subprocess_communicate_utf8(subprocess:PGSubprocess; stdin_buf:Pchar; cancellable:PGCancellable; stdout_buf:PPchar; stderr_buf:PPchar; 
           error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure g_subprocess_communicate_utf8_async(subprocess:PGSubprocess; stdin_buf:Pchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_subprocess_communicate_utf8_finish(subprocess:PGSubprocess; result:PGAsyncResult; stdout_buf:PPchar; stderr_buf:PPchar; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __G_SUBPROCESS_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SUBPROCESS : longint; { return type might be wrong }
  begin
    G_TYPE_SUBPROCESS:=g_subprocess_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SUBPROCESS(o : longint) : longint;
begin
  G_SUBPROCESS:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_SUBPROCESS,GSubprocess);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SUBPROCESS(o : longint) : longint;
begin
  G_IS_SUBPROCESS:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_SUBPROCESS);
end;


end.
