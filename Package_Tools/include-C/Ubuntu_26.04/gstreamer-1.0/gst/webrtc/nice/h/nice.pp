
unit nice;
interface

{
  Automatically converted by H2Pas 1.0.0 from nice.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nice
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
PGstWebRTCNice  = ^GstWebRTCNice;
PGstWebRTCNiceClass  = ^GstWebRTCNiceClass;
PGstWebRTCNicePrivate  = ^GstWebRTCNicePrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2017 Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_WEBRTC_NICE_H__}
{$define __GST_WEBRTC_NICE_H__}
{$include "gst/webrtc/ice.h"}
{$include "nicestream.h"}
{$include "nicetransport.h"}
{$include "nice_fwd.h"}

function gst_webrtc_nice_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_WEBRTC_NICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_NICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_NICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_NICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_NICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_NICE_GET_CLASS(obj : longint) : longint;

{*
 * GstWebRTCNice:
  }
type
  PGstWebRTCNice = ^TGstWebRTCNice;
  TGstWebRTCNice = record
      parent : TGstWebRTCICE;
      priv : PGstWebRTCNicePrivate;
    end;

  PGstWebRTCNiceClass = ^TGstWebRTCNiceClass;
  TGstWebRTCNiceClass = record
      parent_class : TGstWebRTCICEClass;
    end;

(* Const before type ignored *)

function gst_webrtc_nice_new(name:Pgchar):PGstWebRTCNice;cdecl;external;
{//////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                (GstWebRTCNice, gst_object_unref) }
{$endif}
{ __GST_WEBRTC_NICE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_WEBRTC_NICE : longint; { return type might be wrong }
  begin
    GST_TYPE_WEBRTC_NICE:=gst_webrtc_nice_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_NICE(obj : longint) : longint;
begin
  GST_WEBRTC_NICE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_WEBRTC_NICE,GstWebRTCNice);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_NICE_CLASS(klass : longint) : longint;
begin
  GST_WEBRTC_NICE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_WEBRTC_NICE,GstWebRTCNiceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_NICE(obj : longint) : longint;
begin
  GST_IS_WEBRTC_NICE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_WEBRTC_NICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_NICE_CLASS(klass : longint) : longint;
begin
  GST_IS_WEBRTC_NICE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_WEBRTC_NICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_NICE_GET_CLASS(obj : longint) : longint;
begin
  GST_WEBRTC_NICE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_WEBRTC_NICE,GstWebRTCNiceClass);
end;


end.
