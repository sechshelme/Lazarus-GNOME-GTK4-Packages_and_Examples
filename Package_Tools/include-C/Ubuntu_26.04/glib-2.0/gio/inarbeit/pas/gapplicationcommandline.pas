unit gapplicationcommandline;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2010 Codethink Limited
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
 * Authors: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_APPLICATION_COMMAND_LINE_H__}
{$define __G_APPLICATION_COMMAND_LINE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{< private > }
  PGApplicationCommandLine = ^TGApplicationCommandLine;
  TGApplicationCommandLine = record
      parent_instance : TGObject;
      priv : PGApplicationCommandLinePrivate;
    end;

{< private > }
  PGApplicationCommandLineClass = ^TGApplicationCommandLineClass;
  TGApplicationCommandLineClass = record
      parent_class : TGObjectClass;
      print_literal : procedure (cmdline:PGApplicationCommandLine; message:Pgchar);cdecl;
      printerr_literal : procedure (cmdline:PGApplicationCommandLine; message:Pgchar);cdecl;
      get_stdin : function (cmdline:PGApplicationCommandLine):PGInputStream;cdecl;
      done : procedure (cmdline:PGApplicationCommandLine);cdecl;
      padding : array[0..9] of Tgpointer;
    end;


function g_application_command_line_get_type:TGType;cdecl;external libgio2;
function g_application_command_line_get_arguments(cmdline:PGApplicationCommandLine; argc:Plongint):^Pgchar;cdecl;external libgio2;
function g_application_command_line_get_options_dict(cmdline:PGApplicationCommandLine):PGVariantDict;cdecl;external libgio2;
function g_application_command_line_get_stdin(cmdline:PGApplicationCommandLine):PGInputStream;cdecl;external libgio2;
function g_application_command_line_get_environ(cmdline:PGApplicationCommandLine):^Pgchar;cdecl;external libgio2;
function g_application_command_line_getenv(cmdline:PGApplicationCommandLine; name:Pgchar):Pgchar;cdecl;external libgio2;
function g_application_command_line_get_cwd(cmdline:PGApplicationCommandLine):Pgchar;cdecl;external libgio2;
function g_application_command_line_get_is_remote(cmdline:PGApplicationCommandLine):Tgboolean;cdecl;external libgio2;
procedure g_application_command_line_print_literal(cmdline:PGApplicationCommandLine; message:Pgchar);cdecl;external libgio2;
procedure g_application_command_line_printerr_literal(cmdline:PGApplicationCommandLine; message:Pgchar);cdecl;external libgio2;
procedure g_application_command_line_print(cmdline:PGApplicationCommandLine; format:Pgchar; args:array of const);cdecl;external libgio2;
procedure g_application_command_line_print(cmdline:PGApplicationCommandLine; format:Pgchar);cdecl;external libgio2;
procedure g_application_command_line_printerr(cmdline:PGApplicationCommandLine; format:Pgchar; args:array of const);cdecl;external libgio2;
procedure g_application_command_line_printerr(cmdline:PGApplicationCommandLine; format:Pgchar);cdecl;external libgio2;
function g_application_command_line_get_exit_status(cmdline:PGApplicationCommandLine):longint;cdecl;external libgio2;
procedure g_application_command_line_set_exit_status(cmdline:PGApplicationCommandLine; exit_status:longint);cdecl;external libgio2;
function g_application_command_line_get_platform_data(cmdline:PGApplicationCommandLine):PGVariant;cdecl;external libgio2;
function g_application_command_line_create_file_for_arg(cmdline:PGApplicationCommandLine; arg:Pgchar):PGFile;cdecl;external libgio2;
procedure g_application_command_line_done(cmdline:PGApplicationCommandLine);cdecl;external libgio2;
{$endif}
{ __G_APPLICATION_COMMAND_LINE_H__  }

// === Konventiert am: 26-6-26 16:28:02 ===

function G_TYPE_APPLICATION_COMMAND_LINE : TGType;
function G_APPLICATION_COMMAND_LINE(obj : Pointer) : PGApplicationCommandLine;
function G_APPLICATION_COMMAND_LINE_CLASS(klass : Pointer) : PGApplicationCommandLineClass;
function G_IS_APPLICATION_COMMAND_LINE(obj : Pointer) : Tgboolean;
function G_IS_APPLICATION_COMMAND_LINE_CLASS(klass : Pointer) : Tgboolean;
function G_APPLICATION_COMMAND_LINE_GET_CLASS(obj : Pointer) : PGApplicationCommandLineClass;

implementation

function G_TYPE_APPLICATION_COMMAND_LINE : TGType;
  begin
    G_TYPE_APPLICATION_COMMAND_LINE:=g_application_command_line_get_type;
  end;

function G_APPLICATION_COMMAND_LINE(obj : Pointer) : PGApplicationCommandLine;
begin
  Result := PGApplicationCommandLine(g_type_check_instance_cast(obj, G_TYPE_APPLICATION_COMMAND_LINE));
end;

function G_APPLICATION_COMMAND_LINE_CLASS(klass : Pointer) : PGApplicationCommandLineClass;
begin
  Result := PGApplicationCommandLineClass(g_type_check_class_cast(klass, G_TYPE_APPLICATION_COMMAND_LINE));
end;

function G_IS_APPLICATION_COMMAND_LINE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_APPLICATION_COMMAND_LINE);
end;

function G_IS_APPLICATION_COMMAND_LINE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_APPLICATION_COMMAND_LINE);
end;

function G_APPLICATION_COMMAND_LINE_GET_CLASS(obj : Pointer) : PGApplicationCommandLineClass;
begin
  Result := PGApplicationCommandLineClass(PGTypeInstance(obj)^.g_class);
end;



end.
