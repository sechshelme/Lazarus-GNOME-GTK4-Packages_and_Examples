unit video;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstVideoAlignment = ^TGstVideoAlignment;
  TGstVideoAlignment = record
    padding_top: Tguint;
    padding_bottom: Tguint;
    padding_left: Tguint;
    padding_right: Tguint;
    stride_align: array[0..(GST_VIDEO_MAX_PLANES) - 1] of Tguint;
  end;

  PGstVideoRectangle = ^TGstVideoRectangle;
  TGstVideoRectangle = record
    x: Tgint;
    y: Tgint;
    w: Tgint;
    h: Tgint;
  end;

type
  TGstVideoConvertSampleCallback = procedure(sample: PGstSample; error: PGError; user_data: Tgpointer); cdecl;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
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
  {$ENDIF read_enum}

{$IFDEF read_function}
procedure gst_video_alignment_reset(align: PGstVideoAlignment); cdecl; external libgstvideo;
function gst_video_calculate_display_ratio(dar_n: Pguint; dar_d: Pguint; video_width: Tguint; video_height: Tguint; video_par_n: Tguint;
  video_par_d: Tguint; display_par_n: Tguint; display_par_d: Tguint): Tgboolean; cdecl; external libgstvideo;
function gst_video_guess_framerate(duration: TGstClockTime; dest_n: Pgint; dest_d: Pgint): Tgboolean; cdecl; external libgstvideo;
function gst_video_is_common_aspect_ratio(width: Tgint; height: Tgint; par_n: Tgint; par_d: Tgint): Tgboolean; cdecl; external libgstvideo;

procedure gst_video_convert_sample_async(sample: PGstSample; to_caps: PGstCaps; timeout: TGstClockTime; callback: TGstVideoConvertSampleCallback; user_data: Tgpointer;
  destroy_notify: TGDestroyNotify); cdecl; external libgstvideo;
function gst_video_convert_sample(sample: PGstSample; to_caps: PGstCaps; timeout: TGstClockTime; error: PPGError): PGstSample; cdecl; external libgstvideo;
function gst_video_orientation_from_tag(taglist: PGstTagList; method: PGstVideoOrientationMethod): Tgboolean; cdecl; external libgstvideo;
{$ENDIF read_function}

// === Konventiert am: 15-7-26 13:29:57 ===


implementation



end.
