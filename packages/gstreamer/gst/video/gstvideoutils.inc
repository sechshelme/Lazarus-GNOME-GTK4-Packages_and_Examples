/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstVideoCodecState = ^TGstVideoCodecState;

  TGstVideoCodecState = record
    ref_count: Tgint;
    info: TGstVideoInfo;
    caps: PGstCaps;
    codec_data: PGstBuffer;
    allocation_caps: PGstCaps;
    mastering_display_info: PGstVideoMasteringDisplayInfo;
    content_light_level: PGstVideoContentLightLevel;
    padding: array[0..(GST_PADDING_LARGE - 3) - 1] of Tgpointer;
  end;

  PGstVideoCodecFrameFlags = ^TGstVideoCodecFrameFlags;
  TGstVideoCodecFrameFlags = longint;

const
  GST_VIDEO_CODEC_FRAME_FLAG_DECODE_ONLY = 1 shl 0;
  GST_VIDEO_CODEC_FRAME_FLAG_SYNC_POINT = 1 shl 1;
  GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME = 1 shl 2;
  GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME_HEADERS = 1 shl 3;
  GST_VIDEO_CODEC_FRAME_FLAG_CORRUPTED = 1 shl 4;

type
  TGstVideoCodecFrame = record
    ref_count: Tgint;
    flags: Tguint32;
    system_frame_number: Tguint32;
    decode_frame_number: Tguint32;
    presentation_frame_number: Tguint32;
    dts: TGstClockTime;
    pts: TGstClockTime;
    duration: TGstClockTime;
    distance_from_sync: longint;
    input_buffer: PGstBuffer;
    output_buffer: PGstBuffer;
    deadline: TGstClockTime;
    events: PGList;
    user_data: Tgpointer;
    user_data_destroy_notify: TGDestroyNotify;
    abidata: record
      case longint of
        0: (ABI: record
            ts: TGstClockTime;
            ts2: TGstClockTime;
            num_subframes: Tguint;
            subframes_processed: Tguint;
            end);
        1: (padding: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer);
      end;
  end;
  PGstVideoCodecFrame = ^TGstVideoCodecFrame;

function gst_video_codec_state_get_type: TGType; cdecl; external libgstvideo;
function gst_video_codec_state_ref(state: PGstVideoCodecState): PGstVideoCodecState; cdecl; external libgstvideo;
procedure gst_video_codec_state_unref(state: PGstVideoCodecState); cdecl; external libgstvideo;
function gst_video_codec_frame_get_type: TGType; cdecl; external libgstvideo;
function gst_video_codec_frame_ref(frame: PGstVideoCodecFrame): PGstVideoCodecFrame; cdecl; external libgstvideo;
procedure gst_video_codec_frame_unref(frame: PGstVideoCodecFrame); cdecl; external libgstvideo;
procedure gst_video_codec_frame_set_user_data(frame: PGstVideoCodecFrame; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstvideo;
function gst_video_codec_frame_get_user_data(frame: PGstVideoCodecFrame): Tgpointer; cdecl; external libgstvideo;

function GST_TYPE_VIDEO_CODEC_STATE: TGType;
function GST_TYPE_VIDEO_CODEC_FRAME: TGType;
function GST_VIDEO_CODEC_FRAME_FLAGS(frame: PGstVideoCodecFrame): Tguint32;
function GST_VIDEO_CODEC_FRAME_FLAG_IS_SET(frame: PGstVideoCodecFrame; flag: Tguint32): Tgboolean;
procedure GST_VIDEO_CODEC_FRAME_FLAG_SET(var frame: PGstVideoCodecFrame; flag: Tguint32);
procedure GST_VIDEO_CODEC_FRAME_FLAG_UNSET(var frame: PGstVideoCodecFrame; flag: Tguint32);

function GST_VIDEO_CODEC_FRAME_IS_DECODE_ONLY(frame: PGstVideoCodecFrame): Tgboolean;
procedure GST_VIDEO_CODEC_FRAME_SET_DECODE_ONLY(var frame: PGstVideoCodecFrame);
function GST_VIDEO_CODEC_FRAME_IS_SYNC_POINT(frame: PGstVideoCodecFrame): Tgboolean;
procedure GST_VIDEO_CODEC_FRAME_SET_SYNC_POINT(var frame: PGstVideoCodecFrame);
procedure GST_VIDEO_CODEC_FRAME_UNSET_SYNC_POINT(var frame: PGstVideoCodecFrame);
function GST_VIDEO_CODEC_FRAME_IS_FORCE_KEYFRAME(frame: PGstVideoCodecFrame): Tgboolean;
procedure GST_VIDEO_CODEC_FRAME_SET_FORCE_KEYFRAME(frame: PGstVideoCodecFrame);
procedure GST_VIDEO_CODEC_FRAME_UNSET_FORCE_KEYFRAME(frame: PGstVideoCodecFrame);
function GST_VIDEO_CODEC_FRAME_IS_FORCE_KEYFRAME_HEADERS(frame: PGstVideoCodecFrame): Tgboolean;
procedure GST_VIDEO_CODEC_FRAME_SET_FORCE_KEYFRAME_HEADERS(var frame: PGstVideoCodecFrame);
procedure GST_VIDEO_CODEC_FRAME_UNSET_FORCE_KEYFRAME_HEADERS(frame: PGstVideoCodecFrame);


// === Konventiert am: 29-9-24 17:38:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VIDEO_CODEC_STATE: TGType;
begin
  GST_TYPE_VIDEO_CODEC_STATE := gst_video_codec_state_get_type;
end;

function GST_TYPE_VIDEO_CODEC_FRAME: TGType;
begin
  GST_TYPE_VIDEO_CODEC_FRAME := gst_video_codec_frame_get_type;
end;

function GST_VIDEO_CODEC_FRAME_FLAGS(frame: PGstVideoCodecFrame): Tguint32;
begin
  GST_VIDEO_CODEC_FRAME_FLAGS := frame^.flags;
end;

function GST_VIDEO_CODEC_FRAME_FLAG_IS_SET(frame: PGstVideoCodecFrame; flag: Tguint32): Tgboolean;
begin
  GST_VIDEO_CODEC_FRAME_FLAG_IS_SET := GST_VIDEO_CODEC_FRAME_FLAGS(frame) and flag <> 0;
end;

{#define GST_VIDEO_CODEC_FRAME_FLAG_SET(frame,flag)     (GST_VIDEO_CODEC_FRAME_FLAGS(frame) |= (flag)) }
procedure GST_VIDEO_CODEC_FRAME_FLAG_SET(var frame: PGstVideoCodecFrame;
  flag: Tguint32);
begin
  frame^.flags := frame^.flags or flag;
end;

{#define GST_VIDEO_CODEC_FRAME_FLAG_UNSET(frame,flag)   (GST_VIDEO_CODEC_FRAME_FLAGS(frame) &= ~(flag)) }
procedure GST_VIDEO_CODEC_FRAME_FLAG_UNSET(var frame: PGstVideoCodecFrame;
  flag: Tguint32);
begin
  frame^.flags := frame^.flags and not flag;
end;

function GST_VIDEO_CODEC_FRAME_IS_DECODE_ONLY(frame: PGstVideoCodecFrame): Tgboolean;
begin
  GST_VIDEO_CODEC_FRAME_IS_DECODE_ONLY := GST_VIDEO_CODEC_FRAME_FLAG_IS_SET(frame, GST_VIDEO_CODEC_FRAME_FLAG_DECODE_ONLY);
end;

procedure GST_VIDEO_CODEC_FRAME_SET_DECODE_ONLY(var frame: PGstVideoCodecFrame);
begin
  GST_VIDEO_CODEC_FRAME_FLAG_SET(frame, GST_VIDEO_CODEC_FRAME_FLAG_DECODE_ONLY);
end;

function GST_VIDEO_CODEC_FRAME_IS_SYNC_POINT(frame: PGstVideoCodecFrame): Tgboolean;
begin
  GST_VIDEO_CODEC_FRAME_IS_SYNC_POINT := GST_VIDEO_CODEC_FRAME_FLAG_IS_SET(frame, GST_VIDEO_CODEC_FRAME_FLAG_SYNC_POINT);
end;

procedure GST_VIDEO_CODEC_FRAME_SET_SYNC_POINT(var frame: PGstVideoCodecFrame);
begin
  GST_VIDEO_CODEC_FRAME_FLAG_SET(frame, GST_VIDEO_CODEC_FRAME_FLAG_SYNC_POINT);
end;

procedure GST_VIDEO_CODEC_FRAME_UNSET_SYNC_POINT(var frame: PGstVideoCodecFrame);
begin
  GST_VIDEO_CODEC_FRAME_FLAG_UNSET(frame, GST_VIDEO_CODEC_FRAME_FLAG_SYNC_POINT);
end;

function GST_VIDEO_CODEC_FRAME_IS_FORCE_KEYFRAME(frame: PGstVideoCodecFrame): Tgboolean;
begin
  GST_VIDEO_CODEC_FRAME_IS_FORCE_KEYFRAME := GST_VIDEO_CODEC_FRAME_FLAG_IS_SET(frame, GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME);
end;

procedure GST_VIDEO_CODEC_FRAME_SET_FORCE_KEYFRAME(frame: PGstVideoCodecFrame);
begin
  GST_VIDEO_CODEC_FRAME_FLAG_SET(frame, GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME);
end;

procedure GST_VIDEO_CODEC_FRAME_UNSET_FORCE_KEYFRAME(frame: PGstVideoCodecFrame);
begin
  GST_VIDEO_CODEC_FRAME_FLAG_UNSET(frame, GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME);
end;

function GST_VIDEO_CODEC_FRAME_IS_FORCE_KEYFRAME_HEADERS(frame: PGstVideoCodecFrame): Tgboolean;
begin
  GST_VIDEO_CODEC_FRAME_IS_FORCE_KEYFRAME_HEADERS := GST_VIDEO_CODEC_FRAME_FLAG_IS_SET(frame, GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME_HEADERS);
end;

procedure GST_VIDEO_CODEC_FRAME_SET_FORCE_KEYFRAME_HEADERS(var frame: PGstVideoCodecFrame);
begin
  GST_VIDEO_CODEC_FRAME_FLAG_SET(frame, GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME_HEADERS);
end;

procedure GST_VIDEO_CODEC_FRAME_UNSET_FORCE_KEYFRAME_HEADERS(frame: PGstVideoCodecFrame);
begin
  GST_VIDEO_CODEC_FRAME_FLAG_UNSET(frame, GST_VIDEO_CODEC_FRAME_FLAG_FORCE_KEYFRAME_HEADERS);
end;


{$ENDIF read_implementation}
