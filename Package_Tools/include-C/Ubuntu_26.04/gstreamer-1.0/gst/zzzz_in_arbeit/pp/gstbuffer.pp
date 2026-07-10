
unit gstbuffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstbuffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstbuffer
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
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
Pgpointer  = ^gpointer;
Pgsize  = ^gsize;
PGstAllocationParams  = ^GstAllocationParams;
PGstAllocator  = ^GstAllocator;
PGstBuffer  = ^GstBuffer;
PGstBufferCopyFlags  = ^GstBufferCopyFlags;
PGstBufferFlags  = ^GstBufferFlags;
PGstBufferMapInfo  = ^GstBufferMapInfo;
PGstBufferPool  = ^GstBufferPool;
PGstCaps  = ^GstCaps;
PGstCustomMeta  = ^GstCustomMeta;
PGstMapInfo  = ^GstMapInfo;
PGstMemory  = ^GstMemory;
PGstMeta  = ^GstMeta;
PGstMetaInfo  = ^GstMetaInfo;
PGstParentBufferMeta  = ^GstParentBufferMeta;
PGstReferenceTimestampMeta  = ^GstReferenceTimestampMeta;
PGstStructure  = ^GstStructure;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *
 * gstbuffer.h: Header for GstBuffer object
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
{$ifndef __GST_BUFFER_H__}
{$define __GST_BUFFER_H__}
{$include <gst/gstminiobject.h>}
{$include <gst/gstclock.h>}
{$include <gst/gstallocator.h>}
{$include <gst/gstcaps.h>}
  var
    _gst_buffer_type : TGType;cvar;external;
type
{$include <gst/gstmeta.h>}

const
  GST_TYPE_BUFFER = _gst_buffer_type;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_IS_BUFFER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BUFFER_CAST(obj : longint) : PGstBuffer;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER(obj : longint) : longint;

{*
 * GST_BUFFER_FLAGS:
 * @buf: a #GstBuffer.
 *
 * Returns a flags word containing #GstBufferFlags flags set on this buffer.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_FLAGS(buf : longint) : longint;

{*
 * GST_BUFFER_FLAG_IS_SET:
 * @buf: a #GstBuffer.
 * @flag: the #GstBufferFlags flag to check.
 *
 * Gives the status of a specific flag on a buffer.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_FLAG_IS_SET(buf,flag : longint) : longint;

{*
 * GST_BUFFER_FLAG_SET:
 * @buf: a #GstBuffer.
 * @flag: the #GstBufferFlags flag to set.
 *
 * Sets a buffer flag on a buffer.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_FLAG_SET(buf,flag : longint) : longint;

{*
 * GST_BUFFER_FLAG_UNSET:
 * @buf: a #GstBuffer.
 * @flag: the #GstBufferFlags flag to clear.
 *
 * Clears a buffer flag.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_FLAG_UNSET(buf,flag : longint) : longint;

{*
 * GST_BUFFER_PTS:
 * @buf: a #GstBuffer.:
 *
 * Gets the presentation timestamp (pts) in nanoseconds (as a #GstClockTime)
 * of the data in the buffer. This is the timestamp when the media should be
 * presented to the user.
 *
 * Value will be %GST_CLOCK_TIME_NONE if the pts is unknown.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_PTS(buf : longint) : longint;

{*
 * GST_BUFFER_DTS:
 * @buf: a #GstBuffer.
 *
 * Gets the decoding timestamp (dts) in nanoseconds (as a #GstClockTime)
 * of the data in the buffer. This is the timestamp when the media should be
 * decoded or processed otherwise.
 *
 * Value will be %GST_CLOCK_TIME_NONE if the dts is unknown.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DTS(buf : longint) : longint;

{*
 * GST_BUFFER_DTS_OR_PTS:
 * @buf: a #GstBuffer.
 *
 * Returns the buffer decoding timestamp (dts) if valid, else the buffer
 * presentation time (pts)
 *
 * Since: 1.8
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DTS_OR_PTS(buf : longint) : longint;

{*
 * GST_BUFFER_DURATION:
 * @buf: a #GstBuffer.
 *
 * Gets the duration in nanoseconds (as a #GstClockTime) of the data in the buffer.
 *
 * Value will be %GST_CLOCK_TIME_NONE if the duration is unknown.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DURATION(buf : longint) : longint;

{*
 * GST_BUFFER_OFFSET:
 * @buf: a #GstBuffer.
 *
 * Gets the offset in the source file of the beginning of this buffer.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_OFFSET(buf : longint) : longint;

{*
 * GST_BUFFER_OFFSET_END:
 * @buf: a #GstBuffer.
 *
 * Gets the offset in the source file of the end of this buffer.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_OFFSET_END(buf : longint) : longint;

{*
 * GST_BUFFER_OFFSET_NONE:
 *
 * Constant for no-offset return results.
  }
{ was #define dname def_expr }
function GST_BUFFER_OFFSET_NONE : Tguint64;  

{*
 * GST_BUFFER_DURATION_IS_VALID:
 * @buffer: a #GstBuffer
 *
 * Tests if the duration is known.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DURATION_IS_VALID(buffer : longint) : longint;

{*
 * GST_BUFFER_PTS_IS_VALID:
 * @buffer: a #GstBuffer
 *
 * Tests if the pts is known.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_PTS_IS_VALID(buffer : longint) : longint;

{*
 * GST_BUFFER_DTS_IS_VALID:
 * @buffer: a #GstBuffer
 *
 * Tests if the dts is known.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DTS_IS_VALID(buffer : longint) : longint;

{*
 * GST_BUFFER_OFFSET_IS_VALID:
 * @buffer: a #GstBuffer
 *
 * Tests if the start offset is known.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_OFFSET_IS_VALID(buffer : longint) : longint;

{*
 * GST_BUFFER_OFFSET_END_IS_VALID:
 * @buffer: a #GstBuffer
 *
 * Tests if the end offset is known.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_OFFSET_END_IS_VALID(buffer : longint) : longint;

{*
 * GST_BUFFER_IS_DISCONT:
 * @buffer: a #GstBuffer
 *
 * Tests if the buffer marks a discontinuity in the stream.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_IS_DISCONT(buffer : longint) : longint;

{*
 * GstBufferFlags:
 * @GST_BUFFER_FLAG_LIVE:          the buffer is live data and should be discarded in
 *                                 the PAUSED state.
 * @GST_BUFFER_FLAG_DECODE_ONLY:   the buffer contains data that should be dropped
 *                                 because it will be clipped against the segment
 *                                 boundaries or because it does not contain data
 *                                 that should be shown to the user.
 * @GST_BUFFER_FLAG_DISCONT:       the buffer marks a data discontinuity in the stream.
 *                                 This typically occurs after a seek or a dropped buffer
 *                                 from a live or network source.
 * @GST_BUFFER_FLAG_RESYNC:        the buffer timestamps might have a discontinuity
 *                                 and this buffer is a good point to resynchronize.
 * @GST_BUFFER_FLAG_CORRUPTED:     the buffer data is corrupted.
 * @GST_BUFFER_FLAG_MARKER:        the buffer contains a media specific marker. for
 *                                 video this is the end of a frame boundary, for audio
 *                                 this is the start of a talkspurt. for RTP
 *                                 packets this matches the marker flag in the
 *                                 RTP packet header.
 * @GST_BUFFER_FLAG_HEADER:        the buffer contains header information that is
 *                                 needed to decode the following data.
 * @GST_BUFFER_FLAG_GAP:           the buffer has been created to fill a gap in the
 *                                 stream and contains media neutral data (elements can
 *                                 switch to optimized code path that ignores the buffer
 *                                 content).
 * @GST_BUFFER_FLAG_DROPPABLE:     the buffer can be dropped without breaking the
 *                                 stream, for example to reduce bandwidth.
 * @GST_BUFFER_FLAG_DELTA_UNIT:    this unit cannot be decoded independently.
 * @GST_BUFFER_FLAG_TAG_MEMORY:    this flag is set when memory of the buffer
 *                                 is added/removed
 * @GST_BUFFER_FLAG_LAST:          additional media specific flags can be added starting from
 *                                 this flag.
 *
 * A set of buffer flags used to describe properties of a #GstBuffer.
  }
{*
   * GST_BUFFER_FLAG_SYNC_AFTER:
   *
   * Elements which write to disk or permanent storage should ensure the data
   * is synced after writing the contents of this buffer.
   *
   * Since: 1.6
    }
{*
   * GST_BUFFER_FLAG_NON_DROPPABLE:
   *
   * This buffer is important and should not be dropped.
   *
   * This can be used to mark important buffers, e.g. to flag RTP packets
   * carrying keyframes or codec setup data for RTP Forward Error Correction
   * purposes, or to prevent still video frames from being dropped by elements
   * due to QoS.
   *
   * Since: 1.14
    }
type
  PGstBufferFlags = ^TGstBufferFlags;
  TGstBufferFlags =  Longint;
  Const
    GST_BUFFER_FLAG_LIVE = GST_MINI_OBJECT_FLAG_LAST shl 0;
    GST_BUFFER_FLAG_DECODE_ONLY = GST_MINI_OBJECT_FLAG_LAST shl 1;
    GST_BUFFER_FLAG_DISCONT = GST_MINI_OBJECT_FLAG_LAST shl 2;
    GST_BUFFER_FLAG_RESYNC = GST_MINI_OBJECT_FLAG_LAST shl 3;
    GST_BUFFER_FLAG_CORRUPTED = GST_MINI_OBJECT_FLAG_LAST shl 4;
    GST_BUFFER_FLAG_MARKER = GST_MINI_OBJECT_FLAG_LAST shl 5;
    GST_BUFFER_FLAG_HEADER = GST_MINI_OBJECT_FLAG_LAST shl 6;
    GST_BUFFER_FLAG_GAP = GST_MINI_OBJECT_FLAG_LAST shl 7;
    GST_BUFFER_FLAG_DROPPABLE = GST_MINI_OBJECT_FLAG_LAST shl 8;
    GST_BUFFER_FLAG_DELTA_UNIT = GST_MINI_OBJECT_FLAG_LAST shl 9;
    GST_BUFFER_FLAG_TAG_MEMORY = GST_MINI_OBJECT_FLAG_LAST shl 10;
    GST_BUFFER_FLAG_SYNC_AFTER = GST_MINI_OBJECT_FLAG_LAST shl 11;
    GST_BUFFER_FLAG_NON_DROPPABLE = GST_MINI_OBJECT_FLAG_LAST shl 12;
    GST_BUFFER_FLAG_LAST = GST_MINI_OBJECT_FLAG_LAST shl 16;
;
{*
 * GstBuffer:
 * @mini_object: the parent structure
 * @pool: pointer to the pool owner of the buffer
 * @pts: presentation timestamp of the buffer, can be #GST_CLOCK_TIME_NONE when the
 *     pts is not known or relevant. The pts contains the timestamp when the
 *     media should be presented to the user.
 * @dts: decoding timestamp of the buffer, can be #GST_CLOCK_TIME_NONE when the
 *     dts is not known or relevant. The dts contains the timestamp when the
 *     media should be processed.
 * @duration: duration in time of the buffer data, can be #GST_CLOCK_TIME_NONE
 *     when the duration is not known or relevant.
 * @offset: a media specific offset for the buffer data.
 *     For video frames, this is the frame number of this buffer.
 *     For audio samples, this is the offset of the first sample in this buffer.
 *     For file data or compressed data this is the byte offset of the first
 *       byte in this buffer.
 * @offset_end: the last offset contained in this buffer. It has the same
 *     format as @offset.
 *
 * The structure of a #GstBuffer. Use the associated macros to access the public
 * variables.
  }
{< public > }{ with COW  }
{ timestamp  }
{ media specific offset  }
type
  PGstBuffer = ^TGstBuffer;
  TGstBuffer = record
      mini_object : TGstMiniObject;
      pool : PGstBufferPool;
      pts : TGstClockTime;
      dts : TGstClockTime;
      duration : TGstClockTime;
      offset : Tguint64;
      offset_end : Tguint64;
    end;


function gst_buffer_get_type:TGType;cdecl;external;
function gst_buffer_get_max_memory:Tguint;cdecl;external;
{ allocation  }
function gst_buffer_new:PGstBuffer;cdecl;external;
function gst_buffer_new_allocate(allocator:PGstAllocator; size:Tgsize; params:PGstAllocationParams):PGstBuffer;cdecl;external;
function gst_buffer_new_wrapped_full(flags:TGstMemoryFlags; data:Tgpointer; maxsize:Tgsize; offset:Tgsize; size:Tgsize; 
           user_data:Tgpointer; notify:TGDestroyNotify):PGstBuffer;cdecl;external;
function gst_buffer_new_wrapped(data:Tgpointer; size:Tgsize):PGstBuffer;cdecl;external;
function gst_buffer_new_wrapped_bytes(bytes:PGBytes):PGstBuffer;cdecl;external;
function gst_buffer_new_memdup(data:Tgconstpointer; size:Tgsize):PGstBuffer;cdecl;external;
{ memory blocks  }
function gst_buffer_n_memory(buffer:PGstBuffer):Tguint;cdecl;external;
procedure gst_buffer_insert_memory(buffer:PGstBuffer; idx:Tgint; mem:PGstMemory);cdecl;external;
procedure gst_buffer_replace_memory_range(buffer:PGstBuffer; idx:Tguint; length:Tgint; mem:PGstMemory);cdecl;external;
function gst_buffer_peek_memory(buffer:PGstBuffer; idx:Tguint):PGstMemory;cdecl;external;
function gst_buffer_get_memory_range(buffer:PGstBuffer; idx:Tguint; length:Tgint):PGstMemory;cdecl;external;
procedure gst_buffer_remove_memory_range(buffer:PGstBuffer; idx:Tguint; length:Tgint);cdecl;external;
procedure gst_buffer_prepend_memory(buffer:PGstBuffer; mem:PGstMemory);cdecl;external;
procedure gst_buffer_append_memory(buffer:PGstBuffer; mem:PGstMemory);cdecl;external;
procedure gst_buffer_replace_memory(buffer:PGstBuffer; idx:Tguint; mem:PGstMemory);cdecl;external;
procedure gst_buffer_replace_all_memory(buffer:PGstBuffer; mem:PGstMemory);cdecl;external;
function gst_buffer_get_memory(buffer:PGstBuffer; idx:Tguint):PGstMemory;cdecl;external;
function gst_buffer_get_all_memory(buffer:PGstBuffer):PGstMemory;cdecl;external;
procedure gst_buffer_remove_memory(buffer:PGstBuffer; idx:Tguint);cdecl;external;
procedure gst_buffer_remove_all_memory(buffer:PGstBuffer);cdecl;external;
function gst_buffer_find_memory(buffer:PGstBuffer; offset:Tgsize; size:Tgsize; idx:Pguint; length:Pguint; 
           skip:Pgsize):Tgboolean;cdecl;external;
function gst_buffer_is_memory_range_writable(buffer:PGstBuffer; idx:Tguint; length:Tgint):Tgboolean;cdecl;external;
function gst_buffer_is_all_memory_writable(buffer:PGstBuffer):Tgboolean;cdecl;external;
function gst_buffer_fill(buffer:PGstBuffer; offset:Tgsize; src:Tgconstpointer; size:Tgsize):Tgsize;cdecl;external;
function gst_buffer_extract(buffer:PGstBuffer; offset:Tgsize; dest:Tgpointer; size:Tgsize):Tgsize;cdecl;external;
function gst_buffer_memcmp(buffer:PGstBuffer; offset:Tgsize; mem:Tgconstpointer; size:Tgsize):Tgint;cdecl;external;
function gst_buffer_memset(buffer:PGstBuffer; offset:Tgsize; val:Tguint8; size:Tgsize):Tgsize;cdecl;external;
function gst_buffer_get_sizes_range(buffer:PGstBuffer; idx:Tguint; length:Tgint; offset:Pgsize; maxsize:Pgsize):Tgsize;cdecl;external;
function gst_buffer_resize_range(buffer:PGstBuffer; idx:Tguint; length:Tgint; offset:Tgssize; size:Tgssize):Tgboolean;cdecl;external;
function gst_buffer_get_sizes(buffer:PGstBuffer; offset:Pgsize; maxsize:Pgsize):Tgsize;cdecl;external;
function gst_buffer_get_size(buffer:PGstBuffer):Tgsize;cdecl;external;
procedure gst_buffer_resize(buffer:PGstBuffer; offset:Tgssize; size:Tgssize);cdecl;external;
procedure gst_buffer_set_size(buffer:PGstBuffer; size:Tgssize);cdecl;external;
function gst_buffer_map_range(buffer:PGstBuffer; idx:Tguint; length:Tgint; info:PGstMapInfo; flags:TGstMapFlags):Tgboolean;cdecl;external;
function gst_buffer_map(buffer:PGstBuffer; info:PGstMapInfo; flags:TGstMapFlags):Tgboolean;cdecl;external;
procedure gst_buffer_unmap(buffer:PGstBuffer; info:PGstMapInfo);cdecl;external;
procedure gst_buffer_extract_dup(buffer:PGstBuffer; offset:Tgsize; size:Tgsize; dest:Pgpointer; dest_size:Pgsize);cdecl;external;
function gst_buffer_get_flags(buffer:PGstBuffer):TGstBufferFlags;cdecl;external;
function gst_buffer_has_flags(buffer:PGstBuffer; flags:TGstBufferFlags):Tgboolean;cdecl;external;
function gst_buffer_set_flags(buffer:PGstBuffer; flags:TGstBufferFlags):Tgboolean;cdecl;external;
function gst_buffer_unset_flags(buffer:PGstBuffer; flags:TGstBufferFlags):Tgboolean;cdecl;external;
function gst_buffer_ref(buf:PGstBuffer):PGstBuffer;cdecl;external;
procedure gst_buffer_unref(buf:PGstBuffer);cdecl;external;
procedure gst_clear_buffer(buf_ptr:PPGstBuffer);cdecl;external;
(* Const before type ignored *)
function gst_buffer_copy(buf:PGstBuffer):PGstBuffer;cdecl;external;
(* Const before type ignored *)
function gst_buffer_copy_deep(buf:PGstBuffer):PGstBuffer;cdecl;external;
{*
 * GstBufferCopyFlags:
 * @GST_BUFFER_COPY_NONE: copy nothing
 * @GST_BUFFER_COPY_FLAGS: flag indicating that buffer flags should be copied
 * @GST_BUFFER_COPY_TIMESTAMPS: flag indicating that buffer pts, dts,
 *   duration, offset and offset_end should be copied
 * @GST_BUFFER_COPY_MEMORY: flag indicating that buffer memory should be reffed
 *   and appended to already existing memory. Unless the memory is marked as
 *   NO_SHARE, no actual copy of the memory is made but it is simply reffed.
 *   Add @GST_BUFFER_COPY_DEEP to force a real copy.
 * @GST_BUFFER_COPY_MERGE: flag indicating that buffer memory should be
 *   merged
 * @GST_BUFFER_COPY_META: flag indicating that buffer meta should be
 *   copied
 *
 * A set of flags that can be provided to the gst_buffer_copy_into()
 * function to specify which items should be copied.
  }
{*
   * GST_BUFFER_COPY_DEEP:
   *
   * flag indicating that memory should always be copied instead of reffed
   *
   * Since: 1.2
    }
type
  PGstBufferCopyFlags = ^TGstBufferCopyFlags;
  TGstBufferCopyFlags =  Longint;
  Const
    GST_BUFFER_COPY_NONE = 0;
    GST_BUFFER_COPY_FLAGS = 1 shl 0;
    GST_BUFFER_COPY_TIMESTAMPS = 1 shl 1;
    GST_BUFFER_COPY_META = 1 shl 2;
    GST_BUFFER_COPY_MEMORY = 1 shl 3;
    GST_BUFFER_COPY_MERGE = 1 shl 4;
    GST_BUFFER_COPY_DEEP = 1 shl 5;
;
{*
 * GST_BUFFER_COPY_METADATA: (value 7) (type GstBufferCopyFlags)
 *
 * Combination of all possible metadata fields that can be copied with
 * gst_buffer_copy_into().
  }

{ was #define dname def_expr }
function GST_BUFFER_COPY_METADATA : TGstBufferCopyFlags;  

{*
 * GST_BUFFER_COPY_ALL: (value 15) (type GstBufferCopyFlags)
 *
 * Combination of all possible fields that can be copied with
 * gst_buffer_copy_into().
  }
{ was #define dname def_expr }
function GST_BUFFER_COPY_ALL : TGstBufferCopyFlags;  

{ copies memory or metadata into newly allocated buffer  }
function gst_buffer_copy_into(dest:PGstBuffer; src:PGstBuffer; flags:TGstBufferCopyFlags; offset:Tgsize; size:Tgsize):Tgboolean;cdecl;external;
function gst_buffer_replace(obuf:PPGstBuffer; nbuf:PGstBuffer):Tgboolean;cdecl;external;
function gst_buffer_steal(old_buffer:PPGstBuffer):PGstBuffer;cdecl;external;
function gst_buffer_take(old_buffer:PPGstBuffer; new_buffer:PGstBuffer):Tgboolean;cdecl;external;
function gst_buffer_make_writable(buf:PGstBuffer):PGstBuffer;cdecl;external;
(* Const before type ignored *)
function gst_buffer_is_writable(buf:PGstBuffer):Tgboolean;cdecl;external;
{ creating a region  }
function gst_buffer_copy_region(parent:PGstBuffer; flags:TGstBufferCopyFlags; offset:Tgsize; size:Tgsize):PGstBuffer;cdecl;external;
{ append two buffers  }
function gst_buffer_append_region(buf1:PGstBuffer; buf2:PGstBuffer; offset:Tgssize; size:Tgssize):PGstBuffer;cdecl;external;
function gst_buffer_append(buf1:PGstBuffer; buf2:PGstBuffer):PGstBuffer;cdecl;external;
{ metadata  }
{$include <gst/gstmeta.h>}
{*
 * GstBufferForeachMetaFunc:
 * @buffer: a #GstBuffer
 * @meta: (inout) (nullable): a pointer to a #GstMeta
 * @user_data: user data passed to gst_buffer_foreach_meta()
 *
 * A function that will be called from gst_buffer_foreach_meta(). The @meta
 * field will point to a the reference of the meta.
 *
 * @buffer should not be modified from this callback.
 *
 * When this function returns %TRUE, the next meta will be
 * returned. When %FALSE is returned, gst_buffer_foreach_meta() will return.
 *
 * When @meta is set to %NULL, the item will be removed from the buffer.
 *
 * Returns: %FALSE when gst_buffer_foreach_meta() should stop
  }
type

  TGstBufferForeachMetaFunc = function (buffer:PGstBuffer; meta:PPGstMeta; user_data:Tgpointer):Tgboolean;cdecl;

function gst_buffer_get_meta(buffer:PGstBuffer; api:TGType):PGstMeta;cdecl;external;
function gst_buffer_get_n_meta(buffer:PGstBuffer; api_type:TGType):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_buffer_add_meta(buffer:PGstBuffer; info:PGstMetaInfo; params:Tgpointer):PGstMeta;cdecl;external;
function gst_buffer_remove_meta(buffer:PGstBuffer; meta:PGstMeta):Tgboolean;cdecl;external;
function gst_buffer_iterate_meta(buffer:PGstBuffer; state:Pgpointer):PGstMeta;cdecl;external;
function gst_buffer_iterate_meta_filtered(buffer:PGstBuffer; state:Pgpointer; meta_api_type:TGType):PGstMeta;cdecl;external;
function gst_buffer_foreach_meta(buffer:PGstBuffer; func:TGstBufferForeachMetaFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_buffer_add_custom_meta(buffer:PGstBuffer; name:Pgchar):PGstCustomMeta;cdecl;external;
(* Const before type ignored *)
function gst_buffer_get_custom_meta(buffer:PGstBuffer; name:Pgchar):PGstCustomMeta;cdecl;external;
{*
 * gst_value_set_buffer:
 * @v: a #GValue to receive the data
 * @b: (transfer none): a #GstBuffer to assign to the GstValue
 *
 * Sets @b as the value of @v.  Caller retains reference to buffer.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_set_buffer(v,b : longint) : longint;

{*
 * gst_value_take_buffer:
 * @v: a #GValue to receive the data
 * @b: (transfer full): a #GstBuffer to assign to the GstValue
 *
 * Sets @b as the value of @v.  Caller gives away reference to buffer.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_take_buffer(v,b : longint) : longint;

{*
 * gst_value_get_buffer:
 * @v: a #GValue to query
 *
 * Receives a #GstBuffer as the value of @v. Does not return a reference to
 * the buffer, so the pointer is only valid for as long as the caller owns
 * a reference to @v.
 *
 * Returns: (transfer none): buffer
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_get_buffer(v : longint) : longint;

type
{*
 * GstParentBufferMeta:
 * @parent: the parent #GstMeta structure
 * @buffer: the #GstBuffer on which a reference is being held.
 *
 * The #GstParentBufferMeta is a #GstMeta which can be attached to a #GstBuffer
 * to hold a reference to another buffer that is only released when the child
 * #GstBuffer is released.
 *
 * Typically, #GstParentBufferMeta is used when the child buffer is directly
 * using the #GstMemory of the parent buffer, and wants to prevent the parent
 * buffer from being returned to a buffer pool until the #GstMemory is available
 * for re-use.
 *
 * Since: 1.6
  }
{< public > }
  PGstParentBufferMeta = ^TGstParentBufferMeta;
  TGstParentBufferMeta = record
      parent : TGstMeta;cdecl;
      buffer : PGstBuffer;
    end;


function gst_parent_buffer_meta_api_get_type:TGType;cdecl;external;
{$ifndef GST_DISABLE_DEPRECATED}

const
  GST_TYPE_PARENT_BUFFER_META_API_TYPE = GST_PARENT_BUFFER_META_API_TYPE;  
{$endif}

{ was #define dname def_expr }
function GST_PARENT_BUFFER_META_API_TYPE : longint; { return type might be wrong }

{*
 * gst_buffer_get_parent_buffer_meta:
 * @b: a #GstBuffer
 *
 * Finds and returns a #GstParentBufferMeta if one exists on the
 * buffer
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_parent_buffer_meta(b : longint) : PGstParentBufferMeta;

(* Const before type ignored *)
function gst_parent_buffer_meta_get_info:PGstMetaInfo;cdecl;external;
{ was #define dname def_expr }
function GST_PARENT_BUFFER_META_INFO : longint; { return type might be wrong }

{ implementation  }
function gst_buffer_add_parent_buffer_meta(buffer:PGstBuffer; ref:PGstBuffer):PGstParentBufferMeta;cdecl;external;
type
{*
 * GstReferenceTimestampMeta:
 * @parent: the parent #GstMeta structure
 * @reference: identifier for the timestamp reference.
 * @timestamp: timestamp
 * @duration: duration, or %GST_CLOCK_TIME_NONE
 * @info: (nullable): optional additional information about the timestamp
 *
 * #GstReferenceTimestampMeta can be used to attach alternative timestamps and
 * possibly durations to a #GstBuffer. These are generally not according to
 * the pipeline clock and could be e.g. the NTP timestamp when the media was
 * captured.
 *
 * The reference is stored as a #GstCaps in @reference. Examples of valid
 * references would be
 *
 *  * `timestamp/x-drivername-stream`: for timestamps that are locally
 *    generated by some driver named `drivername` when generating the stream,
 *    e.g. based on a frame counter
 *  * `timestamp/x-ntp, host=pool.ntp.org, port=123`: for timestamps based on a
 *    specific NTP server. Note that the host/port parameters might not always
 *    be given.
 *  * `timestamp/x-ptp, version=IEEE1588-2008, domain=1`: for timestamps based
 *    on a given PTP clock.
 *  * `timestamp/x-unix`: for timestamps based on the UNIX epoch according to
 *    the local clock.
 *
 * Since 1.24 it can be serialized using gst_meta_serialize() and
 * gst_meta_deserialize().
 *
 * Since 1.28 additional information about the timestamp can be provided via the
 * optional @info structure. This should only be used for information about the
 * timestamp and not for information about the clock source. The latter should
 * be stored in the @reference instead.
 *
 * Interpretation of the fields of @info depends on the @reference.
 *
 * Since: 1.14
  }
{< public > }
{*
   * GstReferenceTimestampMeta.info:
   *
   * Additional information about the timestamp.
   *
   * Since: 1.28
    }
  PGstReferenceTimestampMeta = ^TGstReferenceTimestampMeta;
  TGstReferenceTimestampMeta = record
      parent : TGstMeta;
      reference : PGstCaps;
      timestamp : TGstClockTime;
      duration : TGstClockTime;
      info : PGstStructure;
    end;


function gst_reference_timestamp_meta_api_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_REFERENCE_TIMESTAMP_META_API_TYPE : longint; { return type might be wrong }

(* Const before type ignored *)
function gst_reference_timestamp_meta_get_info:PGstMetaInfo;cdecl;external;
{ was #define dname def_expr }
function GST_REFERENCE_TIMESTAMP_META_INFO : longint; { return type might be wrong }

{ implementation  }
function gst_buffer_add_reference_timestamp_meta(buffer:PGstBuffer; reference:PGstCaps; timestamp:TGstClockTime; duration:TGstClockTime):PGstReferenceTimestampMeta;cdecl;external;
function gst_buffer_get_reference_timestamp_meta(buffer:PGstBuffer; reference:PGstCaps):PGstReferenceTimestampMeta;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstBuffer, gst_buffer_unref) }
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstBufferPool, gst_object_unref) }
{*
 * GstBufferMapInfo: (skip):
 *
 * Alias for #GstMapInfo to be used with g_auto():
 * ```c
 * void my_func(GstBuffer *buf)
 * 
 *   g_auto(GstBufferMapInfo) map = GST_MAP_INFO_INIT;
 *   if (!gst_buffer_map(buf, &map, GST_MAP_READWRITE))
 *     return;
 *   ...
 *   // No need to call gst_buffer_unmap()
 * 
 * ```
 *
 * See also #GstMemoryMapInfo.
 *
 * Since: 1.22
 *
 * Deprecated: 1.28: Use #GstMapInfo instead.
  }
type
  PGstBufferMapInfo = ^TGstBufferMapInfo;
  TGstBufferMapInfo = TGstMapInfo;
{GST_DEPRECATED_TYPE_FOR(GstMapInfo); }
{$endif}
{ __GST_BUFFER_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BUFFER(obj : longint) : longint;
begin
  GST_IS_BUFFER:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_BUFFER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BUFFER_CAST(obj : longint) : PGstBuffer;
begin
  GST_BUFFER_CAST:=PGstBuffer(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER(obj : longint) : longint;
begin
  GST_BUFFER:=GST_BUFFER_CAST(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_FLAGS(buf : longint) : longint;
begin
  GST_BUFFER_FLAGS:=GST_MINI_OBJECT_FLAGS(buf);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_FLAG_IS_SET(buf,flag : longint) : longint;
begin
  GST_BUFFER_FLAG_IS_SET:=GST_MINI_OBJECT_FLAG_IS_SET(buf,flag);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_FLAG_SET(buf,flag : longint) : longint;
begin
  GST_BUFFER_FLAG_SET:=GST_MINI_OBJECT_FLAG_SET(buf,flag);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_FLAG_UNSET(buf,flag : longint) : longint;
begin
  GST_BUFFER_FLAG_UNSET:=GST_MINI_OBJECT_FLAG_UNSET(buf,flag);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_PTS(buf : longint) : longint;
begin
  GST_BUFFER_PTS:=(GST_BUFFER_CAST(buf))^.pts;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DTS(buf : longint) : longint;
begin
  GST_BUFFER_DTS:=(GST_BUFFER_CAST(buf))^.dts;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DTS_OR_PTS(buf : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if GST_BUFFER_DTS_IS_VALID(buf) then
    if_local1:=GST_BUFFER_DTS(buf)
  else
    if_local1:=GST_BUFFER_PTS(buf);
  GST_BUFFER_DTS_OR_PTS:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DURATION(buf : longint) : longint;
begin
  GST_BUFFER_DURATION:=(GST_BUFFER_CAST(buf))^.duration;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_OFFSET(buf : longint) : longint;
begin
  GST_BUFFER_OFFSET:=(GST_BUFFER_CAST(buf))^.offset;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_OFFSET_END(buf : longint) : longint;
begin
  GST_BUFFER_OFFSET_END:=(GST_BUFFER_CAST(buf))^.offset_end;
end;

{ was #define dname def_expr }
function GST_BUFFER_OFFSET_NONE : Tguint64;
  begin
    GST_BUFFER_OFFSET_NONE:=Tguint64(-(1));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DURATION_IS_VALID(buffer : longint) : longint;
begin
  GST_BUFFER_DURATION_IS_VALID:=GST_CLOCK_TIME_IS_VALID(GST_BUFFER_DURATION(buffer));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_PTS_IS_VALID(buffer : longint) : longint;
begin
  GST_BUFFER_PTS_IS_VALID:=GST_CLOCK_TIME_IS_VALID(GST_BUFFER_PTS(buffer));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DTS_IS_VALID(buffer : longint) : longint;
begin
  GST_BUFFER_DTS_IS_VALID:=GST_CLOCK_TIME_IS_VALID(GST_BUFFER_DTS(buffer));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_OFFSET_IS_VALID(buffer : longint) : longint;
begin
  GST_BUFFER_OFFSET_IS_VALID:=(GST_BUFFER_OFFSET(buffer))<>GST_BUFFER_OFFSET_NONE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_OFFSET_END_IS_VALID(buffer : longint) : longint;
begin
  GST_BUFFER_OFFSET_END_IS_VALID:=(GST_BUFFER_OFFSET_END(buffer))<>GST_BUFFER_OFFSET_NONE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_IS_DISCONT(buffer : longint) : longint;
begin
  GST_BUFFER_IS_DISCONT:=GST_BUFFER_FLAG_IS_SET(buffer,GST_BUFFER_FLAG_DISCONT);
end;

{ was #define dname def_expr }
function GST_BUFFER_COPY_METADATA : TGstBufferCopyFlags;
  begin
    GST_BUFFER_COPY_METADATA:=TGstBufferCopyFlags((GST_BUFFER_COPY_FLAGS or GST_BUFFER_COPY_TIMESTAMPS) or GST_BUFFER_COPY_META);
  end;

{ was #define dname def_expr }
function GST_BUFFER_COPY_ALL : TGstBufferCopyFlags;
  begin
    GST_BUFFER_COPY_ALL:=TGstBufferCopyFlags(GST_BUFFER_COPY_METADATA or GST_BUFFER_COPY_MEMORY);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_set_buffer(v,b : longint) : longint;
begin
  gst_value_set_buffer:=g_value_set_boxed(v,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_take_buffer(v,b : longint) : longint;
begin
  gst_value_take_buffer:=g_value_take_boxed(v,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_get_buffer(v : longint) : longint;
begin
  gst_value_get_buffer:=GST_BUFFER_CAST(g_value_get_boxed(v));
end;

{ was #define dname def_expr }
function GST_PARENT_BUFFER_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_PARENT_BUFFER_META_API_TYPE:=gst_parent_buffer_meta_api_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_parent_buffer_meta(b : longint) : PGstParentBufferMeta;
begin
  gst_buffer_get_parent_buffer_meta:=PGstParentBufferMeta(gst_buffer_get_meta(b,GST_PARENT_BUFFER_META_API_TYPE));
end;

{ was #define dname def_expr }
function GST_PARENT_BUFFER_META_INFO : longint; { return type might be wrong }
  begin
    GST_PARENT_BUFFER_META_INFO:=gst_parent_buffer_meta_get_info;
  end;

{ was #define dname def_expr }
function GST_REFERENCE_TIMESTAMP_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_REFERENCE_TIMESTAMP_META_API_TYPE:=gst_reference_timestamp_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_REFERENCE_TIMESTAMP_META_INFO : longint; { return type might be wrong }
  begin
    GST_REFERENCE_TIMESTAMP_META_INFO:=gst_reference_timestamp_meta_get_info;
  end;


end.
