unit as_context;

interface

uses
  fp_glib2;

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
{$ifndef __AS_CONTEXT_H}
{$define __AS_CONTEXT_H}
{$include <glib-object.h>}

{G_DECLARE_DERIVABLE_TYPE (AsContext, as_context, AS, CONTEXT, GObject) }
{< private > }
type
  PAsContextClass = ^TAsContextClass;
  TAsContextClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsFormatVersion:
 * @AS_FORMAT_VERSION_UNKNOWN:	Unknown format version
 * @AS_FORMAT_VERSION_V1_0:	1.0
 *
 * Format version / API level of the AppStream metadata.
 * }
{< private > }

  PAsFormatVersion = ^TAsFormatVersion;
  TAsFormatVersion =  Longint;
  Const
    AS_FORMAT_VERSION_UNKNOWN = 0;
    AS_FORMAT_VERSION_V1_0 = 1;
    AS_FORMAT_VERSION_LAST = 2;
;
  AS_FORMAT_VERSION_LATEST = AS_FORMAT_VERSION_V1_0;  

function as_format_version_to_string(version:TAsFormatVersion):Pgchar;cdecl;external libappstream;
function as_format_version_from_string(version_str:Pgchar):TAsFormatVersion;cdecl;external libappstream;
{*
 * AsFormatStyle:
 * @AS_FORMAT_STYLE_UNKNOWN:	The format style is unknown.
 * @AS_FORMAT_STYLE_METAINFO:	Parse AppStream upstream metadata (metainfo files)
 * @AS_FORMAT_STYLE_CATALOG:	Parse AppStream metadata catalog (shipped by software distributors)
 *
 * There are a few differences between AppStream's metainfo files (shipped by upstream projects)
 * and the catalog metadata (shipped by distributors).
 * The data source kind indicates which style we should process.
 * Usually you do not want to set this explicitly.
 * }
{< private > }
type
  PAsFormatStyle = ^TAsFormatStyle;
  TAsFormatStyle =  Longint;
  Const
    AS_FORMAT_STYLE_UNKNOWN = 0;
    AS_FORMAT_STYLE_METAINFO = 1;
    AS_FORMAT_STYLE_CATALOG = 2;
    AS_FORMAT_STYLE_LAST = 3;
;
{*
 * AsFormatKind:
 * @AS_FORMAT_KIND_UNKNOWN:		Unknown metadata format.
 * @AS_FORMAT_KIND_XML:			AppStream XML metadata.
 * @AS_FORMAT_KIND_YAML:		AppStream YAML (DEP-11) metadata.
 * @AS_FORMAT_KIND_DESKTOP_ENTRY:	XDG Desktop Entry data.
 *
 * Format of the AppStream metadata.
 * }
{< private > }
type
  PAsFormatKind = ^TAsFormatKind;
  TAsFormatKind =  Longint;
  Const
    AS_FORMAT_KIND_UNKNOWN = 0;
    AS_FORMAT_KIND_XML = 1;
    AS_FORMAT_KIND_YAML = 2;
    AS_FORMAT_KIND_DESKTOP_ENTRY = 3;
    AS_FORMAT_KIND_LAST = 4;
;

function as_format_kind_to_string(kind:TAsFormatKind):Pgchar;cdecl;external libappstream;
function as_format_kind_from_string(kind_str:Pgchar):TAsFormatKind;cdecl;external libappstream;
{*
 * AsValueFlags:
 * @AS_VALUE_FLAG_NONE:				No flags.
 * @AS_VALUE_FLAG_DUPLICATE_CHECK:		Check for duplicates when adding items to list values.
 * @AS_VALUE_FLAG_NO_TRANSLATION_FALLBACK:	Don't fall back to C when retrieving translated values.
 *
 * Set how values assigned to an #AsComponent should be treated when
 * they are set or retrieved.
  }
type
  PAsValueFlags = ^TAsValueFlags;
  TAsValueFlags =  Longint;
  Const
    AS_VALUE_FLAG_NONE = 0;
    AS_VALUE_FLAG_DUPLICATE_CHECK = 1 shl 0;
    AS_VALUE_FLAG_NO_TRANSLATION_FALLBACK = 1 shl 1;
;

function as_context_new:PAsContext;cdecl;external libappstream;
function as_context_get_format_version(ctx:PAsContext):TAsFormatVersion;cdecl;external libappstream;
procedure as_context_set_format_version(ctx:PAsContext; ver:TAsFormatVersion);cdecl;external libappstream;
function as_context_get_style(ctx:PAsContext):TAsFormatStyle;cdecl;external libappstream;
procedure as_context_set_style(ctx:PAsContext; style:TAsFormatStyle);cdecl;external libappstream;
function as_context_get_priority(ctx:PAsContext):Tgint;cdecl;external libappstream;
procedure as_context_set_priority(ctx:PAsContext; priority:Tgint);cdecl;external libappstream;
function as_context_get_origin(ctx:PAsContext):Pgchar;cdecl;external libappstream;
procedure as_context_set_origin(ctx:PAsContext; value:Pgchar);cdecl;external libappstream;
function as_context_get_locale(ctx:PAsContext):Pgchar;cdecl;external libappstream;
procedure as_context_set_locale(ctx:PAsContext; locale:Pgchar);cdecl;external libappstream;
function as_context_has_media_baseurl(ctx:PAsContext):Tgboolean;cdecl;external libappstream;
function as_context_get_media_baseurl(ctx:PAsContext):Pgchar;cdecl;external libappstream;
procedure as_context_set_media_baseurl(ctx:PAsContext; value:Pgchar);cdecl;external libappstream;
function as_context_get_locale_use_all(ctx:PAsContext):Tgboolean;cdecl;external libappstream;
function as_context_get_filename(ctx:PAsContext):Pgchar;cdecl;external libappstream;
procedure as_context_set_filename(ctx:PAsContext; fname:Pgchar);cdecl;external libappstream;
function as_context_get_value_flags(ctx:PAsContext):TAsValueFlags;cdecl;external libappstream;
procedure as_context_set_value_flags(ctx:PAsContext; flags:TAsValueFlags);cdecl;external libappstream;
{$endif}
{ __AS_CONTEXT_H  }

// === Konventiert am: 30-7-26 19:36:11 ===

function AS_TYPE_CONTEXT: TGType;
function AS_CONTEXT(obj: Pointer): PAsContext;
function AS_IS_CONTEXT(obj: Pointer): Tgboolean;
function AS_CONTEXT_CLASS(klass: Pointer): PAsContextClass;
function AS_IS_CONTEXT_CLASS(klass: Pointer): Tgboolean;
function AS_CONTEXT_GET_CLASS(obj: Pointer): PAsContextClass;

implementation

function AS_TYPE_CONTEXT: TGType;
begin
  Result := as_context_get_type;
end;

function AS_CONTEXT(obj: Pointer): PAsContext;
begin
  Result := PAsContext(g_type_check_instance_cast(obj, AS_TYPE_CONTEXT));
end;

function AS_IS_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_CONTEXT);
end;

function AS_CONTEXT_CLASS(klass: Pointer): PAsContextClass;
begin
  Result := PAsContextClass(g_type_check_class_cast(klass, AS_TYPE_CONTEXT));
end;

function AS_IS_CONTEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_CONTEXT);
end;

function AS_CONTEXT_GET_CLASS(obj: Pointer): PAsContextClass;
begin
  Result := PAsContextClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsContext = record
    parent_instance: TGObject;
  end;
  PAsContext = ^TAsContext;

  PAsContextClass = type Pointer;

function as_context_get_type: TGType; cdecl; external libgxxxxxxx;



end.
