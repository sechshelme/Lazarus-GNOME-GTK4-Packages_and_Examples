
unit gsttocsetter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsttocsetter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttocsetter.h
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
PGstToc  = ^GstToc;
PGstTocSetter  = ^GstTocSetter;
PGstTocSetterInterface  = ^GstTocSetterInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2010, 2012 Alexander Saprykin <xelfium@gmail.com>
 *
 * gsttocsetter.h: Interfaces for TOC
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
{$ifndef __GST_TOC_SETTER_H__}
{$define __GST_TOC_SETTER_H__}
{$include <gst/gst.h>}

{ was #define dname def_expr }
function GST_TYPE_TOC_SETTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TOC_SETTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TOC_SETTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TOC_SETTER_GET_IFACE(obj : longint) : longint;

{*
 * GstTocSetter:
 *
 * Opaque #GstTocSetter data structure.
  }
type
{*
 * GstTocSetterInterface:
 * @g_iface: parent interface type.
 *
 * #GstTocSetterInterface interface.
  }
{ signals  }
{ virtual table  }
  PGstTocSetterInterface = ^TGstTocSetterInterface;
  TGstTocSetterInterface = record
      g_iface : TGTypeInterface;
    end;


function gst_toc_setter_get_type:TGType;cdecl;external;
procedure gst_toc_setter_reset(setter:PGstTocSetter);cdecl;external;
function gst_toc_setter_get_toc(setter:PGstTocSetter):PGstToc;cdecl;external;
procedure gst_toc_setter_set_toc(setter:PGstTocSetter; toc:PGstToc);cdecl;external;
{$endif}
{ __GST_TOC_SETTER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_TOC_SETTER : longint; { return type might be wrong }
  begin
    GST_TYPE_TOC_SETTER:=gst_toc_setter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TOC_SETTER(obj : longint) : longint;
begin
  GST_TOC_SETTER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_TOC_SETTER,GstTocSetter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TOC_SETTER(obj : longint) : longint;
begin
  GST_IS_TOC_SETTER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_TOC_SETTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TOC_SETTER_GET_IFACE(obj : longint) : longint;
begin
  GST_TOC_SETTER_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GST_TYPE_TOC_SETTER,GstTocSetterInterface);
end;


end.
