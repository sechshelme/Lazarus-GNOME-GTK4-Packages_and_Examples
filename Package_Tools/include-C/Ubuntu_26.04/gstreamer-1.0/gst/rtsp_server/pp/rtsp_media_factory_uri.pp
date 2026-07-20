
unit rtsp_media_factory_uri;
interface

{
  Automatically converted by H2Pas 1.0.0 from rtsp_media_factory_uri.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rtsp_media_factory_uri.h
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
PGstRTSPMediaFactoryURI  = ^GstRTSPMediaFactoryURI;
PGstRTSPMediaFactoryURIClass  = ^GstRTSPMediaFactoryURIClass;
PGstRTSPMediaFactoryURIPrivate  = ^GstRTSPMediaFactoryURIPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2008 Wim Taymans <wim.taymans at gmail.com>
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
{$include <gst/gst.h>}
{$include "rtsp-media-factory.h"}
{$ifndef __GST_RTSP_MEDIA_FACTORY_URI_H__}
{$define __GST_RTSP_MEDIA_FACTORY_URI_H__}
{ types for the media factory  }

{ was #define dname def_expr }
function GST_TYPE_RTSP_MEDIA_FACTORY_URI : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MEDIA_FACTORY_URI(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MEDIA_FACTORY_URI_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_FACTORY_URI_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_FACTORY_URI(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_FACTORY_URI_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MEDIA_FACTORY_URI_CAST(obj : longint) : PGstRTSPMediaFactoryURI;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MEDIA_FACTORY_URI_CLASS_CAST(klass : longint) : PGstRTSPMediaFactoryURIClass;

type
{*
 * GstRTSPMediaFactoryURI:
 *
 * A media factory that creates a pipeline to play any uri.
  }
{< private > }
  PGstRTSPMediaFactoryURI = ^TGstRTSPMediaFactoryURI;
  TGstRTSPMediaFactoryURI = record
      parent : TGstRTSPMediaFactory;
      priv : PGstRTSPMediaFactoryURIPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstRTSPMediaFactoryURIClass:
 *
 * The #GstRTSPMediaFactoryURI class structure.
  }
{< private > }
  PGstRTSPMediaFactoryURIClass = ^TGstRTSPMediaFactoryURIClass;
  TGstRTSPMediaFactoryURIClass = record
      parent_class : TGstRTSPMediaFactoryClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_media_factory_uri_get_type:TGType;cdecl;external;
{ creating the factory  }
function gst_rtsp_media_factory_uri_new:PGstRTSPMediaFactoryURI;cdecl;external;
{ configuring the factory  }
(* Const before type ignored *)
procedure gst_rtsp_media_factory_uri_set_uri(factory:PGstRTSPMediaFactoryURI; uri:Pgchar);cdecl;external;
function gst_rtsp_media_factory_uri_get_uri(factory:PGstRTSPMediaFactoryURI):Pgchar;cdecl;external;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPMediaFactoryURI, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_MEDIA_FACTORY_URI_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_RTSP_MEDIA_FACTORY_URI : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_MEDIA_FACTORY_URI:=gst_rtsp_media_factory_uri_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MEDIA_FACTORY_URI(obj : longint) : longint;
begin
  GST_IS_RTSP_MEDIA_FACTORY_URI:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_MEDIA_FACTORY_URI);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MEDIA_FACTORY_URI_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_MEDIA_FACTORY_URI_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_MEDIA_FACTORY_URI);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_FACTORY_URI_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_MEDIA_FACTORY_URI_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_MEDIA_FACTORY_URI,GstRTSPMediaFactoryURIClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_FACTORY_URI(obj : longint) : longint;
begin
  GST_RTSP_MEDIA_FACTORY_URI:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_MEDIA_FACTORY_URI,GstRTSPMediaFactoryURI);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_FACTORY_URI_CLASS(klass : longint) : longint;
begin
  GST_RTSP_MEDIA_FACTORY_URI_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_MEDIA_FACTORY_URI,GstRTSPMediaFactoryURIClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MEDIA_FACTORY_URI_CAST(obj : longint) : PGstRTSPMediaFactoryURI;
begin
  GST_RTSP_MEDIA_FACTORY_URI_CAST:=PGstRTSPMediaFactoryURI(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MEDIA_FACTORY_URI_CLASS_CAST(klass : longint) : PGstRTSPMediaFactoryURIClass;
begin
  GST_RTSP_MEDIA_FACTORY_URI_CLASS_CAST:=PGstRTSPMediaFactoryURIClass(klass);
end;


end.
