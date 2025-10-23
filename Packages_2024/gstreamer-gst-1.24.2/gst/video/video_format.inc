
{$IFDEF read_interface}

type
  PGstVideoFormat = ^TGstVideoFormat;
  TGstVideoFormat = longint;

const
  GST_VIDEO_FORMAT_UNKNOWN = 0;
  GST_VIDEO_FORMAT_ENCODED = 1;
  GST_VIDEO_FORMAT_I420 = 2;
  GST_VIDEO_FORMAT_YV12 = 3;
  GST_VIDEO_FORMAT_YUY2 = 4;
  GST_VIDEO_FORMAT_UYVY = 5;
  GST_VIDEO_FORMAT_AYUV = 6;
  GST_VIDEO_FORMAT_RGBx = 7;
  GST_VIDEO_FORMAT_BGRx = 8;
  GST_VIDEO_FORMAT_xRGB = 9;
  GST_VIDEO_FORMAT_xBGR = 10;
  GST_VIDEO_FORMAT_RGBA = 11;
  GST_VIDEO_FORMAT_BGRA = 12;
  GST_VIDEO_FORMAT_ARGB = 13;
  GST_VIDEO_FORMAT_ABGR = 14;
  GST_VIDEO_FORMAT_RGB = 15;
  GST_VIDEO_FORMAT_BGR = 16;
  GST_VIDEO_FORMAT_Y41B = 17;
  GST_VIDEO_FORMAT_Y42B = 18;
  GST_VIDEO_FORMAT_YVYU = 19;
  GST_VIDEO_FORMAT_Y444 = 20;
  GST_VIDEO_FORMAT_v210 = 21;
  GST_VIDEO_FORMAT_v216 = 22;
  GST_VIDEO_FORMAT_NV12 = 23;
  GST_VIDEO_FORMAT_NV21 = 24;
  GST_VIDEO_FORMAT_GRAY8 = 25;
  GST_VIDEO_FORMAT_GRAY16_BE = 26;
  GST_VIDEO_FORMAT_GRAY16_LE = 27;
  GST_VIDEO_FORMAT_v308 = 28;
  GST_VIDEO_FORMAT_RGB16 = 29;
  GST_VIDEO_FORMAT_BGR16 = 30;
  GST_VIDEO_FORMAT_RGB15 = 31;
  GST_VIDEO_FORMAT_BGR15 = 32;
  GST_VIDEO_FORMAT_UYVP = 33;
  GST_VIDEO_FORMAT_A420 = 34;
  GST_VIDEO_FORMAT_RGB8P = 35;
  GST_VIDEO_FORMAT_YUV9 = 36;
  GST_VIDEO_FORMAT_YVU9 = 37;
  GST_VIDEO_FORMAT_IYU1 = 38;
  GST_VIDEO_FORMAT_ARGB64 = 39;
  GST_VIDEO_FORMAT_AYUV64 = 40;
  GST_VIDEO_FORMAT_r210 = 41;
  GST_VIDEO_FORMAT_I420_10BE = 42;
  GST_VIDEO_FORMAT_I420_10LE = 43;
  GST_VIDEO_FORMAT_I422_10BE = 44;
  GST_VIDEO_FORMAT_I422_10LE = 45;
  GST_VIDEO_FORMAT_Y444_10BE = 46;
  GST_VIDEO_FORMAT_Y444_10LE = 47;
  GST_VIDEO_FORMAT_GBR = 48;
  GST_VIDEO_FORMAT_GBR_10BE = 49;
  GST_VIDEO_FORMAT_GBR_10LE = 50;
  GST_VIDEO_FORMAT_NV16 = 51;
  GST_VIDEO_FORMAT_NV24 = 52;
  GST_VIDEO_FORMAT_NV12_64Z32 = 53;
  GST_VIDEO_FORMAT_A420_10BE = 54;
  GST_VIDEO_FORMAT_A420_10LE = 55;
  GST_VIDEO_FORMAT_A422_10BE = 56;
  GST_VIDEO_FORMAT_A422_10LE = 57;
  GST_VIDEO_FORMAT_A444_10BE = 58;
  GST_VIDEO_FORMAT_A444_10LE = 59;
  GST_VIDEO_FORMAT_NV61 = 60;
  GST_VIDEO_FORMAT_P010_10BE = 61;
  GST_VIDEO_FORMAT_P010_10LE = 62;
  GST_VIDEO_FORMAT_IYU2 = 63;
  GST_VIDEO_FORMAT_VYUY = 64;
  GST_VIDEO_FORMAT_GBRA = 65;
  GST_VIDEO_FORMAT_GBRA_10BE = 66;
  GST_VIDEO_FORMAT_GBRA_10LE = 67;
  GST_VIDEO_FORMAT_GBR_12BE = 68;
  GST_VIDEO_FORMAT_GBR_12LE = 69;
  GST_VIDEO_FORMAT_GBRA_12BE = 70;
  GST_VIDEO_FORMAT_GBRA_12LE = 71;
  GST_VIDEO_FORMAT_I420_12BE = 72;
  GST_VIDEO_FORMAT_I420_12LE = 73;
  GST_VIDEO_FORMAT_I422_12BE = 74;
  GST_VIDEO_FORMAT_I422_12LE = 75;
  GST_VIDEO_FORMAT_Y444_12BE = 76;
  GST_VIDEO_FORMAT_Y444_12LE = 77;
  GST_VIDEO_FORMAT_GRAY10_LE32 = 78;
  GST_VIDEO_FORMAT_NV12_10LE32 = 79;
  GST_VIDEO_FORMAT_NV16_10LE32 = 80;
  GST_VIDEO_FORMAT_NV12_10LE40 = 81;
  GST_VIDEO_FORMAT_Y210 = 82;
  GST_VIDEO_FORMAT_Y410 = 83;
  GST_VIDEO_FORMAT_VUYA = 84;
  GST_VIDEO_FORMAT_BGR10A2_LE = 85;
  GST_VIDEO_FORMAT_RGB10A2_LE = 86;
  GST_VIDEO_FORMAT_Y444_16BE = 87;
  GST_VIDEO_FORMAT_Y444_16LE = 88;
  GST_VIDEO_FORMAT_P016_BE = 89;
  GST_VIDEO_FORMAT_P016_LE = 90;
  GST_VIDEO_FORMAT_P012_BE = 91;
  GST_VIDEO_FORMAT_P012_LE = 92;
  GST_VIDEO_FORMAT_Y212_BE = 93;
  GST_VIDEO_FORMAT_Y212_LE = 94;
  GST_VIDEO_FORMAT_Y412_BE = 95;
  GST_VIDEO_FORMAT_Y412_LE = 96;
  GST_VIDEO_FORMAT_NV12_4L4 = 97;
  GST_VIDEO_FORMAT_NV12_32L32 = 98;
  GST_VIDEO_FORMAT_RGBP = 99;
  GST_VIDEO_FORMAT_BGRP = 100;
  GST_VIDEO_FORMAT_AV12 = 101;
  GST_VIDEO_FORMAT_ARGB64_LE = 102;
  GST_VIDEO_FORMAT_ARGB64_BE = 103;
  GST_VIDEO_FORMAT_RGBA64_LE = 104;
  GST_VIDEO_FORMAT_RGBA64_BE = 105;
  GST_VIDEO_FORMAT_BGRA64_LE = 106;
  GST_VIDEO_FORMAT_BGRA64_BE = 107;
  GST_VIDEO_FORMAT_ABGR64_LE = 108;
  GST_VIDEO_FORMAT_ABGR64_BE = 109;
  GST_VIDEO_FORMAT_NV12_16L32S = 110;
  GST_VIDEO_FORMAT_NV12_8L128 = 111;
  GST_VIDEO_FORMAT_NV12_10BE_8L128 = 112;
  GST_VIDEO_FORMAT_NV12_10LE40_4L4 = 113;
  GST_VIDEO_FORMAT_DMA_DRM = 114;
  GST_VIDEO_FORMAT_MT2110T = 115;
  GST_VIDEO_FORMAT_MT2110R = 116;
  GST_VIDEO_FORMAT_A422 = 117;
  GST_VIDEO_FORMAT_A444 = 118;
  GST_VIDEO_FORMAT_A444_12LE = 119;
  GST_VIDEO_FORMAT_A444_12BE = 120;
  GST_VIDEO_FORMAT_A422_12LE = 121;
  GST_VIDEO_FORMAT_A422_12BE = 122;
  GST_VIDEO_FORMAT_A420_12LE = 123;
  GST_VIDEO_FORMAT_A420_12BE = 124;
  GST_VIDEO_FORMAT_A444_16LE = 125;
  GST_VIDEO_FORMAT_A444_16BE = 126;
  GST_VIDEO_FORMAT_A422_16LE = 127;
  GST_VIDEO_FORMAT_A422_16BE = 128;
  GST_VIDEO_FORMAT_A420_16LE = 129;
  GST_VIDEO_FORMAT_A420_16BE = 130;
  GST_VIDEO_FORMAT_GBR_16LE = 131;
  GST_VIDEO_FORMAT_GBR_16BE = 132;
  GST_VIDEO_FORMAT_RBGA = 133;


type
  PGstVideoFormatFlags = ^TGstVideoFormatFlags;
  TGstVideoFormatFlags = longint;

const
  GST_VIDEO_FORMAT_FLAG_YUV = 1 shl 0;
  GST_VIDEO_FORMAT_FLAG_RGB = 1 shl 1;
  GST_VIDEO_FORMAT_FLAG_GRAY = 1 shl 2;
  GST_VIDEO_FORMAT_FLAG_ALPHA = 1 shl 3;
  GST_VIDEO_FORMAT_FLAG_LE = 1 shl 4;
  GST_VIDEO_FORMAT_FLAG_PALETTE = 1 shl 5;
  GST_VIDEO_FORMAT_FLAG_COMPLEX = 1 shl 6;
  GST_VIDEO_FORMAT_FLAG_UNPACK = 1 shl 7;
  GST_VIDEO_FORMAT_FLAG_TILED = 1 shl 8;
  GST_VIDEO_FORMAT_FLAG_SUBTILES = 1 shl 9;

const
  GST_VIDEO_COMP_Y = 0;
  GST_VIDEO_COMP_U = 1;
  GST_VIDEO_COMP_V = 2;
  GST_VIDEO_COMP_R = 0;
  GST_VIDEO_COMP_G = 1;
  GST_VIDEO_COMP_B = 2;
  GST_VIDEO_COMP_A = 3;
  GST_VIDEO_COMP_INDEX = 0;
  GST_VIDEO_COMP_PALETTE = 1;

type
  PGstVideoPackFlags = ^TGstVideoPackFlags;
  TGstVideoPackFlags = longint;

const
  GST_VIDEO_PACK_FLAG_NONE = 0;
  GST_VIDEO_PACK_FLAG_TRUNCATE_RANGE = 1 shl 0;
  GST_VIDEO_PACK_FLAG_INTERLACED = 1 shl 1;

type
  PGstVideoFormatInfo = ^TGstVideoFormatInfo;
  TGstVideoFormatUnpack = procedure(info: PGstVideoFormatInfo; flags: TGstVideoPackFlags; dest: Tgpointer; Data: Pgpointer; stride: Pgint; x: Tgint; y: Tgint; Width: Tgint); cdecl;
  TGstVideoFormatPack = procedure(info: PGstVideoFormatInfo; flags: TGstVideoPackFlags; src: Tgpointer; sstride: Tgint; Data: Pgpointer; stride: Pgint; chroma_site: TGstVideoChromaSite; y: Tgint; Width: Tgint); cdecl;

  TGstVideoFormatInfo = record
    format: TGstVideoFormat;
    Name: Pgchar;
    description: Pgchar;
    flags: TGstVideoFormatFlags;
    bits: Tguint;
    n_components: Tguint;
    shift: array[0..(GST_VIDEO_MAX_COMPONENTS) - 1] of Tguint;
    depth: array[0..(GST_VIDEO_MAX_COMPONENTS) - 1] of Tguint;
    pixel_stride: array[0..(GST_VIDEO_MAX_COMPONENTS) - 1] of Tgint;
    n_planes: Tguint;
    plane: array[0..(GST_VIDEO_MAX_COMPONENTS) - 1] of Tguint;
    poffset: array[0..(GST_VIDEO_MAX_COMPONENTS) - 1] of Tguint;
    w_sub: array[0..(GST_VIDEO_MAX_COMPONENTS) - 1] of Tguint;
    h_sub: array[0..(GST_VIDEO_MAX_COMPONENTS) - 1] of Tguint;
    unpack_format: TGstVideoFormat;
    unpack_func: TGstVideoFormatUnpack;
    pack_lines: Tgint;
    pack_func: TGstVideoFormatPack;
    tile_mode: TGstVideoTileMode;
    tile_info: array[0..(GST_VIDEO_MAX_PLANES) - 1] of TGstVideoTileInfo;
  end;


procedure gst_video_format_info_component(info: PGstVideoFormatInfo; plane: Tguint; Components: Pgint); cdecl; external libgstvideo;
function gst_video_format_info_extrapolate_stride(finfo: PGstVideoFormatInfo; plane: Tgint; stride: Tgint): Tgint; cdecl; external libgstvideo;
function gst_video_format_from_masks(depth: Tgint; bpp: Tgint; endianness: Tgint; red_mask: Tguint; green_mask: Tguint;
  blue_mask: Tguint; alpha_mask: Tguint): TGstVideoFormat; cdecl; external libgstvideo;
function gst_video_format_from_fourcc(fourcc: Tguint32): TGstVideoFormat; cdecl; external libgstvideo;
function gst_video_format_from_string(format: Pgchar): TGstVideoFormat; cdecl; external libgstvideo;
function gst_video_format_to_fourcc(format: TGstVideoFormat): Tguint32; cdecl; external libgstvideo;
function gst_video_format_to_string(format: TGstVideoFormat): Pgchar; cdecl; external libgstvideo;
function gst_video_format_get_info(format: TGstVideoFormat): PGstVideoFormatInfo; cdecl; external libgstvideo;
function gst_video_format_get_palette(format: TGstVideoFormat; size: Pgsize): Tgconstpointer; cdecl; external libgstvideo;

const
  GST_VIDEO_SIZE_RANGE = '(int) [ 1, max ]';
  GST_VIDEO_FPS_RANGE = '(fraction) [ 0, max ]';

function gst_video_formats_raw(len: Pguint): PGstVideoFormat; cdecl; external libgstvideo;
function gst_video_formats_any(len: Pguint): PGstVideoFormat; cdecl; external libgstvideo;
function gst_video_make_raw_caps(formats: PGstVideoFormat; len: Tguint): PGstCaps; cdecl; external libgstvideo;
function gst_video_make_raw_caps_with_features(formats: PGstVideoFormat; len: Tguint; features: PGstCapsFeatures): PGstCaps; cdecl; external libgstvideo;


function GST_VIDEO_FORMAT_INFO_IS_VALID_RAW(info: PGstVideoFormatInfo): Tgboolean;
function GST_VIDEO_FORMAT_INFO_FORMAT(info: PGstVideoFormatInfo): TGstVideoFormat;
function GST_VIDEO_FORMAT_INFO_NAME(info: PGstVideoFormatInfo): Pgchar;
function GST_VIDEO_FORMAT_INFO_FLAGS(info: PGstVideoFormatInfo): TGstVideoFormatFlags;
function GST_VIDEO_FORMAT_INFO_IS_YUV(info: PGstVideoFormatInfo): Tgboolean;
function GST_VIDEO_FORMAT_INFO_IS_RGB(info: PGstVideoFormatInfo): Tgboolean;
function GST_VIDEO_FORMAT_INFO_IS_GRAY(info: PGstVideoFormatInfo): Tgboolean;
function GST_VIDEO_FORMAT_INFO_HAS_ALPHA(info: PGstVideoFormatInfo): Tgboolean;
function GST_VIDEO_FORMAT_INFO_IS_LE(info: PGstVideoFormatInfo): Tgboolean;
function GST_VIDEO_FORMAT_INFO_HAS_PALETTE(info: PGstVideoFormatInfo): Tgboolean;
function GST_VIDEO_FORMAT_INFO_IS_COMPLEX(info: PGstVideoFormatInfo): Tgboolean;
function GST_VIDEO_FORMAT_INFO_IS_TILED(info: PGstVideoFormatInfo): Tgboolean;
function GST_VIDEO_FORMAT_INFO_HAS_SUBTILES(info: PGstVideoFormatInfo): Tgboolean;
function GST_VIDEO_FORMAT_INFO_BITS(info: PGstVideoFormatInfo): Tguint;
function GST_VIDEO_FORMAT_INFO_N_COMPONENTS(info: PGstVideoFormatInfo): Tguint;
function GST_VIDEO_FORMAT_INFO_SHIFT(info: PGstVideoFormatInfo; c: longint): Tgint;
function GST_VIDEO_FORMAT_INFO_DEPTH(info: PGstVideoFormatInfo; c: longint): Tgint;
function GST_VIDEO_FORMAT_INFO_PSTRIDE(info: PGstVideoFormatInfo; c: longint): Tguint;
function GST_VIDEO_FORMAT_INFO_N_PLANES(info: PGstVideoFormatInfo): Tguint;
function GST_VIDEO_FORMAT_INFO_PLANE(info: PGstVideoFormatInfo; c: longint): Tguint;
function GST_VIDEO_FORMAT_INFO_POFFSET(info: PGstVideoFormatInfo; c: longint): Tguint;
function GST_VIDEO_FORMAT_INFO_W_SUB(info: PGstVideoFormatInfo; c: longint): Tgint;
function GST_VIDEO_FORMAT_INFO_H_SUB(info: PGstVideoFormatInfo; c: longint): Tgint;
function GST_VIDEO_SUB_SCALE(scale, val: longint): longint;
function GST_VIDEO_FORMAT_INFO_SCALE_WIDTH(info: PGstVideoFormatInfo; c, w: longint): Tguint;
function GST_VIDEO_FORMAT_INFO_SCALE_HEIGHT(info: PGstVideoFormatInfo; c, h: longint): Tguint;
function GST_VIDEO_FORMAT_INFO_TILE_MODE(info: PGstVideoFormatInfo): TGstVideoTileMode;
function GST_VIDEO_FORMAT_INFO_TILE_WS(info: PGstVideoFormatInfo): longint;
function GST_VIDEO_FORMAT_INFO_TILE_HS(info: PGstVideoFormatInfo): longint;
function GST_VIDEO_FORMAT_INFO_TILE_SIZE(info: PGstVideoFormatInfo; plane: longint): Tgint;
function GST_VIDEO_FORMAT_INFO_TILE_WIDTH(info: PGstVideoFormatInfo; plane: longint): Tgint;
function GST_VIDEO_FORMAT_INFO_TILE_HEIGHT(info: PGstVideoFormatInfo; plane: longint): Tgint;
function GST_VIDEO_FORMAT_INFO_TILE_STRIDE(info: PGstVideoFormatInfo; plane: longint): Tgint;


// === Konventiert am: 29-9-24 13:56:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_VIDEO_FORMAT_INFO_IS_VALID_RAW(info: PGstVideoFormatInfo): Tgboolean;
begin
  Result := (info <> nil) and (info^.format > GST_VIDEO_FORMAT_ENCODED);
end;

function GST_VIDEO_FORMAT_INFO_FORMAT(info: PGstVideoFormatInfo): TGstVideoFormat;
begin
  GST_VIDEO_FORMAT_INFO_FORMAT := info^.format;
end;

function GST_VIDEO_FORMAT_INFO_NAME(info: PGstVideoFormatInfo): Pgchar;
begin
  GST_VIDEO_FORMAT_INFO_NAME := info^.Name;
end;

function GST_VIDEO_FORMAT_INFO_FLAGS(info: PGstVideoFormatInfo
  ): TGstVideoFormatFlags;
begin
  GST_VIDEO_FORMAT_INFO_FLAGS := info^.flags;
end;

function GST_VIDEO_FORMAT_INFO_IS_YUV(info: PGstVideoFormatInfo): Tgboolean;
begin
  GST_VIDEO_FORMAT_INFO_IS_YUV := ((info^.flags) and GST_VIDEO_FORMAT_FLAG_YUV) <> 0;
end;

function GST_VIDEO_FORMAT_INFO_IS_RGB(info: PGstVideoFormatInfo): Tgboolean;
begin
  GST_VIDEO_FORMAT_INFO_IS_RGB := ((info^.flags) and GST_VIDEO_FORMAT_FLAG_RGB) <> 0;
end;

function GST_VIDEO_FORMAT_INFO_IS_GRAY(info: PGstVideoFormatInfo): Tgboolean;
begin
  GST_VIDEO_FORMAT_INFO_IS_GRAY := ((info^.flags) and GST_VIDEO_FORMAT_FLAG_GRAY) <> 0;
end;

function GST_VIDEO_FORMAT_INFO_HAS_ALPHA(info: PGstVideoFormatInfo): Tgboolean;
begin
  GST_VIDEO_FORMAT_INFO_HAS_ALPHA := ((info^.flags) and GST_VIDEO_FORMAT_FLAG_ALPHA) <> 0;
end;

function GST_VIDEO_FORMAT_INFO_IS_LE(info: PGstVideoFormatInfo): Tgboolean;
begin
  GST_VIDEO_FORMAT_INFO_IS_LE := ((info^.flags) and GST_VIDEO_FORMAT_FLAG_LE) <> 0;
end;

function GST_VIDEO_FORMAT_INFO_HAS_PALETTE(info: PGstVideoFormatInfo
  ): Tgboolean;
begin
  GST_VIDEO_FORMAT_INFO_HAS_PALETTE := ((info^.flags) and GST_VIDEO_FORMAT_FLAG_PALETTE) <> 0;
end;

function GST_VIDEO_FORMAT_INFO_IS_COMPLEX(info: PGstVideoFormatInfo): Tgboolean;
begin
  GST_VIDEO_FORMAT_INFO_IS_COMPLEX := ((info^.flags) and GST_VIDEO_FORMAT_FLAG_COMPLEX) <> 0;
end;

function GST_VIDEO_FORMAT_INFO_IS_TILED(info: PGstVideoFormatInfo): Tgboolean;
begin
  GST_VIDEO_FORMAT_INFO_IS_TILED := ((info^.flags) and GST_VIDEO_FORMAT_FLAG_TILED) <> 0;
end;

function GST_VIDEO_FORMAT_INFO_HAS_SUBTILES(info: PGstVideoFormatInfo): Tgboolean;
begin
  GST_VIDEO_FORMAT_INFO_HAS_SUBTILES := ((info^.flags) and GST_VIDEO_FORMAT_FLAG_SUBTILES) <> 0;
end;

function GST_VIDEO_FORMAT_INFO_BITS(info: PGstVideoFormatInfo): Tguint;
begin
  GST_VIDEO_FORMAT_INFO_BITS := info^.bits;
end;

function GST_VIDEO_FORMAT_INFO_N_COMPONENTS(info: PGstVideoFormatInfo): Tguint;
begin
  GST_VIDEO_FORMAT_INFO_N_COMPONENTS := info^.n_components;
end;

function GST_VIDEO_FORMAT_INFO_SHIFT(info: PGstVideoFormatInfo; c: longint
  ): Tgint;
begin
  GST_VIDEO_FORMAT_INFO_SHIFT := info^.shift[c];
end;

function GST_VIDEO_FORMAT_INFO_DEPTH(info: PGstVideoFormatInfo; c: longint
  ): Tgint;
begin
  GST_VIDEO_FORMAT_INFO_DEPTH := info^.depth[c];
end;

function GST_VIDEO_FORMAT_INFO_PSTRIDE(info: PGstVideoFormatInfo; c: longint): Tguint;
begin
  GST_VIDEO_FORMAT_INFO_PSTRIDE := info^.pixel_stride[c];
end;

function GST_VIDEO_FORMAT_INFO_N_PLANES(info: PGstVideoFormatInfo): Tguint;
begin
  GST_VIDEO_FORMAT_INFO_N_PLANES := info^.n_planes;
end;

function GST_VIDEO_FORMAT_INFO_PLANE(info: PGstVideoFormatInfo; c: longint): Tguint;
begin
  GST_VIDEO_FORMAT_INFO_PLANE := info^.plane[c];
end;

function GST_VIDEO_FORMAT_INFO_POFFSET(info: PGstVideoFormatInfo; c: longint
  ): Tguint;
begin
  GST_VIDEO_FORMAT_INFO_POFFSET := info^.poffset[c];
end;

function GST_VIDEO_FORMAT_INFO_W_SUB(info: PGstVideoFormatInfo; c: longint
  ): Tgint;
begin
  GST_VIDEO_FORMAT_INFO_W_SUB := info^.w_sub[c];
end;

function GST_VIDEO_FORMAT_INFO_H_SUB(info: PGstVideoFormatInfo; c: longint
  ): Tgint;
begin
  GST_VIDEO_FORMAT_INFO_H_SUB := info^.h_sub[c];
end;

function GST_VIDEO_SUB_SCALE(scale, val: longint): longint;
begin
  GST_VIDEO_SUB_SCALE := -((-(Tgint(val))) shr scale);
end;

function GST_VIDEO_FORMAT_INFO_SCALE_WIDTH(info: PGstVideoFormatInfo; c,
  w: longint): Tguint;
begin
  GST_VIDEO_FORMAT_INFO_SCALE_WIDTH := GST_VIDEO_SUB_SCALE(info^.w_sub[c], w);
end;

function GST_VIDEO_FORMAT_INFO_SCALE_HEIGHT(info: PGstVideoFormatInfo; c, h: longint): Tguint;
begin
  GST_VIDEO_FORMAT_INFO_SCALE_HEIGHT := GST_VIDEO_SUB_SCALE(info^.h_sub[c], h);
end;

function GST_VIDEO_FORMAT_INFO_TILE_MODE(info: PGstVideoFormatInfo): TGstVideoTileMode;
begin
  GST_VIDEO_FORMAT_INFO_TILE_MODE := info^.tile_mode;
end;

function GST_VIDEO_FORMAT_INFO_TILE_WS(info: PGstVideoFormatInfo): longint;
begin
  // Fehlt C-Seitig
  //  GST_VIDEO_FORMAT_INFO_TILE_WS:=info^.tile_ws;
end;

function GST_VIDEO_FORMAT_INFO_TILE_HS(info: PGstVideoFormatInfo): longint;
begin
  // Fehlt C-Seitig
  //  GST_VIDEO_FORMAT_INFO_TILE_HS:=info^.tile_hs;
end;

function GST_VIDEO_FORMAT_INFO_TILE_SIZE(info: PGstVideoFormatInfo;
  plane: longint): Tgint;
begin
  GST_VIDEO_FORMAT_INFO_TILE_SIZE := info^.tile_info[plane].size;
end;

function GST_VIDEO_FORMAT_INFO_TILE_WIDTH(info: PGstVideoFormatInfo;
  plane: longint): Tgint;
begin
  GST_VIDEO_FORMAT_INFO_TILE_WIDTH := info^.tile_info[plane].Width;
end;

function GST_VIDEO_FORMAT_INFO_TILE_HEIGHT(info: PGstVideoFormatInfo;
  plane: longint): Tgint;
begin
  GST_VIDEO_FORMAT_INFO_TILE_HEIGHT := info^.tile_info[plane].Height;
end;

function GST_VIDEO_FORMAT_INFO_TILE_STRIDE(info: PGstVideoFormatInfo;
  plane: longint): Tgint;
begin
  GST_VIDEO_FORMAT_INFO_TILE_STRIDE := info^.tile_info[plane].stride;
end;


{$ENDIF read_implementation}
