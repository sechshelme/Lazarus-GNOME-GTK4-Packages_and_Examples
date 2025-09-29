unit soup_cache;

interface

uses
  fp_glib2, fp_soup;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * soup-cache.h:
 *
 * Copyright (C) 2009, 2010 Igalia, S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}

{G_DECLARE_DERIVABLE_TYPE (SoupCache, soup_cache, SOUP, CACHE, GObject) }
type
  PSoupCacheability = ^TSoupCacheability;
  TSoupCacheability =  Longint;
  Const
    SOUP_CACHE_CACHEABLE = 1 shl 0;
    SOUP_CACHE_UNCACHEABLE = 1 shl 1;
    SOUP_CACHE_INVALIDATES = 1 shl 2;
    SOUP_CACHE_VALIDATES = 1 shl 3;
;
type
  PSoupCacheType = ^TSoupCacheType;
  TSoupCacheType =  Longint;
  Const
    SOUP_CACHE_SINGLE_USER = 0;
    SOUP_CACHE_SHARED = 1;
;
{ methods  }
type
  PSoupCacheClass = ^TSoupCacheClass;
  TSoupCacheClass = record
      parent_class : TGObjectClass;
      get_cacheability : function (cache:PSoupCache; msg:PSoupMessage):TSoupCacheability;cdecl;
      padding : array[0..3] of Tgpointer;
    end;


function soup_cache_new(cache_dir:Pchar; cache_type:TSoupCacheType):PSoupCache;cdecl;external libsoup;
procedure soup_cache_flush(cache:PSoupCache);cdecl;external libsoup;
procedure soup_cache_clear(cache:PSoupCache);cdecl;external libsoup;
procedure soup_cache_dump(cache:PSoupCache);cdecl;external libsoup;
procedure soup_cache_load(cache:PSoupCache);cdecl;external libsoup;
procedure soup_cache_set_max_size(cache:PSoupCache; max_size:Tguint);cdecl;external libsoup;
function soup_cache_get_max_size(cache:PSoupCache):Tguint;cdecl;external libsoup;

// === Konventiert am: 29-9-25 19:45:22 ===

function SOUP_TYPE_CACHE: TGType;
function SOUP_CACHE(obj: Pointer): PSoupCache;
function SOUP_IS_CACHE(obj: Pointer): Tgboolean;
function SOUP_CACHE_CLASS(klass: Pointer): PSoupCacheClass;
function SOUP_IS_CACHE_CLASS(klass: Pointer): Tgboolean;
function SOUP_CACHE_GET_CLASS(obj: Pointer): PSoupCacheClass;

implementation

function SOUP_TYPE_CACHE: TGType;
begin
  Result := soup_cache_get_type;
end;

function SOUP_CACHE(obj: Pointer): PSoupCache;
begin
  Result := PSoupCache(g_type_check_instance_cast(obj, SOUP_TYPE_CACHE));
end;

function SOUP_IS_CACHE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_CACHE);
end;

function SOUP_CACHE_CLASS(klass: Pointer): PSoupCacheClass;
begin
  Result := PSoupCacheClass(g_type_check_class_cast(klass, SOUP_TYPE_CACHE));
end;

function SOUP_IS_CACHE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SOUP_TYPE_CACHE);
end;

function SOUP_CACHE_GET_CLASS(obj: Pointer): PSoupCacheClass;
begin
  Result := PSoupCacheClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TSoupCache = record
    parent_instance: TGObject;
  end;
  PSoupCache = ^TSoupCache;

  TSoupCacheClass = record
  end;
  PSoupCacheClass = ^TSoupCacheClass;

function soup_cache_get_type: TGType; cdecl; external libgxxxxxxx;



end.
