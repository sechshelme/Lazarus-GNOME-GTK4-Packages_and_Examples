
unit gsthipdevice;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsthipdevice.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsthipdevice.h
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
Pgint  = ^gint;
PGstHipDevice  = ^GstHipDevice;
PGstHipDeviceClass  = ^GstHipDeviceClass;
PGstHipDevicePrivate  = ^GstHipDevicePrivate;
PGstHipStream  = ^GstHipStream;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2025 Seungha Yang <seungha@centricular.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
(** unsupported pragma#pragma once*)
{$include <gst/gst.h>}
{$include <gst/hip/gsthip_fwd.h>}
{$include <gst/hip/gsthip-enums.h>}

{ was #define dname def_expr }
function GST_TYPE_HIP_DEVICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_DEVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_DEVICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_DEVICE_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_DEVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_DEVICE_CLASS(klass : longint) : longint;

const
  GST_HIP_DEVICE_CONTEXT_TYPE = 'gst.hip.device';  
{*
 * GstHipDevice:
 *
 * Opaque GstHipDevice struct
 *
 * Since: 1.28
  }
{< private > }
type
  PGstHipDevice = ^TGstHipDevice;
  TGstHipDevice = record
      object : TGstObject;
      priv : PGstHipDevicePrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstHipDeviceClass:
 *
 * Opaque GstHipDeviceClass struct
 *
 * Since: 1.28
  }
{< private > }
  PGstHipDeviceClass = ^TGstHipDeviceClass;
  TGstHipDeviceClass = record
      parent_class : TGstObjectClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_hip_device_get_type:TGType;cdecl;external;
function gst_hip_device_new(vendor:TGstHipVendor; device_id:Tguint):PGstHipDevice;cdecl;external;
function gst_hip_device_set_current(device:PGstHipDevice):Tgboolean;cdecl;external;
function gst_hip_device_get_attribute(device:PGstHipDevice; attr:ThipDeviceAttribute_t; value:Pgint):ThipError_t;cdecl;external;
function gst_hip_device_is_equal(device1:PGstHipDevice; device2:PGstHipDevice):Tgboolean;cdecl;external;
function gst_hip_device_get_vendor(device:PGstHipDevice):TGstHipVendor;cdecl;external;
function gst_hip_device_get_device_id(device:PGstHipDevice):Tguint;cdecl;external;
function gst_hip_device_get_stream(device:PGstHipDevice):PGstHipStream;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_HIP_DEVICE : longint; { return type might be wrong }
  begin
    GST_TYPE_HIP_DEVICE:=gst_hip_device_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_DEVICE(obj : longint) : longint;
begin
  GST_HIP_DEVICE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_HIP_DEVICE,GstHipDevice);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_DEVICE_CLASS(klass : longint) : longint;
begin
  GST_HIP_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_HIP_DEVICE,GstHipDeviceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_HIP_DEVICE_GET_CLASS(obj : longint) : longint;
begin
  GST_HIP_DEVICE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_HIP_DEVICE,GstHipDeviceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_DEVICE(obj : longint) : longint;
begin
  GST_IS_HIP_DEVICE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_HIP_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_HIP_DEVICE_CLASS(klass : longint) : longint;
begin
  GST_IS_HIP_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_HIP_DEVICE);
end;


end.
