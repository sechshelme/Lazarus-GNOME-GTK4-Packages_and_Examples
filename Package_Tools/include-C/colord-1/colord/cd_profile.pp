
unit cd_profile;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_profile.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_profile.h
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
PCdIcc  = ^CdIcc;
PCdProfile  = ^CdProfile;
PCdProfileClass  = ^CdProfileClass;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2010-2012 Richard Hughes <richard@hughsie.com>
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
{$ifndef __CD_PROFILE_H}
{$define __CD_PROFILE_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include "cd-enum.h"}
{$include "cd-icc.h"}

{ was #define dname def_expr }
function CD_PROFILE_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_PROFILE_TYPE_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_PROFILE : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (CdProfile, cd_profile, CD, PROFILE, GObject) }
{< private > }
{ Padding for future expansion  }
type
  PCdProfileClass = ^TCdProfileClass;
  TCdProfileClass = record
      parent_class : TGObjectClass;
      changed : procedure (profile:PCdProfile);cdecl;
      _cd_profile_reserved1 : procedure ;cdecl;
      _cd_profile_reserved2 : procedure ;cdecl;
      _cd_profile_reserved3 : procedure ;cdecl;
      _cd_profile_reserved4 : procedure ;cdecl;
      _cd_profile_reserved5 : procedure ;cdecl;
      _cd_profile_reserved6 : procedure ;cdecl;
      _cd_profile_reserved7 : procedure ;cdecl;
      _cd_profile_reserved8 : procedure ;cdecl;
    end;


function cd_profile_error_quark:TGQuark;cdecl;external;
function cd_profile_new:PCdProfile;cdecl;external;
(* Const before type ignored *)
function cd_profile_new_with_object_path(object_path:Pgchar):PCdProfile;cdecl;external;
{ async  }
procedure cd_profile_connect(profile:PCdProfile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_profile_connect_finish(profile:PCdProfile; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_profile_set_property(profile:PCdProfile; key:Pgchar; value:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function cd_profile_set_property_finish(profile:PCdProfile; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure cd_profile_install_system_wide(profile:PCdProfile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_profile_install_system_wide_finish(profile:PCdProfile; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{ getters  }
(* Const before type ignored *)
function cd_profile_get_id(profile:PCdProfile):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_profile_get_filename(profile:PCdProfile):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_profile_get_qualifier(profile:PCdProfile):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_profile_get_format(profile:PCdProfile):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_profile_get_title(profile:PCdProfile):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_profile_get_object_path(profile:PCdProfile):Pgchar;cdecl;external;
function cd_profile_get_kind(profile:PCdProfile):TCdProfileKind;cdecl;external;
function cd_profile_get_colorspace(profile:PCdProfile):TCdColorspace;cdecl;external;
function cd_profile_get_scope(profile:PCdProfile):TCdObjectScope;cdecl;external;
function cd_profile_get_owner(profile:PCdProfile):Tguint;cdecl;external;
function cd_profile_get_warnings(profile:PCdProfile):^Pgchar;cdecl;external;
function cd_profile_get_created(profile:PCdProfile):Tgint64;cdecl;external;
function cd_profile_get_age(profile:PCdProfile):Tgint64;cdecl;external;
function cd_profile_get_has_vcgt(profile:PCdProfile):Tgboolean;cdecl;external;
function cd_profile_get_is_system_wide(profile:PCdProfile):Tgboolean;cdecl;external;
function cd_profile_get_metadata(profile:PCdProfile):PGHashTable;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_profile_get_metadata_item(profile:PCdProfile; key:Pgchar):Pgchar;cdecl;external;
{ helpers  }
(* Const before type ignored *)
procedure cd_profile_set_object_path(profile:PCdProfile; object_path:Pgchar);cdecl;external;
function cd_profile_get_connected(profile:PCdProfile):Tgboolean;cdecl;external;
function cd_profile_to_string(profile:PCdProfile):Pgchar;cdecl;external;
function cd_profile_equal(profile1:PCdProfile; profile2:PCdProfile):Tgboolean;cdecl;external;
function cd_profile_has_access(profile:PCdProfile):Tgboolean;cdecl;external;
function cd_profile_load_icc(profile:PCdProfile; flags:TCdIccLoadFlags; cancellable:PGCancellable; error:PPGError):PCdIcc;cdecl;external;
{$endif}
{ __CD_PROFILE_H  }

implementation

{ was #define dname def_expr }
function CD_PROFILE_ERROR : longint; { return type might be wrong }
  begin
    CD_PROFILE_ERROR:=cd_profile_error_quark;
  end;

{ was #define dname def_expr }
function CD_PROFILE_TYPE_ERROR : longint; { return type might be wrong }
  begin
    CD_PROFILE_TYPE_ERROR:=cd_profile_error_get_type;
  end;

{ was #define dname def_expr }
function CD_TYPE_PROFILE : longint; { return type might be wrong }
  begin
    CD_TYPE_PROFILE:=cd_profile_get_type;
  end;


end.
