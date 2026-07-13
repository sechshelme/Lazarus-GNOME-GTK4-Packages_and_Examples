
unit gstbasesrc;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstbasesrc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstbasesrc.h
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
PGstAllocationParams  = ^GstAllocationParams;
PGstAllocator  = ^GstAllocator;
PGstBaseSrc  = ^GstBaseSrc;
PGstBaseSrcClass  = ^GstBaseSrcClass;
PGstBaseSrcFlags  = ^GstBaseSrcFlags;
PGstBaseSrcPrivate  = ^GstBaseSrcPrivate;
PGstBuffer  = ^GstBuffer;
PGstBufferList  = ^GstBufferList;
PGstBufferPool  = ^GstBufferPool;
PGstCaps  = ^GstCaps;
PGstClockTime  = ^GstClockTime;
PGstEvent  = ^GstEvent;
PGstPad  = ^GstPad;
PGstQuery  = ^GstQuery;
PGstSegment  = ^GstSegment;
Pguint64  = ^guint64;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *                    2005 Wim Taymans <wim@fluendo.com>
 *
 * gstbasesrc.h:
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
{$ifndef __GST_BASE_SRC_H__}
{$define __GST_BASE_SRC_H__}
{$include <gst/gst.h>}
{$include <gst/base/base-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_BASE_SRC : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SRC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SRC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SRC_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_SRC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_SRC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BASE_SRC_CAST(obj : longint) : PGstBaseSrc;

{*
 * GstBaseSrcFlags:
 * @GST_BASE_SRC_FLAG_STARTING: has source is starting
 * @GST_BASE_SRC_FLAG_STARTED: has source been started
 * @GST_BASE_SRC_FLAG_LAST: offset to define more flags
 *
 * The #GstElement flags that a basesrc element may have.
  }
{ padding  }
type
  PGstBaseSrcFlags = ^TGstBaseSrcFlags;
  TGstBaseSrcFlags =  Longint;
  Const
    GST_BASE_SRC_FLAG_STARTING = GST_ELEMENT_FLAG_LAST shl 0;
    GST_BASE_SRC_FLAG_STARTED = GST_ELEMENT_FLAG_LAST shl 1;
    GST_BASE_SRC_FLAG_LAST = GST_ELEMENT_FLAG_LAST shl 6;
;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_BASE_SRC_IS_STARTING(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SRC_IS_STARTED(obj : longint) : longint;

type
{*
 * GST_BASE_SRC_PAD:
 * @obj: base source instance
 *
 * Gives the pointer to the #GstPad object of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_BASE_SRC_PAD(obj : longint) : longint;

{*
 * GstBaseSrc:
 *
 * The opaque #GstBaseSrc data structure.
  }
{< protected > }
{ available to subclass implementations  }
{ MT-protected (with LIVE_LOCK)  }
{ MT-protected (with LOCK)  }
{ size of buffers when operating push based  }
{ some scheduling properties  }
{ for syncing  }
{ MT-protected (with STREAM_LOCK *and* OBJECT_LOCK)  }
{ MT-protected (with STREAM_LOCK)  }
{$ifndef GST_REMOVE_DEPRECATED}
{ unused  }
{$endif}
{< private > }
type
  PGstBaseSrc = ^TGstBaseSrc;
  TGstBaseSrc = record
      element : TGstElement;
      srcpad : PGstPad;
      live_lock : TGMutex;
      live_cond : TGCond;
      is_live : Tgboolean;
      live_running : Tgboolean;
      blocksize : Tguint;
      can_activate_push : Tgboolean;
      random_access : Tgboolean;
      clock_id : TGstClockID;
      segment : TGstSegment;
      need_newsegment : Tgboolean;
      num_buffers : Tgint;
      num_buffers_left : Tgint;
      typefind : Tgboolean;
      running : Tgboolean;
      pending_seek : PGstEvent;
      priv : PGstBaseSrcPrivate;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
 * GstBaseSrcClass:
 * @parent_class: Element parent class
 * @get_caps: Called to get the caps to report
 * @negotiate: Negotiated the caps with the peer.
 * @fixate: Called during negotiation if caps need fixating. Implement instead of
 *   setting a fixate function on the source pad.
 * @set_caps: Notify subclass of changed output caps
 * @decide_allocation: configure the allocation query
 * @start: Start processing. Subclasses should open resources and prepare
 *    to produce data. Implementation should call gst_base_src_start_complete()
 *    when the operation completes, either from the current thread or any other
 *    thread that finishes the start operation asynchronously.
 * @stop: Stop processing. Subclasses should use this to close resources.
 * @get_times: Given a buffer, return the start and stop time when it
 *    should be pushed out. The base class will sync on the clock using
 *    these times.
 * @get_size: Return the total size of the resource, in the format set by
 *     gst_base_src_set_format().
 * @is_seekable: Check if the source can seek
 * @prepare_seek_segment: Prepare the #GstSegment that will be passed to the
 *   #GstBaseSrcClass::do_seek vmethod for executing a seek
 *   request. Sub-classes should override this if they support seeking in
 *   formats other than the configured native format. By default, it tries to
 *   convert the seek arguments to the configured native format and prepare a
 *   segment in that format.
 * @do_seek: Perform seeking on the resource to the indicated segment.
 * @unlock: Unlock any pending access to the resource. Subclasses should unblock
 *    any blocked function ASAP. In particular, any `create()` function in
 *    progress should be unblocked and should return GST_FLOW_FLUSHING. Any
 *    future #GstBaseSrcClass::create function call should also return
 *    GST_FLOW_FLUSHING until the #GstBaseSrcClass::unlock_stop function has
 *    been called.
 * @unlock_stop: Clear the previous unlock request. Subclasses should clear any
 *    state they set during #GstBaseSrcClass::unlock, such as clearing command
 *    queues.
 * @query: Handle a requested query.
 * @event: Override this to implement custom event handling.
 * @create: Ask the subclass to create a buffer with offset and size.  When the
 *   subclass returns GST_FLOW_OK, it MUST return a buffer of the requested size
 *   unless fewer bytes are available because an EOS condition is near. No
 *   buffer should be returned when the return value is different from
 *   GST_FLOW_OK. A return value of GST_FLOW_EOS signifies that the end of
 *   stream is reached. The default implementation will call
 *   #GstBaseSrcClass::alloc and then call #GstBaseSrcClass::fill.
 * @alloc: Ask the subclass to allocate a buffer with for offset and size. The
 *   default implementation will create a new buffer from the negotiated allocator.
 * @fill: Ask the subclass to fill the buffer with data for offset and size. The
 *   passed buffer is guaranteed to hold the requested amount of bytes.
 *
 * Subclasses can override any of the available virtual methods or not, as
 * needed. At the minimum, the @create method should be overridden to produce
 * buffers.
  }
{< public > }
{ virtual methods for subclasses  }
{*
   * GstBaseSrcClass::get_caps:
   * @filter: (in) (nullable):
   *
   * Called to get the caps to report.
    }
{ decide on caps  }
{ called if, in negotiation, caps need fixating  }
{*
   * GstBaseSrcClass::fixate:
   * @caps: (transfer full):
   *
   * Called if, in negotiation, caps need fixating.
   *
   * Returns: (transfer full): the fixated caps
    }
{ notify the subclass of new caps  }
{ setup allocation query  }
{ start and stop processing, ideal for opening/closing the resource  }
{*
   * GstBaseSrcClass::get_times:
   * @start: (out):
   * @end: (out):
   *
   * Given @buffer, return @start and @end time when it should be pushed
   * out. The base class will sync on the clock using these times.
    }
{*
   * GstBaseSrcClass::get_size:
   * @size: (out):
   *
   * Get the total size of the resource in the format set by
   * gst_base_src_set_format().
   *
   * Returns: %TRUE if the size is available and has been set.
    }
{ check if the resource is seekable  }
{ Prepare the segment on which to perform do_seek(), converting to the
   * current basesrc format.  }
{ notify subclasses of a seek  }
{ unlock any pending access to the resource. subclasses should unlock
   * any function ASAP.  }
{ Clear any pending unlock request, as we succeeded in unlocking  }
{ notify subclasses of a query  }
{ notify subclasses of an event  }
{*
   * GstBaseSrcClass::create:
   * @buf: (inout) (nullable):
   *
   * Ask the subclass to create a buffer with @offset and @size, the default
   * implementation will call alloc if no allocated @buf is provided and then call fill.
    }
{*
   * GstBaseSrcClass::alloc:
   * @buf: (out) (nullable):
   *
   * Ask the subclass to allocate an output buffer with @offset and @size, the default
   * implementation will use the negotiated allocator.
    }
{ ask the subclass to fill the buffer with data from offset and size  }
{< private > }
  PGstBaseSrcClass = ^TGstBaseSrcClass;
  TGstBaseSrcClass = record
      parent_class : TGstElementClass;
      get_caps : function (src:PGstBaseSrc; filter:PGstCaps):PGstCaps;cdecl;
      negotiate : function (src:PGstBaseSrc):Tgboolean;cdecl;
      fixate : function (src:PGstBaseSrc; caps:PGstCaps):PGstCaps;cdecl;
      set_caps : function (src:PGstBaseSrc; caps:PGstCaps):Tgboolean;cdecl;
      decide_allocation : function (src:PGstBaseSrc; query:PGstQuery):Tgboolean;cdecl;
      start : function (src:PGstBaseSrc):Tgboolean;cdecl;
      stop : function (src:PGstBaseSrc):Tgboolean;cdecl;
      get_times : procedure (src:PGstBaseSrc; buffer:PGstBuffer; start:PGstClockTime; end:PGstClockTime);cdecl;
      get_size : function (src:PGstBaseSrc; size:Pguint64):Tgboolean;cdecl;
      is_seekable : function (src:PGstBaseSrc):Tgboolean;cdecl;
      prepare_seek_segment : function (src:PGstBaseSrc; seek:PGstEvent; segment:PGstSegment):Tgboolean;cdecl;
      do_seek : function (src:PGstBaseSrc; segment:PGstSegment):Tgboolean;cdecl;
      unlock : function (src:PGstBaseSrc):Tgboolean;cdecl;
      unlock_stop : function (src:PGstBaseSrc):Tgboolean;cdecl;
      query : function (src:PGstBaseSrc; query:PGstQuery):Tgboolean;cdecl;
      event : function (src:PGstBaseSrc; event:PGstEvent):Tgboolean;cdecl;
      create : function (src:PGstBaseSrc; offset:Tguint64; size:Tguint; buf:PPGstBuffer):TGstFlowReturn;cdecl;
      alloc : function (src:PGstBaseSrc; offset:Tguint64; size:Tguint; buf:PPGstBuffer):TGstFlowReturn;cdecl;
      fill : function (src:PGstBaseSrc; offset:Tguint64; size:Tguint; buf:PGstBuffer):TGstFlowReturn;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;


function gst_base_src_get_type:TGType;cdecl;external;
function gst_base_src_wait_playing(src:PGstBaseSrc):TGstFlowReturn;cdecl;external;
procedure gst_base_src_set_live(src:PGstBaseSrc; live:Tgboolean);cdecl;external;
function gst_base_src_is_live(src:PGstBaseSrc):Tgboolean;cdecl;external;
procedure gst_base_src_set_format(src:PGstBaseSrc; format:TGstFormat);cdecl;external;
procedure gst_base_src_set_dynamic_size(src:PGstBaseSrc; dynamic:Tgboolean);cdecl;external;
procedure gst_base_src_set_automatic_eos(src:PGstBaseSrc; automatic_eos:Tgboolean);cdecl;external;
procedure gst_base_src_set_async(src:PGstBaseSrc; async:Tgboolean);cdecl;external;
function gst_base_src_is_async(src:PGstBaseSrc):Tgboolean;cdecl;external;
function gst_base_src_negotiate(src:PGstBaseSrc):Tgboolean;cdecl;external;
procedure gst_base_src_start_complete(basesrc:PGstBaseSrc; ret:TGstFlowReturn);cdecl;external;
function gst_base_src_start_wait(basesrc:PGstBaseSrc):TGstFlowReturn;cdecl;external;
function gst_base_src_query_latency(src:PGstBaseSrc; live:Pgboolean; min_latency:PGstClockTime; max_latency:PGstClockTime):Tgboolean;cdecl;external;
procedure gst_base_src_set_blocksize(src:PGstBaseSrc; blocksize:Tguint);cdecl;external;
function gst_base_src_get_blocksize(src:PGstBaseSrc):Tguint;cdecl;external;
procedure gst_base_src_set_do_timestamp(src:PGstBaseSrc; timestamp:Tgboolean);cdecl;external;
function gst_base_src_get_do_timestamp(src:PGstBaseSrc):Tgboolean;cdecl;external;
function gst_base_src_new_seamless_segment(src:PGstBaseSrc; start:Tgint64; stop:Tgint64; time:Tgint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_base_src_new_segment(src:PGstBaseSrc; segment:PGstSegment):Tgboolean;cdecl;external;
function gst_base_src_set_caps(src:PGstBaseSrc; caps:PGstCaps):Tgboolean;cdecl;external;
function gst_base_src_get_buffer_pool(src:PGstBaseSrc):PGstBufferPool;cdecl;external;
procedure gst_base_src_get_allocator(src:PGstBaseSrc; allocator:PPGstAllocator; params:PGstAllocationParams);cdecl;external;
procedure gst_base_src_submit_buffer_list(src:PGstBaseSrc; buffer_list:PGstBufferList);cdecl;external;
(* Const before type ignored *)
function gst_base_src_push_segment(src:PGstBaseSrc; segment:PGstSegment):Tgboolean;cdecl;external;
{////////G_DEFINE_AUTOPTR_CLEANUP_FUNC     (GstBaseSrc, gst_object_unref) }
{$endif}
{ __GST_BASE_SRC_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_BASE_SRC : longint; { return type might be wrong }
  begin
    GST_TYPE_BASE_SRC:=gst_base_src_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SRC(obj : longint) : longint;
begin
  GST_BASE_SRC:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_BASE_SRC,GstBaseSrc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SRC_CLASS(klass : longint) : longint;
begin
  GST_BASE_SRC_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_BASE_SRC,GstBaseSrcClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SRC_GET_CLASS(obj : longint) : longint;
begin
  GST_BASE_SRC_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_BASE_SRC,GstBaseSrcClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_SRC(obj : longint) : longint;
begin
  GST_IS_BASE_SRC:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_BASE_SRC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BASE_SRC_CLASS(klass : longint) : longint;
begin
  GST_IS_BASE_SRC_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_BASE_SRC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BASE_SRC_CAST(obj : longint) : PGstBaseSrc;
begin
  GST_BASE_SRC_CAST:=PGstBaseSrc(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SRC_IS_STARTING(obj : longint) : longint;
begin
  GST_BASE_SRC_IS_STARTING:=GST_OBJECT_FLAG_IS_SET(obj,GST_BASE_SRC_FLAG_STARTING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SRC_IS_STARTED(obj : longint) : longint;
begin
  GST_BASE_SRC_IS_STARTED:=GST_OBJECT_FLAG_IS_SET(obj,GST_BASE_SRC_FLAG_STARTED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BASE_SRC_PAD(obj : longint) : longint;
begin
  GST_BASE_SRC_PAD:=(GST_BASE_SRC_CAST(obj))^.srcpad;
end;


end.
