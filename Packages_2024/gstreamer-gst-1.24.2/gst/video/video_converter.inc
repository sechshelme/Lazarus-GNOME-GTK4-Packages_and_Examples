
{$IFDEF read_interface}


const
  GST_VIDEO_CONVERTER_OPT_RESAMPLER_METHOD = 'GstVideoConverter.resampler-method';
  GST_VIDEO_CONVERTER_OPT_CHROMA_RESAMPLER_METHOD = 'GstVideoConverter.chroma-resampler-method';
  GST_VIDEO_CONVERTER_OPT_RESAMPLER_TAPS = 'GstVideoConverter.resampler-taps';
  GST_VIDEO_CONVERTER_OPT_DITHER_METHOD = 'GstVideoConverter.dither-method';
  GST_VIDEO_CONVERTER_OPT_DITHER_QUANTIZATION = 'GstVideoConverter.dither-quantization';
  GST_VIDEO_CONVERTER_OPT_SRC_X = 'GstVideoConverter.src-x';
  GST_VIDEO_CONVERTER_OPT_SRC_Y = 'GstVideoConverter.src-y';
  GST_VIDEO_CONVERTER_OPT_SRC_WIDTH = 'GstVideoConverter.src-width';
  GST_VIDEO_CONVERTER_OPT_SRC_HEIGHT = 'GstVideoConverter.src-height';
  GST_VIDEO_CONVERTER_OPT_DEST_X = 'GstVideoConverter.dest-x';
  GST_VIDEO_CONVERTER_OPT_DEST_Y = 'GstVideoConverter.dest-y';
  GST_VIDEO_CONVERTER_OPT_DEST_WIDTH = 'GstVideoConverter.dest-width';
  GST_VIDEO_CONVERTER_OPT_DEST_HEIGHT = 'GstVideoConverter.dest-height';
  GST_VIDEO_CONVERTER_OPT_FILL_BORDER = 'GstVideoConverter.fill-border';
  GST_VIDEO_CONVERTER_OPT_ALPHA_VALUE = 'GstVideoConverter.alpha-value';

type
  PGstVideoAlphaMode = ^TGstVideoAlphaMode;
  TGstVideoAlphaMode = longint;

const
  GST_VIDEO_ALPHA_MODE_COPY = 0;
  GST_VIDEO_ALPHA_MODE_SET = 1;
  GST_VIDEO_ALPHA_MODE_MULT = 2;

const
  GST_VIDEO_CONVERTER_OPT_ALPHA_MODE = 'GstVideoConverter.alpha-mode';
  GST_VIDEO_CONVERTER_OPT_BORDER_ARGB = 'GstVideoConverter.border-argb';

type
  PGstVideoChromaMode = ^TGstVideoChromaMode;
  TGstVideoChromaMode = longint;

const
  GST_VIDEO_CHROMA_MODE_FULL = 0;
  GST_VIDEO_CHROMA_MODE_UPSAMPLE_ONLY = 1;
  GST_VIDEO_CHROMA_MODE_DOWNSAMPLE_ONLY = 2;
  GST_VIDEO_CHROMA_MODE_NONE = 3;

const
  GST_VIDEO_CONVERTER_OPT_CHROMA_MODE = 'GstVideoConverter.chroma-mode';

type
  PGstVideoMatrixMode = ^TGstVideoMatrixMode;
  TGstVideoMatrixMode = longint;

const
  GST_VIDEO_MATRIX_MODE_FULL = 0;
  GST_VIDEO_MATRIX_MODE_INPUT_ONLY = 1;
  GST_VIDEO_MATRIX_MODE_OUTPUT_ONLY = 2;
  GST_VIDEO_MATRIX_MODE_NONE = 3;

const
  GST_VIDEO_CONVERTER_OPT_MATRIX_MODE = 'GstVideoConverter.matrix-mode';

type
  PGstVideoGammaMode = ^TGstVideoGammaMode;
  TGstVideoGammaMode = longint;

const
  GST_VIDEO_GAMMA_MODE_NONE = 0;
  GST_VIDEO_GAMMA_MODE_REMAP = 1;

const
  GST_VIDEO_CONVERTER_OPT_GAMMA_MODE = 'GstVideoConverter.gamma-mode';

type
  PGstVideoPrimariesMode = ^TGstVideoPrimariesMode;
  TGstVideoPrimariesMode = longint;

const
  GST_VIDEO_PRIMARIES_MODE_NONE = 0;
  GST_VIDEO_PRIMARIES_MODE_MERGE_ONLY = 1;
  GST_VIDEO_PRIMARIES_MODE_FAST = 2;

const
  GST_VIDEO_CONVERTER_OPT_PRIMARIES_MODE = 'GstVideoConverter.primaries-mode';
  GST_VIDEO_CONVERTER_OPT_THREADS = 'GstVideoConverter.threads';
  GST_VIDEO_CONVERTER_OPT_ASYNC_TASKS = 'GstVideoConverter.async-tasks';

type
  TGstVideoConverter=record
      end;
  PGstVideoConverter=^TGstVideoConverter;

function gst_video_converter_new(in_info: PGstVideoInfo; out_info: PGstVideoInfo; config: PGstStructure): PGstVideoConverter; cdecl; external libgstvideo;
function gst_video_converter_new_with_pool(in_info: PGstVideoInfo; out_info: PGstVideoInfo; config: PGstStructure; pool: PGstTaskPool): PGstVideoConverter; cdecl; external libgstvideo;
procedure gst_video_converter_free(convert: PGstVideoConverter); cdecl; external libgstvideo;
function gst_video_converter_set_config(convert: PGstVideoConverter; config: PGstStructure): Tgboolean; cdecl; external libgstvideo;
function gst_video_converter_get_config(convert: PGstVideoConverter): PGstStructure; cdecl; external libgstvideo;
procedure gst_video_converter_frame(convert: PGstVideoConverter; src: PGstVideoFrame; dest: PGstVideoFrame); cdecl; external libgstvideo;
procedure gst_video_converter_frame_finish(convert: PGstVideoConverter); cdecl; external libgstvideo;
function gst_video_converter_get_in_info(convert: PGstVideoConverter): PGstVideoInfo; cdecl; external libgstvideo;
function gst_video_converter_get_out_info(convert: PGstVideoConverter): PGstVideoInfo; cdecl; external libgstvideo;

// === Konventiert am: 30-9-24 16:59:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
