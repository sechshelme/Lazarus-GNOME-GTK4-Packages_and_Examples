
unit as_utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_utils.h
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
PAsDataIdMatchFlags  = ^AsDataIdMatchFlags;
PAsMarkupKind  = ^AsMarkupKind;
PAsMetadataLocation  = ^AsMetadataLocation;
PAsUtilsError  = ^AsUtilsError;
Pgchar  = ^gchar;
PGError  = ^GError;
PGPtrArray  = ^GPtrArray;
PGString  = ^GString;
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
{$ifndef __AS_UTILS_H}
{$define __AS_UTILS_H}
{$include <glib-object.h>}
{$include "as-component.h"}
{*
 * AsUtilsError:
 * @AS_UTILS_ERROR_FAILED:		Generic failure
 *
 * The error type.
 * }
{< private > }
type
  PAsUtilsError = ^TAsUtilsError;
  TAsUtilsError =  Longint;
  Const
    AS_UTILS_ERROR_FAILED = 0;
    AS_UTILS_ERROR_LAST = 1;
;

{ was #define dname def_expr }
function AS_UTILS_ERROR : longint; { return type might be wrong }

{*
 * AsDataIdMatchFlags:
 * @AS_DATA_ID_MATCH_FLAG_NONE:		No flags set
 * @AS_DATA_ID_MATCH_FLAG_SCOPE:	Scope, e.g. a #AsComponentScope
 * @AS_DATA_ID_MATCH_FLAG_BUNDLE_KIND:	Bundle kind, e.g. a #AsBundleKind
 * @AS_DATA_ID_MATCH_FLAG_ORIGIN:	Origin
 * @AS_DATA_ID_MATCH_FLAG_ID:		Component AppStream ID
 * @AS_DATA_ID_MATCH_FLAG_BRANCH:	Branch
 *
 * The flags used when matching unique IDs.
 * }
{< private > }
type
  PAsDataIdMatchFlags = ^TAsDataIdMatchFlags;
  TAsDataIdMatchFlags =  Longint;
  Const
    AS_DATA_ID_MATCH_FLAG_NONE = 0;
    AS_DATA_ID_MATCH_FLAG_SCOPE = 1 shl 0;
    AS_DATA_ID_MATCH_FLAG_BUNDLE_KIND = 1 shl 1;
    AS_DATA_ID_MATCH_FLAG_ORIGIN = 1 shl 2;
    AS_DATA_ID_MATCH_FLAG_ID = 1 shl 3;
    AS_DATA_ID_MATCH_FLAG_BRANCH = 1 shl 4;
    AS_DATA_ID_MATCH_FLAG_LAST = (1 shl 4)+1;
;
{*
 * AsMetadataLocation:
 * @AS_METADATA_LOCATION_UNKNOWN:	An unknown/invalid location.
 * @AS_METADATA_LOCATION_SHARED:	Installed by the vendor, shared
 * @AS_METADATA_LOCATION_STATE:		Installed as metadata into /var/lib, shared
 * @AS_METADATA_LOCATION_CACHE:		Installed as metadata into /var/cache, shared
 * @AS_METADATA_LOCATION_USER:		Installed for the current user
 *
 * The flags used when installing and removing metadata files.
 * }
{< private > }
type
  PAsMetadataLocation = ^TAsMetadataLocation;
  TAsMetadataLocation =  Longint;
  Const
    AS_METADATA_LOCATION_UNKNOWN = 0;
    AS_METADATA_LOCATION_SHARED = 1;
    AS_METADATA_LOCATION_STATE = 2;
    AS_METADATA_LOCATION_CACHE = 3;
    AS_METADATA_LOCATION_USER = 4;
    AS_METADATA_LOCATION_LAST = 5;
;
{*
 * AsMarkupKind:
 * @AS_MARKUP_KIND_UNKNOWN:	Unknown markup.
 * @AS_MARKUP_KIND_XML:		XML markup.
 * @AS_MARKUP_KIND_TEXT:	Simple text with unicode symbols.
 * @AS_MARKUP_KIND_MARKDOWN:	Markdown
 *
 * Text markup types.
 * }
{< private > }
type
  PAsMarkupKind = ^TAsMarkupKind;
  TAsMarkupKind =  Longint;
  Const
    AS_MARKUP_KIND_UNKNOWN = 0;
    AS_MARKUP_KIND_XML = 1;
    AS_MARKUP_KIND_TEXT = 2;
    AS_MARKUP_KIND_MARKDOWN = 3;
    AS_MARKUP_KIND_LAST = 4;
;

function as_utils_error_quark:TGQuark;cdecl;external;
(* Const before type ignored *)
function as_markup_strsplit_words(text:Pgchar; line_len:Tguint):^Pgchar;cdecl;external;
(* Const before type ignored *)
function as_markup_convert(markup:Pgchar; to_kind:TAsMarkupKind; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_utils_locale_is_compatible(locale1:Pgchar; locale2:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function as_utils_posix_locale_to_bcp47(locale:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_utils_is_category_name(category_name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function as_utils_is_tld(tld:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function as_utils_is_desktop_environment(de_id:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_utils_get_desktop_environment_name(de_id:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_utils_is_gui_environment_style(env_style:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_utils_get_gui_environment_style_name(env_style:Pgchar):Pgchar;cdecl;external;
procedure as_utils_sort_components_into_categories(cpts:PGPtrArray; categories:PGPtrArray; check_duplicates:Tgboolean);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function as_utils_build_data_id(scope:TAsComponentScope; bundle_kind:TAsBundleKind; origin:Pgchar; cid:Pgchar; branch:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_utils_data_id_valid(data_id:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function as_utils_data_id_get_cid(data_id:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_utils_data_id_match(data_id1:Pgchar; data_id2:Pgchar; match_flags:TAsDataIdMatchFlags):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_utils_data_id_equal(data_id1:Pgchar; data_id2:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function as_utils_data_id_hash(data_id:Pgchar):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function as_gstring_replace(_string:PGString; find:Pgchar; replace:Pgchar; limit:Tguint):Tguint;cdecl;external;
(* Const before type ignored *)
function as_utils_is_platform_triplet(triplet:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function as_utils_install_metadata_file(location:TAsMetadataLocation; filename:Pgchar; origin:Pgchar; destdir:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function as_utils_guess_scope_from_path(path:Pgchar):TAsComponentScope;cdecl;external;
(* Const before type ignored *)
function as_utils_get_tag_search_weight(tag_name:Pgchar):Tguint16;cdecl;external;
{$endif}
{ __AS_UTILS_H  }

implementation

{ was #define dname def_expr }
function AS_UTILS_ERROR : longint; { return type might be wrong }
  begin
    AS_UTILS_ERROR:=as_utils_error_quark;
  end;


end.
