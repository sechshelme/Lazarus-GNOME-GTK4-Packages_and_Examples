unit video_dither;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, video_format;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGstVideoDitherMethod = ^TGstVideoDitherMethod;
  TGstVideoDitherMethod = longint;
const
  GST_VIDEO_DITHER_NONE = 0;
  GST_VIDEO_DITHER_VERTERR = 1;
  GST_VIDEO_DITHER_FLOYD_STEINBERG = 2;
  GST_VIDEO_DITHER_SIERRA_LITE = 3;
  GST_VIDEO_DITHER_BAYER = 4;

type
  PGstVideoDitherFlags = ^TGstVideoDitherFlags;
  TGstVideoDitherFlags = longint;
const
  GST_VIDEO_DITHER_FLAG_NONE = 0;
  GST_VIDEO_DITHER_FLAG_INTERLACED = 1 shl 0;
  GST_VIDEO_DITHER_FLAG_QUANTIZE = 1 shl 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstVideoDither = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_struct}
function gst_video_dither_new(method: TGstVideoDitherMethod; flags: TGstVideoDitherFlags; format: TGstVideoFormat; quantizer: Pguint; width: Tguint): PGstVideoDither; cdecl; external libgstvideo;
procedure gst_video_dither_free(dither: PGstVideoDither); cdecl; external libgstvideo;
procedure gst_video_dither_line(dither: PGstVideoDither; line: Tgpointer; x: Tguint; y: Tguint; width: Tguint); cdecl; external libgstvideo;
{$ENDIF read_struct}

// === Konventiert am: 15-7-26 13:36:11 ===


implementation



end.
