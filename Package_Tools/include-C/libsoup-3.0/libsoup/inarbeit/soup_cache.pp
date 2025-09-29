
unit soup_cache;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_cache.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_cache.h
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
PSoupCache  = ^SoupCache;
PSoupCacheability  = ^SoupCacheability;
PSoupCacheClass  = ^SoupCacheClass;
PSoupCacheType  = ^SoupCacheType;
PSoupMessage  = ^SoupMessage;
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

{ was #define dname def_expr }
function SOUP_TYPE_CACHE : longint; { return type might be wrong }

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

(* Const before type ignored *)

function soup_cache_new(cache_dir:Pchar; cache_type:TSoupCacheType):PSoupCache;cdecl;external;
procedure soup_cache_flush(cache:PSoupCache);cdecl;external;
procedure soup_cache_clear(cache:PSoupCache);cdecl;external;
procedure soup_cache_dump(cache:PSoupCache);cdecl;external;
procedure soup_cache_load(cache:PSoupCache);cdecl;external;
procedure soup_cache_set_max_size(cache:PSoupCache; max_size:Tguint);cdecl;external;
function soup_cache_get_max_size(cache:PSoupCache):Tguint;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_CACHE : longint; { return type might be wrong }
  begin
    SOUP_TYPE_CACHE:=soup_cache_get_type;
  end;


end.
