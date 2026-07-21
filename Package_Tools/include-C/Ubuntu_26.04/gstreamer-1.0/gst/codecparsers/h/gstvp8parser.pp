
unit gstvp8parser;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvp8parser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvp8parser.h
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
PGstVp8FrameHdr  = ^GstVp8FrameHdr;
PGstVp8FrameType  = ^GstVp8FrameType;
PGstVp8MbLfAdjustments  = ^GstVp8MbLfAdjustments;
PGstVp8ModeProbs  = ^GstVp8ModeProbs;
PGstVp8MvProbs  = ^GstVp8MvProbs;
PGstVp8Parser  = ^GstVp8Parser;
PGstVp8ParserResult  = ^GstVp8ParserResult;
PGstVp8QuantIndices  = ^GstVp8QuantIndices;
PGstVp8RefFrameType  = ^GstVp8RefFrameType;
PGstVp8Segmentation  = ^GstVp8Segmentation;
PGstVp8TokenProbs  = ^GstVp8TokenProbs;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * gstvp8parser.h - VP8 parser
 *
 * Copyright (C) 2013-2014 Intel Corporation
 *   Author: Halley Zhao <halley.zhao@intel.com>
 *   Author: Gwenole Beauchesne <gwenole.beauchesne@intel.com>
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
{$ifndef GST_VP8_PARSER_H}
{$define GST_VP8_PARSER_H}
{$include <gst/gst.h>}
{$include <gst/codecparsers/codecparsers-prelude.h>}

const
  GST_VP8_MAX_REF_FRAMES = 3;  
type
{*
 * GstVp8ParserResult:
 * @GST_VP8_PARSER_OK: The parsing succeeded
 * @GST_VP8_PARSER_BROKEN_DATA: The data to parse is broken
 * @GST_VP8_PARSER_ERROR: An error accured when parsing
 *
 * The result of parsing VP8 data.
  }

  PGstVp8ParserResult = ^TGstVp8ParserResult;
  TGstVp8ParserResult =  Longint;
  Const
    GST_VP8_PARSER_OK = 0;
    GST_VP8_PARSER_BROKEN_DATA = 1;
    GST_VP8_PARSER_ERROR = 2;
;
{*
 * GstVp8FrameType:
 * @GST_VP8_KEY_FRAME: Key frame, only have intra blocks
 * @GST_VP8_INTER_FRAME: Inter frame, both intra and inter blocks
 *
 * VP8 frame types
 *
 * Since: 1.26
  }
type
  PGstVp8FrameType = ^TGstVp8FrameType;
  TGstVp8FrameType =  Longint;
  Const
    GST_VP8_KEY_FRAME = 0;
    GST_VP8_INTER_FRAME = 1;
;
{*
 * GstVp8RefFrameType:
 * @GST_VP8_REF_FRAME_INTRA: Intra reference frame
 * @GST_VP8_REF_FRAME_LAST: Last Reference frame
 * @GST_VP8_REF_FRAME_GOLDEN: Golden Reference frame
 * @GST_VP8_REF_FRAME_ALTREF: Alternate Reference frame
 * @GST_VP8_REF_FRAME_MAX:
 *
 * Reference Frame types
 *
 * Since: 1.26
  }
type
  PGstVp8RefFrameType = ^TGstVp8RefFrameType;
  TGstVp8RefFrameType =  Longint;
  Const
    GST_VP8_REF_FRAME_INTRA = 0;
    GST_VP8_REF_FRAME_LAST = 1;
    GST_VP8_REF_FRAME_GOLDEN = 2;
    GST_VP8_REF_FRAME_ALTREF = 3;
    GST_VP8_REF_FRAME_MAX = 4;
;
{*
 * GstVpQuantIndices:
 * @y_ac_qi: indicates the dequantization table index used for the
 *   luma AC coefficients
 * @y_dc_delta: indicates the delta value that is added to the
 *   baseline index to obtain the luma DC coefficient dequantization
 *   index
 * @y2_dc_delta: indicates the delta value that is added to the
 *   baseline index to obtain the Y2 block DC coefficient dequantization
 *   index
 * @y2_ac_delta: indicates the delta value that is added to the
 *   baseline index to obtain the Y2 block AC coefficient dequantization
 *   index
 * @uv_dc_delta: indicates the delta value that is added to the
 *   baseline index to obtain the chroma DC coefficient dequantization
 *   index
 * @uv_ac_delta: indicates the delta value that is added to the
 *   baseline index to obtain the chroma AC coefficient dequantization
 *   index
 *
 * Dequantization indices.
  }
type
  PGstVp8QuantIndices = ^TGstVp8QuantIndices;
  TGstVp8QuantIndices = record
      y_ac_qi : Tguint8;
      y_dc_delta : Tgint8;
      y2_dc_delta : Tgint8;
      y2_ac_delta : Tgint8;
      uv_dc_delta : Tgint8;
      uv_ac_delta : Tgint8;
    end;

{*
 * GstVp8Segmentation:
 * @segmentation_enabled: enables the segmentation feature for the
 *   current frame
 * @update_mb_segmentation_map: determines if the MB segmentation map
 *   is updated in the current frame
 * @update_segment_feature_data: indicates if the segment feature data
 *   is updated in the current frame
 * @segment_feature_mode: indicates the feature data update mode (0:
 *   delta, 1: absolute value)
 * @quantizer_update_value: indicates the update value for the segment
 *   quantizer
 * @lf_update_value: indicates the update value for the loop filter level
 * @segment_prob: indicates the branch probabilities of the segment_id
 *   decoding tree
 *
 * Segmentation feature data.
  }
{ if update_segment_feature_data == 1  }
{ if update_mb_segmentation_map == 1  }
  PGstVp8Segmentation = ^TGstVp8Segmentation;
  TGstVp8Segmentation = record
      segmentation_enabled : Tguint8;
      update_mb_segmentation_map : Tguint8;
      update_segment_feature_data : Tguint8;
      segment_feature_mode : Tguint8;
      quantizer_update_value : array[0..3] of Tgint8;
      lf_update_value : array[0..3] of Tgint8;
      segment_prob : array[0..2] of Tguint8;
    end;

{*
 * GstVp8MbLfAdjustments:
 * @loop_filter_adj_enable: indicates if the MB-level loop filter
 *   adjustment is on for the current frame
 * @mode_ref_lf_delta_update: indicates if the delta values used in an
 *   adjustment are updated in the current frame
 * @ref_frame_delta: indicates the adjustment delta value
 *   corresponding to a certain used reference frame
 * @mb_mode_delta: indicates the adjustment delta value corresponding
 *   to a certain MB prediction mode
 *
 * MB-level loop filter adjustments.
  }
{ if mode_ref_lf_delta_update == 1  }
  PGstVp8MbLfAdjustments = ^TGstVp8MbLfAdjustments;
  TGstVp8MbLfAdjustments = record
      loop_filter_adj_enable : Tguint8;
      mode_ref_lf_delta_update : Tguint8;
      ref_frame_delta : array[0..3] of Tgint8;
      mb_mode_delta : array[0..3] of Tgint8;
    end;

{*
 * GstVp8TokenProbs:
 * @prob: token probability
 *
 * Token probabilities, with cumulative updates applied.
 *
 * Each probability value in this matrix is live across frames, until
 * they are reset to their default values on key frame.
  }
  PGstVp8TokenProbs = ^TGstVp8TokenProbs;
  TGstVp8TokenProbs = record
      prob : array[0..3] of array[0..7] of array[0..2] of array[0..10] of Tguint8;
    end;

{*
 * GstVp8MvProbs:
 * @prob: MV probability
 *
 * Probabilities used for motion vector decoding, with cumulative
 * updates applied.
 *
 * Each probability value in this matrix is live across frames, until
 * they are reset to their default values on key frame.
  }
  PGstVp8MvProbs = ^TGstVp8MvProbs;
  TGstVp8MvProbs = record
      prob : array[0..1] of array[0..18] of Tguint8;
    end;

{*
 * GstVp8ModeProbs:
 * @y_prob: indicates the branch probabilities of the luma
 *   intra-prediction mode decoding tree
 * @uv_prob: indicates the branch probabilities of the chroma
 *   intra-prediction mode decoding tree
 *
 * Probabilities used for intra-prediction mode decoding tree.
 *
 * Each probability value in thie structure is live across frames,
 * until they are reset to their default values on key frame.
  }
  PGstVp8ModeProbs = ^TGstVp8ModeProbs;
  TGstVp8ModeProbs = record
      y_prob : array[0..3] of Tguint8;
      uv_prob : array[0..2] of Tguint8;
    end;

{*
 * GstVp8FrameHdr:
 * @key_frame: indicates whether the frame is a key frame (1), or an
 *   inter frame (0)
 * @version: version number
 * @show_frame: indicates whether the frame is meant to be displayed (1),
 *   or not (0)
 * @data_chunk_size: the size in bytes of the Uncompressed Data Chunk
 * @first_part_size: the size in bytes of the first partition (control
 *   partition), excluding the uncompressed data chunk
 * @width: the frame width in pixels
 * @height: the frame height in pixels
 * @horiz_scale_code: horizontal scale code value
 * @vert_scale_code: vertical scale code value
 * @color_space: defines the YUV color space of the sequence
 * @clamping_type: specifies if the decoder is required to clamp the
 *   reconstructed pixel values
 * @filter_type: determines whether the normal or the simple loop
 *   filter is used
 * @loop_filter_level: controls the deblocking filter
 * @sharpness_level: controls the deblocking filter
 * @log2_nbr_of_dct_partitions: determines the number of separate
 *   partitions containing the DCT coefficients of the macroblocks
 * @partition_size: determines the size of each separate partition
 *   containing the DCT coefficients of the macroblocks, including the
 *   very last one (calculated size)
 * @quant_indices: dequantization indices (see #GstVp8QuantIndices)
 * @token_probs: token probabilities (see #GstVp8TokenProbs)
 * @mv_probs: probabilities used for motion vector decoding
 *   (see #GstVp8MvProbs)
 * @mode_probs: probabilities used for intra-prediction mode decoding
 *   tree (see #GstVp8ModeProbs)
 * @refresh_entropy_probs: determines whether updated token
 *   probabilities are used only for this frame or until further update
 * @refresh_golden_frame: determines if the current decoded frame
 *   refreshes the golden frame
 * @refresh_alternate_frame: determines if the current decoded frame
 *   refreshes the alternate reference frame
 * @copy_buffer_to_golden: determines if the golden reference is
 *   replaced by another reference
 * @copy_buffer_to_alternate: determines if the alternate reference is
 *   replaced by another reference
 * @sign_bias_golden: controls the sign of motion vectors when the
 *   golden frame is referenced
 * @sign_bias_alternate: controls the sign of motion vectors when the
 *   alternate frame is referenced
 * @refresh_last: determines if the current decoded frame refreshes
 *   the last frame reference buffer
 * @mb_no_skip_coeff: enables (0) or disables (1) the skipping of
 *   macroblocks containing no non-zero coefficients
 * @prob_skip_false: indicates the probability that the macroblock is
 *   not skipped
 * @prob_intra: indicates the probability of an intra macroblock
 * @prob_last: indicates the probability that the last reference frame
 *   is used for inter-prediction
 * @prob_gf: indicates the probability that the golden reference frame
 *   is used for inter-prediction
 * @rd_range: last range decoder value for "Range"
 * @rd_value: last range decoder value for "Value"
 * @rd_count: number of bits left in range decoder "Value" (@rd_value)
 * @header_size: the size in bits of the Frame Header, thus excluding
 *   any Uncompressed Data Chunk bytes
 *
 * Frame header.
  }
{ if key_frame == 1  }
{ if key_frame != 1  }
{ if key_frame != 1  }
{ Range decoder state  }
{ Size of the Frame Header in bits  }
  PGstVp8FrameHdr = ^TGstVp8FrameHdr;
  TGstVp8FrameHdr = record
      key_frame : Tguint8;
      version : Tguint8;
      show_frame : Tguint8;
      data_chunk_size : Tguint8;
      first_part_size : Tguint32;
      width : Tguint16;
      height : Tguint16;
      horiz_scale_code : Tguint8;
      vert_scale_code : Tguint8;
      color_space : Tguint8;
      clamping_type : Tguint8;
      filter_type : Tguint8;
      loop_filter_level : Tguint8;
      sharpness_level : Tguint8;
      log2_nbr_of_dct_partitions : Tguint8;
      partition_size : array[0..7] of Tguint;
      quant_indices : TGstVp8QuantIndices;
      token_probs : TGstVp8TokenProbs;
      mv_probs : TGstVp8MvProbs;
      mode_probs : TGstVp8ModeProbs;
      refresh_entropy_probs : Tguint8;
      refresh_last : Tguint8;
      refresh_golden_frame : Tguint8;
      refresh_alternate_frame : Tguint8;
      copy_buffer_to_golden : Tguint8;
      copy_buffer_to_alternate : Tguint8;
      sign_bias_golden : Tguint8;
      sign_bias_alternate : Tguint8;
      mb_no_skip_coeff : Tguint8;
      prob_skip_false : Tguint8;
      prob_intra : Tguint8;
      prob_last : Tguint8;
      prob_gf : Tguint8;
      rd_range : Tguint8;
      rd_value : Tguint8;
      rd_count : Tguint8;
      header_size : Tguint;
    end;

{*
 * GstVp8Parser:
 * @segmentation: segmentation feature data
 * @mb_lf_adjust: MB-level loop filter adjustments
 * @token_probs: token probabilities
 * @mv_probs: probabilities used for motion vector decoding
 * @mode_probs: probabilities used for intra-prediction mode decoding tree.
 *
 * Parser context that needs to be live across frames. For instance
 * the probabilities tables stored in #GstVp8FrameHdr may depend on
 * the previous frames.
  }
  PGstVp8Parser = ^TGstVp8Parser;
  TGstVp8Parser = record
      segmentation : TGstVp8Segmentation;
      mb_lf_adjust : TGstVp8MbLfAdjustments;
      token_probs : TGstVp8TokenProbs;
      mv_probs : TGstVp8MvProbs;
      mode_probs : TGstVp8ModeProbs;
    end;


procedure gst_vp8_parser_init(parser:PGstVp8Parser);cdecl;external;
(* Const before type ignored *)
function gst_vp8_parser_parse_frame_header(parser:PGstVp8Parser; frame_hdr:PGstVp8FrameHdr; data:Pguint8; size:Tgsize):TGstVp8ParserResult;cdecl;external;
{$endif}
{ GST_VP8_PARSER_H  }

implementation


end.
