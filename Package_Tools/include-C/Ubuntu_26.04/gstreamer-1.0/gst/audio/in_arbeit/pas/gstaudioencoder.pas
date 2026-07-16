unit gstaudioencoder;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2011 Mark Nauwelaerts <mark.nauwelaerts@collabora.co.uk>.
 * Copyright (C) 2011 Nokia Corporation. All rights reserved.
 *   Contact: Stefan Kost <stefan.kost@nokia.com>
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
{$ifndef __GST_AUDIO_ENCODER_H__}
{$define __GST_AUDIO_ENCODER_H__}
{$include <gst/gst.h>}

{ was #define dname def_expr }
function GST_TYPE_AUDIO_ENCODER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_ENCODER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_ENCODER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_ENCODER_CAST(obj : longint) : PGstAudioEncoder;

{*
 * GST_AUDIO_ENCODER_SINK_NAME:
 *
 * the name of the templates for the sink pad
  }
const
  GST_AUDIO_ENCODER_SINK_NAME = 'sink';  
{*
 * GST_AUDIO_ENCODER_SRC_NAME:
 *
 * the name of the templates for the source pad
  }
  GST_AUDIO_ENCODER_SRC_NAME = 'src';  
{*
 * GST_AUDIO_ENCODER_SRC_PAD:
 * @obj: audio encoder instance
 *
 * Gives the pointer to the source #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_AUDIO_ENCODER_SRC_PAD(obj : longint) : longint;

{*
 * GST_AUDIO_ENCODER_SINK_PAD:
 * @obj: audio encoder instance
 *
 * Gives the pointer to the sink #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_SINK_PAD(obj : longint) : longint;

{*
 * GST_AUDIO_ENCODER_INPUT_SEGMENT:
 * @obj: base parse instance
 *
 * Gives the input segment of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_INPUT_SEGMENT(obj : longint) : longint;

{*
 * GST_AUDIO_ENCODER_OUTPUT_SEGMENT:
 * @obj: base parse instance
 *
 * Gives the output segment of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_OUTPUT_SEGMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_STREAM_LOCK(enc : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_STREAM_UNLOCK(enc : longint) : longint;

type
{*
 * GstAudioEncoder:
 *
 * The opaque #GstAudioEncoder data structure.
  }
{< protected > }
{ source and sink pads  }
{ protects all data processing, i.e. is locked
   * in the chain function, finish_frame and when
   * processing serialized events  }
{ MT-protected (with STREAM_LOCK)  }
{< private > }
  PGstAudioEncoder = ^TGstAudioEncoder;
  TGstAudioEncoder = record
      element : TGstElement;
      sinkpad : PGstPad;
      srcpad : PGstPad;
      stream_lock : TGRecMutex;
      input_segment : TGstSegment;
      output_segment : TGstSegment;
      priv : PGstAudioEncoderPrivate;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
 * GstAudioEncoderClass:
 * @element_class:  The parent class structure
 * @start:          Optional.
 *                  Called when the element starts processing.
 *                  Allows opening external resources.
 * @stop:           Optional.
 *                  Called when the element stops processing.
 *                  Allows closing external resources.
 * @set_format:     Notifies subclass of incoming data format.
 *                  GstAudioInfo contains the format according to provided caps.
 * @handle_frame:   Provides input samples (or NULL to clear any remaining data)
 *                  according to directions as configured by the subclass
 *                  using the API.  Input data ref management is performed
 *                  by base class, subclass should not care or intervene,
 *                  and input data is only valid until next call to base class,
 *                  most notably a call to gst_audio_encoder_finish_frame().
 * @flush:          Optional.
 *                  Instructs subclass to clear any codec caches and discard
 *                  any pending samples and not yet returned encoded data.
 * @sink_event:     Optional.
 *                  Event handler on the sink pad. Subclasses should chain up to
 *                  the parent implementation to invoke the default handler.
 * @src_event:      Optional.
 *                  Event handler on the src pad. Subclasses should chain up to
 *                  the parent implementation to invoke the default handler.
 * @pre_push:       Optional.
 *                  Called just prior to pushing (encoded data) buffer downstream.
 *                  Subclass has full discretionary access to buffer,
 *                  and a not OK flow return will abort downstream pushing.
 * @getcaps:        Optional.
 *                  Allows for a custom sink getcaps implementation (e.g.
 *                  for multichannel input specification).  If not implemented,
 *                  default returns gst_audio_encoder_proxy_getcaps
 *                  applied to sink template caps.
 * @open:           Optional.
 *                  Called when the element changes to GST_STATE_READY.
 *                  Allows opening external resources.
 * @close:          Optional.
 *                  Called when the element changes to GST_STATE_NULL.
 *                  Allows closing external resources.
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
 * @transform_meta: Optional. Transform the metadata on the input buffer to the
 *                  output buffer. By default this method copies all meta without
 *                  tags and meta with only the "audio" tag. subclasses can
 *                  implement this method and return %TRUE if the metadata is to be
 *                  copied. Since: 1.6
 * @sink_query:     Optional.
 *                  Query handler on the sink pad. This function should
 *                  return TRUE if the query could be performed. Subclasses
 *                  should chain up to the parent implementation to invoke the
 *                  default handler. Since: 1.6
 * @src_query:      Optional.
 *                  Query handler on the source pad. This function should
 *                  return TRUE if the query could be performed. Subclasses
 *                  should chain up to the parent implementation to invoke the
 *                  default handler. Since: 1.6
 *
 * Subclasses can override any of the available virtual methods or not, as
 * needed. At minimum @set_format and @handle_frame needs to be overridden.
  }
{< public > }
{ virtual methods for subclasses  }
{< private > }
  PGstAudioEncoderClass = ^TGstAudioEncoderClass;
  TGstAudioEncoderClass = record
      element_class : TGstElementClass;
      start : function (enc:PGstAudioEncoder):Tgboolean;cdecl;
      stop : function (enc:PGstAudioEncoder):Tgboolean;cdecl;
      set_format : function (enc:PGstAudioEncoder; info:PGstAudioInfo):Tgboolean;cdecl;
      handle_frame : function (enc:PGstAudioEncoder; buffer:PGstBuffer):TGstFlowReturn;cdecl;
      flush : procedure (enc:PGstAudioEncoder);cdecl;
      pre_push : function (enc:PGstAudioEncoder; buffer:PPGstBuffer):TGstFlowReturn;cdecl;
      sink_event : function (enc:PGstAudioEncoder; event:PGstEvent):Tgboolean;cdecl;
      src_event : function (enc:PGstAudioEncoder; event:PGstEvent):Tgboolean;cdecl;
      getcaps : function (enc:PGstAudioEncoder; filter:PGstCaps):PGstCaps;cdecl;
      open : function (enc:PGstAudioEncoder):Tgboolean;cdecl;
      close : function (enc:PGstAudioEncoder):Tgboolean;cdecl;
      negotiate : function (enc:PGstAudioEncoder):Tgboolean;cdecl;
      decide_allocation : function (enc:PGstAudioEncoder; query:PGstQuery):Tgboolean;cdecl;
      propose_allocation : function (enc:PGstAudioEncoder; query:PGstQuery):Tgboolean;cdecl;
      transform_meta : function (enc:PGstAudioEncoder; outbuf:PGstBuffer; meta:PGstMeta; inbuf:PGstBuffer):Tgboolean;cdecl;
      sink_query : function (encoder:PGstAudioEncoder; query:PGstQuery):Tgboolean;cdecl;
      src_query : function (encoder:PGstAudioEncoder; query:PGstQuery):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE-3)-1] of Tgpointer;
    end;


function gst_audio_encoder_get_type:TGType;cdecl;external libgstaudio;
function gst_audio_encoder_finish_frame(enc:PGstAudioEncoder; buffer:PGstBuffer; samples:Tgint):TGstFlowReturn;cdecl;external libgstaudio;
function gst_audio_encoder_proxy_getcaps(enc:PGstAudioEncoder; caps:PGstCaps; filter:PGstCaps):PGstCaps;cdecl;external libgstaudio;
function gst_audio_encoder_set_output_format(enc:PGstAudioEncoder; caps:PGstCaps):Tgboolean;cdecl;external libgstaudio;
function gst_audio_encoder_negotiate(enc:PGstAudioEncoder):Tgboolean;cdecl;external libgstaudio;
function gst_audio_encoder_allocate_output_buffer(enc:PGstAudioEncoder; size:Tgsize):PGstBuffer;cdecl;external libgstaudio;
{ context parameters  }
function gst_audio_encoder_get_audio_info(enc:PGstAudioEncoder):PGstAudioInfo;cdecl;external libgstaudio;
function gst_audio_encoder_get_frame_samples_min(enc:PGstAudioEncoder):Tgint;cdecl;external libgstaudio;
procedure gst_audio_encoder_set_frame_samples_min(enc:PGstAudioEncoder; num:Tgint);cdecl;external libgstaudio;
function gst_audio_encoder_get_frame_samples_max(enc:PGstAudioEncoder):Tgint;cdecl;external libgstaudio;
procedure gst_audio_encoder_set_frame_samples_max(enc:PGstAudioEncoder; num:Tgint);cdecl;external libgstaudio;
function gst_audio_encoder_get_frame_max(enc:PGstAudioEncoder):Tgint;cdecl;external libgstaudio;
procedure gst_audio_encoder_set_frame_max(enc:PGstAudioEncoder; num:Tgint);cdecl;external libgstaudio;
function gst_audio_encoder_get_lookahead(enc:PGstAudioEncoder):Tgint;cdecl;external libgstaudio;
procedure gst_audio_encoder_set_lookahead(enc:PGstAudioEncoder; num:Tgint);cdecl;external libgstaudio;
procedure gst_audio_encoder_get_latency(enc:PGstAudioEncoder; min:PGstClockTime; max:PGstClockTime);cdecl;external libgstaudio;
procedure gst_audio_encoder_set_latency(enc:PGstAudioEncoder; min:TGstClockTime; max:TGstClockTime);cdecl;external libgstaudio;
procedure gst_audio_encoder_set_headers(enc:PGstAudioEncoder; headers:PGList);cdecl;external libgstaudio;
procedure gst_audio_encoder_set_allocation_caps(enc:PGstAudioEncoder; allocation_caps:PGstCaps);cdecl;external libgstaudio;
{ object properties  }
procedure gst_audio_encoder_set_mark_granule(enc:PGstAudioEncoder; enabled:Tgboolean);cdecl;external libgstaudio;
function gst_audio_encoder_get_mark_granule(enc:PGstAudioEncoder):Tgboolean;cdecl;external libgstaudio;
procedure gst_audio_encoder_set_perfect_timestamp(enc:PGstAudioEncoder; enabled:Tgboolean);cdecl;external libgstaudio;
function gst_audio_encoder_get_perfect_timestamp(enc:PGstAudioEncoder):Tgboolean;cdecl;external libgstaudio;
procedure gst_audio_encoder_set_hard_resync(enc:PGstAudioEncoder; enabled:Tgboolean);cdecl;external libgstaudio;
function gst_audio_encoder_get_hard_resync(enc:PGstAudioEncoder):Tgboolean;cdecl;external libgstaudio;
procedure gst_audio_encoder_set_tolerance(enc:PGstAudioEncoder; tolerance:TGstClockTime);cdecl;external libgstaudio;
function gst_audio_encoder_get_tolerance(enc:PGstAudioEncoder):TGstClockTime;cdecl;external libgstaudio;
procedure gst_audio_encoder_set_hard_min(enc:PGstAudioEncoder; enabled:Tgboolean);cdecl;external libgstaudio;
function gst_audio_encoder_get_hard_min(enc:PGstAudioEncoder):Tgboolean;cdecl;external libgstaudio;
procedure gst_audio_encoder_set_drainable(enc:PGstAudioEncoder; enabled:Tgboolean);cdecl;external libgstaudio;
function gst_audio_encoder_get_drainable(enc:PGstAudioEncoder):Tgboolean;cdecl;external libgstaudio;
procedure gst_audio_encoder_get_allocator(enc:PGstAudioEncoder; allocator:PPGstAllocator; params:PGstAllocationParams);cdecl;external libgstaudio;
procedure gst_audio_encoder_merge_tags(enc:PGstAudioEncoder; tags:PGstTagList; mode:TGstTagMergeMode);cdecl;external libgstaudio;
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioEncoder, gst_object_unref) }
{$endif}
{ __GST_AUDIO_ENCODER_H__  }

// === Konventiert am: 16-7-26 15:17:17 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_AUDIO_ENCODER : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_ENCODER:=gst_audio_encoder_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER(obj : longint) : longint;
begin
  GST_AUDIO_ENCODER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AUDIO_ENCODER,GstAudioEncoder);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_CLASS(klass : longint) : longint;
begin
  GST_AUDIO_ENCODER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AUDIO_ENCODER,GstAudioEncoderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_GET_CLASS(obj : longint) : longint;
begin
  GST_AUDIO_ENCODER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AUDIO_ENCODER,GstAudioEncoderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_ENCODER(obj : longint) : longint;
begin
  GST_IS_AUDIO_ENCODER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AUDIO_ENCODER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_ENCODER_CLASS(klass : longint) : longint;
begin
  GST_IS_AUDIO_ENCODER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AUDIO_ENCODER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_ENCODER_CAST(obj : longint) : PGstAudioEncoder;
begin
  GST_AUDIO_ENCODER_CAST:=PGstAudioEncoder(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_SRC_PAD(obj : longint) : longint;
begin
  GST_AUDIO_ENCODER_SRC_PAD:=(GST_AUDIO_ENCODER_CAST(obj))^.srcpad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_SINK_PAD(obj : longint) : longint;
begin
  GST_AUDIO_ENCODER_SINK_PAD:=(GST_AUDIO_ENCODER_CAST(obj))^.sinkpad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_INPUT_SEGMENT(obj : longint) : longint;
begin
  GST_AUDIO_ENCODER_INPUT_SEGMENT:=(GST_AUDIO_ENCODER_CAST(obj))^.input_segment;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_OUTPUT_SEGMENT(obj : longint) : longint;
begin
  GST_AUDIO_ENCODER_OUTPUT_SEGMENT:=(GST_AUDIO_ENCODER_CAST(obj))^.output_segment;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_STREAM_LOCK(enc : longint) : longint;
begin
  GST_AUDIO_ENCODER_STREAM_LOCK:=g_rec_mutex_lock(@((GST_AUDIO_ENCODER(enc))^.stream_lock));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_ENCODER_STREAM_UNLOCK(enc : longint) : longint;
begin
  GST_AUDIO_ENCODER_STREAM_UNLOCK:=g_rec_mutex_unlock(@((GST_AUDIO_ENCODER(enc))^.stream_lock));
end;


end.
