
unit gmodule;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmodule.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmodule.h
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
PGModule  = ^GModule;
PGModuleCheckInit  = ^GModuleCheckInit;
PGModuleError  = ^GModuleError;
PGModuleFlags  = ^GModuleFlags;
Pgpointer  = ^gpointer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GMODULE - GLIB wrapper code for dynamic module loading
 * Copyright (C) 1998 Tim Janik
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/. 
  }
{$ifndef __GMODULE_H__}
{$define __GMODULE_H__}
{$include <glib.h>}
{$include <gmodule/gmodule-visibility.h>}
{*
 * GModuleFlags:
 * @G_MODULE_BIND_LAZY: specifies that symbols are only resolved when
 *     needed. The default action is to bind all symbols when the module
 *     is loaded.
 * @G_MODULE_BIND_LOCAL: specifies that symbols in the module should
 *     not be added to the global name space. The default action on most
 *     platforms is to place symbols in the module in the global name space,
 *     which may cause conflicts with existing symbols.
 * @G_MODULE_BIND_MASK: mask for all flags.
 *
 * Flags passed to g_module_open().
 * Note that these flags are not supported on all platforms.
  }
type
  PGModuleFlags = ^TGModuleFlags;
  TGModuleFlags =  Longint;
  Const
    G_MODULE_BIND_LAZY = 1 shl 0;
    G_MODULE_BIND_LOCAL = 1 shl 1;
    G_MODULE_BIND_MASK = $03;
;
type
(* Const before type ignored *)

  PGModuleCheckInit = ^TGModuleCheckInit;
  TGModuleCheckInit = function (module:PGModule):Pgchar;cdecl;

  TGModuleUnload = procedure (module:PGModule);cdecl;

{ was #define dname def_expr }
function G_MODULE_ERROR : longint; { return type might be wrong }

function g_module_error_quark:TGQuark;cdecl;external;
{*
 * GModuleError:
 * @G_MODULE_ERROR_FAILED: there was an error loading or opening a module file
 * @G_MODULE_ERROR_CHECK_FAILED: a module returned an error from its `g_module_check_init()` function
 *
 * Errors returned by g_module_open_full().
 *
 * Since: 2.70
  }
type
  PGModuleError = ^TGModuleError;
  TGModuleError =  Longint;
  Const
    G_MODULE_ERROR_FAILED = 0;
    G_MODULE_ERROR_CHECK_FAILED = 1;
;
{ return TRUE if dynamic module loading is supported  }

function g_module_supported:Tgboolean;cdecl;external;
{ open a module 'file_name' and return handle, which is NULL on error  }
(* Const before type ignored *)
function g_module_open(file_name:Pgchar; flags:TGModuleFlags):PGModule;cdecl;external;
(* Const before type ignored *)
function g_module_open_full(file_name:Pgchar; flags:TGModuleFlags; error:PPGError):PGModule;cdecl;external;
{ close a previously opened module, returns TRUE on success  }
function g_module_close(module:PGModule):Tgboolean;cdecl;external;
{ make a module resident so g_module_close on it will be ignored  }
procedure g_module_make_resident(module:PGModule);cdecl;external;
{ query the last module error as a string  }
(* Const before type ignored *)
function g_module_error:Pgchar;cdecl;external;
{ retrieve a symbol pointer from 'module', returns TRUE on success  }
(* Const before type ignored *)
function g_module_symbol(module:PGModule; symbol_name:Pgchar; symbol:Pgpointer):Tgboolean;cdecl;external;
{ retrieve the file name from an existing module  }
(* Const before type ignored *)
function g_module_name(module:PGModule):Pgchar;cdecl;external;
{ Build the actual file name containing a module. 'directory' is the
 * directory where the module file is supposed to be, or NULL or empty
 * in which case it should either be in the current directory or, on
 * some operating systems, in some standard place, for instance on the
 * PATH. Hence, to be absolutely sure to get the correct module,
 * always pass in a directory. The file name consists of the directory,
 * if supplied, and 'module_name' suitably decorated according to
 * the operating system's conventions (for instance lib*.so or *.dll).
 *
 * No checks are made that the file exists, or is of correct type.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function g_module_build_path(directory:Pgchar; module_name:Pgchar):Pgchar;cdecl;external;
{$endif}
{ __GMODULE_H__  }

implementation

{ was #define dname def_expr }
function G_MODULE_ERROR : longint; { return type might be wrong }
  begin
    G_MODULE_ERROR:=g_module_error_quark;
  end;


end.
