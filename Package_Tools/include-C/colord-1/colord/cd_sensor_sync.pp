
unit cd_sensor_sync;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_sensor_sync.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_sensor_sync.h
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
PCdSensor  = ^CdSensor;
PCdSpectrum  = ^CdSpectrum;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2011-2015 Richard Hughes <richard@hughsie.com>
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
{$ifndef __CD_SENSOR_SYNC_H}
{$define __CD_SENSOR_SYNC_H}
{$include <glib-object.h>}
{$include "cd-sensor.h"}

function cd_sensor_connect_sync(sensor:PCdSensor; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_sensor_lock_sync(sensor:PCdSensor; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_sensor_unlock_sync(sensor:PCdSensor; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_sensor_set_options_sync(sensor:PCdSensor; values:PGHashTable; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function cd_sensor_get_sample_sync(sensor:PCdSensor; cap:TCdSensorCap; cancellable:PGCancellable; error:PPGError):PCdColorXYZ;cdecl;external;
function cd_sensor_get_spectrum_sync(sensor:PCdSensor; cap:TCdSensorCap; cancellable:PGCancellable; error:PPGError):PCdSpectrum;cdecl;external;
{$endif}
{ __CD_SENSOR_SYNC_H  }

implementation


end.
