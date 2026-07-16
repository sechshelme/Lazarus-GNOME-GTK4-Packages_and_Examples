unit video_scaler;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, video_resampler, video_format;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GST_VIDEO_SCALER_OPT_DITHER_METHOD = 'GstVideoScaler.dither-method';

type
  PGstVideoScalerFlags = ^TGstVideoScalerFlags;
  TGstVideoScalerFlags = longint;
const
  GST_VIDEO_SCALER_FLAG_NONE = 0;
  GST_VIDEO_SCALER_FLAG_INTERLACED = 1 shl 0;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstVideoScaler = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_video_scaler_new(method: TGstVideoResamplerMethod; flags: TGstVideoScalerFlags; n_taps: Tguint; in_size: Tguint; out_size: Tguint;
  options: PGstStructure): PGstVideoScaler; cdecl; external libgstvideo;
procedure gst_video_scaler_free(scale: PGstVideoScaler); cdecl; external libgstvideo;
function gst_video_scaler_get_max_taps(scale: PGstVideoScaler): Tguint; cdecl; external libgstvideo;
function gst_video_scaler_get_coeff(scale: PGstVideoScaler; out_offset: Tguint; in_offset: Pguint; n_taps: Pguint): Pgdouble; cdecl; external libgstvideo;
procedure gst_video_scaler_horizontal(scale: PGstVideoScaler; format: TGstVideoFormat; src: Tgpointer; dest: Tgpointer; dest_offset: Tguint;
  width: Tguint); cdecl; external libgstvideo;
procedure gst_video_scaler_vertical(scale: PGstVideoScaler; format: TGstVideoFormat; src_lines: Pgpointer; dest: Tgpointer; dest_offset: Tguint;
  width: Tguint); cdecl; external libgstvideo;
function gst_video_scaler_combine_packed_YUV(y_scale: PGstVideoScaler; uv_scale: PGstVideoScaler; in_format: TGstVideoFormat; out_format: TGstVideoFormat): PGstVideoScaler; cdecl; external libgstvideo;
procedure gst_video_scaler_2d(hscale: PGstVideoScaler; vscale: PGstVideoScaler; format: TGstVideoFormat; src: Tgpointer; src_stride: Tgint;
  dest: Tgpointer; dest_stride: Tgint; x: Tguint; y: Tguint; width: Tguint;
  height: Tguint); cdecl; external libgstvideo;
{$ENDIF read_function}

// === Konventiert am: 15-7-26 13:39:06 ===


implementation



end.
