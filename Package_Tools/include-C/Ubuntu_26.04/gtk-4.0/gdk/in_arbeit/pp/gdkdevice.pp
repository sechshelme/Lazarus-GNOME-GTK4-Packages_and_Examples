
unit gdkdevice;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkdevice.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkdevice.h
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
Pchar  = ^char;
Pdouble  = ^double;
Pgchar  = ^gchar;
PGdkDevice  = ^GdkDevice;
PGdkDeviceTool  = ^GdkDeviceTool;
PGdkDisplay  = ^GdkDisplay;
PGdkInputSource  = ^GdkInputSource;
PGdkSeat  = ^GdkSeat;
PGdkSurface  = ^GdkSurface;
PGdkTimeCoord  = ^GdkTimeCoord;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 * Copyright (C) 2009 Carlos Garnacho <carlosg@gnome.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}
{$include <gdk/gdkdevicetool.h>}
{$include <gdk/gdkenums.h>}

{ was #define dname def_expr }
function GDK_TYPE_DEVICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_DEVICE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_DEVICE(o : longint) : longint;

type
{*
 * GdkInputSource:
 * @GDK_SOURCE_MOUSE: the device is a mouse. (This will be reported for the core
 *   pointer, even if it is something else, such as a trackball.)
 * @GDK_SOURCE_PEN: the device is a stylus of a graphics tablet or similar device.
 * @GDK_SOURCE_KEYBOARD: the device is a keyboard.
 * @GDK_SOURCE_TOUCHSCREEN: the device is a direct-input touch device, such
 *   as a touchscreen or tablet
 * @GDK_SOURCE_TOUCHPAD: the device is an indirect touch device, such
 *   as a touchpad
 * @GDK_SOURCE_TRACKPOINT: the device is a trackpoint
 * @GDK_SOURCE_TABLET_PAD: the device is a "pad", a collection of buttons,
 *   rings and strips found in drawing tablets
 *
 * An enumeration describing the type of an input device in general terms.
  }

  PGdkInputSource = ^TGdkInputSource;
  TGdkInputSource =  Longint;
  Const
    GDK_SOURCE_MOUSE = 0;
    GDK_SOURCE_PEN = 1;
    GDK_SOURCE_KEYBOARD = 2;
    GDK_SOURCE_TOUCHSCREEN = 3;
    GDK_SOURCE_TOUCHPAD = 4;
    GDK_SOURCE_TRACKPOINT = 5;
    GDK_SOURCE_TABLET_PAD = 6;
;
{*
 * GdkTimeCoord:
 * @time: The timestamp for this event
 * @flags: Flags indicating what axes are present, see [flags@Gdk.AxisFlags]
 * @axes: (array fixed-size=12): axis values, indexed by [enum@Gdk.AxisUse]
 *
 * Stores a single event in a motion history.
 *
 * To check whether an axis is present, check whether the corresponding
 * flag from the [flags@Gdk.AxisFlags] enumeration is set in the @flags
 * To access individual axis values, use the values of the values of
 * the [enum@Gdk.AxisUse] enumerations as indices.
  }
type
  PGdkTimeCoord = ^TGdkTimeCoord;
  TGdkTimeCoord = record
      time : Tguint32;
      flags : TGdkAxisFlags;
      axes : array[0..(GDK_AXIS_LAST)-1] of Tdouble;
    end;


function gdk_device_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gdk_device_get_name(device:PGdkDevice):Pchar;cdecl;external;
(* Const before type ignored *)
function gdk_device_get_vendor_id(device:PGdkDevice):Pchar;cdecl;external;
(* Const before type ignored *)
function gdk_device_get_product_id(device:PGdkDevice):Pchar;cdecl;external;
function gdk_device_get_display(device:PGdkDevice):PGdkDisplay;cdecl;external;
function gdk_device_get_seat(device:PGdkDevice):PGdkSeat;cdecl;external;
function gdk_device_get_device_tool(device:PGdkDevice):PGdkDeviceTool;cdecl;external;
function gdk_device_get_source(device:PGdkDevice):TGdkInputSource;cdecl;external;
function gdk_device_get_has_cursor(device:PGdkDevice):Tgboolean;cdecl;external;
function gdk_device_get_num_touches(device:PGdkDevice):Tguint;cdecl;external;
function gdk_device_get_modifier_state(device:PGdkDevice):TGdkModifierType;cdecl;external;
function gdk_device_get_direction(device:PGdkDevice):TPangoDirection;cdecl;external;
function gdk_device_has_bidi_layouts(device:PGdkDevice):Tgboolean;cdecl;external;
function gdk_device_get_caps_lock_state(device:PGdkDevice):Tgboolean;cdecl;external;
function gdk_device_get_num_lock_state(device:PGdkDevice):Tgboolean;cdecl;external;
function gdk_device_get_scroll_lock_state(device:PGdkDevice):Tgboolean;cdecl;external;
function gdk_device_get_surface_at_position(device:PGdkDevice; win_x:Pdouble; win_y:Pdouble):PGdkSurface;cdecl;external;
function gdk_device_get_timestamp(device:PGdkDevice):Tguint32;cdecl;external;
function gdk_device_get_active_layout_index(device:PGdkDevice):Tgint;cdecl;external;
function gdk_device_get_layout_names(device:PGdkDevice):^Pgchar;cdecl;external;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GdkDevice, g_object_unref) }

implementation

{ was #define dname def_expr }
function GDK_TYPE_DEVICE : longint; { return type might be wrong }
  begin
    GDK_TYPE_DEVICE:=gdk_device_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_DEVICE(o : longint) : longint;
begin
  GDK_DEVICE:=G_TYPE_CHECK_INSTANCE_CAST(o,GDK_TYPE_DEVICE,GdkDevice);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_DEVICE(o : longint) : longint;
begin
  GDK_IS_DEVICE:=G_TYPE_CHECK_INSTANCE_TYPE(o,GDK_TYPE_DEVICE);
end;


end.
