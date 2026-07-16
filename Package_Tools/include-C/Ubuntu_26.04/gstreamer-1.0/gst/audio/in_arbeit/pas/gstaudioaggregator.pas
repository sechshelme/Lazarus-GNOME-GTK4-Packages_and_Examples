unit gstaudioaggregator;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2014 Collabora
 *   Author: Olivier Crete <olivier.crete@collabora.com>
 *
 * gstaudioaggregator.h:
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
{$ifndef __GST_AUDIO_AGGREGATOR_H__}
{$define __GST_AUDIO_AGGREGATOR_H__}
{$include <gst/gst.h>}
{$include <gst/base/gstaggregator.h>}
{$include <gst/audio/audio.h>}
{******************************
 * GstAudioAggregator Structs  *
 ****************************** }
type
{***********************
 * GstAudioAggregatorPad API *
 ********************** }

{ was #define dname def_expr }
function GST_TYPE_AUDIO_AGGREGATOR_PAD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_PAD_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_AGGREGATOR_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_AGGREGATOR_PAD_CLASS(klass : longint) : longint;

{***************************
 * GstAudioAggregatorPad Structs *
 ************************** }
type
{*
 * GstAudioAggregatorPad:
 * @info: The audio info for this pad set from the incoming caps
 *
 * The default implementation of GstPad used with #GstAudioAggregator
 *
 * Since: 1.14
  }
{< public > }
{ read-only, with OBJECT_LOCK  }
{< private > }
  PGstAudioAggregatorPad = ^TGstAudioAggregatorPad;
  TGstAudioAggregatorPad = record
      parent : TGstAggregatorPad;
      info : TGstAudioInfo;
      priv : PGstAudioAggregatorPadPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstAudioAggregatorPadClass:
 * @convert_buffer: Convert a buffer from one format to another.
 * @update_conversion_info: Called when either the input or output
 *  formats have changed.
 *
 * Since: 1.14
  }
{< private > }
  PGstAudioAggregatorPadClass = ^TGstAudioAggregatorPadClass;
  TGstAudioAggregatorPadClass = record
      parent_class : TGstAggregatorPadClass;
      convert_buffer : function (pad:PGstAudioAggregatorPad; in_info:PGstAudioInfo; out_info:PGstAudioInfo; buffer:PGstBuffer):PGstBuffer;cdecl;
      update_conversion_info : procedure (pad:PGstAudioAggregatorPad);cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;


function gst_audio_aggregator_pad_get_type:TGType;cdecl;external libgstaudio;
{ was #define dname def_expr }
function GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_CONVERT_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_CONVERT_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_CONVERT_PAD_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_AGGREGATOR_CONVERT_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_AGGREGATOR_CONVERT_PAD_CLASS(klass : longint) : longint;

{***************************
 * GstAudioAggregatorPad Structs *
 ************************** }
type
{*
 * GstAudioAggregatorConvertPad:
 *
 * An implementation of GstPad that can be used with #GstAudioAggregator.
 *
 * See #GstAudioAggregator for more details.
 *
 * Since: 1.14
  }
{< private > }
  PGstAudioAggregatorConvertPad = ^TGstAudioAggregatorConvertPad;
  TGstAudioAggregatorConvertPad = record
      parent : TGstAudioAggregatorPad;
      priv : PGstAudioAggregatorConvertPadPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstAudioAggregatorConvertPadClass:
 *
 * Since: 1.14
  }
{< private > }
  PGstAudioAggregatorConvertPadClass = ^TGstAudioAggregatorConvertPadClass;
  TGstAudioAggregatorConvertPadClass = record
      parent_class : TGstAudioAggregatorPadClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_audio_aggregator_convert_pad_get_type:TGType;cdecl;external libgstaudio;
{*************************
 * GstAudioAggregator API *
 ************************* }
{ was #define dname def_expr }
function GST_TYPE_AUDIO_AGGREGATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_AGGREGATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_AGGREGATOR_CLASS(klass : longint) : longint;

{*
 * GstAudioAggregator:
 * @current_caps: The caps set by the subclass
 *
 * GstAudioAggregator object
 *
 * Since: 1.14
  }
{< public > }
{< private > }
type
  PGstAudioAggregator = ^TGstAudioAggregator;
  TGstAudioAggregator = record
      parent : TGstAggregator;
      current_caps : PGstCaps;
      priv : PGstAudioAggregatorPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstAudioAggregatorClass:
 * @create_output_buffer: Create a new output buffer contains num_frames frames.
 * @aggregate_one_buffer: Aggregates one input buffer to the output
 *  buffer.  The in_offset and out_offset are in "frames", which is
 *  the size of a sample times the number of channels. Returns TRUE if
 *  any non-silence was added to the buffer
 *
 * Since: 1.14
  }
{< public > }
{< private > }
  PGstAudioAggregatorClass = ^TGstAudioAggregatorClass;
  TGstAudioAggregatorClass = record
      parent_class : TGstAggregatorClass;
      create_output_buffer : function (aagg:PGstAudioAggregator; num_frames:Tguint):PGstBuffer;cdecl;
      aggregate_one_buffer : function (aagg:PGstAudioAggregator; pad:PGstAudioAggregatorPad; inbuf:PGstBuffer; in_offset:Tguint; outbuf:PGstBuffer; 
                   out_offset:Tguint; num_frames:Tguint):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{************************
 * GstAggregator methods *
 *********************** }

function gst_audio_aggregator_get_type:TGType;cdecl;external libgstaudio;
procedure gst_audio_aggregator_set_sink_caps(aagg:PGstAudioAggregator; pad:PGstAudioAggregatorPad; caps:PGstCaps);cdecl;external libgstaudio;
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioAggregator, gst_object_unref) }
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioAggregatorPad, gst_object_unref) }
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioAggregatorConvertPad, gst_object_unref) }
{$endif}
{ __GST_AUDIO_AGGREGATOR_H__  }

// === Konventiert am: 16-7-26 15:18:18 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_AUDIO_AGGREGATOR_PAD : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_AGGREGATOR_PAD:=gst_audio_aggregator_pad_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_PAD(obj : longint) : longint;
begin
  GST_AUDIO_AGGREGATOR_PAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AUDIO_AGGREGATOR_PAD,GstAudioAggregatorPad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_PAD_CLASS(klass : longint) : longint;
begin
  GST_AUDIO_AGGREGATOR_PAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AUDIO_AGGREGATOR_PAD,GstAudioAggregatorPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_PAD_GET_CLASS(obj : longint) : longint;
begin
  GST_AUDIO_AGGREGATOR_PAD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AUDIO_AGGREGATOR_PAD,GstAudioAggregatorPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_AGGREGATOR_PAD(obj : longint) : longint;
begin
  GST_IS_AUDIO_AGGREGATOR_PAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AUDIO_AGGREGATOR_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_AGGREGATOR_PAD_CLASS(klass : longint) : longint;
begin
  GST_IS_AUDIO_AGGREGATOR_PAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AUDIO_AGGREGATOR_PAD);
end;

{ was #define dname def_expr }
function GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD:=gst_audio_aggregator_convert_pad_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_CONVERT_PAD(obj : longint) : longint;
begin
  GST_AUDIO_AGGREGATOR_CONVERT_PAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD,GstAudioAggregatorConvertPad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_CONVERT_PAD_CLASS(klass : longint) : longint;
begin
  GST_AUDIO_AGGREGATOR_CONVERT_PAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD,GstAudioAggregatorConvertPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_CONVERT_PAD_GET_CLASS(obj : longint) : longint;
begin
  GST_AUDIO_AGGREGATOR_CONVERT_PAD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD,GstAudioAggregatorConvertPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_AGGREGATOR_CONVERT_PAD(obj : longint) : longint;
begin
  GST_IS_AUDIO_AGGREGATOR_CONVERT_PAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_AGGREGATOR_CONVERT_PAD_CLASS(klass : longint) : longint;
begin
  GST_IS_AUDIO_AGGREGATOR_CONVERT_PAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD);
end;

{ was #define dname def_expr }
function GST_TYPE_AUDIO_AGGREGATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_AGGREGATOR:=gst_audio_aggregator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR(obj : longint) : longint;
begin
  GST_AUDIO_AGGREGATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AUDIO_AGGREGATOR,GstAudioAggregator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_CLASS(klass : longint) : longint;
begin
  GST_AUDIO_AGGREGATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AUDIO_AGGREGATOR,GstAudioAggregatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_AGGREGATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_AUDIO_AGGREGATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AUDIO_AGGREGATOR,GstAudioAggregatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_AGGREGATOR(obj : longint) : longint;
begin
  GST_IS_AUDIO_AGGREGATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AUDIO_AGGREGATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_AGGREGATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_AUDIO_AGGREGATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AUDIO_AGGREGATOR);
end;


end.
