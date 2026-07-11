unit gstdeviceproviderfactory;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *               2000,2004 Wim Taymans <wim@fluendo.com>
 *               2012 Olivier Crete <olivier.crete@collabora.com>
 *
 * gstdeviceproviderfactory.h: Header for GstDeviceProviderFactory
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
{$ifndef __GST_DEVICE_PROVIDER_FACTORY_H__}
{$define __GST_DEVICE_PROVIDER_FACTORY_H__}
{*
 * GstDeviceProviderFactory:
 *
 * The opaque #GstDeviceProviderFactory data structure.
 *
 * Since: 1.4
  }
{*
 * GstDeviceProviderFactoryClass:
 *
 * The opaque #GstDeviceProviderFactoryClass data structure.
 *
 * Since: 1.4
  }
type
{$include <gst/gstconfig.h>}
{$include <gst/gstplugin.h>}
{$include <gst/gstpluginfeature.h>}
{$include <gst/gstdeviceprovider.h>}

function gst_device_provider_factory_find(name:Pgchar):PGstDeviceProviderFactory;cdecl;external libgstreamer;
function gst_device_provider_factory_get_device_provider_type(factory:PGstDeviceProviderFactory):TGType;cdecl;external libgstreamer;
function gst_device_provider_factory_get_metadata(factory:PGstDeviceProviderFactory; key:Pgchar):Pgchar;cdecl;external libgstreamer;
function gst_device_provider_factory_get_metadata_keys(factory:PGstDeviceProviderFactory):^Pgchar;cdecl;external libgstreamer;
function gst_device_provider_factory_get(factory:PGstDeviceProviderFactory):PGstDeviceProvider;cdecl;external libgstreamer;
function gst_device_provider_factory_get_by_name(factoryname:Pgchar):PGstDeviceProvider;cdecl;external libgstreamer;
function gst_device_provider_register(plugin:PGstPlugin; name:Pgchar; rank:Tguint; _type:TGType):Tgboolean;cdecl;external libgstreamer;
function gst_device_provider_factory_has_classesv(factory:PGstDeviceProviderFactory; classes:PPgchar):Tgboolean;cdecl;external libgstreamer;
function gst_device_provider_factory_has_classes(factory:PGstDeviceProviderFactory; classes:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_device_provider_factory_list_get_device_providers(minrank:TGstRank):PGList;cdecl;external libgstreamer;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstDeviceProviderFactory, gst_object_unref) }
{$endif}
{ __GST_DEVICE_PROVIDER_FACTORY_H__  }

// === Konventiert am: 11-7-26 11:00:02 ===

function GST_TYPE_DEVICE_PROVIDER_FACTORY : TGType;
function GST_DEVICE_PROVIDER_FACTORY(obj : Pointer) : PGstDeviceProviderFactory;
function GST_DEVICE_PROVIDER_FACTORY_CLASS(klass : Pointer) : PGstDeviceProviderFactoryClass;
function GST_IS_DEVICE_PROVIDER_FACTORY(obj : Pointer) : Tgboolean;
function GST_IS_DEVICE_PROVIDER_FACTORY_CLASS(klass : Pointer) : Tgboolean;
begin

implementation

function GST_TYPE_DEVICE_PROVIDER_FACTORY : TGType;
  begin
    GST_TYPE_DEVICE_PROVIDER_FACTORY:=gst_device_provider_factory_get_type;
  end;

function GST_DEVICE_PROVIDER_FACTORY(obj : Pointer) : PGstDeviceProviderFactory;
begin
  Result := PGstDeviceProviderFactory(g_type_check_instance_cast(obj, GST_TYPE_DEVICE_PROVIDER_FACTORY));
end;

function GST_DEVICE_PROVIDER_FACTORY_CLASS(klass : Pointer) : PGstDeviceProviderFactoryClass;
begin
  Result := PGstDeviceProviderFactoryClass(g_type_check_class_cast(klass, GST_TYPE_DEVICE_PROVIDER_FACTORY));
end;

function GST_IS_DEVICE_PROVIDER_FACTORY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_DEVICE_PROVIDER_FACTORY);
end;

function GST_IS_DEVICE_PROVIDER_FACTORY_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_DEVICE_PROVIDER_FACTORY);
end;

begin
  GST_DEVICE_PROVIDER_FACTORY_CAST:=PGstDeviceProviderFactory(obj);
  Result := PGstDeviceProviderFactoryClass(PGTypeInstance(obj)^.g_class);



end.
