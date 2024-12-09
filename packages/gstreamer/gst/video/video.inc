
{$IFDEF read_interface}

type
  TGstVideoAlignment = record
    padding_top: Tguint;
    padding_bottom: Tguint;
    padding_left: Tguint;
    padding_right: Tguint;
    stride_align: array[0..(GST_VIDEO_MAX_PLANES) - 1] of Tguint;
  end;
  PGstVideoAlignment = ^TGstVideoAlignment;

  PGstVideoOrientationMethod = ^TGstVideoOrientationMethod;
  TGstVideoOrientationMethod = longint;

const
  GST_VIDEO_ORIENTATION_IDENTITY = 0;
  GST_VIDEO_ORIENTATION_90R = 1;
  GST_VIDEO_ORIENTATION_180 = 2;
  GST_VIDEO_ORIENTATION_90L = 3;
  GST_VIDEO_ORIENTATION_HORIZ = 4;
  GST_VIDEO_ORIENTATION_VERT = 5;
  GST_VIDEO_ORIENTATION_UL_LR = 6;
  GST_VIDEO_ORIENTATION_UR_LL = 7;
  GST_VIDEO_ORIENTATION_AUTO = 8;
  GST_VIDEO_ORIENTATION_CUSTOM = 9;

const
  GST_META_TAG_VIDEO_STR = 'video';
  GST_META_TAG_VIDEO_ORIENTATION_STR = 'orientation';
  GST_META_TAG_VIDEO_SIZE_STR = 'size';
  GST_META_TAG_VIDEO_COLORSPACE_STR = 'colorspace';

procedure gst_video_alignment_reset(align: PGstVideoAlignment); cdecl; external libgstvideo;
function gst_video_calculate_display_ratio(dar_n: Pguint; dar_d: Pguint; video_width: Tguint; video_height: Tguint; video_par_n: Tguint;
  video_par_d: Tguint; display_par_n: Tguint; display_par_d: Tguint): Tgboolean; cdecl; external libgstvideo;
function gst_video_guess_framerate(duration: TGstClockTime; dest_n: Pgint; dest_d: Pgint): Tgboolean; cdecl; external libgstvideo;
function gst_video_is_common_aspect_ratio(Width: Tgint; Height: Tgint; par_n: Tgint; par_d: Tgint): Tgboolean; cdecl; external libgstvideo;

type
  TGstVideoConvertSampleCallback = procedure(sample: PGstSample; error: PGError; user_data: Tgpointer); cdecl;

procedure gst_video_convert_sample_async(sample: PGstSample; to_caps: PGstCaps; timeout: TGstClockTime; callback: TGstVideoConvertSampleCallback; user_data: Tgpointer;
  destroy_notify: TGDestroyNotify); cdecl; external libgstvideo;
function gst_video_convert_sample(sample: PGstSample; to_caps: PGstCaps; timeout: TGstClockTime; error: PPGError): PGstSample; cdecl; external libgstvideo;
function gst_video_orientation_from_tag(taglist: PGstTagList; method: PGstVideoOrientationMethod): Tgboolean; cdecl; external libgstvideo;

// === Konventiert am: 29-9-24 15:42:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
