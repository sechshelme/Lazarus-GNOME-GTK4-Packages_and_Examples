unit gstmpeg4parser;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2009 Carl-Anton Ingmarsson <ca.ingmarsson@gmail.com>
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
{$ifndef __GST_MPEG4UTIL_H__}
{$define __GST_MPEG4UTIL_H__}
{$include <gst/gst.h>}
{$include <gst/codecparsers/codecparsers-prelude.h>}
type
{*
 * GstMpeg4StartCode:
 *
 * Defines the different startcodes present in the bitstream as
 * defined in: Table 6-3 — Start code values
  }

  PGstMpeg4StartCode = ^TGstMpeg4StartCode;
  TGstMpeg4StartCode =  Longint;
  Const
    GST_MPEG4_VIDEO_OBJ_FIRST = $00;
    GST_MPEG4_VIDEO_OBJ_LAST = $1f;
    GST_MPEG4_VIDEO_LAYER_FIRST = $20;
    GST_MPEG4_VIDEO_LAYER_LAST = $2f;
    GST_MPEG4_VISUAL_OBJ_SEQ_START = $b0;
    GST_MPEG4_VISUAL_OBJ_SEQ_END = $b1;
    GST_MPEG4_USER_DATA = $b2;
    GST_MPEG4_GROUP_OF_VOP = $b3;
    GST_MPEG4_VIDEO_SESSION_ERR = $b4;
    GST_MPEG4_VISUAL_OBJ = $b5;
    GST_MPEG4_VIDEO_OBJ_PLANE = $b6;
    GST_MPEG4_FBA = $ba;
    GST_MPEG4_FBA_PLAN = $bb;
    GST_MPEG4_MESH = $bc;
    GST_MPEG4_MESH_PLAN = $bd;
    GST_MPEG4_STILL_TEXTURE_OBJ = $be;
    GST_MPEG4_TEXTURE_SPATIAL = $bf;
    GST_MPEG4_TEXTURE_SNR_LAYER = $c0;
    GST_MPEG4_TEXTURE_TILE = $c1;
    GST_MPEG4_SHAPE_LAYER = $c2;
    GST_MPEG4_STUFFING = $c3;
    GST_MPEG4_SYSTEM_FIRST = $c6;
    GST_MPEG4_SYSTEM_LAST = $ff;
    GST_MPEG4_RESYNC = $fff;
;
{*
 * GstMpeg4VisualObjectType:
 *
 * Defines the different visual object types as
 * defined in: Table 6-5 -- Meaning of visual object type
  }
{... reserved  }
type
  PGstMpeg4VisualObjectType = ^TGstMpeg4VisualObjectType;
  TGstMpeg4VisualObjectType =  Longint;
  Const
    GST_MPEG4_VIDEO_ID = $01;
    GST_MPEG4_STILL_TEXTURE_ID = $02;
    GST_MPEG4_STILL_MESH_ID = $03;
    GST_MPEG4_STILL_FBA_ID = $04;
    GST_MPEG4_STILL_3D_MESH_ID = $05;
;
{*
 * GstMpeg4AspectRatioInfo:
 * @GST_MPEG4_SQUARE: 1:1 square
 * @GST_MPEG4_625_TYPE_4_3: 12:11 (625-type for 4:3 picture)
 * @GST_MPEG4_525_TYPE_4_3: 10:11 (525-type for 4:3 picture)
 * @GST_MPEG4_625_TYPE_16_9: 16:11 (625-type stretched for 16:9 picture)
 * @GST_MPEG4_525_TYPE_16_9: 40:33 (525-type stretched for 16:9 picture)
 * @GST_MPEG4_EXTENDED_PAR: Extended par
 *
 * Defines the different pixel aspect ratios as
 * defined in: Table 6-12 -- Meaning of pixel aspect ratio
  }
type
  PGstMpeg4AspectRatioInfo = ^TGstMpeg4AspectRatioInfo;
  TGstMpeg4AspectRatioInfo =  Longint;
  Const
    GST_MPEG4_SQUARE = $01;
    GST_MPEG4_625_TYPE_4_3 = $02;
    GST_MPEG4_525_TYPE_4_3 = $03;
    GST_MPEG4_625_TYPE_16_9 = $04;
    GST_MPEG4_525_TYPE_16_9 = $05;
    GST_MPEG4_EXTENDED_PAR = $0f;
;
{*
 * GstMpeg4ParseResult:
 * @GST_MPEG4_PARSER_OK: The parsing went well
 * @GST_MPEG4_PARSER_BROKEN_DATA: The bitstream was broken
 * @GST_MPEG4_PARSER_NO_PACKET: There was no packet in the buffer
 * @GST_MPEG4_PARSER_NO_PACKET_END: There was no packet end in the buffer
 * @GST_MPEG4_PARSER_NO_PACKET_ERROR: An error accured durint the parsing
 *
 * Result type of any parsing function.
  }
type
  PGstMpeg4ParseResult = ^TGstMpeg4ParseResult;
  TGstMpeg4ParseResult =  Longint;
  Const
    GST_MPEG4_PARSER_OK = 0;
    GST_MPEG4_PARSER_BROKEN_DATA = 1;
    GST_MPEG4_PARSER_NO_PACKET = 2;
    GST_MPEG4_PARSER_NO_PACKET_END = 3;
    GST_MPEG4_PARSER_ERROR = 4;
;
{*
 * GstMpeg4VideoObjectCodingType:
 * @GST_MPEG4_I_VOP: intra-coded (I)
 * @GST_MPEG4_P_VOP: predictive-coded (P)
 * @GST_MPEG4_B_VOP: bidirectionally-predictive-coded (B)
 * @GST_MPEG4_S_VOP: sprite (S)
 *
 * The vop coding types as defined in:
 * Table 6-20 -- Meaning of vop_coding_type
  }
type
  PGstMpeg4VideoObjectCodingType = ^TGstMpeg4VideoObjectCodingType;
  TGstMpeg4VideoObjectCodingType =  Longint;
  Const
    GST_MPEG4_I_VOP = $0;
    GST_MPEG4_P_VOP = $1;
    GST_MPEG4_B_VOP = $2;
    GST_MPEG4_S_VOP = $3;
;
{*
 * GstMpeg4ChromaFormat:
 *
 * The chroma format in use as
 * defined in: Table 6-13 -- Meaning of chroma_format
  }
{ Other value are reserved  }
type
  PGstMpeg4ChromaFormat = ^TGstMpeg4ChromaFormat;
  TGstMpeg4ChromaFormat =  Longint;
  Const
    GST_MPEG4_CHROMA_4_2_0 = $01;
;
{*
 * GstMpeg4VideoObjectLayerShape:
 *
 * The different video object layer shapes as defined in:
 * Table 6-16 — Video Object Layer shape type
  }
type
  PGstMpeg4VideoObjectLayerShape = ^TGstMpeg4VideoObjectLayerShape;
  TGstMpeg4VideoObjectLayerShape =  Longint;
  Const
    GST_MPEG4_RECTANGULAR = 0;
    GST_MPEG4_BINARY = 1;
    GST_MPEG4_BINARY_ONLY = 2;
    GST_MPEG4_GRAYSCALE = 3;
;
{*
 * GstMpeg4SpriteEnable:
 *
 * Indicates the usage of static sprite coding
 * or global motion compensation (GMC) as defined in:
 * Table V2 - 2 -- Meaning of sprite_enable codewords
  }
type
  PGstMpeg4SpriteEnable = ^TGstMpeg4SpriteEnable;
  TGstMpeg4SpriteEnable =  Longint;
  Const
    GST_MPEG4_SPRITE_UNUSED = 0;
    GST_MPEG4_SPRITE_STATIC = 1;
    GST_MPEG4_SPRITE_GMG = 2;
;
{*
 * GstMpeg4Profile:
 *
 * Different defined profiles as defined in:
 * 9- Profiles and levels
 *
 * It is computed using:
 * Table G.1 — FLC table for profile_and_level_indication
  }
type
  PGstMpeg4Profile = ^TGstMpeg4Profile;
  TGstMpeg4Profile =  Longint;
  Const
    GST_MPEG4_PROFILE_CORE = 0;
    GST_MPEG4_PROFILE_MAIN = 1;
    GST_MPEG4_PROFILE_N_BIT = 2;
    GST_MPEG4_PROFILE_SIMPLE = 3;
    GST_MPEG4_PROFILE_HYBRID = 4;
    GST_MPEG4_PROFILE_RESERVED = 5;
    GST_MPEG4_PROFILE_SIMPLE_FBA = 6;
    GST_MPEG4_PROFILE_CORE_STUDIO = 7;
    GST_MPEG4_PROFILE_SIMPLE_STUDIO = 8;
    GST_MPEG4_PROFILE_CORE_SCALABLE = 9;
    GST_MPEG4_PROFILE_ADVANCED_CORE = 10;
    GST_MPEG4_PROFILE_ADVANCED_SIMPLE = 11;
    GST_MPEG4_PROFILE_SIMPLE_SCALABLE = 12;
    GST_MPEG4_PROFILE_SCALABLE_TEXTURE = 13;
    GST_MPEG4_PROFILE_SIMPLE_FACE_ANIMATION = 14;
    GST_MPEG4_PROFILE_BASIC_ANIMATED_TEXTURE = 15;
    GST_MPEG4_PROFILE_ADVANCED_REALTIME_SIMPLE = 16;
    GST_MPEG4_PROFILE_ADVANCED_SCALABLE_TEXTURE = 17;
    GST_MPEG4_PROFILE_FINE_GRANULARITY_SCALABLE = 18;
    GST_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY = 19;
;
{*
 * GstMpeg4Level:
 *
 * Different levels as defined in:
 * 9- Profiles and levels
 *
 * It is computed using:
 * Table G.1 — FLC table for profile_and_level_indication
  }
type
  PGstMpeg4Level = ^TGstMpeg4Level;
  TGstMpeg4Level =  Longint;
  Const
    GST_MPEG4_LEVEL0 = 0;
    GST_MPEG4_LEVEL1 = 1;
    GST_MPEG4_LEVEL2 = 2;
    GST_MPEG4_LEVEL3 = 3;
    GST_MPEG4_LEVEL3b = 4;
    GST_MPEG4_LEVEL4 = 5;
    GST_MPEG4_LEVEL5 = 6;
    GST_MPEG4_LEVEL_RESERVED = 7;
;
{*
 * GstMpeg4VisualObjectSequence:
 *
 * The visual object sequence structure as defined in:
 * 6.2.2 Visual Object Sequence and Visual Object
  }
{ Computed according to:
   * Table G.1 — FLC table for profile_and_level_indication  }
type
  PGstMpeg4VisualObjectSequence = ^TGstMpeg4VisualObjectSequence;
  TGstMpeg4VisualObjectSequence = record
      profile_and_level_indication : Tguint8;
      level : TGstMpeg4Level;
      profile : TGstMpeg4Profile;
    end;

{*
 * GstMpeg4VisualObject:
 *
 * The visual object structure as defined in:
 * 6.2.2 Visual Object Sequence and Visual Object
  }
{ If is_identifier  }
  PGstMpeg4VisualObject = ^TGstMpeg4VisualObject;
  TGstMpeg4VisualObject = record
      is_identifier : Tguint8;
      verid : Tguint8;
      priority : Tguint8;
      _type : TGstMpeg4VisualObjectType;
    end;

{*
 * GstMpeg4VideoSignalType:
 *
 * The video signal type structure as defined in:
 * 6.2.2 Visual Object Sequence and Visual Object.
  }
  PGstMpeg4VideoSignalType = ^TGstMpeg4VideoSignalType;
  TGstMpeg4VideoSignalType = record
      _type : Tguint8;
      format : Tguint8;
      range : Tguint8;
      color_description : Tguint8;
      color_primaries : Tguint8;
      transfer_characteristics : Tguint8;
      matrix_coefficients : Tguint8;
    end;

{*
 * GstMpeg4VideoPlaneShortHdr:
 *
 * The video plane short header structure as defined in:
 * 6.2.5.2 Video Plane with Short Header
  }
{  Gob layer specific fields  }
{ Computed
   * If all the values are set to 0, then it is reserved
   * Table 6-25 -- Parameters Defined by source_format Field
    }
{ The size in bits  }
  PGstMpeg4VideoPlaneShortHdr = ^TGstMpeg4VideoPlaneShortHdr;
  TGstMpeg4VideoPlaneShortHdr = record
      temporal_reference : Tguint8;
      split_screen_indicator : Tguint8;
      document_camera_indicator : Tguint8;
      full_picture_freeze_release : Tguint8;
      source_format : Tguint8;
      picture_coding_type : Tguint8;
      vop_quant : Tguint8;
      pei : Tguint8;
      psupp : Tguint8;
      gob_header_empty : Tguint8;
      gob_number : Tguint8;
      gob_frame_id : Tguint8;
      quant_scale : Tguint8;
      vop_width : Tguint16;
      vop_height : Tguint16;
      num_macroblocks_in_gob : Tguint16;
      num_gobs_in_vop : Tguint8;
      size : Tguint;
    end;

{*
 * GstMpeg4VideoObjectLayer:
 *
 * The video object layer structure as defined in:
 * 6.2.3 Video Object Layer
  }
{ if is_object_layer_identifier  }
{ if control_parameters  }
{ if vbv_parameters  }
{ Computed values  }
{ if shape == GST_MPEG4_GRAYSCALE && verid =! 1  }
{ if fixed_vop_rate  }
{ if vol->sprite_enable == SPRITE_GMG or SPRITE_STATIC }
{ if vol->sprite_enable != GST_MPEG4_SPRITE_GMG  }
{ if vol->sprite_enable != GST_MPEG4_SPRITE_GMG  }
{ if shape != GST_MPEG4_RECTANGULAR  }
{ if no_8_bit  }
{ if shape == GRAYSCALE  }
{ if quant_type  }
  PGstMpeg4VideoObjectLayer = ^TGstMpeg4VideoObjectLayer;
  TGstMpeg4VideoObjectLayer = record
      random_accessible_vol : Tguint8;
      video_object_type_indication : Tguint8;
      is_object_layer_identifier : Tguint8;
      verid : Tguint8;
      priority : Tguint8;
      aspect_ratio_info : TGstMpeg4AspectRatioInfo;
      par_width : Tguint8;
      par_height : Tguint8;
      control_parameters : Tguint8;
      chroma_format : TGstMpeg4ChromaFormat;
      low_delay : Tguint8;
      vbv_parameters : Tguint8;
      first_half_bitrate : Tguint16;
      latter_half_bitrate : Tguint16;
      first_half_vbv_buffer_size : Tguint16;
      latter_half_vbv_buffer_size : Tguint16;
      first_half_vbv_occupancy : Tguint16;
      latter_half_vbv_occupancy : Tguint16;
      bit_rate : Tguint32;
      vbv_buffer_size : Tguint32;
      shape : TGstMpeg4VideoObjectLayerShape;
      shape_extension : Tguint8;
      vop_time_increment_resolution : Tguint16;
      vop_time_increment_bits : Tguint8;
      fixed_vop_rate : Tguint8;
      fixed_vop_time_increment : Tguint16;
      width : Tguint16;
      height : Tguint16;
      interlaced : Tguint8;
      obmc_disable : Tguint8;
      sprite_enable : TGstMpeg4SpriteEnable;
      sprite_width : Tguint16;
      sprite_height : Tguint16;
      sprite_left_coordinate : Tguint16;
      sprite_top_coordinate : Tguint16;
      no_of_sprite_warping_points : Tguint8;
      sprite_warping_accuracy : Tguint8;
      sprite_brightness_change : Tguint8;
      low_latency_sprite_enable : Tguint8;
      sadct_disable : Tguint8;
      not_8_bit : Tguint8;
      quant_precision : Tguint8;
      bits_per_pixel : Tguint8;
      no_gray_quant_update : Tguint8;
      composition_method : Tguint8;
      linear_composition : Tguint8;
      quant_type : Tguint8;
      load_intra_quant_mat : Tguint8;
      intra_quant_mat : array[0..63] of Tguint8;
      load_non_intra_quant_mat : Tguint8;
      non_intra_quant_mat : array[0..63] of Tguint8;
      quarter_sample : Tguint8;
      complexity_estimation_disable : Tguint8;
      resync_marker_disable : Tguint8;
      data_partitioned : Tguint8;
      reversible_vlc : Tguint8;
      newpred_enable : Tguint8;
      reduced_resolution_vop_enable : Tguint8;
      scalability : Tguint8;
      enhancement_type : Tguint8;
      short_hdr : TGstMpeg4VideoPlaneShortHdr;
    end;

{*
 * GstMpeg4SpriteTrajectory:
 *
 * The sprite trajectory structure as defined in:
 * 7.8.4 Sprite reference point decoding and
 * 6.2.5.4 Sprite coding
  }
{ Defined as "du" in 6.2.5.4  }
{ Defined as "dv" in 6.2.5.4  }
  PGstMpeg4SpriteTrajectory = ^TGstMpeg4SpriteTrajectory;
  TGstMpeg4SpriteTrajectory = record
      vop_ref_points : array[0..62] of Tguint16;
      sprite_ref_points : array[0..62] of Tguint16;
    end;

{*
 * GstMpeg4GroupOfVOP:
 *
 * The group of video object plane structure as defined in:
 * 6.2.4 Group of Video Object Plane
  }
  PGstMpeg4GroupOfVOP = ^TGstMpeg4GroupOfVOP;
  TGstMpeg4GroupOfVOP = record
      hours : Tguint8;
      minutes : Tguint8;
      seconds : Tguint8;
      closed : Tguint8;
      broken_link : Tguint8;
    end;

{*
 * GstMpeg4VideoObjectPlane:
 *
 * The Video object plane structure as defined in:
 * 6.2.5 Video Object Plane and Video Plane with Short Header
  }
{ if newpred_enable  }
{if vol->shape != GST_MPEG4_RECTANGULAR  }
{ Computed macroblock information  }
{ The size of the header  }
  PGstMpeg4VideoObjectPlane = ^TGstMpeg4VideoObjectPlane;
  TGstMpeg4VideoObjectPlane = record
      coding_type : TGstMpeg4VideoObjectCodingType;
      modulo_time_base : Tguint8;
      time_increment : Tguint16;
      coded : Tguint8;
      id : Tguint16;
      id_for_prediction_indication : Tguint8;
      id_for_prediction : Tguint16;
      width : Tguint16;
      height : Tguint16;
      horizontal_mc_spatial_ref : Tguint16;
      vertical_mc_spatial_ref : Tguint16;
      rounding_type : Tguint8;
      background_composition : Tguint8;
      change_conv_ratio_disable : Tguint8;
      constant_alpha : Tguint8;
      constant_alpha_value : Tguint8;
      reduced_resolution : Tguint8;
      intra_dc_vlc_thr : Tguint8;
      top_field_first : Tguint8;
      alternate_vertical_scan_flag : Tguint8;
      quant : Tguint16;
      fcode_forward : Tguint8;
      fcode_backward : Tguint8;
      shape_coding_type : Tguint8;
      load_backward_shape : Tguint8;
      ref_select_code : Tguint8;
      mb_height : Tguint16;
      mb_width : Tguint16;
      mb_num : Tguint;
      size : Tguint;
    end;

{*
 * GstMpeg4VideoPacketHdr:
 * @size: Size of the header in bit.
 *
 * The video packet header structure as defined in:
 * 6.2.5.2 Video Plane with Short Header
  }
  PGstMpeg4VideoPacketHdr = ^TGstMpeg4VideoPacketHdr;
  TGstMpeg4VideoPacketHdr = record
      header_extension_code : Tguint8;
      macroblock_number : Tguint16;
      quant_scale : Tguint16;
      size : Tguint;
    end;

{*
 * GstMpeg4Packet:
 * @type: the type of the packet that start at @offset
 * @data: the data containing packet starting at @offset
 * @offset: offset of the start of the packet (without the 3 bytes startcode), but
 * including the #GstMpeg4StartCode byte.
 * @size: The size in bytes of the packet or %G_MAXUINT if the end wasn't found.
 * @marker_size: The size in bit of the resync marker.
 *
 * A structure that contains the type of a packet, its offset and its size
  }
  PGstMpeg4Packet = ^TGstMpeg4Packet;
  TGstMpeg4Packet = record
      data : Pguint8;
      offset : Tguint;
      size : Tgsize;
      marker_size : Tguint;
      _type : TGstMpeg4StartCode;
    end;


function gst_h263_parse(packet:PGstMpeg4Packet; data:Pguint8; offset:Tguint; size:Tgsize):TGstMpeg4ParseResult;cdecl;external libgstcodecparsers;
function gst_mpeg4_parse(packet:PGstMpeg4Packet; skip_user_data:Tgboolean; vop:PGstMpeg4VideoObjectPlane; data:Pguint8; offset:Tguint; 
           size:Tgsize):TGstMpeg4ParseResult;cdecl;external libgstcodecparsers;
function gst_mpeg4_parse_video_object_plane(vop:PGstMpeg4VideoObjectPlane; sprite_trajectory:PGstMpeg4SpriteTrajectory; vol:PGstMpeg4VideoObjectLayer; data:Pguint8; size:Tgsize):TGstMpeg4ParseResult;cdecl;external libgstcodecparsers;
function gst_mpeg4_parse_group_of_vop(gov:PGstMpeg4GroupOfVOP; data:Pguint8; size:Tgsize):TGstMpeg4ParseResult;cdecl;external libgstcodecparsers;
function gst_mpeg4_parse_video_object_layer(vol:PGstMpeg4VideoObjectLayer; vo:PGstMpeg4VisualObject; data:Pguint8; size:Tgsize):TGstMpeg4ParseResult;cdecl;external libgstcodecparsers;
function gst_mpeg4_parse_visual_object(vo:PGstMpeg4VisualObject; signal_type:PGstMpeg4VideoSignalType; data:Pguint8; size:Tgsize):TGstMpeg4ParseResult;cdecl;external libgstcodecparsers;
function gst_mpeg4_parse_visual_object_sequence(vos:PGstMpeg4VisualObjectSequence; data:Pguint8; size:Tgsize):TGstMpeg4ParseResult;cdecl;external libgstcodecparsers;
function gst_mpeg4_parse_video_plane_short_header(shorthdr:PGstMpeg4VideoPlaneShortHdr; data:Pguint8; size:Tgsize):TGstMpeg4ParseResult;cdecl;external libgstcodecparsers;
function gst_mpeg4_parse_video_packet_header(videopackethdr:PGstMpeg4VideoPacketHdr; vol:PGstMpeg4VideoObjectLayer; vop:PGstMpeg4VideoObjectPlane; sprite_trajectory:PGstMpeg4SpriteTrajectory; data:Pguint8; 
           size:Tgsize):TGstMpeg4ParseResult;cdecl;external libgstcodecparsers;
{$endif}
{ __GST_MPEG4UTIL_H__  }

// === Konventiert am: 21-7-26 17:01:28 ===


implementation



end.
