
unit gstdeviceproviderfactory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstdeviceproviderfactory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstdeviceproviderfactory.h
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
PGstDeviceProvider  = ^GstDeviceProvider;
PGstDeviceProviderFactory  = ^GstDeviceProviderFactory;
PGstPlugin  = ^GstPlugin;
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

{ was #define dname def_expr }
function GST_TYPE_DEVICE_PROVIDER_FACTORY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_PROVIDER_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_PROVIDER_FACTORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE_PROVIDER_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE_PROVIDER_FACTORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_DEVICE_PROVIDER_FACTORY_CAST(obj : longint) : PGstDeviceProviderFactory;

function gst_device_provider_factory_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_device_provider_factory_find(name:Pgchar):PGstDeviceProviderFactory;cdecl;external;
function gst_device_provider_factory_get_device_provider_type(factory:PGstDeviceProviderFactory):TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_device_provider_factory_get_metadata(factory:PGstDeviceProviderFactory; key:Pgchar):Pgchar;cdecl;external;
function gst_device_provider_factory_get_metadata_keys(factory:PGstDeviceProviderFactory):^Pgchar;cdecl;external;
function gst_device_provider_factory_get(factory:PGstDeviceProviderFactory):PGstDeviceProvider;cdecl;external;
(* Const before type ignored *)
function gst_device_provider_factory_get_by_name(factoryname:Pgchar):PGstDeviceProvider;cdecl;external;
(* Const before type ignored *)
function gst_device_provider_register(plugin:PGstPlugin; name:Pgchar; rank:Tguint; _type:TGType):Tgboolean;cdecl;external;
function gst_device_provider_factory_has_classesv(factory:PGstDeviceProviderFactory; classes:PPgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_device_provider_factory_has_classes(factory:PGstDeviceProviderFactory; classes:Pgchar):Tgboolean;cdecl;external;
function gst_device_provider_factory_list_get_device_providers(minrank:TGstRank):PGList;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstDeviceProviderFactory, gst_object_unref) }
{$endif}
{ __GST_DEVICE_PROVIDER_FACTORY_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_DEVICE_PROVIDER_FACTORY : longint; { return type might be wrong }
  begin
    GST_TYPE_DEVICE_PROVIDER_FACTORY:=gst_device_provider_factory_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_PROVIDER_FACTORY(obj : longint) : longint;
begin
  GST_DEVICE_PROVIDER_FACTORY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_DEVICE_PROVIDER_FACTORY,GstDeviceProviderFactory);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEVICE_PROVIDER_FACTORY_CLASS(klass : longint) : longint;
begin
  GST_DEVICE_PROVIDER_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_DEVICE_PROVIDER_FACTORY,GstDeviceProviderFactoryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE_PROVIDER_FACTORY(obj : longint) : longint;
begin
  GST_IS_DEVICE_PROVIDER_FACTORY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_DEVICE_PROVIDER_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DEVICE_PROVIDER_FACTORY_CLASS(klass : longint) : longint;
begin
  GST_IS_DEVICE_PROVIDER_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_DEVICE_PROVIDER_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_DEVICE_PROVIDER_FACTORY_CAST(obj : longint) : PGstDeviceProviderFactory;
begin
  GST_DEVICE_PROVIDER_FACTORY_CAST:=PGstDeviceProviderFactory(obj);
end;


end.
