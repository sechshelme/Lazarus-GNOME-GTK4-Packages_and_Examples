
unit cd_device;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_device.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_device.h
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
PCdDevice  = ^CdDevice;
PCdDeviceClass  = ^CdDeviceClass;
PCdProfile  = ^CdProfile;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
PGPtrArray  = ^GPtrArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2012 Richard Hughes <richard@hughsie.com>
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
{$ifndef __CD_DEVICE_H}
{$define __CD_DEVICE_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include "cd-enum.h"}
{$include "cd-profile.h"}

{ was #define dname def_expr }
function CD_DEVICE_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_DEVICE_TYPE_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_DEVICE : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (CdDevice, cd_device, CD, DEVICE, GObject) }
{< private > }
{ Padding for future expansion  }
type
  PCdDeviceClass = ^TCdDeviceClass;
  TCdDeviceClass = record
      parent_class : TGObjectClass;
      changed : procedure (device:PCdDevice);cdecl;
      _cd_device_reserved1 : procedure ;cdecl;
      _cd_device_reserved2 : procedure ;cdecl;
      _cd_device_reserved3 : procedure ;cdecl;
      _cd_device_reserved4 : procedure ;cdecl;
      _cd_device_reserved5 : procedure ;cdecl;
      _cd_device_reserved6 : procedure ;cdecl;
      _cd_device_reserved7 : procedure ;cdecl;
      _cd_device_reserved8 : procedure ;cdecl;
    end;


function cd_device_error_quark:TGQuark;cdecl;external;
function cd_device_new:PCdDevice;cdecl;external;
(* Const before type ignored *)
function cd_device_new_with_object_path(object_path:Pgchar):PCdDevice;cdecl;external;
{ async  }
procedure cd_device_connect(device:PCdDevice; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_device_connect_finish(device:PCdDevice; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_device_set_property(device:PCdDevice; key:Pgchar; value:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function cd_device_set_property_finish(device:PCdDevice; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure cd_device_add_profile(device:PCdDevice; relation:TCdDeviceRelation; profile:PCdProfile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function cd_device_add_profile_finish(device:PCdDevice; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure cd_device_remove_profile(device:PCdDevice; profile:PCdProfile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_device_remove_profile_finish(device:PCdDevice; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure cd_device_make_profile_default(device:PCdDevice; profile:PCdProfile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_device_make_profile_default_finish(device:PCdDevice; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure cd_device_profiling_inhibit(device:PCdDevice; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_device_profiling_inhibit_finish(device:PCdDevice; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure cd_device_set_enabled(device:PCdDevice; enabled:Tgboolean; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_device_set_enabled_finish(device:PCdDevice; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure cd_device_profiling_uninhibit(device:PCdDevice; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_device_profiling_uninhibit_finish(device:PCdDevice; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure cd_device_get_profile_for_qualifiers(device:PCdDevice; qualifiers:PPgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_device_get_profile_for_qualifiers_finish(device:PCdDevice; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external;
procedure cd_device_get_profile_relation(device:PCdDevice; profile:PCdProfile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_device_get_profile_relation_finish(device:PCdDevice; res:PGAsyncResult; error:PPGError):TCdDeviceRelation;cdecl;external;
{ getters  }
(* Const before type ignored *)
function cd_device_get_id(device:PCdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_device_get_model(device:PCdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_device_get_vendor(device:PCdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_device_get_serial(device:PCdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_device_get_seat(device:PCdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_device_get_format(device:PCdDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_device_get_profiling_inhibitors(device:PCdDevice):^Pgchar;cdecl;external;
function cd_device_get_created(device:PCdDevice):Tguint64;cdecl;external;
function cd_device_get_modified(device:PCdDevice):Tguint64;cdecl;external;
function cd_device_get_kind(device:PCdDevice):TCdDeviceKind;cdecl;external;
function cd_device_get_colorspace(device:PCdDevice):TCdColorspace;cdecl;external;
function cd_device_get_mode(device:PCdDevice):TCdDeviceMode;cdecl;external;
function cd_device_get_enabled(device:PCdDevice):Tgboolean;cdecl;external;
function cd_device_get_embedded(device:PCdDevice):Tgboolean;cdecl;external;
function cd_device_get_scope(device:PCdDevice):TCdObjectScope;cdecl;external;
function cd_device_get_owner(device:PCdDevice):Tguint;cdecl;external;
function cd_device_get_profiles(device:PCdDevice):PGPtrArray;cdecl;external;
function cd_device_get_default_profile(device:PCdDevice):PCdProfile;cdecl;external;
(* Const before type ignored *)
function cd_device_get_object_path(device:PCdDevice):Pgchar;cdecl;external;
function cd_device_get_metadata(device:PCdDevice):PGHashTable;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_device_get_metadata_item(device:PCdDevice; key:Pgchar):Pgchar;cdecl;external;
{ helpers  }
(* Const before type ignored *)
procedure cd_device_set_object_path(device:PCdDevice; object_path:Pgchar);cdecl;external;
function cd_device_get_connected(device:PCdDevice):Tgboolean;cdecl;external;
function cd_device_to_string(device:PCdDevice):Pgchar;cdecl;external;
function cd_device_equal(device1:PCdDevice; device2:PCdDevice):Tgboolean;cdecl;external;
{$endif}
{ __CD_DEVICE_H  }

implementation

{ was #define dname def_expr }
function CD_DEVICE_ERROR : longint; { return type might be wrong }
  begin
    CD_DEVICE_ERROR:=cd_device_error_quark;
  end;

{ was #define dname def_expr }
function CD_DEVICE_TYPE_ERROR : longint; { return type might be wrong }
  begin
    CD_DEVICE_TYPE_ERROR:=cd_device_error_get_type;
  end;

{ was #define dname def_expr }
function CD_TYPE_DEVICE : longint; { return type might be wrong }
  begin
    CD_TYPE_DEVICE:=cd_device_get_type;
  end;


end.
