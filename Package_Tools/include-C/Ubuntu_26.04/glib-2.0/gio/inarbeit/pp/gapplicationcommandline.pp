
unit gapplicationcommandline;
interface

{
  Automatically converted by H2Pas 1.0.0 from gapplicationcommandline.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gapplicationcommandline.h
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
PGApplicationCommandLine  = ^GApplicationCommandLine;
PGApplicationCommandLineClass  = ^GApplicationCommandLineClass;
PGApplicationCommandLinePrivate  = ^GApplicationCommandLinePrivate;
Pgchar  = ^gchar;
PGFile  = ^GFile;
PGInputStream  = ^GInputStream;
PGVariant  = ^GVariant;
PGVariantDict  = ^GVariantDict;
Plongint  = ^longint;
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

{ was #define dname def_expr }
function G_TYPE_APPLICATION_COMMAND_LINE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APPLICATION_COMMAND_LINE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APPLICATION_COMMAND_LINE_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APPLICATION_COMMAND_LINE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APPLICATION_COMMAND_LINE_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APPLICATION_COMMAND_LINE_GET_CLASS(inst : longint) : longint;

type
{< private > }
  PGApplicationCommandLine = ^TGApplicationCommandLine;
  TGApplicationCommandLine = record
      parent_instance : TGObject;
      priv : PGApplicationCommandLinePrivate;
    end;

{< private > }
(* Const before type ignored *)
(* Const before type ignored *)
  PGApplicationCommandLineClass = ^TGApplicationCommandLineClass;
  TGApplicationCommandLineClass = record
      parent_class : TGObjectClass;
      print_literal : procedure (cmdline:PGApplicationCommandLine; message:Pgchar);cdecl;
      printerr_literal : procedure (cmdline:PGApplicationCommandLine; message:Pgchar);cdecl;
      get_stdin : function (cmdline:PGApplicationCommandLine):PGInputStream;cdecl;
      done : procedure (cmdline:PGApplicationCommandLine);cdecl;
      padding : array[0..9] of Tgpointer;
    end;


function g_application_command_line_get_type:TGType;cdecl;external;
function g_application_command_line_get_arguments(cmdline:PGApplicationCommandLine; argc:Plongint):^Pgchar;cdecl;external;
function g_application_command_line_get_options_dict(cmdline:PGApplicationCommandLine):PGVariantDict;cdecl;external;
function g_application_command_line_get_stdin(cmdline:PGApplicationCommandLine):PGInputStream;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function g_application_command_line_get_environ(cmdline:PGApplicationCommandLine):^Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_application_command_line_getenv(cmdline:PGApplicationCommandLine; name:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_application_command_line_get_cwd(cmdline:PGApplicationCommandLine):Pgchar;cdecl;external;
function g_application_command_line_get_is_remote(cmdline:PGApplicationCommandLine):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure g_application_command_line_print_literal(cmdline:PGApplicationCommandLine; message:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_application_command_line_printerr_literal(cmdline:PGApplicationCommandLine; message:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_application_command_line_print(cmdline:PGApplicationCommandLine; format:Pgchar; args:array of const);cdecl;external;
procedure g_application_command_line_print(cmdline:PGApplicationCommandLine; format:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_application_command_line_printerr(cmdline:PGApplicationCommandLine; format:Pgchar; args:array of const);cdecl;external;
procedure g_application_command_line_printerr(cmdline:PGApplicationCommandLine; format:Pgchar);cdecl;external;
function g_application_command_line_get_exit_status(cmdline:PGApplicationCommandLine):longint;cdecl;external;
procedure g_application_command_line_set_exit_status(cmdline:PGApplicationCommandLine; exit_status:longint);cdecl;external;
function g_application_command_line_get_platform_data(cmdline:PGApplicationCommandLine):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_application_command_line_create_file_for_arg(cmdline:PGApplicationCommandLine; arg:Pgchar):PGFile;cdecl;external;
procedure g_application_command_line_done(cmdline:PGApplicationCommandLine);cdecl;external;
{$endif}
{ __G_APPLICATION_COMMAND_LINE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_APPLICATION_COMMAND_LINE : longint; { return type might be wrong }
  begin
    G_TYPE_APPLICATION_COMMAND_LINE:=g_application_command_line_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APPLICATION_COMMAND_LINE(inst : longint) : longint;
begin
  G_APPLICATION_COMMAND_LINE:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_APPLICATION_COMMAND_LINE,GApplicationCommandLine);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APPLICATION_COMMAND_LINE_CLASS(_class : longint) : longint;
begin
  G_APPLICATION_COMMAND_LINE_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_APPLICATION_COMMAND_LINE,GApplicationCommandLineClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APPLICATION_COMMAND_LINE(inst : longint) : longint;
begin
  G_IS_APPLICATION_COMMAND_LINE:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_APPLICATION_COMMAND_LINE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_APPLICATION_COMMAND_LINE_CLASS(_class : longint) : longint;
begin
  G_IS_APPLICATION_COMMAND_LINE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_APPLICATION_COMMAND_LINE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_APPLICATION_COMMAND_LINE_GET_CLASS(inst : longint) : longint;
begin
  G_APPLICATION_COMMAND_LINE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_APPLICATION_COMMAND_LINE,GApplicationCommandLineClass);
end;


end.
