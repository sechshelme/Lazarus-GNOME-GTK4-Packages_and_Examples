
unit gstdeviceprovider;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstdeviceprovider.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstdeviceprovider
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
PGList  = ^GList;
PGstBus  = ^GstBus;
PGstDevice  = ^GstDevice;
PGstDeviceProvider  = ^GstDeviceProvider;
PGstDeviceProviderClass  = ^GstDeviceProviderClass;
PGstDeviceProviderFactory  = ^GstDeviceProviderFactory;
PGstDeviceProviderPrivate  = ^GstDeviceProviderPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2012 Olivier Crete <olivier.crete@collabora.com>
 *
 * gstdeviceprovider.h: Device probing and monitoring
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
{$ifndef __GST_DEVICE_PROVIDER_H__}
{$define __GST_DEVICE_PROVIDER_H__}
{$include <gst/gstelement.h>}
{*xxxxxx
#define GST_DEVICE_PROVIDER_REGISTER_DEFINE_CUSTOM(d_p, register_func) \
 \
gboolean G_PASTE (gst_device_provider_register_, d_p) (GstPlugin * plugin) \
 \
  return register_func (plugin); \
 \


#define GST_DEVICE_PROVIDER_REGISTER_DEFINE(d_p, d_p_n, r, t) \
 \
gboolean G_PASTE (gst_device_provider_register_, d_p) (GstPlugin * plugin) \
 \
  return gst_device_provider_register (plugin, d_p_n, r, t); \
 \


#define GST_DEVICE_PROVIDER_REGISTER_DECLARE(d_p) \
 \
gboolean G_PASTE(gst_device_provider_register_, d_p) (GstPlugin * plugin); \
#define GST_DEVICE_PROVIDER_REGISTER(d_p, plugin) G_PASTE(gst_device_provider_register_, d_p) (plugin)

  }
type
{$include <gst/gstdeviceproviderfactory.h>}

{ was #define dname def_expr }
function GST_TYPE_DEVICE_PROVIDER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE_PROVIDER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE_PROVIDER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_PROVIDER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_PROVIDER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_PROVIDER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_DEVICE_PROVIDER_CAST(obj : longint) : PGstDeviceProvider;

{*
 * GstDeviceProvider:
 * @parent: The parent #GstObject
 * @devices: a #GList of the #GstDevice objects
 *
 * The structure of the base #GstDeviceProvider
 *
 * Since: 1.4
  }
{ Protected by the Object lock  }
{< private > }
type
  PGstDeviceProvider = ^TGstDeviceProvider;
  TGstDeviceProvider = record
      parent : TGstObject;
      devices : PGList;
      priv : PGstDeviceProviderPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstDeviceProviderClass:
 * @parent_class: the parent #GstObjectClass structure
 * @factory: a pointer to the #GstDeviceProviderFactory that creates this
 *  provider
 * @probe: Returns a list of devices that are currently available.
 *  This should never block. The devices should not have a parent and should
 *  be floating.
 * @start: Starts monitoring for new devices. Only subclasses that can know
 *  that devices have been added or remove need to implement this method.
 * @stop: Stops monitoring for new devices. Only subclasses that implement
 *  the start() method need to implement this method.
 *
 * The structure of the base #GstDeviceProviderClass
 *
 * Since: 1.4
  }
{< private > }
{< private > }
  PGstDeviceProviderClass = ^TGstDeviceProviderClass;
  TGstDeviceProviderClass = record
      parent_class : TGstObjectClass;
      factory : PGstDeviceProviderFactory;
      probe : function (provider:PGstDeviceProvider):PGList;cdecl;
      start : function (provider:PGstDeviceProvider):Tgboolean;cdecl;
      stop : procedure (provider:PGstDeviceProvider);cdecl;
      metadata : Tgpointer;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_device_provider_get_type:TGType;cdecl;external;
function gst_device_provider_get_devices(provider:PGstDeviceProvider):PGList;cdecl;external;
function gst_device_provider_start(provider:PGstDeviceProvider):Tgboolean;cdecl;external;
procedure gst_device_provider_stop(provider:PGstDeviceProvider);cdecl;external;
function gst_device_provider_can_monitor(provider:PGstDeviceProvider):Tgboolean;cdecl;external;
function gst_device_provider_get_bus(provider:PGstDeviceProvider):PGstBus;cdecl;external;
procedure gst_device_provider_device_add(provider:PGstDeviceProvider; device:PGstDevice);cdecl;external;
procedure gst_device_provider_device_remove(provider:PGstDeviceProvider; device:PGstDevice);cdecl;external;
function gst_device_provider_get_hidden_providers(provider:PGstDeviceProvider):^Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gst_device_provider_hide_provider(provider:PGstDeviceProvider; name:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_device_provider_unhide_provider(provider:PGstDeviceProvider; name:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_device_provider_get_metadata(provider:PGstDeviceProvider; key:Pgchar):Pgchar;cdecl;external;
function gst_device_provider_is_started(provider:PGstDeviceProvider):Tgboolean;cdecl;external;
{ device provider class meta data  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_device_provider_class_set_metadata(klass:PGstDeviceProviderClass; longname:Pgchar; classification:Pgchar; description:Pgchar; author:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_device_provider_class_set_static_metadata(klass:PGstDeviceProviderClass; longname:Pgchar; classification:Pgchar; description:Pgchar; author:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_device_provider_class_add_metadata(klass:PGstDeviceProviderClass; key:Pgchar; value:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_device_provider_class_add_static_metadata(klass:PGstDeviceProviderClass; key:Pgchar; value:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_device_provider_class_get_metadata(klass:PGstDeviceProviderClass; key:Pgchar):Pgchar;cdecl;external;
procedure gst_device_provider_device_changed(provider:PGstDeviceProvider; device:PGstDevice; changed_device:PGstDevice);cdecl;external;
{ factory management  }
function gst_device_provider_get_factory(provider:PGstDeviceProvider):PGstDeviceProviderFactory;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstDeviceProvider, gst_object_unref) }
{$endif}
{ __GST_DEVICE_PROVIDER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_DEVICE_PROVIDER : longint; { return type might be wrong }
  begin
    GST_TYPE_DEVICE_PROVIDER:=gst_device_provider_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE_PROVIDER(obj : longint) : longint;
begin
  GST_IS_DEVICE_PROVIDER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_DEVICE_PROVIDER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE_PROVIDER_CLASS(klass : longint) : longint;
begin
  GST_IS_DEVICE_PROVIDER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_DEVICE_PROVIDER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_PROVIDER_GET_CLASS(obj : longint) : longint;
begin
  GST_DEVICE_PROVIDER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_DEVICE_PROVIDER,GstDeviceProviderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_PROVIDER(obj : longint) : longint;
begin
  GST_DEVICE_PROVIDER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_DEVICE_PROVIDER,GstDeviceProvider);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_PROVIDER_CLASS(klass : longint) : longint;
begin
  GST_DEVICE_PROVIDER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_DEVICE_PROVIDER,GstDeviceProviderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_DEVICE_PROVIDER_CAST(obj : longint) : PGstDeviceProvider;
begin
  GST_DEVICE_PROVIDER_CAST:=PGstDeviceProvider(obj);
end;


end.
