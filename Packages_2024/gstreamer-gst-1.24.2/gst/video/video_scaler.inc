
{$IFDEF read_interface}

const
  GST_VIDEO_SCALER_OPT_DITHER_METHOD = 'GstVideoScaler.dither-method';

type
  PGstVideoScalerFlags = ^TGstVideoScalerFlags;
  TGstVideoScalerFlags = longint;

const
  GST_VIDEO_SCALER_FLAG_NONE = 0;
  GST_VIDEO_SCALER_FLAG_INTERLACED = 1 shl 0;

type
  TGstVideoScaler = record
  end;
  PGstVideoScaler = ^TGstVideoScaler;

function gst_video_scaler_new(method: TGstVideoResamplerMethod; flags: TGstVideoScalerFlags; n_taps: Tguint; in_size: Tguint; out_size: Tguint;
  options: PGstStructure): PGstVideoScaler; cdecl; external libgstvideo;
procedure gst_video_scaler_free(scale: PGstVideoScaler); cdecl; external libgstvideo;
function gst_video_scaler_get_max_taps(scale: PGstVideoScaler): Tguint; cdecl; external libgstvideo;
function gst_video_scaler_get_coeff(scale: PGstVideoScaler; out_offset: Tguint; in_offset: Pguint; n_taps: Pguint): Pgdouble; cdecl; external libgstvideo;
procedure gst_video_scaler_horizontal(scale: PGstVideoScaler; format: TGstVideoFormat; src: Tgpointer; dest: Tgpointer; dest_offset: Tguint;
  Width: Tguint); cdecl; external libgstvideo;
procedure gst_video_scaler_vertical(scale: PGstVideoScaler; format: TGstVideoFormat; src_lines: Pgpointer; dest: Tgpointer; dest_offset: Tguint;
  Width: Tguint); cdecl; external libgstvideo;
function gst_video_scaler_combine_packed_YUV(y_scale: PGstVideoScaler; uv_scale: PGstVideoScaler; in_format: TGstVideoFormat; out_format: TGstVideoFormat): PGstVideoScaler; cdecl; external libgstvideo;
procedure gst_video_scaler_2d(hscale: PGstVideoScaler; vscale: PGstVideoScaler; format: TGstVideoFormat; src: Tgpointer; src_stride: Tgint;
  dest: Tgpointer; dest_stride: Tgint; x: Tguint; y: Tguint; Width: Tguint;
  Height: Tguint); cdecl; external libgstvideo;

// === Konventiert am: 30-9-24 19:16:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
