
{$IFDEF read_interface}

function gst_video_chroma_from_string(s: Pgchar): TGstVideoChromaSite; cdecl; external libgstvideo; deprecated 'GST_VIDEO_DEPRECATED_FOR(gst_video_chroma_site_from_string)';
function gst_video_chroma_to_string(site: TGstVideoChromaSite): Pgchar; cdecl; external libgstvideo; deprecated 'GST_VIDEO_DEPRECATED_FOR(gst_video_chroma_site_to_string)';
function gst_video_chroma_site_from_string(s: Pgchar): TGstVideoChromaSite; cdecl; external libgstvideo;
function gst_video_chroma_site_to_string(site: TGstVideoChromaSite): Pgchar; cdecl; external libgstvideo;

type
  PGstVideoChromaMethod = ^TGstVideoChromaMethod;
  TGstVideoChromaMethod = longint;

const
  GST_VIDEO_CHROMA_METHOD_NEAREST = 0;
  GST_VIDEO_CHROMA_METHOD_LINEAR = 1;

type
  PGstVideoChromaFlags = ^TGstVideoChromaFlags;
  TGstVideoChromaFlags = longint;

const
  GST_VIDEO_CHROMA_FLAG_NONE = 0;
  GST_VIDEO_CHROMA_FLAG_INTERLACED = 1 shl 0;

type
  TGstVideoChromaResample = record
  end;
  PGstVideoChromaResample = ^TGstVideoChromaResample;

function gst_video_chroma_resample_new(method: TGstVideoChromaMethod; site: TGstVideoChromaSite; flags: TGstVideoChromaFlags; format: TGstVideoFormat; h_factor: Tgint;
  v_factor: Tgint): PGstVideoChromaResample; cdecl; external libgstvideo;
procedure gst_video_chroma_resample_free(resample: PGstVideoChromaResample); cdecl; external libgstvideo;
procedure gst_video_chroma_resample_get_info(resample: PGstVideoChromaResample; n_lines: Pguint; offset: Pgint); cdecl; external libgstvideo;
procedure gst_video_chroma_resample(resample: PGstVideoChromaResample; Lines: Pgpointer; Width: Tgint); cdecl; external libgstvideo;

// === Konventiert am: 29-9-24 14:48:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
