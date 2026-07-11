
unit gstdynamictypefactory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstdynamictypefactory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstdynamictypefactory.h
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
PGstDynamicTypeFactory  = ^GstDynamicTypeFactory;
PGstPlugin  = ^GstPlugin;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2015 Jan Schmidt <jan@centricular.com>
 *
 * gstdynamictypefactory.h: Header for GstDynamicTypeFactory
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
{$ifndef __GST_DYNAMIC_TYPE_FACTORY_H__}
{$define __GST_DYNAMIC_TYPE_FACTORY_H__}
{*
 * GST_DYNAMIC_TYPE_REGISTER:
 * @t_n: The dynamic type name to register
 * @plugin: The #GstPlugin where to register the dynamic type.
 *
 * This macro can be used to register a dynamic type into a #GstPlugin.
 * This method will be usually called in the plugin init function
 * but can also be called with a NULL plugin.
 *
 * Since: 1.20
  }
{*
 * GstDynamicTypeFactory:
 *
 * The opaque #GstDynamicTypeFactory data structure.
 *
 * Since: 1.12
  }
type
{$include <gst/gstconfig.h>}
{$include <gst/gstplugin.h>}
{$include <gst/gstpluginfeature.h>}

{ was #define dname def_expr }
function GST_TYPE_DYNAMIC_TYPE_FACTORY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DYNAMIC_TYPE_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DYNAMIC_TYPE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DYNAMIC_TYPE_FACTORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DYNAMIC_TYPE_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DYNAMIC_TYPE_FACTORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_DYNAMIC_TYPE_FACTORY_CAST(obj : longint) : PGstDynamicTypeFactory;

function gst_dynamic_type_factory_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_dynamic_type_factory_load(factoryname:Pgchar):TGType;cdecl;external;
function gst_dynamic_type_register(plugin:PGstPlugin; _type:TGType):Tgboolean;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function GST_TYPE_DYNAMIC_TYPE_FACTORY : longint; { return type might be wrong }
  begin
    GST_TYPE_DYNAMIC_TYPE_FACTORY:=gst_dynamic_type_factory_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DYNAMIC_TYPE_FACTORY(obj : longint) : longint;
begin
  GST_DYNAMIC_TYPE_FACTORY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_DYNAMIC_TYPE_FACTORY,GstDynamicTypeFactory);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DYNAMIC_TYPE_CLASS(klass : longint) : longint;
begin
  GST_DYNAMIC_TYPE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_DYNAMIC_TYPE_FACTORY,GstDynamicTypeFactoryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DYNAMIC_TYPE_FACTORY_CLASS(klass : longint) : longint;
begin
  GST_DYNAMIC_TYPE_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_DYNAMIC_TYPE_FACTORY,GstDynamicTypeFactoryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DYNAMIC_TYPE_FACTORY(obj : longint) : longint;
begin
  GST_IS_DYNAMIC_TYPE_FACTORY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_DYNAMIC_TYPE_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DYNAMIC_TYPE_FACTORY_CLASS(klass : longint) : longint;
begin
  GST_IS_DYNAMIC_TYPE_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_DYNAMIC_TYPE_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_DYNAMIC_TYPE_FACTORY_CAST(obj : longint) : PGstDynamicTypeFactory;
begin
  GST_DYNAMIC_TYPE_FACTORY_CAST:=PGstDynamicTypeFactory(obj);
end;


end.
