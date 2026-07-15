unit video_color;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2011> Wim Taymans <wim.taymans@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_VIDEO_COLOR_H__}
{$define __GST_VIDEO_COLOR_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-format.h>}
{*
 * GstVideoColorRange:
 * @GST_VIDEO_COLOR_RANGE_UNKNOWN: unknown range
 * @GST_VIDEO_COLOR_RANGE_0_255: [0..255] for 8 bit components
 * @GST_VIDEO_COLOR_RANGE_16_235: [16..235] for 8 bit components. Chroma has
 *                 [16..240] range.
 *
 * Possible color range values. These constants are defined for 8 bit color
 * values and can be scaled for other bit depths.
  }
type
  PGstVideoColorRange = ^TGstVideoColorRange;
  TGstVideoColorRange =  Longint;
  Const
    GST_VIDEO_COLOR_RANGE_UNKNOWN = 0;
    GST_VIDEO_COLOR_RANGE_0_255 = 1;
    GST_VIDEO_COLOR_RANGE_16_235 = 2;
;
{*
 * GstVideoColorMatrix:
 * @GST_VIDEO_COLOR_MATRIX_UNKNOWN: unknown matrix
 * @GST_VIDEO_COLOR_MATRIX_RGB: identity matrix. Order of coefficients is
 * actually GBR, also IEC 61966-2-1 (sRGB)
 * @GST_VIDEO_COLOR_MATRIX_FCC: FCC Title 47 Code of Federal Regulations 73.682 (a)(20)
 * @GST_VIDEO_COLOR_MATRIX_BT709: ITU-R BT.709 color matrix, also ITU-R BT1361
 * / IEC 61966-2-4 xvYCC709 / SMPTE RP177 Annex B
 * @GST_VIDEO_COLOR_MATRIX_BT601: ITU-R BT.601 color matrix, also SMPTE170M / ITU-R BT1358 525 / ITU-R BT1700 NTSC
 * @GST_VIDEO_COLOR_MATRIX_SMPTE240M: SMPTE 240M color matrix
 * @GST_VIDEO_COLOR_MATRIX_BT2020: ITU-R BT.2020 color matrix. Since: 1.6
 *
 * The color matrix is used to convert between Y'PbPr and
 * non-linear RGB (R'G'B')
  }
type
  PGstVideoColorMatrix = ^TGstVideoColorMatrix;
  TGstVideoColorMatrix =  Longint;
  Const
    GST_VIDEO_COLOR_MATRIX_UNKNOWN = 0;
    GST_VIDEO_COLOR_MATRIX_RGB = 1;
    GST_VIDEO_COLOR_MATRIX_FCC = 2;
    GST_VIDEO_COLOR_MATRIX_BT709 = 3;
    GST_VIDEO_COLOR_MATRIX_BT601 = 4;
    GST_VIDEO_COLOR_MATRIX_SMPTE240M = 5;
    GST_VIDEO_COLOR_MATRIX_BT2020 = 6;
;

function gst_video_color_matrix_get_Kr_Kb(matrix:TGstVideoColorMatrix; Kr:Pgdouble; Kb:Pgdouble):Tgboolean;cdecl;external libgstvideo;
{*
 * GstVideoTransferFunction:
 * @GST_VIDEO_TRANSFER_UNKNOWN: unknown transfer function
 * @GST_VIDEO_TRANSFER_GAMMA10: linear RGB, gamma 1.0 curve
 * @GST_VIDEO_TRANSFER_GAMMA18: Gamma 1.8 curve
 * @GST_VIDEO_TRANSFER_GAMMA20: Gamma 2.0 curve
 * @GST_VIDEO_TRANSFER_GAMMA22: Gamma 2.2 curve
 * @GST_VIDEO_TRANSFER_BT709: Gamma 2.2 curve with a linear segment in the lower
 *                           range, also ITU-R BT470M / ITU-R BT1700 625 PAL &
 *                           SECAM / ITU-R BT1361
 * @GST_VIDEO_TRANSFER_SMPTE240M: Gamma 2.2 curve with a linear segment in the
 *                               lower range
 * @GST_VIDEO_TRANSFER_SRGB: Gamma 2.4 curve with a linear segment in the lower
 *                          range. IEC 61966-2-1 (sRGB or sYCC)
 * @GST_VIDEO_TRANSFER_GAMMA28: Gamma 2.8 curve, also ITU-R BT470BG
 * @GST_VIDEO_TRANSFER_LOG100: Logarithmic transfer characteristic
 *                             100:1 range
 * @GST_VIDEO_TRANSFER_LOG316: Logarithmic transfer characteristic
 *                             316.22777:1 range (100 * sqrt(10) : 1)
 * @GST_VIDEO_TRANSFER_BT2020_12: Gamma 2.2 curve with a linear segment in the lower
 *                                range. Used for BT.2020 with 12 bits per
 *                                component. Since: 1.6
 * @GST_VIDEO_TRANSFER_ADOBERGB: Gamma 2.19921875. Since: 1.8
 * @GST_VIDEO_TRANSFER_BT2020_10: Rec. ITU-R BT.2020-2 with 10 bits per component.
 *                                (functionally the same as the values
 *                                GST_VIDEO_TRANSFER_BT709 and GST_VIDEO_TRANSFER_BT601).
 *                                Since: 1.18
 * @GST_VIDEO_TRANSFER_SMPTE2084: SMPTE ST 2084 for 10, 12, 14, and 16-bit systems.
 *                                Known as perceptual quantization (PQ)
 *                                Since: 1.18
 * @GST_VIDEO_TRANSFER_ARIB_STD_B67: Association of Radio Industries and Businesses (ARIB)
 *                                   STD-B67 and Rec. ITU-R BT.2100-1 hybrid loggamma (HLG) system
 *                                   Since: 1.18
 * @GST_VIDEO_TRANSFER_BT601: also known as SMPTE170M / ITU-R BT1358 525 or 625 / ITU-R BT1700 NTSC
 *                            Functionally the same as the values
 *                            GST_VIDEO_TRANSFER_BT709, and GST_VIDEO_TRANSFER_BT2020_10.
 *                            Since: 1.18
 *
 * The video transfer function defines the formula for converting between
 * non-linear RGB (R'G'B') and linear RGB
  }
{*
   * GST_VIDEO_TRANSFER_BT601:
   *
   * also known as SMPTE170M / ITU-R BT1358 525 or 625 / ITU-R BT1700 NTSC
   *
   * Since: 1.18
    }
type
  PGstVideoTransferFunction = ^TGstVideoTransferFunction;
  TGstVideoTransferFunction =  Longint;
  Const
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
;
{XXXXXXXXXGST_VIDEO_DEPRECATED_FOR(gst_video_transfer_function_encode) }

function gst_video_color_transfer_encode(func:TGstVideoTransferFunction; val:Tgdouble):Tgdouble;cdecl;external libgstvideo;
function gst_video_transfer_function_encode(func:TGstVideoTransferFunction; val:Tgdouble):Tgdouble;cdecl;external libgstvideo;
{XXXXXXXXXGST_VIDEO_DEPRECATED_FOR(gst_video_transfer_function_decode) }
function gst_video_color_transfer_decode(func:TGstVideoTransferFunction; val:Tgdouble):Tgdouble;cdecl;external libgstvideo;
function gst_video_transfer_function_decode(func:TGstVideoTransferFunction; val:Tgdouble):Tgdouble;cdecl;external libgstvideo;
{*
 * GstVideoColorPrimaries:
 * @GST_VIDEO_COLOR_PRIMARIES_UNKNOWN: unknown color primaries
 * @GST_VIDEO_COLOR_PRIMARIES_BT709: BT709 primaries, also ITU-R BT1361 / IEC
 * 61966-2-4 / SMPTE RP177 Annex B
 * @GST_VIDEO_COLOR_PRIMARIES_BT470M: BT470M primaries, also FCC Title 47 Code
 * of Federal Regulations 73.682 (a)(20)
 * @GST_VIDEO_COLOR_PRIMARIES_BT470BG: BT470BG primaries, also ITU-R BT601-6
 * 625 / ITU-R BT1358 625 / ITU-R BT1700 625 PAL & SECAM
 * @GST_VIDEO_COLOR_PRIMARIES_SMPTE170M: SMPTE170M primaries, also ITU-R
 * BT601-6 525 / ITU-R BT1358 525 / ITU-R BT1700 NTSC
 * @GST_VIDEO_COLOR_PRIMARIES_SMPTE240M: SMPTE240M primaries
 * @GST_VIDEO_COLOR_PRIMARIES_FILM: Generic film (colour filters using
 * Illuminant C)
 * @GST_VIDEO_COLOR_PRIMARIES_BT2020: ITU-R BT2020 primaries. Since: 1.6
 * @GST_VIDEO_COLOR_PRIMARIES_ADOBERGB: Adobe RGB primaries. Since: 1.8
 * @GST_VIDEO_COLOR_PRIMARIES_SMPTEST428: SMPTE ST 428 primaries (CIE 1931
 * XYZ). Since: 1.16
 * @GST_VIDEO_COLOR_PRIMARIES_SMPTERP431: SMPTE RP 431 primaries (ST 431-2
 * (2011) / DCI P3). Since: 1.16
 * @GST_VIDEO_COLOR_PRIMARIES_SMPTEEG432: SMPTE EG 432 primaries (ST 432-1
 * (2010) / P3 D65). Since: 1.16
 * @GST_VIDEO_COLOR_PRIMARIES_EBU3213: EBU 3213 primaries (JEDEC P22
 * phosphors). Since: 1.16
 *
 * The color primaries define the how to transform linear RGB values to and from
 * the CIE XYZ colorspace.
  }
type
  PGstVideoColorPrimaries = ^TGstVideoColorPrimaries;
  TGstVideoColorPrimaries =  Longint;
  Const
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
;
{*
 * GstVideoColorPrimariesInfo:
 * @primaries: a #GstVideoColorPrimaries
 * @Wx: reference white x coordinate
 * @Wy: reference white y coordinate
 * @Rx: red x coordinate
 * @Ry: red y coordinate
 * @Gx: green x coordinate
 * @Gy: green y coordinate
 * @Bx: blue x coordinate
 * @By: blue y coordinate
 *
 * Structure describing the chromaticity coordinates of an RGB system. These
 * values can be used to construct a matrix to transform RGB to and from the
 * XYZ colorspace.
 *
 * Since: 1.6
  }
type
  PGstVideoColorPrimariesInfo = ^TGstVideoColorPrimariesInfo;
  TGstVideoColorPrimariesInfo = record
      primaries : TGstVideoColorPrimaries;
      Wx : Tgdouble;
      Wy : Tgdouble;
      Rx : Tgdouble;
      Ry : Tgdouble;
      Gx : Tgdouble;
      Gy : Tgdouble;
      Bx : Tgdouble;
      By : Tgdouble;
    end;

function gst_video_color_primaries_get_info(primaries:TGstVideoColorPrimaries):PGstVideoColorPrimariesInfo;cdecl;external libgstvideo;
function gst_video_color_primaries_is_equivalent(primaries:TGstVideoColorPrimaries; other:TGstVideoColorPrimaries):Tgboolean;cdecl;external libgstvideo;
{*
 * GstVideoColorimetry:
 * @range: the color range. This is the valid range for the samples.
 *         It is used to convert the samples to Y'PbPr values.
 * @matrix: the color matrix. Used to convert between Y'PbPr and
 *          non-linear RGB (R'G'B')
 * @transfer: the transfer function. used to convert between R'G'B' and RGB
 * @primaries: color primaries. used to convert between R'G'B' and CIE XYZ
 *
 * Structure describing the color info.
  }
type
  PGstVideoColorimetry = ^TGstVideoColorimetry;
  TGstVideoColorimetry = record
      range : TGstVideoColorRange;
      matrix : TGstVideoColorMatrix;
      transfer : TGstVideoTransferFunction;
      primaries : TGstVideoColorPrimaries;
    end;
{ predefined colorimetry  }

const
  GST_VIDEO_COLORIMETRY_BT601 = 'bt601';  
  GST_VIDEO_COLORIMETRY_BT709 = 'bt709';  
  GST_VIDEO_COLORIMETRY_SMPTE240M = 'smpte240m';  
  GST_VIDEO_COLORIMETRY_SRGB = 'sRGB';  
  GST_VIDEO_COLORIMETRY_BT2020 = 'bt2020';  
  GST_VIDEO_COLORIMETRY_BT2020_10 = 'bt2020-10';  
  GST_VIDEO_COLORIMETRY_BT2100_PQ = 'bt2100-pq';  
  GST_VIDEO_COLORIMETRY_BT2100_HLG = 'bt2100-hlg';  

function gst_video_colorimetry_matches(cinfo:PGstVideoColorimetry; color:Pgchar):Tgboolean;cdecl;external libgstvideo;
function gst_video_colorimetry_from_string(cinfo:PGstVideoColorimetry; color:Pgchar):Tgboolean;cdecl;external libgstvideo;
function gst_video_colorimetry_to_string(cinfo:PGstVideoColorimetry):Pgchar;cdecl;external libgstvideo;
function gst_video_colorimetry_is_equal(cinfo:PGstVideoColorimetry; other:PGstVideoColorimetry):Tgboolean;cdecl;external libgstvideo;
function gst_video_colorimetry_is_equivalent(cinfo:PGstVideoColorimetry; bitdepth:Tguint; other:PGstVideoColorimetry; other_bitdepth:Tguint):Tgboolean;cdecl;external libgstvideo;
{ compute offset and scale  }
procedure gst_video_color_range_offsets(range:TGstVideoColorRange; info:PGstVideoFormatInfo; offset:array[0..(GST_VIDEO_MAX_COMPONENTS)-1] of Tgint; scale:array[0..(GST_VIDEO_MAX_COMPONENTS)-1] of Tgint);cdecl;external libgstvideo;
{ conversion between GStreamer colormatrix,transfer,primaries enum and
 * values defined by ISO/IEC 23001-8 and ITU-T H.273 specification.
 * Also H264 and H265 specifications follow the colormatrix,transfer,primaries
 * values  }
function gst_video_color_matrix_to_iso(matrix:TGstVideoColorMatrix):Tguint;cdecl;external libgstvideo;
function gst_video_transfer_function_to_iso(func:TGstVideoTransferFunction):Tguint;cdecl;external libgstvideo;
function gst_video_color_primaries_to_iso(primaries:TGstVideoColorPrimaries):Tguint;cdecl;external libgstvideo;
function gst_video_color_matrix_from_iso(value:Tguint):TGstVideoColorMatrix;cdecl;external libgstvideo;
function gst_video_transfer_function_from_iso(value:Tguint):TGstVideoTransferFunction;cdecl;external libgstvideo;
function gst_video_color_primaries_from_iso(value:Tguint):TGstVideoColorPrimaries;cdecl;external libgstvideo;
function gst_video_transfer_function_is_equivalent(from_func:TGstVideoTransferFunction; from_bpp:Tguint; to_func:TGstVideoTransferFunction; to_bpp:Tguint):Tgboolean;cdecl;external libgstvideo;
{$endif}
{ __GST_VIDEO_COLOR_H__  }

// === Konventiert am: 15-7-26 13:29:35 ===


implementation



end.
