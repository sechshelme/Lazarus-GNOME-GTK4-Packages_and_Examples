
unit shumate_file_cache;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_file_cache.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_file_cache.h
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
PGAsyncResult  = ^GAsyncResult;
PGBytes  = ^GBytes;
PGCancellable  = ^GCancellable;
PGDateTime  = ^GDateTime;
PGError  = ^GError;
PShumateFileCache  = ^ShumateFileCache;
PShumateFileCacheError  = ^ShumateFileCacheError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2009 Pierre-Luc Beaudoin <pierre-luc@pierlux.com>
 * Copyright (C) 2010-2013 Jiri Techet <techet@gmail.com>
 * Copyright (C) 2019 Marcus Lundblad <ml@update.uu.se>
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$if !defined (__SHUMATE_SHUMATE_H_INSIDE__) && !defined (SHUMATE_COMPILATION)}
{$error "Only <shumate/shumate.h> can be included directly."}
{$endif}
{$ifndef _SHUMATE_FILE_CACHE_H_}
{$define _SHUMATE_FILE_CACHE_H_}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{*
 * SHUMATE_FILE_CACHE_ERROR:
 *
 * Error domain for errors that may occur while storing or retrieving tiles
 * from a #ShumateFileCache. Errors in this domain will be from the
 * #ShumateFileCacheError enum.
  }

{ was #define dname def_expr }
function SHUMATE_FILE_CACHE_ERROR : longint; { return type might be wrong }

function shumate_file_cache_error_quark:TGQuark;cdecl;external;
{*
 * ShumateFileCacheError:
 * @SHUMATE_FILE_CACHE_ERROR_FAILED: An unspecified error occurred during the operation.
 *
 * Error codes in the #SHUMATE_FILE_CACHE_ERROR domain.
  }
type
  PShumateFileCacheError = ^TShumateFileCacheError;
  TShumateFileCacheError =  Longint;
  Const
    SHUMATE_FILE_CACHE_ERROR_FAILED = 0;
;

{ was #define dname def_expr }
function SHUMATE_TYPE_FILE_CACHE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateFileCache, shumate_file_cache, SHUMATE, FILE_CACHE, GObject) }
(* Const before type ignored *)
(* Const before type ignored *)
function shumate_file_cache_new_full(size_limit:Tguint; cache_key:Pchar; cache_dir:Pchar):PShumateFileCache;cdecl;external;
function shumate_file_cache_get_size_limit(self:PShumateFileCache):Tguint;cdecl;external;
procedure shumate_file_cache_set_size_limit(self:PShumateFileCache; size_limit:Tguint);cdecl;external;
(* Const before type ignored *)
function shumate_file_cache_get_cache_dir(self:PShumateFileCache):Pchar;cdecl;external;
(* Const before type ignored *)
function shumate_file_cache_get_cache_key(self:PShumateFileCache):Pchar;cdecl;external;
procedure shumate_file_cache_purge_cache_async(self:PShumateFileCache; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function shumate_file_cache_purge_cache_finish(self:PShumateFileCache; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure shumate_file_cache_get_tile_async(self:PShumateFileCache; x:longint; y:longint; zoom_level:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function shumate_file_cache_get_tile_finish(self:PShumateFileCache; etag:PPchar; modtime:PPGDateTime; result:PGAsyncResult; error:PPGError):PGBytes;cdecl;external;
(* Const before type ignored *)
procedure shumate_file_cache_store_tile_async(self:PShumateFileCache; x:longint; y:longint; zoom_level:longint; bytes:PGBytes; 
            etag:Pchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function shumate_file_cache_store_tile_finish(self:PShumateFileCache; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure shumate_file_cache_mark_up_to_date(self:PShumateFileCache; x:longint; y:longint; zoom_level:longint);cdecl;external;
{$endif}
{ _SHUMATE_FILE_CACHE_H_  }

implementation

{ was #define dname def_expr }
function SHUMATE_FILE_CACHE_ERROR : longint; { return type might be wrong }
  begin
    SHUMATE_FILE_CACHE_ERROR:=shumate_file_cache_error_quark;
  end;

{ was #define dname def_expr }
function SHUMATE_TYPE_FILE_CACHE : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_FILE_CACHE:=shumate_file_cache_get_type;
  end;


end.
