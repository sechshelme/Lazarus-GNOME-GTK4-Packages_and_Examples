
unit gstvp9parser;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvp9parser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvp9parser.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PGstVp9BitDepth  = ^GstVp9BitDepth;
PGstVp9ColorRange  = ^GstVp9ColorRange;
PGstVp9ColorSpace  = ^GstVp9ColorSpace;
PGstVp9FrameHdr  = ^GstVp9FrameHdr;
PGstVp9FrameType  = ^GstVp9FrameType;
PGstVp9InterpolationFilter  = ^GstVp9InterpolationFilter;
PGstVp9LoopFilter  = ^GstVp9LoopFilter;
PGstVp9Parser  = ^GstVp9Parser;
PGstVp9ParserResult  = ^GstVp9ParserResult;
PGstVP9Profile  = ^GstVP9Profile;
PGstVp9QuantIndices  = ^GstVp9QuantIndices;
PGstVp9RefFrameType  = ^GstVp9RefFrameType;
PGstVp9Segmentation  = ^GstVp9Segmentation;
PGstVp9SegmentationInfo  = ^GstVp9SegmentationInfo;
PGstVp9SegmentationInfoData  = ^GstVp9SegmentationInfoData;
PGstVp9SuperframeInfo  = ^GstVp9SuperframeInfo;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * gstvp9parser.h
 *
 *  Copyright (C) 2013-2014 Intel Corporation
 *  Copyright (C) 2015 Intel Corporation
 *    Author: XuGuangxin<Guangxin.Xu@intel.com>
 *    Author: Sreerenj Balachandran<sreerenj.balachandran@intel.com>
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
{$ifndef GST_VP9_PARSER_H}
{$define GST_VP9_PARSER_H}
{$include <gst/gst.h>}
{$include <gst/codecparsers/codecparsers-prelude.h>}

const
  GST_VP9_FRAME_MARKER = $02;  
  GST_VP9_SYNC_CODE = $498342;  
  GST_VP9_SUPERFRAME_MARKER = $06;  
  GST_VP9_MAX_LOOP_FILTER = 63;  
  GST_VP9_MAX_PROB = 255;  
  GST_VP9_REFS_PER_FRAME = 3;  
  GST_VP9_REF_FRAMES_LOG2 = 3;  
  GST_VP9_REF_FRAMES = 1 shl GST_VP9_REF_FRAMES_LOG2;  
  GST_VP9_FRAME_CONTEXTS_LOG2 = 2;  
  GST_VP9_MAX_SHARPNESS = 7;  
  GST_VP9_MAX_REF_LF_DELTAS = 4;  
  GST_VP9_MAX_MODE_LF_DELTAS = 2;  
  GST_VP9_SEGMENT_DELTADATA = 0;  
  GST_VP9_SEGMENT_ABSDATA = 1;  
  GST_VP9_MAX_SEGMENTS = 8;  
  GST_VP9_SEG_TREE_PROBS = GST_VP9_MAX_SEGMENTS-1;  
  GST_VP9_PREDICTION_PROBS = 3;  
  GST_VP9_MAX_FRAMES_IN_SUPERFRAME = 8;  
type
{*
 * GstVp9ParseResult:
 * @GST_VP9_PARSER_OK: The parsing went well
 * @GST_VP9_PARSER_BROKEN_DATA: The data to parse is broken
 * @GST_VP9_PARSER_NO_PACKET_ERROR: An error occurred during the parsing
 *
 * Result type of any parsing function.
 *
 * Since: 1.8
  }

  PGstVp9ParserResult = ^TGstVp9ParserResult;
  TGstVp9ParserResult =  Longint;
  Const
    GST_VP9_PARSER_OK = 0;
    GST_VP9_PARSER_BROKEN_DATA = 1;
    GST_VP9_PARSER_ERROR = 2;
;
{*
 * GstVp9Profile:
 * @GST_VP9_PROFILE_0: Profile 0, 8-bit 4:2:0 only.
 * @GST_VP9_PROFILE_1: Profile 1, 8-bit 4:4:4, 4:2:2, and 4:4:0.
 * @GST_VP9_PROFILE_2: Profile 2, 10-bit and 12-bit color only, with 4:2:0 sampling.
 * @GST_VP9_PROFILE_3: Profile 3, 10-bit and 12-bit color only, with 4:2:2/4:4:4/4:4:0 sampling.
 * @GST_VP9_PROFILE_UNDEFINED: Undefined profile
 *
 * VP9 Bitstream profiles indicated by 2-3 bits in the uncompressed header.
 *
 * Since: 1.8
  }
type
  PGstVP9Profile = ^TGstVP9Profile;
  TGstVP9Profile =  Longint;
  Const
    GST_VP9_PROFILE_0 = 0;
    GST_VP9_PROFILE_1 = 1;
    GST_VP9_PROFILE_2 = 2;
    GST_VP9_PROFILE_3 = 3;
    GST_VP9_PROFILE_UNDEFINED = 4;
;
{*
 * GstVp9FrameType:
 * @GST_VP9_KEY_FRAME: Key frame, only have intra blocks
 * @GST_VP9_INTER_FRAME: Inter frame, both intra and inter blocks
 *
 * VP9 frame types
 *
 * Since: 1.8
  }
type
  PGstVp9FrameType = ^TGstVp9FrameType;
  TGstVp9FrameType =  Longint;
  Const
    GST_VP9_KEY_FRAME = 0;
    GST_VP9_INTER_FRAME = 1;
;
{*
 * GstVp9BitDepth:
 * @GST_VP9_BIT_DEPTH_8: Bit depth is 8
 * @GST_VP9_BIT_DEPTH_10 Bit depth is 10
 * @GST_VP9_BIT_DEPTH_12:Bit depth is 12
 *
 * Bit depths of encoded frames
 *
 * Since: 1.8
  }
type
  PGstVp9BitDepth = ^TGstVp9BitDepth;
  TGstVp9BitDepth =  Longint;
  Const
    GST_VP9_BIT_DEPTH_8 = 8;
    GST_VP9_BIT_DEPTH_10 = 10;
    GST_VP9_BIT_DEPTH_12 = 12;
;
{*
 * GstVp9ColorSpace:
 * @GST_VP9_CS_UNKNOWN: Unknown color space
 * @GST_VP9_CS_BT_601: BT.601
 * @GST_VP9_CS_BT_709: BT.709
 * @GST_VP9_CS_SMPTE_170: SMPTE.170
 * @GST_VP9_CS_SMPTE_240: SMPTE.240
 * @GST_VP9_CS_BT_2020: BT.2020
 * @GST_VP9_CS_RESERVED: Reserved
 * @GST_VP9_CS_SRGB: sRGB
 *
 * Supported ColorSpace standards
 *
 * Since: 1.8
  }
type
  PGstVp9ColorSpace = ^TGstVp9ColorSpace;
  TGstVp9ColorSpace =  Longint;
  Const
    GST_VP9_CS_UNKNOWN = 0;
    GST_VP9_CS_BT_601 = 1;
    GST_VP9_CS_BT_709 = 2;
    GST_VP9_CS_SMPTE_170 = 3;
    GST_VP9_CS_SMPTE_240 = 4;
    GST_VP9_CS_BT_2020 = 5;
    GST_VP9_CS_RESERVED_2 = 6;
    GST_VP9_CS_SRGB = 7;
;
{*
 * GstVp9ColorRange:
 * @GST_VP9_CR_LIMITED: Y range is [16-235], UV range is [16-240]
 * @GST_VP9_CR_FULL: Full range for Y,U and V [0-255]
 *
 * Possible color value ranges
 *
 * Since: 1.8
  }
type
  PGstVp9ColorRange = ^TGstVp9ColorRange;
  TGstVp9ColorRange =  Longint;
  Const
    GST_VP9_CR_LIMITED = 0;
    GST_VP9_CR_FULL = 1;
;
{*
 * GstVp9InterpolationFilter:
 * @GST_VP9_INTERPOLATION_FILTER_EIGHTTAP: EightTap interpolation filter
 * @GST_VP9_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH: Smooth interpolation filter
 * @GST_VP9_INTERPOLATION_FILTER_EIGHTTAP_SHARP: Shart interpolation filter
 * @GST_VP9_INTERPOLATION_FILTER_BILINEAR: Bilinear interpolation filter
 * @GST_VP9_INTERPOLATION_FILTER_SWITCHABLE: Selectable interpolation filter
 *
 * Interpolation Filters Types
 *
 * Since: 1.8
  }
type
  PGstVp9InterpolationFilter = ^TGstVp9InterpolationFilter;
  TGstVp9InterpolationFilter =  Longint;
  Const
    GST_VP9_INTERPOLATION_FILTER_EIGHTTAP = 0;
    GST_VP9_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH = 1;
    GST_VP9_INTERPOLATION_FILTER_EIGHTTAP_SHARP = 2;
    GST_VP9_INTERPOLATION_FILTER_BILINEAR = 3;
    GST_VP9_INTERPOLATION_FILTER_SWITCHABLE = 4;
;
{*
 * GstVp9RefFrameType:
 * @GST_VP9_REF_FRAME_INTRA: Intra reference frame
 * @GST_VP9_REF_FRAME_LAST: Last Reference frame
 * @GST_VP9_REF_FRAME_GOLDEN: Golden Reference frame
 * @GST_VP9_REF_FRAME_ALTREF: Alternate Reference frame
 * @GST_VP9_REF_FRAME_MAX:
 *
 * Reference Frame types
 *
 * Since: 1.8
  }
type
  PGstVp9RefFrameType = ^TGstVp9RefFrameType;
  TGstVp9RefFrameType =  Longint;
  Const
    GST_VP9_REF_FRAME_INTRA = 0;
    GST_VP9_REF_FRAME_LAST = 1;
    GST_VP9_REF_FRAME_GOLDEN = 2;
    GST_VP9_REF_FRAME_ALTREF = 3;
    GST_VP9_REF_FRAME_MAX = 4;
;
{*
 * GstVp9QuantIndices:
 * @y_ac_qi: indicates the dequantization table index used for the
 *   luma AC coefficients
 * @y_dc_delta: indicates the delta value that is added to the
 *   baseline index to obtain the luma DC coefficient dequantization
 *   index
 * @uv_dc_delta: indicates the delta value that is added to the
 *   baseline index to obtain the chroma DC coefficient dequantization
 *   index
 * @uv_ac_delta: indicates the delta value that is added to the
 *   baseline index to obtain the chroma AC coefficient dequantization
 *   index
 *
 * Dequantization indices.
 *
 * Since: 1.8
  }
type
  PGstVp9QuantIndices = ^TGstVp9QuantIndices;
  TGstVp9QuantIndices = record
      y_ac_qi : Tguint8;
      y_dc_delta : Tgint8;
      uv_dc_delta : Tgint8;
      uv_ac_delta : Tgint8;
    end;

{*
 * GstVp9LoopFilter:
 * @filter_level: indicates loop filter level for the current frame
 * @sharpness_level: indicates sharpness level for thecurrent frame
 * @mode_ref_delta_enabled: indicate if filter adjust is on
 * @mode_ref_delta_update: indicates if the delta values used in an
 *   adjustment are updated in the current frame
 * @update_ref_deltas: indicate which ref deltas are updated
 * @ref_deltas:  Loop filter strength adjustments based on
 *  frame type (intra, inter)
 * @update_mode_deltas: indicate with mode deltas are updated
 * @mode_deltas: Loop filter strength adjustments based on
 *   mode (zero, new mv)
 *
 * Loop filter values
 *
 * Since: 1.8
  }
  PGstVp9LoopFilter = ^TGstVp9LoopFilter;
  TGstVp9LoopFilter = record
      filter_level : Tgint;
      sharpness_level : Tgint;
      mode_ref_delta_enabled : Tguint8;
      mode_ref_delta_update : Tguint8;
      update_ref_deltas : array[0..(GST_VP9_MAX_REF_LF_DELTAS)-1] of Tguint8;
      ref_deltas : array[0..(GST_VP9_MAX_REF_LF_DELTAS)-1] of Tgint8;
      update_mode_deltas : array[0..(GST_VP9_MAX_MODE_LF_DELTAS)-1] of Tguint8;
      mode_deltas : array[0..(GST_VP9_MAX_MODE_LF_DELTAS)-1] of Tgint8;
    end;

{*
 * GstVp9SegmentationInfoData:
 * @alternate_quantizer_enabled: indicate alternate quantizer enabled at segment level
 * @alternate_quantizer: alternate quantizer value
 * @alternate_loop_filter_enabled: indicate alternate loop filter enabled at segment level
 * @alternate_loop_filter: alternate loop filter
 * @reference_frame_enabled: indicate alternate reference frame at segment level
 * @reference_frame: alternate reference frame
 * @reference_skip: a block skip mode that implies both the use of a (0,0)
 *   motion vector and that no residual will be coded.
 *
 * Segmentation info for each segment
 *
 * Since: 1.8
  }
{ SEG_LVL_ALT_Q  }
{ SEG_LVL_ALT_LF  }
{ SEG_LVL_REF_FRAME  }
  PGstVp9SegmentationInfoData = ^TGstVp9SegmentationInfoData;
  TGstVp9SegmentationInfoData = record
      alternate_quantizer_enabled : Tguint8;
      alternate_quantizer : Tgint16;
      alternate_loop_filter_enabled : Tguint8;
      alternate_loop_filter : Tgint8;
      reference_frame_enabled : Tguint8;
      reference_frame : Tgint;
      reference_skip : Tguint8;
    end;

{*
 * GstVp9SegmentationInfo:
 * @enabled: enables the segmentation feature for the current frame
 * @update_map: determines if segmentation is updated in the current frame
 * @update_tree_probs: determines if tree probabilities updated or not
 * @tree_probs: segment tree probabilities
 * @update_pred_probs:determines if prediction probabilities updated or not
 * @pred_probs: prediction probabilities
 * @abs_delta: interpretation of segment data values
 * @temporal_update: type of map update
 * @update_data: indicates if the segment feature data
 *   is updated in the current frame
 * @data: segment feature data
 *
 * Segmentation info
 *
 * Since: 1.8
  }
{ enable in setup_segmentation }
{ update_map in setup_segmentation }
{ tree_probs exist or not }
{ pred_probs exist or not }
{ abs_delta in setup_segmentation  }
{ temporal_update in setup_segmentation  }
{ update_data in setup_segmentation }
  PGstVp9SegmentationInfo = ^TGstVp9SegmentationInfo;
  TGstVp9SegmentationInfo = record
      enabled : Tguint8;
      update_map : Tguint8;
      update_tree_probs : array[0..(GST_VP9_SEG_TREE_PROBS)-1] of Tguint8;
      tree_probs : array[0..(GST_VP9_SEG_TREE_PROBS)-1] of Tguint8;
      update_pred_probs : array[0..(GST_VP9_PREDICTION_PROBS)-1] of Tguint8;
      pred_probs : array[0..(GST_VP9_PREDICTION_PROBS)-1] of Tguint8;
      abs_delta : Tguint8;
      temporal_update : Tguint8;
      update_data : Tguint8;
      data : array[0..(GST_VP9_MAX_SEGMENTS)-1] of TGstVp9SegmentationInfoData;
    end;

{*
 * GstVp9FrameHdr:
 * @profile: encoded profile
 * @show_existing_frame: display already decoded frame instead of doing the decoding
 * @frame_to_show: which frame to show if show_existing_frame is true
 * @frame_type: frame type
 * @show_frame: indicate whether it is a displayable frame or not
 * @error_resilient_mode: error resilent mode
 * @width: frame width
 * @height: frame height
 * @display_size_enabled: display size enabled (cropping)
 * @display_width: display width
 * @display_height: display height
 * @frame_context_idx: frame context index
 * @intra_only: intra only frame
 * @reset_frame_context: reset frame context
 * @refresh_frame_flags: refresh reference frame flags
 * @ref_frame_indices: reference frame index
 * @ref_frame_sign_bias: sign bias for selecting altref,last and golden frames
 * @allow_high_precision_mv: allow hight precision motion vector
 * @mcomp_filter_type: interpolation filter type
 * @refresh_frame_context: refresh frame context indicator
 * @frame_parallel_decoding_mode: enable or disable parallel decoding support.
 * @loopfilter: loopfilter values
 * @quant_indices: quantization indices
 * @segmentation: segmentation info
 * @log2_tile_rows: tile row indicator
 * @log2_tile_columns:  tile column indicator
 * @first_partition_size: first partition size (after the uncompressed header)
 * @lossless_flag: lossless mode decode
 * @frame_header_length_in_bytes: length of uncompressed header
 *
 * Frame header
 *
 * Since: 1.8
  }
{ frame_parallel_decoding_mode in vp9 code }
{ calculated values  }
  PGstVp9FrameHdr = ^TGstVp9FrameHdr;
  TGstVp9FrameHdr = record
      profile : Tguint;
      show_existing_frame : Tguint8;
      frame_to_show : Tgint;
      frame_type : Tguint;
      show_frame : Tguint8;
      error_resilient_mode : Tguint8;
      width : Tguint32;
      height : Tguint32;
      display_size_enabled : Tguint8;
      display_width : Tguint32;
      display_height : Tguint32;
      frame_context_idx : Tguint;
      intra_only : Tguint8;
      reset_frame_context : Tgint;
      refresh_frame_flags : Tgint;
      ref_frame_indices : array[0..(GST_VP9_REFS_PER_FRAME)-1] of Tgint;
      ref_frame_sign_bias : array[0..(GST_VP9_REFS_PER_FRAME)-1] of Tgint;
      allow_high_precision_mv : Tgint;
      mcomp_filter_type : Tguint8;
      refresh_frame_context : Tgint;
      frame_parallel_decoding_mode : Tgint;
      loopfilter : TGstVp9LoopFilter;
      quant_indices : TGstVp9QuantIndices;
      segmentation : TGstVp9SegmentationInfo;
      log2_tile_rows : Tgint;
      log2_tile_columns : Tgint;
      first_partition_size : Tguint32;
      lossless_flag : Tguint;
      frame_header_length_in_bytes : Tguint32;
    end;

{*
 * GstVp9SuperframeInfo:
 * @bytes_per_framesize: indicates the number of bytes needed to code each frame size
 * @frames_in_superframe: indicates the number of frames within this superframe
 * @frame_sizes: specifies the size in bytes of frame number i (zero indexed) within this superframe
 * @superframe_index_size: indicates the total size of the superframe_index
 *
 * Superframe info
 *
 * Since: 1.18
  }
  PGstVp9SuperframeInfo = ^TGstVp9SuperframeInfo;
  TGstVp9SuperframeInfo = record
      bytes_per_framesize : Tguint32;
      frames_in_superframe : Tguint32;
      frame_sizes : array[0..(GST_VP9_MAX_FRAMES_IN_SUPERFRAME)-1] of Tguint32;
      superframe_index_size : Tguint32;
    end;

{*
 * GstVp9Segmentation:
 * @filter_level: loop filter level
 * @luma_ac_quant_scale: AC quant scale for luma(Y) component
 * @luma_dc_quant_scale: DC quant scale for luma(Y) component
 * @chroma_ac_quant_scale AC quant scale for chroma(U/V) component
 * @chroma_dc_quant_scale: DC quant scale for chroma (U/V) component
 * @reference_frame_enabled: alternate reference frame enablement
 * @reference_frame: alternate reference frame
 * @reference_skip:  a block skip mode that implies both the use of a (0,0)
 *   motion vector and that no residual will be coded
 *
 * Segmentation info kept across multiple frames
 *
 * Since: 1.8
  }
  PGstVp9Segmentation = ^TGstVp9Segmentation;
  TGstVp9Segmentation = record
      filter_level : array[0..(GST_VP9_MAX_REF_LF_DELTAS)-1] of array[0..(GST_VP9_MAX_MODE_LF_DELTAS)-1] of Tguint8;
      luma_ac_quant_scale : Tgint16;
      luma_dc_quant_scale : Tgint16;
      chroma_ac_quant_scale : Tgint16;
      chroma_dc_quant_scale : Tgint16;
      reference_frame_enabled : Tguint8;
      reference_frame : Tgint;
      reference_skip : Tguint8;
    end;

{*
 * GstVp9Parser:
 * @priv: GstVp9ParserPrivate struct to keep track of state variables
 * @subsampling_x: horizontal subsampling
 * @subsampling_y: vertical subsampling
 * @bit_depth: bit depth of the stream
 * @color_space: color space standard
 * @color_range: color range standard
 * @mb_segment_tree_probs: decoding tree probabilities
 * @segment_pred_probs: segment prediction probabiilties
 * @segmentation: Segmentation info
 *
 * Parser context that needs to be live across frames
 *
 * Since: 1.8
  }
{$ifndef GST_REMOVE_DEPRECATED}
{ unused, kept around for ABI compatibility  }
{$endif}
type
  PGstVp9Parser = ^TGstVp9Parser;
  TGstVp9Parser = record
      priv : pointer;
      subsampling_x : Tgint;
      subsampling_y : Tgint;
      bit_depth : Tguint;
      color_space : Tguint;
      color_range : Tguint;
      mb_segment_tree_probs : array[0..(GST_VP9_SEG_TREE_PROBS)-1] of Tguint8;
      segment_pred_probs : array[0..(GST_VP9_PREDICTION_PROBS)-1] of Tguint8;
      segmentation : array[0..(GST_VP9_MAX_SEGMENTS)-1] of TGstVp9Segmentation;
    end;


function gst_vp9_parser_new:PGstVp9Parser;cdecl;external;
(* Const before type ignored *)
function gst_vp9_parser_parse_frame_header(parser:PGstVp9Parser; frame_hdr:PGstVp9FrameHdr; data:Pguint8; size:Tgsize):TGstVp9ParserResult;cdecl;external;
(* Const before type ignored *)
function gst_vp9_parser_parse_superframe_info(parser:PGstVp9Parser; superframe_info:PGstVp9SuperframeInfo; data:Pguint8; size:Tgsize):TGstVp9ParserResult;cdecl;external;
procedure gst_vp9_parser_free(parser:PGstVp9Parser);cdecl;external;
{$endif}
{ GST_VP9_PARSER_H  }

implementation


end.
