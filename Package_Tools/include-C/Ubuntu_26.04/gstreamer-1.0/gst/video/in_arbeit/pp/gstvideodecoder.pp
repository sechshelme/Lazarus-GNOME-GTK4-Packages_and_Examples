
unit gstvideodecoder;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvideodecoder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvideodecoder.h
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
PGstAdapter  = ^GstAdapter;
PGstAllocationParams  = ^GstAllocationParams;
PGstAllocator  = ^GstAllocator;
PGstBuffer  = ^GstBuffer;
PGstBufferPool  = ^GstBufferPool;
PGstBufferPoolAcquireParams  = ^GstBufferPoolAcquireParams;
PGstCaps  = ^GstCaps;
PGstClockTime  = ^GstClockTime;
PGstEvent  = ^GstEvent;
PGstMeta  = ^GstMeta;
PGstPad  = ^GstPad;
PGstQuery  = ^GstQuery;
PGstTagList  = ^GstTagList;
PGstVideoCodecFrame  = ^GstVideoCodecFrame;
PGstVideoCodecState  = ^GstVideoCodecState;
PGstVideoDecoder  = ^GstVideoDecoder;
PGstVideoDecoderClass  = ^GstVideoDecoderClass;
PGstVideoDecoderPrivate  = ^GstVideoDecoderPrivate;
PGstVideoDecoderRequestSyncPointFlags  = ^GstVideoDecoderRequestSyncPointFlags;
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
{$ifndef _GST_VIDEO_DECODER_H_}
{$define _GST_VIDEO_DECODER_H_}
{$include <gst/base/gstadapter.h>}
{$include <gst/video/gstvideoutils.h>}

{ was #define dname def_expr }
function GST_TYPE_VIDEO_DECODER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_DECODER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_DECODER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_DECODER_CAST(obj : longint) : PGstVideoDecoder;

{*
 * GST_VIDEO_DECODER_SINK_NAME:
 *
 * The name of the templates for the sink pad.
  }
const
  GST_VIDEO_DECODER_SINK_NAME = 'sink';  
{*
 * GST_VIDEO_DECODER_SRC_NAME:
 *
 * The name of the templates for the source pad.
  }
  GST_VIDEO_DECODER_SRC_NAME = 'src';  
{*
 * GST_VIDEO_DECODER_SRC_PAD:
 * @obj: a #GstVideoDecoder
 *
 * Gives the pointer to the source #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_VIDEO_DECODER_SRC_PAD(obj : longint) : longint;

{*
 * GST_VIDEO_DECODER_SINK_PAD:
 * @obj: a #GstVideoDecoder
 *
 * Gives the pointer to the sink #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER_SINK_PAD(obj : longint) : longint;

{*
 * GST_VIDEO_DECODER_FLOW_NEED_DATA:
 *
 * Returned while parsing to indicate more data is needed.
 * }
const
  GST_VIDEO_DECODER_FLOW_NEED_DATA = GST_FLOW_CUSTOM_SUCCESS;  
{*
 * GST_VIDEO_DECODER_INPUT_SEGMENT:
 * @obj: base decoder instance
 *
 * Gives the segment of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_VIDEO_DECODER_INPUT_SEGMENT(obj : longint) : longint;

{*
 * GST_VIDEO_DECODER_OUTPUT_SEGMENT:
 * @obj: base decoder instance
 *
 * Gives the segment of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER_OUTPUT_SEGMENT(obj : longint) : longint;

{*
 * GST_VIDEO_DECODER_STREAM_LOCK:
 * @decoder: video decoder instance
 *
 * Obtain a lock to protect the decoder function from concurrent access.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER_STREAM_LOCK(decoder : longint) : longint;

{*
 * GST_VIDEO_DECODER_STREAM_UNLOCK:
 * @decoder: video decoder instance
 *
 * Release the lock that protects the decoder function from concurrent access.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER_STREAM_UNLOCK(decoder : longint) : longint;

type
{ do not use this one, use macro below  }
(* Const before type ignored *)
(* Const before type ignored *)

function _gst_video_decoder_error(dec:PGstVideoDecoder; weight:Tgint; domain:TGQuark; code:Tgint; txt:Pgchar; 
           debug:Pgchar; file:Pgchar; _function:Pgchar; line:Tgint):TGstFlowReturn;cdecl;external;
{*
 * GST_VIDEO_DECODER_ERROR:
 * @el:     the base video decoder element that generates the error
 * @w:      element defined weight of the error, added to error count
 * @domain: like CORE, LIBRARY, RESOURCE or STREAM (see #gstreamer-GstGError)
 * @code:   error code defined for that domain (see #gstreamer-GstGError)
 * @text:   the message to display (format string and args enclosed in
 *          parentheses)
 * @debug:  debugging information for the message (format string and args
 *          enclosed in parentheses)
 * @ret:    variable to receive return value
 *
 * Utility function that video decoder elements can use in case they encountered
 * a data processing error that may be fatal for the current "data unit" but
 * need not prevent subsequent decoding.  Such errors are counted and if there
 * are too many, as configured in the context's max_errors, the pipeline will
 * post an error message and the application will be requested to stop further
 * media processing.  Otherwise, it is considered a "glitch" and only a warning
 * is logged. In either case, @ret is set to the proper value to
 * return to upstream/caller (indicating either GST_FLOW_ERROR or GST_FLOW_OK).
  }
{*
 * GST_VIDEO_DECODER_MAX_ERRORS:
 *
 * Default maximum number of errors tolerated before signaling error.
  }
const
  GST_VIDEO_DECODER_MAX_ERRORS = -(1);  
{*
 * GstVideoDecoder:
 *
 * The opaque #GstVideoDecoder data structure.
  }
{< private > }
{< protected > }
{ protects all data processing, i.e. is locked
   * in the chain function, finish_frame and when
   * processing serialized events  }
{ MT-protected (with STREAM_LOCK)  }
{< private > }
type
  PGstVideoDecoder = ^TGstVideoDecoder;
  TGstVideoDecoder = record
      element : TGstElement;
      sinkpad : PGstPad;
      srcpad : PGstPad;
      stream_lock : TGRecMutex;
      input_segment : TGstSegment;
      output_segment : TGstSegment;
      priv : PGstVideoDecoderPrivate;
      padding : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
 * GstVideoDecoderClass:
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
 * @set_format:     Notifies subclass of incoming data format (caps).
 * @parse:          Required for non-packetized input.
 *                  Allows chopping incoming data into manageable units (frames)
 *                  for subsequent decoding.
 * @reset:          Optional.
 *                  Allows subclass (decoder) to perform post-seek semantics reset.
 *                  Deprecated.
 * @handle_frame:   Provides input data frame to subclass. In subframe mode, the subclass needs
 *                  to take ownership of @GstVideoCodecFrame.input_buffer as it will be modified
 *                  by the base class on the next subframe buffer receiving.
 * @finish:         Optional.
 *                  Called to request subclass to dispatch any pending remaining
 *                  data at EOS. Sub-classes can refuse to decode new data after.
 * @drain:	    Optional.
 *                  Called to request subclass to decode any data it can at this
 *                  point, but that more data may arrive after. (e.g. at segment end).
 *                  Sub-classes should be prepared to handle new data afterward,
 *                  or seamless segment processing will break. Since: 1.6
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
 *                      Flush all remaining data from the decoder without
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
 * @getcaps:        Optional.
 *                  Allows for a custom sink getcaps implementation.
 *                  If not implemented, default returns
 *                  gst_video_decoder_proxy_getcaps
 *                  applied to sink template caps.
 * @transform_meta: Optional. Transform the metadata on the input buffer to the
 *                  output buffer. By default this method is copies all meta without
 *                  tags and meta with only the "video" tag. subclasses can
 *                  implement this method and return %TRUE if the metadata is to be
 *                  copied. Since: 1.6
 *
 * Subclasses can override any of the available virtual methods or not, as
 * needed. At minimum @handle_frame needs to be overridden, and @set_format
 * and likely as well.  If non-packetized input is supported or expected,
 * @parse needs to be overridden as well.
  }
{< private > }
{< public > }
{*
   * GstVideoDecoderClass::handle_frame:
   * @decoder: The #GstVideoDecoder
   * @frame: (transfer full): The frame to handle
    }
{*
   * GstVideoDecoderClass::handle_missing_data:
   * @decoder: The #GstVideoDecoder
   * @timestamp: Timestamp of the missing data
   * @duration: Duration of the missing data
   *
   * Returns: %TRUE if the decoder should be drained afterwards.
   *
   * Since: 1.20
    }
{< private > }
  PGstVideoDecoderClass = ^TGstVideoDecoderClass;
  TGstVideoDecoderClass = record
      element_class : TGstElementClass;
      open : function (decoder:PGstVideoDecoder):Tgboolean;cdecl;
      close : function (decoder:PGstVideoDecoder):Tgboolean;cdecl;
      start : function (decoder:PGstVideoDecoder):Tgboolean;cdecl;
      stop : function (decoder:PGstVideoDecoder):Tgboolean;cdecl;
      parse : function (decoder:PGstVideoDecoder; frame:PGstVideoCodecFrame; adapter:PGstAdapter; at_eos:Tgboolean):TGstFlowReturn;cdecl;
      set_format : function (decoder:PGstVideoDecoder; state:PGstVideoCodecState):Tgboolean;cdecl;
      reset : function (decoder:PGstVideoDecoder; hard:Tgboolean):Tgboolean;cdecl;
      finish : function (decoder:PGstVideoDecoder):TGstFlowReturn;cdecl;
      handle_frame : function (decoder:PGstVideoDecoder; frame:PGstVideoCodecFrame):TGstFlowReturn;cdecl;
      sink_event : function (decoder:PGstVideoDecoder; event:PGstEvent):Tgboolean;cdecl;
      src_event : function (decoder:PGstVideoDecoder; event:PGstEvent):Tgboolean;cdecl;
      negotiate : function (decoder:PGstVideoDecoder):Tgboolean;cdecl;
      decide_allocation : function (decoder:PGstVideoDecoder; query:PGstQuery):Tgboolean;cdecl;
      propose_allocation : function (decoder:PGstVideoDecoder; query:PGstQuery):Tgboolean;cdecl;
      flush : function (decoder:PGstVideoDecoder):Tgboolean;cdecl;
      sink_query : function (decoder:PGstVideoDecoder; query:PGstQuery):Tgboolean;cdecl;
      src_query : function (decoder:PGstVideoDecoder; query:PGstQuery):Tgboolean;cdecl;
      getcaps : function (decoder:PGstVideoDecoder; filter:PGstCaps):PGstCaps;cdecl;
      drain : function (decoder:PGstVideoDecoder):TGstFlowReturn;cdecl;
      transform_meta : function (decoder:PGstVideoDecoder; frame:PGstVideoCodecFrame; meta:PGstMeta):Tgboolean;cdecl;
      handle_missing_data : function (decoder:PGstVideoDecoder; timestamp:TGstClockTime; duration:TGstClockTime):Tgboolean;cdecl;
      padding : array[0..(GST_PADDING_LARGE-7)-1] of Tgpointer;
    end;

{*
 * GstVideoDecoderRequestSyncPointFlags:
 * @GST_VIDEO_DECODER_REQUEST_SYNC_POINT_DISCARD_INPUT: discard all following
 *     input until the next sync point.
 * @GST_VIDEO_DECODER_REQUEST_SYNC_POINT_CORRUPT_OUTPUT: discard all following
 *     output until the next sync point.
 *
 * Flags to be used in combination with gst_video_decoder_request_sync_point().
 * See the function documentation for more details.
 *
 * Since: 1.20
  }

  PGstVideoDecoderRequestSyncPointFlags = ^TGstVideoDecoderRequestSyncPointFlags;
  TGstVideoDecoderRequestSyncPointFlags =  Longint;
  Const
    GST_VIDEO_DECODER_REQUEST_SYNC_POINT_DISCARD_INPUT = 1 shl 0;
    GST_VIDEO_DECODER_REQUEST_SYNC_POINT_CORRUPT_OUTPUT = 1 shl 1;
;

function gst_video_decoder_get_type:TGType;cdecl;external;
{ Context parameters  }
procedure gst_video_decoder_set_packetized(decoder:PGstVideoDecoder; packetized:Tgboolean);cdecl;external;
function gst_video_decoder_get_packetized(decoder:PGstVideoDecoder):Tgboolean;cdecl;external;
procedure gst_video_decoder_set_subframe_mode(decoder:PGstVideoDecoder; subframe_mode:Tgboolean);cdecl;external;
function gst_video_decoder_get_subframe_mode(decoder:PGstVideoDecoder):Tgboolean;cdecl;external;
function gst_video_decoder_get_input_subframe_index(decoder:PGstVideoDecoder; frame:PGstVideoCodecFrame):Tguint;cdecl;external;
function gst_video_decoder_get_processed_subframe_index(decoder:PGstVideoDecoder; frame:PGstVideoCodecFrame):Tguint;cdecl;external;
procedure gst_video_decoder_set_estimate_rate(dec:PGstVideoDecoder; enabled:Tgboolean);cdecl;external;
function gst_video_decoder_get_estimate_rate(dec:PGstVideoDecoder):Tgint;cdecl;external;
procedure gst_video_decoder_set_max_errors(dec:PGstVideoDecoder; num:Tgint);cdecl;external;
function gst_video_decoder_get_max_errors(dec:PGstVideoDecoder):Tgint;cdecl;external;
procedure gst_video_decoder_set_needs_format(dec:PGstVideoDecoder; enabled:Tgboolean);cdecl;external;
function gst_video_decoder_get_needs_format(dec:PGstVideoDecoder):Tgboolean;cdecl;external;
procedure gst_video_decoder_set_needs_sync_point(dec:PGstVideoDecoder; enabled:Tgboolean);cdecl;external;
function gst_video_decoder_get_needs_sync_point(dec:PGstVideoDecoder):Tgboolean;cdecl;external;
procedure gst_video_decoder_set_latency(decoder:PGstVideoDecoder; min_latency:TGstClockTime; max_latency:TGstClockTime);cdecl;external;
procedure gst_video_decoder_get_latency(decoder:PGstVideoDecoder; min_latency:PGstClockTime; max_latency:PGstClockTime);cdecl;external;
procedure gst_video_decoder_get_allocator(decoder:PGstVideoDecoder; allocator:PPGstAllocator; params:PGstAllocationParams);cdecl;external;
function gst_video_decoder_get_buffer_pool(decoder:PGstVideoDecoder):PGstBufferPool;cdecl;external;
{ Object methods  }
function gst_video_decoder_get_frame(decoder:PGstVideoDecoder; frame_number:longint):PGstVideoCodecFrame;cdecl;external;
function gst_video_decoder_get_oldest_frame(decoder:PGstVideoDecoder):PGstVideoCodecFrame;cdecl;external;
function gst_video_decoder_get_frames(decoder:PGstVideoDecoder):PGList;cdecl;external;
{ Parsing related methods  }
procedure gst_video_decoder_add_to_frame(decoder:PGstVideoDecoder; n_bytes:longint);cdecl;external;
function gst_video_decoder_have_frame(decoder:PGstVideoDecoder):TGstFlowReturn;cdecl;external;
function gst_video_decoder_have_last_subframe(decoder:PGstVideoDecoder; frame:PGstVideoCodecFrame):TGstFlowReturn;cdecl;external;
function gst_video_decoder_get_pending_frame_size(decoder:PGstVideoDecoder):Tgsize;cdecl;external;
function gst_video_decoder_allocate_output_buffer(decoder:PGstVideoDecoder):PGstBuffer;cdecl;external;
function gst_video_decoder_allocate_output_frame_with_params(decoder:PGstVideoDecoder; frame:PGstVideoCodecFrame; params:PGstBufferPoolAcquireParams):TGstFlowReturn;cdecl;external;
function gst_video_decoder_allocate_output_frame(decoder:PGstVideoDecoder; frame:PGstVideoCodecFrame):TGstFlowReturn;cdecl;external;
function gst_video_decoder_set_output_state(decoder:PGstVideoDecoder; fmt:TGstVideoFormat; width:Tguint; height:Tguint; reference:PGstVideoCodecState):PGstVideoCodecState;cdecl;external;
function gst_video_decoder_set_interlaced_output_state(decoder:PGstVideoDecoder; fmt:TGstVideoFormat; interlace_mode:TGstVideoInterlaceMode; width:Tguint; height:Tguint; 
           reference:PGstVideoCodecState):PGstVideoCodecState;cdecl;external;
function gst_video_decoder_get_output_state(decoder:PGstVideoDecoder):PGstVideoCodecState;cdecl;external;
function gst_video_decoder_negotiate(decoder:PGstVideoDecoder):Tgboolean;cdecl;external;
function gst_video_decoder_get_max_decode_time(decoder:PGstVideoDecoder; frame:PGstVideoCodecFrame):TGstClockTimeDiff;cdecl;external;
function gst_video_decoder_get_qos_proportion(decoder:PGstVideoDecoder):Tgdouble;cdecl;external;
function gst_video_decoder_finish_frame(decoder:PGstVideoDecoder; frame:PGstVideoCodecFrame):TGstFlowReturn;cdecl;external;
function gst_video_decoder_finish_subframe(decoder:PGstVideoDecoder; frame:PGstVideoCodecFrame):TGstFlowReturn;cdecl;external;
function gst_video_decoder_drop_frame(dec:PGstVideoDecoder; frame:PGstVideoCodecFrame):TGstFlowReturn;cdecl;external;
function gst_video_decoder_drop_subframe(dec:PGstVideoDecoder; frame:PGstVideoCodecFrame):TGstFlowReturn;cdecl;external;
procedure gst_video_decoder_request_sync_point(dec:PGstVideoDecoder; frame:PGstVideoCodecFrame; flags:TGstVideoDecoderRequestSyncPointFlags);cdecl;external;
procedure gst_video_decoder_release_frame(dec:PGstVideoDecoder; frame:PGstVideoCodecFrame);cdecl;external;
(* Const before type ignored *)
procedure gst_video_decoder_merge_tags(decoder:PGstVideoDecoder; tags:PGstTagList; mode:TGstTagMergeMode);cdecl;external;
function gst_video_decoder_proxy_getcaps(decoder:PGstVideoDecoder; caps:PGstCaps; filter:PGstCaps):PGstCaps;cdecl;external;
procedure gst_video_decoder_set_use_default_pad_acceptcaps(decoder:PGstVideoDecoder; use:Tgboolean);cdecl;external;
{////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoDecoder, gst_object_unref) }
{$endif}

implementation

{ was #define dname def_expr }
function GST_TYPE_VIDEO_DECODER : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_DECODER:=gst_video_decoder_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER(obj : longint) : longint;
begin
  GST_VIDEO_DECODER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VIDEO_DECODER,GstVideoDecoder);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER_CLASS(klass : longint) : longint;
begin
  GST_VIDEO_DECODER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VIDEO_DECODER,GstVideoDecoderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER_GET_CLASS(obj : longint) : longint;
begin
  GST_VIDEO_DECODER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VIDEO_DECODER,GstVideoDecoderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_DECODER(obj : longint) : longint;
begin
  GST_IS_VIDEO_DECODER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VIDEO_DECODER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_DECODER_CLASS(klass : longint) : longint;
begin
  GST_IS_VIDEO_DECODER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VIDEO_DECODER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_DECODER_CAST(obj : longint) : PGstVideoDecoder;
begin
  GST_VIDEO_DECODER_CAST:=PGstVideoDecoder(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER_SRC_PAD(obj : longint) : longint;
begin
  GST_VIDEO_DECODER_SRC_PAD:=(PGstVideoDecoder(obj))^.srcpad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER_SINK_PAD(obj : longint) : longint;
begin
  GST_VIDEO_DECODER_SINK_PAD:=(PGstVideoDecoder(obj))^.sinkpad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER_INPUT_SEGMENT(obj : longint) : longint;
begin
  GST_VIDEO_DECODER_INPUT_SEGMENT:=(GST_VIDEO_DECODER_CAST(obj))^.input_segment;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER_OUTPUT_SEGMENT(obj : longint) : longint;
begin
  GST_VIDEO_DECODER_OUTPUT_SEGMENT:=(GST_VIDEO_DECODER_CAST(obj))^.output_segment;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER_STREAM_LOCK(decoder : longint) : longint;
begin
  GST_VIDEO_DECODER_STREAM_LOCK:=g_rec_mutex_lock(@((GST_VIDEO_DECODER(decoder))^.stream_lock));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DECODER_STREAM_UNLOCK(decoder : longint) : longint;
begin
  GST_VIDEO_DECODER_STREAM_UNLOCK:=g_rec_mutex_unlock(@((GST_VIDEO_DECODER(decoder))^.stream_lock));
end;


end.
