{$IFDEF read_interface}


type
  TAVFrameSideDataType = longint;

const
  AV_FRAME_DATA_PANSCAN = 0;
  AV_FRAME_DATA_A53_CC = 1;
  AV_FRAME_DATA_STEREO3D = 2;
  AV_FRAME_DATA_MATRIXENCODING = 3;
  AV_FRAME_DATA_DOWNMIX_INFO = 4;
  AV_FRAME_DATA_REPLAYGAIN = 5;
  AV_FRAME_DATA_DISPLAYMATRIX = 6;
  AV_FRAME_DATA_AFD = 7;
  AV_FRAME_DATA_MOTION_VECTORS = 8;
  AV_FRAME_DATA_SKIP_SAMPLES = 9;
  AV_FRAME_DATA_AUDIO_SERVICE_TYPE = 10;
  AV_FRAME_DATA_MASTERING_DISPLAY_METADATA = 11;
  AV_FRAME_DATA_GOP_TIMECODE = 12;
  AV_FRAME_DATA_SPHERICAL = 13;
  AV_FRAME_DATA_CONTENT_LIGHT_LEVEL = 14;
  AV_FRAME_DATA_ICC_PROFILE = 15;
  AV_FRAME_DATA_S12M_TIMECODE = 16;
  AV_FRAME_DATA_DYNAMIC_HDR_PLUS = 17;
  AV_FRAME_DATA_REGIONS_OF_INTEREST = 18;
  AV_FRAME_DATA_VIDEO_ENC_PARAMS = 19;
  AV_FRAME_DATA_SEI_UNREGISTERED = 20;
  AV_FRAME_DATA_FILM_GRAIN_PARAMS = 21;
  AV_FRAME_DATA_DETECTION_BBOXES = 22;
  AV_FRAME_DATA_DOVI_RPU_BUFFER = 23;
  AV_FRAME_DATA_DOVI_METADATA = 24;
  AV_FRAME_DATA_DYNAMIC_HDR_VIVID = 25;
  AV_FRAME_DATA_AMBIENT_VIEWING_ENVIRONMENT = 26;
  AV_FRAME_DATA_VIDEO_HINT = 27;

type
  TAVActiveFormatDescription = longint;

const
  AV_AFD_SAME = 8;
  AV_AFD_4_3 = 9;
  AV_AFD_16_9 = 10;
  AV_AFD_14_9 = 11;
  AV_AFD_4_3_SP_14_9 = 13;
  AV_AFD_16_9_SP_14_9 = 14;
  AV_AFD_SP_4_3 = 15;

type
  TAVFrameSideData = record
    _type: TAVFrameSideDataType;
    data: Puint8_t;
    size: Tsize_t;
    metadata: PAVDictionary;
    buf: PAVBufferRef;
  end;
  PAVFrameSideData = ^TAVFrameSideData;

  TAVRegionOfInterest = record
    self_size: Tuint32_t;
    top: longint;
    bottom: longint;
    left: longint;
    right: longint;
    qoffset: TAVRational;
  end;
  PAVRegionOfInterest = ^TAVRegionOfInterest;

  PAVFrame = type Pointer;
  PPAVFrame = ^PAVFrame;

const
  AV_NUM_DATA_POINTERS = 8;

function av_frame_alloc: PAVFrame; cdecl; external libavutil;
procedure av_frame_free(frame: PPAVFrame); cdecl; external libavutil;
function av_frame_ref(dst: PAVFrame; src: PAVFrame): longint; cdecl; external libavutil;
function av_frame_replace(dst: PAVFrame; src: PAVFrame): longint; cdecl; external libavutil;
function av_frame_clone(src: PAVFrame): PAVFrame; cdecl; external libavutil;
procedure av_frame_unref(frame: PAVFrame); cdecl; external libavutil;
procedure av_frame_move_ref(dst: PAVFrame; src: PAVFrame); cdecl; external libavutil;
function av_frame_get_buffer(frame: PAVFrame; align: longint): longint; cdecl; external libavutil;
function av_frame_is_writable(frame: PAVFrame): longint; cdecl; external libavutil;
function av_frame_make_writable(frame: PAVFrame): longint; cdecl; external libavutil;
function av_frame_copy(dst: PAVFrame; src: PAVFrame): longint; cdecl; external libavutil;
function av_frame_copy_props(dst: PAVFrame; src: PAVFrame): longint; cdecl; external libavutil;
function av_frame_get_plane_buffer(frame: PAVFrame; plane: longint): PAVBufferRef; cdecl; external libavutil;
function av_frame_new_side_data(frame: PAVFrame; _type: TAVFrameSideDataType; size: Tsize_t): PAVFrameSideData; cdecl; external libavutil;
function av_frame_new_side_data_from_buf(frame: PAVFrame; _type: TAVFrameSideDataType; buf: PAVBufferRef): PAVFrameSideData; cdecl; external libavutil;
function av_frame_get_side_data(frame: PAVFrame; _type: TAVFrameSideDataType): PAVFrameSideData; cdecl; external libavutil;
procedure av_frame_remove_side_data(frame: PAVFrame; _type: TAVFrameSideDataType); cdecl; external libavutil;

const
  AV_FRAME_CROP_UNALIGNED = 1 shl 0;

function av_frame_apply_cropping(frame: PAVFrame; flags: longint): longint; cdecl; external libavutil;
function av_frame_side_data_name(_type: TAVFrameSideDataType): pchar; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:15:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
