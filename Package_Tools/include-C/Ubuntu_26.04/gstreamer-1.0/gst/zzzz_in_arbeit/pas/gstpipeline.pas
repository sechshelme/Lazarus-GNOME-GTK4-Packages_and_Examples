unit gstpipeline;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *
 * gstpipeline.h: Header for GstPipeline element
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
{$ifndef __GST_PIPELINE_H__}
{$define __GST_PIPELINE_H__}
{$include <gst/gstbin.h>}

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PIPELINE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PIPELINE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PIPELINE_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PIPELINE_CAST(obj : longint) : PGstPipeline;

type
{*
 * GstPipelineFlags:
 * @GST_PIPELINE_FLAG_FIXED_CLOCK: this pipeline works with a fixed clock
 * @GST_PIPELINE_FLAG_LAST: offset to define more flags
 *
 * Pipeline flags
  }
{ padding  }

  PGstPipelineFlags = ^TGstPipelineFlags;
  TGstPipelineFlags =  Longint;
  Const
    GST_PIPELINE_FLAG_FIXED_CLOCK = GST_BIN_FLAG_LAST shl 0;
    GST_PIPELINE_FLAG_LAST = GST_BIN_FLAG_LAST shl 4;
;
{*
 * GstPipeline:
 * @fixed_clock: The fixed clock of the pipeline, used when
 *               GST_PIPELINE_FLAG_FIXED_CLOCK is set.
 * @stream_time: The stream time of the pipeline. A better name for this
 *         property would be the running_time, the total time spent in the
 *         PLAYING state without being flushed. (deprecated, use the start_time
 *         on GstElement).
 * @delay: Extra delay added to base_time to compensate for computing delays
 *         when setting elements to PLAYING.
 *
 * The #GstPipeline structure.
  }
{< public > }{ with LOCK  }
{< private > }
type
  PGstPipeline = ^TGstPipeline;
  TGstPipeline = record
      bin : TGstBin;
      fixed_clock : PGstClock;
      stream_time : TGstClockTime;
      delay : TGstClockTime;
      priv : PGstPipelinePrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstPipelineClass = ^TGstPipelineClass;
  TGstPipelineClass = record
      parent_class : TGstBinClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_pipeline_get_type:TGType;cdecl;external libgstreamer;
function gst_pipeline_new(name:Pgchar):PGstElement;cdecl;external libgstreamer;
function gst_pipeline_get_bus(pipeline:PGstPipeline):PGstBus;cdecl;external libgstreamer;
procedure gst_pipeline_use_clock(pipeline:PGstPipeline; clock:PGstClock);cdecl;external libgstreamer;
function gst_pipeline_set_clock(pipeline:PGstPipeline; clock:PGstClock):Tgboolean;cdecl;external libgstreamer;
function gst_pipeline_get_clock(pipeline:PGstPipeline):PGstClock;cdecl;external libgstreamer;
function gst_pipeline_get_pipeline_clock(pipeline:PGstPipeline):PGstClock;cdecl;external libgstreamer;
procedure gst_pipeline_auto_clock(pipeline:PGstPipeline);cdecl;external libgstreamer;
procedure gst_pipeline_set_delay(pipeline:PGstPipeline; delay:TGstClockTime);cdecl;external libgstreamer;
function gst_pipeline_get_delay(pipeline:PGstPipeline):TGstClockTime;cdecl;external libgstreamer;
procedure gst_pipeline_set_latency(pipeline:PGstPipeline; latency:TGstClockTime);cdecl;external libgstreamer;
function gst_pipeline_get_latency(pipeline:PGstPipeline):TGstClockTime;cdecl;external libgstreamer;
procedure gst_pipeline_set_auto_flush_bus(pipeline:PGstPipeline; auto_flush:Tgboolean);cdecl;external libgstreamer;
function gst_pipeline_get_auto_flush_bus(pipeline:PGstPipeline):Tgboolean;cdecl;external libgstreamer;
function gst_pipeline_is_live(pipeline:PGstPipeline):Tgboolean;cdecl;external libgstreamer;
function gst_pipeline_get_configured_latency(pipeline:PGstPipeline):TGstClockTime;cdecl;external libgstreamer;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstPipeline, gst_object_unref) }
{$endif}
{ __GST_PIPELINE_H__  }

// === Konventiert am: 11-7-26 15:17:19 ===

function GST_TYPE_PIPELINE : TGType;
function GST_PIPELINE(obj : Pointer) : PGstPipeline;
function GST_IS_PIPELINE(obj : Pointer) : Tgboolean;

implementation

function GST_TYPE_PIPELINE : TGType;
  begin
    GST_TYPE_PIPELINE:=gst_pipeline_get_type;
  end;

function GST_PIPELINE(obj : Pointer) : PGstPipeline;
begin
  Result := PGstPipeline(g_type_check_instance_cast(obj, GST_TYPE_PIPELINE));
end;

function GST_IS_PIPELINE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_PIPELINE);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PIPELINE_CLASS(klass : longint) : longint;
begin
  GST_PIPELINE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PIPELINE,GstPipelineClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PIPELINE_CLASS(klass : longint) : longint;
begin
  GST_IS_PIPELINE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PIPELINE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PIPELINE_GET_CLASS(obj : longint) : longint;
begin
  GST_PIPELINE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_PIPELINE,GstPipelineClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PIPELINE_CAST(obj : longint) : PGstPipeline;
begin
  GST_PIPELINE_CAST:=PGstPipeline(obj);
end;


end.
