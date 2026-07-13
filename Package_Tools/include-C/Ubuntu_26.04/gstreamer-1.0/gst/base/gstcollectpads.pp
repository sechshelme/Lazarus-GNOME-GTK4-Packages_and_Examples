
unit gstcollectpads;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstcollectpads.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstcollectpads.h
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
PGSList  = ^GSList;
PGstBuffer  = ^GstBuffer;
PGstCollectData  = ^GstCollectData;
PGstCollectDataPrivate  = ^GstCollectDataPrivate;
PGstCollectPads  = ^GstCollectPads;
PGstCollectPadsClass  = ^GstCollectPadsClass;
PGstCollectPadsPrivate  = ^GstCollectPadsPrivate;
PGstCollectPadsStateFlags  = ^GstCollectPadsStateFlags;
PGstEvent  = ^GstEvent;
PGstPad  = ^GstPad;
PGstQuery  = ^GstQuery;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2005 Wim Taymans <wim@fluendo.com>
 * Copyright (C) 2008 Mark Nauwelaerts <mnauw@users.sourceforge.net>
 *
 * gstcollectpads.h:
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
{$ifndef __GST_COLLECT_PADS_H__}
{$define __GST_COLLECT_PADS_H__}
{$include <gst/gst.h>}
{$include <gst/base/base-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_COLLECT_PADS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_COLLECT_PADS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_COLLECT_PADS_CLASS(klass : longint) : longint;

type
{*
 * GstCollectDataDestroyNotify:
 * @data: the #GstCollectData that will be freed
 *
 * A function that will be called when the #GstCollectData will be freed.
 * It is passed the pointer to the structure and should free any custom
 * memory and resources allocated for it.
  }

  TGstCollectDataDestroyNotify = procedure (data:PGstCollectData);cdecl;
{*
 * GstCollectPadsStateFlags:
 * @GST_COLLECT_PADS_STATE_EOS:         Set if collectdata's pad is EOS.
 * @GST_COLLECT_PADS_STATE_FLUSHING:    Set if collectdata's pad is flushing.
 * @GST_COLLECT_PADS_STATE_NEW_SEGMENT: Set if collectdata's pad received a
 *                                      new_segment event.
 * @GST_COLLECT_PADS_STATE_WAITING:     Set if collectdata's pad must be waited
 *                                      for when collecting.
 * @GST_COLLECT_PADS_STATE_LOCKED:      Set collectdata's pad WAITING state must
 *                                      not be changed.
 * #GstCollectPadsStateFlags indicate private state of a collectdata('s pad).
  }

  PGstCollectPadsStateFlags = ^TGstCollectPadsStateFlags;
  TGstCollectPadsStateFlags =  Longint;
  Const
    GST_COLLECT_PADS_STATE_EOS = 1 shl 0;
    GST_COLLECT_PADS_STATE_FLUSHING = 1 shl 1;
    GST_COLLECT_PADS_STATE_NEW_SEGMENT = 1 shl 2;
    GST_COLLECT_PADS_STATE_WAITING = 1 shl 3;
    GST_COLLECT_PADS_STATE_LOCKED = 1 shl 4;
;
{*
 * GST_COLLECT_PADS_STATE:
 * @data: a #GstCollectData.
 *
 * A flags word containing #GstCollectPadsStateFlags flags set
 * on this collected pad.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_COLLECT_PADS_STATE(data : longint) : longint;

{*
 * GST_COLLECT_PADS_STATE_IS_SET:
 * @data: a #GstCollectData.
 * @flag: the #GstCollectPadsStateFlags to check.
 *
 * Gives the status of a specific flag on a collected pad.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_STATE_IS_SET(data,flag : longint) : longint;

{*
 * GST_COLLECT_PADS_STATE_SET:
 * @data: a #GstCollectData.
 * @flag: the #GstCollectPadsStateFlags to set.
 *
 * Sets a state flag on a collected pad.
  }
{xxxxxxxxx #define GST_COLLECT_PADS_STATE_SET(data,flag)        (GST_COLLECT_PADS_STATE (data) |= flag) }
{xxxxxx #define GST_COLLECT_PADS_STATE_UNSET(data,flag)      (GST_COLLECT_PADS_STATE (data) &= ~(flag)) }
{*
 * GST_COLLECT_PADS_DTS:
 * @data: A #GstCollectData.
 *
 * Returns the DTS that has been converted to running time when using
 * gst_collect_pads_clip_running_time(). Unlike the value saved into
 * the buffer, this value is of type gint64 and may be negative. This allow
 * properly handling streams with frame reordering where the first DTS may
 * be negative. If the initial DTS was not set, this value will be
 * set to %G_MININT64.
 *
 * Since: 1.6
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_DTS(data : longint) : longint;

{*
 * GST_COLLECT_PADS_DTS_IS_VALID:
 * @data: A #GstCollectData.
 *
 * Check if running DTS value store is valid.
 *
 * Since: 1.6
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_DTS_IS_VALID(data : longint) : longint;

{*
 * GstCollectData:
 * @collect: owner #GstCollectPads
 * @pad: #GstPad managed by this data
 * @buffer: currently queued buffer.
 * @pos: position in the buffer
 * @segment: last segment received.
 * @dts: the signed version of the DTS converted to running time. To access
 *       this member, use %GST_COLLECT_PADS_DTS macro. (Since: 1.6)
 *
 * Structure used by the collect_pads.
  }
{ with STREAM_LOCK of @collect  }
{< private > }
{ state: bitfield for easier extension;
   * eos, flushing, new_segment, waiting  }
{< public > }
{< private > }
type
  PGstCollectData = ^TGstCollectData;
  TGstCollectData = record
      collect : PGstCollectPads;
      pad : PGstPad;
      buffer : PGstBuffer;
      pos : Tguint;
      segment : TGstSegment;
      state : TGstCollectPadsStateFlags;
      priv : PGstCollectDataPrivate;
      ABI : record
          case longint of
            0 : ( abi : record
                dts : Tgint64;
              end );
            1 : ( _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer );
          end;
    end;

{*
 * GstCollectPadsFunction:
 * @pads: the #GstCollectPads that triggered the callback
 * @user_data: user data passed to gst_collect_pads_set_function()
 *
 * A function that will be called when all pads have received data.
 *
 * Returns: %GST_FLOW_OK for success
  }

  TGstCollectPadsFunction = function (pads:PGstCollectPads; user_data:Tgpointer):TGstFlowReturn;cdecl;
{*
 * GstCollectPadsBufferFunction:
 * @pads: the #GstCollectPads that triggered the callback
 * @data: the #GstCollectData of pad that has received the buffer
 * @buffer: (transfer full): the #GstBuffer
 * @user_data: user data passed to gst_collect_pads_set_buffer_function()
 *
 * A function that will be called when a (considered oldest) buffer can be muxed.
 * If all pads have reached EOS, this function is called with %NULL @buffer
 * and %NULL @data.
 *
 * Returns: %GST_FLOW_OK for success
  }

  TGstCollectPadsBufferFunction = function (pads:PGstCollectPads; data:PGstCollectData; buffer:PGstBuffer; user_data:Tgpointer):TGstFlowReturn;cdecl;
{*
 * GstCollectPadsCompareFunction:
 * @pads: the #GstCollectPads that is comparing the timestamps
 * @data1: the first #GstCollectData
 * @timestamp1: the first timestamp
 * @data2: the second #GstCollectData
 * @timestamp2: the second timestamp
 * @user_data: user data passed to gst_collect_pads_set_compare_function()
 *
 * A function for comparing two timestamps of buffers or newsegments collected on one pad.
 *
 * Returns: Integer less than zero when first timestamp is deemed older than the second one.
 *          Zero if the timestamps are deemed equally old.
 *          Integer greater than zero when second timestamp is deemed older than the first one.
  }

  TGstCollectPadsCompareFunction = function (pads:PGstCollectPads; data1:PGstCollectData; timestamp1:TGstClockTime; data2:PGstCollectData; timestamp2:TGstClockTime; 
               user_data:Tgpointer):Tgint;cdecl;
{*
 * GstCollectPadsEventFunction:
 * @pads: the #GstCollectPads that triggered the callback
 * @pad: the #GstPad that received an event
 * @event: the #GstEvent received
 * @user_data: user data passed to gst_collect_pads_set_event_function()
 *
 * A function that will be called while processing an event. It takes
 * ownership of the event and is responsible for chaining up (to
 * gst_collect_pads_event_default()) or dropping events (such typical cases
 * being handled by the default handler).
 *
 * Returns: %TRUE if the pad could handle the event
  }

  TGstCollectPadsEventFunction = function (pads:PGstCollectPads; pad:PGstCollectData; event:PGstEvent; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstCollectPadsQueryFunction:
 * @pads: the #GstCollectPads that triggered the callback
 * @pad: the #GstPad that received an event
 * @query: the #GstEvent received
 * @user_data: user data passed to gst_collect_pads_set_query_function()
 *
 * A function that will be called while processing a query. It takes
 * ownership of the query and is responsible for chaining up (to
 * events downstream (with gst_pad_event_default()).
 *
 * Returns: %TRUE if the pad could handle the event
  }

  TGstCollectPadsQueryFunction = function (pads:PGstCollectPads; pad:PGstCollectData; query:PGstQuery; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstCollectPadsClipFunction:
 * @pads: a #GstCollectPads
 * @data: a #GstCollectData
 * @inbuffer: (transfer full): the input #GstBuffer
 * @outbuffer: (out): the output #GstBuffer
 * @user_data: user data
 *
 * A function that will be called when @inbuffer is received on the pad managed
 * by @data in the collectpad object @pads.
 *
 * The function should use the segment of @data and the negotiated media type on
 * the pad to perform clipping of @inbuffer.
 *
 * This function takes ownership of @inbuffer and should output a buffer in
 * @outbuffer or return %NULL in @outbuffer if the buffer should be dropped.
 *
 * Returns: a #GstFlowReturn that corresponds to the result of clipping.
  }

  TGstCollectPadsClipFunction = function (pads:PGstCollectPads; data:PGstCollectData; inbuffer:PGstBuffer; outbuffer:PPGstBuffer; user_data:Tgpointer):TGstFlowReturn;cdecl;
{*
 * GstCollectPadsFlushFunction:
 * @pads: a #GstCollectPads
 * @user_data: user data
 *
 * A function that will be called while processing a flushing seek event.
 *
 * The function should flush any internal state of the element and the state of
 * all the pads. It should clear only the state not directly managed by the
 * @pads object. It is therefore not necessary to call
 * gst_collect_pads_set_flushing nor gst_collect_pads_clear from this function.
 *
 * Since: 1.4
  }

  TGstCollectPadsFlushFunction = procedure (pads:PGstCollectPads; user_data:Tgpointer);cdecl;
{*
 * GST_COLLECT_PADS_GET_STREAM_LOCK:
 * @pads: a #GstCollectPads
 *
 * Get the stream lock of @pads. The stream lock is used to coordinate and
 * serialize execution among the various streams being collected, and in
 * protecting the resources used to accomplish this.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_COLLECT_PADS_GET_STREAM_LOCK(pads : longint) : longint;

{*
 * GST_COLLECT_PADS_STREAM_LOCK:
 * @pads: a #GstCollectPads
 *
 * Lock the stream lock of @pads.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_STREAM_LOCK(pads : longint) : longint;

{*
 * GST_COLLECT_PADS_STREAM_UNLOCK:
 * @pads: a #GstCollectPads
 *
 * Unlock the stream lock of @pads.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_STREAM_UNLOCK(pads : longint) : longint;

{*
 * GstCollectPads:
 * @data: (element-type GstBase.CollectData): #GList of #GstCollectData managed
 *   by this #GstCollectPads.
 *
 * Collectpads object.
  }
{< public > }{ with LOCK and/or STREAM_LOCK  }
{ list of CollectData items  }
{< private > }
{ used to serialize collection among several streams  }
type
  PGstCollectPads = ^TGstCollectPads;
  TGstCollectPads = record
      object : TGstObject;cdecl;
      data : PGSList;
      stream_lock : TGRecMutex;
      priv : PGstCollectPadsPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstCollectPadsClass = ^TGstCollectPadsClass;
  TGstCollectPadsClass = record
      parent_class : TGstObjectClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_collect_pads_get_type:TGType;cdecl;external;
{ creating the object  }
function gst_collect_pads_new:PGstCollectPads;cdecl;external;
{ set the callbacks  }
procedure gst_collect_pads_set_function(pads:PGstCollectPads; func:TGstCollectPadsFunction; user_data:Tgpointer);cdecl;external;
procedure gst_collect_pads_set_buffer_function(pads:PGstCollectPads; func:TGstCollectPadsBufferFunction; user_data:Tgpointer);cdecl;external;
procedure gst_collect_pads_set_event_function(pads:PGstCollectPads; func:TGstCollectPadsEventFunction; user_data:Tgpointer);cdecl;external;
procedure gst_collect_pads_set_query_function(pads:PGstCollectPads; func:TGstCollectPadsQueryFunction; user_data:Tgpointer);cdecl;external;
procedure gst_collect_pads_set_compare_function(pads:PGstCollectPads; func:TGstCollectPadsCompareFunction; user_data:Tgpointer);cdecl;external;
procedure gst_collect_pads_set_clip_function(pads:PGstCollectPads; clipfunc:TGstCollectPadsClipFunction; user_data:Tgpointer);cdecl;external;
procedure gst_collect_pads_set_flush_function(pads:PGstCollectPads; func:TGstCollectPadsFlushFunction; user_data:Tgpointer);cdecl;external;
{ pad management  }
function gst_collect_pads_add_pad(pads:PGstCollectPads; pad:PGstPad; size:Tguint; destroy_notify:TGstCollectDataDestroyNotify; lock:Tgboolean):PGstCollectData;cdecl;external;
function gst_collect_pads_remove_pad(pads:PGstCollectPads; pad:PGstPad):Tgboolean;cdecl;external;
{ start/stop collection  }
procedure gst_collect_pads_start(pads:PGstCollectPads);cdecl;external;
procedure gst_collect_pads_stop(pads:PGstCollectPads);cdecl;external;
procedure gst_collect_pads_set_flushing(pads:PGstCollectPads; flushing:Tgboolean);cdecl;external;
{ get collected buffers  }
function gst_collect_pads_peek(pads:PGstCollectPads; data:PGstCollectData):PGstBuffer;cdecl;external;
function gst_collect_pads_pop(pads:PGstCollectPads; data:PGstCollectData):PGstBuffer;cdecl;external;
{ get collected bytes  }
function gst_collect_pads_available(pads:PGstCollectPads):Tguint;cdecl;external;
function gst_collect_pads_flush(pads:PGstCollectPads; data:PGstCollectData; size:Tguint):Tguint;cdecl;external;
function gst_collect_pads_read_buffer(pads:PGstCollectPads; data:PGstCollectData; size:Tguint):PGstBuffer;cdecl;external;
function gst_collect_pads_take_buffer(pads:PGstCollectPads; data:PGstCollectData; size:Tguint):PGstBuffer;cdecl;external;
{ setting and unsetting waiting mode  }
procedure gst_collect_pads_set_waiting(pads:PGstCollectPads; data:PGstCollectData; waiting:Tgboolean);cdecl;external;
{ convenience helper  }
function gst_collect_pads_clip_running_time(pads:PGstCollectPads; cdata:PGstCollectData; buf:PGstBuffer; outbuf:PPGstBuffer; user_data:Tgpointer):TGstFlowReturn;cdecl;external;
{ default handlers  }
function gst_collect_pads_event_default(pads:PGstCollectPads; data:PGstCollectData; event:PGstEvent; discard:Tgboolean):Tgboolean;cdecl;external;
function gst_collect_pads_src_event_default(pads:PGstCollectPads; pad:PGstPad; event:PGstEvent):Tgboolean;cdecl;external;
function gst_collect_pads_query_default(pads:PGstCollectPads; data:PGstCollectData; query:PGstQuery; discard:Tgboolean):Tgboolean;cdecl;external;
{////////G_DEFINE_AUTOPTR_CLEANUP_FUNC     (GstCollectPads, gst_object_unref) }
{$endif}
{ __GST_COLLECT_PADS_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_COLLECT_PADS : longint; { return type might be wrong }
  begin
    GST_TYPE_COLLECT_PADS:=gst_collect_pads_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS(obj : longint) : longint;
begin
  GST_COLLECT_PADS:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_COLLECT_PADS,GstCollectPads);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_CLASS(klass : longint) : longint;
begin
  GST_COLLECT_PADS_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_COLLECT_PADS,GstCollectPadsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_GET_CLASS(obj : longint) : longint;
begin
  GST_COLLECT_PADS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_COLLECT_PADS,GstCollectPadsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_COLLECT_PADS(obj : longint) : longint;
begin
  GST_IS_COLLECT_PADS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_COLLECT_PADS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_COLLECT_PADS_CLASS(klass : longint) : longint;
begin
  GST_IS_COLLECT_PADS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_COLLECT_PADS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_STATE(data : longint) : longint;
begin
  GST_COLLECT_PADS_STATE:=(PGstCollectData(data))^.state;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_STATE_IS_SET(data,flag : longint) : longint;
begin
  GST_COLLECT_PADS_STATE_IS_SET:= not ( not ((GST_COLLECT_PADS_STATE(data)) and flag));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_DTS(data : longint) : longint;
begin
  GST_COLLECT_PADS_DTS:=(PGstCollectData(data))^.(ABI.(abi.dts));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_DTS_IS_VALID(data : longint) : longint;
begin
  GST_COLLECT_PADS_DTS_IS_VALID:=GST_CLOCK_STIME_IS_VALID(GST_COLLECT_PADS_DTS(data));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_GET_STREAM_LOCK(pads : longint) : longint;
begin
  GST_COLLECT_PADS_GET_STREAM_LOCK:=@((PGstCollectPads(pads))^.stream_lock);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_STREAM_LOCK(pads : longint) : longint;
begin
  GST_COLLECT_PADS_STREAM_LOCK:=g_rec_mutex_lock(GST_COLLECT_PADS_GET_STREAM_LOCK(pads));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLLECT_PADS_STREAM_UNLOCK(pads : longint) : longint;
begin
  GST_COLLECT_PADS_STREAM_UNLOCK:=g_rec_mutex_unlock(GST_COLLECT_PADS_GET_STREAM_LOCK(pads));
end;


end.
