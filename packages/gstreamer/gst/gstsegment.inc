/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstSeekType = ^TGstSeekType;
  TGstSeekType = longint;

const
  GST_SEEK_TYPE_NONE = 0;
  GST_SEEK_TYPE_SET = 1;
  GST_SEEK_TYPE_END = 2;

type
  PGstSeekFlags = ^TGstSeekFlags;
  TGstSeekFlags = longint;

const
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

type
  PGstSegmentFlags = ^TGstSegmentFlags;
  TGstSegmentFlags = longint;

const
  GST_SEGMENT_FLAG_NONE = GST_SEEK_FLAG_NONE;
  GST_SEGMENT_FLAG_RESET = GST_SEEK_FLAG_FLUSH;
  GST_SEGMENT_FLAG_TRICKMODE = GST_SEEK_FLAG_TRICKMODE;
  GST_SEGMENT_FLAG_SKIP = GST_SEEK_FLAG_TRICKMODE;
  GST_SEGMENT_FLAG_SEGMENT = GST_SEEK_FLAG_SEGMENT;
  GST_SEGMENT_FLAG_TRICKMODE_KEY_UNITS = GST_SEEK_FLAG_TRICKMODE_KEY_UNITS;
  GST_SEGMENT_FLAG_TRICKMODE_FORWARD_PREDICTED = GST_SEEK_FLAG_TRICKMODE_FORWARD_PREDICTED;
  GST_SEGMENT_FLAG_TRICKMODE_NO_AUDIO = GST_SEEK_FLAG_TRICKMODE_NO_AUDIO;
  GST_SEGMENT_INSTANT_FLAGS = ((GST_SEGMENT_FLAG_TRICKMODE or GST_SEGMENT_FLAG_TRICKMODE_KEY_UNITS) or GST_SEEK_FLAG_TRICKMODE_FORWARD_PREDICTED) or GST_SEGMENT_FLAG_TRICKMODE_NO_AUDIO;

type
  TGstSegment = record
    flags: TGstSegmentFlags;
    rate: Tgdouble;
    applied_rate: Tgdouble;
    format: TGstFormat;
    base: Tguint64;
    offset: Tguint64;
    start: Tguint64;
    stop: Tguint64;
    time: Tguint64;
    position: Tguint64;
    duration: Tguint64;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstSegment = ^TGstSegment;
  PPGstSegment = ^PGstSegment;

function gst_segment_get_type: TGType; cdecl; external libgstreamer;
function gst_segment_new: PGstSegment; cdecl; external libgstreamer;
function gst_segment_copy(segment: PGstSegment): PGstSegment; cdecl; external libgstreamer;
procedure gst_segment_copy_into(src: PGstSegment; dest: PGstSegment); cdecl; external libgstreamer;
procedure gst_segment_free(segment: PGstSegment); cdecl; external libgstreamer;
procedure gst_segment_init(segment: PGstSegment; format: TGstFormat); cdecl; external libgstreamer;
function gst_segment_to_stream_time_full(segment: PGstSegment; format: TGstFormat; position: Tguint64; stream_time: Pguint64): Tgint; cdecl; external libgstreamer;
function gst_segment_to_stream_time(segment: PGstSegment; format: TGstFormat; position: Tguint64): Tguint64; cdecl; external libgstreamer;
function gst_segment_position_from_stream_time_full(segment: PGstSegment; format: TGstFormat; stream_time: Tguint64; position: Pguint64): Tgint; cdecl; external libgstreamer;
function gst_segment_position_from_stream_time(segment: PGstSegment; format: TGstFormat; stream_time: Tguint64): Tguint64; cdecl; external libgstreamer;
function gst_segment_to_running_time(segment: PGstSegment; format: TGstFormat; position: Tguint64): Tguint64; cdecl; external libgstreamer;
function gst_segment_to_running_time_full(segment: PGstSegment; format: TGstFormat; position: Tguint64; running_time: Pguint64): Tgint; cdecl; external libgstreamer;
function gst_segment_to_position(segment: PGstSegment; format: TGstFormat; running_time: Tguint64): Tguint64; cdecl; external libgstreamer;
function gst_segment_position_from_running_time_full(segment: PGstSegment; format: TGstFormat; running_time: Tguint64; position: Pguint64): Tgint; cdecl; external libgstreamer;
function gst_segment_position_from_running_time(segment: PGstSegment; format: TGstFormat; running_time: Tguint64): Tguint64; cdecl; external libgstreamer;
function gst_segment_set_running_time(segment: PGstSegment; format: TGstFormat; running_time: Tguint64): Tgboolean; cdecl; external libgstreamer;
function gst_segment_offset_running_time(segment: PGstSegment; format: TGstFormat; offset: Tgint64): Tgboolean; cdecl; external libgstreamer;
function gst_segment_clip(segment: PGstSegment; format: TGstFormat; start: Tguint64; stop: Tguint64; clip_start: Pguint64;
  clip_stop: Pguint64): Tgboolean; cdecl; external libgstreamer;
function gst_segment_do_seek(segment: PGstSegment; rate: Tgdouble; format: TGstFormat; flags: TGstSeekFlags; start_type: TGstSeekType;
  start: Tguint64; stop_type: TGstSeekType; stop: Tguint64; update: Pgboolean): Tgboolean; cdecl; external libgstreamer;
function gst_segment_is_equal(s0: PGstSegment; s1: PGstSegment): Tgboolean; cdecl; external libgstreamer;

function GST_TYPE_SEGMENT: TGType;

// === Konventiert am: 13-9-24 18:16:16 ===

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_SEGMENT: TGType;
begin
  GST_TYPE_SEGMENT := gst_segment_get_type;
end;


{$ENDIF read_implementation}
