
unit gstaggregator;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstaggregator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstaggregator.h
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
PGstAggregator  = ^GstAggregator;
PGstAggregatorClass  = ^GstAggregatorClass;
PGstAggregatorPad  = ^GstAggregatorPad;
PGstAggregatorPadClass  = ^GstAggregatorPadClass;
PGstAggregatorPadPrivate  = ^GstAggregatorPadPrivate;
PGstAggregatorPrivate  = ^GstAggregatorPrivate;
PGstAggregatorStartTimeSelection  = ^GstAggregatorStartTimeSelection;
PGstAllocationParams  = ^GstAllocationParams;
PGstAllocator  = ^GstAllocator;
PGstBuffer  = ^GstBuffer;
PGstBufferList  = ^GstBufferList;
PGstBufferPool  = ^GstBufferPool;
PGstCaps  = ^GstCaps;
PGstEvent  = ^GstEvent;
PGstPad  = ^GstPad;
PGstPadTemplate  = ^GstPadTemplate;
PGstQuery  = ^GstQuery;
PGstSample  = ^GstSample;
PGstSegment  = ^GstSegment;
PGstStructure  = ^GstStructure;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer aggregator base class
 * Copyright (C) 2014 Mathieu Duponchelle <mathieu.duponchelle@oencreed.com>
 * Copyright (C) 2014 Thibault Saunier <tsaunier@gnome.org>
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
{$ifndef __GST_AGGREGATOR_H__}
{$define __GST_AGGREGATOR_H__}
{$include <gst/gst.h>}
{$include <gst/base/base-prelude.h>}
{*************************
 * GstAggregator Structs  *
 ************************ }
type
{***********************
 * GstAggregatorPad API *
 ********************** }

{ was #define dname def_expr }
function GST_TYPE_AGGREGATOR_PAD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AGGREGATOR_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AGGREGATOR_PAD_CAST(obj : longint) : PGstAggregatorPad;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AGGREGATOR_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AGGREGATOR_PAD_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AGGREGATOR_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AGGREGATOR_PAD_CLASS(klass : longint) : longint;

{***************************
 * GstAggregatorPad Structs *
 ************************** }
type
{*
 * GstAggregatorPad:
 * @segment: last segment received.
 *
 * The implementation the GstPad to use with #GstAggregator
 *
 * Since: 1.14
  }
{< public > }
{ Protected by the OBJECT_LOCK  }
{ < private >  }
  PGstAggregatorPad = ^TGstAggregatorPad;
  TGstAggregatorPad = record
      parent : TGstPad;
      segment : TGstSegment;
      priv : PGstAggregatorPadPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstAggregatorPadClass:
 * @flush:       Optional
 *               Called when the pad has received a flush stop, this is the place
 *               to flush any information specific to the pad, it allows for individual
 *               pads to be flushed while others might not be.
 * @skip_buffer: Optional
 *               Called before input buffers are queued in the pad, return %TRUE
 *               if the buffer should be skipped.
 *
 * Since: 1.14
  }
{< private > }
  PGstAggregatorPadClass = ^TGstAggregatorPadClass;
  TGstAggregatorPadClass = record
      parent_class : TGstPadClass;
      flush : function (aggpad:PGstAggregatorPad; aggregator:PGstAggregator):TGstFlowReturn;cdecl;
      skip_buffer : function (aggpad:PGstAggregatorPad; aggregator:PGstAggregator; buffer:PGstBuffer):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;


function gst_aggregator_pad_get_type:TGType;cdecl;external;
{***************************
 * GstAggregatorPad methods *
 ************************** }
function gst_aggregator_pad_pop_buffer(pad:PGstAggregatorPad):PGstBuffer;cdecl;external;
function gst_aggregator_pad_peek_buffer(pad:PGstAggregatorPad):PGstBuffer;cdecl;external;
function gst_aggregator_pad_drop_buffer(pad:PGstAggregatorPad):Tgboolean;cdecl;external;
function gst_aggregator_pad_has_buffer(pad:PGstAggregatorPad):Tgboolean;cdecl;external;
function gst_aggregator_pad_is_eos(pad:PGstAggregatorPad):Tgboolean;cdecl;external;
function gst_aggregator_pad_is_inactive(pad:PGstAggregatorPad):Tgboolean;cdecl;external;
{********************
 * GstAggregator API *
 ******************* }
{ was #define dname def_expr }
function GST_TYPE_AGGREGATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AGGREGATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AGGREGATOR_CAST(obj : longint) : PGstAggregator;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AGGREGATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AGGREGATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AGGREGATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AGGREGATOR_CLASS(klass : longint) : longint;

const
  GST_AGGREGATOR_FLOW_NEED_DATA = GST_FLOW_CUSTOM_ERROR;  
{*
 * GstAggregator:
 * @srcpad: the aggregator's source pad
 *
 * Aggregator base class object structure.
 *
 * Since: 1.14
  }
{< public > }
{< private > }
type
  PGstAggregator = ^TGstAggregator;
  TGstAggregator = record
      parent : TGstElement;
      srcpad : PGstPad;
      priv : PGstAggregatorPrivate;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
 * GstAggregatorClass:
 * @flush:          Optional.
 *                  Called after a successful flushing seek, once all the flush
 *                  stops have been received. Flush pad-specific data in
 *                  #GstAggregatorPad->flush.
 * @clip:           Optional.
 *                  Called when a buffer is received on a sink pad, the task of
 *                  clipping it and translating it to the current segment falls
 *                  on the subclass. The function should use the segment of data
 *                  and the negotiated media type on the pad to perform
 *                  clipping of input buffer. This function takes ownership of
 *                  buf and should output a buffer or return NULL in
 *                  if the buffer should be dropped.
 * @finish_buffer:  Optional.
 *                  Called when a subclass calls gst_aggregator_finish_buffer()
 *                  from their aggregate function to push out a buffer.
 *                  Subclasses can override this to modify or decorate buffers
 *                  before they get pushed out. This function takes ownership
 *                  of the buffer passed. Subclasses that override this method
 *                  should always chain up to the parent class virtual method.
 * @sink_event:     Optional.
 *                  Called when an event is received on a sink pad, the subclass
 *                  should always chain up.
 * @sink_query:     Optional.
 *                  Called when a query is received on a sink pad, the subclass
 *                  should always chain up.
 * @src_event:      Optional.
 *                  Called when an event is received on the src pad, the subclass
 *                  should always chain up.
 * @src_query:      Optional.
 *                  Called when a query is received on the src pad, the subclass
 *                  should always chain up.
 * @src_activate:   Optional.
 *                  Called when the src pad is activated, it will start/stop its
 *                  pad task right after that call.
 * @aggregate:      Mandatory.
 *                  Called when buffers are queued on all sinkpads. Classes
 *                  should iterate the GstElement->sinkpads and peek or steal
 *                  buffers from the #GstAggregatorPads. If the subclass returns
 *                  GST_FLOW_EOS, sending of the eos event will be taken care
 *                  of. Once / if a buffer has been constructed from the
 *                  aggregated buffers, the subclass should call _finish_buffer.
 * @stop:           Optional.
 *                  Called when the element goes from PAUSED to READY.
 *                  The subclass should free all resources and reset its state.
 * @start:          Optional.
 *                  Called when the element goes from READY to PAUSED.
 *                  The subclass should get ready to process
 *                  aggregated buffers.
 * @get_next_time:  Optional.
 *                  Called when the element needs to know the running time of the next
 *                  rendered buffer for live pipelines. This causes deadline
 *                  based aggregation to occur. Defaults to returning
 *                  GST_CLOCK_TIME_NONE causing the element to wait for buffers
 *                  on all sink pads before aggregating.
 * @create_new_pad: Optional.
 *                  Called when a new pad needs to be created. Allows subclass that
 *                  don't have a single sink pad template to provide a pad based
 *                  on the provided information.
 * @update_src_caps: Lets subclasses update the #GstCaps representing
 *                   the src pad caps before usage.  The result should end up
 *                   in @ret. Return %GST_AGGREGATOR_FLOW_NEED_DATA to indicate that the
 *                   element needs more information (caps, a buffer, etc) to
 *                   choose the correct caps. Should return ANY caps if the
 *                   stream has not caps at all.
 * @fixate_src_caps: Optional.
 *                   Fixate and return the src pad caps provided.  The function takes
 *                   ownership of @caps and returns a fixated version of
 *                   @caps. @caps is not guaranteed to be writable.
 * @negotiated_src_caps: Optional.
 *                       Notifies subclasses what caps format has been negotiated
 * @decide_allocation: Optional.
 *                     Allows the subclass to influence the allocation choices.
 *                     Setup the allocation parameters for allocating output
 *                     buffers. The passed in query contains the result of the
 *                     downstream allocation query.
 * @propose_allocation: Optional.
 *                     Allows the subclass to handle the allocation query from upstream.
 * @negotiate: Optional.
 *             Negotiate the caps with the peer (Since: 1.18).
 * @sink_event_pre_queue: Optional.
 *                        Called when an event is received on a sink pad before queueing up
 *                        serialized events. The subclass should always chain up (Since: 1.18).
 * @sink_query_pre_queue: Optional.
 *                        Called when a query is received on a sink pad before queueing up
 *                        serialized queries. The subclass should always chain up (Since: 1.18).
 *
 * The aggregator base class will handle in a thread-safe way all manners of
 * concurrent flushes, seeks, pad additions and removals, leaving to the
 * subclass the responsibility of clipping buffers, and aggregating buffers in
 * the way the implementor sees fit.
 *
 * It will also take care of event ordering (stream-start, segment, eos).
 *
 * Basically, a simple implementation will override @aggregate, and call
 * _finish_buffer from inside that function.
 *
 * Since: 1.14
  }
{*
   * GstAggregatorClass::clip:
   * @aggregator: the #GstAggregator
   * @aggregator_pad: a #GstAggregatorPad
   * @buf: (transfer full): a #GstBuffer
   *
   * Called when a buffer is received on a sink pad, the task of
   * clipping it and translating it to the current segment falls
   * on the subclass. The function should use the segment of data
   * and the negotiated media type on the pad to perform
   * clipping of input buffer. This function takes ownership of
   * buf and should output a buffer or return NULL in
   * if the buffer should be dropped.
   *
   * Returns: (transfer full) (nullable): a #GstBuffer.
    }
{*
   * GstAggregatorClass::finish_buffer:
   * @aggregator: the #GstAggregator
   * @buffer: (transfer full): a #GstBuffer
    }
{ sinkpads virtual methods  }
{*
   * GstAggregatorClass::sink_event:
   * @aggregator: the #GstAggregator
   * @aggregator_pad: a #GstAggregatorPad
   * @event: (transfer full): a #GstEvent
   *
   * Called when an event is received on a sink pad, the subclass
   * should always chain up.
    }
{ srcpad virtual methods  }
{*
   * GstAggregatorClass::src_event:
   * @aggregator: the #GstAggregator
   * @event: (transfer full): a #GstEvent
   *
   * Called when an event is received on the src pad, the subclass
   * should always chain up.
    }
{*
   * GstAggregatorClass::create_new_pad:
   * @self: the #GstAggregator
   * @templ: the pad template to use
   * @req_name: (nullable): requested pad name
   * @caps: (nullable): caps for the pad
   *
   * Called when a new pad needs to be created. Allows subclass that
   * don't have a single sink pad template to provide a pad based
   * on the provided information.
   *
   * Returns: (transfer floating): a new #GstAggregatorPad.
    }
(* Const before type ignored *)
(* Const before type ignored *)
{*
   * GstAggregatorClass::update_src_caps:
   * @self: the #GstAggregator
   * @caps: the new source pad #GstCaps
   * @ret: (out) (nullable):
    }
{*
   * GstAggregatorClass::fixate_src_caps:
   * @self: the #GstAggregator
   * @caps: (transfer full): a #GstCaps to fixate
   *
   * Fixate and return the src pad caps provided. The function takes
   * ownership of @caps and returns a fixated version of
   * @caps. @caps is not guaranteed to be writable.
   *
   * Returns: (transfer full): the fixated caps #GstCaps.
    }
{*
   * GstAggregatorClass::sink_event_pre_queue:
   * @aggregator: the #GstAggregator
   * @aggregator_pad: a #GstAggregatorPad
   * @event: (transfer full): a #GstEvent
   *
   * Called when an event is received on a sink pad before queueing up
   * serialized events. The subclass should always chain up (Since: 1.18).
    }
{*
   * GstAggregatorClass::finish_buffer_list:
   * @aggregator: the #GstAggregator
   * @bufferlist: (transfer full): a #GstBufferList
   *
   * Optional. Equivalent of #GstAggregatorClass::finish_buffer for
   * buffer lists.
   *
   * Since: 1.18
    }
{*
   * GstAggregatorClass::peek_next_sample:
   * @aggregator: the #GstAggregator
   * @aggregator_pad: a #GstAggregatorPad
   *
   * Returns: (transfer full) (nullable): the #GstSample.
   *
   * See gst_aggregator_peek_next_sample().
   *
   * Since: 1.18
    }
{< private > }
  PGstAggregatorClass = ^TGstAggregatorClass;
  TGstAggregatorClass = record
      parent_class : TGstElementClass;
      flush : function (aggregator:PGstAggregator):TGstFlowReturn;cdecl;
      clip : function (aggregator:PGstAggregator; aggregator_pad:PGstAggregatorPad; buf:PGstBuffer):PGstBuffer;cdecl;
      finish_buffer : function (aggregator:PGstAggregator; buffer:PGstBuffer):TGstFlowReturn;cdecl;
      sink_event : function (aggregator:PGstAggregator; aggregator_pad:PGstAggregatorPad; event:PGstEvent):Tgboolean;cdecl;
      sink_query : function (aggregator:PGstAggregator; aggregator_pad:PGstAggregatorPad; query:PGstQuery):Tgboolean;cdecl;
      src_event : function (aggregator:PGstAggregator; event:PGstEvent):Tgboolean;cdecl;
      src_query : function (aggregator:PGstAggregator; query:PGstQuery):Tgboolean;cdecl;
      src_activate : function (aggregator:PGstAggregator; mode:TGstPadMode; active:Tgboolean):Tgboolean;cdecl;
      aggregate : function (aggregator:PGstAggregator; timeout:Tgboolean):TGstFlowReturn;cdecl;
      stop : function (aggregator:PGstAggregator):Tgboolean;cdecl;
      start : function (aggregator:PGstAggregator):Tgboolean;cdecl;
      get_next_time : function (aggregator:PGstAggregator):TGstClockTime;cdecl;
      create_new_pad : function (self:PGstAggregator; templ:PGstPadTemplate; req_name:Pgchar; caps:PGstCaps):PGstAggregatorPad;cdecl;
      update_src_caps : function (self:PGstAggregator; caps:PGstCaps; ret:PPGstCaps):TGstFlowReturn;cdecl;
      fixate_src_caps : function (self:PGstAggregator; caps:PGstCaps):PGstCaps;cdecl;
      negotiated_src_caps : function (self:PGstAggregator; caps:PGstCaps):Tgboolean;cdecl;
      decide_allocation : function (self:PGstAggregator; query:PGstQuery):Tgboolean;cdecl;
      propose_allocation : function (self:PGstAggregator; pad:PGstAggregatorPad; decide_query:PGstQuery; query:PGstQuery):Tgboolean;cdecl;
      negotiate : function (self:PGstAggregator):Tgboolean;cdecl;
      sink_event_pre_queue : function (aggregator:PGstAggregator; aggregator_pad:PGstAggregatorPad; event:PGstEvent):TGstFlowReturn;cdecl;
      sink_query_pre_queue : function (aggregator:PGstAggregator; aggregator_pad:PGstAggregatorPad; query:PGstQuery):Tgboolean;cdecl;
      finish_buffer_list : function (aggregator:PGstAggregator; bufferlist:PGstBufferList):TGstFlowReturn;cdecl;
      peek_next_sample : function (aggregator:PGstAggregator; aggregator_pad:PGstAggregatorPad):PGstSample;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE-5)-1] of Tgpointer;
    end;

{***********************************
 * GstAggregator convenience macros *
 ********************************** }
{*
 * GST_AGGREGATOR_SRC_PAD:
 * @agg: a #GstAggregator
 *
 * Convenience macro to access the source pad of #GstAggregator
 *
 * Since: 1.6
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_AGGREGATOR_SRC_PAD(agg : longint) : longint;

{************************
 * GstAggregator methods *
 *********************** }
function gst_aggregator_finish_buffer(aggregator:PGstAggregator; buffer:PGstBuffer):TGstFlowReturn;cdecl;external;
function gst_aggregator_finish_buffer_list(aggregator:PGstAggregator; bufferlist:PGstBufferList):TGstFlowReturn;cdecl;external;
function gst_aggregator_push_src_event(aggregator:PGstAggregator; event:PGstEvent):Tgboolean;cdecl;external;
procedure gst_aggregator_set_src_caps(self:PGstAggregator; caps:PGstCaps);cdecl;external;
function gst_aggregator_negotiate(self:PGstAggregator):Tgboolean;cdecl;external;
procedure gst_aggregator_set_latency(self:PGstAggregator; min_latency:TGstClockTime; max_latency:TGstClockTime);cdecl;external;
function gst_aggregator_get_type:TGType;cdecl;external;
function gst_aggregator_get_latency(self:PGstAggregator):TGstClockTime;cdecl;external;
function gst_aggregator_get_buffer_pool(self:PGstAggregator):PGstBufferPool;cdecl;external;
procedure gst_aggregator_get_allocator(self:PGstAggregator; allocator:PPGstAllocator; params:PGstAllocationParams);cdecl;external;
function gst_aggregator_simple_get_next_time(self:PGstAggregator):TGstClockTime;cdecl;external;
(* Const before type ignored *)
procedure gst_aggregator_update_segment(self:PGstAggregator; segment:PGstSegment);cdecl;external;
function gst_aggregator_peek_next_sample(self:PGstAggregator; pad:PGstAggregatorPad):PGstSample;cdecl;external;
procedure gst_aggregator_selected_samples(self:PGstAggregator; pts:TGstClockTime; dts:TGstClockTime; duration:TGstClockTime; info:PGstStructure);cdecl;external;
procedure gst_aggregator_set_ignore_inactive_pads(self:PGstAggregator; ignore:Tgboolean);cdecl;external;
function gst_aggregator_get_ignore_inactive_pads(self:PGstAggregator):Tgboolean;cdecl;external;
function gst_aggregator_get_force_live(self:PGstAggregator):Tgboolean;cdecl;external;
procedure gst_aggregator_set_force_live(self:PGstAggregator; force_live:Tgboolean);cdecl;external;
{*
 * GstAggregatorStartTimeSelection:
 * @GST_AGGREGATOR_START_TIME_SELECTION_ZERO: Start at running time 0.
 * @GST_AGGREGATOR_START_TIME_SELECTION_FIRST: Start at the running time of
 * the first buffer that is received.
 * @GST_AGGREGATOR_START_TIME_SELECTION_SET: Start at the running time
 * selected by the `start-time` property.
 * @GST_AGGREGATOR_START_TIME_SELECTION_NOW: Start at the current running time
 * when reaching %GST_STATE_PLAYING.
 *
 * Since: 1.18
  }
{*
   * GST_AGGREGATOR_START_TIME_SELECTION_NOW:
   *
   * Start at the current running time when reaching %GST_STATE_PLAYING.
   *
   * Since: 1.28
    }
type
  PGstAggregatorStartTimeSelection = ^TGstAggregatorStartTimeSelection;
  TGstAggregatorStartTimeSelection =  Longint;
  Const
    GST_AGGREGATOR_START_TIME_SELECTION_ZERO = 0;
    GST_AGGREGATOR_START_TIME_SELECTION_FIRST = 1;
    GST_AGGREGATOR_START_TIME_SELECTION_SET = 2;
    GST_AGGREGATOR_START_TIME_SELECTION_NOW = 3;
;

function gst_aggregator_start_time_selection_get_type:TGType;cdecl;external;
{////////G_DEFINE_AUTOPTR_CLEANUP_FUNC     (GstAggregator, gst_object_unref) }
{////////G_DEFINE_AUTOPTR_CLEANUP_FUNC     (GstAggregatorPad, gst_object_unref) }
{$endif}
{ __GST_AGGREGATOR_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_AGGREGATOR_PAD : longint; { return type might be wrong }
  begin
    GST_TYPE_AGGREGATOR_PAD:=gst_aggregator_pad_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AGGREGATOR_PAD(obj : longint) : longint;
begin
  GST_AGGREGATOR_PAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AGGREGATOR_PAD,GstAggregatorPad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AGGREGATOR_PAD_CAST(obj : longint) : PGstAggregatorPad;
begin
  GST_AGGREGATOR_PAD_CAST:=PGstAggregatorPad(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AGGREGATOR_PAD_CLASS(klass : longint) : longint;
begin
  GST_AGGREGATOR_PAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AGGREGATOR_PAD,GstAggregatorPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AGGREGATOR_PAD_GET_CLASS(obj : longint) : longint;
begin
  GST_AGGREGATOR_PAD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AGGREGATOR_PAD,GstAggregatorPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AGGREGATOR_PAD(obj : longint) : longint;
begin
  GST_IS_AGGREGATOR_PAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AGGREGATOR_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AGGREGATOR_PAD_CLASS(klass : longint) : longint;
begin
  GST_IS_AGGREGATOR_PAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AGGREGATOR_PAD);
end;

{ was #define dname def_expr }
function GST_TYPE_AGGREGATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_AGGREGATOR:=gst_aggregator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AGGREGATOR(obj : longint) : longint;
begin
  GST_AGGREGATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AGGREGATOR,GstAggregator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AGGREGATOR_CAST(obj : longint) : PGstAggregator;
begin
  GST_AGGREGATOR_CAST:=PGstAggregator(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AGGREGATOR_CLASS(klass : longint) : longint;
begin
  GST_AGGREGATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AGGREGATOR,GstAggregatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AGGREGATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_AGGREGATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AGGREGATOR,GstAggregatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AGGREGATOR(obj : longint) : longint;
begin
  GST_IS_AGGREGATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AGGREGATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AGGREGATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_AGGREGATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AGGREGATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AGGREGATOR_SRC_PAD(agg : longint) : longint;
begin
  GST_AGGREGATOR_SRC_PAD:=(PGstAggregator(agg))^.srcpad;
end;


end.
