unit gstdataqueue;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2006 Edward Hervey <edward@fluendo.com>
 *
 * gstdataqueue.h:
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
{$ifndef __GST_DATA_QUEUE_H__}
{$define __GST_DATA_QUEUE_H__}
{$include <gst/gst.h>}
{$include <gst/base/base-prelude.h>}

type
{*
 * GstDataQueueItem: (skip)
 * @object: the #GstMiniObject to queue.
 * @size: the size in bytes of the miniobject.
 * @duration: the duration in #GstClockTime of the miniobject. Can not be
 * %GST_CLOCK_TIME_NONE.
 * @visible: %TRUE if @object should be considered as a visible object.
 * @destroy: The #GDestroyNotify function to use to free the #GstDataQueueItem.
 * This function should also drop the reference to @object the owner of the
 * #GstDataQueueItem is assumed to hold.
 *
 * Structure used by #GstDataQueue. You can supply a different structure, as
 * long as the top of the structure is identical to this structure.
  }
{ user supplied destroy function  }
{ < private >  }
  PGstDataQueueItem = ^TGstDataQueueItem;
  TGstDataQueueItem = record
      object : PGstMiniObject;
      size : Tguint;
      duration : Tguint64;
      visible : Tgboolean;
      destroy : TGDestroyNotify;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstDataQueueSize: (skip)
 * @visible: number of buffers
 * @bytes: number of bytes
 * @time: amount of time
 *
 * Structure describing the size of a queue.
  }
  PGstDataQueueSize = ^TGstDataQueueSize;
  TGstDataQueueSize = record
      visible : Tguint;
      bytes : Tguint;
      time : Tguint64;
    end;

{*
 * GstDataQueueCheckFullFunction: (skip)
 * @queue: a #GstDataQueue.
 * @visible: The number of visible items currently in the queue.
 * @bytes: The amount of bytes currently in the queue.
 * @time: The accumulated duration of the items currently in the queue.
 * @checkdata: The #gpointer registered when the #GstDataQueue was created.
 *
 * The prototype of the function used to inform the queue that it should be
 * considered as full.
 *
 * Returns: %TRUE if the queue should be considered full.
  }

  TGstDataQueueCheckFullFunction = function (queue:PGstDataQueue; visible:Tguint; bytes:Tguint; time:Tguint64; checkdata:Tgpointer):Tgboolean;cdecl;

  TGstDataQueueFullCallback = procedure (queue:PGstDataQueue; checkdata:Tgpointer);cdecl;

  TGstDataQueueEmptyCallback = procedure (queue:PGstDataQueue; checkdata:Tgpointer);cdecl;
{*
 * GstDataQueue:
 * @object: the parent structure
 *
 * Opaque #GstDataQueue structure.
  }
{< private > }
  PGstDataQueue = ^TGstDataQueue;
  TGstDataQueue = record
      object : TGObject;cdecl;
      priv : PGstDataQueuePrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstDataQueueClass:
  }
{ signals  }
  PGstDataQueueClass = ^TGstDataQueueClass;
  TGstDataQueueClass = record
      parent_class : TGObjectClass;
      empty : procedure (queue:PGstDataQueue);cdecl;
      full : procedure (queue:PGstDataQueue);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_data_queue_get_type:TGType;cdecl;external libgstbase;
function gst_data_queue_new(checkfull:TGstDataQueueCheckFullFunction; fullcallback:TGstDataQueueFullCallback; emptycallback:TGstDataQueueEmptyCallback; checkdata:Tgpointer):PGstDataQueue;cdecl;external libgstbase;
function gst_data_queue_push(queue:PGstDataQueue; item:PGstDataQueueItem):Tgboolean;cdecl;external libgstbase;
function gst_data_queue_push_force(queue:PGstDataQueue; item:PGstDataQueueItem):Tgboolean;cdecl;external libgstbase;
function gst_data_queue_pop(queue:PGstDataQueue; item:PPGstDataQueueItem):Tgboolean;cdecl;external libgstbase;
function gst_data_queue_peek(queue:PGstDataQueue; item:PPGstDataQueueItem):Tgboolean;cdecl;external libgstbase;
procedure gst_data_queue_flush(queue:PGstDataQueue);cdecl;external libgstbase;
procedure gst_data_queue_set_flushing(queue:PGstDataQueue; flushing:Tgboolean);cdecl;external libgstbase;
function gst_data_queue_drop_head(queue:PGstDataQueue; _type:TGType):Tgboolean;cdecl;external libgstbase;
function gst_data_queue_is_full(queue:PGstDataQueue):Tgboolean;cdecl;external libgstbase;
function gst_data_queue_is_empty(queue:PGstDataQueue):Tgboolean;cdecl;external libgstbase;
procedure gst_data_queue_get_level(queue:PGstDataQueue; level:PGstDataQueueSize);cdecl;external libgstbase;
procedure gst_data_queue_limits_changed(queue:PGstDataQueue);cdecl;external libgstbase;
{////////G_DEFINE_AUTOPTR_CLEANUP_FUNC     (GstDataQueue, gst_object_unref) }
{$endif}
{ __GST_DATA_QUEUE_H__  }

// === Konventiert am: 13-7-26 19:21:11 ===

function GST_TYPE_DATA_QUEUE : TGType;
function GST_DATA_QUEUE(obj : Pointer) : PGstDataQueue;
function GST_DATA_QUEUE_CLASS(klass : Pointer) : PGstDataQueueClass;
function GST_IS_DATA_QUEUE(obj : Pointer) : Tgboolean;
function GST_IS_DATA_QUEUE_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_DATA_QUEUE : TGType;
  begin
    GST_TYPE_DATA_QUEUE:=gst_data_queue_get_type;
  end;

function GST_DATA_QUEUE(obj : Pointer) : PGstDataQueue;
begin
  Result := PGstDataQueue(g_type_check_instance_cast(obj, GST_TYPE_DATA_QUEUE));
end;

function GST_DATA_QUEUE_CLASS(klass : Pointer) : PGstDataQueueClass;
begin
  Result := PGstDataQueueClass(g_type_check_class_cast(klass, GST_TYPE_DATA_QUEUE));
end;

function GST_IS_DATA_QUEUE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_DATA_QUEUE);
end;

function GST_IS_DATA_QUEUE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_DATA_QUEUE);
end;



end.
