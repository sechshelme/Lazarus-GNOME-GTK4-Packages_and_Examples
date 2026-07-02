unit gdkdevicepad;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 * Copyright (C) 2016 Red Hat
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
{$include <gdk/gdktypes.h>}

type
{*
 * GdkDevicePadFeature:
 * @GDK_DEVICE_PAD_FEATURE_BUTTON: a button
 * @GDK_DEVICE_PAD_FEATURE_RING: a ring-shaped interactive area
 * @GDK_DEVICE_PAD_FEATURE_STRIP: a straight interactive area
 *
 * A pad feature.
  }

  PGdkDevicePadFeature = ^TGdkDevicePadFeature;
  TGdkDevicePadFeature =  Longint;
  Const
    GDK_DEVICE_PAD_FEATURE_BUTTON = 0;
    GDK_DEVICE_PAD_FEATURE_RING = 1;
    GDK_DEVICE_PAD_FEATURE_STRIP = 2;
;

function gdk_device_pad_get_type:TGType;cdecl;external libgtk4;
function gdk_device_pad_get_n_groups(pad:PGdkDevicePad):longint;cdecl;external libgtk4;
function gdk_device_pad_get_group_n_modes(pad:PGdkDevicePad; group_idx:longint):longint;cdecl;external libgtk4;
function gdk_device_pad_get_n_features(pad:PGdkDevicePad; feature:TGdkDevicePadFeature):longint;cdecl;external libgtk4;
function gdk_device_pad_get_feature_group(pad:PGdkDevicePad; feature:TGdkDevicePadFeature; feature_idx:longint):longint;cdecl;external libgtk4;

// === Konventiert am: 2-7-26 19:12:18 ===

function GDK_TYPE_DEVICE_PAD : TGType;
function GDK_DEVICE_PAD(obj : Pointer) : PGdkDevicePad;
function GDK_IS_DEVICE_PAD(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_DEVICE_PAD : TGType;
  begin
    GDK_TYPE_DEVICE_PAD:=gdk_device_pad_get_type;
  end;

function GDK_DEVICE_PAD(obj : Pointer) : PGdkDevicePad;
begin
  Result := PGdkDevicePad(g_type_check_instance_cast(obj, GDK_TYPE_DEVICE_PAD));
end;

function GDK_IS_DEVICE_PAD(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_DEVICE_PAD);
end;



end.
