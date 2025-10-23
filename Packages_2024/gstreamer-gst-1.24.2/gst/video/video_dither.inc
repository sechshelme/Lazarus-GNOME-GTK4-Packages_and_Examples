
{$IFDEF read_interface}

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

type
  TGstVideoDither = record
  end;
  PGstVideoDither = ^TGstVideoDither;

function gst_video_dither_new(method: TGstVideoDitherMethod; flags: TGstVideoDitherFlags; format: TGstVideoFormat; quantizer: Pgint; Width: Tguint): PGstVideoDither; cdecl; external libgstvideo;
procedure gst_video_dither_free(dither: PGstVideoDither); cdecl; external libgstvideo;
procedure gst_video_dither_line(dither: PGstVideoDither; line: Tgpointer; x: Tguint; y: Tguint; Width: Tguint); cdecl; external libgstvideo;

// === Konventiert am: 1-10-24 15:03:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
