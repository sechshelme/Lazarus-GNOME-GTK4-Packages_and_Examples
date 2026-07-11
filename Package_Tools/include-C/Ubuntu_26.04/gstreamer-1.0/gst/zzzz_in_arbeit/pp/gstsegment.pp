
unit gstsegment;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstsegment.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstsegment.h
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
PGstSeekFlags  = ^GstSeekFlags;
PGstSeekType  = ^GstSeekType;
PGstSegment  = ^GstSegment;
PGstSegmentFlags  = ^GstSegmentFlags;
Pguint64  = ^guint64;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2005 Wim Taymans <wim@fluendo.com>
 *
 * gstsegment.h: Header for GstSegment subsystem
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
{$ifndef __GST_SEGMENT_H__}
{$define __GST_SEGMENT_H__}
{$include <gst/gstformat.h>}
{$ifdef _MSC_VER}
(** unsupported pragma#pragma warning(disable: 5287)*)
{$endif}

{ was #define dname def_expr }
function GST_TYPE_SEGMENT : longint; { return type might be wrong }

type
{*
 * GstSeekType:
 * @GST_SEEK_TYPE_NONE: no change in position is required
 * @GST_SEEK_TYPE_SET: absolute position is requested
 * @GST_SEEK_TYPE_END: relative position to duration is requested
 *
 * The different types of seek events. When constructing a seek event with
 * gst_event_new_seek() or when doing gst_segment_do_seek ().
  }
{ one of these  }

  PGstSeekType = ^TGstSeekType;
  TGstSeekType =  Longint;
  Const
    GST_SEEK_TYPE_NONE = 0;
    GST_SEEK_TYPE_SET = 1;
    GST_SEEK_TYPE_END = 2;
;
{*
 * GstSeekFlags:
 * @GST_SEEK_FLAG_NONE: no flag
 * @GST_SEEK_FLAG_FLUSH: flush pipeline
 * @GST_SEEK_FLAG_ACCURATE: accurate position is requested, this might
 *                     be considerably slower for some formats.
 * @GST_SEEK_FLAG_KEY_UNIT: seek to the nearest keyframe. This might be
 *                     faster but less accurate.
 * @GST_SEEK_FLAG_SEGMENT: perform a segment seek.
 * @GST_SEEK_FLAG_TRICKMODE: when doing fast forward or fast reverse playback, allow
 *                     elements to skip frames instead of generating all
 *                     frames. (Since: 1.6)
 * @GST_SEEK_FLAG_SNAP_BEFORE: go to a location before the requested position,
 *                     if %GST_SEEK_FLAG_KEY_UNIT this means the keyframe at or before
 *                     the requested position the one at or before the seek target.
 * @GST_SEEK_FLAG_SNAP_AFTER: go to a location after the requested position,
 *                     if %GST_SEEK_FLAG_KEY_UNIT this means the keyframe at of after the
 *                     requested position.
 * @GST_SEEK_FLAG_SNAP_NEAREST: go to a position near the requested position,
 *                     if %GST_SEEK_FLAG_KEY_UNIT this means the keyframe closest
 *                     to the requested position, if both keyframes are at an equal
 *                     distance, behaves like %GST_SEEK_FLAG_SNAP_BEFORE.
 * @GST_SEEK_FLAG_TRICKMODE_KEY_UNITS: when doing fast forward or fast reverse
 *                     playback, request that elements only decode keyframes
 *                     and skip all other content, for formats that have
 *                     keyframes. (Since: 1.6)
 * @GST_SEEK_FLAG_TRICKMODE_FORWARD_PREDICTED: When doing fast forward or fast reverse
 *                     playback, request that elements only decode keyframes and
 *                     forward predicted frames and skip all other content (for example
 *                     B-Frames), for formats that have keyframes and forward predicted
 *                     frames. (Since: 1.18)
 * @GST_SEEK_FLAG_TRICKMODE_NO_AUDIO: when doing fast forward or fast reverse
 *                     playback, request that audio decoder elements skip
 *                     decoding and output only gap events or silence. (Since: 1.6)
 * @GST_SEEK_FLAG_INSTANT_RATE_CHANGE: Signals that a rate change should be
 *                     applied immediately. Only valid if start/stop position
 *                     are GST_CLOCK_TIME_NONE, the playback direction does not change
 *                     and the seek is not flushing. (Since: 1.18)
 * @GST_SEEK_FLAG_SKIP: Deprecated backward compatibility flag, replaced
 *                     by %GST_SEEK_FLAG_TRICKMODE
 *
 * Flags to be used with gst_element_seek() or gst_event_new_seek(). All flags
 * can be used together.
 *
 * A non flushing seek might take some time to perform as the currently
 * playing data in the pipeline will not be cleared.
 *
 * An accurate seek might be slower for formats that don't have any indexes
 * or timestamp markers in the stream. Specifying this flag might require a
 * complete scan of the file in those cases.
 *
 * When performing a segment seek: after the playback of the segment completes,
 * no EOS will be emitted by the element that performed the seek, but a
 * %GST_MESSAGE_SEGMENT_DONE message will be posted on the bus by the element.
 * When this message is posted, it is possible to send a new seek event to
 * continue playback. With this seek method it is possible to perform seamless
 * looping or simple linear editing.
 *
 * When only changing the playback rate and not the direction, the
 * %GST_SEEK_FLAG_INSTANT_RATE_CHANGE flag can be used for a non-flushing seek
 * to signal that the rate change should be applied immediately. This requires
 * special support in the seek handlers (e.g. demuxers) and any elements
 * synchronizing to the clock, and in general can't work in all cases (for example
 * UDP streaming where the delivery rate is controlled by a remote server). The
 * instant-rate-change mode supports changing the trickmode-related GST_SEEK_ flags,
 * but can't be used in conjunction with other seek flags that affect the new
 * playback position - as the playback position will not be changing.
 *
 * When doing fast forward (rate > 1.0) or fast reverse (rate < -1.0) trickmode
 * playback, the %GST_SEEK_FLAG_TRICKMODE flag can be used to instruct decoders
 * and demuxers to adjust the playback rate by skipping frames. This can improve
 * performance and decrease CPU usage because not all frames need to be decoded.
 *
 * Beyond that, the %GST_SEEK_FLAG_TRICKMODE_KEY_UNITS flag can be used to
 * request that decoders skip all frames except key units, and
 * %GST_SEEK_FLAG_TRICKMODE_NO_AUDIO flags can be used to request that audio
 * decoders do no decoding at all, and simple output silence.
 *
 * The %GST_SEEK_FLAG_SNAP_BEFORE flag can be used to snap to the previous
 * relevant location, and the %GST_SEEK_FLAG_SNAP_AFTER flag can be used to
 * select the next relevant location. If %GST_SEEK_FLAG_KEY_UNIT is specified,
 * the relevant location is a keyframe. If both flags are specified, the nearest
 * of these locations will be selected. If none are specified, the implementation is
 * free to select whichever it wants.
 *
 * The before and after here are in running time, so when playing backwards,
 * the next location refers to the one that will played in next, and not the
 * one that is located after in the actual source stream.
 *
 * Also see part-seeking.txt in the GStreamer design documentation for more
 * details on the meaning of these flags and the behaviour expected of
 * elements that handle them.
  }
{ FIXME 2.0: Remove _SKIP flag,
   * which was kept for backward compat when _TRICKMODE was added  }
{ Careful to restart next flag with 1<<7 here  }
type
  PGstSeekFlags = ^TGstSeekFlags;
  TGstSeekFlags =  Longint;
  Const
    GST_SEEK_FLAG_NONE = 0;
    GST_SEEK_FLAG_FLUSH = 1 shl 0;
    GST_SEEK_FLAG_ACCURATE = 1 shl 1;
    GST_SEEK_FLAG_KEY_UNIT = 1 shl 2;
    GST_SEEK_FLAG_SEGMENT = 1 shl 3;
    GST_SEEK_FLAG_TRICKMODE = 1 shl 4;
    GST_SEEK_FLAG_SKIP = 1 shl 4;
    GST_SEEK_FLAG_SNAP_BEFORE = 1 shl 5;
    GST_SEEK_FLAG_SNAP_AFTER = 1 shl 6;
    GST_SEEK_FLAG_SNAP_NEAREST = GST_SEEK_FLAG_SNAP_BEFORE or GST_SEEK_FLAG_SNAP_AFTER;
    GST_SEEK_FLAG_TRICKMODE_KEY_UNITS = 1 shl 7;
    GST_SEEK_FLAG_TRICKMODE_NO_AUDIO = 1 shl 8;
    GST_SEEK_FLAG_TRICKMODE_FORWARD_PREDICTED = 1 shl 9;
    GST_SEEK_FLAG_INSTANT_RATE_CHANGE = 1 shl 10;
;
{*
 * GstSegmentFlags:
 * @GST_SEGMENT_FLAG_NONE: no flags
 * @GST_SEGMENT_FLAG_RESET: reset the pipeline running_time to the segment
 *                          running_time
 * @GST_SEGMENT_FLAG_TRICKMODE: perform skip playback (Since: 1.6)
 * @GST_SEGMENT_FLAG_SEGMENT: send SEGMENT_DONE instead of EOS
 * @GST_SEGMENT_FLAG_TRICKMODE_KEY_UNITS: Decode only keyframes, where
 *                                        possible (Since: 1.6)
 * @GST_SEGMENT_FLAG_TRICKMODE_FORWARD_PREDICTED: Decode only keyframes or forward
 *                                        predicted frames, where possible (Since: 1.18)
 * @GST_SEGMENT_FLAG_TRICKMODE_NO_AUDIO: Do not decode any audio, where
 *                                        possible (Since: 1.6)
 * @GST_SEGMENT_FLAG_SKIP: Deprecated backward compatibility flag, replaced
 *                         by @GST_SEGMENT_FLAG_TRICKMODE
 *
 * Flags for the GstSegment structure. Currently mapped to the corresponding
 * values of the seek flags.
  }
{ Note: update gst_segment_do_seek() when adding new flags here  }
{< flags > }
{ FIXME 2.0: Remove _SKIP flag,
   * which was kept for backward compat when _TRICKMODE was added  }
type
  PGstSegmentFlags = ^TGstSegmentFlags;
  TGstSegmentFlags =  Longint;
  Const
    GST_SEGMENT_FLAG_NONE = GST_SEEK_FLAG_NONE;
    GST_SEGMENT_FLAG_RESET = GST_SEEK_FLAG_FLUSH;
    GST_SEGMENT_FLAG_TRICKMODE = GST_SEEK_FLAG_TRICKMODE;
    GST_SEGMENT_FLAG_SKIP = GST_SEEK_FLAG_TRICKMODE;
    GST_SEGMENT_FLAG_SEGMENT = GST_SEEK_FLAG_SEGMENT;
    GST_SEGMENT_FLAG_TRICKMODE_KEY_UNITS = GST_SEEK_FLAG_TRICKMODE_KEY_UNITS;
    GST_SEGMENT_FLAG_TRICKMODE_FORWARD_PREDICTED = GST_SEEK_FLAG_TRICKMODE_FORWARD_PREDICTED;
    GST_SEGMENT_FLAG_TRICKMODE_NO_AUDIO = GST_SEEK_FLAG_TRICKMODE_NO_AUDIO;
;
{ Flags that are reflected for instant-rate-change seeks  }
  GST_SEGMENT_INSTANT_FLAGS = ((GST_SEGMENT_FLAG_TRICKMODE or GST_SEGMENT_FLAG_TRICKMODE_KEY_UNITS) or GST_SEEK_FLAG_TRICKMODE_FORWARD_PREDICTED) or GST_SEGMENT_FLAG_TRICKMODE_NO_AUDIO;  
{*
 * GstSegment:
 * @flags:        flags for this segment
 * @rate:         the playback rate of the segment is set in response to a seek
 *                event and, without any seek, the value should be `1.0`. This
 *                value is used by elements that synchronize buffer [running
 *                times](additional/design/synchronisation.md#running-time) on
 *                the clock (usually the sink elements), leading to consuming
 *                buffers faster (for a value `> 1.0`) or slower (for `0.0 <
 *                value < 1.0`) than normal playback speed. The rate also
 *                defines the playback direction, meaning that when the value is
 *                lower than `0.0`, the playback happens in reverse, and the
 *                [stream-time](additional/design/synchronisation.md#stream-time)
 *                is going backward. The `rate` value should never be `0.0`.
 * @applied_rate: The applied rate is the rate that has been applied to the stream.
 *                The effective/resulting playback rate of a stream is
 *                `rate * applied_rate`.
 *                The applied rate can be set by source elements when a server is
 *                sending the stream with an already modified playback speed
 *                rate. Filter elements that modify the stream in a way that
 *                modifies the playback speed should also modify the applied
 *                rate. For example the #videorate element when its
 *                #videorate:rate property is set will set the applied rate of
 *                the segment it pushed downstream. Also #scaletempo applies the
 *                input segment rate to the stream and outputs a segment with
 *                rate=1.0 and applied_rate=<inputsegment.rate>.
 * @format:       the unit used for all of the segment's values.
 * @base:         the running time (plus elapsed time, see offset) of the
 *                segment [start](GstSegment.start) ([stop](GstSegment.stop) if
 *                rate < 0.0).
 * @offset:       the offset expresses the elapsed time (in buffer timestamps)
 *                before a seek with its start (stop if rate < 0.0) seek type
 *                set to #GST_SEEK_TYPE_NONE, the value is set to the position
 *                of the segment at the time of the seek.
 * @start:        the start time of the segment (in buffer timestamps)
 *                [(PTS)](GstBuffer.pts), that is the timestamp of the first
 *                buffer to output inside the segment (last one during
 *                reverse playback). For example decoders will
 *                [clip](gst_segment_clip) out the buffers before the start
 *                time.
 * @stop:         the stop time of the segment (in buffer timestamps)
 *                [(PTS)](GstBuffer.pts), that is the timestamp of the last
 *                buffer to output inside the segment (first one during
 *                reverse playback). For example decoders will
 *                [clip](gst_segment_clip) out buffers after the stop time.
 * @time:         the stream time of the segment [start](GstSegment.start)
 *                ([stop](GstSegment.stop) if rate < 0.0).
 * @position:     the buffer timestamp position in the segment is supposed to be
 *                updated by elements such as sources, demuxers or parsers to
 *                track progress by setting it to the last pushed buffer' end time
 *                ([timestamp](GstBuffer.pts) + #GstBuffer.duration) for that
 *                specific segment. The position is used when reconfiguring the
 *                segment with #gst_segment_do_seek when the seek is only
 *                updating the segment (see [offset](GstSegment.offset)).
 * @duration:     the duration of the segment is the maximum absolute difference
 *                between #GstSegment.start and #GstSegment.stop if stop is not
 *                set, otherwise it should be the difference between those
 *                two values. This should be set by elements that know the
 *                overall stream duration (like demuxers) and will be used when
 *                seeking with #GST_SEEK_TYPE_END.
 *
 * The structure that holds the configured region of interest in a media file.
  }
{< public > }
{ < private >  }
type
  PGstSegment = ^TGstSegment;
  TGstSegment = record
      flags : TGstSegmentFlags;
      rate : Tgdouble;
      applied_rate : Tgdouble;
      format : TGstFormat;
      base : Tguint64;
      offset : Tguint64;
      start : Tguint64;
      stop : Tguint64;
      time : Tguint64;
      position : Tguint64;
      duration : Tguint64;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_segment_get_type:TGType;cdecl;external;
function gst_segment_new:PGstSegment;cdecl;external;
(* Const before type ignored *)
function gst_segment_copy(segment:PGstSegment):PGstSegment;cdecl;external;
(* Const before type ignored *)
procedure gst_segment_copy_into(src:PGstSegment; dest:PGstSegment);cdecl;external;
procedure gst_segment_free(segment:PGstSegment);cdecl;external;
procedure gst_segment_init(segment:PGstSegment; format:TGstFormat);cdecl;external;
(* Const before type ignored *)
function gst_segment_to_stream_time_full(segment:PGstSegment; format:TGstFormat; position:Tguint64; stream_time:Pguint64):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_segment_to_stream_time(segment:PGstSegment; format:TGstFormat; position:Tguint64):Tguint64;cdecl;external;
(* Const before type ignored *)
function gst_segment_position_from_stream_time_full(segment:PGstSegment; format:TGstFormat; stream_time:Tguint64; position:Pguint64):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_segment_position_from_stream_time(segment:PGstSegment; format:TGstFormat; stream_time:Tguint64):Tguint64;cdecl;external;
(* Const before type ignored *)
function gst_segment_to_running_time(segment:PGstSegment; format:TGstFormat; position:Tguint64):Tguint64;cdecl;external;
(* Const before type ignored *)
function gst_segment_to_running_time_full(segment:PGstSegment; format:TGstFormat; position:Tguint64; running_time:Pguint64):Tgint;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN(gst_segment_position_from_running_time) }
(* Const before type ignored *)
function gst_segment_to_position(segment:PGstSegment; format:TGstFormat; running_time:Tguint64):Tguint64;cdecl;external;
(* Const before type ignored *)
function gst_segment_position_from_running_time_full(segment:PGstSegment; format:TGstFormat; running_time:Tguint64; position:Pguint64):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_segment_position_from_running_time(segment:PGstSegment; format:TGstFormat; running_time:Tguint64):Tguint64;cdecl;external;
function gst_segment_set_running_time(segment:PGstSegment; format:TGstFormat; running_time:Tguint64):Tgboolean;cdecl;external;
function gst_segment_offset_running_time(segment:PGstSegment; format:TGstFormat; offset:Tgint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_segment_clip(segment:PGstSegment; format:TGstFormat; start:Tguint64; stop:Tguint64; clip_start:Pguint64; 
           clip_stop:Pguint64):Tgboolean;cdecl;external;
function gst_segment_do_seek(segment:PGstSegment; rate:Tgdouble; format:TGstFormat; flags:TGstSeekFlags; start_type:TGstSeekType; 
           start:Tguint64; stop_type:TGstSeekType; stop:Tguint64; update:Pgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_segment_is_equal(s0:PGstSegment; s1:PGstSegment):Tgboolean;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstSegment, gst_segment_free) }
{$endif}
{ __GST_SEGMENT_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_SEGMENT : longint; { return type might be wrong }
  begin
    GST_TYPE_SEGMENT:=gst_segment_get_type;
  end;


end.
