
unit peas_plugin_info;
interface

{
  Automatically converted by H2Pas 1.0.0 from peas_plugin_info.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    peas_plugin_info.h
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
PGError  = ^GError;
PGResource  = ^GResource;
PGSettings  = ^GSettings;
PPeasPluginInfo  = ^PeasPluginInfo;
PPeasPluginInfoError  = ^PeasPluginInfoError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * peas-plugins-info.h
 * This file is part of libpeas
 *
 * Copyright (C) 2002-2005 - Paolo Maggi
 * Copyright (C) 2007 - Steve Frécinaux
 *
 * libpeas is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * libpeas is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined (LIBPEAS_INSIDE) && !defined (LIBPEAS_COMPILATION)}
{$error "Only <libpeas.h> can be included directly."}
{$endif}
{$include <gio/gio.h>}
{$include "peas-version-macros.h"}

{ was #define dname def_expr }
function PEAS_TYPE_PLUGIN_INFO : longint; { return type might be wrong }

{*
 * PEAS_PLUGIN_INFO_ERROR:
 *
 * Error domain for PeasPluginInfo. Errors in this domain will
 * be from the PeasPluginInfoError enumeration. See #GError for
 * more information on error domains.
  }
{ was #define dname def_expr }
function PEAS_PLUGIN_INFO_ERROR : longint; { return type might be wrong }

{*
 * PeasPluginInfoError:
 * @PEAS_PLUGIN_INFO_ERROR_LOADING_FAILED:
 *      The plugin failed to load.
 * @PEAS_PLUGIN_INFO_ERROR_LOADER_NOT_FOUND:
 *      The plugin's loader was not found.
 * @PEAS_PLUGIN_INFO_ERROR_DEP_NOT_FOUND:
 *      A dependency of the plugin was not found.
 * @PEAS_PLUGIN_INFO_ERROR_DEP_LOADING_FAILED:
 *      A dependency of the plugin failed to load.
 *
 * These identify the various errors that can occur while
 * loading a plugin.
  }
type
  PPeasPluginInfoError = ^TPeasPluginInfoError;
  TPeasPluginInfoError =  Longint;
  Const
    PEAS_PLUGIN_INFO_ERROR_LOADING_FAILED = 0;
    PEAS_PLUGIN_INFO_ERROR_LOADER_NOT_FOUND = 1;
    PEAS_PLUGIN_INFO_ERROR_DEP_NOT_FOUND = 2;
    PEAS_PLUGIN_INFO_ERROR_DEP_LOADING_FAILED = 3;
;
{ G_DECLARE_FINAL_TYPE (PeasPluginInfo, peas_plugin_info, PEAS, PLUGIN_INFO, GObject) }

function peas_plugin_info_error_quark:TGQuark;cdecl;external;
(* Const before type ignored *)
function peas_plugin_info_is_loaded(info:PPeasPluginInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function peas_plugin_info_is_available(info:PPeasPluginInfo; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function peas_plugin_info_is_builtin(info:PPeasPluginInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function peas_plugin_info_is_hidden(info:PPeasPluginInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_plugin_info_get_module_name(info:PPeasPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_plugin_info_get_module_dir(info:PPeasPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_plugin_info_get_data_dir(info:PPeasPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_plugin_info_get_settings(info:PPeasPluginInfo; schema_id:Pchar):PGSettings;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function peas_plugin_info_get_dependencies(info:PPeasPluginInfo):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_plugin_info_has_dependency(info:PPeasPluginInfo; module_name:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_plugin_info_get_name(info:PPeasPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_plugin_info_get_description(info:PPeasPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_plugin_info_get_icon_name(info:PPeasPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function peas_plugin_info_get_authors(info:PPeasPluginInfo):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_plugin_info_get_website(info:PPeasPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_plugin_info_get_copyright(info:PPeasPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_plugin_info_get_version(info:PPeasPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_plugin_info_get_help_uri(info:PPeasPluginInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function peas_plugin_info_get_external_data(info:PPeasPluginInfo; key:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_plugin_info_get_resource(info:PPeasPluginInfo; filename:Pchar; error:PPGError):PGResource;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure peas_plugin_info_load_resource(info:PPeasPluginInfo; filename:Pchar; error:PPGError);cdecl;external;

implementation

{ was #define dname def_expr }
function PEAS_TYPE_PLUGIN_INFO : longint; { return type might be wrong }
  begin
    PEAS_TYPE_PLUGIN_INFO:=peas_plugin_info_get_type;
  end;

{ was #define dname def_expr }
function PEAS_PLUGIN_INFO_ERROR : longint; { return type might be wrong }
  begin
    PEAS_PLUGIN_INFO_ERROR:=peas_plugin_info_error_quark;
  end;


end.
