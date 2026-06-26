unit giomodule;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
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
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_IO_MODULE_H__}
{$define __G_IO_MODULE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{$include <gmodule.h>}
type

function g_io_module_scope_new(flags:TGIOModuleScopeFlags):PGIOModuleScope;cdecl;external libgio2;
procedure g_io_module_scope_free(scope:PGIOModuleScope);cdecl;external libgio2;
procedure g_io_module_scope_block(scope:PGIOModuleScope; basename:Pgchar);cdecl;external libgio2;
type

function g_io_module_get_type:TGType;cdecl;external libgio2;
function g_io_module_new(filename:Pgchar):PGIOModule;cdecl;external libgio2;
procedure g_io_modules_scan_all_in_directory(dirname:Pchar);cdecl;external libgio2;
function g_io_modules_load_all_in_directory(dirname:Pgchar):PGList;cdecl;external libgio2;
procedure g_io_modules_scan_all_in_directory_with_scope(dirname:Pgchar; scope:PGIOModuleScope);cdecl;external libgio2;
function g_io_modules_load_all_in_directory_with_scope(dirname:Pgchar; scope:PGIOModuleScope):PGList;cdecl;external libgio2;
function g_io_extension_point_register(name:Pchar):PGIOExtensionPoint;cdecl;external libgio2;
function g_io_extension_point_lookup(name:Pchar):PGIOExtensionPoint;cdecl;external libgio2;
procedure g_io_extension_point_set_required_type(extension_point:PGIOExtensionPoint; _type:TGType);cdecl;external libgio2;
function g_io_extension_point_get_required_type(extension_point:PGIOExtensionPoint):TGType;cdecl;external libgio2;
function g_io_extension_point_get_extensions(extension_point:PGIOExtensionPoint):PGList;cdecl;external libgio2;
function g_io_extension_point_get_extension_by_name(extension_point:PGIOExtensionPoint; name:Pchar):PGIOExtension;cdecl;external libgio2;
function g_io_extension_point_implement(extension_point_name:Pchar; _type:TGType; extension_name:Pchar; priority:Tgint):PGIOExtension;cdecl;external libgio2;
function g_io_extension_get_type(extension:PGIOExtension):TGType;cdecl;external libgio2;
function g_io_extension_get_name(extension:PGIOExtension):Pchar;cdecl;external libgio2;
function g_io_extension_get_priority(extension:PGIOExtension):Tgint;cdecl;external libgio2;
function g_io_extension_ref_class(extension:PGIOExtension):PGTypeClass;cdecl;external libgio2;
{ API for the modules to implement.
 * Note that those functions are not implemented by libgio, they are declared
 * here to be implemented in modules, that's why it uses G_MODULE_EXPORT
 * instead of extern.
  }
{*
 * g_io_module_load: (skip)
 * @module: a #GIOModule.
 *
 * Required API for GIO modules to implement.
 *
 * This function is run after the module has been loaded into GIO,
 * to initialize the module. Typically, this function will call
 * g_io_extension_point_implement().
 *
 * Since 2.56, this function should be named `g_io_<modulename>_load`, where
 * `modulename` is the plugin’s filename with the `lib` or `libgio` prefix and
 * everything after the first dot removed, and with `-` replaced with `_`
 * throughout. For example, `libgiognutls-helper.so` becomes `gnutls_helper`.
 * Using the new symbol names avoids name clashes when building modules
 * statically. The old symbol names continue to be supported, but cannot be used
 * for static builds.
 * }
procedure g_io_module_load(module:PGIOModule);cdecl;external libgio2;
{*
 * g_io_module_unload: (skip)
 * @module: a #GIOModule.
 *
 * Required API for GIO modules to implement.
 *
 * This function is run when the module is being unloaded from GIO,
 * to finalize the module.
 *
 * Since 2.56, this function should be named `g_io_<modulename>_unload`, where
 * `modulename` is the plugin’s filename with the `lib` or `libgio` prefix and
 * everything after the first dot removed, and with `-` replaced with `_`
 * throughout. For example, `libgiognutls-helper.so` becomes `gnutls_helper`.
 * Using the new symbol names avoids name clashes when building modules
 * statically. The old symbol names continue to be supported, but cannot be used
 * for static builds.
 * }
procedure g_io_module_unload(module:PGIOModule);cdecl;external libgio2;
{*
 * g_io_module_query:
 *
 * Optional API for GIO modules to implement.
 *
 * Should return a list of all the extension points that may be
 * implemented in this module.
 *
 * This method will not be called in normal use, however it may be
 * called when probing existing modules and recording which extension
 * points that this model is used for. This means we won't have to
 * load and initialize this module unless its needed.
 *
 * If this function is not implemented by the module the module will
 * always be loaded, initialized and then unloaded on application
 * startup so that it can register its extension points during init.
 *
 * Note that a module need not actually implement all the extension
 * points that g_io_module_query() returns, since the exact list of
 * extension may depend on runtime issues. However all extension
 * points actually implemented must be returned by g_io_module_query()
 * (if defined).
 *
 * When installing a module that implements g_io_module_query() you must
 * run gio-querymodules in order to build the cache files required for
 * lazy loading.
 *
 * Since 2.56, this function should be named `g_io_<modulename>_query`, where
 * `modulename` is the plugin’s filename with the `lib` or `libgio` prefix and
 * everything after the first dot removed, and with `-` replaced with `_`
 * throughout. For example, `libgiognutls-helper.so` becomes `gnutls_helper`.
 * Using the new symbol names avoids name clashes when building modules
 * statically. The old symbol names continue to be supported, but cannot be used
 * for static builds.
 *
 * Returns: (transfer full): A %NULL-terminated array of strings,
 *     listing the supported extension points of the module. The array
 *     must be suitable for freeing with g_strfreev().
 *
 * Since: 2.24
 * }
function g_io_module_query:^Pchar;cdecl;external libgio2;
{$endif}
{ __G_IO_MODULE_H__  }

// === Konventiert am: 26-6-26 19:34:45 ===

function G_IO_TYPE_MODULE : TGType;
function G_IO_MODULE(obj : Pointer) : PGIOModule;
function G_IO_MODULE_CLASS(klass : Pointer) : PGIOModuleClass;
function G_IO_IS_MODULE(obj : Pointer) : Tgboolean;
function G_IO_IS_MODULE_CLASS(klass : Pointer) : Tgboolean;
function G_IO_MODULE_GET_CLASS(obj : Pointer) : PGIOModuleClass;

implementation

function G_IO_TYPE_MODULE : TGType;
  begin
    G_IO_TYPE_MODULE:=g_io_module_get_type;
  end;

function G_IO_MODULE(obj : Pointer) : PGIOModule;
begin
  Result := PGIOModule(g_type_check_instance_cast(obj, G_IO_TYPE_MODULE));
end;

function G_IO_MODULE_CLASS(klass : Pointer) : PGIOModuleClass;
begin
  Result := PGIOModuleClass(g_type_check_class_cast(klass, G_IO_TYPE_MODULE));
end;

function G_IO_IS_MODULE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_IO_TYPE_MODULE);
end;

function G_IO_IS_MODULE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_IO_TYPE_MODULE);
end;

function G_IO_MODULE_GET_CLASS(obj : Pointer) : PGIOModuleClass;
begin
  Result := PGIOModuleClass(PGTypeInstance(obj)^.g_class);
end;



end.
