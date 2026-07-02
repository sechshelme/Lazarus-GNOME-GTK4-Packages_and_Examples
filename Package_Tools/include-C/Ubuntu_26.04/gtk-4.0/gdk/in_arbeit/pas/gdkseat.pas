unit gdkseat;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 * Copyright (C) 2015 Red Hat
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
 *
 * Author: Carlos Garnacho <carlosg@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <gdk/gdksurface.h>}
{$include <gdk/gdkevents.h>}
{$include <gdk/gdktypes.h>}

{*
 * GdkSeatCapabilities:
 * @GDK_SEAT_CAPABILITY_NONE: No input capabilities
 * @GDK_SEAT_CAPABILITY_POINTER: The seat has a pointer (e.g. mouse)
 * @GDK_SEAT_CAPABILITY_TOUCH: The seat has touchscreen(s) attached
 * @GDK_SEAT_CAPABILITY_TABLET_STYLUS: The seat has drawing tablet(s) attached
 * @GDK_SEAT_CAPABILITY_KEYBOARD: The seat has keyboard(s) attached
 * @GDK_SEAT_CAPABILITY_TABLET_PAD: The seat has drawing tablet pad(s) attached
 * @GDK_SEAT_CAPABILITY_ALL_POINTING: The union of all pointing capabilities
 * @GDK_SEAT_CAPABILITY_ALL: The union of all capabilities
 *
 * Flags describing the seat capabilities.
  }
type
  PGdkSeatCapabilities = ^TGdkSeatCapabilities;
  TGdkSeatCapabilities =  Longint;
  Const
    GDK_SEAT_CAPABILITY_NONE = 0;
    GDK_SEAT_CAPABILITY_POINTER = 1 shl 0;
    GDK_SEAT_CAPABILITY_TOUCH = 1 shl 1;
    GDK_SEAT_CAPABILITY_TABLET_STYLUS = 1 shl 2;
    GDK_SEAT_CAPABILITY_KEYBOARD = 1 shl 3;
    GDK_SEAT_CAPABILITY_TABLET_PAD = 1 shl 4;
    GDK_SEAT_CAPABILITY_ALL_POINTING = (GDK_SEAT_CAPABILITY_POINTER or GDK_SEAT_CAPABILITY_TOUCH) or GDK_SEAT_CAPABILITY_TABLET_STYLUS;
    GDK_SEAT_CAPABILITY_ALL = (GDK_SEAT_CAPABILITY_ALL_POINTING or GDK_SEAT_CAPABILITY_KEYBOARD) or GDK_SEAT_CAPABILITY_TABLET_PAD;
;
type
  PGdkSeat = ^TGdkSeat;
  TGdkSeat = record
      parent_instance : TGObject;
    end;


function gdk_seat_get_type:TGType;cdecl;external libgtk4;
function gdk_seat_get_display(seat:PGdkSeat):PGdkDisplay;cdecl;external libgtk4;
function gdk_seat_get_capabilities(seat:PGdkSeat):TGdkSeatCapabilities;cdecl;external libgtk4;
function gdk_seat_get_devices(seat:PGdkSeat; capabilities:TGdkSeatCapabilities):PGList;cdecl;external libgtk4;
function gdk_seat_get_tools(seat:PGdkSeat):PGList;cdecl;external libgtk4;
function gdk_seat_get_pointer(seat:PGdkSeat):PGdkDevice;cdecl;external libgtk4;
function gdk_seat_get_keyboard(seat:PGdkSeat):PGdkDevice;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkSeat, g_object_unref) }

// === Konventiert am: 2-7-26 19:26:26 ===

function GDK_TYPE_SEAT : TGType;
function GDK_SEAT(obj : Pointer) : PGdkSeat;
function GDK_IS_SEAT(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_SEAT : TGType;
  begin
    GDK_TYPE_SEAT:=gdk_seat_get_type;
  end;

function GDK_SEAT(obj : Pointer) : PGdkSeat;
begin
  Result := PGdkSeat(g_type_check_instance_cast(obj, GDK_TYPE_SEAT));
end;

function GDK_IS_SEAT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_SEAT);
end;



end.
