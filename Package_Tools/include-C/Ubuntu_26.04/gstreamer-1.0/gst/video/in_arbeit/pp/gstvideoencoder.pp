
unit gstvideoencoder;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvideoencoder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvideoencoder.h
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
PGList  = ^GList;
PGstAllocationParams  = ^GstAllocationParams;
PGstAllocator  = ^GstAllocator;
PGstBuffer  = ^GstBuffer;
PGstCaps  = ^GstCaps;
PGstClockTime  = ^GstClockTime;
PGstEvent  = ^GstEvent;
PGstMeta  = ^GstMeta;
PGstPad  = ^GstPad;
PGstQuery  = ^GstQuery;
PGstTagList  = ^GstTagList;
PGstVideoCodecFrame  = ^GstVideoCodecFrame;
PGstVideoCodecState  = ^GstVideoCodecState;
PGstVideoEncoder  = ^GstVideoEncoder;
PGstVideoEncoderClass  = ^GstVideoEncoderClass;
PGstVideoEncoderPrivate  = ^GstVideoEncoderPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2008 David Schleef <ds@schleef.org>
 * Copyright (C) 2011 Mark Nauwelaerts <mark.nauwelaerts@collabora.co.uk>.
 * Copyright (C) 2011 Nokia Corporation. All rights reserved.
 *   Contact: Stefan Kost <stefan.kost@nokia.com>
 * Copyright (C) 2012 Collabora Ltd.
 *	Author : Edward Hervey <edward@collabora.com>
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
{$ifndef _GST_VIDEO_ENCODER_H_}
{$define _GST_VIDEO_ENCODER_H_}
{$include <gst/video/gstvideoutils.h>}

{ was #define dname def_expr }
function GST_TYPE_VIDEO_ENCODER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_ENCODER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_ENCODER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_ENCODER_CAST(enc : longint) : PGstVideoEncoder;

{*
 * GST_VIDEO_ENCODER_SINK_NAME:
 *
 * The name of the templates for the sink pad.
  }
const
  GST_VIDEO_ENCODER_SINK_NAME = 'sink';  
{*
 * GST_VIDEO_ENCODER_SRC_NAME:
 *
 * The name of the templates for the source pad.
  }
  GST_VIDEO_ENCODER_SRC_NAME = 'src';  
{*
 * GST_VIDEO_ENCODER_SRC_PAD:
 * @obj: a #GstVideoEncoder
 *
 * Gives the pointer to the source #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_VIDEO_ENCODER_SRC_PAD(obj : longint) : longint;

{*
 * GST_VIDEO_ENCODER_SINK_PAD:
 * @obj: a #GstVideoEncoder
 *
 * Gives the pointer to the sink #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER_SINK_PAD(obj : longint) : longint;

{*
 * GST_VIDEO_ENCODER_FLOW_NEED_DATA:
 *
 * Returned while parsing to indicate more data is needed.
 * }
const
  GST_VIDEO_ENCODER_FLOW_NEED_DATA = GST_FLOW_CUSTOM_SUCCESS;  
{*
 * GST_VIDEO_ENCODER_FLOW_DROPPED:
 *
 * Returned when the event/buffer should be dropped.
 *
 * Deprecated: since 1.8. use gst_video_encoder_finish_frame with
 * a %NULL frame->output_buffer to drop the frame instead.
  }
{$ifndef GST_DISABLE_DEPRECATED}

const
  GST_VIDEO_ENCODER_FLOW_DROPPED = GST_FLOW_CUSTOM_SUCCESS_1;  
{$endif}
{*
 * GST_VIDEO_ENCODER_INPUT_SEGMENT:
 * @obj: base parse instance
 *
 * Gives the segment of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_VIDEO_ENCODER_INPUT_SEGMENT(obj : longint) : longint;

{*
 * GST_VIDEO_ENCODER_OUTPUT_SEGMENT:
 * @obj: base parse instance
 *
 * Gives the segment of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER_OUTPUT_SEGMENT(obj : longint) : longint;

{*
 * GST_VIDEO_ENCODER_STREAM_LOCK:
 * @encoder: video encoder instance
 *
 * Obtain a lock to protect the encoder function from concurrent access.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER_STREAM_LOCK(encoder : longint) : longint;

{*
 * GST_VIDEO_ENCODER_STREAM_UNLOCK:
 * @encoder: video encoder instance
 *
 * Release the lock that protects the encoder function from concurrent access.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER_STREAM_UNLOCK(encoder : longint) : longint;

type
{*
 * GstVideoEncoder:
 *
 * The opaque #GstVideoEncoder data structure.
  }
{< private > }
{< protected > }
{ protects all data processing, i.e. is locked
   * in the chain function, finish_frame and when
   * processing serialized events  }
{ MT-protected (with STREAM_LOCK)  }
{< private > }
  PGstVideoEncoder = ^TGstVideoEncoder;
  TGstVideoEncoder = record
      element : TGstElement;
      sinkpad : PGstPad;
      srcpad : PGstPad;
      stream_lock : TGRecMutex;
      input_segment : TGstSegment;
      output_segment : TGstSegment;
      priv : PGstVideoEncoderPrivate;
      padding : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
 * GstVideoEncoderClass:
 * @open:           Optional.
 *                  Called when the element changes to GST_STATE_READY.
 *                  Allows opening external resources.
 * @close:          Optional.
 *                  Called when the element changes to GST_STATE_NULL.
 *                  Allows closing external resources.
 * @start:          Optional.
 *                  Called when the element starts processing.
 *                  Allows opening external resources.
 * @stop:           Optional.
 *                  Called when the element stops processing.
 *                  Allows closing external resources.
 * @set_format:     Optional.
 *                  Notifies subclass of incoming data format.
 *                  GstVideoCodecState fields have already been
 *                  set according to provided caps.
 * @handle_frame:   Provides input frame to subclass.
 * @reset:          Optional.
 *                  Allows subclass (encoder) to perform post-seek semantics reset.
 *                  Deprecated.
 * @finish:         Optional.
 *                  Called to request subclass to dispatch any pending remaining
 *                  data (e.g. at EOS).
 * @pre_push:       Optional.
 *                  Allows subclass to push frame downstream in whatever
 *                  shape or form it deems appropriate.  If not provided,
 *                  provided encoded frame data is simply pushed downstream.
 * @getcaps:        Optional.
 *                  Allows for a custom sink getcaps implementation (e.g.
 *                  for multichannel input specification).  If not implemented,
 *                  default returns gst_video_encoder_proxy_getcaps
 *                  applied to sink template caps.
 * @sink_event:     Optional.
 *                  Event handler on the sink pad. This function should return
 *                  TRUE if the event was handled and should be discarded
 *                  (i.e. not unref'ed).
 *                  Subclasses should chain up to the parent implementation to
 *                  invoke the default handler.
 * @src_event:      Optional.
 *                  Event handler on the source pad. This function should return
 *                  TRUE if the event was handled and should be discarded
 *                  (i.e. not unref'ed).
 *                  Subclasses should chain up to the parent implementation to
 *                  invoke the default handler.
 * @negotiate:      Optional.
 *                  Negotiate with downstream and configure buffer pools, etc.
 *                  Subclasses should chain up to the parent implementation to
 *                  invoke the default handler.
 * @decide_allocation: Optional.
 *                     Setup the allocation parameters for allocating output
 *                     buffers. The passed in query contains the result of the
 *                     downstream allocation query.
 *                     Subclasses should chain up to the parent implementation to
 *                     invoke the default handler.
 * @propose_allocation: Optional.
 *                      Propose buffer allocation parameters for upstream elements.
 *                      Subclasses should chain up to the parent implementation to
 *                      invoke the default handler.
 * @flush:              Optional.
 *                      Flush all remaining data from the encoder without
 *                      pushing it downstream. Since: 1.2
 * @sink_query:     Optional.
 *                  Query handler on the sink pad. This function should
 *                  return TRUE if the query could be performed. Subclasses
 *                  should chain up to the parent implementation to invoke the
 *                  default handler. Since: 1.4
 * @src_query:      Optional.
 *                  Query handler on the source pad. This function should
 *                  return TRUE if the query could be performed. Subclasses
 *                  should chain up to the parent implementation to invoke the
 *                  default handler. Since: 1.4
 * @transform_meta: Optional. Transform the metadata on the input buffer to the
 *                  output buffer. By default this method is copies all meta without
 *                  tags and meta with only the "video" tag. subclasses can
 *                  implement this method and return %TRUE if the metadata is to be
 *                  copied. Since: 1.6
 *
 * Subclasses can override any of the available virtual methods or not, as
 * needed. At minimum @handle_frame needs to be overridden, and @set_format
 * and @get_caps are likely needed as well.
  }
{< private > }
{< public > }
{ virtual methods for subclasses  }
{< private > }
  PGstVideoEncoderClass = ^TGstVideoEncoderClass;
  TGstVideoEncoderClass = record
      element_class : TGstElementClass;
      open : function (encoder:PGstVideoEncoder):Tgboolean;cdecl;
      close : function (encoder:PGstVideoEncoder):Tgboolean;cdecl;
      start : function (encoder:PGstVideoEncoder):Tgboolean;cdecl;
      stop : function (encoder:PGstVideoEncoder):Tgboolean;cdecl;
      set_format : function (encoder:PGstVideoEncoder; state:PGstVideoCodecState):Tgboolean;cdecl;
      handle_frame : function (encoder:PGstVideoEncoder; frame:PGstVideoCodecFrame):TGstFlowReturn;cdecl;
      reset : function (encoder:PGstVideoEncoder; hard:Tgboolean):Tgboolean;cdecl;
      finish : function (encoder:PGstVideoEncoder):TGstFlowReturn;cdecl;
      pre_push : function (encoder:PGstVideoEncoder; frame:PGstVideoCodecFrame):TGstFlowReturn;cdecl;
      getcaps : function (enc:PGstVideoEncoder; filter:PGstCaps):PGstCaps;cdecl;
      sink_event : function (encoder:PGstVideoEncoder; event:PGstEvent):Tgboolean;cdecl;
      src_event : function (encoder:PGstVideoEncoder; event:PGstEvent):Tgboolean;cdecl;
      negotiate : function (encoder:PGstVideoEncoder):Tgboolean;cdecl;
      decide_allocation : function (encoder:PGstVideoEncoder; query:PGstQuery):Tgboolean;cdecl;
      propose_allocation : function (encoder:PGstVideoEncoder; query:PGstQuery):Tgboolean;cdecl;
      flush : function (encoder:PGstVideoEncoder):Tgboolean;cdecl;
      sink_query : function (encoder:PGstVideoEncoder; query:PGstQuery):Tgboolean;cdecl;
      src_query : function (encoder:PGstVideoEncoder; query:PGstQuery):Tgboolean;cdecl;
      transform_meta : function (encoder:PGstVideoEncoder; frame:PGstVideoCodecFrame; meta:PGstMeta):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE-4)-1] of Tgpointer;
    end;


function gst_video_encoder_get_type:TGType;cdecl;external;
function gst_video_encoder_get_output_state(encoder:PGstVideoEncoder):PGstVideoCodecState;cdecl;external;
function gst_video_encoder_set_output_state(encoder:PGstVideoEncoder; caps:PGstCaps; reference:PGstVideoCodecState):PGstVideoCodecState;cdecl;external;
function gst_video_encoder_negotiate(encoder:PGstVideoEncoder):Tgboolean;cdecl;external;
function gst_video_encoder_get_frame(encoder:PGstVideoEncoder; frame_number:longint):PGstVideoCodecFrame;cdecl;external;
function gst_video_encoder_get_oldest_frame(encoder:PGstVideoEncoder):PGstVideoCodecFrame;cdecl;external;
function gst_video_encoder_get_frames(encoder:PGstVideoEncoder):PGList;cdecl;external;
function gst_video_encoder_allocate_output_buffer(encoder:PGstVideoEncoder; size:Tgsize):PGstBuffer;cdecl;external;
function gst_video_encoder_allocate_output_frame(encoder:PGstVideoEncoder; frame:PGstVideoCodecFrame; size:Tgsize):TGstFlowReturn;cdecl;external;
function gst_video_encoder_finish_frame(encoder:PGstVideoEncoder; frame:PGstVideoCodecFrame):TGstFlowReturn;cdecl;external;
function gst_video_encoder_finish_subframe(encoder:PGstVideoEncoder; frame:PGstVideoCodecFrame):TGstFlowReturn;cdecl;external;
function gst_video_encoder_proxy_getcaps(enc:PGstVideoEncoder; caps:PGstCaps; filter:PGstCaps):PGstCaps;cdecl;external;
procedure gst_video_encoder_set_latency(encoder:PGstVideoEncoder; min_latency:TGstClockTime; max_latency:TGstClockTime);cdecl;external;
procedure gst_video_encoder_get_latency(encoder:PGstVideoEncoder; min_latency:PGstClockTime; max_latency:PGstClockTime);cdecl;external;
procedure gst_video_encoder_set_headers(encoder:PGstVideoEncoder; headers:PGList);cdecl;external;
(* Const before type ignored *)
procedure gst_video_encoder_merge_tags(encoder:PGstVideoEncoder; tags:PGstTagList; mode:TGstTagMergeMode);cdecl;external;
procedure gst_video_encoder_get_allocator(encoder:PGstVideoEncoder; allocator:PPGstAllocator; params:PGstAllocationParams);cdecl;external;
procedure gst_video_encoder_set_min_pts(encoder:PGstVideoEncoder; min_pts:TGstClockTime);cdecl;external;
procedure gst_video_encoder_set_qos_enabled(encoder:PGstVideoEncoder; enabled:Tgboolean);cdecl;external;
function gst_video_encoder_is_qos_enabled(encoder:PGstVideoEncoder):Tgboolean;cdecl;external;
function gst_video_encoder_get_max_encode_time(encoder:PGstVideoEncoder; frame:PGstVideoCodecFrame):TGstClockTimeDiff;cdecl;external;
procedure gst_video_encoder_set_min_force_key_unit_interval(encoder:PGstVideoEncoder; interval:TGstClockTime);cdecl;external;
function gst_video_encoder_get_min_force_key_unit_interval(encoder:PGstVideoEncoder):TGstClockTime;cdecl;external;
procedure gst_video_encoder_release_frame(encoder:PGstVideoEncoder; frame:PGstVideoCodecFrame);cdecl;external;
procedure gst_video_encoder_drop_frame(encoder:PGstVideoEncoder; frame:PGstVideoCodecFrame);cdecl;external;
{////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoEncoder, gst_object_unref) }
{$endif}

implementation

{ was #define dname def_expr }
function GST_TYPE_VIDEO_ENCODER : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_ENCODER:=gst_video_encoder_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER(obj : longint) : longint;
begin
  GST_VIDEO_ENCODER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VIDEO_ENCODER,GstVideoEncoder);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER_CLASS(klass : longint) : longint;
begin
  GST_VIDEO_ENCODER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VIDEO_ENCODER,GstVideoEncoderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER_GET_CLASS(obj : longint) : longint;
begin
  GST_VIDEO_ENCODER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VIDEO_ENCODER,GstVideoEncoderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_ENCODER(obj : longint) : longint;
begin
  GST_IS_VIDEO_ENCODER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VIDEO_ENCODER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_ENCODER_CLASS(klass : longint) : longint;
begin
  GST_IS_VIDEO_ENCODER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VIDEO_ENCODER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_ENCODER_CAST(enc : longint) : PGstVideoEncoder;
begin
  GST_VIDEO_ENCODER_CAST:=PGstVideoEncoder(enc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER_SRC_PAD(obj : longint) : longint;
begin
  GST_VIDEO_ENCODER_SRC_PAD:=(PGstVideoEncoder(obj))^.srcpad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER_SINK_PAD(obj : longint) : longint;
begin
  GST_VIDEO_ENCODER_SINK_PAD:=(PGstVideoEncoder(obj))^.sinkpad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER_INPUT_SEGMENT(obj : longint) : longint;
begin
  GST_VIDEO_ENCODER_INPUT_SEGMENT:=(GST_VIDEO_ENCODER_CAST(obj))^.input_segment;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER_OUTPUT_SEGMENT(obj : longint) : longint;
begin
  GST_VIDEO_ENCODER_OUTPUT_SEGMENT:=(GST_VIDEO_ENCODER_CAST(obj))^.output_segment;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER_STREAM_LOCK(encoder : longint) : longint;
begin
  GST_VIDEO_ENCODER_STREAM_LOCK:=g_rec_mutex_lock(@((GST_VIDEO_ENCODER(encoder))^.stream_lock));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_ENCODER_STREAM_UNLOCK(encoder : longint) : longint;
begin
  GST_VIDEO_ENCODER_STREAM_UNLOCK:=g_rec_mutex_unlock(@((GST_VIDEO_ENCODER(encoder))^.stream_lock));
end;


end.
