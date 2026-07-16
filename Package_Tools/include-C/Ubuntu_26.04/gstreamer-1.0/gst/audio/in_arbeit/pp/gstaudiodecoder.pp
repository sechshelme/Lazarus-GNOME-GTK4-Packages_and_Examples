
unit gstaudiodecoder;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstaudiodecoder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstaudiodecoder.h
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
Pgboolean  = ^gboolean;
Pgchar  = ^gchar;
Pgint  = ^gint;
PGstAdapter  = ^GstAdapter;
PGstAllocationParams  = ^GstAllocationParams;
PGstAllocator  = ^GstAllocator;
PGstAudioDecoder  = ^GstAudioDecoder;
PGstAudioDecoderClass  = ^GstAudioDecoderClass;
PGstAudioDecoderPrivate  = ^GstAudioDecoderPrivate;
PGstAudioInfo  = ^GstAudioInfo;
PGstBuffer  = ^GstBuffer;
PGstCaps  = ^GstCaps;
PGstClockTime  = ^GstClockTime;
PGstEvent  = ^GstEvent;
PGstMeta  = ^GstMeta;
PGstPad  = ^GstPad;
PGstQuery  = ^GstQuery;
PGstTagList  = ^GstTagList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2009 Igalia S.L.
 * Author: Iago Toral Quiroga <itoral@igalia.com>
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
{$ifndef _GST_AUDIO_DECODER_H_}
{$define _GST_AUDIO_DECODER_H_}
{$include <gst/gst.h>}
{$include <gst/base/gstadapter.h>}

{ was #define dname def_expr }
function GST_TYPE_AUDIO_DECODER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_DECODER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_DECODER_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_DECODER_CAST(obj : longint) : PGstAudioDecoder;

{*
 * GST_AUDIO_DECODER_SINK_NAME:
 *
 * The name of the templates for the sink pad.
  }
const
  GST_AUDIO_DECODER_SINK_NAME = 'sink';  
{*
 * GST_AUDIO_DECODER_SRC_NAME:
 *
 * The name of the templates for the source pad.
  }
  GST_AUDIO_DECODER_SRC_NAME = 'src';  
{*
 * GST_AUDIO_DECODER_SRC_PAD:
 * @obj: base audio codec instance
 *
 * Gives the pointer to the source #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_AUDIO_DECODER_SRC_PAD(obj : longint) : longint;

{*
 * GST_AUDIO_DECODER_SINK_PAD:
 * @obj: base audio codec instance
 *
 * Gives the pointer to the sink #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_SINK_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_STREAM_LOCK(dec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_STREAM_UNLOCK(dec : longint) : longint;

{*
 * GST_AUDIO_DECODER_INPUT_SEGMENT:
 * @obj: audio decoder instance
 *
 * Gives the input segment of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_INPUT_SEGMENT(obj : longint) : longint;

{*
 * GST_AUDIO_DECODER_OUTPUT_SEGMENT:
 * @obj: audio decoder instance
 *
 * Gives the output segment of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_OUTPUT_SEGMENT(obj : longint) : longint;

type
{ do not use this one, use macro below  }
(* Const before type ignored *)
(* Const before type ignored *)

function _gst_audio_decoder_error(dec:PGstAudioDecoder; weight:Tgint; domain:TGQuark; code:Tgint; txt:Pgchar; 
           debug:Pgchar; file:Pgchar; _function:Pgchar; line:Tgint):TGstFlowReturn;cdecl;external;
{*
 * GST_AUDIO_DECODER_ERROR:
 * @el:     the base audio decoder element that generates the error
 * @weight: element defined weight of the error, added to error count
 * @domain: like CORE, LIBRARY, RESOURCE or STREAM (see #gstreamer-GstGError)
 * @code:   error code defined for that domain (see #gstreamer-GstGError)
 * @text:   the message to display (format string and args enclosed in
 *          parentheses)
 * @debug:  debugging information for the message (format string and args
 *          enclosed in parentheses)
 * @ret:    variable to receive return value
 *
 * Utility function that audio decoder elements can use in case they encountered
 * a data processing error that may be fatal for the current "data unit" but
 * need not prevent subsequent decoding.  Such errors are counted and if there
 * are too many, as configured in the context's max_errors, the pipeline will
 * post an error message and the application will be requested to stop further
 * media processing.  Otherwise, it is considered a "glitch" and only a warning
 * is logged. In either case, @ret is set to the proper value to
 * return to upstream/caller (indicating either GST_FLOW_ERROR or GST_FLOW_OK).
  }
{*
 * GST_AUDIO_DECODER_MAX_ERRORS:
 *
 * Default maximum number of errors tolerated before signaling error.
  }
const
  GST_AUDIO_DECODER_MAX_ERRORS = -(1);  
{*
 * GstAudioDecoder:
 *
 * The opaque #GstAudioDecoder data structure.
  }
{< protected > }
{ source and sink pads  }
{ protects all data processing, i.e. is locked
   * in the chain function, finish_frame and when
   * processing serialized events  }
{ MT-protected (with STREAM_LOCK)  }
{< private > }
type
  PGstAudioDecoder = ^TGstAudioDecoder;
  TGstAudioDecoder = record
      element : TGstElement;
      sinkpad : PGstPad;
      srcpad : PGstPad;
      stream_lock : TGRecMutex;
      input_segment : TGstSegment;
      output_segment : TGstSegment;
      priv : PGstAudioDecoderPrivate;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
 * GstAudioDecoderClass:
 * @element_class:  The parent class structure
 * @start:          Optional.
 *                  Called when the element starts processing.
 *                  Allows opening external resources.
 * @stop:           Optional.
 *                  Called when the element stops processing.
 *                  Allows closing external resources.
 * @set_format:     Notifies subclass of incoming data format (caps).
 * @parse:          Optional.
 *                  Allows chopping incoming data into manageable units (frames)
 *                  for subsequent decoding.  This division is at subclass
 *                  discretion and may or may not correspond to 1 (or more)
 *                  frames as defined by audio format.
 * @handle_frame:   Provides input data (or NULL to clear any remaining data)
 *                  to subclass.  Input data ref management is performed by
 *                  base class, subclass should not care or intervene,
 *                  and input data is only valid until next call to base class,
 *                  most notably a call to gst_audio_decoder_finish_frame().
 * @flush:          Optional.
 *                  Instructs subclass to clear any codec caches and discard
 *                  any pending samples and not yet returned decoded data.
 *                  @hard indicates whether a FLUSH is being processed,
 *                  or otherwise a DISCONT (or conceptually similar).
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
 * @getcaps:        Optional.
 *                  Allows for a custom sink getcaps implementation.
 *                  If not implemented,
 *                  default returns gst_audio_decoder_proxy_getcaps
 *                  applied to sink template caps.
 * @transform_meta: Optional. Transform the metadata on the input buffer to the
 *                  output buffer. By default this method copies all meta without
 *                  tags and meta with only the "audio" tag. subclasses can
 *                  implement this method and return %TRUE if the metadata is to be
 *                  copied. Since: 1.6
 *
 * Subclasses can override any of the available virtual methods or not, as
 * needed. At minimum @handle_frame (and likely @set_format) needs to be
 * overridden.
  }
{< public > }
{ virtual methods for subclasses  }
{*
   * GstAudioDecoderClass::parse:
   * @offset: (out):
   * @length: (out):
    }
{< private > }
  PGstAudioDecoderClass = ^TGstAudioDecoderClass;
  TGstAudioDecoderClass = record
      element_class : TGstElementClass;
      start : function (dec:PGstAudioDecoder):Tgboolean;cdecl;
      stop : function (dec:PGstAudioDecoder):Tgboolean;cdecl;
      set_format : function (dec:PGstAudioDecoder; caps:PGstCaps):Tgboolean;cdecl;
      parse : function (dec:PGstAudioDecoder; adapter:PGstAdapter; offset:Pgint; length:Pgint):TGstFlowReturn;cdecl;
      handle_frame : function (dec:PGstAudioDecoder; buffer:PGstBuffer):TGstFlowReturn;cdecl;
      flush : procedure (dec:PGstAudioDecoder; hard:Tgboolean);cdecl;
      pre_push : function (dec:PGstAudioDecoder; buffer:PPGstBuffer):TGstFlowReturn;cdecl;
      sink_event : function (dec:PGstAudioDecoder; event:PGstEvent):Tgboolean;cdecl;
      src_event : function (dec:PGstAudioDecoder; event:PGstEvent):Tgboolean;cdecl;
      open : function (dec:PGstAudioDecoder):Tgboolean;cdecl;
      close : function (dec:PGstAudioDecoder):Tgboolean;cdecl;
      negotiate : function (dec:PGstAudioDecoder):Tgboolean;cdecl;
      decide_allocation : function (dec:PGstAudioDecoder; query:PGstQuery):Tgboolean;cdecl;
      propose_allocation : function (dec:PGstAudioDecoder; query:PGstQuery):Tgboolean;cdecl;
      sink_query : function (dec:PGstAudioDecoder; query:PGstQuery):Tgboolean;cdecl;
      src_query : function (dec:PGstAudioDecoder; query:PGstQuery):Tgboolean;cdecl;
      getcaps : function (dec:PGstAudioDecoder; filter:PGstCaps):PGstCaps;cdecl;
      transform_meta : function (enc:PGstAudioDecoder; outbuf:PGstBuffer; meta:PGstMeta; inbuf:PGstBuffer):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE-4)-1] of Tgpointer;
    end;


function gst_audio_decoder_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_audio_decoder_set_output_format(dec:PGstAudioDecoder; info:PGstAudioInfo):Tgboolean;cdecl;external;
function gst_audio_decoder_set_output_caps(dec:PGstAudioDecoder; caps:PGstCaps):Tgboolean;cdecl;external;
function gst_audio_decoder_proxy_getcaps(decoder:PGstAudioDecoder; caps:PGstCaps; filter:PGstCaps):PGstCaps;cdecl;external;
function gst_audio_decoder_negotiate(dec:PGstAudioDecoder):Tgboolean;cdecl;external;
function gst_audio_decoder_finish_subframe(dec:PGstAudioDecoder; buf:PGstBuffer):TGstFlowReturn;cdecl;external;
function gst_audio_decoder_finish_frame(dec:PGstAudioDecoder; buf:PGstBuffer; frames:Tgint):TGstFlowReturn;cdecl;external;
function gst_audio_decoder_allocate_output_buffer(dec:PGstAudioDecoder; size:Tgsize):PGstBuffer;cdecl;external;
{ context parameters  }
function gst_audio_decoder_get_audio_info(dec:PGstAudioDecoder):PGstAudioInfo;cdecl;external;
procedure gst_audio_decoder_set_plc_aware(dec:PGstAudioDecoder; plc:Tgboolean);cdecl;external;
function gst_audio_decoder_get_plc_aware(dec:PGstAudioDecoder):Tgint;cdecl;external;
procedure gst_audio_decoder_set_estimate_rate(dec:PGstAudioDecoder; enabled:Tgboolean);cdecl;external;
function gst_audio_decoder_get_estimate_rate(dec:PGstAudioDecoder):Tgint;cdecl;external;
function gst_audio_decoder_get_delay(dec:PGstAudioDecoder):Tgint;cdecl;external;
procedure gst_audio_decoder_set_max_errors(dec:PGstAudioDecoder; num:Tgint);cdecl;external;
function gst_audio_decoder_get_max_errors(dec:PGstAudioDecoder):Tgint;cdecl;external;
procedure gst_audio_decoder_set_latency(dec:PGstAudioDecoder; min:TGstClockTime; max:TGstClockTime);cdecl;external;
procedure gst_audio_decoder_get_latency(dec:PGstAudioDecoder; min:PGstClockTime; max:PGstClockTime);cdecl;external;
procedure gst_audio_decoder_get_parse_state(dec:PGstAudioDecoder; sync:Pgboolean; eos:Pgboolean);cdecl;external;
procedure gst_audio_decoder_set_allocation_caps(dec:PGstAudioDecoder; allocation_caps:PGstCaps);cdecl;external;
{ object properties  }
procedure gst_audio_decoder_set_plc(dec:PGstAudioDecoder; enabled:Tgboolean);cdecl;external;
function gst_audio_decoder_get_plc(dec:PGstAudioDecoder):Tgboolean;cdecl;external;
procedure gst_audio_decoder_set_min_latency(dec:PGstAudioDecoder; num:TGstClockTime);cdecl;external;
function gst_audio_decoder_get_min_latency(dec:PGstAudioDecoder):TGstClockTime;cdecl;external;
procedure gst_audio_decoder_set_tolerance(dec:PGstAudioDecoder; tolerance:TGstClockTime);cdecl;external;
function gst_audio_decoder_get_tolerance(dec:PGstAudioDecoder):TGstClockTime;cdecl;external;
procedure gst_audio_decoder_set_drainable(dec:PGstAudioDecoder; enabled:Tgboolean);cdecl;external;
function gst_audio_decoder_get_drainable(dec:PGstAudioDecoder):Tgboolean;cdecl;external;
procedure gst_audio_decoder_set_needs_format(dec:PGstAudioDecoder; enabled:Tgboolean);cdecl;external;
function gst_audio_decoder_get_needs_format(dec:PGstAudioDecoder):Tgboolean;cdecl;external;
procedure gst_audio_decoder_get_allocator(dec:PGstAudioDecoder; allocator:PPGstAllocator; params:PGstAllocationParams);cdecl;external;
(* Const before type ignored *)
procedure gst_audio_decoder_merge_tags(dec:PGstAudioDecoder; tags:PGstTagList; mode:TGstTagMergeMode);cdecl;external;
procedure gst_audio_decoder_set_use_default_pad_acceptcaps(decoder:PGstAudioDecoder; use:Tgboolean);cdecl;external;
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioDecoder, gst_object_unref) }
{$endif}
{ _GST_AUDIO_DECODER_H_  }

implementation

{ was #define dname def_expr }
function GST_TYPE_AUDIO_DECODER : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_DECODER:=gst_audio_decoder_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER(obj : longint) : longint;
begin
  GST_AUDIO_DECODER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AUDIO_DECODER,GstAudioDecoder);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_CLASS(klass : longint) : longint;
begin
  GST_AUDIO_DECODER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AUDIO_DECODER,GstAudioDecoderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_GET_CLASS(obj : longint) : longint;
begin
  GST_AUDIO_DECODER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AUDIO_DECODER,GstAudioDecoderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_DECODER(obj : longint) : longint;
begin
  GST_IS_AUDIO_DECODER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AUDIO_DECODER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_DECODER_CLASS(obj : longint) : longint;
begin
  GST_IS_AUDIO_DECODER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AUDIO_DECODER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_DECODER_CAST(obj : longint) : PGstAudioDecoder;
begin
  GST_AUDIO_DECODER_CAST:=PGstAudioDecoder(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_SRC_PAD(obj : longint) : longint;
begin
  GST_AUDIO_DECODER_SRC_PAD:=(PGstAudioDecoder(obj))^.srcpad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_SINK_PAD(obj : longint) : longint;
begin
  GST_AUDIO_DECODER_SINK_PAD:=(PGstAudioDecoder(obj))^.sinkpad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_STREAM_LOCK(dec : longint) : longint;
begin
  GST_AUDIO_DECODER_STREAM_LOCK:=g_rec_mutex_lock(@((GST_AUDIO_DECODER(dec))^.stream_lock));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_STREAM_UNLOCK(dec : longint) : longint;
begin
  GST_AUDIO_DECODER_STREAM_UNLOCK:=g_rec_mutex_unlock(@((GST_AUDIO_DECODER(dec))^.stream_lock));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_INPUT_SEGMENT(obj : longint) : longint;
begin
  GST_AUDIO_DECODER_INPUT_SEGMENT:=(GST_AUDIO_DECODER_CAST(obj))^.input_segment;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_DECODER_OUTPUT_SEGMENT(obj : longint) : longint;
begin
  GST_AUDIO_DECODER_OUTPUT_SEGMENT:=(GST_AUDIO_DECODER_CAST(obj))^.output_segment;
end;


end.
