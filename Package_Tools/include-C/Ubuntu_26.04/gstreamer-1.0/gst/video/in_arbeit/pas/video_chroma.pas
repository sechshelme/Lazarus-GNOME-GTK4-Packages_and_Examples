unit video_chroma;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, video_format;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGstVideoChromaSite = ^TGstVideoChromaSite;
  TGstVideoChromaSite = longint;
const
  GST_VIDEO_CHROMA_SITE_UNKNOWN = 0;
  GST_VIDEO_CHROMA_SITE_NONE = 1 shl 0;
  GST_VIDEO_CHROMA_SITE_H_COSITED = 1 shl 1;
  GST_VIDEO_CHROMA_SITE_V_COSITED = 1 shl 2;
  GST_VIDEO_CHROMA_SITE_ALT_LINE = 1 shl 3;
  GST_VIDEO_CHROMA_SITE_COSITED = GST_VIDEO_CHROMA_SITE_H_COSITED or GST_VIDEO_CHROMA_SITE_V_COSITED;
  GST_VIDEO_CHROMA_SITE_JPEG = GST_VIDEO_CHROMA_SITE_NONE;
  GST_VIDEO_CHROMA_SITE_MPEG2 = GST_VIDEO_CHROMA_SITE_H_COSITED;
  GST_VIDEO_CHROMA_SITE_DV = GST_VIDEO_CHROMA_SITE_COSITED or GST_VIDEO_CHROMA_SITE_ALT_LINE;

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
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstVideoChromaResample = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_video_chroma_from_string(s: Pgchar): TGstVideoChromaSite; cdecl; external libgstvideo; deprecated;
function gst_video_chroma_to_string(site: TGstVideoChromaSite): Pgchar; cdecl; external libgstvideo; deprecated;
function gst_video_chroma_site_from_string(s: Pgchar): TGstVideoChromaSite; cdecl; external libgstvideo;
function gst_video_chroma_site_to_string(site: TGstVideoChromaSite): Pgchar; cdecl; external libgstvideo;

function gst_video_chroma_resample_new(method: TGstVideoChromaMethod; site: TGstVideoChromaSite; flags: TGstVideoChromaFlags; format: TGstVideoFormat; h_factor: Tgint;
  v_factor: Tgint): PGstVideoChromaResample; cdecl; external libgstvideo;
procedure gst_video_chroma_resample_free(resample: PGstVideoChromaResample); cdecl; external libgstvideo;
procedure gst_video_chroma_resample_get_info(resample: PGstVideoChromaResample; n_lines: Pguint; offset: Pgint); cdecl; external libgstvideo;
procedure gst_video_chroma_resample(resample: PGstVideoChromaResample; lines: Pgpointer; width: Tgint); cdecl; external libgstvideo;
{$ENDIF read_function}

// === Konventiert am: 15-7-26 13:29:39 ===


implementation



end.
