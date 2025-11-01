
unit cd_sensor;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_sensor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_sensor.h
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
PCdSensorClass  = ^CdSensorClass;
PCdSpectrum  = ^CdSpectrum;
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
 * Copyright (C) 2010-2015 Richard Hughes <richard@hughsie.com>
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
{$ifndef __CD_SENSOR_H}
{$define __CD_SENSOR_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include "cd-enum.h"}
{$include "cd-color.h"}
{$include "cd-spectrum.h"}

{ was #define dname def_expr }
function CD_SENSOR_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_SENSOR_TYPE_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_SENSOR : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (CdSensor, cd_sensor, CD, SENSOR, GObject) }
{< private > }
{ Padding for future expansion  }
type
  PCdSensorClass = ^TCdSensorClass;
  TCdSensorClass = record
      parent_class : TGObjectClass;
      button_pressed : procedure (sensor:PCdSensor);cdecl;
      _cd_sensor_reserved1 : procedure ;cdecl;
      _cd_sensor_reserved2 : procedure ;cdecl;
      _cd_sensor_reserved3 : procedure ;cdecl;
      _cd_sensor_reserved4 : procedure ;cdecl;
      _cd_sensor_reserved5 : procedure ;cdecl;
      _cd_sensor_reserved6 : procedure ;cdecl;
      _cd_sensor_reserved7 : procedure ;cdecl;
      _cd_sensor_reserved8 : procedure ;cdecl;
    end;


function cd_sensor_error_quark:TGQuark;cdecl;external;
function cd_sensor_new:PCdSensor;cdecl;external;
(* Const before type ignored *)
function cd_sensor_new_with_object_path(object_path:Pgchar):PCdSensor;cdecl;external;
{ async  }
procedure cd_sensor_connect(sensor:PCdSensor; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_sensor_connect_finish(sensor:PCdSensor; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure cd_sensor_lock(sensor:PCdSensor; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_sensor_lock_finish(sensor:PCdSensor; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure cd_sensor_unlock(sensor:PCdSensor; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_sensor_unlock_finish(sensor:PCdSensor; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure cd_sensor_set_options(sensor:PCdSensor; values:PGHashTable; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_sensor_set_options_finish(sensor:PCdSensor; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure cd_sensor_get_sample(sensor:PCdSensor; cap:TCdSensorCap; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_sensor_get_sample_finish(sensor:PCdSensor; res:PGAsyncResult; error:PPGError):PCdColorXYZ;cdecl;external;
procedure cd_sensor_get_spectrum(sensor:PCdSensor; cap:TCdSensorCap; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function cd_sensor_get_spectrum_finish(sensor:PCdSensor; res:PGAsyncResult; error:PPGError):PCdSpectrum;cdecl;external;
{ getters  }
(* Const before type ignored *)
function cd_sensor_get_object_path(sensor:PCdSensor):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_sensor_get_id(sensor:PCdSensor):Pgchar;cdecl;external;
function cd_sensor_get_connected(sensor:PCdSensor):Tgboolean;cdecl;external;
function cd_sensor_get_kind(sensor:PCdSensor):TCdSensorKind;cdecl;external;
function cd_sensor_get_state(sensor:PCdSensor):TCdSensorState;cdecl;external;
function cd_sensor_get_mode(sensor:PCdSensor):TCdSensorCap;cdecl;external;
(* Const before type ignored *)
function cd_sensor_get_serial(sensor:PCdSensor):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_sensor_get_model(sensor:PCdSensor):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_sensor_get_vendor(sensor:PCdSensor):Pgchar;cdecl;external;
function cd_sensor_get_native(sensor:PCdSensor):Tgboolean;cdecl;external;
function cd_sensor_get_embedded(sensor:PCdSensor):Tgboolean;cdecl;external;
function cd_sensor_get_locked(sensor:PCdSensor):Tgboolean;cdecl;external;
function cd_sensor_get_caps(sensor:PCdSensor):Tguint64;cdecl;external;
function cd_sensor_has_cap(sensor:PCdSensor; cap:TCdSensorCap):Tgboolean;cdecl;external;
function cd_sensor_get_options(sensor:PCdSensor):PGHashTable;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_sensor_get_option(sensor:PCdSensor; key:Pgchar):Pgchar;cdecl;external;
function cd_sensor_get_metadata(sensor:PCdSensor):PGHashTable;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_sensor_get_metadata_item(sensor:PCdSensor; key:Pgchar):Pgchar;cdecl;external;
{ utilities  }
(* Const before type ignored *)
procedure cd_sensor_set_object_path(sensor:PCdSensor; object_path:Pgchar);cdecl;external;
function cd_sensor_equal(sensor1:PCdSensor; sensor2:PCdSensor):Tgboolean;cdecl;external;
function cd_sensor_to_string(sensor:PCdSensor):Pgchar;cdecl;external;
{$endif}
{ __CD_SENSOR_H  }

implementation

{ was #define dname def_expr }
function CD_SENSOR_ERROR : longint; { return type might be wrong }
  begin
    CD_SENSOR_ERROR:=cd_sensor_error_quark;
  end;

{ was #define dname def_expr }
function CD_SENSOR_TYPE_ERROR : longint; { return type might be wrong }
  begin
    CD_SENSOR_TYPE_ERROR:=cd_sensor_error_get_type;
  end;

{ was #define dname def_expr }
function CD_TYPE_SENSOR : longint; { return type might be wrong }
  begin
    CD_TYPE_SENSOR:=cd_sensor_get_type;
  end;


end.
