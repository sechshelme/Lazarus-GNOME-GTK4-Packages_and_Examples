unit gstvideoaggregator;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Generic video aggregator plugin
 * Copyright (C) 2008 Wim Taymans <wim@fluendo.com>
 * Copyright (C) 2010 Sebastian Dröge <sebastian.droege@collabora.co.uk>
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
{$ifndef __GST_VIDEO_AGGREGATOR_H__}
{$define __GST_VIDEO_AGGREGATOR_H__}
{$include <gst/video/video.h>}
{$include <gst/base/gstaggregator.h>}
type
{************************
 * GstVideoAggregatorPad *
 ************************ }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_AGGREGATOR_PAD_CAST(obj : longint) : PGstVideoAggregatorPad;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_PAD_GET_CLASS(obj : longint) : longint;

type
{*
 * GstVideoAggregatorPad:
 * @info: The #GstVideoInfo currently set on the pad
 *
 * Since: 1.16
  }
{< public > }
{ read-only, with OBJECT_LOCK  }
{ < private >  }
  PGstVideoAggregatorPad = ^TGstVideoAggregatorPad;
  TGstVideoAggregatorPad = record
      parent : TGstAggregatorPad;
      info : TGstVideoInfo;
      priv : PGstVideoAggregatorPadPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVideoAggregatorPadClass:
 * @update_conversion_info: Called when either the input or output formats
 *                          have changed.
 * @prepare_frame: Prepare the frame from the pad buffer and sets it to prepared_frame.
 *      Implementations should always return TRUE.  Returning FALSE will cease
 *      iteration over subsequent pads.
 * @clean_frame:   clean the frame previously prepared in prepare_frame
 *
 * Since: 1.16
  }
{*
 * GstVideoAggregatorPadClass::prepare_frame_start:
 * @pad: the #GstVideoAggregatorPad
 * @videoaggregator: the parent #GstVideoAggregator
 * @buffer: the input #GstBuffer to prepare
 * @prepared_frame: the #GstVideoFrame to prepare into
 *
 * Begin preparing the frame from the pad buffer and sets it to prepared_frame.
 *
 * If overriden, `prepare_frame_finish` must also be overriden.
 *
 * Since: 1.20
  }
{*
 * GstVideoAggregatorPadClass::prepare_frame_finish:
 * @pad: the #GstVideoAggregatorPad
 * @videoaggregator: the parent #GstVideoAggregator
 * @prepared_frame: the #GstVideoFrame to prepare into
 *
 * Finish preparing @prepared_frame.
 *
 * If overriden, `prepare_frame_start` must also be overriden.
 *
 * Since: 1.20
  }
  PGstVideoAggregatorPadClass = ^TGstVideoAggregatorPadClass;
  TGstVideoAggregatorPadClass = record
      parent_class : TGstAggregatorPadClass;
      update_conversion_info : procedure (pad:PGstVideoAggregatorPad);cdecl;
      prepare_frame : function (pad:PGstVideoAggregatorPad; videoaggregator:PGstVideoAggregator; buffer:PGstBuffer; prepared_frame:PGstVideoFrame):Tgboolean;cdecl;
      clean_frame : procedure (pad:PGstVideoAggregatorPad; videoaggregator:PGstVideoAggregator; prepared_frame:PGstVideoFrame);cdecl;
      prepare_frame_start : procedure (pad:PGstVideoAggregatorPad; videoaggregator:PGstVideoAggregator; buffer:PGstBuffer; prepared_frame:PGstVideoFrame);cdecl;
      prepare_frame_finish : procedure (pad:PGstVideoAggregatorPad; videoaggregator:PGstVideoAggregator; prepared_frame:PGstVideoFrame);cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE-2)-1] of Tgpointer;
    end;


function gst_video_aggregator_pad_get_type:TGType;cdecl;external libgstvideo;
function gst_video_aggregator_pad_has_current_buffer(pad:PGstVideoAggregatorPad):Tgboolean;cdecl;external libgstvideo;
function gst_video_aggregator_pad_get_current_buffer(pad:PGstVideoAggregatorPad):PGstBuffer;cdecl;external libgstvideo;
function gst_video_aggregator_pad_get_prepared_frame(pad:PGstVideoAggregatorPad):PGstVideoFrame;cdecl;external libgstvideo;
procedure gst_video_aggregator_pad_set_needs_alpha(pad:PGstVideoAggregatorPad; needs_alpha:Tgboolean);cdecl;external libgstvideo;
{*******************************
 * GstVideoAggregatorConvertPad *
 ****************************** }
{ was #define dname def_expr }
function GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_CONVERT_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_CONVERT_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_CONVERT_PAD_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR_CONVERT_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR_CONVERT_PAD_CLASS(klass : longint) : longint;

type
{*
 * GstVideoAggregatorConvertPad:
 *
 * An implementation of GstPad that can be used with #GstVideoAggregator.
 *
 * See #GstVideoAggregator for more details.
 *
 * Since: 1.16
  }
{< private > }
  PGstVideoAggregatorConvertPad = ^TGstVideoAggregatorConvertPad;
  TGstVideoAggregatorConvertPad = record
      parent : TGstVideoAggregatorPad;
      priv : PGstVideoAggregatorConvertPadPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVideoAggregatorConvertPadClass:
 *
 * Since: 1.16
  }
{< private > }
  PGstVideoAggregatorConvertPadClass = ^TGstVideoAggregatorConvertPadClass;
  TGstVideoAggregatorConvertPadClass = record
      parent_class : TGstVideoAggregatorPadClass;
      create_conversion_info : procedure (pad:PGstVideoAggregatorConvertPad; agg:PGstVideoAggregator; conversion_info:PGstVideoInfo);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_video_aggregator_convert_pad_get_type:TGType;cdecl;external libgstvideo;
procedure gst_video_aggregator_convert_pad_update_conversion_info(pad:PGstVideoAggregatorConvertPad);cdecl;external libgstvideo;
{////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoAggregatorConvertPad, gst_object_unref) }
{***************************************
 * GstVideoAggregatorParallelConvertPad *
 *************************************** }
{ was #define dname def_expr }
function GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GstVideoAggregatorParallelConvertPad, gst_video_aggregator_parallel_convert_pad, GST, VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD, GstVideoAggregatorConvertPad) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_CLASS(klass : longint) : longint;

{*
 * GstVideoAggregatorParallelConvertPad:
 *
 * An implementation of GstPad that can be used with #GstVideoAggregator.
 *
 * See #GstVideoAggregator for more details.
 *
 * Since: 1.20
  }
{*
 * GstVideoAggregatorParallelConvertPadClass:
 *
 * Since: 1.20
  }
{< private > }
type
  PGstVideoAggregatorParallelConvertPadClass = ^TGstVideoAggregatorParallelConvertPadClass;
  TGstVideoAggregatorParallelConvertPadClass = record
      parent_class : TGstVideoAggregatorConvertPadClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*********************
 * GstVideoAggregator *
 ******************** }

{ was #define dname def_expr }
function GST_TYPE_VIDEO_AGGREGATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_AGGREGATOR_CAST(obj : longint) : PGstVideoAggregator;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_GET_CLASS(obj : longint) : longint;

{*
 * GstVideoAggregator:
 * @info: The #GstVideoInfo representing the currently set
 * srcpad caps.
 *
 * Since: 1.16
  }
{< public > }
{ Output caps  }
{ < private >  }
type
  PGstVideoAggregator = ^TGstVideoAggregator;
  TGstVideoAggregator = record
      aggregator : TGstAggregator;
      info : TGstVideoInfo;
      priv : PGstVideoAggregatorPrivate;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
 * GstVideoAggregatorClass:
 * @update_caps:              Optional.
 *                            Lets subclasses update the #GstCaps representing
 *                            the src pad caps before usage.  Return %NULL to indicate failure.
 * @aggregate_frames:         Lets subclasses aggregate frames that are ready. Subclasses
 *                            should iterate the GstElement.sinkpads and use the already
 *                            mapped #GstVideoFrame from gst_video_aggregator_pad_get_prepared_frame()
 *                            or directly use the #GstBuffer from gst_video_aggregator_pad_get_current_buffer()
 *                            if it needs to map the buffer in a special way. The result of the
 *                            aggregation should land in @outbuffer.
 * @create_output_buffer:     Optional.
 *                            Lets subclasses provide a #GstBuffer to be used as @outbuffer of
 *                            the #aggregate_frames vmethod.
 * @find_best_format:         Optional.
 *                            Lets subclasses decide of the best common format to use.
 *
 * Since: 1.16
 * }
{< private > }
{< public > }
{*
   * GstVideoAggregatorClass::find_best_format:
   * @at_least_one_alpha: (out):
    }
{ < private >  }
  PGstVideoAggregatorClass = ^TGstVideoAggregatorClass;
  TGstVideoAggregatorClass = record
      parent_class : TGstAggregatorClass;
      update_caps : function (videoaggregator:PGstVideoAggregator; caps:PGstCaps):PGstCaps;cdecl;
      aggregate_frames : function (videoaggregator:PGstVideoAggregator; outbuffer:PGstBuffer):TGstFlowReturn;cdecl;
      create_output_buffer : function (videoaggregator:PGstVideoAggregator; outbuffer:PPGstBuffer):TGstFlowReturn;cdecl;
      find_best_format : procedure (vagg:PGstVideoAggregator; downstream_caps:PGstCaps; best_info:PGstVideoInfo; at_least_one_alpha:Pgboolean);cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;


function gst_video_aggregator_get_type:TGType;cdecl;external libgstvideo;
function gst_video_aggregator_get_execution_task_pool(vagg:PGstVideoAggregator):PGstTaskPool;cdecl;external libgstvideo;
{////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoAggregator, gst_object_unref) }
{////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoAggregatorPad, gst_object_unref) }
{$endif}
{ __GST_VIDEO_AGGREGATOR_H__  }

// === Konventiert am: 15-7-26 13:21:57 ===

function GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD: TGType;
function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD(obj: Pointer): PGstVideoAggregatorParallelConvertPad;
function GST_IS_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD(obj: Pointer): Tgboolean;
function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_CLASS(klass: Pointer): PGstVideoAggregatorParallelConvertPadClass;
function GST_IS_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_CLASS(klass: Pointer): Tgboolean;
function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_GET_CLASS(obj: Pointer): PGstVideoAggregatorParallelConvertPadClass;

implementation

function GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD: TGType;
begin
  Result := gst_video_aggregator_parallel_convert_pad_get_type;
end;

function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD(obj: Pointer): PGstVideoAggregatorParallelConvertPad;
begin
  Result := PGstVideoAggregatorParallelConvertPad(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD));
end;

function GST_IS_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD);
end;

function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_CLASS(klass: Pointer): PGstVideoAggregatorParallelConvertPadClass;
begin
  Result := PGstVideoAggregatorParallelConvertPadClass(g_type_check_class_cast(klass, GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD));
end;

function GST_IS_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD);
end;

function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_GET_CLASS(obj: Pointer): PGstVideoAggregatorParallelConvertPadClass;
begin
  Result := PGstVideoAggregatorParallelConvertPadClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGstVideoAggregatorParallelConvertPad = record
    parent_instance: TGstVideoAggregatorConvertPad;
  end;
  PGstVideoAggregatorParallelConvertPad = ^TGstVideoAggregatorParallelConvertPad;

  PGstVideoAggregatorParallelConvertPadClass = type Pointer;

function gst_video_aggregator_parallel_convert_pad_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_PAD(obj : longint) : longint;
begin
  GST_VIDEO_AGGREGATOR_PAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VIDEO_AGGREGATOR_PAD,GstVideoAggregatorPad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_AGGREGATOR_PAD_CAST(obj : longint) : PGstVideoAggregatorPad;
begin
  GST_VIDEO_AGGREGATOR_PAD_CAST:=PGstVideoAggregatorPad(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_PAD_CLASS(klass : longint) : longint;
begin
  GST_VIDEO_AGGREGATOR_PAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VIDEO_AGGREGATOR_PAD,GstVideoAggregatorPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR_PAD(obj : longint) : longint;
begin
  GST_IS_VIDEO_AGGREGATOR_PAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VIDEO_AGGREGATOR_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR_PAD_CLASS(klass : longint) : longint;
begin
  GST_IS_VIDEO_AGGREGATOR_PAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VIDEO_AGGREGATOR_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_PAD_GET_CLASS(obj : longint) : longint;
begin
  GST_VIDEO_AGGREGATOR_PAD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VIDEO_AGGREGATOR_PAD,GstVideoAggregatorPadClass);
end;

{ was #define dname def_expr }
function GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD:=gst_video_aggregator_convert_pad_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_CONVERT_PAD(obj : longint) : longint;
begin
  GST_VIDEO_AGGREGATOR_CONVERT_PAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD,GstVideoAggregatorConvertPad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_CONVERT_PAD_CLASS(klass : longint) : longint;
begin
  GST_VIDEO_AGGREGATOR_CONVERT_PAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD,GstVideoAggregatorConvertPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_CONVERT_PAD_GET_CLASS(obj : longint) : longint;
begin
  GST_VIDEO_AGGREGATOR_CONVERT_PAD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD,GstVideoAggregatorConvertPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR_CONVERT_PAD(obj : longint) : longint;
begin
  GST_IS_VIDEO_AGGREGATOR_CONVERT_PAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR_CONVERT_PAD_CLASS(klass : longint) : longint;
begin
  GST_IS_VIDEO_AGGREGATOR_CONVERT_PAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD);
end;

{ was #define dname def_expr }
function GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD:=gst_video_aggregator_parallel_convert_pad_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD(obj : longint) : longint;
begin
  GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD,GstVideoAggregatorParallelConvertPad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_CLASS(klass : longint) : longint;
begin
  GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD,GstVideoAggregatorConvertPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_GET_CLASS(obj : longint) : longint;
begin
  GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD,GstVideoAggregatorConvertPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD(obj : longint) : longint;
begin
  GST_IS_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_CLASS(klass : longint) : longint;
begin
  GST_IS_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD);
end;

{ was #define dname def_expr }
function GST_TYPE_VIDEO_AGGREGATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_AGGREGATOR:=gst_video_aggregator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR(obj : longint) : longint;
begin
  GST_VIDEO_AGGREGATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VIDEO_AGGREGATOR,GstVideoAggregator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_AGGREGATOR_CAST(obj : longint) : PGstVideoAggregator;
begin
  GST_VIDEO_AGGREGATOR_CAST:=PGstVideoAggregator(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_CLASS(klass : longint) : longint;
begin
  GST_VIDEO_AGGREGATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VIDEO_AGGREGATOR,GstVideoAggregatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR(obj : longint) : longint;
begin
  GST_IS_VIDEO_AGGREGATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VIDEO_AGGREGATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_AGGREGATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_VIDEO_AGGREGATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VIDEO_AGGREGATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_AGGREGATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_VIDEO_AGGREGATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VIDEO_AGGREGATOR,GstVideoAggregatorClass);
end;


end.
