
unit cd_device_sync;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_device_sync.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_device_sync.h
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
PCdProfile  = ^CdProfile;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2011 Richard Hughes <richard@hughsie.com>
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
{$ifndef __CD_DEVICE_SYNC_H}
{$define __CD_DEVICE_SYNC_H}
{$include <glib-object.h>}
{$include "cd-device.h"}
{$include "cd-profile.h"}

function cd_device_connect_sync(device:PCdDevice; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_device_set_property_sync(device:PCdDevice; key:Pgchar; value:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_device_add_profile_sync(device:PCdDevice; relation:TCdDeviceRelation; profile:PCdProfile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_device_remove_profile_sync(device:PCdDevice; profile:PCdProfile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function cd_device_get_profile_for_qualifiers_sync(device:PCdDevice; qualifiers:PPgchar; cancellable:PGCancellable; error:PPGError):PCdProfile;cdecl;external;
function cd_device_make_profile_default_sync(device:PCdDevice; profile:PCdProfile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_device_profiling_inhibit_sync(device:PCdDevice; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_device_profiling_uninhibit_sync(device:PCdDevice; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_device_get_profile_relation_sync(device:PCdDevice; profile:PCdProfile; cancellable:PGCancellable; error:PPGError):TCdDeviceRelation;cdecl;external;
function cd_device_set_enabled_sync(device:PCdDevice; enabled:Tgboolean; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{ helpers  }
(* Const before type ignored *)
function cd_device_set_model_sync(device:PCdDevice; value:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function cd_device_set_serial_sync(device:PCdDevice; value:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function cd_device_set_vendor_sync(device:PCdDevice; value:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_device_set_kind_sync(device:PCdDevice; kind:TCdDeviceKind; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_device_set_colorspace_sync(device:PCdDevice; colorspace:TCdColorspace; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_device_set_mode_sync(device:PCdDevice; mode:TCdDeviceMode; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __CD_DEVICE_SYNC_H  }

implementation


end.
