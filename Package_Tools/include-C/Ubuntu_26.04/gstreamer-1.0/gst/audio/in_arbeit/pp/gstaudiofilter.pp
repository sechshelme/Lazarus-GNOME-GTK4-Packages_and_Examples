
unit gstaudiofilter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstaudiofilter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstaudiofilter.h
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
PGstAudioFilter  = ^GstAudioFilter;
PGstAudioFilterClass  = ^GstAudioFilterClass;
PGstAudioInfo  = ^GstAudioInfo;
PGstCaps  = ^GstCaps;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <1999> Erik Walthinsen <omega@cse.ogi.edu>
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
{$ifndef __GST_AUDIO_AUDIO_H__}
{$include <gst/audio/audio.h>}
{$endif}
{$ifndef __GST_AUDIO_FILTER_H__}
{$define __GST_AUDIO_FILTER_H__}
{$include <gst/gst.h>}
{$include <gst/base/gstbasetransform.h>}
type

{ was #define dname def_expr }
function GST_TYPE_AUDIO_FILTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_FILTER_CAST(obj : longint) : PGstAudioFilter;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_FILTER_CLASS_CAST(klass : longint) : PGstAudioFilterClass;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_FILTER_CLASS(klass : longint) : longint;

{*
 * GstAudioFilter:
 *
 * Base class for audio filters with the same format for input and output.
  }
{< protected > }
{ currently configured format  }
{< private > }
type
  PGstAudioFilter = ^TGstAudioFilter;
  TGstAudioFilter = record
      basetransform : TGstBaseTransform;
      info : TGstAudioInfo;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_AUDIO_FILTER_INFO(filter : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_FORMAT(filter : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_RATE(filter : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_CHANNELS(filter : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_BPF(filter : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_BPS(filter : longint) : longint;

{*
 * GstAudioFilterClass:
 * @basetransformclass: parent class
 * @setup: virtual function called whenever the format changes
 *
 * In addition to the @setup virtual function, you should also override the
 * GstBaseTransform::transform and/or GstBaseTransform::transform_ip virtual
 * function.
  }
{ virtual function, called whenever the format changes  }
(* Const before type ignored *)
{< private > }
type
  PGstAudioFilterClass = ^TGstAudioFilterClass;
  TGstAudioFilterClass = record
      basetransformclass : TGstBaseTransformClass;
      setup : function (filter:PGstAudioFilter; info:PGstAudioInfo):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_audio_filter_get_type:TGType;cdecl;external;
procedure gst_audio_filter_class_add_pad_templates(klass:PGstAudioFilterClass; allowed_caps:PGstCaps);cdecl;external;
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioFilter, gst_object_unref) }
{$endif}
{ __GST_AUDIO_FILTER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_AUDIO_FILTER : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_FILTER:=gst_audio_filter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER(obj : longint) : longint;
begin
  GST_AUDIO_FILTER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AUDIO_FILTER,GstAudioFilter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_FILTER_CAST(obj : longint) : PGstAudioFilter;
begin
  GST_AUDIO_FILTER_CAST:=PGstAudioFilter(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_CLASS(klass : longint) : longint;
begin
  GST_AUDIO_FILTER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AUDIO_FILTER,GstAudioFilterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_FILTER_CLASS_CAST(klass : longint) : PGstAudioFilterClass;
begin
  GST_AUDIO_FILTER_CLASS_CAST:=PGstAudioFilterClass(klass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_GET_CLASS(obj : longint) : longint;
begin
  GST_AUDIO_FILTER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AUDIO_FILTER,GstAudioFilterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_FILTER(obj : longint) : longint;
begin
  GST_IS_AUDIO_FILTER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AUDIO_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_FILTER_CLASS(klass : longint) : longint;
begin
  GST_IS_AUDIO_FILTER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AUDIO_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_INFO(filter : longint) : longint;
begin
  GST_AUDIO_FILTER_INFO:=@((GST_AUDIO_FILTER_CAST(filter))^.info);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_FORMAT(filter : longint) : longint;
begin
  GST_AUDIO_FILTER_FORMAT:=GST_AUDIO_INFO_FORMAT(GST_AUDIO_FILTER_INFO(filter));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_RATE(filter : longint) : longint;
begin
  GST_AUDIO_FILTER_RATE:=GST_AUDIO_INFO_RATE(GST_AUDIO_FILTER_INFO(filter));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_CHANNELS(filter : longint) : longint;
begin
  GST_AUDIO_FILTER_CHANNELS:=GST_AUDIO_INFO_CHANNELS(GST_AUDIO_FILTER_INFO(filter));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_BPF(filter : longint) : longint;
begin
  GST_AUDIO_FILTER_BPF:=GST_AUDIO_INFO_BPF(GST_AUDIO_FILTER_INFO(filter));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_FILTER_BPS(filter : longint) : longint;
begin
  GST_AUDIO_FILTER_BPS:=GST_AUDIO_INFO_BPS(GST_AUDIO_FILTER_INFO(filter));
end;


end.
