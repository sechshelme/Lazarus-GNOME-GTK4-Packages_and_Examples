
unit gstmpegvideoparser;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstmpegvideoparser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstmpegvideoparser.h
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
PGstMpegVideoChromaFormat  = ^GstMpegVideoChromaFormat;
PGstMpegVideoGop  = ^GstMpegVideoGop;
PGstMpegVideoLevel  = ^GstMpegVideoLevel;
PGstMpegVideoPacket  = ^GstMpegVideoPacket;
PGstMpegVideoPacketExtensionCode  = ^GstMpegVideoPacketExtensionCode;
PGstMpegVideoPacketTypeCode  = ^GstMpegVideoPacketTypeCode;
PGstMpegVideoPictureExt  = ^GstMpegVideoPictureExt;
PGstMpegVideoPictureHdr  = ^GstMpegVideoPictureHdr;
PGstMpegVideoPictureStructure  = ^GstMpegVideoPictureStructure;
PGstMpegVideoPictureType  = ^GstMpegVideoPictureType;
PGstMpegVideoProfile  = ^GstMpegVideoProfile;
PGstMpegVideoQuantMatrixExt  = ^GstMpegVideoQuantMatrixExt;
PGstMpegVideoSequenceDisplayExt  = ^GstMpegVideoSequenceDisplayExt;
PGstMpegVideoSequenceExt  = ^GstMpegVideoSequenceExt;
PGstMpegVideoSequenceHdr  = ^GstMpegVideoSequenceHdr;
PGstMpegVideoSequenceScalableExt  = ^GstMpegVideoSequenceScalableExt;
PGstMpegVideoSequenceScalableMode  = ^GstMpegVideoSequenceScalableMode;
PGstMpegVideoSliceHdr  = ^GstMpegVideoSliceHdr;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Gstreamer
 * Copyright (C) <2011> Intel Corporation
 * Copyright (C) <2011> Collabora Ltd.
 * Copyright (C) <2011> Thibault Saunier <thibault.saunier@collabora.com>
 *
 * From bad/sys/vdpau/mpeg/mpegutil.c:
 *   Copyright (C) <2007> Jan Schmidt <thaytan@mad.scientist.com>
 *   Copyright (C) <2009> Carl-Anton Ingmarsson <ca.ingmarsson@gmail.com>
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
{$ifndef __GST_MPEG_VIDEO_UTILS_H__}
{$define __GST_MPEG_VIDEO_UTILS_H__}
{$include <gst/gst.h>}
{$include <gst/codecparsers/codecparsers-prelude.h>}
{*
 * GstMpegVideoPacketTypeCode:
 * @GST_MPEG_VIDEO_PACKET_PICTURE: Picture packet starting code
 * @GST_MPEG_VIDEO_PACKET_SLICE_MIN: Slice min packet starting code
 * @GST_MPEG_VIDEO_PACKET_SLICE_MAX: Slice max packet starting code
 * @GST_MPEG_VIDEO_PACKET_USER_DATA: User data packet starting code
 * @GST_MPEG_VIDEO_PACKET_SEQUENCE : Sequence packet starting code
 * @GST_MPEG_VIDEO_PACKET_EXTENSION: Extension packet starting code
 * @GST_MPEG_VIDEO_PACKET_SEQUENCE_END: Sequence end packet code
 * @GST_MPEG_VIDEO_PACKET_GOP: Group of Picture packet starting code
 * @GST_MPEG_VIDEO_PACKET_NONE: None packet code
 *
 * Indicates the type of MPEG packet
  }
type
  PGstMpegVideoPacketTypeCode = ^TGstMpegVideoPacketTypeCode;
  TGstMpegVideoPacketTypeCode =  Longint;
  Const
    GST_MPEG_VIDEO_PACKET_PICTURE = $00;
    GST_MPEG_VIDEO_PACKET_SLICE_MIN = $01;
    GST_MPEG_VIDEO_PACKET_SLICE_MAX = $af;
    GST_MPEG_VIDEO_PACKET_USER_DATA = $b2;
    GST_MPEG_VIDEO_PACKET_SEQUENCE = $b3;
    GST_MPEG_VIDEO_PACKET_EXTENSION = $b5;
    GST_MPEG_VIDEO_PACKET_SEQUENCE_END = $b7;
    GST_MPEG_VIDEO_PACKET_GOP = $b8;
    GST_MPEG_VIDEO_PACKET_NONE = $ff;
;
{*
 * GST_MPEG_VIDEO_PACKET_IS_SLICE:
 * @typecode: The MPEG video packet type code
 *
 * Checks whether a packet type code is a slice.
 *
 * Returns: %TRUE if the packet type code corresponds to a slice,
 * else %FALSE.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_MPEG_VIDEO_PACKET_IS_SLICE(typecode : longint) : longint;

{*
 * GstMpegVideoPacketExtensionCode:
 * @GST_MPEG_VIDEO_PACKET_EXT_SEQUENCE: Sequence extension code
 * @GST_MPEG_VIDEO_PACKET_EXT_SEQUENCE_DISPLAY: Sequence Display extension code
 * @GST_MPEG_VIDEO_PACKET_EXT_QUANT_MATRIX: Quantization Matrix extension code
 * @GST_MPEG_VIDEO_PACKET_EXT_SEQUENCE_SCALABLE: Sequence Scalable extension code
 * @GST_MPEG_VIDEO_PACKET_EXT_PICTURE: Picture coding extension
 *
 * Indicates what type of packets are in this block, some are mutually
 * exclusive though - ie, sequence packs are accumulated separately. GOP &
 * Picture may occur together or separately.
  }
type
  PGstMpegVideoPacketExtensionCode = ^TGstMpegVideoPacketExtensionCode;
  TGstMpegVideoPacketExtensionCode =  Longint;
  Const
    GST_MPEG_VIDEO_PACKET_EXT_SEQUENCE = $01;
    GST_MPEG_VIDEO_PACKET_EXT_SEQUENCE_DISPLAY = $02;
    GST_MPEG_VIDEO_PACKET_EXT_QUANT_MATRIX = $03;
    GST_MPEG_VIDEO_PACKET_EXT_SEQUENCE_SCALABLE = $05;
    GST_MPEG_VIDEO_PACKET_EXT_PICTURE = $08;
;
{*
 * GstMpegVideoSequenceScalableMode:
 * @GST_MPEG_VIDEO_SEQ_SCALABLE_MODE_DATA_PARTITIONING: Data partitioning
 * @GST_MPEG_VIDEO_SEQ_SCALABLE_MODE_SPATIAL: Spatial Scalability
 * @GST_MPEG_VIDEO_SEQ_SCALABLE_MODE_SNR: SNR Scalability
 * @GST_MPEG_VIDEO_SEQ_SCALABLE_MODE_TEMPORAL: Temporal Scalability
  }
type
  PGstMpegVideoSequenceScalableMode = ^TGstMpegVideoSequenceScalableMode;
  TGstMpegVideoSequenceScalableMode =  Longint;
  Const
    GST_MPEG_VIDEO_SEQ_SCALABLE_MODE_DATA_PARTITIONING = $00;
    GST_MPEG_VIDEO_SEQ_SCALABLE_MODE_SPATIAL = $01;
    GST_MPEG_VIDEO_SEQ_SCALABLE_MODE_SNR = $02;
    GST_MPEG_VIDEO_SEQ_SCALABLE_MODE_TEMPORAL = $03;
;
{*
 * GstMpegVideoLevel:
 * @GST_MPEG_VIDEO_LEVEL_LOW: Low level (LL)
 * @GST_MPEG_VIDEO_LEVEL_MAIN: Main level (ML)
 * @GST_MPEG_VIDEO_LEVEL_HIGH_1440: High 1440 level (H-14)
 * @GST_MPEG_VIDEO_LEVEL_HIGH: High level (HL)
 * @GST_MPEG_VIDEO_LEVEL_HIGH_P: High-P level (HL Progressive)
 *
 * Mpeg-2 Levels.
 * }
type
  PGstMpegVideoLevel = ^TGstMpegVideoLevel;
  TGstMpegVideoLevel =  Longint;
  Const
    GST_MPEG_VIDEO_LEVEL_HIGH_P = $02;
    GST_MPEG_VIDEO_LEVEL_HIGH = $04;
    GST_MPEG_VIDEO_LEVEL_HIGH_1440 = $06;
    GST_MPEG_VIDEO_LEVEL_MAIN = $08;
    GST_MPEG_VIDEO_LEVEL_LOW = $0a;
;
{*
 * GstMpegVideoProfile:
 * @GST_MPEG_VIDEO_PROFILE_422: 4:2:2 profile (422)
 * @GST_MPEG_VIDEO_PROFILE_HIGH: High profile (HP)
 * @GST_MPEG_VIDEO_PROFILE_SPATIALLY_SCALABLE: Spatially Scalable profile (Spatial)
 * @GST_MPEG_VIDEO_PROFILE_SNR_SCALABLE: SNR Scalable profile (SNR)
 * @GST_MPEG_VIDEO_PROFILE_MAIN: Main profile (MP)
 * @GST_MPEG_VIDEO_PROFILE_SIMPLE: Simple profile (SP)
 *
 * Mpeg-2 Profiles.
 * }
type
  PGstMpegVideoProfile = ^TGstMpegVideoProfile;
  TGstMpegVideoProfile =  Longint;
  Const
    GST_MPEG_VIDEO_PROFILE_422 = $00;
    GST_MPEG_VIDEO_PROFILE_HIGH = $01;
    GST_MPEG_VIDEO_PROFILE_SPATIALLY_SCALABLE = $02;
    GST_MPEG_VIDEO_PROFILE_SNR_SCALABLE = $03;
    GST_MPEG_VIDEO_PROFILE_MAIN = $04;
    GST_MPEG_VIDEO_PROFILE_SIMPLE = $05;
;
{*
 * GstMpegVideoChromaFormat:
 * @GST_MPEG_VIDEO_CHROMA_RES: Invalid (reserved for future use)
 * @GST_MPEG_VIDEO_CHROMA_420: 4:2:0 subsampling
 * @GST_MPEG_VIDEO_CHROMA_422: 4:2:2 subsampling
 * @GST_MPEG_VIDEO_CHROMA_444: 4:4:4 (non-subsampled)
 *
 * Chroma subsampling type.
  }
type
  PGstMpegVideoChromaFormat = ^TGstMpegVideoChromaFormat;
  TGstMpegVideoChromaFormat =  Longint;
  Const
    GST_MPEG_VIDEO_CHROMA_RES = $00;
    GST_MPEG_VIDEO_CHROMA_420 = $01;
    GST_MPEG_VIDEO_CHROMA_422 = $02;
    GST_MPEG_VIDEO_CHROMA_444 = $03;
;
{*
 * GstMpegVideoPictureType:
 * @GST_MPEG_VIDEO_PICTURE_TYPE_I: Intra-coded (I) frame
 * @GST_MPEG_VIDEO_PICTURE_TYPE_P: Predictive-codec (P) frame
 * @GST_MPEG_VIDEO_PICTURE_TYPE_B: Bidirectionally predictive-coded (B) frame
 * @GST_MPEG_VIDEO_PICTURE_TYPE_D: D frame
 *
 * Picture type.
  }
type
  PGstMpegVideoPictureType = ^TGstMpegVideoPictureType;
  TGstMpegVideoPictureType =  Longint;
  Const
    GST_MPEG_VIDEO_PICTURE_TYPE_I = $01;
    GST_MPEG_VIDEO_PICTURE_TYPE_P = $02;
    GST_MPEG_VIDEO_PICTURE_TYPE_B = $03;
    GST_MPEG_VIDEO_PICTURE_TYPE_D = $04;
;
{*
 * GstMpegVideoPictureStructure:
 * @GST_MPEG_VIDEO_PICTURE_STRUCTURE_TOP_FIELD: Top field
 * @GST_MPEG_VIDEO_PICTURE_STRUCTURE_BOTTOM_FIELD: Bottom field
 * @GST_MPEG_VIDEO_PICTURE_STRUCTURE_FRAME: Frame picture
 *
 * Picture structure type.
  }
type
  PGstMpegVideoPictureStructure = ^TGstMpegVideoPictureStructure;
  TGstMpegVideoPictureStructure =  Longint;
  Const
    GST_MPEG_VIDEO_PICTURE_STRUCTURE_TOP_FIELD = $01;
    GST_MPEG_VIDEO_PICTURE_STRUCTURE_BOTTOM_FIELD = $02;
    GST_MPEG_VIDEO_PICTURE_STRUCTURE_FRAME = $03;
;
type
{*
 * GstMpegVideoSequenceHdr:
 * @width: Width of each frame
 * @height: Height of each frame
 * @par_w: Calculated Pixel Aspect Ratio width
 * @par_h: Calculated Pixel Aspect Ratio height
 * @fps_n: Calculated Framrate nominator
 * @fps_d: Calculated Framerate denominator
 * @bitrate_value: Value of the bitrate as is in the stream (400bps unit)
 * @bitrate: the real bitrate of the Mpeg video stream in bits per second, 0 if VBR stream
 * @constrained_parameters_flag: %TRUE if this stream uses constrained parameters.
 * @load_intra_quantiser_matrix: %TRUE indicates the presence of intra_quantiser_matrix
 * @intra_quantizer_matrix: intra-quantization table, in zigzag scan order
 * @load_non_intra_quantiser_matrix: %TRUE indicates the presence of non_intra_quantiser_matrix
 * @non_intra_quantizer_matrix: non-intra quantization table, in zigzag scan order
 *
 * The Mpeg2 Video Sequence Header structure.
  }
{ Calculated values  }
  PGstMpegVideoSequenceHdr = ^TGstMpegVideoSequenceHdr;
  TGstMpegVideoSequenceHdr = record
      width : Tguint16;
      height : Tguint16;
      aspect_ratio_info : Tguint8;
      frame_rate_code : Tguint8;
      bitrate_value : Tguint32;
      vbv_buffer_size_value : Tguint16;
      constrained_parameters_flag : Tguint8;
      load_intra_quantiser_matrix : Tguint8;
      intra_quantizer_matrix : array[0..63] of Tguint8;
      load_non_intra_quantiser_matrix : Tguint8;
      non_intra_quantizer_matrix : array[0..63] of Tguint8;
      par_w : Tguint;
      par_h : Tguint;
      fps_n : Tguint;
      fps_d : Tguint;
      bitrate : Tguint;
    end;

{*
 * GstMpegVideoSequenceExt:
 * @profile: mpeg2 decoder profile
 * @level: mpeg2 decoder level
 * @progressive: %TRUE if the frames are progressive %FALSE otherwise
 * @chroma_format: indicates the chrominance format
 * @horiz_size_ext: Horizontal size
 * @vert_size_ext: Vertical size
 * @bitrate_ext: The bitrate
 * @vbv_buffer_size_extension: VBV buffer size
 * @low_delay: %TRUE if the sequence doesn't contain any B-pictures, %FALSE
 * otherwise
 * @fps_n_ext: Framerate nominator code
 * @fps_d_ext: Framerate denominator code
 * @profile_level_escape_bit: Escape bit. If set, the meaning of the
 *    @profile and @level fields is different.
 *
 * The Mpeg2 Video Sequence Extension structure.
 * }
{ mpeg2 decoder profile  }
{ mpeg2 decoder level  }
{ Additional information  }
  PGstMpegVideoSequenceExt = ^TGstMpegVideoSequenceExt;
  TGstMpegVideoSequenceExt = record
      profile : Tguint8;
      level : Tguint8;
      progressive : Tguint8;
      chroma_format : Tguint8;
      horiz_size_ext : Tguint8;
      vert_size_ext : Tguint8;
      bitrate_ext : Tguint16;
      vbv_buffer_size_extension : Tguint8;
      low_delay : Tguint8;
      fps_n_ext : Tguint8;
      fps_d_ext : Tguint8;
      profile_level_escape_bit : Tguint8;
    end;

{*
 * GstMpegVideoSequenceDisplayExt:
 * @video_format: 3-bit video_format field indicating PAL/NTSC etc.
 * @colour_description_flag: %TRUE if colour information was provided
 * @colour_primaries: Valid if colour_description_flag is set
 * @transfer_characteristics: Valid if colour_description_flag is set
 * @matrix_coefficients: Valid if colour_description_flag is set
 * @display_horizontal_size: width of decoded frame sub-region to display
 * @display_vertical_size: height of decoded frame sub-region to display
  }
{ if colour_description_flag:  }
  PGstMpegVideoSequenceDisplayExt = ^TGstMpegVideoSequenceDisplayExt;
  TGstMpegVideoSequenceDisplayExt = record
      video_format : Tguint8;
      colour_description_flag : Tguint8;
      colour_primaries : Tguint8;
      transfer_characteristics : Tguint8;
      matrix_coefficients : Tguint8;
      display_horizontal_size : Tguint16;
      display_vertical_size : Tguint16;
    end;

{*
 * GstMpegVideoSequenceScalableExt:
 * @scalable_mode:
 * @layer_id:
 * @lower_layer_prediction_horizontal_size:
 * @lower_layer_prediction_vertical_size:
 * @horizontal_subsampling_factor_m:
 * @horizontal_subsampling_factor_n:
 * @vertical_subsampling_factor_m:
 * @vertical_subsampling_factor_n:
 * @picture_mux_enable:
 * @mux_to_progressive_sequence:
 * @picture_mux_order:
 * @picture_mux_factor:
 *
 * The Sequence Scalable Extension structure.
 *
 * Since: 1.2
  }
{ if spatial scalability  }
{ if temporal scalability  }
  PGstMpegVideoSequenceScalableExt = ^TGstMpegVideoSequenceScalableExt;
  TGstMpegVideoSequenceScalableExt = record
      scalable_mode : Tguint8;
      layer_id : Tguint8;
      lower_layer_prediction_horizontal_size : Tguint16;
      lower_layer_prediction_vertical_size : Tguint16;
      horizontal_subsampling_factor_m : Tguint8;
      horizontal_subsampling_factor_n : Tguint8;
      vertical_subsampling_factor_m : Tguint8;
      vertical_subsampling_factor_n : Tguint8;
      picture_mux_enable : Tguint8;
      mux_to_progressive_sequence : Tguint8;
      picture_mux_order : Tguint8;
      picture_mux_factor : Tguint8;
    end;

{*
 * GstMpegVideoQuantMatrixExt:
 * @load_intra_quantiser_matrix:
 * @intra_quantiser_matrix:
 * @load_non_intra_quantiser_matrix:
 * @non_intra_quantiser_matrix:
 * @load_chroma_intra_quantiser_matrix:
 * @chroma_intra_quantiser_matrix:
 * @load_chroma_non_intra_quantiser_matrix:
 * @chroma_non_intra_quantiser_matrix:
 *
 * The Quant Matrix Extension structure that exposes quantization
 * matrices in zigzag scan order. i.e. the original encoded scan
 * order.
  }
  PGstMpegVideoQuantMatrixExt = ^TGstMpegVideoQuantMatrixExt;
  TGstMpegVideoQuantMatrixExt = record
      load_intra_quantiser_matrix : Tguint8;
      intra_quantiser_matrix : array[0..63] of Tguint8;
      load_non_intra_quantiser_matrix : Tguint8;
      non_intra_quantiser_matrix : array[0..63] of Tguint8;
      load_chroma_intra_quantiser_matrix : Tguint8;
      chroma_intra_quantiser_matrix : array[0..63] of Tguint8;
      load_chroma_non_intra_quantiser_matrix : Tguint8;
      chroma_non_intra_quantiser_matrix : array[0..63] of Tguint8;
    end;

{*
 * GstMpegVideoPictureHdr:
 * @tsn: Temporal Sequence Number
 * @pic_type: Type of the frame
 * @full_pel_forward_vector: the full pel forward flag of
 *  the frame: 0 or 1.
 * @full_pel_backward_vector: the full pel backward flag
 *  of the frame: 0 or 1.
 * @f_code: F code
 *
 * The Mpeg2 Video Picture Header structure.
  }
  PGstMpegVideoPictureHdr = ^TGstMpegVideoPictureHdr;
  TGstMpegVideoPictureHdr = record
      tsn : Tguint16;
      pic_type : Tguint8;
      vbv_delay : Tguint16;
      full_pel_forward_vector : Tguint8;
      full_pel_backward_vector : Tguint8;
      f_code : array[0..1] of array[0..1] of Tguint8;
    end;

{*
 * GstMpegVideoPictureExt:
 * @intra_dc_precision: Intra DC precision
 * @picture_structure: Structure of the picture
 * @top_field_first: Top field first
 * @frame_pred_frame_dct: Frame
 * @concealment_motion_vectors: Concealment Motion Vectors
 * @q_scale_type: Q Scale Type
 * @intra_vlc_format: Intra Vlc Format
 * @alternate_scan: Alternate Scan
 * @repeat_first_field: Repeat First Field
 * @chroma_420_type: Chroma 420 Type
 * @progressive_frame: %TRUE if the frame is progressive %FALSE otherwise
 *
 * The Mpeg2 Video Picture Extension structure.
  }
  PGstMpegVideoPictureExt = ^TGstMpegVideoPictureExt;
  TGstMpegVideoPictureExt = record
      f_code : array[0..1] of array[0..1] of Tguint8;
      intra_dc_precision : Tguint8;
      picture_structure : Tguint8;
      top_field_first : Tguint8;
      frame_pred_frame_dct : Tguint8;
      concealment_motion_vectors : Tguint8;
      q_scale_type : Tguint8;
      intra_vlc_format : Tguint8;
      alternate_scan : Tguint8;
      repeat_first_field : Tguint8;
      chroma_420_type : Tguint8;
      progressive_frame : Tguint8;
      composite_display : Tguint8;
      v_axis : Tguint8;
      field_sequence : Tguint8;
      sub_carrier : Tguint8;
      burst_amplitude : Tguint8;
      sub_carrier_phase : Tguint8;
    end;

{*
 * GstMpegVideoGop:
 * @drop_frame_flag: Drop Frame Flag
 * @hour: Hour (0-23)
 * @minute: Minute (O-59)
 * @second: Second (0-59)
 * @frame: Frame (0-59)
 * @closed_gop: Closed Gop
 * @broken_link: Broken link
 *
 * The Mpeg Video Group of Picture structure.
  }
  PGstMpegVideoGop = ^TGstMpegVideoGop;
  TGstMpegVideoGop = record
      drop_frame_flag : Tguint8;
      hour : Tguint8;
      minute : Tguint8;
      second : Tguint8;
      frame : Tguint8;
      closed_gop : Tguint8;
      broken_link : Tguint8;
    end;

{*
 * GstMpegVideoSliceHdr:
 * @vertical_position: slice vertical position
 * @vertical_position_extension: Extension to slice_vertical_position
 * @priority_breakpoint: Point where the bitstream shall be partitioned
 * @quantiser_scale_code: Quantiser value (range: 1-31)
 * @slice_ext_flag: Slice Extension flag
 * @intra_slice: Equal to one if all the macroblocks are intra macro blocks.
 * @slice_picture_id_enable: controls the semantics of slice_picture_id
 * @slice_picture_id: Intended to aid recovery on severe bursts of
 *   errors for certain types of applications
 *
 * The Mpeg2 Video Slice Header structure.
 *
 * Since: 1.2
  }
{ Calculated values  }
{ slice_header size in bits  }
{ macroblock row  }
{ macroblock column  }
  PGstMpegVideoSliceHdr = ^TGstMpegVideoSliceHdr;
  TGstMpegVideoSliceHdr = record
      vertical_position : Tguint8;
      vertical_position_ext : Tguint8;
      priority_breakpoint : Tguint8;
      quantiser_scale_code : Tguint8;
      slice_ext_flag : Tguint8;
      intra_slice : Tguint8;
      slice_picture_id_enable : Tguint8;
      slice_picture_id : Tguint8;
      header_size : Tguint;
      mb_row : Tgint;
      mb_column : Tgint;
    end;

{*
 * GstMpegVideoPacket:
 * @type: the type of the packet that start at @offset, as a #GstMpegVideoPacketTypeCode
 * @data: the data containing the packet starting at @offset
 * @offset: the offset of the packet start in bytes from @data. This is the
 *     start of the packet itself without the sync code
 * @size: The size in bytes of the packet or -1 if the end wasn't found. This
 *     is the size of the packet itself without the sync code
 *
 * A structure that contains the type of a packet, its offset and its size
  }
(* Const before type ignored *)
  PGstMpegVideoPacket = ^TGstMpegVideoPacket;
  TGstMpegVideoPacket = record
      data : Pguint8;
      _type : Tguint8;
      offset : Tguint;
      size : Tgint;
    end;

(* Const before type ignored *)

function gst_mpeg_video_parse(packet:PGstMpegVideoPacket; data:Pguint8; size:Tgsize; offset:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mpeg_video_packet_parse_sequence_header(packet:PGstMpegVideoPacket; seqhdr:PGstMpegVideoSequenceHdr):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mpeg_video_packet_parse_sequence_extension(packet:PGstMpegVideoPacket; seqext:PGstMpegVideoSequenceExt):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mpeg_video_packet_parse_sequence_display_extension(packet:PGstMpegVideoPacket; seqdisplayext:PGstMpegVideoSequenceDisplayExt):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mpeg_video_packet_parse_sequence_scalable_extension(packet:PGstMpegVideoPacket; seqscaleext:PGstMpegVideoSequenceScalableExt):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mpeg_video_packet_parse_picture_header(packet:PGstMpegVideoPacket; pichdr:PGstMpegVideoPictureHdr):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mpeg_video_packet_parse_picture_extension(packet:PGstMpegVideoPacket; picext:PGstMpegVideoPictureExt):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mpeg_video_packet_parse_gop(packet:PGstMpegVideoPacket; gop:PGstMpegVideoGop):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mpeg_video_packet_parse_slice_header(packet:PGstMpegVideoPacket; slice_hdr:PGstMpegVideoSliceHdr; seq_hdr:PGstMpegVideoSequenceHdr; seqscaleext:PGstMpegVideoSequenceScalableExt):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mpeg_video_packet_parse_quant_matrix_extension(packet:PGstMpegVideoPacket; quant:PGstMpegVideoQuantMatrixExt):Tgboolean;cdecl;external;
{ seqext and displayext may be NULL if not received  }
function gst_mpeg_video_finalise_mpeg2_sequence_header(hdr:PGstMpegVideoSequenceHdr; seqext:PGstMpegVideoSequenceExt; displayext:PGstMpegVideoSequenceDisplayExt):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gst_mpeg_video_quant_matrix_get_raster_from_zigzag(out_quant:array[0..63] of Tguint8; quant:array[0..63] of Tguint8);cdecl;external;
(* Const before type ignored *)
procedure gst_mpeg_video_quant_matrix_get_zigzag_from_raster(out_quant:array[0..63] of Tguint8; quant:array[0..63] of Tguint8);cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MPEG_VIDEO_PACKET_IS_SLICE(typecode : longint) : longint;
begin
  GST_MPEG_VIDEO_PACKET_IS_SLICE:=(typecode>=(GST_MPEG_VIDEO_PACKET_SLICE_MIN and (@(typecode))))<=GST_MPEG_VIDEO_PACKET_SLICE_MAX;
end;


end.
