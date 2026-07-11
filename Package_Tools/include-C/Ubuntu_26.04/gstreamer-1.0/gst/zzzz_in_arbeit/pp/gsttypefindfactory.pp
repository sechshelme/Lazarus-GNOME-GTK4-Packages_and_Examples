
unit gsttypefindfactory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsttypefindfactory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttypefindfactory.h
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
PGstCaps  = ^GstCaps;
PGstTypeFind  = ^GstTypeFind;
PGstTypeFindFactory  = ^GstTypeFindFactory;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2003 Benjamin Otte <in7y118@public.uni-hamburg.de>
 *
 * gsttypefindfactory.h: typefinding subsystem
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
{$ifndef __GST_TYPE_FIND_FACTORY_H__}
{$define __GST_TYPE_FIND_FACTORY_H__}
{$include <gst/gstcaps.h>}
{$include <gst/gstplugin.h>}
{$include <gst/gstpluginfeature.h>}
{$include <gst/gsttypefind.h>}

{ was #define dname def_expr }
function GST_TYPE_TYPE_FIND_FACTORY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TYPE_FIND_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TYPE_FIND_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TYPE_FIND_FACTORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TYPE_FIND_FACTORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TYPE_FIND_FACTORY_GET_CLASS(obj : longint) : longint;

{*
 * GstTypeFindFactory:
 *
 * Opaque object that stores information about a typefind function.
  }
type
{ typefinding interface  }

function gst_type_find_factory_get_type:TGType;cdecl;external;
function gst_type_find_factory_get_list:PGList;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gst_type_find_factory_get_extensions(factory:PGstTypeFindFactory):^Pgchar;cdecl;external;
function gst_type_find_factory_get_caps(factory:PGstTypeFindFactory):PGstCaps;cdecl;external;
function gst_type_find_factory_has_function(factory:PGstTypeFindFactory):Tgboolean;cdecl;external;
procedure gst_type_find_factory_call_function(factory:PGstTypeFindFactory; find:PGstTypeFind);cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstTypeFindFactory, gst_object_unref) }
{$endif}
{ __GST_TYPE_FIND_FACTORY_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_TYPE_FIND_FACTORY : longint; { return type might be wrong }
  begin
    GST_TYPE_TYPE_FIND_FACTORY:=gst_type_find_factory_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TYPE_FIND_FACTORY(obj : longint) : longint;
begin
  GST_TYPE_FIND_FACTORY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_TYPE_FIND_FACTORY,GstTypeFindFactory);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TYPE_FIND_FACTORY(obj : longint) : longint;
begin
  GST_IS_TYPE_FIND_FACTORY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_TYPE_FIND_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TYPE_FIND_FACTORY_CLASS(klass : longint) : longint;
begin
  GST_TYPE_FIND_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_TYPE_FIND_FACTORY,GstTypeFindFactoryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TYPE_FIND_FACTORY_CLASS(klass : longint) : longint;
begin
  GST_IS_TYPE_FIND_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_TYPE_FIND_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TYPE_FIND_FACTORY_GET_CLASS(obj : longint) : longint;
begin
  GST_TYPE_FIND_FACTORY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_TYPE_FIND_FACTORY,GstTypeFindFactoryClass);
end;


end.
