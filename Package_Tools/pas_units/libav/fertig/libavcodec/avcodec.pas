unit avcodec;

interface

uses
  fp_ffmpeg, codec_id, codec, packet;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVCodecParameters = type Pointer;

const
  AV_INPUT_BUFFER_MIN_SIZE = 16384;

type
  TRcOverride = record
    start_frame: longint;
    end_frame: longint;
    qscale: longint;
    quality_factor: single;
  end;
  PRcOverride = ^TRcOverride;

const
  AV_CODEC_FLAG_UNALIGNED = 1 shl 0;
  AV_CODEC_FLAG_QSCALE = 1 shl 1;
  AV_CODEC_FLAG_4MV = 1 shl 2;
  AV_CODEC_FLAG_OUTPUT_CORRUPT = 1 shl 3;
  AV_CODEC_FLAG_QPEL = 1 shl 4;

const
  AV_CODEC_FLAG_DROPCHANGED = 1 shl 5;
  AV_CODEC_FLAG_RECON_FRAME = 1 shl 6;
  AV_CODEC_FLAG_COPY_OPAQUE = 1 shl 7;
  AV_CODEC_FLAG_FRAME_DURATION = 1 shl 8;
  AV_CODEC_FLAG_PASS1 = 1 shl 9;
  AV_CODEC_FLAG_PASS2 = 1 shl 10;
  AV_CODEC_FLAG_LOOP_FILTER = 1 shl 11;
  AV_CODEC_FLAG_GRAY = 1 shl 13;
  AV_CODEC_FLAG_PSNR = 1 shl 15;
  AV_CODEC_FLAG_INTERLACED_DCT = 1 shl 18;
  AV_CODEC_FLAG_LOW_DELAY = 1 shl 19;
  AV_CODEC_FLAG_GLOBAL_HEADER = 1 shl 22;
  AV_CODEC_FLAG_BITEXACT = 1 shl 23;
  AV_CODEC_FLAG_AC_PRED = 1 shl 24;
  AV_CODEC_FLAG_INTERLACED_ME = 1 shl 29;
  AV_CODEC_FLAG_CLOSED_GOP = 1 shl 31;
  AV_CODEC_FLAG2_FAST = 1 shl 0;
  AV_CODEC_FLAG2_NO_OUTPUT = 1 shl 2;
  AV_CODEC_FLAG2_LOCAL_HEADER = 1 shl 3;
  AV_CODEC_FLAG2_CHUNKS = 1 shl 15;
  AV_CODEC_FLAG2_IGNORE_CROP = 1 shl 16;
  AV_CODEC_FLAG2_SHOW_ALL = 1 shl 22;
  AV_CODEC_FLAG2_EXPORT_MVS = 1 shl 28;
  AV_CODEC_FLAG2_SKIP_MANUAL = 1 shl 29;
  AV_CODEC_FLAG2_RO_FLUSH_NOOP = 1 shl 30;
  AV_CODEC_FLAG2_ICC_PROFILES = 1 shl 31;
  AV_CODEC_EXPORT_DATA_MVS = 1 shl 0;
  AV_CODEC_EXPORT_DATA_PRFT = 1 shl 1;
  AV_CODEC_EXPORT_DATA_VIDEO_ENC_PARAMS = 1 shl 2;
  AV_CODEC_EXPORT_DATA_FILM_GRAIN = 1 shl 3;
  AV_GET_BUFFER_FLAG_REF = 1 shl 0;
  AV_GET_ENCODE_BUFFER_FLAG_REF = 1 shl 0;

  FF_COMPRESSION_DEFAULT = -(1);
  FF_CMP_SAD = 0;
  FF_CMP_SSE = 1;
  FF_CMP_SATD = 2;
  FF_CMP_DCT = 3;
  FF_CMP_PSNR = 4;
  FF_CMP_BIT = 5;
  FF_CMP_RD = 6;
  FF_CMP_ZERO = 7;
  FF_CMP_VSAD = 8;
  FF_CMP_VSSE = 9;
  FF_CMP_NSSE = 10;
  FF_CMP_W53 = 11;
  FF_CMP_W97 = 12;
  FF_CMP_DCTMAX = 13;
  FF_CMP_DCT264 = 14;
  FF_CMP_MEDIAN_SAD = 15;
  FF_CMP_CHROMA = 256;
  SLICE_FLAG_CODED_ORDER = $0001;
  SLICE_FLAG_ALLOW_FIELD = $0002;
  SLICE_FLAG_ALLOW_PLANE = $0004;
  FF_MB_DECISION_SIMPLE = 0;
  FF_MB_DECISION_BITS = 1;
  FF_MB_DECISION_RD = 2;
  FF_BUG_AUTODETECT = 1;
  FF_BUG_XVID_ILACE = 4;
  FF_BUG_UMP4 = 8;
  FF_BUG_NO_PADDING = 16;
  FF_BUG_AMV = 32;
  FF_BUG_QPEL_CHROMA = 64;
  FF_BUG_STD_QPEL = 128;
  FF_BUG_QPEL_CHROMA2 = 256;
  FF_BUG_DIRECT_BLOCKSIZE = 512;
  FF_BUG_EDGE = 1024;
  FF_BUG_HPEL_CHROMA = 2048;
  FF_BUG_DC_CLIP = 4096;
  FF_BUG_MS = 8192;
  FF_BUG_TRUNCATED = 16384;
  FF_BUG_IEDGE = 32768;
  FF_EC_GUESS_MVS = 1;
  FF_EC_DEBLOCK = 2;
  FF_EC_FAVOR_INTER = 256;
  FF_DEBUG_PICT_INFO = 1;
  FF_DEBUG_RC = 2;
  FF_DEBUG_BITSTREAM = 4;
  FF_DEBUG_MB_TYPE = 8;
  FF_DEBUG_QP = 16;
  FF_DEBUG_DCT_COEFF = $00000040;
  FF_DEBUG_SKIP = $00000080;
  FF_DEBUG_STARTCODE = $00000100;
  FF_DEBUG_ER = $00000400;
  FF_DEBUG_MMCO = $00000800;
  FF_DEBUG_BUGS = $00001000;
  FF_DEBUG_BUFFERS = $00008000;
  FF_DEBUG_THREADS = $00010000;
  FF_DEBUG_GREEN_MD = $00800000;
  FF_DEBUG_NOMC = $01000000;
  FF_DCT_AUTO = 0;
  FF_DCT_FASTINT = 1;
  FF_DCT_INT = 2;
  FF_DCT_MMX = 3;
  FF_DCT_ALTIVEC = 5;
  FF_DCT_FAAN = 6;
  FF_IDCT_AUTO = 0;
  FF_IDCT_INT = 1;
  FF_IDCT_SIMPLE = 2;
  FF_IDCT_SIMPLEMMX = 3;
  FF_IDCT_ARM = 7;
  FF_IDCT_ALTIVEC = 8;
  FF_IDCT_SIMPLEARM = 10;
  FF_IDCT_XVID = 14;
  FF_IDCT_SIMPLEARMV5TE = 16;
  FF_IDCT_SIMPLEARMV6 = 17;
  FF_IDCT_FAAN = 20;
  FF_IDCT_SIMPLENEON = 22;

const
  FF_IDCT_NONE = 24;

const
  FF_IDCT_SIMPLEAUTO = 128;
  FF_THREAD_FRAME = 1;
  FF_THREAD_SLICE = 2;
  FF_PROFILE_UNKNOWN = -(99);
  FF_PROFILE_RESERVED = -(100);
  FF_PROFILE_AAC_MAIN = 0;
  FF_PROFILE_AAC_LOW = 1;
  FF_PROFILE_AAC_SSR = 2;
  FF_PROFILE_AAC_LTP = 3;
  FF_PROFILE_AAC_HE = 4;
  FF_PROFILE_AAC_HE_V2 = 28;
  FF_PROFILE_AAC_LD = 22;
  FF_PROFILE_AAC_ELD = 38;
  FF_PROFILE_MPEG2_AAC_LOW = 128;
  FF_PROFILE_MPEG2_AAC_HE = 131;
  FF_PROFILE_DNXHD = 0;
  FF_PROFILE_DNXHR_LB = 1;
  FF_PROFILE_DNXHR_SQ = 2;
  FF_PROFILE_DNXHR_HQ = 3;
  FF_PROFILE_DNXHR_HQX = 4;
  FF_PROFILE_DNXHR_444 = 5;
  FF_PROFILE_DTS = 20;
  FF_PROFILE_DTS_ES = 30;
  FF_PROFILE_DTS_96_24 = 40;
  FF_PROFILE_DTS_HD_HRA = 50;
  FF_PROFILE_DTS_HD_MA = 60;
  FF_PROFILE_DTS_EXPRESS = 70;
  FF_PROFILE_DTS_HD_MA_X = 61;
  FF_PROFILE_DTS_HD_MA_X_IMAX = 62;
  FF_PROFILE_EAC3_DDP_ATMOS = 30;
  FF_PROFILE_TRUEHD_ATMOS = 30;
  FF_PROFILE_MPEG2_422 = 0;
  FF_PROFILE_MPEG2_HIGH = 1;
  FF_PROFILE_MPEG2_SS = 2;
  FF_PROFILE_MPEG2_SNR_SCALABLE = 3;
  FF_PROFILE_MPEG2_MAIN = 4;
  FF_PROFILE_MPEG2_SIMPLE = 5;
  FF_PROFILE_H264_CONSTRAINED = 1 shl 9;
  FF_PROFILE_H264_INTRA = 1 shl 11;
  FF_PROFILE_H264_BASELINE = 66;
  FF_PROFILE_H264_CONSTRAINED_BASELINE = 66 or FF_PROFILE_H264_CONSTRAINED;
  FF_PROFILE_H264_MAIN = 77;
  FF_PROFILE_H264_EXTENDED = 88;
  FF_PROFILE_H264_HIGH = 100;
  FF_PROFILE_H264_HIGH_10 = 110;
  FF_PROFILE_H264_HIGH_10_INTRA = 110 or FF_PROFILE_H264_INTRA;
  FF_PROFILE_H264_MULTIVIEW_HIGH = 118;
  FF_PROFILE_H264_HIGH_422 = 122;
  FF_PROFILE_H264_HIGH_422_INTRA = 122 or FF_PROFILE_H264_INTRA;
  FF_PROFILE_H264_STEREO_HIGH = 128;
  FF_PROFILE_H264_HIGH_444 = 144;
  FF_PROFILE_H264_HIGH_444_PREDICTIVE = 244;
  FF_PROFILE_H264_HIGH_444_INTRA = 244 or FF_PROFILE_H264_INTRA;
  FF_PROFILE_H264_CAVLC_444 = 44;
  FF_PROFILE_VC1_SIMPLE = 0;
  FF_PROFILE_VC1_MAIN = 1;
  FF_PROFILE_VC1_COMPLEX = 2;
  FF_PROFILE_VC1_ADVANCED = 3;
  FF_PROFILE_MPEG4_SIMPLE = 0;
  FF_PROFILE_MPEG4_SIMPLE_SCALABLE = 1;
  FF_PROFILE_MPEG4_CORE = 2;
  FF_PROFILE_MPEG4_MAIN = 3;
  FF_PROFILE_MPEG4_N_BIT = 4;
  FF_PROFILE_MPEG4_SCALABLE_TEXTURE = 5;
  FF_PROFILE_MPEG4_SIMPLE_FACE_ANIMATION = 6;
  FF_PROFILE_MPEG4_BASIC_ANIMATED_TEXTURE = 7;
  FF_PROFILE_MPEG4_HYBRID = 8;
  FF_PROFILE_MPEG4_ADVANCED_REAL_TIME = 9;
  FF_PROFILE_MPEG4_CORE_SCALABLE = 10;
  FF_PROFILE_MPEG4_ADVANCED_CODING = 11;
  FF_PROFILE_MPEG4_ADVANCED_CORE = 12;
  FF_PROFILE_MPEG4_ADVANCED_SCALABLE_TEXTURE = 13;
  FF_PROFILE_MPEG4_SIMPLE_STUDIO = 14;
  FF_PROFILE_MPEG4_ADVANCED_SIMPLE = 15;
  FF_PROFILE_JPEG2000_CSTREAM_RESTRICTION_0 = 1;
  FF_PROFILE_JPEG2000_CSTREAM_RESTRICTION_1 = 2;
  FF_PROFILE_JPEG2000_CSTREAM_NO_RESTRICTION = 32768;
  FF_PROFILE_JPEG2000_DCINEMA_2K = 3;
  FF_PROFILE_JPEG2000_DCINEMA_4K = 4;
  FF_PROFILE_VP9_0 = 0;
  FF_PROFILE_VP9_1 = 1;
  FF_PROFILE_VP9_2 = 2;
  FF_PROFILE_VP9_3 = 3;
  FF_PROFILE_HEVC_MAIN = 1;
  FF_PROFILE_HEVC_MAIN_10 = 2;
  FF_PROFILE_HEVC_MAIN_STILL_PICTURE = 3;
  FF_PROFILE_HEVC_REXT = 4;
  FF_PROFILE_HEVC_SCC = 9;
  FF_PROFILE_VVC_MAIN_10 = 1;
  FF_PROFILE_VVC_MAIN_10_444 = 33;
  FF_PROFILE_AV1_MAIN = 0;
  FF_PROFILE_AV1_HIGH = 1;
  FF_PROFILE_AV1_PROFESSIONAL = 2;
  FF_PROFILE_MJPEG_HUFFMAN_BASELINE_DCT = $c0;
  FF_PROFILE_MJPEG_HUFFMAN_EXTENDED_SEQUENTIAL_DCT = $c1;
  FF_PROFILE_MJPEG_HUFFMAN_PROGRESSIVE_DCT = $c2;
  FF_PROFILE_MJPEG_HUFFMAN_LOSSLESS = $c3;
  FF_PROFILE_MJPEG_JPEG_LS = $f7;
  FF_PROFILE_SBC_MSBC = 1;
  FF_PROFILE_PRORES_PROXY = 0;
  FF_PROFILE_PRORES_LT = 1;
  FF_PROFILE_PRORES_STANDARD = 2;
  FF_PROFILE_PRORES_HQ = 3;
  FF_PROFILE_PRORES_4444 = 4;
  FF_PROFILE_PRORES_XQ = 5;
  FF_PROFILE_ARIB_PROFILE_A = 0;
  FF_PROFILE_ARIB_PROFILE_C = 1;
  FF_PROFILE_KLVA_SYNC = 0;
  FF_PROFILE_KLVA_ASYNC = 1;
  FF_PROFILE_EVC_BASELINE = 0;
  FF_PROFILE_EVC_MAIN = 1;
  FF_LEVEL_UNKNOWN = -(99);
  FF_CODEC_PROPERTY_LOSSLESS = $00000001;
  FF_CODEC_PROPERTY_CLOSED_CAPTIONS = $00000002;
  FF_CODEC_PROPERTY_FILM_GRAIN = $00000004;
  FF_SUB_CHARENC_MODE_DO_NOTHING = -(1);
  FF_SUB_CHARENC_MODE_AUTOMATIC = 0;
  FF_SUB_CHARENC_MODE_PRE_DECODER = 1;
  FF_SUB_CHARENC_MODE_IGNORE = 2;
  AV_PARSER_PTS_NB = 4;
  PARSER_FLAG_COMPLETE_FRAMES = $0001;
  PARSER_FLAG_ONCE = $0002;
  PARSER_FLAG_FETCHED_OFFSET = $0004;
  PARSER_FLAG_USE_CODEC_TS = $1000;

type
  PAVCodecContext = type Pointer;
  PPAVCodecContext = ^PAVCodecContext;

  TAVHWAccel = record
    name: pchar;
    _type: TAVMediaType;
    id: TAVCodecID;
    pix_fmt: TAVPixelFormat;
    capabilities: longint;
  end;
  PAVHWAccel = ^TAVHWAccel;

const
  AV_HWACCEL_CODEC_CAP_EXPERIMENTAL = $0200;
  AV_HWACCEL_FLAG_IGNORE_LEVEL = 1 shl 0;
  AV_HWACCEL_FLAG_ALLOW_HIGH_DEPTH = 1 shl 1;
  AV_HWACCEL_FLAG_ALLOW_PROFILE_MISMATCH = 1 shl 2;
  AV_HWACCEL_FLAG_UNSAFE_OUTPUT = 1 shl 3;

type
  TAVSubtitleType = longint;

const
  SUBTITLE_NONE = 0;
  SUBTITLE_BITMAP = 1;
  SUBTITLE_TEXT = 2;
  SUBTITLE_ASS = 3;

const
  AV_SUBTITLE_FLAG_FORCED = $00000001;

type
  TAVSubtitleRect = record
    x: longint;
    y: longint;
    w: longint;
    h: longint;
    nb_colors: longint;
    data: array[0..3] of Puint8_t;
    linesize: array[0..3] of longint;
    _type: TAVSubtitleType;
    text: pchar;
    ass: pchar;
    flags: longint;
  end;
  PAVSubtitleRect = ^TAVSubtitleRect;

  TAVSubtitle = record
    format: Tuint16_t;
    start_display_time: Tuint32_t;
    end_display_time: Tuint32_t;
    num_rects: dword;
    rects: ^PAVSubtitleRect;
    pts: Tint64_t;
  end;
  PAVSubtitle = ^TAVSubtitle;

function avcodec_version: dword; cdecl; external libavcodec;
function avcodec_configuration: pchar; cdecl; external libavcodec;
function avcodec_license: pchar; cdecl; external libavcodec;
function avcodec_alloc_context3(codec: PAVCodec): PAVCodecContext; cdecl; external libavcodec;
procedure avcodec_free_context(avctx: PPAVCodecContext); cdecl; external libavcodec;
function avcodec_get_class: PAVClass; cdecl; external libavcodec;
function avcodec_get_subtitle_rect_class: PAVClass; cdecl; external libavcodec;
function avcodec_parameters_from_context(par: PAVCodecParameters; codec: PAVCodecContext): longint; cdecl; external libavcodec;
function avcodec_parameters_to_context(codec: PAVCodecContext; par: PAVCodecParameters): longint; cdecl; external libavcodec;
function avcodec_open2(avctx: PAVCodecContext; codec: PAVCodec; options: PPAVDictionary): longint; cdecl; external libavcodec;
function avcodec_close(avctx: PAVCodecContext): longint; cdecl; external libavcodec;
procedure avsubtitle_free(sub: PAVSubtitle); cdecl; external libavcodec;
function avcodec_default_get_buffer2(s: PAVCodecContext; frame: PAVFrame; flags: longint): longint; cdecl; external libavcodec;
function avcodec_default_get_encode_buffer(s: PAVCodecContext; pkt: PAVPacket; flags: longint): longint; cdecl; external libavcodec;
procedure avcodec_align_dimensions(s: PAVCodecContext; width: Plongint; height: Plongint); cdecl; external libavcodec;
procedure avcodec_align_dimensions2(s: PAVCodecContext; width: Plongint; height: Plongint; linesize_align: Plongint); cdecl; external libavcodec;
function avcodec_enum_to_chroma_pos(xpos: Plongint; ypos: Plongint; pos: TAVChromaLocation): longint; cdecl; external libavcodec;
function avcodec_chroma_pos_to_enum(xpos: longint; ypos: longint): TAVChromaLocation; cdecl; external libavcodec;
function avcodec_decode_subtitle2(avctx: PAVCodecContext; sub: PAVSubtitle; got_sub_ptr: Plongint; avpkt: PAVPacket): longint; cdecl; external libavcodec;
function avcodec_send_packet(avctx: PAVCodecContext; avpkt: PAVPacket): longint; cdecl; external libavcodec;
function avcodec_receive_frame(avctx: PAVCodecContext; frame: PAVFrame): longint; cdecl; external libavcodec;
function avcodec_send_frame(avctx: PAVCodecContext; frame: PAVFrame): longint; cdecl; external libavcodec;
function avcodec_receive_packet(avctx: PAVCodecContext; avpkt: PAVPacket): longint; cdecl; external libavcodec;
function avcodec_get_hw_frames_parameters(avctx: PAVCodecContext; device_ref: PAVBufferRef; hw_pix_fmt: TAVPixelFormat; out_frames_ref: PPAVBufferRef): longint; cdecl; external libavcodec;

type
  TAVPictureStructure = longint;

const
  AV_PICTURE_STRUCTURE_UNKNOWN = 0;
  AV_PICTURE_STRUCTURE_TOP_FIELD = 1;
  AV_PICTURE_STRUCTURE_BOTTOM_FIELD = 2;
  AV_PICTURE_STRUCTURE_FRAME = 3;

type
  PAVCodecParserContext = type Pointer;

  TAVCodecParser = record
    codec_ids: array[0..6] of longint;
    priv_data_size: longint;
    parser_init: function(s: PAVCodecParserContext): longint; cdecl;
    parser_parse: function(s: PAVCodecParserContext; avctx: PAVCodecContext; poutbuf: PPuint8_t; poutbuf_size: Plongint; buf: Puint8_t;
      buf_size: longint): longint; cdecl;
    parser_close: procedure(s: PAVCodecParserContext); cdecl;
    split: function(avctx: PAVCodecContext; buf: Puint8_t; buf_size: longint): longint; cdecl;
  end;
  PAVCodecParser = ^TAVCodecParser;

function av_parser_iterate(opaque: Ppointer): PAVCodecParser; cdecl; external libavcodec;
function av_parser_init(codec_id: longint): PAVCodecParserContext; cdecl; external libavcodec;
function av_parser_parse2(s: PAVCodecParserContext; avctx: PAVCodecContext; poutbuf: PPuint8_t; poutbuf_size: Plongint; buf: Puint8_t;
  buf_size: longint; pts: Tint64_t; dts: Tint64_t; pos: Tint64_t): longint; cdecl; external libavcodec;
procedure av_parser_close(s: PAVCodecParserContext); cdecl; external libavcodec;
function avcodec_encode_subtitle(avctx: PAVCodecContext; buf: Puint8_t; buf_size: longint; sub: PAVSubtitle): longint; cdecl; external libavcodec;
function avcodec_pix_fmt_to_codec_tag(pix_fmt: TAVPixelFormat): dword; cdecl; external libavcodec;
function avcodec_find_best_pix_fmt_of_list(pix_fmt_list: PAVPixelFormat; src_pix_fmt: TAVPixelFormat; has_alpha: longint; loss_ptr: Plongint): TAVPixelFormat; cdecl; external libavcodec;
function avcodec_default_get_format(s: PAVCodecContext; fmt: PAVPixelFormat): TAVPixelFormat; cdecl; external libavcodec;
procedure avcodec_string(buf: pchar; buf_size: longint; enc: PAVCodecContext; encode: longint); cdecl; external libavcodec;

type
  TAVCodecDefaultExecuteCallback = function(c2: PAVCodecContext; arg2: pointer): longint; cdecl;
  TAVCodecDefaultExecute2Callback = function(c2: PAVCodecContext; arg2: pointer; para3: longint; para4: longint): longint; cdecl;

function avcodec_default_execute(c: PAVCodecContext; func: TAVCodecDefaultExecuteCallback; arg: pointer; ret: Plongint; count: longint;
  size: longint): longint; cdecl; external libavcodec;
function avcodec_default_execute2(c: PAVCodecContext; func: TAVCodecDefaultExecute2Callback; arg: pointer; ret: Plongint; count: longint): longint; cdecl; external libavcodec;
function avcodec_fill_audio_frame(frame: PAVFrame; nb_channels: longint; sample_fmt: TAVSampleFormat; buf: Puint8_t; buf_size: longint;
  align: longint): longint; cdecl; external libavcodec;
procedure avcodec_flush_buffers(avctx: PAVCodecContext); cdecl; external libavcodec;
function av_get_audio_frame_duration(avctx: PAVCodecContext; frame_bytes: longint): longint; cdecl; external libavcodec;
procedure av_fast_padded_malloc(ptr: pointer; size: Pdword; min_size: Tsize_t); cdecl; external libavcodec;
procedure av_fast_padded_mallocz(ptr: pointer; size: Pdword; min_size: Tsize_t); cdecl; external libavcodec;
function avcodec_is_open(s: PAVCodecContext): longint; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:09:56 ===


implementation



end.
