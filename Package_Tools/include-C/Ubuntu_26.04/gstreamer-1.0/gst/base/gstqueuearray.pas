unit gstqueuearray;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2009-2010 Edward Hervey <bilboed@bilboed.com>
 *
 * gstqueuearray.h:
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
{$ifndef __GST_QUEUE_ARRAY_H__}
{$define __GST_QUEUE_ARRAY_H__}
{$include <gst/base/base-prelude.h>}
{*
 * GstQueueArray: (skip)
 *
 * Deprecated: 1.26: Use #GstVecDeque instead.
  }
type
{////GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_new) }

function gst_queue_array_new(initial_size:Tguint):PGstQueueArray;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_free) }
procedure gst_queue_array_free(array:PGstQueueArray);cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_set_clear_func) }
procedure gst_queue_array_set_clear_func(array:PGstQueueArray; clear_func:TGDestroyNotify);cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_clear) }
procedure gst_queue_array_clear(array:PGstQueueArray);cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_pop_head) }
function gst_queue_array_pop_head(array:PGstQueueArray):Tgpointer;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_peek_head) }
function gst_queue_array_peek_head(array:PGstQueueArray):Tgpointer;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_peek_nth) }
function gst_queue_array_peek_nth(array:PGstQueueArray; idx:Tguint):Tgpointer;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_pop_tail) }
function gst_queue_array_pop_tail(array:PGstQueueArray):Tgpointer;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_peek_tail) }
function gst_queue_array_peek_tail(array:PGstQueueArray):Tgpointer;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_push_tail) }
procedure gst_queue_array_push_tail(array:PGstQueueArray; data:Tgpointer);cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_is_empty) }
function gst_queue_array_is_empty(array:PGstQueueArray):Tgboolean;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_drop_element) }
function gst_queue_array_drop_element(array:PGstQueueArray; idx:Tguint):Tgpointer;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_find) }
function gst_queue_array_find(array:PGstQueueArray; func:TGCompareFunc; data:Tgpointer):Tguint;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_get_length) }
function gst_queue_array_get_length(array:PGstQueueArray):Tguint;cdecl;external libgstbase;
{ Functions for use with structures  }
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_new_for_struct) }
function gst_queue_array_new_for_struct(struct_size:Tgsize; initial_size:Tguint):PGstQueueArray;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_push_tail_struct) }
procedure gst_queue_array_push_tail_struct(array:PGstQueueArray; p_struct:Tgpointer);cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_pop_head_struct) }
function gst_queue_array_pop_head_struct(array:PGstQueueArray):Tgpointer;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_peek_head_struct) }
function gst_queue_array_peek_head_struct(array:PGstQueueArray):Tgpointer;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_peek_nth_struct) }
function gst_queue_array_peek_nth_struct(array:PGstQueueArray; idx:Tguint):Tgpointer;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_drop_struct) }
function gst_queue_array_drop_struct(array:PGstQueueArray; idx:Tguint; p_struct:Tgpointer):Tgboolean;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_pop_tail_struct) }
function gst_queue_array_pop_tail_struct(array:PGstQueueArray):Tgpointer;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_peek_tail_struct) }
function gst_queue_array_peek_tail_struct(array:PGstQueueArray):Tgpointer;cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_push_sorted) }
procedure gst_queue_array_push_sorted(array:PGstQueueArray; data:Tgpointer; func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_push_sorted_struct) }
procedure gst_queue_array_push_sorted_struct(array:PGstQueueArray; p_struct:Tgpointer; func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external libgstbase;
{GST_BASE_DEPRECATED_FOR(gst_vec_deque_new)(gst_vec_deque_sort) }
procedure gst_queue_array_sort(array:PGstQueueArray; compare_func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external libgstbase;
{$endif}

// === Konventiert am: 13-7-26 19:20:16 ===


implementation



end.
