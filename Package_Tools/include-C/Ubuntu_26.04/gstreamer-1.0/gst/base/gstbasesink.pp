
unit gstbasesink;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstbasesink.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstbasesink.h
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
PGstBaseSink  = ^GstBaseSink;
PGstBaseSinkClass  = ^GstBaseSinkClass;
PGstBaseSinkPrivate  = ^GstBaseSinkPrivate;
PGstBuffer  = ^GstBuffer;
PGstBufferList  = ^GstBufferList;
PGstCaps  = ^GstCaps;
PGstClockTime  = ^GstClockTime;
PGstClockTimeDiff  = ^GstClockTimeDiff;
PGstEvent  = ^GstEvent;
PGstMiniObject  = ^GstMiniObject;
PGstPad  = ^GstPad;
PGstQuery  = ^GstQuery;
PGstSample  = ^GstSample;
PGstStructure  = ^GstStructure;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *
 * gstbasesink.h:
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
{$ifndef __GST_BASE_SINK_H__}
{$define __GST_BASE_SINK_H__}
{$include <gst/gst.h>}
{$include <gst/base/base-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_BASE_SINK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_SINK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_SINK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BASE_SINK_CAST(obj : longint) : PGstBaseSink;

{*
 * GST_BASE_SINK_PAD:
 * @obj: base sink instance
 *
 * Gives the pointer to the #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_GET_PREROLL_LOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PREROLL_LOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PREROLL_TRYLOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PREROLL_UNLOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_GET_PREROLL_COND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PREROLL_WAIT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PREROLL_WAIT_UNTIL(obj,end_time : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PREROLL_SIGNAL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PREROLL_BROADCAST(obj : longint) : longint;

{*
 * GST_BASE_SINK_FLOW_DROPPED:
 *
 * A #GstFlowReturn that can be returned from
 * #GstBaseSinkClass::render to indicate that the output buffer was not
 * rendered.
 *
 * Note that this is currently not support for #GstBaseSinkClass::render_list
 * virtual method.
 *
 * Since: 1.24
  }
const
  GST_BASE_SINK_FLOW_DROPPED = GST_FLOW_CUSTOM_SUCCESS;  
type
{*
 * GstBaseSink:
 *
 * The opaque #GstBaseSink data structure.
  }
{< protected > }
{< protected > }{ with LOCK  }
{< protected > }{ with PREROLL_LOCK  }
{< protected > }{ with STREAM_LOCK  }
{< private > }{ with LOCK  }
{< private > }
  PGstBaseSink = ^TGstBaseSink;
  TGstBaseSink = record
      element : TGstElement;
      sinkpad : PGstPad;
      pad_mode : TGstPadMode;
      offset : Tguint64;
      can_activate_pull : Tgboolean;
      can_activate_push : Tgboolean;
      preroll_lock : TGMutex;
      preroll_cond : TGCond;
      eos : Tgboolean;
      need_preroll : Tgboolean;
      have_preroll : Tgboolean;
      playing_async : Tgboolean;
      have_newsegment : Tgboolean;
      segment : TGstSegment;
      clock_id : TGstClockID;
      sync : Tgboolean;
      flushing : Tgboolean;
      running : Tgboolean;
      max_lateness : Tgint64;
      priv : PGstBaseSinkPrivate;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
 * GstBaseSinkClass:
 * @parent_class: Element parent class
 * @get_caps: Called to get sink pad caps from the subclass
 * @set_caps: Notify subclass of changed caps
 * @fixate: Only useful in pull mode. Implement if you have
 *     ideas about what should be the default values for the caps you support.
 * @activate_pull: Subclasses should override this when they can provide an
 *     alternate method of spawning a thread to drive the pipeline in pull mode.
 *     Should start or stop the pulling thread, depending on the value of the
 *     "active" argument. Called after actually activating the sink pad in pull
 *     mode. The default implementation starts a task on the sink pad.
 * @get_times: Called to get the start and end times for synchronising
 *     the passed buffer to the clock
 * @propose_allocation: configure the allocation query
 * @start: Start processing. Ideal for opening resources in the subclass
 * @stop: Stop processing. Subclasses should use this to close resources.
 * @unlock: Unlock any pending access to the resource. Subclasses should
 *     unblock any blocked function ASAP and call gst_base_sink_wait_preroll()
 * @unlock_stop: Clear the previous unlock request. Subclasses should clear
 *     any state they set during #GstBaseSinkClass::unlock, and be ready to
 *     continue where they left off after gst_base_sink_wait_preroll(),
 *     gst_base_sink_wait() or gst_wait_sink_wait_clock() return or
 *     #GstBaseSinkClass::render is called again.
 * @query: perform a #GstQuery on the element.
 * @event: Override this to handle events arriving on the sink pad
 * @wait_event: Override this to implement custom logic to wait for the event
 *     time (for events like EOS and GAP). Subclasses should always first
 *     chain up to the default implementation.
 * @prepare: Called to prepare the buffer for @render and @preroll. This
 *     function is called before synchronisation is performed.
 * @prepare_list: Called to prepare the buffer list for @render_list. This
 *     function is called before synchronisation is performed.
 * @preroll: Called to present the preroll buffer if desired.
 * @render: Called when a buffer should be presented or output, at the
 *     correct moment if the #GstBaseSink has been set to sync to the clock.
 * @render_list: Same as @render but used with buffer lists instead of
 *     buffers.
 *
 * Subclasses can override any of the available virtual methods or not, as
 * needed. At the minimum, the @render method should be overridden to
 * output/present buffers.
  }
{*
   * GstBaseSinkClass::get_caps:
   * @filter: (in) (nullable):
   *
   * Called to get sink pad caps from the subclass.
    }
{ notify subclass of new caps  }
{ fixate sink caps during pull-mode negotiation  }
{ start or stop a pulling thread  }
{*
   * GstBaseSinkClass::get_times:
   * @start: (out): the start #GstClockTime
   * @end: (out): the end #GstClockTime
   *
   * Get the start and end times for syncing on this buffer.
    }
{ propose allocation parameters for upstream  }
{ start and stop processing, ideal for opening/closing the resource  }
{ unlock any pending access to the resource. subclasses should unlock
   * any function ASAP.  }
{ Clear a previously indicated unlock request not that unlocking is
   * complete. Sub-classes should clear any command queue or indicator they
   * set during unlock  }
{ notify subclass of query  }
{ notify subclass of event  }
{ wait for eos or gap, subclasses should chain up to parent first  }
{ notify subclass of buffer or list before doing sync  }
{ notify subclass of preroll buffer or real buffer  }
{ Render a BufferList  }
{< private > }
  PGstBaseSinkClass = ^TGstBaseSinkClass;
  TGstBaseSinkClass = record
      parent_class : TGstElementClass;
      get_caps : function (sink:PGstBaseSink; filter:PGstCaps):PGstCaps;cdecl;
      set_caps : function (sink:PGstBaseSink; caps:PGstCaps):Tgboolean;cdecl;
      fixate : function (sink:PGstBaseSink; caps:PGstCaps):PGstCaps;cdecl;
      activate_pull : function (sink:PGstBaseSink; active:Tgboolean):Tgboolean;cdecl;
      get_times : procedure (sink:PGstBaseSink; buffer:PGstBuffer; start:PGstClockTime; end:PGstClockTime);cdecl;
      propose_allocation : function (sink:PGstBaseSink; query:PGstQuery):Tgboolean;cdecl;
      start : function (sink:PGstBaseSink):Tgboolean;cdecl;
      stop : function (sink:PGstBaseSink):Tgboolean;cdecl;
      unlock : function (sink:PGstBaseSink):Tgboolean;cdecl;
      unlock_stop : function (sink:PGstBaseSink):Tgboolean;cdecl;
      query : function (sink:PGstBaseSink; query:PGstQuery):Tgboolean;cdecl;
      event : function (sink:PGstBaseSink; event:PGstEvent):Tgboolean;cdecl;
      wait_event : function (sink:PGstBaseSink; event:PGstEvent):TGstFlowReturn;cdecl;
      prepare : function (sink:PGstBaseSink; buffer:PGstBuffer):TGstFlowReturn;cdecl;
      prepare_list : function (sink:PGstBaseSink; buffer_list:PGstBufferList):TGstFlowReturn;cdecl;
      preroll : function (sink:PGstBaseSink; buffer:PGstBuffer):TGstFlowReturn;cdecl;
      render : function (sink:PGstBaseSink; buffer:PGstBuffer):TGstFlowReturn;cdecl;
      render_list : function (sink:PGstBaseSink; buffer_list:PGstBufferList):TGstFlowReturn;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;


function gst_base_sink_get_type:TGType;cdecl;external;
function gst_base_sink_do_preroll(sink:PGstBaseSink; obj:PGstMiniObject):TGstFlowReturn;cdecl;external;
function gst_base_sink_wait_preroll(sink:PGstBaseSink):TGstFlowReturn;cdecl;external;
{ synchronizing against the clock  }
procedure gst_base_sink_set_sync(sink:PGstBaseSink; sync:Tgboolean);cdecl;external;
function gst_base_sink_get_sync(sink:PGstBaseSink):Tgboolean;cdecl;external;
{ Drop buffers which are out of segment  }
procedure gst_base_sink_set_drop_out_of_segment(sink:PGstBaseSink; drop_out_of_segment:Tgboolean);cdecl;external;
function gst_base_sink_get_drop_out_of_segment(sink:PGstBaseSink):Tgboolean;cdecl;external;
{ dropping late buffers  }
procedure gst_base_sink_set_max_lateness(sink:PGstBaseSink; max_lateness:Tgint64);cdecl;external;
function gst_base_sink_get_max_lateness(sink:PGstBaseSink):Tgint64;cdecl;external;
{ performing QoS  }
procedure gst_base_sink_set_qos_enabled(sink:PGstBaseSink; enabled:Tgboolean);cdecl;external;
function gst_base_sink_is_qos_enabled(sink:PGstBaseSink):Tgboolean;cdecl;external;
{ doing async state changes  }
procedure gst_base_sink_set_async_enabled(sink:PGstBaseSink; enabled:Tgboolean);cdecl;external;
function gst_base_sink_is_async_enabled(sink:PGstBaseSink):Tgboolean;cdecl;external;
{ tuning synchronisation  }
procedure gst_base_sink_set_ts_offset(sink:PGstBaseSink; offset:TGstClockTimeDiff);cdecl;external;
function gst_base_sink_get_ts_offset(sink:PGstBaseSink):TGstClockTimeDiff;cdecl;external;
{ last sample  }
function gst_base_sink_get_last_sample(sink:PGstBaseSink):PGstSample;cdecl;external;
procedure gst_base_sink_set_last_sample_enabled(sink:PGstBaseSink; enabled:Tgboolean);cdecl;external;
function gst_base_sink_is_last_sample_enabled(sink:PGstBaseSink):Tgboolean;cdecl;external;
{ latency  }
function gst_base_sink_query_latency(sink:PGstBaseSink; live:Pgboolean; upstream_live:Pgboolean; min_latency:PGstClockTime; max_latency:PGstClockTime):Tgboolean;cdecl;external;
function gst_base_sink_get_latency(sink:PGstBaseSink):TGstClockTime;cdecl;external;
{ render delay  }
procedure gst_base_sink_set_render_delay(sink:PGstBaseSink; delay:TGstClockTime);cdecl;external;
function gst_base_sink_get_render_delay(sink:PGstBaseSink):TGstClockTime;cdecl;external;
{ blocksize  }
procedure gst_base_sink_set_blocksize(sink:PGstBaseSink; blocksize:Tguint);cdecl;external;
function gst_base_sink_get_blocksize(sink:PGstBaseSink):Tguint;cdecl;external;
{ throttle-time  }
procedure gst_base_sink_set_throttle_time(sink:PGstBaseSink; throttle:Tguint64);cdecl;external;
function gst_base_sink_get_throttle_time(sink:PGstBaseSink):Tguint64;cdecl;external;
{ max-bitrate  }
procedure gst_base_sink_set_max_bitrate(sink:PGstBaseSink; max_bitrate:Tguint64);cdecl;external;
function gst_base_sink_get_max_bitrate(sink:PGstBaseSink):Tguint64;cdecl;external;
{ processing deadline  }
procedure gst_base_sink_set_processing_deadline(sink:PGstBaseSink; processing_deadline:TGstClockTime);cdecl;external;
function gst_base_sink_get_processing_deadline(sink:PGstBaseSink):TGstClockTime;cdecl;external;
function gst_base_sink_wait_clock(sink:PGstBaseSink; time:TGstClockTime; jitter:PGstClockTimeDiff):TGstClockReturn;cdecl;external;
function gst_base_sink_wait(sink:PGstBaseSink; time:TGstClockTime; jitter:PGstClockTimeDiff):TGstFlowReturn;cdecl;external;
function gst_base_sink_get_stats(sink:PGstBaseSink):PGstStructure;cdecl;external;
{////////G_DEFINE_AUTOPTR_CLEANUP_FUNC     (GstBaseSink, gst_object_unref) }
{$endif}
{ __GST_BASE_SINK_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_BASE_SINK : longint; { return type might be wrong }
  begin
    GST_TYPE_BASE_SINK:=gst_base_sink_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK(obj : longint) : longint;
begin
  GST_BASE_SINK:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_BASE_SINK,GstBaseSink);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_CLASS(klass : longint) : longint;
begin
  GST_BASE_SINK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_BASE_SINK,GstBaseSinkClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_GET_CLASS(obj : longint) : longint;
begin
  GST_BASE_SINK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_BASE_SINK,GstBaseSinkClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_SINK(obj : longint) : longint;
begin
  GST_IS_BASE_SINK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_BASE_SINK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_SINK_CLASS(klass : longint) : longint;
begin
  GST_IS_BASE_SINK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_BASE_SINK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BASE_SINK_CAST(obj : longint) : PGstBaseSink;
begin
  GST_BASE_SINK_CAST:=PGstBaseSink(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PAD(obj : longint) : longint;
begin
  GST_BASE_SINK_PAD:=(GST_BASE_SINK_CAST(obj))^.sinkpad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_GET_PREROLL_LOCK(obj : longint) : longint;
begin
  GST_BASE_SINK_GET_PREROLL_LOCK:=@((GST_BASE_SINK_CAST(obj))^.preroll_lock);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PREROLL_LOCK(obj : longint) : longint;
begin
  GST_BASE_SINK_PREROLL_LOCK:=g_mutex_lock(GST_BASE_SINK_GET_PREROLL_LOCK(obj));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PREROLL_TRYLOCK(obj : longint) : longint;
begin
  GST_BASE_SINK_PREROLL_TRYLOCK:=g_mutex_trylock(GST_BASE_SINK_GET_PREROLL_LOCK(obj));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PREROLL_UNLOCK(obj : longint) : longint;
begin
  GST_BASE_SINK_PREROLL_UNLOCK:=g_mutex_unlock(GST_BASE_SINK_GET_PREROLL_LOCK(obj));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_GET_PREROLL_COND(obj : longint) : longint;
begin
  GST_BASE_SINK_GET_PREROLL_COND:=@((GST_BASE_SINK_CAST(obj))^.preroll_cond);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PREROLL_WAIT(obj : longint) : longint;
begin
  GST_BASE_SINK_PREROLL_WAIT:=g_cond_wait(GST_BASE_SINK_GET_PREROLL_COND(obj),GST_BASE_SINK_GET_PREROLL_LOCK(obj));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PREROLL_WAIT_UNTIL(obj,end_time : longint) : longint;
begin
  GST_BASE_SINK_PREROLL_WAIT_UNTIL:=g_cond_wait_until(GST_BASE_SINK_GET_PREROLL_COND(obj),GST_BASE_SINK_GET_PREROLL_LOCK(obj),end_time);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PREROLL_SIGNAL(obj : longint) : longint;
begin
  GST_BASE_SINK_PREROLL_SIGNAL:=g_cond_signal(GST_BASE_SINK_GET_PREROLL_COND(obj));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SINK_PREROLL_BROADCAST(obj : longint) : longint;
begin
  GST_BASE_SINK_PREROLL_BROADCAST:=g_cond_broadcast(GST_BASE_SINK_GET_PREROLL_COND(obj));
end;


end.
