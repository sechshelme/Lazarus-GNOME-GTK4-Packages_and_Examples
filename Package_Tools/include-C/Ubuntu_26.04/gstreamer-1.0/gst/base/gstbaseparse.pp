
unit gstbaseparse;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstbaseparse.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstbaseparse.h
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
Pgint  = ^gint;
Pgint64  = ^gint64;
PGstBaseParse  = ^GstBaseParse;
PGstBaseParseClass  = ^GstBaseParseClass;
PGstBaseParseFrame  = ^GstBaseParseFrame;
PGstBaseParseFrameFlags  = ^GstBaseParseFrameFlags;
PGstBaseParsePrivate  = ^GstBaseParsePrivate;
PGstBuffer  = ^GstBuffer;
PGstCaps  = ^GstCaps;
PGstEvent  = ^GstEvent;
PGstPad  = ^GstPad;
PGstQuery  = ^GstQuery;
PGstTagList  = ^GstTagList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2008 Nokia Corporation. All rights reserved.
 *
 * Contact: Stefan Kost <stefan.kost@nokia.com>
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
{$ifndef __GST_BASE_PARSE_H__}
{$define __GST_BASE_PARSE_H__}
{$include <gst/gst.h>}
{$include <gst/base/base-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_BASE_PARSE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_PARSE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_PARSE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_PARSE_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_PARSE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_PARSE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BASE_PARSE_CAST(obj : longint) : PGstBaseParse;

{*
 * GST_BASE_PARSE_SRC_PAD:
 * @obj: base parse instance
 *
 * Gives the pointer to the source #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_PARSE_SRC_PAD(obj : longint) : longint;

{*
 * GST_BASE_PARSE_SINK_PAD:
 * @obj: base parse instance
 *
 * Gives the pointer to the sink #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_PARSE_SINK_PAD(obj : longint) : longint;

{*
 * GST_BASE_PARSE_FLOW_DROPPED:
 *
 * A #GstFlowReturn that can be returned from
 * #GstBaseParseClass::handle_frame to indicate that no output buffer was
 * generated, or from #GstBaseParseClass::pre_push_frame to to forego
 * pushing buffer.
  }
const
  GST_BASE_PARSE_FLOW_DROPPED = GST_FLOW_CUSTOM_SUCCESS;  
{ not public API, use accessor macros below  }
  GST_BASE_PARSE_FLAG_LOST_SYNC = 1 shl 0;  
  GST_BASE_PARSE_FLAG_DRAINING = 1 shl 1;  
{*
 * GST_BASE_PARSE_LOST_SYNC:
 * @parse: base parse instance
 *
 * Obtains current sync status.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_BASE_PARSE_LOST_SYNC(parse : longint) : longint;

{*
 * GST_BASE_PARSE_DRAINING:
 * @parse: base parse instance
 *
 * Obtains current drain status (ie. whether EOS has been received and
 * the parser is now processing the frames at the end of the stream)
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_PARSE_DRAINING(parse : longint) : longint;

{*
 * GstBaseParseFrameFlags:
 * @GST_BASE_PARSE_FRAME_FLAG_NONE: no flag
 * @GST_BASE_PARSE_FRAME_FLAG_NEW_FRAME: set by baseclass if current frame
 *   is passed for processing to the subclass for the first time
 *   (and not set on subsequent calls with same data).
 * @GST_BASE_PARSE_FRAME_FLAG_NO_FRAME: set to indicate this buffer should not be
 *   counted as frame, e.g. if this frame is dependent on a previous one.
 *   As it is not counted as a frame, bitrate increases but frame to time
 *   conversions are maintained.
 * @GST_BASE_PARSE_FRAME_FLAG_CLIP: @pre_push_frame can set this to indicate
 *    that regular segment clipping can still be performed (as opposed to
 *    any custom one having been done).
 * @GST_BASE_PARSE_FRAME_FLAG_DROP: indicates to @finish_frame that the
 *    the frame should be dropped (and might be handled internally by subclass)
 * @GST_BASE_PARSE_FRAME_FLAG_QUEUE: indicates to @finish_frame that the
 *    the frame should be queued for now and processed fully later
 *    when the first non-queued frame is finished
 *
 * Flags to be used in a #GstBaseParseFrame.
  }
type
  PGstBaseParseFrameFlags = ^TGstBaseParseFrameFlags;
  TGstBaseParseFrameFlags =  Longint;
  Const
    GST_BASE_PARSE_FRAME_FLAG_NONE = 0;
    GST_BASE_PARSE_FRAME_FLAG_NEW_FRAME = 1 shl 0;
    GST_BASE_PARSE_FRAME_FLAG_NO_FRAME = 1 shl 1;
    GST_BASE_PARSE_FRAME_FLAG_CLIP = 1 shl 2;
    GST_BASE_PARSE_FRAME_FLAG_DROP = 1 shl 3;
    GST_BASE_PARSE_FRAME_FLAG_QUEUE = 1 shl 4;
;
{*
 * GstBaseParseFrame:
 * @buffer: input data to be parsed for frames.
 * @out_buffer: output data.
 * @offset: media specific offset of input frame
 *   Note that a converter may have a different one on the frame's buffer.
 * @overhead: subclass can set this to indicates the metadata overhead
 *   for the given frame, which is then used to enable more accurate bitrate
 *   computations. If this is -1, it is assumed that this frame should be
 *   skipped in bitrate calculation.
 * @flags: a combination of input and output #GstBaseParseFrameFlags that
 *  convey additional context to subclass or allow subclass to tune
 *  subsequent #GstBaseParse actions.
 *
 * Frame (context) data passed to each frame parsing virtual methods.  In
 * addition to providing the data to be checked for a valid frame or an already
 * identified frame, it conveys additional metadata or control information
 * from and to the subclass w.r.t. the particular frame in question (rather
 * than global parameters).  Some of these may apply to each parsing stage, others
 * only to some a particular one.  These parameters are effectively zeroed at start
 * of each frame's processing, i.e. parsing virtual method invocation sequence.
  }
{< private > }
type
  PGstBaseParseFrame = ^TGstBaseParseFrame;
  TGstBaseParseFrame = record
      buffer : PGstBuffer;
      out_buffer : PGstBuffer;
      flags : Tguint;
      offset : Tguint64;
      overhead : Tgint;
      size : Tgint;
      _gst_reserved_i : array[0..1] of Tguint;
      _gst_reserved_p : array[0..1] of Tgpointer;
      _private_flags : Tguint;
    end;
{*
 * GstBaseParse:
 * @element: the parent element.
 *
 * The opaque #GstBaseParse data structure.
  }
{< public > }
{< protected > }
{ source and sink pads  }
{ MT-protected (with STREAM_LOCK)  }
{< private > }
  PGstBaseParse = ^TGstBaseParse;
  TGstBaseParse = record
      element : TGstElement;
      sinkpad : PGstPad;
      srcpad : PGstPad;
      flags : Tguint;
      segment : TGstSegment;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
      priv : PGstBaseParsePrivate;
    end;

{*
 * GstBaseParseClass:
 * @parent_class: the parent class
 * @start:          Optional.
 *                  Called when the element starts processing.
 *                  Allows opening external resources.
 * @stop:           Optional.
 *                  Called when the element stops processing.
 *                  Allows closing external resources.
 * @set_sink_caps:  Optional.
 *                  Allows the subclass to be notified of the actual caps set.
 * @get_sink_caps:  Optional.
 *                  Allows the subclass to do its own sink get caps if needed.
 * @handle_frame:   Parses the input data into valid frames as defined by subclass
 *                  which should be passed to gst_base_parse_finish_frame().
 *                  The frame's input buffer is guaranteed writable,
 *                  whereas the input frame ownership is held by caller
 *                  (so subclass should make a copy if it needs to hang on).
 *                  Input buffer (data) is provided by baseclass with as much
 *                  metadata set as possible by baseclass according to upstream
 *                  information and/or subclass settings,
 *                  though subclass may still set buffer timestamp and duration
 *                  if desired.
 * @convert:        Optional.
 *                  Convert between formats.
 * @sink_event:     Optional.
 *                  Event handler on the sink pad. This function should chain
 *                  up to the parent implementation to let the default handler
 *                  run.
 * @src_event:      Optional.
 *                  Event handler on the source pad. Should chain up to the
 *                  parent to let the default handler run.
 * @pre_push_frame: Optional.
 *                   Called just prior to pushing a frame (after any pending
 *                   events have been sent) to give subclass a chance to perform
 *                   additional actions at this time (e.g. tag sending) or to
 *                   decide whether this buffer should be dropped or not
 *                   (e.g. custom segment clipping).
 * @detect:         Optional.
 *                   Called until it doesn't return GST_FLOW_OK anymore for
 *                   the first buffers. Can be used by the subclass to detect
 *                   the stream format.
 * @sink_query:     Optional.
 *                   Query handler on the sink pad. This function should chain
 *                   up to the parent implementation to let the default handler
 *                   run (Since: 1.2)
 * @src_query:      Optional.
 *                   Query handler on the source pad. Should chain up to the
 *                   parent to let the default handler run (Since: 1.2)
 *
 * Subclasses can override any of the available virtual methods or not, as
 * needed. At minimum @handle_frame needs to be overridden.
  }
{< public > }
{ virtual methods for subclasses  }
{*
   * GstBaseParseClass::handle_frame:
   * @skipsize: (out):
   *
   * Parses the input data into valid frames as defined by subclass
   * which should be passed to gst_base_parse_finish_frame().
   * The frame's input buffer is guaranteed writable,
   * whereas the input frame ownership is held by caller
   * (so subclass should make a copy if it needs to hang on).
   * Input buffer (data) is provided by baseclass with as much
   * metadata set as possible by baseclass according to upstream
   * information and/or subclass settings,
   * though subclass may still set buffer timestamp and duration
   * if desired.
    }
{< private > }
  PGstBaseParseClass = ^TGstBaseParseClass;
  TGstBaseParseClass = record
      parent_class : TGstElementClass;
      start : function (parse:PGstBaseParse):Tgboolean;cdecl;
      stop : function (parse:PGstBaseParse):Tgboolean;cdecl;
      set_sink_caps : function (parse:PGstBaseParse; caps:PGstCaps):Tgboolean;cdecl;
      handle_frame : function (parse:PGstBaseParse; frame:PGstBaseParseFrame; skipsize:Pgint):TGstFlowReturn;cdecl;
      pre_push_frame : function (parse:PGstBaseParse; frame:PGstBaseParseFrame):TGstFlowReturn;cdecl;
      convert : function (parse:PGstBaseParse; src_format:TGstFormat; src_value:Tgint64; dest_format:TGstFormat; dest_value:Pgint64):Tgboolean;cdecl;
      sink_event : function (parse:PGstBaseParse; event:PGstEvent):Tgboolean;cdecl;
      src_event : function (parse:PGstBaseParse; event:PGstEvent):Tgboolean;cdecl;
      get_sink_caps : function (parse:PGstBaseParse; filter:PGstCaps):PGstCaps;cdecl;
      detect : function (parse:PGstBaseParse; buffer:PGstBuffer):TGstFlowReturn;cdecl;
      sink_query : function (parse:PGstBaseParse; query:PGstQuery):Tgboolean;cdecl;
      src_query : function (parse:PGstBaseParse; query:PGstQuery):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE-2)-1] of Tgpointer;
    end;


function gst_base_parse_get_type:TGType;cdecl;external;
function gst_base_parse_frame_get_type:TGType;cdecl;external;
function gst_base_parse_frame_new(buffer:PGstBuffer; flags:TGstBaseParseFrameFlags; overhead:Tgint):PGstBaseParseFrame;cdecl;external;
procedure gst_base_parse_frame_init(frame:PGstBaseParseFrame);cdecl;external;
function gst_base_parse_frame_copy(frame:PGstBaseParseFrame):PGstBaseParseFrame;cdecl;external;
procedure gst_base_parse_frame_free(frame:PGstBaseParseFrame);cdecl;external;
function gst_base_parse_push_frame(parse:PGstBaseParse; frame:PGstBaseParseFrame):TGstFlowReturn;cdecl;external;
function gst_base_parse_finish_frame(parse:PGstBaseParse; frame:PGstBaseParseFrame; size:Tgint):TGstFlowReturn;cdecl;external;
procedure gst_base_parse_set_duration(parse:PGstBaseParse; fmt:TGstFormat; duration:Tgint64; interval:Tgint);cdecl;external;
procedure gst_base_parse_set_average_bitrate(parse:PGstBaseParse; bitrate:Tguint);cdecl;external;
procedure gst_base_parse_set_min_frame_size(parse:PGstBaseParse; min_size:Tguint);cdecl;external;
procedure gst_base_parse_set_has_timing_info(parse:PGstBaseParse; has_timing:Tgboolean);cdecl;external;
procedure gst_base_parse_drain(parse:PGstBaseParse);cdecl;external;
procedure gst_base_parse_set_syncable(parse:PGstBaseParse; syncable:Tgboolean);cdecl;external;
procedure gst_base_parse_set_passthrough(parse:PGstBaseParse; passthrough:Tgboolean);cdecl;external;
procedure gst_base_parse_set_pts_interpolation(parse:PGstBaseParse; pts_interpolate:Tgboolean);cdecl;external;
procedure gst_base_parse_set_infer_ts(parse:PGstBaseParse; infer_ts:Tgboolean);cdecl;external;
procedure gst_base_parse_set_frame_rate(parse:PGstBaseParse; fps_num:Tguint; fps_den:Tguint; lead_in:Tguint; lead_out:Tguint);cdecl;external;
procedure gst_base_parse_set_latency(parse:PGstBaseParse; min_latency:TGstClockTime; max_latency:TGstClockTime);cdecl;external;
function gst_base_parse_convert_default(parse:PGstBaseParse; src_format:TGstFormat; src_value:Tgint64; dest_format:TGstFormat; dest_value:Pgint64):Tgboolean;cdecl;external;
function gst_base_parse_add_index_entry(parse:PGstBaseParse; offset:Tguint64; ts:TGstClockTime; key:Tgboolean; force:Tgboolean):Tgboolean;cdecl;external;
procedure gst_base_parse_set_ts_at_offset(parse:PGstBaseParse; offset:Tgsize);cdecl;external;
procedure gst_base_parse_merge_tags(parse:PGstBaseParse; tags:PGstTagList; mode:TGstTagMergeMode);cdecl;external;
{////////G_DEFINE_AUTOPTR_CLEANUP_FUNC     (GstBaseParseFrame, gst_base_parse_frame_free) }
{////////G_DEFINE_AUTOPTR_CLEANUP_FUNC     (GstBaseParse, gst_object_unref) }
{$endif}
{ __GST_BASE_PARSE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_BASE_PARSE : longint; { return type might be wrong }
  begin
    GST_TYPE_BASE_PARSE:=gst_base_parse_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_PARSE(obj : longint) : longint;
begin
  GST_BASE_PARSE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_BASE_PARSE,GstBaseParse);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_PARSE_CLASS(klass : longint) : longint;
begin
  GST_BASE_PARSE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_BASE_PARSE,GstBaseParseClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_PARSE_GET_CLASS(obj : longint) : longint;
begin
  GST_BASE_PARSE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_BASE_PARSE,GstBaseParseClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_PARSE(obj : longint) : longint;
begin
  GST_IS_BASE_PARSE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_BASE_PARSE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_PARSE_CLASS(klass : longint) : longint;
begin
  GST_IS_BASE_PARSE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_BASE_PARSE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BASE_PARSE_CAST(obj : longint) : PGstBaseParse;
begin
  GST_BASE_PARSE_CAST:=PGstBaseParse(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_PARSE_SRC_PAD(obj : longint) : longint;
begin
  GST_BASE_PARSE_SRC_PAD:=(GST_BASE_PARSE_CAST(obj))^.srcpad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_PARSE_SINK_PAD(obj : longint) : longint;
begin
  GST_BASE_PARSE_SINK_PAD:=(GST_BASE_PARSE_CAST(obj))^.sinkpad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_PARSE_LOST_SYNC(parse : longint) : longint;
begin
  GST_BASE_PARSE_LOST_SYNC:= not ( not (((GST_BASE_PARSE_CAST(parse))^.flags) and GST_BASE_PARSE_FLAG_LOST_SYNC));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_PARSE_DRAINING(parse : longint) : longint;
begin
  GST_BASE_PARSE_DRAINING:= not ( not (((GST_BASE_PARSE_CAST(parse))^.flags) and GST_BASE_PARSE_FLAG_DRAINING));
end;


end.
