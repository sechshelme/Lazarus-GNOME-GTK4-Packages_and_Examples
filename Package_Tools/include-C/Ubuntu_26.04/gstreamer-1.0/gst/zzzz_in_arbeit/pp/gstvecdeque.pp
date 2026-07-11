
unit gstvecdeque;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvecdeque.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvecdeque.h
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
PGstVecDeque  = ^GstVecDeque;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2009-2010 Edward Hervey <bilboed@bilboed.com>
 *
 * gstvecdeque.h:
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
{$ifndef __GST_VEC_DEQUE_H__}
{$define __GST_VEC_DEQUE_H__}
{$include <glib.h>}
{$include <gst/gstconfig.h>}
{*
 * GstVecDeque: (skip)
 *
 * Since: 1.26
  }
type

function gst_vec_deque_new(initial_size:Tgsize):PGstVecDeque;cdecl;external;
procedure gst_vec_deque_free(array:PGstVecDeque);cdecl;external;
procedure gst_vec_deque_set_clear_func(array:PGstVecDeque; clear_func:TGDestroyNotify);cdecl;external;
procedure gst_vec_deque_clear(array:PGstVecDeque);cdecl;external;
function gst_vec_deque_pop_head(array:PGstVecDeque):Tgpointer;cdecl;external;
function gst_vec_deque_peek_head(array:PGstVecDeque):Tgpointer;cdecl;external;
function gst_vec_deque_peek_nth(array:PGstVecDeque; idx:Tgsize):Tgpointer;cdecl;external;
function gst_vec_deque_pop_tail(array:PGstVecDeque):Tgpointer;cdecl;external;
function gst_vec_deque_peek_tail(array:PGstVecDeque):Tgpointer;cdecl;external;
procedure gst_vec_deque_push_tail(array:PGstVecDeque; data:Tgpointer);cdecl;external;
function gst_vec_deque_is_empty(array:PGstVecDeque):Tgboolean;cdecl;external;
function gst_vec_deque_drop_element(array:PGstVecDeque; idx:Tgsize):Tgpointer;cdecl;external;
function gst_vec_deque_find(array:PGstVecDeque; func:TGCompareFunc; data:Tgpointer):Tgsize;cdecl;external;
function gst_vec_deque_get_length(array:PGstVecDeque):Tgsize;cdecl;external;
{ Functions for use with structures  }
function gst_vec_deque_new_for_struct(struct_size:Tgsize; initial_size:Tgsize):PGstVecDeque;cdecl;external;
procedure gst_vec_deque_push_tail_struct(array:PGstVecDeque; p_struct:Tgpointer);cdecl;external;
function gst_vec_deque_pop_head_struct(array:PGstVecDeque):Tgpointer;cdecl;external;
function gst_vec_deque_peek_head_struct(array:PGstVecDeque):Tgpointer;cdecl;external;
function gst_vec_deque_peek_nth_struct(array:PGstVecDeque; idx:Tgsize):Tgpointer;cdecl;external;
function gst_vec_deque_drop_struct(array:PGstVecDeque; idx:Tgsize; p_struct:Tgpointer):Tgboolean;cdecl;external;
function gst_vec_deque_pop_tail_struct(array:PGstVecDeque):Tgpointer;cdecl;external;
function gst_vec_deque_peek_tail_struct(array:PGstVecDeque):Tgpointer;cdecl;external;
procedure gst_vec_deque_push_sorted(array:PGstVecDeque; data:Tgpointer; func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external;
procedure gst_vec_deque_push_sorted_struct(array:PGstVecDeque; p_struct:Tgpointer; func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external;
procedure gst_vec_deque_sort(array:PGstVecDeque; compare_func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external;
{$endif}

implementation


end.
