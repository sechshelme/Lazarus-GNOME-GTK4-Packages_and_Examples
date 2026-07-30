
unit as_metadata;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_metadata.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_metadata.h
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
PAsComponent  = ^AsComponent;
PAsComponentBox  = ^AsComponentBox;
PAsMetadata  = ^AsMetadata;
PAsMetadataClass  = ^AsMetadataClass;
PAsMetadataError  = ^AsMetadataError;
PAsParseFlags  = ^AsParseFlags;
PAsReleaseList  = ^AsReleaseList;
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGError  = ^GError;
PGFile  = ^GFile;
PGPtrArray  = ^GPtrArray;
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
{$ifndef __AS_METADATA_H}
{$define __AS_METADATA_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include "as-context.h"}
{$include "as-component-box.h"}

{ was #define dname def_expr }
function AS_TYPE_METADATA : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AsMetadata, as_metadata, AS, METADATA, GObject) }
{< private > }
type
  PAsMetadataClass = ^TAsMetadataClass;
  TAsMetadataClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsParseFlags:
 * @AS_PARSE_FLAG_NONE:				No flags.
 * @AS_PARSE_FLAG_IGNORE_MEDIABASEURL:		Do not process the media_baseurl document property.
 *
 * Influence certain aspects of how AppStream metadata is parsed.
  }

  PAsParseFlags = ^TAsParseFlags;
  TAsParseFlags =  Longint;
  Const
    AS_PARSE_FLAG_NONE = 0;
    AS_PARSE_FLAG_IGNORE_MEDIABASEURL = 1 shl 0;
;
{*
 * AsMetadataError:
 * @AS_METADATA_ERROR_FAILED:			Generic failure.
 * @AS_METADATA_ERROR_PARSE:			Unable to parse the metadata file.
 * @AS_METADATA_ERROR_FORMAT_UNEXPECTED:	Expected catalog metadata but got metainfo metadata, or vice versa.
 * @AS_METADATA_ERROR_NO_COMPONENT:		We expected a component in the pool, but couldn't find one.
 * @AS_METADATA_ERROR_VALUE_MISSING:		A essential value is missing in the source document.
 *
 * A metadata processing error.
 * }
{< private > }
type
  PAsMetadataError = ^TAsMetadataError;
  TAsMetadataError =  Longint;
  Const
    AS_METADATA_ERROR_FAILED = 0;
    AS_METADATA_ERROR_PARSE = 1;
    AS_METADATA_ERROR_FORMAT_UNEXPECTED = 2;
    AS_METADATA_ERROR_NO_COMPONENT = 3;
    AS_METADATA_ERROR_VALUE_MISSING = 4;
    AS_METADATA_ERROR_LAST = 5;
;

{ was #define dname def_expr }
function AS_METADATA_ERROR : longint; { return type might be wrong }

(* Const before type ignored *)
function as_metadata_file_guess_style(filename:Pgchar):TAsFormatStyle;cdecl;external;
function as_metadata_new:PAsMetadata;cdecl;external;
function as_metadata_error_quark:TGQuark;cdecl;external;
function as_metadata_parse_file(metad:PAsMetadata; file:PGFile; format:TAsFormatKind; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function as_metadata_parse_data(metad:PAsMetadata; data:Pgchar; data_len:Tgssize; format:TAsFormatKind; error:PPGError):Tgboolean;cdecl;external;
function as_metadata_parse_bytes(metad:PAsMetadata; bytes:PGBytes; format:TAsFormatKind; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_metadata_parse_desktop_data(metad:PAsMetadata; cid:Pgchar; data:Pgchar; data_len:Tgssize; error:PPGError):Tgboolean;cdecl;external;
function as_metadata_component_to_metainfo(metad:PAsMetadata; format:TAsFormatKind; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_metadata_save_metainfo(metad:PAsMetadata; fname:Pgchar; format:TAsFormatKind; error:PPGError):Tgboolean;cdecl;external;
function as_metadata_components_to_catalog(metad:PAsMetadata; format:TAsFormatKind; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_metadata_save_catalog(metad:PAsMetadata; fname:Pgchar; format:TAsFormatKind; error:PPGError):Tgboolean;cdecl;external;
function as_metadata_get_component(metad:PAsMetadata):PAsComponent;cdecl;external;
function as_metadata_get_components(metad:PAsMetadata):PAsComponentBox;cdecl;external;
procedure as_metadata_clear_components(metad:PAsMetadata);cdecl;external;
procedure as_metadata_add_component(metad:PAsMetadata; cpt:PAsComponent);cdecl;external;
function as_metadata_parse_releases_bytes(metad:PAsMetadata; bytes:PGBytes; error:PPGError):Tgboolean;cdecl;external;
function as_metadata_parse_releases_file(metad:PAsMetadata; file:PGFile; error:PPGError):Tgboolean;cdecl;external;
function as_metadata_releases_to_data(metad:PAsMetadata; releases:PAsReleaseList; error:PPGError):Pgchar;cdecl;external;
function as_metadata_get_release_list(metad:PAsMetadata):PAsReleaseList;cdecl;external;
function as_metadata_get_release_lists(metad:PAsMetadata):PGPtrArray;cdecl;external;
procedure as_metadata_clear_releases(metad:PAsMetadata);cdecl;external;
function as_metadata_get_format_version(metad:PAsMetadata):TAsFormatVersion;cdecl;external;
procedure as_metadata_set_format_version(metad:PAsMetadata; version:TAsFormatVersion);cdecl;external;
function as_metadata_get_format_style(metad:PAsMetadata):TAsFormatStyle;cdecl;external;
procedure as_metadata_set_format_style(metad:PAsMetadata; mode:TAsFormatStyle);cdecl;external;
(* Const before type ignored *)
procedure as_metadata_set_locale(metad:PAsMetadata; locale:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_metadata_get_locale(metad:PAsMetadata):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_metadata_get_origin(metad:PAsMetadata):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_metadata_set_origin(metad:PAsMetadata; origin:Pgchar);cdecl;external;
function as_metadata_get_update_existing(metad:PAsMetadata):Tgboolean;cdecl;external;
procedure as_metadata_set_update_existing(metad:PAsMetadata; update:Tgboolean);cdecl;external;
function as_metadata_get_write_header(metad:PAsMetadata):Tgboolean;cdecl;external;
procedure as_metadata_set_write_header(metad:PAsMetadata; wheader:Tgboolean);cdecl;external;
(* Const before type ignored *)
function as_metadata_get_media_baseurl(metad:PAsMetadata):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_metadata_set_media_baseurl(metad:PAsMetadata; url:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_metadata_get_architecture(metad:PAsMetadata):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_metadata_set_architecture(metad:PAsMetadata; arch:Pgchar);cdecl;external;
function as_metadata_get_parse_flags(metad:PAsMetadata):TAsParseFlags;cdecl;external;
procedure as_metadata_set_parse_flags(metad:PAsMetadata; flags:TAsParseFlags);cdecl;external;
{$endif}
{ __AS_METADATA_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_METADATA : longint; { return type might be wrong }
  begin
    AS_TYPE_METADATA:=as_metadata_get_type;
  end;

{ was #define dname def_expr }
function AS_METADATA_ERROR : longint; { return type might be wrong }
  begin
    AS_METADATA_ERROR:=as_metadata_error_quark;
  end;


end.
