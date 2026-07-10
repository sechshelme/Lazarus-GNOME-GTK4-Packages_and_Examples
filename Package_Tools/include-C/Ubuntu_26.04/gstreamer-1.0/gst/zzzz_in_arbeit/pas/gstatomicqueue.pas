unit gstatomicqueue;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2009-2010 Edward Hervey <bilboed@bilboed.com>
 *           (C) 2011 Wim Taymans <wim.taymans@gmail.com>
 *
 * gstatomicqueue.h:
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
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gst/gstconfig.h>}
{$ifndef __GST_ATOMIC_QUEUE_H__}
{$define __GST_ATOMIC_QUEUE_H__}

{*
 * GstAtomicQueue:
 *
 * Opaque atomic data queue.
 *
 * Use the accessor functions to get the stored values.
  }
type

function gst_atomic_queue_get_type:TGType;cdecl;external libgstreamer;
function gst_atomic_queue_new(initial_size:Tguint):PGstAtomicQueue;cdecl;external libgstreamer;
procedure gst_atomic_queue_ref(queue:PGstAtomicQueue);cdecl;external libgstreamer;
procedure gst_atomic_queue_unref(queue:PGstAtomicQueue);cdecl;external libgstreamer;
procedure gst_atomic_queue_push(queue:PGstAtomicQueue; data:Tgpointer);cdecl;external libgstreamer;
function gst_atomic_queue_pop(queue:PGstAtomicQueue):Tgpointer;cdecl;external libgstreamer;
function gst_atomic_queue_peek(queue:PGstAtomicQueue):Tgpointer;cdecl;external libgstreamer;
function gst_atomic_queue_length(queue:PGstAtomicQueue):Tguint;cdecl;external libgstreamer;
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (GstAtomicQueue, gst_atomic_queue_unref) }
{$endif}
{ __GST_ATOMIC_QUEUE_H__  }

// === Konventiert am: 10-7-26 19:47:35 ===

function GST_TYPE_ATOMIC_QUEUE : TGType;

implementation

function GST_TYPE_ATOMIC_QUEUE : TGType;
  begin
    GST_TYPE_ATOMIC_QUEUE:=gst_atomic_queue_get_type;
  end;



end.
