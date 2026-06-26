
unit gsubprocesslauncher;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsubprocesslauncher.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsubprocesslauncher.h
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
PGSubprocess  = ^GSubprocess;
PGSubprocessLauncher  = ^GSubprocessLauncher;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2012,2013 Colin Walters <walters@verbum.org>
 * Copyright © 2012,2013 Canonical Limited
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
 * Author: Ryan Lortie <desrt@desrt.ca>
 * Author: Colin Walters <walters@verbum.org>
  }
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$ifndef __G_SUBPROCESS_LAUNCHER_H__}
{$define __G_SUBPROCESS_LAUNCHER_H__}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_SUBPROCESS_LAUNCHER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SUBPROCESS_LAUNCHER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SUBPROCESS_LAUNCHER(o : longint) : longint;

function g_subprocess_launcher_get_type:TGType;cdecl;external;
function g_subprocess_launcher_new(flags:TGSubprocessFlags):PGSubprocessLauncher;cdecl;external;
(* Const before type ignored *)
function g_subprocess_launcher_spawn(self:PGSubprocessLauncher; error:PPGError; argv0:Pgchar; args:array of const):PGSubprocess;cdecl;external;
function g_subprocess_launcher_spawn(self:PGSubprocessLauncher; error:PPGError; argv0:Pgchar):PGSubprocess;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function g_subprocess_launcher_spawnv(self:PGSubprocessLauncher; argv:PPgchar; error:PPGError):PGSubprocess;cdecl;external;
procedure g_subprocess_launcher_set_environ(self:PGSubprocessLauncher; env:PPgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_subprocess_launcher_setenv(self:PGSubprocessLauncher; variable:Pgchar; value:Pgchar; overwrite:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure g_subprocess_launcher_unsetenv(self:PGSubprocessLauncher; variable:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_subprocess_launcher_getenv(self:PGSubprocessLauncher; variable:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure g_subprocess_launcher_set_cwd(self:PGSubprocessLauncher; cwd:Pgchar);cdecl;external;
procedure g_subprocess_launcher_set_flags(self:PGSubprocessLauncher; flags:TGSubprocessFlags);cdecl;external;
{ Extended I/O control, only available on UNIX  }
{$ifdef G_OS_UNIX}
(* Const before type ignored *)
procedure g_subprocess_launcher_set_stdin_file_path(self:PGSubprocessLauncher; path:Pgchar);cdecl;external;
procedure g_subprocess_launcher_take_stdin_fd(self:PGSubprocessLauncher; fd:Tgint);cdecl;external;
(* Const before type ignored *)
procedure g_subprocess_launcher_set_stdout_file_path(self:PGSubprocessLauncher; path:Pgchar);cdecl;external;
procedure g_subprocess_launcher_take_stdout_fd(self:PGSubprocessLauncher; fd:Tgint);cdecl;external;
(* Const before type ignored *)
procedure g_subprocess_launcher_set_stderr_file_path(self:PGSubprocessLauncher; path:Pgchar);cdecl;external;
procedure g_subprocess_launcher_take_stderr_fd(self:PGSubprocessLauncher; fd:Tgint);cdecl;external;
procedure g_subprocess_launcher_take_fd(self:PGSubprocessLauncher; source_fd:Tgint; target_fd:Tgint);cdecl;external;
procedure g_subprocess_launcher_close(self:PGSubprocessLauncher);cdecl;external;
{ Child setup, only available on UNIX  }
procedure g_subprocess_launcher_set_child_setup(self:PGSubprocessLauncher; child_setup:TGSpawnChildSetupFunc; user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external;
{$endif}
{$endif}
{ __G_SUBPROCESS_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SUBPROCESS_LAUNCHER : longint; { return type might be wrong }
  begin
    G_TYPE_SUBPROCESS_LAUNCHER:=g_subprocess_launcher_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SUBPROCESS_LAUNCHER(o : longint) : longint;
begin
  G_SUBPROCESS_LAUNCHER:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_SUBPROCESS_LAUNCHER,GSubprocessLauncher);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SUBPROCESS_LAUNCHER(o : longint) : longint;
begin
  G_IS_SUBPROCESS_LAUNCHER:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_SUBPROCESS_LAUNCHER);
end;


end.
