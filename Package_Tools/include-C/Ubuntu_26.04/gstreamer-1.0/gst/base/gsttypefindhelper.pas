unit gsttypefindhelper;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 * Copyright (C) 2000,2005 Wim Taymans <wim@fluendo.com>
 * Copyright (C) 2006      Tim-Philipp Müller <tim centricular net>
 *
 * gsttypefindhelper.h:
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
{$ifndef __GST_TYPEFINDHELPER_H__}
{$define __GST_TYPEFINDHELPER_H__}
{$include <gst/gst.h>}
{$include <gst/base/base-prelude.h>}
type

function gst_type_find_data_new(obj:PGstObject; data:Pguint8; size:Tgsize):PGstTypeFindData;cdecl;external libgstbase;
function gst_type_find_data_get_caps(data:PGstTypeFindData):PGstCaps;cdecl;external libgstbase;
function gst_type_find_data_get_probability(data:PGstTypeFindData):TGstTypeFindProbability;cdecl;external libgstbase;
function gst_type_find_data_get_typefind(data:PGstTypeFindData):PGstTypeFind;cdecl;external libgstbase;
procedure gst_type_find_data_free(data:PGstTypeFindData);cdecl;external libgstbase;
function gst_type_find_helper(src:PGstPad; size:Tguint64):PGstCaps;cdecl;external libgstbase;
function gst_type_find_helper_for_data(obj:PGstObject; data:Pguint8; size:Tgsize; prob:PGstTypeFindProbability):PGstCaps;cdecl;external libgstbase;
function gst_type_find_helper_for_data_with_extension(obj:PGstObject; data:Pguint8; size:Tgsize; extension:Pgchar; prob:PGstTypeFindProbability):PGstCaps;cdecl;external libgstbase;
function gst_type_find_helper_for_data_with_caps(obj:PGstObject; data:Pguint8; size:Tgsize; caps:PGstCaps; prob:PGstTypeFindProbability):PGstCaps;cdecl;external libgstbase;
function gst_type_find_helper_for_buffer(obj:PGstObject; buf:PGstBuffer; prob:PGstTypeFindProbability):PGstCaps;cdecl;external libgstbase;
function gst_type_find_helper_for_buffer_with_extension(obj:PGstObject; buf:PGstBuffer; extension:Pgchar; prob:PGstTypeFindProbability):PGstCaps;cdecl;external libgstbase;
function gst_type_find_helper_for_buffer_with_caps(obj:PGstObject; buf:PGstBuffer; caps:PGstCaps; prob:PGstTypeFindProbability):PGstCaps;cdecl;external libgstbase;
function gst_type_find_helper_for_extension(obj:PGstObject; extension:Pgchar):PGstCaps;cdecl;external libgstbase;
function gst_type_find_list_factories_for_caps(obj:PGstObject; caps:PGstCaps):PGList;cdecl;external libgstbase;
{*
 * GstTypeFindHelperGetRangeFunction:
 * @obj: a #GstObject that will handle the getrange request
 * @parent: (allow-none): the parent of @obj or %NULL
 * @offset: the offset of the range
 * @length: the length of the range
 * @buffer: (out): a memory location to hold the result buffer
 *
 * This function will be called by gst_type_find_helper_get_range() when
 * typefinding functions request to peek at the data of a stream at certain
 * offsets. If this function returns GST_FLOW_OK, the result buffer will be
 * stored in @buffer. The  contents of @buffer is invalid for any other
 * return value.
 *
 * This function is supposed to behave exactly like a #GstPadGetRangeFunction.
 *
 * Returns: GST_FLOW_OK for success
  }
type

  TGstTypeFindHelperGetRangeFunction = function (obj:PGstObject; parent:PGstObject; offset:Tguint64; length:Tguint; buffer:PPGstBuffer):TGstFlowReturn;cdecl;

function gst_type_find_helper_get_range(obj:PGstObject; parent:PGstObject; func:TGstTypeFindHelperGetRangeFunction; size:Tguint64; extension:Pgchar; 
           prob:PGstTypeFindProbability):PGstCaps;cdecl;external libgstbase;
function gst_type_find_helper_get_range_full(obj:PGstObject; parent:PGstObject; func:TGstTypeFindHelperGetRangeFunction; size:Tguint64; extension:Pgchar; 
           caps:PPGstCaps; prob:PGstTypeFindProbability):TGstFlowReturn;cdecl;external libgstbase;
{$endif}
{ __GST_TYPEFINDHELPER_H__  }

// === Konventiert am: 13-7-26 19:20:12 ===


implementation



end.
