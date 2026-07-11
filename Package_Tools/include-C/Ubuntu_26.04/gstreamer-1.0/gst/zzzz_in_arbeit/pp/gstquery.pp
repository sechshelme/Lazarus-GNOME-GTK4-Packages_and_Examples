
unit gstquery;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstquery.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstquery.h
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
Pgchar  = ^gchar;
Pgdouble  = ^gdouble;
Pgint  = ^gint;
Pgint64  = ^gint64;
PGstAllocationParams  = ^GstAllocationParams;
PGstAllocator  = ^GstAllocator;
PGstBufferingMode  = ^GstBufferingMode;
PGstBufferPool  = ^GstBufferPool;
PGstCaps  = ^GstCaps;
PGstClockTime  = ^GstClockTime;
PGstContext  = ^GstContext;
PGstFormat  = ^GstFormat;
PGstQuery  = ^GstQuery;
PGstQueryType  = ^GstQueryType;
PGstQueryTypeFlags  = ^GstQueryTypeFlags;
PGstSchedulingFlags  = ^GstSchedulingFlags;
PGstStructure  = ^GstStructure;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wim.taymans@chello.be>
 *                    2005 Wim Taymans <wim@fluendo.com>
 *                    2011 Wim Taymans <wim.taymans@gmail.com>
 *
 * gstquery.h: GstQuery API declaration
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
{$ifndef __GST_QUERY_H__}
{$define __GST_QUERY_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gst/gstconfig.h>}
{$ifdef _MSC_VER}
(** unsupported pragma#pragma warning(disable: 5287)*)
{$endif}
type
{$include <gst/gstminiobject.h>}
{*
 * GstQueryTypeFlags:
 * @GST_QUERY_TYPE_UPSTREAM:     Set if the query can travel upstream.
 * @GST_QUERY_TYPE_DOWNSTREAM:   Set if the query can travel downstream.
 * @GST_QUERY_TYPE_SERIALIZED:   Set if the query should be serialized with data
 *                               flow.
 *
 * #GstQueryTypeFlags indicate the aspects of the different #GstQueryType
 * values. You can get the type flags of a #GstQueryType with the
 * gst_query_type_get_flags() function.
  }
type
  PGstQueryTypeFlags = ^TGstQueryTypeFlags;
  TGstQueryTypeFlags =  Longint;
  Const
    GST_QUERY_TYPE_UPSTREAM = 1 shl 0;
    GST_QUERY_TYPE_DOWNSTREAM = 1 shl 1;
    GST_QUERY_TYPE_SERIALIZED = 1 shl 2;
;
{*
 * GST_QUERY_TYPE_BOTH: (value 3) (type GstQueryTypeFlags)
 *
 * The same thing as #GST_QUERY_TYPE_UPSTREAM | #GST_QUERY_TYPE_DOWNSTREAM.
  }

{ was #define dname def_expr }
function GST_QUERY_TYPE_BOTH : TGstQueryTypeFlags;  

const
  GST_QUERY_NUM_SHIFT = 8;  
{*
 * GST_QUERY_MAKE_TYPE:
 * @num: the query number to create
 * @flags: the query flags
 *
 * when making custom query types, use this macro with the num and
 * the given flags
  }
{*
 * GstQueryType:
 * @GST_QUERY_UNKNOWN: unknown query type
 * @GST_QUERY_POSITION: current position in stream
 * @GST_QUERY_DURATION: total duration of the stream
 * @GST_QUERY_LATENCY: latency of stream
 * @GST_QUERY_JITTER: current jitter of stream
 * @GST_QUERY_RATE: current rate of the stream
 * @GST_QUERY_SEEKING: seeking capabilities
 * @GST_QUERY_SEGMENT: segment start/stop positions
 * @GST_QUERY_CONVERT: convert values between formats
 * @GST_QUERY_FORMATS: query supported formats for convert
 * @GST_QUERY_BUFFERING: query available media for efficient seeking.
 * @GST_QUERY_CUSTOM: a custom application or element defined query.
 * @GST_QUERY_URI: query the URI of the source or sink.
 * @GST_QUERY_ALLOCATION: the buffer allocation properties
 * @GST_QUERY_SCHEDULING: the scheduling properties
 * @GST_QUERY_ACCEPT_CAPS: the accept caps query
 * @GST_QUERY_CAPS: the caps query
 * @GST_QUERY_DRAIN: wait till all serialized data is consumed downstream
 * @GST_QUERY_CONTEXT: query the pipeline-local context from
 *     downstream or upstream (since 1.2)
 * @GST_QUERY_BITRATE: the bitrate query (since 1.16)
 * @GST_QUERY_SELECTABLE: Query stream selection capability (Since: 1.22)
 *
 * Standard predefined Query types
  }
{ NOTE: don't forget to update the table in gstquery.c when changing
 * this enum  }
{*
   * GST_QUERY_SELECTABLE:
   *
   * Query stream selection capability.
   *
   * Since: 1.22
    }
type
  PGstQueryType = ^TGstQueryType;
  TGstQueryType =  Longint;
  Const
    GST_QUERY_UNKNOWN = GST_QUERY_MAKE_TYPE(0,0);
    GST_QUERY_POSITION = GST_QUERY_MAKE_TYPE(10,_FLAG(BOTH));
    GST_QUERY_DURATION = GST_QUERY_MAKE_TYPE(20,_FLAG(BOTH));
    GST_QUERY_LATENCY = GST_QUERY_MAKE_TYPE(30,_FLAG(BOTH));
    GST_QUERY_JITTER = GST_QUERY_MAKE_TYPE(40,_FLAG(BOTH));
    GST_QUERY_RATE = GST_QUERY_MAKE_TYPE(50,_FLAG(BOTH));
    GST_QUERY_SEEKING = GST_QUERY_MAKE_TYPE(60,_FLAG(BOTH));
    GST_QUERY_SEGMENT = GST_QUERY_MAKE_TYPE(70,_FLAG(BOTH));
    GST_QUERY_CONVERT = GST_QUERY_MAKE_TYPE(80,_FLAG(BOTH));
    GST_QUERY_FORMATS = GST_QUERY_MAKE_TYPE(90,_FLAG(BOTH));
    GST_QUERY_BUFFERING = GST_QUERY_MAKE_TYPE(110,_FLAG(BOTH));
    GST_QUERY_CUSTOM = GST_QUERY_MAKE_TYPE(120,_FLAG(BOTH));
    GST_QUERY_URI = GST_QUERY_MAKE_TYPE(130,_FLAG(BOTH));
    GST_QUERY_ALLOCATION = GST_QUERY_MAKE_TYPE(140,(_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED)));
    GST_QUERY_SCHEDULING = GST_QUERY_MAKE_TYPE(150,_FLAG(UPSTREAM));
    GST_QUERY_ACCEPT_CAPS = GST_QUERY_MAKE_TYPE(160,_FLAG(BOTH));
    GST_QUERY_CAPS = GST_QUERY_MAKE_TYPE(170,_FLAG(BOTH));
    GST_QUERY_DRAIN = GST_QUERY_MAKE_TYPE(180,(_FLAG(DOWNSTREAM)) or (_FLAG(SERIALIZED)));
    GST_QUERY_CONTEXT = GST_QUERY_MAKE_TYPE(190,_FLAG(BOTH));
    GST_QUERY_BITRATE = GST_QUERY_MAKE_TYPE(200,_FLAG(DOWNSTREAM));
    GST_QUERY_SELECTABLE = GST_QUERY_MAKE_TYPE(210,_FLAG(BOTH));
;
{$undef _FLAG}
  var
    _gst_query_type : TGType;cvar;external;

const
  GST_TYPE_QUERY = _gst_query_type;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_IS_QUERY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_QUERY_CAST(obj : longint) : PGstQuery;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_QUERY(obj : longint) : longint;

{*
 * GstQuery:
 * @mini_object: The parent #GstMiniObject type
 * @type: the #GstQueryType
 *
 * The #GstQuery structure.
  }
{< public >  }{ with COW  }
type
  PGstQuery = ^TGstQuery;
  TGstQuery = record
      mini_object : TGstMiniObject;
      _type : TGstQueryType;
    end;

{*
 * GstBufferingMode:
 * @GST_BUFFERING_STREAM: a small amount of data is buffered
 * @GST_BUFFERING_DOWNLOAD: the stream is being downloaded
 * @GST_BUFFERING_TIMESHIFT: the stream is being downloaded in a ringbuffer
 * @GST_BUFFERING_LIVE: the stream is a live stream
 *
 * The different types of buffering methods.
  }

  PGstBufferingMode = ^TGstBufferingMode;
  TGstBufferingMode =  Longint;
  Const
    GST_BUFFERING_STREAM = 0;
    GST_BUFFERING_DOWNLOAD = 1;
    GST_BUFFERING_TIMESHIFT = 2;
    GST_BUFFERING_LIVE = 3;
;
{$include <gst/gstiterator.h>}
{$include <gst/gststructure.h>}
{$include <gst/gstformat.h>}
{$include <gst/gstpad.h>}
{$include <gst/gstallocator.h>}
{$include <gst/gsttoc.h>}
{$include <gst/gstcontext.h>}
(* Const before type ignored *)

function gst_query_type_get_name(_type:TGstQueryType):Pgchar;cdecl;external;
function gst_query_type_to_quark(_type:TGstQueryType):TGQuark;cdecl;external;
function gst_query_type_get_flags(_type:TGstQueryType):TGstQueryTypeFlags;cdecl;external;
function gst_query_get_type:TGType;cdecl;external;
function gst_query_ref(q:PGstQuery):PGstQuery;cdecl;external;
procedure gst_query_unref(q:PGstQuery);cdecl;external;
procedure gst_clear_query(query_ptr:PPGstQuery);cdecl;external;
(* Const before type ignored *)
function gst_query_copy(q:PGstQuery):PGstQuery;cdecl;external;
function gst_query_make_writable(query:PGstQuery):PGstQuery;cdecl;external;
(* Const before type ignored *)
function gst_query_is_writable(query:PGstQuery):Tgboolean;cdecl;external;
function gst_query_replace(old_query:PPGstQuery; new_query:PGstQuery):Tgboolean;cdecl;external;
function gst_query_take(old_query:PPGstQuery; new_query:PGstQuery):Tgboolean;cdecl;external;
function gst_query_steal(old_query:PPGstQuery):PGstQuery;cdecl;external;
{$endif}
{ GST_DISABLE_MINIOBJECT_INLINE_FUNCTIONS  }
{ application specific query  }

function gst_query_new_custom(_type:TGstQueryType; structure:PGstStructure):PGstQuery;cdecl;external;
(* Const before type ignored *)
function gst_query_get_structure(query:PGstQuery):PGstStructure;cdecl;external;
function gst_query_writable_structure(query:PGstQuery):PGstStructure;cdecl;external;
{ position query  }
function gst_query_new_position(format:TGstFormat):PGstQuery;cdecl;external;
procedure gst_query_set_position(query:PGstQuery; format:TGstFormat; cur:Tgint64);cdecl;external;
procedure gst_query_parse_position(query:PGstQuery; format:PGstFormat; cur:Pgint64);cdecl;external;
{ duration query  }
function gst_query_new_duration(format:TGstFormat):PGstQuery;cdecl;external;
procedure gst_query_set_duration(query:PGstQuery; format:TGstFormat; duration:Tgint64);cdecl;external;
procedure gst_query_parse_duration(query:PGstQuery; format:PGstFormat; duration:Pgint64);cdecl;external;
{ latency query  }
function gst_query_new_latency:PGstQuery;cdecl;external;
procedure gst_query_set_latency(query:PGstQuery; live:Tgboolean; min_latency:TGstClockTime; max_latency:TGstClockTime);cdecl;external;
procedure gst_query_parse_latency(query:PGstQuery; live:Pgboolean; min_latency:PGstClockTime; max_latency:PGstClockTime);cdecl;external;
{ convert query  }
function gst_query_new_convert(src_format:TGstFormat; value:Tgint64; dest_format:TGstFormat):PGstQuery;cdecl;external;
procedure gst_query_set_convert(query:PGstQuery; src_format:TGstFormat; src_value:Tgint64; dest_format:TGstFormat; dest_value:Tgint64);cdecl;external;
procedure gst_query_parse_convert(query:PGstQuery; src_format:PGstFormat; src_value:Pgint64; dest_format:PGstFormat; dest_value:Pgint64);cdecl;external;
{ segment query  }
function gst_query_new_segment(format:TGstFormat):PGstQuery;cdecl;external;
procedure gst_query_set_segment(query:PGstQuery; rate:Tgdouble; format:TGstFormat; start_value:Tgint64; stop_value:Tgint64);cdecl;external;
procedure gst_query_parse_segment(query:PGstQuery; rate:Pgdouble; format:PGstFormat; start_value:Pgint64; stop_value:Pgint64);cdecl;external;
{ seeking query  }
function gst_query_new_seeking(format:TGstFormat):PGstQuery;cdecl;external;
procedure gst_query_set_seeking(query:PGstQuery; format:TGstFormat; seekable:Tgboolean; segment_start:Tgint64; segment_end:Tgint64);cdecl;external;
procedure gst_query_parse_seeking(query:PGstQuery; format:PGstFormat; seekable:Pgboolean; segment_start:Pgint64; segment_end:Pgint64);cdecl;external;
{ formats query  }
function gst_query_new_formats:PGstQuery;cdecl;external;
procedure gst_query_set_formats(query:PGstQuery; n_formats:Tgint; args:array of const);cdecl;external;
procedure gst_query_set_formats(query:PGstQuery; n_formats:Tgint);cdecl;external;
(* Const before type ignored *)
procedure gst_query_set_formatsv(query:PGstQuery; n_formats:Tgint; formats:PGstFormat);cdecl;external;
procedure gst_query_parse_n_formats(query:PGstQuery; n_formats:Pguint);cdecl;external;
procedure gst_query_parse_nth_format(query:PGstQuery; nth:Tguint; format:PGstFormat);cdecl;external;
{ buffering query  }
function gst_query_new_buffering(format:TGstFormat):PGstQuery;cdecl;external;
procedure gst_query_set_buffering_percent(query:PGstQuery; busy:Tgboolean; percent:Tgint);cdecl;external;
procedure gst_query_parse_buffering_percent(query:PGstQuery; busy:Pgboolean; percent:Pgint);cdecl;external;
procedure gst_query_set_buffering_stats(query:PGstQuery; mode:TGstBufferingMode; avg_in:Tgint; avg_out:Tgint; buffering_left:Tgint64);cdecl;external;
procedure gst_query_parse_buffering_stats(query:PGstQuery; mode:PGstBufferingMode; avg_in:Pgint; avg_out:Pgint; buffering_left:Pgint64);cdecl;external;
procedure gst_query_set_buffering_range(query:PGstQuery; format:TGstFormat; start:Tgint64; stop:Tgint64; estimated_total:Tgint64);cdecl;external;
procedure gst_query_parse_buffering_range(query:PGstQuery; format:PGstFormat; start:Pgint64; stop:Pgint64; estimated_total:Pgint64);cdecl;external;
function gst_query_add_buffering_range(query:PGstQuery; start:Tgint64; stop:Tgint64):Tgboolean;cdecl;external;
function gst_query_get_n_buffering_ranges(query:PGstQuery):Tguint;cdecl;external;
function gst_query_parse_nth_buffering_range(query:PGstQuery; index:Tguint; start:Pgint64; stop:Pgint64):Tgboolean;cdecl;external;
{ URI query  }
function gst_query_new_uri:PGstQuery;cdecl;external;
procedure gst_query_parse_uri(query:PGstQuery; uri:PPgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_query_set_uri(query:PGstQuery; uri:Pgchar);cdecl;external;
procedure gst_query_parse_uri_redirection(query:PGstQuery; uri:PPgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_query_set_uri_redirection(query:PGstQuery; uri:Pgchar);cdecl;external;
procedure gst_query_parse_uri_redirection_permanent(query:PGstQuery; permanent:Pgboolean);cdecl;external;
procedure gst_query_set_uri_redirection_permanent(query:PGstQuery; permanent:Tgboolean);cdecl;external;
{ allocation query  }
function gst_query_new_allocation(caps:PGstCaps; need_pool:Tgboolean):PGstQuery;cdecl;external;
procedure gst_query_parse_allocation(query:PGstQuery; caps:PPGstCaps; need_pool:Pgboolean);cdecl;external;
{ pools  }
procedure gst_query_add_allocation_pool(query:PGstQuery; pool:PGstBufferPool; size:Tguint; min_buffers:Tguint; max_buffers:Tguint);cdecl;external;
function gst_query_get_n_allocation_pools(query:PGstQuery):Tguint;cdecl;external;
procedure gst_query_parse_nth_allocation_pool(query:PGstQuery; index:Tguint; pool:PPGstBufferPool; size:Pguint; min_buffers:Pguint; 
            max_buffers:Pguint);cdecl;external;
procedure gst_query_set_nth_allocation_pool(query:PGstQuery; index:Tguint; pool:PGstBufferPool; size:Tguint; min_buffers:Tguint; 
            max_buffers:Tguint);cdecl;external;
procedure gst_query_remove_nth_allocation_pool(query:PGstQuery; index:Tguint);cdecl;external;
{ allocators  }
(* Const before type ignored *)
procedure gst_query_add_allocation_param(query:PGstQuery; allocator:PGstAllocator; params:PGstAllocationParams);cdecl;external;
function gst_query_get_n_allocation_params(query:PGstQuery):Tguint;cdecl;external;
procedure gst_query_parse_nth_allocation_param(query:PGstQuery; index:Tguint; allocator:PPGstAllocator; params:PGstAllocationParams);cdecl;external;
(* Const before type ignored *)
procedure gst_query_set_nth_allocation_param(query:PGstQuery; index:Tguint; allocator:PGstAllocator; params:PGstAllocationParams);cdecl;external;
procedure gst_query_remove_nth_allocation_param(query:PGstQuery; index:Tguint);cdecl;external;
{ metadata  }
(* Const before type ignored *)
procedure gst_query_add_allocation_meta(query:PGstQuery; api:TGType; params:PGstStructure);cdecl;external;
function gst_query_get_n_allocation_metas(query:PGstQuery):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_query_parse_nth_allocation_meta(query:PGstQuery; index:Tguint; params:PPGstStructure):TGType;cdecl;external;
procedure gst_query_remove_nth_allocation_meta(query:PGstQuery; index:Tguint);cdecl;external;
function gst_query_find_allocation_meta(query:PGstQuery; api:TGType; index:Pguint):Tgboolean;cdecl;external;
{ scheduling query  }
{*
 * GstSchedulingFlags:
 * @GST_SCHEDULING_FLAG_SEEKABLE: if seeking is possible
 * @GST_SCHEDULING_FLAG_SEQUENTIAL: if sequential access is recommended
 * @GST_SCHEDULING_FLAG_BANDWIDTH_LIMITED: if bandwidth is limited and buffering possible (since 1.2)
 *
 * The different scheduling flags.
  }
type
  PGstSchedulingFlags = ^TGstSchedulingFlags;
  TGstSchedulingFlags =  Longint;
  Const
    GST_SCHEDULING_FLAG_SEEKABLE = 1 shl 0;
    GST_SCHEDULING_FLAG_SEQUENTIAL = 1 shl 1;
    GST_SCHEDULING_FLAG_BANDWIDTH_LIMITED = 1 shl 2;
;

function gst_query_new_scheduling:PGstQuery;cdecl;external;
procedure gst_query_set_scheduling(query:PGstQuery; flags:TGstSchedulingFlags; minsize:Tgint; maxsize:Tgint; align:Tgint);cdecl;external;
procedure gst_query_parse_scheduling(query:PGstQuery; flags:PGstSchedulingFlags; minsize:Pgint; maxsize:Pgint; align:Pgint);cdecl;external;
procedure gst_query_add_scheduling_mode(query:PGstQuery; mode:TGstPadMode);cdecl;external;
function gst_query_get_n_scheduling_modes(query:PGstQuery):Tguint;cdecl;external;
function gst_query_parse_nth_scheduling_mode(query:PGstQuery; index:Tguint):TGstPadMode;cdecl;external;
function gst_query_has_scheduling_mode(query:PGstQuery; mode:TGstPadMode):Tgboolean;cdecl;external;
function gst_query_has_scheduling_mode_with_flags(query:PGstQuery; mode:TGstPadMode; flags:TGstSchedulingFlags):Tgboolean;cdecl;external;
{ accept-caps query  }
function gst_query_new_accept_caps(caps:PGstCaps):PGstQuery;cdecl;external;
procedure gst_query_parse_accept_caps(query:PGstQuery; caps:PPGstCaps);cdecl;external;
procedure gst_query_set_accept_caps_result(query:PGstQuery; result:Tgboolean);cdecl;external;
procedure gst_query_parse_accept_caps_result(query:PGstQuery; result:Pgboolean);cdecl;external;
{ caps query  }
function gst_query_new_caps(filter:PGstCaps):PGstQuery;cdecl;external;
procedure gst_query_parse_caps(query:PGstQuery; filter:PPGstCaps);cdecl;external;
procedure gst_query_set_caps_result(query:PGstQuery; caps:PGstCaps);cdecl;external;
procedure gst_query_parse_caps_result(query:PGstQuery; caps:PPGstCaps);cdecl;external;
{ drain query  }
function gst_query_new_drain:PGstQuery;cdecl;external;
{ context query  }
(* Const before type ignored *)
function gst_query_new_context(context_type:Pgchar):PGstQuery;cdecl;external;
(* Const before type ignored *)
function gst_query_parse_context_type(query:PGstQuery; context_type:PPgchar):Tgboolean;cdecl;external;
procedure gst_query_set_context(query:PGstQuery; context:PGstContext);cdecl;external;
procedure gst_query_parse_context(query:PGstQuery; context:PPGstContext);cdecl;external;
{ bitrate query  }
function gst_query_new_bitrate:PGstQuery;cdecl;external;
procedure gst_query_set_bitrate(query:PGstQuery; nominal_bitrate:Tguint);cdecl;external;
procedure gst_query_parse_bitrate(query:PGstQuery; nominal_bitrate:Pguint);cdecl;external;
{ selectable query  }
function gst_query_new_selectable:PGstQuery;cdecl;external;
procedure gst_query_set_selectable(query:PGstQuery; selectable:Tgboolean);cdecl;external;
procedure gst_query_parse_selectable(query:PGstQuery; selectable:Pgboolean);cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstQuery, gst_query_unref) }
{$endif}
{ __GST_QUERY_H__  }

implementation

{ was #define dname def_expr }
function GST_QUERY_TYPE_BOTH : TGstQueryTypeFlags;
  begin
    GST_QUERY_TYPE_BOTH:=TGstQueryTypeFlags(GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_QUERY(obj : longint) : longint;
begin
  GST_IS_QUERY:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_QUERY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_QUERY_CAST(obj : longint) : PGstQuery;
begin
  GST_QUERY_CAST:=PGstQuery(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_QUERY(obj : longint) : longint;
begin
  GST_QUERY:=GST_QUERY_CAST(obj);
end;


end.
