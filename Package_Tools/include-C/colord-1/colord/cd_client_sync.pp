
unit cd_client_sync;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_client_sync.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_client_sync.h
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
PCdDevice  = ^CdDevice;
PCdIcc  = ^CdIcc;
PCdProfile  = ^CdProfile;
PCdSensor  = ^CdSensor;
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
 * Copyright (C) 2011-2012 Richard Hughes <richard@hughsie.com>
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
{$ifndef __CD_CLIENT_SYNC_H}
{$define __CD_CLIENT_SYNC_H}
{$include <glib-object.h>}
{$include "cd-client.h"}
{$include "cd-device.h"}
{$include "cd-profile.h"}

function cd_client_connect_sync(client:PCdClient; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_client_delete_profile_sync(client:PCdClient; profile:PCdProfile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_client_delete_device_sync(client:PCdClient; device:PCdDevice; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function cd_client_find_profile_sync(client:PCdClient; id:Pgchar; cancellable:PGCancellable; error:PPGError):PCdProfile;cdecl;external;
(* Const before type ignored *)
function cd_client_find_profile_by_filename_sync(client:PCdClient; filename:Pgchar; cancellable:PGCancellable; error:PPGError):PCdProfile;cdecl;external;
(* Const before type ignored *)
function cd_client_create_profile_sync(client:PCdClient; id:Pgchar; scope:TCdObjectScope; properties:PGHashTable; cancellable:PGCancellable; 
           error:PPGError):PCdProfile;cdecl;external;
function cd_client_create_profile_for_icc_sync(client:PCdClient; icc:PCdIcc; scope:TCdObjectScope; cancellable:PGCancellable; error:PPGError):PCdProfile;cdecl;external;
function cd_client_import_profile_sync(client:PCdClient; file:PGFile; cancellable:PGCancellable; error:PPGError):PCdProfile;cdecl;external;
(* Const before type ignored *)
function cd_client_create_device_sync(client:PCdClient; id:Pgchar; scope:TCdObjectScope; properties:PGHashTable; cancellable:PGCancellable; 
           error:PPGError):PCdDevice;cdecl;external;
function cd_client_get_devices_sync(client:PCdClient; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external;
function cd_client_get_profiles_sync(client:PCdClient; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external;
function cd_client_get_sensors_sync(client:PCdClient; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function cd_client_find_device_sync(client:PCdClient; id:Pgchar; cancellable:PGCancellable; error:PPGError):PCdDevice;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_client_find_device_by_property_sync(client:PCdClient; key:Pgchar; value:Pgchar; cancellable:PGCancellable; error:PPGError):PCdDevice;cdecl;external;
function cd_client_get_standard_space_sync(client:PCdClient; standard_space:TCdStandardSpace; cancellable:PGCancellable; error:PPGError):PCdProfile;cdecl;external;
function cd_client_get_devices_by_kind_sync(client:PCdClient; kind:TCdDeviceKind; cancellable:PGCancellable; error:PPGError):PGPtrArray;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_client_find_profile_by_property_sync(client:PCdClient; key:Pgchar; value:Pgchar; cancellable:PGCancellable; error:PPGError):PCdProfile;cdecl;external;
(* Const before type ignored *)
function cd_client_find_sensor_sync(client:PCdClient; id:Pgchar; cancellable:PGCancellable; error:PPGError):PCdSensor;cdecl;external;
{$endif}
{ __CD_CLIENT_SYNC_H  }

implementation


end.
