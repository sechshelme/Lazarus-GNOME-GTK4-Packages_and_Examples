
unit cd_client;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_client.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_client.h
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
PCdClient  = ^CdClient;
PCdClientClass  = ^CdClientClass;
PCdDevice  = ^CdDevice;
PCdIcc  = ^CdIcc;
PCdProfile  = ^CdProfile;
PCdSensor  = ^CdSensor;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGFile  = ^GFile;
PGHashTable  = ^GHashTable;
PGPtrArray  = ^GPtrArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2010-2013 Richard Hughes <richard@hughsie.com>
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
{$ifndef __CD_CLIENT_H}
{$define __CD_CLIENT_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include "cd-device.h"}
{$include "cd-profile.h"}
{$include "cd-sensor.h"}

{ was #define dname def_expr }
function CD_CLIENT_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_CLIENT_TYPE_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_CLIENT : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (CdClient, cd_client, CD, CLIENT, GObject) }
{< private > }
{ Padding for future expansion  }
type
  PCdClientClass = ^TCdClientClass;
  TCdClientClass = record
      parent_class : TGObjectClass;
      device_added : procedure (client:PCdClient; device:PCdDevice);cdecl;
      device_removed : procedure (client:PCdClient; device:PCdDevice);cdecl;
      device_changed : procedure (client:PCdClient; device:PCdDevice);cdecl;
      profile_added : procedure (client:PCdClient; profile:PCdProfile);cdecl;
      profile_removed : procedure (client:PCdClient; profile:PCdProfile);cdecl;
      profile_changed : procedure (client:PCdClient; profile:PCdProfile);cdecl;
      sensor_added : procedure (client:PCdClient; sensor:PCdSensor);cdecl;
      sensor_removed : procedure (client:PCdClient; sensor:PCdSensor);cdecl;
      sensor_changed : procedure (client:PCdClient; sensor:PCdSensor);cdecl;
      changed : procedure (client:PCdClient);cdecl;
      _cd_client_reserved1 : procedure ;cdecl;
      _cd_client_reserved2 : procedure ;cdecl;
      _cd_client_reserved3 : procedure ;cdecl;
      _cd_client_reserved4 : procedure ;cdecl;
      _cd_client_reserved5 : procedure ;cdecl;
      _cd_client_reserved6 : procedure ;cdecl;
      _cd_client_reserved7 : procedure ;cdecl;
      _cd_client_reserved8 : procedure ;cdecl;
    end;


function cd_client_error_quark:TGQuark;cdecl;external;
function cd_client_new:PCdClient;cdecl;external;
{ async  }
procedure cd_client_connect(client:PCdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_connect_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure cd_client_create_device(client:PCdClient; id:Pgchar; scope:TCdObjectScope; properties:PGHashTable; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_create_device_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdDevice;cdecl;external;
(* Const before type ignored *)
procedure cd_client_create_profile(client:PCdClient; id:Pgchar; scope:TCdObjectScope; properties:PGHashTable; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_create_profile_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external;
procedure cd_client_create_profile_for_icc(client:PCdClient; icc:PCdIcc; scope:TCdObjectScope; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function cd_client_create_profile_for_icc_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external;
procedure cd_client_import_profile(client:PCdClient; file:PGFile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_import_profile_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external;
procedure cd_client_delete_device(client:PCdClient; device:PCdDevice; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_delete_device_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure cd_client_delete_profile(client:PCdClient; profile:PCdProfile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_delete_profile_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure cd_client_find_device(client:PCdClient; id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_find_device_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdDevice;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_client_find_device_by_property(client:PCdClient; key:Pgchar; value:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function cd_client_find_device_by_property_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdDevice;cdecl;external;
(* Const before type ignored *)
procedure cd_client_find_profile(client:PCdClient; id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_find_profile_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external;
(* Const before type ignored *)
procedure cd_client_find_profile_by_filename(client:PCdClient; filename:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_find_profile_by_filename_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external;
procedure cd_client_get_standard_space(client:PCdClient; standard_space:TCdStandardSpace; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_get_standard_space_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external;
procedure cd_client_get_devices(client:PCdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_get_devices_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
procedure cd_client_get_devices_by_kind(client:PCdClient; kind:TCdDeviceKind; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_get_devices_by_kind_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
procedure cd_client_get_profiles(client:PCdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_get_profiles_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
procedure cd_client_get_sensors(client:PCdClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_get_sensors_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PGPtrArray;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure cd_client_find_profile_by_property(client:PCdClient; key:Pgchar; value:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function cd_client_find_profile_by_property_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external;
(* Const before type ignored *)
procedure cd_client_find_sensor(client:PCdClient; id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_client_find_sensor_finish(client:PCdClient; res:PGAsyncResult; error:PPGError):PCdSensor;cdecl;external;
{ getters  }
function cd_client_get_connected(client:PCdClient):Tgboolean;cdecl;external;
function cd_client_get_has_server(client:PCdClient):Tgboolean;cdecl;external;
(* Const before type ignored *)
function cd_client_get_daemon_version(client:PCdClient):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_client_get_system_vendor(client:PCdClient):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_client_get_system_model(client:PCdClient):Pgchar;cdecl;external;
{$endif}
{ __CD_CLIENT_H  }

implementation

{ was #define dname def_expr }
function CD_CLIENT_ERROR : longint; { return type might be wrong }
  begin
    CD_CLIENT_ERROR:=cd_client_error_quark;
  end;

{ was #define dname def_expr }
function CD_CLIENT_TYPE_ERROR : longint; { return type might be wrong }
  begin
    CD_CLIENT_TYPE_ERROR:=cd_client_error_get_type;
  end;

{ was #define dname def_expr }
function CD_TYPE_CLIENT : longint; { return type might be wrong }
  begin
    CD_TYPE_CLIENT:=cd_client_get_type;
  end;


end.
