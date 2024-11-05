/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstVideoColorRange = ^TGstVideoColorRange;
  TGstVideoColorRange = longint;

const
  GST_VIDEO_COLOR_RANGE_UNKNOWN = 0;
  GST_VIDEO_COLOR_RANGE_0_255 = 1;
  GST_VIDEO_COLOR_RANGE_16_235 = 2;

type
  PGstVideoColorMatrix = ^TGstVideoColorMatrix;
  TGstVideoColorMatrix = longint;

const
  GST_VIDEO_COLOR_MATRIX_UNKNOWN = 0;
  GST_VIDEO_COLOR_MATRIX_RGB = 1;
  GST_VIDEO_COLOR_MATRIX_FCC = 2;
  GST_VIDEO_COLOR_MATRIX_BT709 = 3;
  GST_VIDEO_COLOR_MATRIX_BT601 = 4;
  GST_VIDEO_COLOR_MATRIX_SMPTE240M = 5;
  GST_VIDEO_COLOR_MATRIX_BT2020 = 6;

function gst_video_color_matrix_get_Kr_Kb(matrix: TGstVideoColorMatrix; Kr: Pgdouble; Kb: Pgdouble): Tgboolean; cdecl; external libgstvideo;

type
  PGstVideoTransferFunction = ^TGstVideoTransferFunction;
  TGstVideoTransferFunction = longint;

const
  GST_VIDEO_TRANSFER_UNKNOWN = 0;
  GST_VIDEO_TRANSFER_GAMMA10 = 1;
  GST_VIDEO_TRANSFER_GAMMA18 = 2;
  GST_VIDEO_TRANSFER_GAMMA20 = 3;
  GST_VIDEO_TRANSFER_GAMMA22 = 4;
  GST_VIDEO_TRANSFER_BT709 = 5;
  GST_VIDEO_TRANSFER_SMPTE240M = 6;
  GST_VIDEO_TRANSFER_SRGB = 7;
  GST_VIDEO_TRANSFER_GAMMA28 = 8;
  GST_VIDEO_TRANSFER_LOG100 = 9;
  GST_VIDEO_TRANSFER_LOG316 = 10;
  GST_VIDEO_TRANSFER_BT2020_12 = 11;
  GST_VIDEO_TRANSFER_ADOBERGB = 12;
  GST_VIDEO_TRANSFER_BT2020_10 = 13;
  GST_VIDEO_TRANSFER_SMPTE2084 = 14;
  GST_VIDEO_TRANSFER_ARIB_STD_B67 = 15;
  GST_VIDEO_TRANSFER_BT601 = 16;

function gst_video_color_transfer_encode(func: TGstVideoTransferFunction; val: Tgdouble): Tgdouble; cdecl; external libgstvideo;
function gst_video_transfer_function_encode(func: TGstVideoTransferFunction; val: Tgdouble): Tgdouble; cdecl; external libgstvideo;
function gst_video_color_transfer_decode(func: TGstVideoTransferFunction; val: Tgdouble): Tgdouble; cdecl; external libgstvideo;
function gst_video_transfer_function_decode(func: TGstVideoTransferFunction; val: Tgdouble): Tgdouble; cdecl; external libgstvideo;

type
  PGstVideoColorPrimaries = ^TGstVideoColorPrimaries;
  TGstVideoColorPrimaries = longint;

const
  GST_VIDEO_COLOR_PRIMARIES_UNKNOWN = 0;
  GST_VIDEO_COLOR_PRIMARIES_BT709 = 1;
  GST_VIDEO_COLOR_PRIMARIES_BT470M = 2;
  GST_VIDEO_COLOR_PRIMARIES_BT470BG = 3;
  GST_VIDEO_COLOR_PRIMARIES_SMPTE170M = 4;
  GST_VIDEO_COLOR_PRIMARIES_SMPTE240M = 5;
  GST_VIDEO_COLOR_PRIMARIES_FILM = 6;
  GST_VIDEO_COLOR_PRIMARIES_BT2020 = 7;
  GST_VIDEO_COLOR_PRIMARIES_ADOBERGB = 8;
  GST_VIDEO_COLOR_PRIMARIES_SMPTEST428 = 9;
  GST_VIDEO_COLOR_PRIMARIES_SMPTERP431 = 10;
  GST_VIDEO_COLOR_PRIMARIES_SMPTEEG432 = 11;
  GST_VIDEO_COLOR_PRIMARIES_EBU3213 = 12;

type
  PGstVideoColorPrimariesInfo = ^TGstVideoColorPrimariesInfo;

  TGstVideoColorPrimariesInfo = record
    primaries: TGstVideoColorPrimaries;
    Wx: Tgdouble;
    Wy: Tgdouble;
    Rx: Tgdouble;
    Ry: Tgdouble;
    Gx: Tgdouble;
    Gy: Tgdouble;
    Bx: Tgdouble;
    By: Tgdouble;
  end;

function gst_video_color_primaries_get_info(primaries: TGstVideoColorPrimaries): PGstVideoColorPrimariesInfo; cdecl; external libgstvideo;
function gst_video_color_primaries_is_equivalent(primaries: TGstVideoColorPrimaries; other: TGstVideoColorPrimaries): Tgboolean; cdecl; external libgstvideo;

type
  PGstVideoColorimetry = ^TGstVideoColorimetry;

  TGstVideoColorimetry = record
    range: TGstVideoColorRange;
    matrix: TGstVideoColorMatrix;
    transfer: TGstVideoTransferFunction;
    primaries: TGstVideoColorPrimaries;
  end;

const
  GST_VIDEO_COLORIMETRY_BT601 = 'bt601';
  GST_VIDEO_COLORIMETRY_BT709 = 'bt709';
  GST_VIDEO_COLORIMETRY_SMPTE240M = 'smpte240m';
  GST_VIDEO_COLORIMETRY_SRGB = 'sRGB';
  GST_VIDEO_COLORIMETRY_BT2020 = 'bt2020';
  GST_VIDEO_COLORIMETRY_BT2020_10 = 'bt2020-10';
  GST_VIDEO_COLORIMETRY_BT2100_PQ = 'bt2100-pq';
  GST_VIDEO_COLORIMETRY_BT2100_HLG = 'bt2100-hlg';

function gst_video_colorimetry_matches(cinfo: PGstVideoColorimetry; color: Pgchar): Tgboolean; cdecl; external libgstvideo;
function gst_video_colorimetry_from_string(cinfo: PGstVideoColorimetry; color: Pgchar): Tgboolean; cdecl; external libgstvideo;
function gst_video_colorimetry_to_string(cinfo: PGstVideoColorimetry): Pgchar; cdecl; external libgstvideo;
function gst_video_colorimetry_is_equal(cinfo: PGstVideoColorimetry; other: PGstVideoColorimetry): Tgboolean; cdecl; external libgstvideo;
function gst_video_colorimetry_is_equivalent(cinfo: PGstVideoColorimetry; bitdepth: Tguint; other: PGstVideoColorimetry; other_bitdepth: Tguint): Tgboolean; cdecl; external libgstvideo;
procedure gst_video_color_range_offsets(range: TGstVideoColorRange; info: PGstVideoFormatInfo; offset: Tcomp_int_arr; scale: Tcomp_int_arr); cdecl; external libgstvideo;
function gst_video_color_matrix_to_iso(matrix: TGstVideoColorMatrix): Tguint; cdecl; external libgstvideo;
function gst_video_transfer_function_to_iso(func: TGstVideoTransferFunction): Tguint; cdecl; external libgstvideo;
function gst_video_color_primaries_to_iso(primaries: TGstVideoColorPrimaries): Tguint; cdecl; external libgstvideo;
function gst_video_color_matrix_from_iso(Value: Tguint): TGstVideoColorMatrix; cdecl; external libgstvideo;
function gst_video_transfer_function_from_iso(Value: Tguint): TGstVideoTransferFunction; cdecl; external libgstvideo;
function gst_video_color_primaries_from_iso(Value: Tguint): TGstVideoColorPrimaries; cdecl; external libgstvideo;
function gst_video_transfer_function_is_equivalent(from_func: TGstVideoTransferFunction; from_bpp: Tguint; to_func: TGstVideoTransferFunction; to_bpp: Tguint): Tgboolean; cdecl; external libgstvideo;

// === Konventiert am: 29-9-24 15:37:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
