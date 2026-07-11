
unit gstdevice;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstdevice.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstdevice
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
Pgchar  = ^gchar;
PGstCaps  = ^GstCaps;
PGstDevice  = ^GstDevice;
PGstDeviceClass  = ^GstDeviceClass;
PGstDevicePrivate  = ^GstDevicePrivate;
PGstElement  = ^GstElement;
PGstStructure  = ^GstStructure;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2012 Olivier Crete <olivier.crete@collabora.com>
 *
 * gstdevice.c: Device discovery
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
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __GST_DEVICE_H__}
{$define __GST_DEVICE_H__}
type
{$include <gst/gstelement.h>}
{$include <gst/gstcaps.h>}
type

{ was #define dname def_expr }
function GST_TYPE_DEVICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_DEVICE_CAST(obj : longint) : PGstDevice;

{*
 * GstDevice:
 * @parent: The parent #GstObject structure.
 *
 * A device object.
 *
 * Since: 1.4
  }
{< private > }
type
  PGstDevice = ^TGstDevice;
  TGstDevice = record
      parent : TGstObject;
      priv : PGstDevicePrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstDeviceClass:
 * @parent_class: The parent #GstObjectClass structure.
 * @create_element: Creates the fully configured element to access this device.
 *  Subclasses need to override this and return a new element.
 * @reconfigure_element: This only needs to be implemented by subclasses if the
 *  element can be reconfigured to use a different device. See the documentation
 *  for gst_device_reconfigure_element().
 *
 * The class structure for a #GstDevice object.
 *
 * Since: 1.4
  }
(* Const before type ignored *)
{< private > }
  PGstDeviceClass = ^TGstDeviceClass;
  TGstDeviceClass = record
      parent_class : TGstObjectClass;
      create_element : function (device:PGstDevice; name:Pgchar):PGstElement;cdecl;
      reconfigure_element : function (device:PGstDevice; element:PGstElement):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_device_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_device_create_element(device:PGstDevice; name:Pgchar):PGstElement;cdecl;external;
function gst_device_get_caps(device:PGstDevice):PGstCaps;cdecl;external;
function gst_device_get_display_name(device:PGstDevice):Pgchar;cdecl;external;
function gst_device_get_device_class(device:PGstDevice):Pgchar;cdecl;external;
function gst_device_get_properties(device:PGstDevice):PGstStructure;cdecl;external;
function gst_device_reconfigure_element(device:PGstDevice; element:PGstElement):Tgboolean;cdecl;external;
function gst_device_has_classesv(device:PGstDevice; classes:PPgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_device_has_classes(device:PGstDevice; classes:Pgchar):Tgboolean;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstDevice, gst_object_unref) }
{$endif}
{ __GST_DEVICE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_DEVICE : longint; { return type might be wrong }
  begin
    GST_TYPE_DEVICE:=gst_device_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE(obj : longint) : longint;
begin
  GST_IS_DEVICE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE_CLASS(klass : longint) : longint;
begin
  GST_IS_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_GET_CLASS(obj : longint) : longint;
begin
  GST_DEVICE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_DEVICE,GstDeviceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE(obj : longint) : longint;
begin
  GST_DEVICE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_DEVICE,GstDevice);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_CLASS(klass : longint) : longint;
begin
  GST_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_DEVICE,GstDeviceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_DEVICE_CAST(obj : longint) : PGstDevice;
begin
  GST_DEVICE_CAST:=PGstDevice(obj);
end;


end.
