unit as_pool;

interface

uses
  fp_glib2, fp_appstream;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2012-2024 Matthias Klumpp <matthias@tenstral.net>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the license, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
  }
{$if !defined(__APPSTREAM_H) && !defined(AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
{$ifndef __AS_POOL_H}
{$define __AS_POOL_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include "as-component.h"}
{$include "as-component-box.h"}

{G_DECLARE_DERIVABLE_TYPE (AsPool, as_pool, AS, POOL, GObject) }
{< private > }
type
  PAsPoolClass = ^TAsPoolClass;
  TAsPoolClass = record
      parent_class : TGObjectClass;
      changed : procedure (pool:PAsPool);cdecl;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
    end;

{*
 * AsPoolFlags:
 * @AS_POOL_FLAG_NONE:			No flags.
 * @AS_POOL_FLAG_LOAD_OS_CATALOG:	Load AppStream catalog metadata from OS locations.
 * @AS_POOL_FLAG_LOAD_OS_METAINFO:	Load MetaInfo data from OS locations.
 * @AS_POOL_FLAG_LOAD_OS_DESKTOP_FILES:	Load components from desktop-entry files in OS locations.
 * @AS_POOL_FLAG_LOAD_FLATPAK:		Load AppStream catalog metadata from Flatpak.
 * @AS_POOL_FLAG_IGNORE_CACHE_AGE:	Load fresh data even if an up-o-date cache is available.
 * @AS_POOL_FLAG_RESOLVE_ADDONS:	Always resolve addons for returned components.
 * @AS_POOL_FLAG_PREFER_OS_METAINFO:	Prefer local metainfo data over the system-provided catalog data. Useful for previewing local data.
 * @AS_POOL_FLAG_MONITOR:		Monitor registered directories for changes, and auto-reload metadata if necessary.
 *
 * Flags controlling the metadata pool behavior.
 * }

  PAsPoolFlags = ^TAsPoolFlags;
  TAsPoolFlags =  Longint;
  Const
    AS_POOL_FLAG_NONE = 0;
    AS_POOL_FLAG_LOAD_OS_CATALOG = 1 shl 0;
    AS_POOL_FLAG_LOAD_OS_METAINFO = 1 shl 1;
    AS_POOL_FLAG_LOAD_OS_DESKTOP_FILES = 1 shl 2;
    AS_POOL_FLAG_LOAD_FLATPAK = 1 shl 3;
    AS_POOL_FLAG_IGNORE_CACHE_AGE = 1 shl 4;
    AS_POOL_FLAG_RESOLVE_ADDONS = 1 shl 5;
    AS_POOL_FLAG_PREFER_OS_METAINFO = 1 shl 6;
    AS_POOL_FLAG_MONITOR = 1 shl 7;
;
{*
 * AsCacheFlags:
 * @AS_CACHE_FLAG_NONE:			No flags.
 * @AS_CACHE_FLAG_USE_USER:		Create an user-specific metadata cache.
 * @AS_CACHE_FLAG_USE_SYSTEM:		Use and - if possible - update the system metadata cache.
 * @AS_CACHE_FLAG_NO_CLEAR:		Don't clear the cache when opening it.
 * @AS_CACHE_FLAG_REFRESH_SYSTEM:	Refresh the system cache that is shared between applications.
 *
 * Flags on how caching should be used.
 * }
type
  PAsCacheFlags = ^TAsCacheFlags;
  TAsCacheFlags =  Longint;
  Const
    AS_CACHE_FLAG_NONE = 0;
    AS_CACHE_FLAG_USE_USER = 1 shl 0;
    AS_CACHE_FLAG_USE_SYSTEM = 1 shl 1;
    AS_CACHE_FLAG_NO_CLEAR = 1 shl 2;
    AS_CACHE_FLAG_REFRESH_SYSTEM = 1 shl 3;
;
{*
 * AsPoolError:
 * @AS_POOL_ERROR_FAILED:		Generic failure
 * @AS_POOL_ERROR_INCOMPLETE:		The pool was loaded, but we had to ignore some metadata.
 * @AS_POOL_ERROR_COLLISION:		An AppStream-ID collision occured (a component with that ID already existed in the pool)
 * @AS_POOL_ERROR_CACHE_WRITE_FAILED:	Unable to write to *any* cache file (not even tmpfs writes worked)
 * @AS_POOL_ERROR_CACHE_DAMAGED:	The disk cache was broken and we could not automatically recover.
 *
 * A metadata pool error.
 * }
{< private > }
type
  PAsPoolError = ^TAsPoolError;
  TAsPoolError =  Longint;
  Const
    AS_POOL_ERROR_FAILED = 0;
    AS_POOL_ERROR_INCOMPLETE = 1;
    AS_POOL_ERROR_COLLISION = 2;
    AS_POOL_ERROR_CACHE_WRITE_FAILED = 3;
    AS_POOL_ERROR_CACHE_DAMAGED = 4;
    AS_POOL_ERROR_LAST = 5;
;

{ was #define dname def_expr }
function AS_POOL_ERROR : longint; { return type might be wrong }

function as_pool_error_quark:TGQuark;cdecl;external libappstream;
function as_pool_new:PAsPool;cdecl;external libappstream;
function as_pool_get_locale(pool:PAsPool):Pgchar;cdecl;external libappstream;
procedure as_pool_set_locale(pool:PAsPool; locale:Pgchar);cdecl;external libappstream;
function as_pool_load(pool:PAsPool; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libappstream;
procedure as_pool_load_async(pool:PAsPool; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libappstream;
function as_pool_load_finish(pool:PAsPool; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libappstream;
function as_pool_is_empty(pool:PAsPool):Tgboolean;cdecl;external libappstream;
procedure as_pool_clear(pool:PAsPool);cdecl;external libappstream;
function as_pool_add_components(pool:PAsPool; cbox:PAsComponentBox; error:PPGError):Tgboolean;cdecl;external libappstream;
function as_pool_get_components(pool:PAsPool):PAsComponentBox;cdecl;external libappstream;
function as_pool_get_components_by_id(pool:PAsPool; cid:Pgchar):PAsComponentBox;cdecl;external libappstream;
function as_pool_get_components_by_provided_item(pool:PAsPool; kind:TAsProvidedKind; item:Pgchar):PAsComponentBox;cdecl;external libappstream;
function as_pool_get_components_by_kind(pool:PAsPool; kind:TAsComponentKind):PAsComponentBox;cdecl;external libappstream;
function as_pool_get_components_by_categories(pool:PAsPool; categories:PPgchar):PAsComponentBox;cdecl;external libappstream;
function as_pool_get_components_by_launchable(pool:PAsPool; kind:TAsLaunchableKind; id:Pgchar):PAsComponentBox;cdecl;external libappstream;
function as_pool_get_components_by_extends(pool:PAsPool; extended_id:Pgchar):PAsComponentBox;cdecl;external libappstream;
function as_pool_get_components_by_bundle_id(pool:PAsPool; kind:TAsBundleKind; bundle_id:Pgchar; match_prefix:Tgboolean):PAsComponentBox;cdecl;external libappstream;
function as_pool_search(pool:PAsPool; search:Pgchar):PAsComponentBox;cdecl;external libappstream;
function as_pool_build_search_tokens(pool:PAsPool; search:Pgchar):^Pgchar;cdecl;external libappstream;
procedure as_pool_reset_extra_data_locations(pool:PAsPool);cdecl;external libappstream;
procedure as_pool_add_extra_data_location(pool:PAsPool; directory:Pgchar; format_style:TAsFormatStyle);cdecl;external libappstream;
function as_pool_get_flags(pool:PAsPool):TAsPoolFlags;cdecl;external libappstream;
procedure as_pool_set_flags(pool:PAsPool; flags:TAsPoolFlags);cdecl;external libappstream;
procedure as_pool_add_flags(pool:PAsPool; flags:TAsPoolFlags);cdecl;external libappstream;
procedure as_pool_remove_flags(pool:PAsPool; flags:TAsPoolFlags);cdecl;external libappstream;
procedure as_pool_set_load_std_data_locations(pool:PAsPool; enabled:Tgboolean);cdecl;external libappstream;
{$endif}
{ __AS_POOL_H  }

// === Konventiert am: 30-7-26 19:35:43 ===

function AS_TYPE_POOL: TGType;
function AS_POOL(obj: Pointer): PAsPool;
function AS_IS_POOL(obj: Pointer): Tgboolean;
function AS_POOL_CLASS(klass: Pointer): PAsPoolClass;
function AS_IS_POOL_CLASS(klass: Pointer): Tgboolean;
function AS_POOL_GET_CLASS(obj: Pointer): PAsPoolClass;

implementation

function AS_TYPE_POOL: TGType;
begin
  Result := as_pool_get_type;
end;

function AS_POOL(obj: Pointer): PAsPool;
begin
  Result := PAsPool(g_type_check_instance_cast(obj, AS_TYPE_POOL));
end;

function AS_IS_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_POOL);
end;

function AS_POOL_CLASS(klass: Pointer): PAsPoolClass;
begin
  Result := PAsPoolClass(g_type_check_class_cast(klass, AS_TYPE_POOL));
end;

function AS_IS_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_POOL);
end;

function AS_POOL_GET_CLASS(obj: Pointer): PAsPoolClass;
begin
  Result := PAsPoolClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsPool = record
    parent_instance: TGObject;
  end;
  PAsPool = ^TAsPool;

  PAsPoolClass = type Pointer;

function as_pool_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function AS_POOL_ERROR : longint; { return type might be wrong }
  begin
    AS_POOL_ERROR:=as_pool_error_quark;
  end;


end.
