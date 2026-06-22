unit gshell;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gshell.h - Shell-related utilities
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
{$ifndef __G_SHELL_H__}
{$define __G_SHELL_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gerror.h>}

{ was #define dname def_expr }
function G_SHELL_ERROR : longint; { return type might be wrong }

{ mismatched or otherwise mangled quoting  }
{ string to be parsed was empty  }
type
  PGShellError = ^TGShellError;
  TGShellError =  Longint;
  Const
    G_SHELL_ERROR_BAD_QUOTING = 0;
    G_SHELL_ERROR_EMPTY_STRING = 1;
    G_SHELL_ERROR_FAILED = 2;
;

function g_shell_error_quark:TGQuark;cdecl;external libglib2;
function g_shell_quote(unquoted_string:Pgchar):Pgchar;cdecl;external libglib2;
function g_shell_unquote(quoted_string:Pgchar; error:PPGError):Pgchar;cdecl;external libglib2;
function g_shell_parse_argv(command_line:Pgchar; argcp:Pgint; argvp:PPPgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
{$endif}
{ __G_SHELL_H__  }

// === Konventiert am: 22-6-26 19:22:52 ===


implementation


{ was #define dname def_expr }
function G_SHELL_ERROR : longint; { return type might be wrong }
  begin
    G_SHELL_ERROR:=g_shell_error_quark;
  end;


end.
