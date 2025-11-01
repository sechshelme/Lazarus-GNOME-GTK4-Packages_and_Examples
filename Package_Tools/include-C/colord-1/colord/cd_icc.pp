
unit cd_icc;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_icc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_icc.h
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
PCdColorXYZ  = ^CdColorXYZ;
PCdColorYxy  = ^CdColorYxy;
PCdEdid  = ^CdEdid;
PCdIcc  = ^CdIcc;
PCdIccClass  = ^CdIccClass;
PCdIccError  = ^CdIccError;
PCdIccLoadFlags  = ^CdIccLoadFlags;
PCdIccSaveFlags  = ^CdIccSaveFlags;
PGArray  = ^GArray;
PGBytes  = ^GBytes;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGDateTime  = ^GDateTime;
PGError  = ^GError;
PGFile  = ^GFile;
PGHashTable  = ^GHashTable;
PGPtrArray  = ^GPtrArray;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2013 Richard Hughes <richard@hughsie.com>
 * Copyright (C) 2020 NVIDIA CORPORATION
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
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
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__COLORD_H_INSIDE__) && !defined (CD_COMPILATION)}
{$error "Only <colord.h> can be included directly."}
{$endif}
{$ifndef __CD_ICC_H}
{$define __CD_ICC_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include "cd-color.h"}
{$include "cd-enum.h"}
{$include "cd-edid.h"}

{ was #define dname def_expr }
function CD_ICC_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_ICC_TYPE_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_ICC : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (CdIcc, cd_icc, CD, ICC, GObject) }
{*
 * CdIccError:
 * @CD_ICC_ERROR_FAILED_TO_OPEN:	Failed to open file
 * @CD_ICC_ERROR_FAILED_TO_PARSE:	Failed to parse data
 * @CD_ICC_ERROR_INVALID_LOCALE:	Locale was invalid
 * @CD_ICC_ERROR_NO_DATA:		No data to read
 * @CD_ICC_ERROR_FAILED_TO_SAVE:	Failed to save file
 * @CD_ICC_ERROR_FAILED_TO_CREATE:	Failed to create file
 * @CD_ICC_ERROR_INVALID_COLORSPACE:	Invalid colorspace
 * @CD_ICC_ERROR_CORRUPTION_DETECTED:	Corruption has been detected
 * @CD_ICC_ERROR_INTERNAL:		Something inside LCMS broke
 *
 * The ICC error code.
 * }
{ Since: 0.1.32  }
{ Since: 0.1.32  }
{ Since: 0.1.32  }
{ Since: 0.1.32  }
{ Since: 0.1.32  }
{ Since: 0.1.32  }
{ Since: 0.1.34  }
{ Since: 1.1.1  }
{ Since: 1.1.1  }
{< private > }
type
  PCdIccError = ^TCdIccError;
  TCdIccError =  Longint;
  Const
    CD_ICC_ERROR_FAILED_TO_OPEN = 0;
    CD_ICC_ERROR_FAILED_TO_PARSE = 1;
    CD_ICC_ERROR_INVALID_LOCALE = 2;
    CD_ICC_ERROR_NO_DATA = 3;
    CD_ICC_ERROR_FAILED_TO_SAVE = 4;
    CD_ICC_ERROR_FAILED_TO_CREATE = 5;
    CD_ICC_ERROR_INVALID_COLORSPACE = 6;
    CD_ICC_ERROR_CORRUPTION_DETECTED = 7;
    CD_ICC_ERROR_INTERNAL = 8;
    CD_ICC_ERROR_LAST = 9;
;
{< private > }
{ Padding for future expansion  }
type
  PCdIccClass = ^TCdIccClass;
  TCdIccClass = record
      parent_class : TGObjectClass;
      _cd_icc_reserved1 : procedure ;cdecl;
      _cd_icc_reserved2 : procedure ;cdecl;
      _cd_icc_reserved3 : procedure ;cdecl;
      _cd_icc_reserved4 : procedure ;cdecl;
      _cd_icc_reserved5 : procedure ;cdecl;
      _cd_icc_reserved6 : procedure ;cdecl;
      _cd_icc_reserved7 : procedure ;cdecl;
      _cd_icc_reserved8 : procedure ;cdecl;
    end;

{*
 * CdIccLoadFlags:
 * @CD_ICC_LOAD_FLAGS_NONE:		No flags set.
 * @CD_ICC_LOAD_FLAGS_NAMED_COLORS:	Parse any named colors in the profile.
 * @CD_ICC_LOAD_FLAGS_TRANSLATIONS:	Parse all translations in the profile.
 * @CD_ICC_LOAD_FLAGS_METADATA:		Parse the metadata in the profile.
 * @CD_ICC_LOAD_FLAGS_FALLBACK_MD5:	Calculate the profile MD5 if a profile
 * 					ID was not supplied in the profile.
 * @CD_ICC_LOAD_FLAGS_PRIMARIES:	Parse the primaries in the profile.
 * @CD_ICC_LOAD_FLAGS_CHARACTERIZATION:	Load the characterization data from the profile
 *
 * Flags used when loading an ICC profile.
 *
 * Since: 0.1.32
 * }
{ Since: 0.1.32  }
{ Since: 0.1.32  }
{ Since: 0.1.32  }
{ Since: 0.1.32  }
{ Since: 0.1.32  }
{ Since: 0.1.32  }
{ Since: 1.1.1  }
{ new entries go here:  }
{ Since: 0.1.32  }
{< private > }

  PCdIccLoadFlags = ^TCdIccLoadFlags;
  TCdIccLoadFlags =  Longint;
  Const
    CD_ICC_LOAD_FLAGS_NONE = 0;
    CD_ICC_LOAD_FLAGS_NAMED_COLORS = 1 shl 0;
    CD_ICC_LOAD_FLAGS_TRANSLATIONS = 1 shl 1;
    CD_ICC_LOAD_FLAGS_METADATA = 1 shl 2;
    CD_ICC_LOAD_FLAGS_FALLBACK_MD5 = 1 shl 3;
    CD_ICC_LOAD_FLAGS_PRIMARIES = 1 shl 4;
    CD_ICC_LOAD_FLAGS_CHARACTERIZATION = 1 shl 5;
    CD_ICC_LOAD_FLAGS_ALL = $ff;
    CD_ICC_LOAD_FLAGS_LAST = 256;
;
{*
 * CdIccSaveFlags:
 * @CD_ICC_SAVE_FLAGS_NONE:		No flags set.
 *
 * Flags used when saving an ICC profile.
 *
 * Since: 0.1.32
 * }
{ Since: 0.1.32  }
{< private > }
type
  PCdIccSaveFlags = ^TCdIccSaveFlags;
  TCdIccSaveFlags =  Longint;
  Const
    CD_ICC_SAVE_FLAGS_NONE = 0;
    CD_ICC_SAVE_FLAGS_LAST = 1;
;

function cd_icc_error_quark:TGQuark;cdecl;external;
function cd_icc_new:PCdIcc;cdecl;external;
(* Const before type ignored *)
function cd_icc_load_data(icc:PCdIcc; data:Pguint8; data_len:Tgsize; flags:TCdIccLoadFlags; error:PPGError):Tgboolean;cdecl;external;
function cd_icc_load_file(icc:PCdIcc; file:PGFile; flags:TCdIccLoadFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_icc_load_fd(icc:PCdIcc; fd:Tgint; flags:TCdIccLoadFlags; error:PPGError):Tgboolean;cdecl;external;
function cd_icc_load_handle(icc:PCdIcc; handle:Tgpointer; flags:TCdIccLoadFlags; error:PPGError):Tgboolean;cdecl;external;
function cd_icc_save_data(icc:PCdIcc; flags:TCdIccSaveFlags; error:PPGError):PGBytes;cdecl;external;
function cd_icc_save_file(icc:PCdIcc; file:PGFile; flags:TCdIccSaveFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_icc_save_default(icc:PCdIcc; flags:TCdIccSaveFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_icc_to_string(icc:PCdIcc):Pgchar;cdecl;external;
function cd_icc_get_handle(icc:PCdIcc):Tgpointer;cdecl;external;
function cd_icc_get_context(icc:PCdIcc):Tgpointer;cdecl;external;
function cd_icc_get_size(icc:PCdIcc):Tguint32;cdecl;external;
(* Const before type ignored *)
function cd_icc_get_filename(icc:PCdIcc):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure cd_icc_set_filename(icc:PCdIcc; filename:Pgchar);cdecl;external;
function cd_icc_get_version(icc:PCdIcc):Tgdouble;cdecl;external;
procedure cd_icc_set_version(icc:PCdIcc; version:Tgdouble);cdecl;external;
function cd_icc_get_kind(icc:PCdIcc):TCdProfileKind;cdecl;external;
procedure cd_icc_set_kind(icc:PCdIcc; kind:TCdProfileKind);cdecl;external;
function cd_icc_get_colorspace(icc:PCdIcc):TCdColorspace;cdecl;external;
procedure cd_icc_set_colorspace(icc:PCdIcc; colorspace:TCdColorspace);cdecl;external;
function cd_icc_get_metadata(icc:PCdIcc):PGHashTable;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_icc_get_metadata_item(icc:PCdIcc; key:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_icc_add_metadata(icc:PCdIcc; key:Pgchar; value:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure cd_icc_remove_metadata(icc:PCdIcc; key:Pgchar);cdecl;external;
function cd_icc_get_named_colors(icc:PCdIcc):PGPtrArray;cdecl;external;
function cd_icc_get_can_delete(icc:PCdIcc):Tgboolean;cdecl;external;
function cd_icc_get_created(icc:PCdIcc):PGDateTime;cdecl;external;
procedure cd_icc_set_created(icc:PCdIcc; creation_time:PGDateTime);cdecl;external;
(* Const before type ignored *)
function cd_icc_get_checksum(icc:PCdIcc):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_icc_get_description(icc:PCdIcc; locale:Pgchar; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_icc_get_characterization_data(icc:PCdIcc):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure cd_icc_set_characterization_data(icc:PCdIcc; data:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_icc_get_copyright(icc:PCdIcc; locale:Pgchar; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_icc_get_manufacturer(icc:PCdIcc; locale:Pgchar; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_icc_get_model(icc:PCdIcc; locale:Pgchar; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_icc_set_description(icc:PCdIcc; locale:Pgchar; value:Pgchar);cdecl;external;
procedure cd_icc_set_description_items(icc:PCdIcc; values:PGHashTable);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_icc_set_copyright(icc:PCdIcc; locale:Pgchar; value:Pgchar);cdecl;external;
procedure cd_icc_set_copyright_items(icc:PCdIcc; values:PGHashTable);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_icc_set_manufacturer(icc:PCdIcc; locale:Pgchar; value:Pgchar);cdecl;external;
procedure cd_icc_set_manufacturer_items(icc:PCdIcc; values:PGHashTable);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_icc_set_model(icc:PCdIcc; locale:Pgchar; value:Pgchar);cdecl;external;
procedure cd_icc_set_model_items(icc:PCdIcc; values:PGHashTable);cdecl;external;
(* Const before type ignored *)
function cd_icc_get_red(icc:PCdIcc):PCdColorXYZ;cdecl;external;
(* Const before type ignored *)
function cd_icc_get_green(icc:PCdIcc):PCdColorXYZ;cdecl;external;
(* Const before type ignored *)
function cd_icc_get_blue(icc:PCdIcc):PCdColorXYZ;cdecl;external;
(* Const before type ignored *)
function cd_icc_get_white(icc:PCdIcc):PCdColorXYZ;cdecl;external;
function cd_icc_get_temperature(icc:PCdIcc):Tguint;cdecl;external;
function cd_icc_get_warnings(icc:PCdIcc):PGArray;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cd_icc_create_from_edid(icc:PCdIcc; gamma_value:Tgdouble; red:PCdColorYxy; green:PCdColorYxy; blue:PCdColorYxy; 
           white:PCdColorYxy; error:PPGError):Tgboolean;cdecl;external;
function cd_icc_create_from_edid_data(icc:PCdIcc; edid:PCdEdid; error:PPGError):Tgboolean;cdecl;external;
function cd_icc_create_default(icc:PCdIcc; error:PPGError):Tgboolean;cdecl;external;
function cd_icc_create_default_full(icc:PCdIcc; flags:TCdIccLoadFlags; error:PPGError):Tgboolean;cdecl;external;
function cd_icc_get_vcgt(icc:PCdIcc; size:Tguint; error:PPGError):PGPtrArray;cdecl;external;
function cd_icc_set_vcgt(icc:PCdIcc; vcgt:PGPtrArray; error:PPGError):Tgboolean;cdecl;external;
function cd_icc_get_response(icc:PCdIcc; size:Tguint; error:PPGError):PGPtrArray;cdecl;external;
function cd_icc_get_tags(icc:PCdIcc; error:PPGError):^Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_icc_get_tag_data(icc:PCdIcc; tag:Pgchar; error:PPGError):PGBytes;cdecl;external;
(* Const before type ignored *)
function cd_icc_set_tag_data(icc:PCdIcc; tag:Pgchar; data:PGBytes; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __CD_ICC_H  }

implementation

{ was #define dname def_expr }
function CD_ICC_ERROR : longint; { return type might be wrong }
  begin
    CD_ICC_ERROR:=cd_icc_error_quark;
  end;

{ was #define dname def_expr }
function CD_ICC_TYPE_ERROR : longint; { return type might be wrong }
  begin
    CD_ICC_TYPE_ERROR:=cd_icc_error_get_type;
  end;

{ was #define dname def_expr }
function CD_TYPE_ICC : longint; { return type might be wrong }
  begin
    CD_TYPE_ICC:=cd_icc_get_type;
  end;


end.
