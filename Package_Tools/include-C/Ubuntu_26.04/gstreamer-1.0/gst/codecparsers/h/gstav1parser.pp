
unit gstav1parser;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstav1parser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstav1parser.h
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
PGstAV1CDEFParams  = ^GstAV1CDEFParams;
PGstAV1ChromaSamplePositions  = ^GstAV1ChromaSamplePositions;
PGstAV1ColorConfig  = ^GstAV1ColorConfig;
PGstAV1ColorPrimaries  = ^GstAV1ColorPrimaries;
PGstAV1DecoderModelInfo  = ^GstAV1DecoderModelInfo;
PGstAV1FilmGrainParams  = ^GstAV1FilmGrainParams;
PGstAV1FrameHeaderOBU  = ^GstAV1FrameHeaderOBU;
PGstAV1FrameOBU  = ^GstAV1FrameOBU;
PGstAV1FrameRestorationType  = ^GstAV1FrameRestorationType;
PGstAV1FrameType  = ^GstAV1FrameType;
PGstAV1GlobalMotionParams  = ^GstAV1GlobalMotionParams;
PGstAV1InterpolationFilter  = ^GstAV1InterpolationFilter;
PGstAV1LoopFilterParams  = ^GstAV1LoopFilterParams;
PGstAV1LoopRestorationParams  = ^GstAV1LoopRestorationParams;
PGstAV1MatrixCoefficients  = ^GstAV1MatrixCoefficients;
PGstAV1MetadataHdrCll  = ^GstAV1MetadataHdrCll;
PGstAV1MetadataHdrMdcv  = ^GstAV1MetadataHdrMdcv;
PGstAV1MetadataITUT_T35  = ^GstAV1MetadataITUT_T35;
PGstAV1MetadataOBU  = ^GstAV1MetadataOBU;
PGstAV1MetadataScalability  = ^GstAV1MetadataScalability;
PGstAV1MetadataTimecode  = ^GstAV1MetadataTimecode;
PGstAV1MetadataType  = ^GstAV1MetadataType;
PGstAV1OBU  = ^GstAV1OBU;
PGstAV1OBUHeader  = ^GstAV1OBUHeader;
PGstAV1OBUType  = ^GstAV1OBUType;
PGstAV1OperatingPoint  = ^GstAV1OperatingPoint;
PGstAV1Parser  = ^GstAV1Parser;
PGstAV1ParserResult  = ^GstAV1ParserResult;
PGstAV1ParserState  = ^GstAV1ParserState;
PGstAV1Profile  = ^GstAV1Profile;
PGstAV1QuantizationParams  = ^GstAV1QuantizationParams;
PGstAV1ReferenceFrame  = ^GstAV1ReferenceFrame;
PGstAV1ReferenceFrameInfo  = ^GstAV1ReferenceFrameInfo;
PGstAV1ReferenceFrameInfoEntry  = ^GstAV1ReferenceFrameInfoEntry;
PGstAV1ScalabilityModes  = ^GstAV1ScalabilityModes;
PGstAV1SegmentationParams  = ^GstAV1SegmentationParams;
PGstAV1SeqLevels  = ^GstAV1SeqLevels;
PGstAV1SequenceHeaderOBU  = ^GstAV1SequenceHeaderOBU;
PGstAV1TileGroupOBU  = ^GstAV1TileGroupOBU;
PGstAV1TileGroupOBUEntry  = ^GstAV1TileGroupOBUEntry;
PGstAV1TileInfo  = ^GstAV1TileInfo;
PGstAV1TileListOBU  = ^GstAV1TileListOBU;
PGstAV1TileListOBUEntry  = ^GstAV1TileListOBUEntry;
PGstAV1TimingInfo  = ^GstAV1TimingInfo;
PGstAV1TransferCharacteristics  = ^GstAV1TransferCharacteristics;
PGstAV1TXModes  = ^GstAV1TXModes;
PGstAV1WarpModelType  = ^GstAV1WarpModelType;
Pguint32  = ^guint32;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * gstav1parser.h
 *
 *  Copyright (C) 2018 Georg Ottinger
 *  Copyright (C) 2019-2020 Intel Corporation
 *    Author: Georg Ottinger<g.ottinger@gmx.at>
 *    Author: Junyan He<junyan.he@hotmail.com>
 *    Author: Victor Jaquez <vjaquez@igalia.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_AV1_PARSER_H__}
{$define __GST_AV1_PARSER_H__}
{$include <gst/gst.h>}
{$include <gst/codecparsers/codecparsers-prelude.h>}

const
  GST_AV1_MAX_NUM_TEMPORAL_LAYERS = 8;  
  GST_AV1_MAX_NUM_SPATIAL_LAYERS = 4;  
  GST_AV1_MAX_TILE_WIDTH = 4096;  
  GST_AV1_MAX_TILE_AREA = 4096*2304;  
  GST_AV1_TOTAL_REFS_PER_FRAME = 8;  
  GST_AV1_MAX_SEGMENTS = 8;  
  GST_AV1_SEG_LVL_MAX = 8;  
  GST_AV1_MAX_TILE_COLS = 64;  
  GST_AV1_MAX_TILE_ROWS = 64;  
  GST_AV1_REFS_PER_FRAME = 7;  
  GST_AV1_PRIMARY_REF_NONE = 7;  
  GST_AV1_SUPERRES_NUM = 8;  
  GST_AV1_SUPERRES_DENOM_MIN = 9;  
  GST_AV1_SUPERRES_DENOM_BITS = 3;  
  GST_AV1_MAX_LOOP_FILTER = 63;  
  GST_AV1_GM_ABS_TRANS_BITS = 12;  
  GST_AV1_GM_ABS_TRANS_ONLY_BITS = 9;  
  GST_AV1_GM_ABS_ALPHA_BITS = 12;  
  GST_AV1_GM_ALPHA_PREC_BITS = 15;  
  GST_AV1_GM_TRANS_PREC_BITS = 6;  
  GST_AV1_GM_TRANS_ONLY_PREC_BITS = 3;  
  GST_AV1_WARPEDMODEL_PREC_BITS = 16;  
  GST_AV1_WARP_PARAM_REDUCE_BITS = 6;  
  GST_AV1_SELECT_SCREEN_CONTENT_TOOLS = 2;  
  GST_AV1_SELECT_INTEGER_MV = 2;  
  GST_AV1_RESTORATION_TILESIZE_MAX = 256;  
  GST_AV1_SEG_LVL_ALT_Q = 0;  
  GST_AV1_SEG_LVL_REF_FRAME = 5;  
{ Following defines are derived from the spec, but not mentioned by
 * this particular name in the spec  }
  GST_AV1_CDEF_MAX = 1 shl 3;  
  GST_AV1_MAX_TILE_COUNT = 512;  
{xxxxx #define GST_AV1_MAX_OPERATING_POINTS    GST_AV1_MAX_NUM_TEMPORAL_LAYERS * GST_AV1_MAX_NUM_SPATIAL_LAYERS) }
  GST_AV1_MAX_TEMPORAL_GROUP_SIZE = 255;  
  GST_AV1_MAX_TEMPORAL_GROUP_REFERENCES = 7;  
  GST_AV1_MAX_NUM_Y_POINTS = 16;  
  GST_AV1_MAX_NUM_CB_POINTS = 16;  
  GST_AV1_MAX_NUM_CR_POINTS = 16;  
  GST_AV1_MAX_NUM_POS_LUMA = 25;  
  GST_AV1_MAX_NUM_PLANES = 3;  
  GST_AV1_DIV_LUT_PREC_BITS = 14;  
  GST_AV1_DIV_LUT_BITS = 8;  
  GST_AV1_DIV_LUT_NUM = 1 shl GST_AV1_DIV_LUT_BITS;  
type
{*
 * GstAV1SegmenationParams:
 *
 * Deprecated: 1.28: Use GstAV1SegmentationParams.
  }
{$ifndef GST_DISABLE_DEPRECATED}

const
  GstAV1SegmenationParams = GstAV1SegmentationParams;  
{$endif}
type
{*
 * GstAV1ParserResult:
 * @GST_AV1_PARSER_OK: successful return
 * @GST_AV1_PARSER_NO_MORE_DATA: the parser needs more data for one OBU
 * @GST_AV1_PARSER_DROP: no need to handle this OBU, skip it
 * @GST_AV1_PARSER_BITSTREAM_ERROR: stream error, for example, include invalid bits
 * @GST_AV1_PARSER_MISSING_OBU_REFERENCE: no reference, for example, no sequence found
 * @GST_AV1_PARSER_INVALID_OPERATION: something like invalid parameters
 *
 * Defines the result of parser process
  }

  PGstAV1ParserResult = ^TGstAV1ParserResult;
  TGstAV1ParserResult =  Longint;
  Const
    GST_AV1_PARSER_OK = 0;
    GST_AV1_PARSER_NO_MORE_DATA = 1;
    GST_AV1_PARSER_DROP = 2;
    GST_AV1_PARSER_BITSTREAM_ERROR = 3;
    GST_AV1_PARSER_MISSING_OBU_REFERENCE = 4;
    GST_AV1_PARSER_INVALID_OPERATION = 5;
;
{*
 * GstAV1Profile:
 * @GST_AV1_PROFILE_0: 8-bit and 10-bit 4:2:0 and 4:0:0 only.
 * @GST_AV1_PROFILE_1: 8-bit and 10-bit 4:4:4.
 * @GST_AV1_PROFILE_2: 8-bit and 10-bit 4:2:2, 12-bit 4:0:0 4:2:2 and 4:4:4
 * @GST_AV1_PROFILE_UNDEFINED: unknow AV1 profile (Since: 1.20)
 *
 * Defines the AV1 profiles
  }
{*
 * GST_AV1_PROFILE_UNDEFINED:
 *
 * unknow AV1 profile
 *
 * Since: 1.20
  }
type
  PGstAV1Profile = ^TGstAV1Profile;
  TGstAV1Profile =  Longint;
  Const
    GST_AV1_PROFILE_0 = 0;
    GST_AV1_PROFILE_1 = 1;
    GST_AV1_PROFILE_2 = 2;
    GST_AV1_PROFILE_UNDEFINED = 3;
;
{*
 * GstAV1OBUType:
 * @GST_AV1_OBU_RESERVED_0: Reserved 0
 * @GST_AV1_OBU_SEQUENCE_HEADER: Sequence Header OBU
 * @GST_AV1_OBU_TEMPORAL_DELIMITER: Temporal Delimiter OBU
 * @GST_AV1_OBU_FRAME_HEADER: Frame Header OBU
 * @GST_AV1_OBU_TILE_GROUP: Tile Group OBU
 * @GST_AV1_OBU_METADATA: Metadata OBU
 * @GST_AV1_OBU_FRAME: Frame OBU (includes Frame Header and one Tile Group)
 * @GST_AV1_OBU_REDUNDANT_FRAME_HEADER: Redundant Frame Header OBU
 * @GST_AV1_OBU_TILE_LIST: Tile LIst OBU
 * @GST_AV1_OBU_RESERVED_9: Reserved 9
 * @GST_AV1_OBU_RESERVED_10: Reserved 10
 * @GST_AV1_OBU_RESERVED_11: Reserved 11
 * @GST_AV1_OBU_RESERVED_12: Reserved 12
 * @GST_AV1_OBU_RESERVED_13: Reserved 13
 * @GST_AV1_OBU_RESERVED_14: Reserved 14
 * @GST_AV1_OBU_PADDING: Padding
 *
 * Defines all the possible OBU types
  }
type
  PGstAV1OBUType = ^TGstAV1OBUType;
  TGstAV1OBUType =  Longint;
  Const
    GST_AV1_OBU_RESERVED_0 = 0;
    GST_AV1_OBU_SEQUENCE_HEADER = 1;
    GST_AV1_OBU_TEMPORAL_DELIMITER = 2;
    GST_AV1_OBU_FRAME_HEADER = 3;
    GST_AV1_OBU_TILE_GROUP = 4;
    GST_AV1_OBU_METADATA = 5;
    GST_AV1_OBU_FRAME = 6;
    GST_AV1_OBU_REDUNDANT_FRAME_HEADER = 7;
    GST_AV1_OBU_TILE_LIST = 8;
    GST_AV1_OBU_RESERVED_9 = 9;
    GST_AV1_OBU_RESERVED_10 = 10;
    GST_AV1_OBU_RESERVED_11 = 11;
    GST_AV1_OBU_RESERVED_12 = 12;
    GST_AV1_OBU_RESERVED_13 = 13;
    GST_AV1_OBU_RESERVED_14 = 14;
    GST_AV1_OBU_PADDING = 15;
;
{*
 * GstAV1SeqLevels:
 * @GST_AV1_SEQ_LEVEL_2_0: Level 2.0
 * @GST_AV1_SEQ_LEVEL_2_1: Level 2.1
 * @GST_AV1_SEQ_LEVEL_2_2: Level 2.2
 * @GST_AV1_SEQ_LEVEL_2_3: Level 2.3
 * @GST_AV1_SEQ_LEVEL_3_0: Level 3.0
 * @GST_AV1_SEQ_LEVEL_3_1: Level 3.1
 * @GST_AV1_SEQ_LEVEL_3_2: Level 3.2
 * @GST_AV1_SEQ_LEVEL_3_3: Level 3.3
 * @GST_AV1_SEQ_LEVEL_4_0: Level 4.0
 * @GST_AV1_SEQ_LEVEL_4_1: Level 4.1
 * @GST_AV1_SEQ_LEVEL_4_2: Level 4.2
 * @GST_AV1_SEQ_LEVEL_4_3: Level 4.3
 * @GST_AV1_SEQ_LEVEL_5_0: Level 5.0
 * @GST_AV1_SEQ_LEVEL_5_1: Level 5.1
 * @GST_AV1_SEQ_LEVEL_5_2: Level 5.2
 * @GST_AV1_SEQ_LEVEL_5_3: Level 5.3
 * @GST_AV1_SEQ_LEVEL_6_0: Level 6.0
 * @GST_AV1_SEQ_LEVEL_6_1: Level 6.1
 * @GST_AV1_SEQ_LEVEL_6_2: Level 6.2
 * @GST_AV1_SEQ_LEVEL_6_3: Level 6.3
 * @GST_AV1_SEQ_LEVEL_7_0: Level 7.0
 * @GST_AV1_SEQ_LEVEL_7_1: Level 7.1
 * @GST_AV1_SEQ_LEVEL_7_2: Level 7.2
 * @GST_AV1_SEQ_LEVEL_7_3: Level 7.3
 * @GST_AV1_SEQ_LEVELS: all valid levels
 * @GST_AV1_SEQ_LEVEL_MAX: Maximum parameters
 *
 * Defines all the possible OBU types
  }
type
  PGstAV1SeqLevels = ^TGstAV1SeqLevels;
  TGstAV1SeqLevels =  Longint;
  Const
    GST_AV1_SEQ_LEVEL_2_0 = 0;
    GST_AV1_SEQ_LEVEL_2_1 = 1;
    GST_AV1_SEQ_LEVEL_2_2 = 2;
    GST_AV1_SEQ_LEVEL_2_3 = 3;
    GST_AV1_SEQ_LEVEL_3_0 = 4;
    GST_AV1_SEQ_LEVEL_3_1 = 5;
    GST_AV1_SEQ_LEVEL_3_2 = 6;
    GST_AV1_SEQ_LEVEL_3_3 = 7;
    GST_AV1_SEQ_LEVEL_4_0 = 8;
    GST_AV1_SEQ_LEVEL_4_1 = 9;
    GST_AV1_SEQ_LEVEL_4_2 = 10;
    GST_AV1_SEQ_LEVEL_4_3 = 11;
    GST_AV1_SEQ_LEVEL_5_0 = 12;
    GST_AV1_SEQ_LEVEL_5_1 = 13;
    GST_AV1_SEQ_LEVEL_5_2 = 14;
    GST_AV1_SEQ_LEVEL_5_3 = 15;
    GST_AV1_SEQ_LEVEL_6_0 = 16;
    GST_AV1_SEQ_LEVEL_6_1 = 17;
    GST_AV1_SEQ_LEVEL_6_2 = 18;
    GST_AV1_SEQ_LEVEL_6_3 = 19;
    GST_AV1_SEQ_LEVEL_7_0 = 20;
    GST_AV1_SEQ_LEVEL_7_1 = 21;
    GST_AV1_SEQ_LEVEL_7_2 = 22;
    GST_AV1_SEQ_LEVEL_7_3 = 23;
    GST_AV1_SEQ_LEVELS = 24;
    GST_AV1_SEQ_LEVEL_MAX = 31;
;
{*
 * GstAV1MetadataType:
 * @GST_AV1_METADATA_TYPE_RESERVED_0: Reserved 0
 * @GST_AV1_METADATA_TYPE_HDR_CLL: Metadata high dynamic range content
 *   light level semantics
 * @GST_AV1_METADATA_TYPE_HDR_MDCV: Metadata high dynamic range mastering
 *   display color volume semantics
 * @GST_AV1_METADATA_TYPE_SCALABILITY: Metadata scalability semantics
 * @GST_AV1_METADATA_TYPE_ITUT_T35: Metadata ITUT T35 semantics
 * @GST_AV1_METADATA_TYPE_TIMECODE: Timecode semantics
  }
type
  PGstAV1MetadataType = ^TGstAV1MetadataType;
  TGstAV1MetadataType =  Longint;
  Const
    GST_AV1_METADATA_TYPE_RESERVED_0 = 0;
    GST_AV1_METADATA_TYPE_HDR_CLL = 1;
    GST_AV1_METADATA_TYPE_HDR_MDCV = 2;
    GST_AV1_METADATA_TYPE_SCALABILITY = 3;
    GST_AV1_METADATA_TYPE_ITUT_T35 = 4;
    GST_AV1_METADATA_TYPE_TIMECODE = 5;
;
{*
 * GstAV1ScalabilityModes:
 * @GST_AV1_SCALABILITY_L1T2: 1 spatial layer, 2 temporal layers
 * @GST_AV1_SCALABILITY_L1T3: 1 spatial layer, 3 temporal layers
 * @GST_AV1_SCALABILITY_L2T1: 2 spatial layer (ratio 2:1), 1 temporal layer,
 *  inter-layer dependency
 * @GST_AV1_SCALABILITY_L2T2: 2 spatial layer (ratio 2:1), 2 temporal layer,
 *  inter-layer dependency
 * @GST_AV1_SCALABILITY_L2T3: 2 spatial layer (ratio 2:1), 3 temporal layer,
 *  inter-layer dependency
 * @GST_AV1_SCALABILITY_S2T1: 2 spatial layer (ratio 2:1), 1 temporal layer
 * @GST_AV1_SCALABILITY_S2T2: 2 spatial layer (ratio 2:1), 2 temporal layer
 * @GST_AV1_SCALABILITY_S2T3: 2 spatial layer (ratio 2:1), 3 temporal layer
 * @GST_AV1_SCALABILITY_L2T1h: 2 spatial layer (ratio 1.5:1), 1 temporal layer,
 *  inter-layer dependency
 * @GST_AV1_SCALABILITY_L2T2h: 2 spatial layer (ratio 1.5:1), 2 temporal layer,
 *  inter-layer dependency
 * @GST_AV1_SCALABILITY_L2T3h: 2 spatial layer (ratio 1.5:1), 3 temporal layer,
 *  inter-layer dependency
 * @GST_AV1_SCALABILITY_S2T1h: 2 spatial layer (ratio 1.5:1), 1 temporal layer
 * @GST_AV1_SCALABILITY_S2T2h: 2 spatial layer (ratio 1.5:1), 2 temporal layer
 * @GST_AV1_SCALABILITY_S2T3h: 2 spatial layer (ratio 1.5:1), 3 temporal layer
 * @GST_AV1_SCALABILITY_SS: Use scalability structure #GstAV1MetadataScalability
  }
type
  PGstAV1ScalabilityModes = ^TGstAV1ScalabilityModes;
  TGstAV1ScalabilityModes =  Longint;
  Const
    GST_AV1_SCALABILITY_L1T2 = 0;
    GST_AV1_SCALABILITY_L1T3 = 1;
    GST_AV1_SCALABILITY_L2T1 = 2;
    GST_AV1_SCALABILITY_L2T2 = 3;
    GST_AV1_SCALABILITY_L2T3 = 4;
    GST_AV1_SCALABILITY_S2T1 = 5;
    GST_AV1_SCALABILITY_S2T2 = 6;
    GST_AV1_SCALABILITY_S2T3 = 7;
    GST_AV1_SCALABILITY_L2T1h = 8;
    GST_AV1_SCALABILITY_L2T2h = 9;
    GST_AV1_SCALABILITY_L2T3h = 10;
    GST_AV1_SCALABILITY_S2T1h = 11;
    GST_AV1_SCALABILITY_S2T2h = 12;
    GST_AV1_SCALABILITY_S2T3h = 13;
    GST_AV1_SCALABILITY_SS = 14;
;
{*
 * GstAV1ColorPrimaries:
 * @GST_AV1_CP_BT_709: BT.709
 * @GST_AV1_CP_UNSPECIFIED: Unspecified
 * @GST_AV1_CP_BT_470_M: BT.470 System M (historical)
 * @GST_AV1_CP_BT_470_B_G:BT.470 System B, G (historical),
 * @GST_AV1_CP_BT_601: BT.601
 * @GST_AV1_CP_SMPTE_240: SMPTE 240
 * @GST_AV1_CP_GENERIC_FILM: Generic film (color filters using illuminant C,
 * @GST_AV1_CP_BT_2020: BT.2020, BT.2100,
 * @GST_AV1_CP_XYZ: SMPTE 428 (CIE 1921 XYZ),
 * @GST_AV1_CP_SMPTE_431: SMPTE RP 431-2
 * @GST_AV1_CP_SMPTE_432: SMPTE EG 432-1
 * @GST_AV1_CP_EBU_3213: EBU Tech. 3213-E
  }
type
  PGstAV1ColorPrimaries = ^TGstAV1ColorPrimaries;
  TGstAV1ColorPrimaries =  Longint;
  Const
    GST_AV1_CP_BT_709 = 1;
    GST_AV1_CP_UNSPECIFIED = 2;
    GST_AV1_CP_BT_470_M = 4;
    GST_AV1_CP_BT_470_B_G = 5;
    GST_AV1_CP_BT_601 = 6;
    GST_AV1_CP_SMPTE_240 = 7;
    GST_AV1_CP_GENERIC_FILM = 8;
    GST_AV1_CP_BT_2020 = 9;
    GST_AV1_CP_XYZ = 10;
    GST_AV1_CP_SMPTE_431 = 11;
    GST_AV1_CP_SMPTE_432 = 12;
    GST_AV1_CP_EBU_3213 = 22;
;
{*
 * GstAV1TransferCharacteristics:
 * @GST_AV1_TC_RESERVED_0: For future use
 * @GST_AV1_TC_BT_709: BT.709
 * @GST_AV1_TC_UNSPECIFIED: Unspecified
 * @GST_AV1_TC_RESERVED_3: For future use
 * @GST_AV1_TC_BT_470_M: BT.470 System M (historical)
 * @GST_AV1_TC_BT_470_B_G: BT.470 System B, G (historical)
 * @GST_AV1_TC_BT_601: BT.601
 * @GST_AV1_TC_SMPTE_240: SMPTE 240 M
 * @GST_AV1_TC_LINEAR: Linear
 * @GST_AV1_TC_LOG_100: Logarithmic (100 : 1 range)
 * @GST_AV1_TC_LOG_100_SQRT10: Logarithmic (100 * Sqrt(10) : 1 range)
 * @GST_AV1_TC_IEC_61966: IEC 61966-2-4
 * @GST_AV1_TC_BT_1361: BT.1361
 * @GST_AV1_TC_SRGB: sRGB or sYCC
 * @GST_AV1_TC_BT_2020_10_BIT: BT.2020 10-bit systems
 * @GST_AV1_TC_BT_2020_12_BIT: BT.2020 12-bit systems
 * @GST_AV1_TC_SMPTE_2084: SMPTE ST 2084, ITU BT.2100 PQ
 * @GST_AV1_TC_SMPTE_428: SMPTE ST 428
 * @GST_AV1_TC_HLG: BT.2100 HLG, ARIB STD-B67
  }
type
  PGstAV1TransferCharacteristics = ^TGstAV1TransferCharacteristics;
  TGstAV1TransferCharacteristics =  Longint;
  Const
    GST_AV1_TC_RESERVED_0 = 0;
    GST_AV1_TC_BT_709 = 1;
    GST_AV1_TC_UNSPECIFIED = 2;
    GST_AV1_TC_RESERVED_3 = 3;
    GST_AV1_TC_BT_470_M = 4;
    GST_AV1_TC_BT_470_B_G = 5;
    GST_AV1_TC_BT_601 = 6;
    GST_AV1_TC_SMPTE_240 = 7;
    GST_AV1_TC_LINEAR = 8;
    GST_AV1_TC_LOG_100 = 9;
    GST_AV1_TC_LOG_100_SQRT10 = 10;
    GST_AV1_TC_IEC_61966 = 11;
    GST_AV1_TC_BT_1361 = 12;
    GST_AV1_TC_SRGB = 13;
    GST_AV1_TC_BT_2020_10_BIT = 14;
    GST_AV1_TC_BT_2020_12_BIT = 15;
    GST_AV1_TC_SMPTE_2084 = 16;
    GST_AV1_TC_SMPTE_428 = 17;
    GST_AV1_TC_HLG = 18;
;
{*
 * GstAV1MatrixCoefficients:
 * @GST_AV1_MC_IDENTITY: Identity matrix
 * @GST_AV1_MC_BT_709: BT.709
 * @GST_AV1_MC_UNSPECIFIED: Unspecified
 * @GST_AV1_MC_RESERVED_3: For future use
 * @GST_AV1_MC_FCC: US FCC 73.628
 * @GST_AV1_MC_BT_470_B_G: BT.470 System B, G (historical)
 * @GST_AV1_MC_BT_601: BT.601
 * @GST_AV1_MC_SMPTE_240: SMPTE 240 M
 * @GST_AV1_MC_SMPTE_YCGCO: YCgCo
 * @GST_AV1_MC_BT_2020_NCL: BT.2020 non-constant luminance, BT.2100 YCbCr
 * @GST_AV1_MC_BT_2020_CL: BT.2020 constant luminance
 * @GST_AV1_MC_SMPTE_2085: SMPTE ST 2085 YDzDx
 * @GST_AV1_MC_CHROMAT_NCL: Chromaticity-derived non-constant luminance
 * @GST_AV1_MC_CHROMAT_CL: Chromaticity-derived constant luminancw
 * @GST_AV1_MC_ICTCP: BT.2100 ICtCp
  }
type
  PGstAV1MatrixCoefficients = ^TGstAV1MatrixCoefficients;
  TGstAV1MatrixCoefficients =  Longint;
  Const
    GST_AV1_MC_IDENTITY = 0;
    GST_AV1_MC_BT_709 = 1;
    GST_AV1_MC_UNSPECIFIED = 2;
    GST_AV1_MC_RESERVED_3 = 3;
    GST_AV1_MC_FCC = 4;
    GST_AV1_MC_BT_470_B_G = 5;
    GST_AV1_MC_BT_601 = 6;
    GST_AV1_MC_SMPTE_240 = 7;
    GST_AV1_MC_SMPTE_YCGCO = 8;
    GST_AV1_MC_BT_2020_NCL = 9;
    GST_AV1_MC_BT_2020_CL = 10;
    GST_AV1_MC_SMPTE_2085 = 11;
    GST_AV1_MC_CHROMAT_NCL = 12;
    GST_AV1_MC_CHROMAT_CL = 13;
    GST_AV1_MC_ICTCP = 14;
;
{*
 * GstAV1ChromaSamplePositions:
 * @GST_AV1_CSP_UNKNOWN: Unknown (in this case the source video transfer
 *  function must be signaled outside the AV1 bitstream).
 * @GST_AV1_CSP_VERTICAL: Horizontally co-located with (0, 0) luma sample,
 *  vertical position in the middle between two luma samples.
 * @GST_AV1_CSP_COLOCATED: co-located with (0, 0) luma sample.
 * @GST_AV1_CSP_RESERVED: For future use.
  }
type
  PGstAV1ChromaSamplePositions = ^TGstAV1ChromaSamplePositions;
  TGstAV1ChromaSamplePositions =  Longint;
  Const
    GST_AV1_CSP_UNKNOWN = 0;
    GST_AV1_CSP_VERTICAL = 1;
    GST_AV1_CSP_COLOCATED = 2;
    GST_AV1_CSP_RESERVED = 3;
;
{*
 * GstAV1FrameType:
 * @GST_AV1_KEY_FRAME: Key Frame
 * @GST_AV1_INTER_FRAME: InterFrame
 * @GST_AV1_INTRA_ONLY_FRAME: Intra-Only Frame
 * @GST_AV1_SWITCH_FRAME: Switch Frame
  }
type
  PGstAV1FrameType = ^TGstAV1FrameType;
  TGstAV1FrameType =  Longint;
  Const
    GST_AV1_KEY_FRAME = 0;
    GST_AV1_INTER_FRAME = 1;
    GST_AV1_INTRA_ONLY_FRAME = 2;
    GST_AV1_SWITCH_FRAME = 3;
;
{*
 * GstAV1InterpolationFilter:
 * @GST_AV1_INTERPOLATION_FILTER_EIGHTTAP: Eighttap
 * @GST_AV1_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH: Eighttap Smooth
 * @GST_AV1_INTERPOLATION_FILTER_EIGHTTAP_SHARP: Eighttap Sharp
 * @GST_AV1_INTERPOLATION_FILTER_BILINEAR: Bilinear
 * @GST_AV1_INTERPOLATION_FILTER_SWITCHABLE: Filter is swichtable
  }
type
  PGstAV1InterpolationFilter = ^TGstAV1InterpolationFilter;
  TGstAV1InterpolationFilter =  Longint;
  Const
    GST_AV1_INTERPOLATION_FILTER_EIGHTTAP = 0;
    GST_AV1_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH = 1;
    GST_AV1_INTERPOLATION_FILTER_EIGHTTAP_SHARP = 2;
    GST_AV1_INTERPOLATION_FILTER_BILINEAR = 3;
    GST_AV1_INTERPOLATION_FILTER_SWITCHABLE = 4;
;
{*
 * GstAV1TXModes:
 * @GST_AV1_TX_MODE_ONLY_4x4: the inverse transform will use only 4x4 transforms.
 * @GST_AV1_TX_MODE_LARGEST: the inverse transform will use the largest transform
 *   size that fits inside the block.
 * @GST_AV1_TX_MODE_SELECT: the choice of transform size is specified explicitly
 *   for each block.
  }
type
  PGstAV1TXModes = ^TGstAV1TXModes;
  TGstAV1TXModes =  Longint;
  Const
    GST_AV1_TX_MODE_ONLY_4x4 = 0;
    GST_AV1_TX_MODE_LARGEST = 1;
    GST_AV1_TX_MODE_SELECT = 2;
;
{*
 * GstAV1FrameRestorationType:
 * @GST_AV1_FRAME_RESTORE_NONE: no filtering is applied
 * @GST_AV1_FRAME_RESTORE_WIENER: Wiener filter process is invoked
 * @GST_AV1_FRAME_RESTORE_SGRPROJ: self guided filter proces is invoked
 * @GST_AV1_FRAME_RESTORE_SWITCHABLE: restoration filter is swichtable
  }
type
  PGstAV1FrameRestorationType = ^TGstAV1FrameRestorationType;
  TGstAV1FrameRestorationType =  Longint;
  Const
    GST_AV1_FRAME_RESTORE_NONE = 0;
    GST_AV1_FRAME_RESTORE_WIENER = 1;
    GST_AV1_FRAME_RESTORE_SGRPROJ = 2;
    GST_AV1_FRAME_RESTORE_SWITCHABLE = 3;
;
{*
 * GstAV1ReferenceFrame:
 * @GST_AV1_REF_INTRA_FRAME: Intra Frame Reference
 * @GST_AV1_REF_LAST_FRAME: Last Reference Frame
 * @GST_AV1_REF_LAST2_FRAME: Last2 Reference Frame
 * @GST_AV1_REF_LAST3_FRAME: Last3 Reference Frame
 * @GST_AV1_REF_GOLDEN_FRAME: Golden Reference Frame
 * @GST_AV1_REF_BWDREF_FRAME: BWD Reference Frame
 * @GST_AV1_REF_ALTREF2_FRAME: Alternative2 Reference Frame
 * @GST_AV1_REF_ALTREF_FRAME: Alternative Reference Frame
 * @GST_AV1_NUM_REF_FRAMES: Total Reference Frame Number
  }
type
  PGstAV1ReferenceFrame = ^TGstAV1ReferenceFrame;
  TGstAV1ReferenceFrame =  Longint;
  Const
    GST_AV1_REF_INTRA_FRAME = 0;
    GST_AV1_REF_LAST_FRAME = 1;
    GST_AV1_REF_LAST2_FRAME = 2;
    GST_AV1_REF_LAST3_FRAME = 3;
    GST_AV1_REF_GOLDEN_FRAME = 4;
    GST_AV1_REF_BWDREF_FRAME = 5;
    GST_AV1_REF_ALTREF2_FRAME = 6;
    GST_AV1_REF_ALTREF_FRAME = 7;
    GST_AV1_NUM_REF_FRAMES = 8;
;
{*
 * GstAV1WarpModelType:
 * @GST_AV1_WARP_MODEL_IDENTITY: Warp model is just an identity transform
 * @GST_AV1_WARP_MODEL_TRANSLATION: Warp model is a pure translation
 * @GST_AV1_WARP_MODEL_ROTZOOM: Warp model is a rotation + symmetric zoom
 *     + translation
 * @GST_AV1_WARP_MODEL_AFFINE: Warp model is a general affine transform
  }
type
  PGstAV1WarpModelType = ^TGstAV1WarpModelType;
  TGstAV1WarpModelType =  Longint;
  Const
    GST_AV1_WARP_MODEL_IDENTITY = 0;
    GST_AV1_WARP_MODEL_TRANSLATION = 1;
    GST_AV1_WARP_MODEL_ROTZOOM = 2;
    GST_AV1_WARP_MODEL_AFFINE = 3;
;
{*
 * GstAV1OBUHeader:
 * @obu_type: the type of data structure contained in the OBU payload.
 * @obu_extention_flag: indicates if OBU header extention is present.
 * @obu_has_size_field: equal to 1 indicates that the obu_size syntax element will be
 *   present. @obu_has_size_field equal to 0 indicates that the @obu_size syntax element
 *   will not be present.
 * @obu_temporal_id: specifies the temporal level of the data contained in the OBU.
 * @obu_spatial_id: specifies the spatial level of the data contained in the OBU.
 *
 * Collect info for OBU header and OBU extension header if
 * obu_extension_flag == 1.
  }
type
  PGstAV1OBUHeader = ^TGstAV1OBUHeader;
  TGstAV1OBUHeader = record
      obu_type : TGstAV1OBUType;
      obu_extention_flag : Tgboolean;
      obu_has_size_field : Tgboolean;
      obu_temporal_id : Tguint8;
      obu_spatial_id : Tguint8;
    end;

{*
 * GstAV1OBU:
 * @header: a #GstAV1OBUHeader OBU Header
 * @obu_type: the type of data structure contained in the OBU payload.
 * @data: references the current data chunk that holds the OBU
 * @obu_size: size of the OBU, not include header size
 *
 * It is the general representation of AV1 OBU (Open Bitstream
 * Unit). One OBU include its header and payload.
  }
  PGstAV1OBU = ^TGstAV1OBU;
  TGstAV1OBU = record
      header : TGstAV1OBUHeader;
      obu_type : TGstAV1OBUType;
      data : Pguint8;
      obu_size : Tguint32;
    end;

{*
 * GstAV1OperatingPoint:
 * @seq_level_idx: specifies the level that the coded video sequence conforms to.
 * @seq_tier: specifies the tier that the coded video sequence conforms to.
 * @idc: contains a bitmask that indicates which spatial and temporal layers should be
 *   decoded. Bit k is equal to 1 if temporal layer k should be decoded (for k between
 *   0 and 7). Bit j+8 is equal to 1 if spatial layer j should be decoded (for j between
 *   0 and 3).
 * @decoder_model_present_for_this_op: equal to one indicates that there is a decoder model
 *   associated with this operating point. @decoder_model_present_for_this_op equal to zero
 *   indicates that there is not a decoder model associated.
 * @decoder_buffer_delay: specifies the time interval between the arrival of the first bit
 *   in the smoothing buffer and the subsequent removal of the data that belongs to the
 *   first coded frame for operating point op, measured in units of 1/90000 seconds. The
 *   length of @decoder_buffer_delay is specified by @buffer_delay_length_minus_1 + 1, in bits.
 * @encoder_buffer_delay: specifies, in combination with @decoder_buffer_delay syntax element,
 *   the first bit arrival time of frames to be decoded to the smoothing buffer.
 *   @encoder_buffer_delay is measured in units of 1/90000 seconds. For a video sequence that
 *   includes one or more random access points the sum of @decoder_buffer_delay and
 *   @encoder_buffer_delay shall be kept constant.
 * @low_delay_mode_flag: equal to 1 indicates that the smoothing buffer operates in low-delay
 *   mode for operating point op. In low-delay mode late decode times and buffer underflow
 *   are both permitted. @low_delay_mode_flag equal to 0 indicates that the smoothing buffer
 *   operates in strict mode, where buffer underflow is not allowed.
 * @initial_display_delay_present_for_this_op: equal to 1 indicates that
 *   @initial_display_delay_minus_1 is specified for this operating. 0 indicates that
 *   @initial_display_delay_minus_1 is not specified for this operating point.
 * @initial_display_delay_minus_1: plus 1 specifies, for operating point i, the number of
 *   decoded frames that should be present in the buffer pool before the first presentable
 *   frame is displayed. This will ensure that all presentable frames in the sequence can
 *   be decoded at or before the time that they are scheduled for display.
  }
  PGstAV1OperatingPoint = ^TGstAV1OperatingPoint;
  TGstAV1OperatingPoint = record
      seq_level_idx : Tguint8;
      seq_tier : Tguint8;
      idc : Tguint16;
      decoder_model_present_for_this_op : Tgboolean;
      decoder_buffer_delay : Tguint8;
      encoder_buffer_delay : Tguint8;
      low_delay_mode_flag : Tgboolean;
      initial_display_delay_present_for_this_op : Tgboolean;
      initial_display_delay_minus_1 : Tguint8;
    end;

{*
 * GstAV1DecoderModelInfo:
 * @buffer_delay_length_minus_1: plus 1 specifies the length of the
 *   @decoder_buffer_delay and the @encoder_buffer_delay syntax elements,
 *   in bits.
 * @num_units_in_decoding_tick: is the number of time units of a decoding clock
 *   operating at the frequency @time_scale Hz that corresponds to one increment
 *   of a clock tick counter.
 * @buffer_removal_time_length_minus_1: plus 1 specifies the length of the
 *   @buffer_removal_time syntax element, in bits.
 * @frame_presentation_time_length_minus_1: plus 1 specifies the length of the
 *   @frame_presentation_time syntax element, in bits.
  }
  PGstAV1DecoderModelInfo = ^TGstAV1DecoderModelInfo;
  TGstAV1DecoderModelInfo = record
      buffer_delay_length_minus_1 : Tguint8;
      num_units_in_decoding_tick : Tguint32;
      buffer_removal_time_length_minus_1 : Tguint8;
      frame_presentation_time_length_minus_1 : Tguint8;
    end;

{*
 * GstAV1TimingInfo:
 * @num_units_in_display_tick: is the number of time units of a clock operating at the
 *   frequency @time_scale Hz that corresponds to one increment of a clock tick counter.
 *   A clock tick, in seconds, is equal to num_units_in_display_tick divided by time_scale.
 *   It is a requirement of bitstream conformance that num_units_in_display_tick is greater
 *   than 0.
 * @time_scale: is the number of time units that pass in one second. It is a requirement of
 *   bitstream conformance that @time_scale is greater than 0.
 * @equal_picture_interval: equal to 1 indicates that pictures should be displayed according
 *   to their output order with the number of ticks between two consecutive pictures (without
 *   dropping frames) specified by @num_ticks_per_picture_minus_1 + 1. @equal_picture_interval
 *   equal to 0 indicates that the interval between two consecutive pictures is not specified.
 * @num_ticks_per_picture_minus_1: plus 1 specifies the number of clock ticks corresponding
 *   to output time between two consecutive pictures in the output order. It is a requirement
 *   of bitstream conformance that the value of @num_ticks_per_picture_minus_1 shall be in the
 *   range of 0 to (1 << 32) - 2, inclusive.
  }
  PGstAV1TimingInfo = ^TGstAV1TimingInfo;
  TGstAV1TimingInfo = record
      num_units_in_display_tick : Tguint32;
      time_scale : Tguint32;
      equal_picture_interval : Tgboolean;
      num_ticks_per_picture_minus_1 : Tguint32;
    end;

{*
 * GstAV1ColorConfig:
 * @high_bitdepth: syntax element which, together with @seq_profile, determine the bit depth.
 * @twelve_bit: is syntax elements which, together with @seq_profile and @high_bitdepth,
 *   determines the bit depth.
 * @mono_chrome: equal to 1 indicates that the video does not contain U and V color planes.
 *   @mono_chrome equal to 0 indicates that the video contains Y, U, and V color planes.
 * @color_description_present_flag: equal to 1 specifies that color_primaries,
 *   @transfer_characteristics, and @matrix_coefficients are present.
 *   @color_description_present_flag equal to 0 specifies that @color_primaries,
 *   @transfer_characteristics and @matrix_coefficients are not present.
 * @color_primaries: is an integer that is defined by the "Color primaries" section of
 *   ISO/IEC 23091-4/ITU-T H.273.
 * @transfer_characteristics: is an integer that is defined by the "Transfer characteristics"
 *   section of ISO/IEC 23091-4/ITU-T H.273.
 * @matrix_coefficients: is an integer that is defined by the "Matrix coefficients" section
 *   of ISO/IEC 23091-4/ITU-T H.273.
 * @color_range: is a binary value that is associated with the VideoFullRangeFlag variable
 *   specified in ISO/IEC 23091-4/ITU-T H.273. color range equal to 0 shall be referred to
 *   as the studio swing representation and color range equal to 1 shall be referred to as
 *   the full swing representation for all intents relating to this specification.
 * @subsampling_x, @subsampling_y: specify the chroma subsampling format. If
 *   @matrix_coefficients is equal to GST_AV1_MC_IDENTITY, it is a requirement of bitstream
 *   conformance that @subsampling_x is equal to 0 and @subsampling_y is equal to 0.
 * @chroma_sample_position specifies the sample position for subsampled streams:
 * @separate_uv_delta_q: equal to 1 indicates that the U and V planes may have separate
 *  delta quantizer values. @separate_uv_delta_q equal to 0 indicates that the U and V
 *  planes will share the same delta quantizer value.
  }
  PGstAV1ColorConfig = ^TGstAV1ColorConfig;
  TGstAV1ColorConfig = record
      high_bitdepth : Tgboolean;
      twelve_bit : Tgboolean;
      mono_chrome : Tgboolean;
      color_description_present_flag : Tgboolean;
      color_primaries : TGstAV1ColorPrimaries;
      transfer_characteristics : TGstAV1TransferCharacteristics;
      matrix_coefficients : TGstAV1MatrixCoefficients;
      color_range : Tgboolean;
      subsampling_x : Tguint8;
      subsampling_y : Tguint8;
      chroma_sample_position : TGstAV1ChromaSamplePositions;
      separate_uv_delta_q : Tgboolean;
    end;

{*
 * GstAV1SequenceHeaderOBU:
 * @seq_profile: specifies the features that can be used in the coded video sequence
 * @still_picture: equal to 1 specifies that the bitstream contains only one coded frame.
 * @reduced_still_picture_header: specifies that the syntax elements not needed by a still
 *   picture are omitted.
 * @frame_width_bits_minus_1: specifies the number of bits minus 1 used for transmitting
 *   the frame width syntax elements.
 * @frame_height_bits_minus_1: specifies the number of bits minus 1 used for transmitting
 *   the frame height syntax elements.
 * @max_frame_width_minus_1: specifies the maximum frame width minus 1 for the frames
 *   represented by this sequenceheader.
 * @max_frame_height_minus_1: specifies the maximum frame height minus 1 for the frames
 *   represented by this sequenceheader.
 * @frame_id_numbers_present_flag: specifies whether frame id numbers are present in the bitstream.
 * @delta_frame_id_length_minus_2: specifies the number of bits minus 2 used to encode
 *   delta_frame_id syntax elements.
 * @additional_frame_id_length_minus_1: is used to calculate the number of bits used to
 *   encode the frame_id syntax element.
 * @use_128x128_superblock: when equal to 1, indicates that superblocks contain 128x128 luma
 *   samples. When equal to 0, it indicates that superblocks contain 64x64 luma samples.
 *   (The number of contained chroma samples depends on @subsampling_x and @subsampling_y).
 * @enable_filter_intra: equal to 1 specifies that the @use_filter_intra syntax element may
 *   be present. @enable_filter_intra equal to 0 specifies that the @use_filter_intra syntax
 *   element will not be present.
 * @enable_intra_edge_filter: specifies whether the intra edge filtering process should be enabled.
 * @enable_interintra_compound: equal to 1 specifies that the mode info for inter blocks may
 *   contain the syntax element interintra. @enable_interintra_compound equal to 0 specifies
 *   that the syntax element interintra will not be present.
 * @enable_masked_compound: equal to 1 specifies that the mode info for inter blocks may
 *   contain the syntax element @compound_type. @enable_masked_compound equal to 0 specifies
 *   that the syntax element @compound_type will not be present.
 * @enable_warped_motion: equal to 1 indicates that the allow_warped_motion syntax element
 *   may be present. @enable_warped_motion equal to 0 indicates that the @allow_warped_motion
 *   syntax element will not be present.
 * @enable_order_hint: equal to 1 indicates that tools based on the values of order hints
 *   may be used. @enable_order_hint equal to 0 indicates that tools based on order hints
 *   are disabled.
 * @enable_dual_filter: equal to 1 indicates that the inter prediction filter type may be
 *   specified independently in the horizontal and vertical directions. If the flag is equal
 *   to 0, only one filter type may be specified, which is then used in both directions.
 * @enable_jnt_comp: equal to 1 indicates that the distance weights process may be used
 *   for inter prediction.
 * @enable_ref_frame_mvs: equal to 1 indicates that the @use_ref_frame_mvs syntax element
 *   may be present. @enable_ref_frame_mvs equal to 0 indicates that the @use_ref_frame_mvs
 *   syntax element will not be present.
 * @seq_choose_screen_content_tools: equal to 0 indicates that the @seq_force_screen_content_tools
 *   syntax element will be present. @seq_choose_screen_content_tools equal to 1 indicates
 *   that @seq_force_screen_content_tools should be set equal to SELECT_SCREEN_CONTENT_TOOLS.
 * @seq_force_screen_content_tools: equal to SELECT_SCREEN_CONTENT_TOOLS indicates that the
 *   @allow_screen_content_tools syntax element will be present in the frame header. Otherwise,
 *   @seq_force_screen_content_tools contains the value for @allow_screen_content_tools.
 * @seq_choose_integer_mv: equal to 0 indicates that the seq_force_integer_mv syntax element
 *   will be present. @seq_choose_integer_mv equal to 1 indicates that @seq_force_integer_mv
 *   should be set equal to SELECT_INTEGER_MV.
 * @seq_force_integer_mv: equal to SELECT_INTEGER_MV indicates that the @force_integer_mv
 *   syntax element will be present in the frame header (providing allow_screen_content_tools
 *   is equal to 1). Otherwise, @seq_force_integer_mv contains the value for @force_integer_mv.
 * @order_hint_bits_minus_1: is used to compute OrderHintBits.
 * @enable_superres: equal to 1 specifies that the use_superres syntax element will be present
 *   in the uncompressed header. enable_superres equal to 0 specifies that the use_superres
 *   syntax element will not be present (instead use_superres will be set to 0 in the
 *   uncompressed header without being read).
 * @enable_cdef: equal to 1 specifies that cdef filtering may be enabled. enable_cdef equal
 *   to 0 specifies that cdef filtering is disabled.
 * @enable_restoration: equal to 1 specifies that loop restoration filtering may be enabled.
 *   enable_restoration equal to 0 specifies that loop restoration filtering is disabled.
 * @film_grain_params_present: specifies whether film grain parameters are present in the bitstream.
 * @operating_points_cnt_minus_1: indicates the number of operating points minus 1 present
 *   in this bitstream.
 * @operating_points: specifies the corresponding operating point for a set of operating
 *   parameters.
 * @decoder_model_info_present_flag: specifies whether the decoder model info is present in
 *   the bitstream.
 * @decoder_model_info: holds information about the decoder model.
 * @initial_display_delay_present_flag: specifies whether initial display delay information
 *   is present in the bitstream or not.
 * @timing_info_present_flag: specifies whether timing info is present in the bitstream.
 * @timing_info: holds the timing information.
 * @color_config: hold the color configuration.
 * @order_hint_bits: specifies the number of bits used for the order_hint syntax element.
 * @bit_depth: the bit depth of the stream.
 * @num_planes: the YUV plane number.
  }
{ Global var calculated by sequence  }
{ OrderHintBits  }
{ BitDepth  }
{ NumPlanes  }
  PGstAV1SequenceHeaderOBU = ^TGstAV1SequenceHeaderOBU;
  TGstAV1SequenceHeaderOBU = record
      seq_profile : TGstAV1Profile;
      still_picture : Tgboolean;
      reduced_still_picture_header : Tguint8;
      frame_width_bits_minus_1 : Tguint8;
      frame_height_bits_minus_1 : Tguint8;
      max_frame_width_minus_1 : Tguint16;
      max_frame_height_minus_1 : Tguint16;
      frame_id_numbers_present_flag : Tgboolean;
      delta_frame_id_length_minus_2 : Tguint8;
      additional_frame_id_length_minus_1 : Tguint8;
      use_128x128_superblock : Tgboolean;
      enable_filter_intra : Tgboolean;
      enable_intra_edge_filter : Tgboolean;
      enable_interintra_compound : Tgboolean;
      enable_masked_compound : Tgboolean;
      enable_warped_motion : Tgboolean;
      enable_order_hint : Tgboolean;
      enable_dual_filter : Tgboolean;
      enable_jnt_comp : Tgboolean;
      enable_ref_frame_mvs : Tgboolean;
      seq_choose_screen_content_tools : Tgboolean;
      seq_force_screen_content_tools : Tguint8;
      seq_choose_integer_mv : Tgboolean;
      seq_force_integer_mv : Tguint8;
      order_hint_bits_minus_1 : Tgint8;
      enable_superres : Tgboolean;
      enable_cdef : Tgboolean;
      enable_restoration : Tgboolean;
      film_grain_params_present : Tguint8;
      operating_points_cnt_minus_1 : Tguint8;
      operating_points : array[0..(GST_AV1_MAX_OPERATING_POINTS)-1] of TGstAV1OperatingPoint;
      decoder_model_info_present_flag : Tgboolean;
      decoder_model_info : TGstAV1DecoderModelInfo;
      initial_display_delay_present_flag : Tguint8;
      timing_info_present_flag : Tgboolean;
      timing_info : TGstAV1TimingInfo;
      color_config : TGstAV1ColorConfig;
      order_hint_bits : Tguint8;
      bit_depth : Tguint8;
      num_planes : Tguint8;
    end;

{*
 * GstAV1MetadataITUT_T35:
 * @itu_t_t35_country_code: shall be a byte having a value specified as a country code by
 *   Annex A of Recommendation ITU-T T.35.
 * @itu_t_t35_country_code_extension_byte: shall be a byte having a value specified as a
 *   country code by Annex B of Recommendation ITU-T T.35.
 * @itu_t_t35_payload_bytes: shall be bytes containing data registered as specified in
 *   Recommendation ITU-T T.35.
  }
{ itu_t_t35_payload_bytes - not specified at this spec  }
  PGstAV1MetadataITUT_T35 = ^TGstAV1MetadataITUT_T35;
  TGstAV1MetadataITUT_T35 = record
      itu_t_t35_country_code : Tguint8;
      itu_t_t35_country_code_extention_byte : Tguint8;
      itu_t_t35_payload_bytes : Pguint8;
    end;

{*
 * GstAV1MetadataHdrCll:
 * @max_cll: specifies the maximum content light level as specified in CEA-861.3, Appendix A.
 * @max_fall: specifies the maximum frame-average light level as specified in CEA-861.3, Appendix A.
 *
 * High Dynamic Range content light level syntax metadata.
  }
  PGstAV1MetadataHdrCll = ^TGstAV1MetadataHdrCll;
  TGstAV1MetadataHdrCll = record
      max_cll : Tguint16;
      max_fall : Tguint16;
    end;

{*
 * GstAV1MetadataHdrMdcv:
 * @primary_chromaticity_x: specifies a 0.16 fixed-point X chromaticity coordinate as
 *   defined by CIE 1931, where i = 0,1,2 specifies Red, Green, Blue respectively.
 * @primary_chromaticity_y: specifies a 0.16 fixed-point Y chromaticity coordinate as
 *   defined by CIE 1931, where i = 0,1,2 specifies Red, Green, Blue respectively.
 * @white_point_chromaticity_x: specifies a 0.16 fixed-point white X chromaticity coordinate
 *   as defined by CIE 1931.
 * @white_point_chromaticity_y: specifies a 0.16 fixed-point white Y chromaticity coordinate
 *   as defined by CIE 1931.
 * @luminance_max: is a 24.8 fixed-point maximum luminance, represented in candelas per
 *   square meter.
 * @luminance_min: is a 18.14 fixed-point minimum luminance, represented in candelas per
 *   square meter.
 *
 *  High Dynamic Range mastering display color volume metadata.
  }
  PGstAV1MetadataHdrMdcv = ^TGstAV1MetadataHdrMdcv;
  TGstAV1MetadataHdrMdcv = record
      primary_chromaticity_x : array[0..2] of Tguint16;
      primary_chromaticity_y : array[0..2] of Tguint16;
      white_point_chromaticity_x : Tguint16;
      white_point_chromaticity_y : Tguint16;
      luminance_max : Tguint32;
      luminance_min : Tguint32;
    end;

{*
 * GstAV1MetadataScalability:
 * @scalability_mode_idc: indicates the picture prediction structure of the bitstream.
 * @spatial_layers_cnt_minus_1: indicates the number of spatial layers present in the video
 *   sequence minus one.
 * @spatial_layer_description_present_flag: indicates when set to 1 that the
 *   spatial_layer_ref_id is present for each of the (@spatial_layers_cnt_minus_1 + 1) layers,
 *   or that it is not present when set to 0.
 * @spatial_layer_dimensions_present_flag: indicates when set to 1 that the
 *   @spatial_layer_max_width and @spatial_layer_max_height parameters are present for each of
 *   the (@spatial_layers_cnt_minus_1 + 1) layers, or that it they are not present when set to 0.
 * @temporal_group_description_present_flag: indicates when set to 1 that the temporal
 *   dependency information is present, or that it is not when set to 0.
 * @spatial_layer_max_width: specifies the maximum frame width for the frames with
 *   @spatial_id equal to i. This number must not be larger than @max_frame_width_minus_1 + 1.
 * @spatial_layer_max_height: specifies the maximum frame height for the frames with
 *   @spatial_id equal to i. This number must not be larger than @max_frame_height_minus_1 + 1.
 * @spatial_layer_ref_id: specifies the @spatial_id value of the frame within the current
 *   temporal unit that the frame of layer i uses for reference. If no frame within the
 *   current temporal unit is used for reference the value must be equal to 255.
 * @temporal_group_size: indicates the number of pictures in a temporal picture group. If the
 *   @temporal_group_size is greater than 0, then the scalability structure data allows the
 *   inter-picture temporal dependency structure of the video sequence to be specified. If the
 *   @temporal_group_size is greater than 0, then for @temporal_group_size pictures in the
 *   temporal group, each picture's temporal layer id (@temporal_id), switch up points
 *   (@temporal_group_temporal_switching_up_point_flag and
 *   @temporal_group_spatial_switching_up_point_flag), and the reference picture indices
 *   (@temporal_group_ref_pic_diff) are specified. The first picture specified in a temporal
 *   group must have @temporal_id equal to 0. If the parameter @temporal_group_size is not
 *   present or set to 0, then either there is only one temporal layer or there is no fixed
 *   inter-picture temporal dependency present going forward in the video sequence. Note that
 *   for a given picture, all frames follow the same inter-picture temporal dependency
 *   structure. However, the frame rate of each layer can be different from each other. The
 *   specified dependency structure in the scalability structure data must be for the highest
 *   frame rate layer.
 * @temporal_group_temporal_id: specifies the temporal_id value for the i-th picture in
 *   the temporal group.
 * @temporal_group_temporal_switching_up_point_flag: is set to 1 if subsequent (in decoding
 *   order) pictures with a @temporal_id higher than @temporal_group_temporal_id[i] do not
 *   depend on any picture preceding the current picture (in coding order) with @temporal_id
 *   higher than @temporal_group_temporal_id[ i ].
 * @temporal_group_spatial_switching_up_point_flag: is set to 1 if spatial layers of the
 *   current picture in the temporal group (i.e., pictures with a spatial_id higher than zero)
 *   do not depend on any picture preceding the current picture in the temporal group.
 * @temporal_group_ref_cnt: indicates the number of reference pictures used by the i-th
 *   picture in the temporal group.
 * @temporal_group_ref_pic_diff: indicates, for the i-th picture in the temporal group,
 *   the temporal distance between the i-th picture and the j-th reference picture used by
 *   the i-th picture. The temporal distance is measured in frames, counting only frames of
 *   identical @spatial_id values.
 *
 * The scalability metadata OBU is intended for use by intermediate
 * processing entities that may perform selective layer elimination.
  }
  PGstAV1MetadataScalability = ^TGstAV1MetadataScalability;
  TGstAV1MetadataScalability = record
      scalability_mode_idc : TGstAV1ScalabilityModes;
      spatial_layers_cnt_minus_1 : Tguint8;
      spatial_layer_dimensions_present_flag : Tgboolean;
      spatial_layer_description_present_flag : Tgboolean;
      temporal_group_description_present_flag : Tgboolean;
      spatial_layer_max_width : array[0..(GST_AV1_MAX_NUM_SPATIAL_LAYERS)-1] of Tguint16;
      spatial_layer_max_height : array[0..(GST_AV1_MAX_NUM_SPATIAL_LAYERS)-1] of Tguint16;
      spatial_layer_ref_id : array[0..(GST_AV1_MAX_NUM_SPATIAL_LAYERS)-1] of Tguint8;
      temporal_group_size : Tguint8;
      temporal_group_temporal_id : array[0..(GST_AV1_MAX_TEMPORAL_GROUP_SIZE)-1] of Tguint8;
      temporal_group_temporal_switching_up_point_flag : array[0..(GST_AV1_MAX_TEMPORAL_GROUP_SIZE)-1] of Tguint8;
      temporal_group_spatial_switching_up_point_flag : array[0..(GST_AV1_MAX_TEMPORAL_GROUP_SIZE)-1] of Tguint8;
      temporal_group_ref_cnt : array[0..(GST_AV1_MAX_TEMPORAL_GROUP_SIZE)-1] of Tguint8;
      temporal_group_ref_pic_diff : array[0..(GST_AV1_MAX_TEMPORAL_GROUP_SIZE)-1] of array[0..(GST_AV1_MAX_TEMPORAL_GROUP_REFERENCES)-1] of Tguint8;
    end;

{*
 * GstAV1MetadataTimecode:
 * @counting_type: specifies the method of dropping values of the n_frames syntax element as
 *   specified in AV1 Spec 6.1.1. @counting_type should be the same for all pictures in the
 *   coded video sequence.
 * @full_timestamp_flag: equal to 1 indicates that the the @seconds_value, @minutes_value,
 *   @hours_value syntax elements will be present. @full_timestamp_flag equal to 0 indicates
 *   that there are flags to control the presence of these syntax elements.
 * @discontinuity_flag: equal to 0 indicates that the difference between the current value
 *   of clockTimestamp and the value of clockTimestamp computed from the previous set of
 *   timestamp syntax elements in output order can be interpreted as the time difference
 *   between the times of origin or capture of the associated frames or fields.
 *   @discontinuity_flag equal to 1 indicates that the difference between the current value of
 *   clockTimestamp and the value of clockTimestamp computed from the previous set of clock
 *   timestamp syntax elements in output order should not be interpreted as the time difference
 *   between the times of origin or capture of the associated frames or fields.
 * @cnt_dropped_flag: specifies the skipping of one or more values of @n_frames using the
 *   counting method specified by counting_type.
 * @n_frames: is used to compute clockTimestamp. When @timing_info_present_flag is equal to 1,
 *   @n_frames shall be less than maxFps, where maxFps is specified by
 *   maxFps = ceil( time_scale / ( 2 * @num_units_in_display_tick ) ).
 * @seconds_flag: equal to 1 specifies that @seconds_value and @minutes_flag are present when
 *   @full_timestamp_flag is equal to 0. @seconds_flag equal to 0 specifies that @seconds_value
 *   and @minutes_flag are not present.
 * @seconds_value: is used to compute clockTimestamp and shall be in the range of 0 to 59.
 *   When @seconds_value is not present, its value is inferred to be equal to the value of
 *   @seconds_value for the previous set of clock timestamp syntax elements in decoding order,
 *   and it is required that such a previous @seconds_value shall have been present.
 * @minutes_flag: equal to 1 specifies that @minutes_value and @hours_flag are present when
 *   @full_timestamp_flag is equal to 0 and @seconds_flag is equal to 1. @minutes_flag equal to 0
 *   specifies that @minutes_value and @hours_flag are not present.
 * @minutes_value: specifies the value of mm used to compute clockTimestamp and shall be in
 *   the range of 0 to 59, inclusive. When minutes_value is not present, its value is inferred
 *   to be equal to the value of @minutes_value for the previous set of clock timestamp syntax
 *   elements in decoding order, and it is required that such a previous @minutes_value shall
 *   have been present.
 * @hours_flag: equal to 1 specifies that @hours_value is present when @full_timestamp_flag is
 *   equal to 0 and @seconds_flag is equal to 1 and @minutes_flag is equal to 1.
 * @hours_value: is used to compute clockTimestamp and shall be in the range of 0 to 23,
 *   inclusive. When @hours_value is not present, its value is inferred to be equal to the
 *   value of @hours_value for the previous set of clock timestamp syntax elements in decoding
 *   order, and it is required that such a previous @hours_value shall have been present.
 * @time_offset_length: greater than 0 specifies the length in bits of the @time_offset_value
 *   syntax element. @time_offset_length equal to 0 specifies that the @time_offset_value syntax
 *   element is not present. @time_offset_length should be the same for all pictures in the
 *   coded video sequence.
 * @time_offset_value: is used to compute clockTimestamp. The number of bits used to represent
 *   @time_offset_value is equal to @time_offset_length. When @time_offset_value is not present,
 *   its value is inferred to be equal to 0.
  }
{ candidate for sperate Type GstAV1TimecodeCountingType  }
  PGstAV1MetadataTimecode = ^TGstAV1MetadataTimecode;
  TGstAV1MetadataTimecode = record
      counting_type : Tguint8;
      full_timestamp_flag : Tgboolean;
      discontinuity_flag : Tgboolean;
      cnt_dropped_flag : Tgboolean;
      n_frames : Tguint8;
      seconds_flag : Tgboolean;
      seconds_value : Tguint8;
      minutes_flag : Tgboolean;
      minutes_value : Tguint8;
      hours_flag : Tgboolean;
      hours_value : Tguint8;
      time_offset_length : Tguint8;
      time_offset_value : Tguint32;
    end;

{*
 * GstAV1MetadataOBU:
 * @metadata_type: type of metadata
 * @itut_t35: ITUT T35 metadata
 * @hdrcll: high dynamic range content light level metadata
 * @hdrcmdcv: high dynamic range mastering display color volume metadata_type
 * @scalability: Scalability metadata
 * @timecode: Timecode metadata
  }
  PGstAV1MetadataOBU = ^TGstAV1MetadataOBU;
  TGstAV1MetadataOBU = record
      metadata_type : TGstAV1MetadataType;
      xxxxxx : record
          case longint of
            0 : ( itut_t35 : TGstAV1MetadataITUT_T35 );
            1 : ( hdr_cll : TGstAV1MetadataHdrCll );
            2 : ( hdr_mdcv : TGstAV1MetadataHdrMdcv );
            3 : ( scalability : TGstAV1MetadataScalability );
            4 : ( timecode : TGstAV1MetadataTimecode );
          end;
    end;

{*
 * GstAV1LoopFilterParams:
 * @loop_filter_level: is an array containing loop filter strength values. Different loop
 *   filter strength values from the array are used depending on the image plane being
 *   filtered, and the edge direction (vertical or horizontal) being filtered.
 * @loop_filter_sharpness: indicates the sharpness level. The @loop_filter_level and
 *   @loop_filter_sharpness together determine when a block edge is filtered, and by how much
 *   the filtering can change the sample values. The loop filter process is described in AV1
 *   Bitstream Spec. section 7.14.
 * @loop_filter_delta_enabled: equal to 1 means that the filter level depends on the mode and
 *   reference frame used to predict a block. @loop_filter_delta_enabled equal to 0 means that
 *   the filter level does not depend on the mode and reference frame.
 * @loop_filter_delta_update: equal to 1 means that the bitstream contains additional syntax
 *   elements that specify which mode and reference frame deltas are to be updated.
 *   @loop_filter_delta_update equal to 0 means that these syntax elements are not present.
 * @loop_filter_ref_deltas: contains the adjustment needed for the filter level based on
 *   the chosen reference frame. If this syntax element is not present in the bitstream,
 *   it maintains its previous value.
 * @loop_filter_mode_deltas: contains the adjustment needed for the filter level based on
 *   the chosen mode. If this syntax element is not present in the bitstream, it maintains
 *   its previous value.
 * @delta_lf_present: specifies whether loop filter delta values are present in the bitstream.
 * @delta_lf_res: specifies the left shift which should be applied to decoded loop filter
 *   delta values.
 * @delta_lf_multi: equal to 1 specifies that separate loop filter deltas are sent for
 *   horizontal luma edges, vertical luma edges, the U edges, and the V edges. @delta_lf_multi
 *   equal to 0 specifies that the same loop filter delta is used for all edges.
  }
  PGstAV1LoopFilterParams = ^TGstAV1LoopFilterParams;
  TGstAV1LoopFilterParams = record
      loop_filter_level : array[0..3] of Tguint8;
      loop_filter_sharpness : Tguint8;
      loop_filter_delta_enabled : Tgboolean;
      loop_filter_delta_update : Tgboolean;
      loop_filter_ref_deltas : array[0..(GST_AV1_TOTAL_REFS_PER_FRAME)-1] of Tgint8;
      loop_filter_mode_deltas : array[0..1] of Tgint8;
      delta_lf_present : Tgboolean;
      delta_lf_res : Tguint8;
      delta_lf_multi : Tguint8;
    end;

{*
 * GstAV1QuantizationParams:
 * @base_q_idx: indicates the base frame qindex. This is used for Y AC coefficients and as
 *   the base value for the other quantizers.
 * @diff_uv_delta: equal to 1 indicates that the U and V delta quantizer values are coded
 *   separately. @diff_uv_delta equal to 0 indicates that the U and V delta quantizer values
 *   share a common value.
 * @using_qmatrix: specifies that the quantizer matrix will be used to compute quantizers.
 * @qm_y: specifies the level in the quantizer matrix that should be used for luma plane decoding.
 * @qm_u: specifies the level in the quantizer matrix that should be used for chroma U plane decoding.
 * @qm_v: specifies the level in the quantizer matrix that should be used for chroma V plane decoding.
 * @delta_q_present: specifies whether quantizer index delta values are present in the bitstream.
 * @delta_q_res: specifies the left shift which should be applied to decoded quantizer index
 *   delta values.
 * @delta_q_y_dc: indicates the Y DC quantizer relative to base_q_idx.
 * @delta_q_u_dc: indicates the U DC quantizer relative to base_q_idx.
 * @delta_q_u_ac: indicates the U AC quantizer relative to base_q_idx.
 * @delta_q_v_dc: indicates the V DC quantizer relative to base_q_idx.
 * @delta_q_v_ac: indicates the V AC quantizer relative to base_q_idx.
  }
{ DeltaQYDc  }
{ DeltaQUDc  }
{ DeltaQUAc  }
{ DeltaQVDc  }
{ DeltaQVAc  }
  PGstAV1QuantizationParams = ^TGstAV1QuantizationParams;
  TGstAV1QuantizationParams = record
      base_q_idx : Tguint8;
      diff_uv_delta : Tgboolean;
      using_qmatrix : Tgboolean;
      qm_y : Tguint8;
      qm_u : Tguint8;
      qm_v : Tguint8;
      delta_q_present : Tgboolean;
      delta_q_res : Tguint8;
      delta_q_y_dc : Tgint8;
      delta_q_u_dc : Tgint8;
      delta_q_u_ac : Tgint8;
      delta_q_v_dc : Tgint8;
      delta_q_v_ac : Tgint8;
    end;

{*
 * GstAV1SegmentationParams:
 * @segmentation_enabled: equal to 1 indicates that this frame makes use of the segmentation
 *   tool; @segmentation_enabled equal to 0 indicates that the frame does not use segmentation.
 * @segmentation_update_map: equal to 1 indicates that the segmentation map are updated during
 *   the decoding of this frame. @segmentation_update_map equal to 0 means that the segmentation
 *   map from the previous frame is used.
 * @segmentation_temporal_update: equal to 1 indicates that the updates to the segmentation map
 *   are coded relative to the existing segmentation map. @segmentation_temporal_update equal to
 *   0 indicates that the new segmentation map is coded without reference to the existing
 *   segmentation map.
 * @segmentation_update_data: equal to 1 indicates that new parameters are about to be
 *   specified for each segment. @segmentation_update_data equal to 0 indicates that the
 *   segmentation parameters should keep their existing values.
 * @feature_enabled: set to 1 when the feature of segmentation is enabled.
 * @feature_data: the value of according segmentation feature.
 * @seg_id_pre_skip: equal to 1 indicates that the segment id will be read before the skip
 *   syntax element. @seg_id_pre_skip equal to 0 indicates that the skip syntax element will be
 *   read first.
 * @last_active_seg_id: indicates the highest numbered segment id that has some enabled feature.
 *   This is used when decoding the segment id to only decode choices corresponding to used
 *   segments.
  }
{ FeatureEnabled  }
{ FeatureData  }
{ SegIdPreSkip  }
{ LastActiveSegId  }
  PGstAV1SegmentationParams = ^TGstAV1SegmentationParams;
  TGstAV1SegmentationParams = record
      segmentation_enabled : Tgboolean;
      segmentation_update_map : Tguint8;
      segmentation_temporal_update : Tguint8;
      segmentation_update_data : Tguint8;
      feature_enabled : array[0..(GST_AV1_MAX_SEGMENTS)-1] of array[0..(GST_AV1_SEG_LVL_MAX)-1] of Tgint8;
      feature_data : array[0..(GST_AV1_MAX_SEGMENTS)-1] of array[0..(GST_AV1_SEG_LVL_MAX)-1] of Tgint16;
      seg_id_pre_skip : Tguint8;
      last_active_seg_id : Tguint8;
    end;

{*
 * GstAV1TileInfo:
 * @uniform_tile_spacing_flag: equal to 1 means that the tiles are uniformly spaced across the
 *   frame. (In other words, all tiles are the same size except for the ones at the right and
 *   bottom edge which can be smaller.) @uniform_tile_spacing_flag equal to 0 means that the
 *   tile sizes are coded.
 * @increment_tile_rows_log2: is used to compute @tile_rows_log2.
 * @width_in_sbs_minus_1: specifies the width of a tile minus 1 in units of superblocks.
 * @height_in_sbs_minus_1: specifies the height of a tile minus 1 in units of superblocks.
 * @tile_size_bytes_minus_1: is used to compute @tile_size_bytes
 * @context_update_tile_id: specifies which tile to use for the CDF update.
 * @mi_col_starts: is an array specifying the start column (in units of 4x4 luma samples) for
 *   each tile across the image.
 * @mi_row_starts: is an array specifying the start row (in units of 4x4 luma samples) for
 *   each tile down the image.
 * @tile_cols_log2: specifies the base 2 logarithm of the desired number of tiles across the frame.
 * @tile_cols: specifies the number of tiles across the frame. It is a requirement of bitstream
 *   conformance that @tile_cols is less than or equal to GST_AV1_MAX_TILE_COLS.
 * @tile_rows_log2: specifies the base 2 logarithm of the desired number of tiles down the frame.
 * @tile_rows: specifies the number of tiles down the frame. It is a requirement of bitstream
 *   conformance that @tile_rows is less than or equal to GST_AV1_MAX_TILE_ROWS.
 * @tile_size_bytes: specifies the number of bytes needed to code each tile size.
  }
{ MiColStarts  }
{ MiRowStarts  }
{ TileColsLog2  }
{ TileCols  }
{ TileRowsLog2  }
{ TileRows  }
{ TileSizeBytes  }
  PGstAV1TileInfo = ^TGstAV1TileInfo;
  TGstAV1TileInfo = record
      uniform_tile_spacing_flag : Tguint8;
      increment_tile_rows_log2 : Tgint;
      width_in_sbs_minus_1 : array[0..(GST_AV1_MAX_TILE_COLS)-1] of Tgint;
      height_in_sbs_minus_1 : array[0..(GST_AV1_MAX_TILE_ROWS)-1] of Tgint;
      tile_size_bytes_minus_1 : Tgint;
      context_update_tile_id : Tguint8;
      mi_col_starts : array[0..(GST_AV1_MAX_TILE_COLS+1)-1] of Tguint32;
      mi_row_starts : array[0..(GST_AV1_MAX_TILE_ROWS+1)-1] of Tguint32;
      tile_cols_log2 : Tguint8;
      tile_cols : Tguint8;
      tile_rows_log2 : Tguint8;
      tile_rows : Tguint8;
      tile_size_bytes : Tguint8;
    end;

{*
 * GstAV1CDEFParams:
 * @cdef_damping: controls the amount of damping in the deringing filter.
 * @cdef_bits: specifies the number of bits needed to specify which CDEF filter to apply.
 * @cdef_y_pri_strength: specify the strength of the primary filter (Y component)
 * @cdef_uv_pri_strength: specify the strength of the primary filter (UV components).
 * @cdef_y_sec_strength: specify the strength of the secondary filter (Y component).
 * @cdef_uv_sec_strength: specify the strength of the secondary filter (UV components).
 *
 * Parameters of Constrained Directional Enhancement Filter (CDEF).
  }
  PGstAV1CDEFParams = ^TGstAV1CDEFParams;
  TGstAV1CDEFParams = record
      cdef_damping : Tguint8;
      cdef_bits : Tguint8;
      cdef_y_pri_strength : array[0..(GST_AV1_CDEF_MAX)-1] of Tguint8;
      cdef_y_sec_strength : array[0..(GST_AV1_CDEF_MAX)-1] of Tguint8;
      cdef_uv_pri_strength : array[0..(GST_AV1_CDEF_MAX)-1] of Tguint8;
      cdef_uv_sec_strength : array[0..(GST_AV1_CDEF_MAX)-1] of Tguint8;
    end;

{*
 * GstAV1LoopRestorationParams:
 * @lr_unit_shift: specifies if the luma restoration size should be halved.
 * @lr_uv_shift: is only present for 4:2:0 formats and specifies if the chroma size should be
 *   half the luma size.
 * @frame_restoration_type: specifies the type of restoration used for each plane.
 * @loop_restoration_size: specifies the size of loop restoration units in units of samples in
 *   the current plane.
 * @uses_lr: indicates if any plane uses loop restoration.
  }
{ FrameRestorationType  }
{ LoopRestorationSize  }
{ UsesLr  }
  PGstAV1LoopRestorationParams = ^TGstAV1LoopRestorationParams;
  TGstAV1LoopRestorationParams = record
      lr_unit_shift : Tguint8;
      lr_uv_shift : Tgboolean;
      frame_restoration_type : array[0..(GST_AV1_MAX_NUM_PLANES)-1] of TGstAV1FrameRestorationType;
      loop_restoration_size : array[0..(GST_AV1_MAX_NUM_PLANES)-1] of Tguint32;
      uses_lr : Tguint8;
    end;

{*
 * GstAV1GlobalMotionParams:
 * @is_global: specifies whether global motion parameters are present for a particular
 *   reference frame.
 * @is_rot_zoom: specifies whether a particular reference frame uses rotation and zoom
 *   global motion.
 * @is_translation: specifies whether a particular reference frame uses translation
 *   global motion.
 * @gm_params: is set equal to SavedGmParams[ frame_to_show_map_idx ][ ref ][ j ] for
 *   ref = LAST_FRAME..ALTREF_FRAME, for j = 0..5.
 * @gm_type: specifying the type of global motion.
 * @invalid: whether this global motion parameters is invalid. (Since: 1.20)
  }
{*
 * _GstAV1GlobalMotionParams.invalid:
 *
 * whether this global motion parameters is invalid.
 *
 * Since: 1.20
  }
{ GmType  }
  PGstAV1GlobalMotionParams = ^TGstAV1GlobalMotionParams;
  TGstAV1GlobalMotionParams = record
      is_global : array[0..(GST_AV1_NUM_REF_FRAMES)-1] of Tgboolean;
      is_rot_zoom : array[0..(GST_AV1_NUM_REF_FRAMES)-1] of Tgboolean;
      is_translation : array[0..(GST_AV1_NUM_REF_FRAMES)-1] of Tgboolean;
      gm_params : array[0..(GST_AV1_NUM_REF_FRAMES)-1] of array[0..5] of Tgint32;
      gm_type : array[0..(GST_AV1_NUM_REF_FRAMES)-1] of TGstAV1WarpModelType;
      invalid : array[0..(GST_AV1_NUM_REF_FRAMES)-1] of Tgboolean;
    end;

{*
 * GstAV1FilmGrainParams:
 * @apply_grain: equal to 1 specifies that film grain should be added to this frame.
 *   apply_grain equal to 0 specifies that film grain should not be added.
 * @grain_seed: specifies the starting value for the pseudo-random numbers used during film
 *   grain synthesis.
 * @update_grain: equal to 1 means that a new set of parameters should be sent. @update_grain
 *   equal to 0 means that the previous set of parameters should be used.
 * @film_grain_params_ref_idx: indicates which reference frame contains the film grain
 *   parameters to be used for this frame.
 * @num_y_points: specifies the number of points for the piece-wise linear scaling function
 *   of the luma component. It is a requirement of bitstream conformance that @num_y_points is
 *   less than or equal to 14.
 * @point_y_value: represents the x (luma value) coordinate for the i-th point of the
 *   piecewise linear scaling function for luma component. The values are signaled on the
 *   scale of 0..255. (In case of 10 bit video, these values correspond to luma values divided
 *   by 4. In case of 12 bit video, these values correspond to luma values divided by 16.)
 *   If i is greater than 0, it is a r equirement of bitstream conformance that
 *   @point_y_value[ i ] is greater than @point_y_value[ i - 1 ] (this ensures the x coordinates
 *   are specified in increasing order).
 * @point_y_scaling: represents the scaling (output) value for the i-th point of the
 *   piecewise linear scaling function for luma component.
 * @chroma_scaling_from_luma: specifies that the chroma scaling is inferred from the luma scaling.
 * @num_cb_points: specifies the number of points for the piece-wise linear scaling function
 *   of the cb component. It is a requirement of bitstream conformance that @num_cb_points is
 *   less than or equal to 10.
 * @point_cb_value: represents the x coordinate for the i-th point of the piece-wise linear
 *   scaling function for cb component. The values are signaled on the scale of 0..255. If i
 *   is greater than 0, it is a requirement of bitstream conformance that point_cb_value[ i ]
 *   is greater than point_cb_value[ i - 1 ].
 * @point_cb_scaling: represents the scaling (output) value for the i-th point of the
 *   piecewise linear scaling function for cb component.
 * @num_cr_points: specifies represents the number of points for the piece-wise linear scaling
 *   function of the cr component. It is a requirement of bitstream conformance that
 *   num_cr_points is less than or equal to 10. If subsampling_x is equal to 1 and
 *   @subsampling_y is equal to 1 and num_cb_points is equal to 0, it is a requirement of
 *   bitstream conformance that num_cr_points is equal to 0. If @subsampling_x is equal to 1
 *   and @subsampling_y is equal to 1 and @num_cb_points is not equal to 0, it is a requirement
 *   of bitstream conformance that @num_cr_points is not equal to 0.
 * @point_cr_value: represents the x coordinate for the i-th point of the piece-wise linear
 *   scaling function for cr component. The values are signaled on the scale of 0..255. If i
 *   is greater than 0, it is a requirement of bitstream conformance that @point_cr_value[ i ]
 *   is greater than @point_cr_value[ i - 1 ].
 * @point_cr_scaling: represents the scaling (output) value for the i-th point of the
 *   piecewise linear scaling function for cr component.
 * @grain_scaling_minus_8: represents the shift - 8 applied to the values of the chroma
 *   component. The @grain_scaling_minus_8 can take values of 0..3 and determines the range and
 *   quantization step of the standard deviation of film grain.
 * @ar_coeff_lag: specifies the number of auto-regressive coefficients for luma and chroma.
 * @ar_coeffs_y_plus_128: specifies auto-regressive coefficients used for the Y plane.
 * @ar_coeffs_cb_plus_128: specifies auto-regressive coefficients used for the U plane.
 * @ar_coeffs_cr_plus_128: specifies auto-regressive coefficients used for the V plane.
 * @ar_coeff_shift_minus_6: specifies the range of the auto-regressive coefficients. Values
 *   of 0, 1, 2, and 3 correspond to the ranges for auto-regressive coefficients of [-2, 2),
 *   [-1, 1), [-0.5, 0.5) and [-0.25, 0.25) respectively.
 * @grain_scale_shift: specifies how much the Gaussian random numbers should be scaled down
 *   during the grain synthesis process.
 * @cb_mult: represents a multiplier for the cb component used in derivation of the input
 *   index to the cb component scaling function.
 * @cb_luma_mult: represents a multiplier for the average luma component used in derivation
 *   of the input index to the cb component scaling function.
 * @cb_offset: represents an offset used in derivation of the input index to the cb component
 *   scaling function.
 * @cr_mult: represents a multiplier for the cr component used in derivation of the input
 *   index to the cr component scaling function.
 * @cr_luma_mult: represents a multiplier for the average luma component used in derivation
 *   of the input index to the cr component scaling function.
 * @cr_offset: represents an offset used in derivation of the input index to the cr component
 *   scaling function.
 * @overlap_flag: equal to 1 indicates that the overlap between film grain blocks shall be
 *   applied. overlap_flag equal to 0 indicates that the overlap between film grain blocks
 *   shall not be applied.
 * @clip_to_restricted_range: equal to 1 indicates that clipping to the restricted (studio)
 *   range shall be applied to the sample values after adding the film grain (see the
 *   semantics for color_range for an explanation of studio swing). clip_to_restricted_range
 *   equal to 0 indicates that clipping to the full range shall be applied to the sample
 *   values after adding the film grain.
  }
  PGstAV1FilmGrainParams = ^TGstAV1FilmGrainParams;
  TGstAV1FilmGrainParams = record
      apply_grain : Tgboolean;
      grain_seed : Tguint16;
      update_grain : Tgboolean;
      film_grain_params_ref_idx : Tguint8;
      num_y_points : Tguint8;
      point_y_value : array[0..(GST_AV1_MAX_NUM_Y_POINTS)-1] of Tguint8;
      point_y_scaling : array[0..(GST_AV1_MAX_NUM_Y_POINTS)-1] of Tguint8;
      chroma_scaling_from_luma : Tguint8;
      num_cb_points : Tguint8;
      point_cb_value : array[0..(GST_AV1_MAX_NUM_CB_POINTS)-1] of Tguint8;
      point_cb_scaling : array[0..(GST_AV1_MAX_NUM_CB_POINTS)-1] of Tguint8;
      num_cr_points : Tguint8;
      point_cr_value : array[0..(GST_AV1_MAX_NUM_CR_POINTS)-1] of Tguint8;
      point_cr_scaling : array[0..(GST_AV1_MAX_NUM_CR_POINTS)-1] of Tguint8;
      grain_scaling_minus_8 : Tguint8;
      ar_coeff_lag : Tguint8;
      ar_coeffs_y_plus_128 : array[0..(GST_AV1_MAX_NUM_POS_LUMA)-1] of Tguint8;
      ar_coeffs_cb_plus_128 : array[0..(GST_AV1_MAX_NUM_POS_LUMA)-1] of Tguint8;
      ar_coeffs_cr_plus_128 : array[0..(GST_AV1_MAX_NUM_POS_LUMA)-1] of Tguint8;
      ar_coeff_shift_minus_6 : Tguint8;
      grain_scale_shift : Tguint8;
      cb_mult : Tguint8;
      cb_luma_mult : Tguint8;
      cb_offset : Tguint16;
      cr_mult : Tguint8;
      cr_luma_mult : Tguint8;
      cr_offset : Tguint16;
      overlap_flag : Tgboolean;
      clip_to_restricted_range : Tgboolean;
    end;

{*
 * GstAV1FrameHeaderOBU:
 * @show_existing_frame: equal to 1, indicates the frame indexed by @frame_to_show_map_idx is
 *   to be output; @show_existing_frame equal to 0 indicates that further processing is required.
 *   If @obu_type is equal to %GST_AV1_OBU_FRAME, it is a requirement of bitstream conformance that
 *   @show_existing_frame is equal to 0.
 * @frame_to_show_map_idx: specifies the frame to be output. It is only available if
 *   @show_existing_frame is 1.
 * @frame_presentation_time: specifies the presentation time of the frame in clock ticks
 *   DispCT counted from the removal time of the last frame with frame_type equal to KEY_FRAME
 *   for the operating point that is being decoded. The syntax element is signaled as a fixed
 *   length unsigned integer with a length in bits given by
 *   @frame_presentation_time_length_minus_1 + 1. The @frame_presentation_time is the remainder
 *   of a modulo 1 << (@frame_presentation_time_length_minus_1 + 1) counter.
 * @tu_presentation_delay: is a syntax element used by the decoder model. It does not affect
 *   the decoding process.
 * @display_frame_id: provides the frame id number for the frame to output. It is a requirement
 *   of bitstream conformance that whenever @display_frame_id is read, the value matches
 *   @ref_frame_id[ @frame_to_show_map_idx ] (the value of @current_frame_id at the time that the
 *   frame indexed by @frame_to_show_map_idx was stored), and that
 *   @ref_valid[ @frame_to_show_map_idx ] is equal to 1. It is a requirement of bitstream
 *   conformance that the number of bits needed to read @display_frame_id does not exceed 16.
 *   This is equivalent to the constraint that idLen <= 16
 * @frame_type: specifies the type of the frame.
 * @show_frame: equal to 1 specifies that this frame should be immediately output once decoded.
 *   show_frame equal to 0 specifies that this frame should not be immediately output. (It may
 *   be output later if a later uncompressed header uses @show_existing_frame equal to 1).
 * @showable_frame: equal to 1 specifies that the frame may be output using the
 *   @show_existing_frame mechanism. showable_frame equal to 0 specifies that this frame will
 *   not be output using the @show_existing_frame mechanism. It is a requirement of bitstream
 *   conformance that when @show_existing_frame is used to show a previous frame, that the
 *   value of @showable_frame for the previous frame was equal to 1. It is a requirement of
 *   bitstream conformance that a particular showable frame is output via the
 *   @show_existing_frame mechanism at most once.
 * @error_resilient_mode: equal to 1 indicates that error resilient mode is enabled;
 *   @error_resilient_mode equal to 0 indicates that error resilient mode is disabled.
 * @disable_cdf_update: specifies whether the CDF update in the symbol decoding process should
 *   be disabled.
 * @allow_screen_content_tools: equal to 1 indicates that intra blocks may use palette encoding;
 *   @allow_screen_content_tools equal to 0 indicates that palette encoding is never used.
 * @force_integer_mv: equal to 1 specifies that motion vectors will always be integers.
 *   @force_integer_mv equal to 0 specifies that motion vectors can contain fractional bits.
 * @current_frame_id: specifies the frame id number for the current frame. Frame id numbers
 *   are additional information that do not affect the decoding process, but provide decoders
 *   with a way of detecting missing reference frames so that appropriate action can be taken.
 * @frame_size_override_flag: equal to 0 specifies that the frame size is equal to the size in
 *   the sequence header. @frame_size_override_flag equal to 1 specifies that the frame size
 *   will either be specified as the size of one of the reference frames, or computed from the
 *   @frame_width_minus_1 and @frame_height_minus_1 syntax elements.
 * @order_hint: is used to compute order_hint.
 * @primary_ref_frame: specifies which reference frame contains the CDF values and other state
 *   that should be loaded at the start of the frame.
 * @buffer_removal_time_present_flag: equal to 1 specifies that @buffer_removal_time is present
 *   in the bitstream. @buffer_removal_time_present_flag equal to 0 specifies that
 *   @buffer_removal_time is not present in the bitstream.
 * @buffer_removal_time: specifies the frame removal time in units of DecCT clock ticks
 *   counted from the removal time of the last frame with frame_type equal to KEY_FRAME for
 *   operating point opNum. @buffer_removal_time is signaled as a fixed length unsigned integer
 *   with a length in bits given by @buffer_removal_time_length_minus_1 + 1. @buffer_removal_time
 *   is the remainder of a modulo 1 << ( @buffer_removal_time_length_minus_1 + 1 ) counter.
 * @refresh_frame_flags: contains a bitmask that specifies which reference frame slots will be
 *   updated with the current frame after it is decoded. If @frame_type is equal to
 *   %GST_AV1_INTRA_ONLY_FRAME, it is a requirement of bitstream conformance that
 *   @refresh_frame_flags is not equal to 0xff.
 * @ref_order_hint: specifies the expected output order hint for each reference buffer.
 * @allow_intrabc: equal to 1 indicates that intra block copy may be used in this frame.
 *   allow_intrabc equal to 0 indicates that intra block copy is not allowed in this frame.
 * @frame_refs_short_signaling: equal to 1 indicates that only two reference frames are
 *   explicitly signaled. frame_refs_short_signaling equal to 0 indicates that all reference
 *   frames are explicitly signaled.
 * @last_frame_idx: specifies the reference frame to use for LAST_FRAME.
 * @gold_frame_idx: specifies the reference frame to use for GOLDEN_FRAME.
 * @ref_frame_idx[i]: specifies which reference frames are used by inter frames.
 * @delta_frame_id_minus_1 is used to calculate @delta_frame_id.
 * @allow_high_precision_mv: equal to 0 specifies that motion vectors are specified to quarter
 *   pel precision; @allow_high_precision_mv equal to 1 specifies that motion vectors are
 *   specified to eighth pel precision.
 * @is_motion_mode_switchable: equal to 0 specifies that only the SIMPLE motion mode will be used.
 * @use_ref_frame_mvs: equal to 1 specifies that motion vector information from a previous
 *   frame can be used when decoding the current frame. @use_ref_frame_mvs equal to 0 specifies
 *   that this information will not be used.
 * @disable_frame_end_update_cdf: equal to 1 indicates that the end of frame CDF update is
 *   disabled; @disable_frame_end_update_cdf equal to 0 indicates that the end of frame CDF
 *   update is enabled.
 * @allow_warped_motion: equal to 1 indicates that the syntax element @motion_mode may be
 *   present. @allow_warped_motion equal to 0 indicates that the syntax element motion_mode
 *   will not be present (this means that LOCALWARP cannot be signaled if @allow_warped_motion
 *   is equal to 0).
 * @reduced_tx_set: equal to 1 specifies that the frame is restricted to a reduced subset of
 *   the full set of transform types.
 * @render_and_frame_size_different: equal to 0 means that the render width and height are
 *   inferred from the frame width and height. @render_and_frame_size_different equal to 1
 *   means that the render width and height are explicitly coded in the bitstream.
 * @use_superres: equal to 0 indicates that no upscaling is needed. @use_superres equal to 1
 *   indicates that upscaling is needed.
 * @is_filter_switchable: equal to 1 indicates that the filter selection is signaled at the
 *   block level; @is_filter_switchable equal to 0 indicates that the filter selection is
 *   signaled at the frame level.
 * @interpolation_filter: a #GstAV1InterpolationFilter that specifies the filter selection used
 *   for performing inter prediction.
 * @loop_filter_params: a #GstAV1LoopFilterParams holding the loop filter parameters.
 * @quantization_params: a #GstAV1QuantizationParams holding the quantization parameters.
 * @segmentation_params: a #GstAV1SegmentationParams holding the segmentation parameters.
 * @tile_info: a #GstAV1TileInfo holding the tile info.
 * @cdef_params: a #GstAV1CDEFParams holding the CDEF paramters.
 * @loop_restoration_params: a #GstAV1LoopRestorationParams holding the loop restoration parameters.
 * @tx_mode_select: is used to compute TxMode.
 * @skip_mode_present: equal to 1 specifies that the syntax element @skip_mode will be coded
 *   in the bitstream. @skip_mode_present equal to 0 specifies that @skip_mode will not be used
 *   for this frame.
 * @reference_select: equal to 1 specifies that the mode info for inter blocks contains the
 *   syntax element comp_mode that indicates whether to use single or compound reference
 *   prediction. Reference_select equal to 0 specifies that all interblocks will use single
 *   prediction.
 * @global_motion_params: a #GstAV1GlobalMotionParams holding the global motion parameters.
 * @film_grain_params: a #GstAV1FilmGrainParams holding the Film Grain parameters.
 * @superres_denom: is the denominator of a fraction that specifies the ratio between the
 *   superblock width before and after upscaling.
 * @frame_is_intra: if equal to 0 indicating that this frame may use inter prediction.
 * @order_hints: specifies the expected output order for each reference frame.
 * @ref_frame_sign_bias: specifies the intended direction of the motion vector in time for
 *   each reference frame.
 * @coded_lossless: is a variable that is equal to 1 when all segments use lossless encoding.
 * @all_lossless: is a variable that is equal to 1 when @coded_lossless is equal to 1 and
 *   @frame_width is equal to @upscaled_width. This indicates that the frame is fully lossless
 *   at the upscaled resolution.
 * @lossless_array: whether the segmentation is lossless.
 * @seg_qm_Level: the segmentation's qm level.
 * @upscaled_width: the upscaled width.
 * @frame_width: the frame width.
 * @frame_height: the frame height.
 * @render_width: the frame width to be rendered.
 * @render_height: the frame height to be rendered.
 * @tx_mode: specifies how the transform size is determined.
 * @skip_mode_frame: specifies the frames to use for compound prediction when @skip_mode is 1.
 * @expected_frame_id: specifies the frame id for each frame used for reference. (Since: 1.24)
 * @ref_global_motion_params: specifies the global motion parameters of the reference. (Since: 1.24)
  }
{ Global vars set by frame header  }
{ SuperresDenom  }
{ FrameIsIntra  }
{ OrderHints  }
{ RefFrameSignBias  }
{ CodedLossless  }
{ AllLossless  }
{ LosslessArray  }
{ SegQMLevel  }
{ UpscaledWidth  }
{ FrameWidth  }
{ FrameHeight  }
{ RenderWidth  }
{ RenderHeight  }
{ TxMode  }
{ SkipModeFrame  }
{*
   * _GstAV1FrameHeaderOBU.expected_frame_id:
   *
   * Specifies the frames to use for compound prediction.
   *
   * Since: 1.24
    }
{*
   * _GstAV1FrameHeaderOBU.ref_global_motion_params:
   *
   * Specifies the global motion parameters of the reference.
   *
   * Since: 1.24
    }
  PGstAV1FrameHeaderOBU = ^TGstAV1FrameHeaderOBU;
  TGstAV1FrameHeaderOBU = record
      show_existing_frame : Tgboolean;
      frame_to_show_map_idx : Tgint8;
      frame_presentation_time : Tguint32;
      tu_presentation_delay : Tguint32;
      display_frame_id : Tguint32;
      frame_type : TGstAV1FrameType;
      show_frame : Tgboolean;
      showable_frame : Tgboolean;
      error_resilient_mode : Tgboolean;
      disable_cdf_update : Tgboolean;
      allow_screen_content_tools : Tguint8;
      force_integer_mv : Tgboolean;
      current_frame_id : Tguint32;
      frame_size_override_flag : Tgboolean;
      order_hint : Tguint32;
      primary_ref_frame : Tguint8;
      buffer_removal_time_present_flag : Tgboolean;
      buffer_removal_time : array[0..(GST_AV1_MAX_OPERATING_POINTS)-1] of Tguint32;
      refresh_frame_flags : Tguint8;
      ref_order_hint : array[0..(GST_AV1_NUM_REF_FRAMES)-1] of Tguint32;
      allow_intrabc : Tgboolean;
      frame_refs_short_signaling : Tgboolean;
      last_frame_idx : Tgint8;
      gold_frame_idx : Tgint8;
      ref_frame_idx : array[0..(GST_AV1_REFS_PER_FRAME)-1] of Tgint8;
      allow_high_precision_mv : Tgboolean;
      is_motion_mode_switchable : Tgboolean;
      use_ref_frame_mvs : Tgboolean;
      disable_frame_end_update_cdf : Tgboolean;
      allow_warped_motion : Tgboolean;
      reduced_tx_set : Tgboolean;
      render_and_frame_size_different : Tgboolean;
      use_superres : Tgboolean;
      is_filter_switchable : Tgboolean;
      interpolation_filter : TGstAV1InterpolationFilter;
      loop_filter_params : TGstAV1LoopFilterParams;
      quantization_params : TGstAV1QuantizationParams;
      segmentation_params : TGstAV1SegmentationParams;
      tile_info : TGstAV1TileInfo;
      cdef_params : TGstAV1CDEFParams;
      loop_restoration_params : TGstAV1LoopRestorationParams;
      tx_mode_select : Tgboolean;
      skip_mode_present : Tgboolean;
      reference_select : Tgboolean;
      global_motion_params : TGstAV1GlobalMotionParams;
      film_grain_params : TGstAV1FilmGrainParams;
      superres_denom : Tguint32;
      frame_is_intra : Tguint8;
      order_hints : array[0..(GST_AV1_NUM_REF_FRAMES)-1] of Tguint32;
      ref_frame_sign_bias : array[0..(GST_AV1_NUM_REF_FRAMES)-1] of Tguint32;
      coded_lossless : Tguint8;
      all_lossless : Tguint8;
      lossless_array : array[0..(GST_AV1_MAX_SEGMENTS)-1] of Tguint8;
      seg_qm_Level : array[0..2] of array[0..(GST_AV1_MAX_SEGMENTS)-1] of Tguint8;
      upscaled_width : Tguint32;
      frame_width : Tguint32;
      frame_height : Tguint32;
      render_width : Tguint32;
      render_height : Tguint32;
      tx_mode : TGstAV1TXModes;
      skip_mode_frame : array[0..1] of Tguint8;
      expected_frame_id : array[0..(GST_AV1_REFS_PER_FRAME)-1] of Tgint32;
      ref_global_motion_params : TGstAV1GlobalMotionParams;
    end;

{*
 * GstAV1ReferenceFrameInfoEntry:
 *
  }
{ RefValid  }
{ RefFrameId  }
{ RefUpscaledWidth  }
{ RefFrameWidth  }
{ RefFrameHeight  }
{ RefRenderWidth  }
{ RefRenderHeight  }
{ RefMiCols  }
{ RefMiRows  }
{ RefFrameType  }
{ RefSubsamplingX  }
{ RefSubsamplingY  }
{ RefBitDepth  }
{ RefOrderHint  }
  PGstAV1ReferenceFrameInfoEntry = ^TGstAV1ReferenceFrameInfoEntry;
  TGstAV1ReferenceFrameInfoEntry = record
      ref_valid : Tgboolean;
      ref_frame_id : Tguint32;
      ref_upscaled_width : Tguint32;
      ref_frame_width : Tguint32;
      ref_frame_height : Tguint32;
      ref_render_width : Tguint32;
      ref_render_height : Tguint32;
      ref_mi_cols : Tguint32;
      ref_mi_rows : Tguint32;
      ref_frame_type : TGstAV1FrameType;
      ref_subsampling_x : Tguint8;
      ref_subsampling_y : Tguint8;
      ref_bit_depth : Tguint8;
      ref_order_hint : Tguint32;
      ref_segmentation_params : TGstAV1SegmentationParams;
      ref_global_motion_params : TGstAV1GlobalMotionParams;
      ref_lf_params : TGstAV1LoopFilterParams;
      ref_film_grain_params : TGstAV1FilmGrainParams;
      ref_tile_info : TGstAV1TileInfo;
    end;

{*
 * GstAV1ReferenceFrameInfo:
 *
 * All the info related to a reference frames.
  }
  PGstAV1ReferenceFrameInfo = ^TGstAV1ReferenceFrameInfo;
  TGstAV1ReferenceFrameInfo = record
      entry : array[0..(GST_AV1_NUM_REF_FRAMES)-1] of TGstAV1ReferenceFrameInfoEntry;
    end;

{*
 * GstAV1TileListOBUEntry:
 *
  }
{ Just refer to obu's data, invalid after OBU data released  }
  PGstAV1TileListOBUEntry = ^TGstAV1TileListOBUEntry;
  TGstAV1TileListOBUEntry = record
      anchor_frame_idx : Tgint8;
      anchor_tile_row : Tguint8;
      anchor_tile_col : Tguint8;
      tile_data_size_minus_1 : Tguint16;
      coded_tile_data : Pguint8;
    end;

{*
 * GstAV1TileListOBU:
 * @output_frame_width_in_tiles_minus_1: plus one is the width of the output frame, in tile units.
 * @output_frame_height_in_tiles_minus_1: plus one is the height of the output frame, in tile units.
 * @tile_count_minus_1: plus one is the number of @tile_list_entry in the list. It is a requirement
 *   of bitstream conformance that @tile_count_minus_1 is less than or equal to 511.
 * @anchor_frame_idx: is the index into an array AnchorFrames of the frames that the tile uses
 *   for prediction. The AnchorFrames array is provided by external means and may change for
 *   each tile list OBU. The process for creating the AnchorFrames array is outside of the
 *   scope of this specification. It is a requirement of bitstream conformance that
 *   @anchor_frame_idx is less than or equal to 127.
 * @anchor_tile_row: the row coordinate of the tile in the frame that it belongs, in tile
 *   units. It is a requirement of bitstream conformance that @anchor_tile_row is less than @tile_rows.
 * @anchor_tile_col: is the column coordinate of the tile in the frame that it belongs, in tile
 *   units. It is a requirement of bitstream conformance that @anchor_tile_col is less than @tile_cols.
 * @tile_data_size_minus_1: plus one is the size of the coded tile data, @coded_tile_data, in bytes.
 * @coded_tile_data: are the @tile_data_size_minus_1 + 1 bytes of the coded tile.
  }
  PGstAV1TileListOBU = ^TGstAV1TileListOBU;
  TGstAV1TileListOBU = record
      output_frame_width_in_tiles_minus_1 : Tguint8;
      output_frame_height_in_tiles_minus_1 : Tguint8;
      tile_count_minus_1 : Tguint16;
      entry : array[0..(GST_AV1_MAX_TILE_COUNT)-1] of TGstAV1TileListOBUEntry;
    end;

{*
 * GstAV1TileGroupOBUEntry:
 *
  }
{ Tile data offset from the OBU data.  }
{ Data size of this tile  }
{ tileRow  }
{ tileCol  }
{ global varialbes  }
{ MiRowStart  }
{ MiRowEnd  }
{ MiColStart  }
{ MiColEnd  }
  PGstAV1TileGroupOBUEntry = ^TGstAV1TileGroupOBUEntry;
  TGstAV1TileGroupOBUEntry = record
      tile_offset : Tguint32;
      tile_size : Tguint32;
      tile_row : Tguint32;
      tile_col : Tguint32;
      mi_row_start : Tguint32;
      mi_row_end : Tguint32;
      mi_col_start : Tguint32;
      mi_col_end : Tguint32;
    end;

{*
 * GstAV1TileGroupOBU:
 * @tile_start_and_end_present_flag: specifies whether @tg_start and @tg_end are present
 *   in the bitstream. If @tg_start and @tg_end are not present in the bitstream, this
 *   tile group covers the entire frame. If @obu_type is equal to %GST_AV1_OBU_FRAME, it is a
 *   requirement of bitstream conformance that the value of @tile_start_and_end_present_flag
 *   is equal to 0.
 * @tg_start: specifies the zero-based index of the first tile in the current tile group.
 *   It is a requirement of bitstream conformance that the value of @tg_start is equal to
 *   the value of TileNum at the point that tile_group_obu is invoked.
 * @tg_end: specifies the zero-based index of the last tile in the current tile group.
 *   It is a requirement of bitstream conformance that the value of tg_end is greater
 *   than or equal to tg_start. It is a requirement of bitstream conformance that the
 *   value of tg_end for the last tile group in each frame is equal to num_tiles-1.
 * @tile_offset: Offset from the OBU data, the real data start of this tile.
 * @tg_size: Data size of this tile.
 * @tile_row: Tile index in row.
 * @tile_col: Tile index in column.
 * @mi_row_start: start position in mi rows
 * @mi_row_end: end position in mi rows
 * @mi_col_start: start position in mi cols
 * @mi_col_end: end position in mi cols
 * @num_tiles: specifies the total number of tiles in the frame.
  }
{ NumTiles  }
  PGstAV1TileGroupOBU = ^TGstAV1TileGroupOBU;
  TGstAV1TileGroupOBU = record
      tile_start_and_end_present_flag : Tgboolean;
      tg_start : Tguint8;
      tg_end : Tguint8;
      entry : array[0..(GST_AV1_MAX_TILE_COUNT)-1] of TGstAV1TileGroupOBUEntry;
      num_tiles : Tguint32;
    end;

{*
 * GstAV1FrameOBU:
 * @frame_header: a #GstAV1FrameHeaderOBU holding frame_header data.
 * @tile_group: a #GstAV1TileGroupOBU holding tile_group data.
  }
  PGstAV1FrameOBU = ^TGstAV1FrameOBU;
  TGstAV1FrameOBU = record
      tile_group : TGstAV1TileGroupOBU;
      frame_header : TGstAV1FrameHeaderOBU;
    end;

{*
 * GstAV1ParserState:
 *
  }
{ Set by choose_operating_point()  }
{ SeenFrameHeader  }
{ OperatingPointIdc  }
{ Received a new sequence  }
{ already find the first frame  }
{ frame  }
{ UpscaledWidth  }
{ FrameWidth  }
{ FrameHeight  }
{ MiCols  }
{ MiRows  }
{ RenderWidth  }
{ RenderHeight  }
{ PrevFrameID  }
{ the current frame ID  }
{ RefInfo  }
{ MiColStarts  }
{ MiRowStarts  }
{ TileColsLog2  }
{ TileCols  }
{ TileRowsLog2  }
{ TileRows  }
{ TileSizeBytes  }
  PGstAV1ParserState = ^TGstAV1ParserState;
  TGstAV1ParserState = record
      operating_point : Tguint32;
      seen_frame_header : Tguint8;
      operating_point_idc : Tguint32;
      sequence_changed : Tgboolean;
      begin_first_frame : Tgboolean;
      upscaled_width : Tguint32;
      frame_width : Tguint32;
      frame_height : Tguint32;
      mi_cols : Tguint32;
      mi_rows : Tguint32;
      render_width : Tguint32;
      render_height : Tguint32;
      prev_frame_id : Tguint32;
      current_frame_id : Tguint32;
      ref_info : TGstAV1ReferenceFrameInfo;
      mi_col_starts : array[0..(GST_AV1_MAX_TILE_COLS+1)-1] of Tguint32;
      mi_row_starts : array[0..(GST_AV1_MAX_TILE_ROWS+1)-1] of Tguint32;
      tile_cols_log2 : Tguint8;
      tile_cols : Tguint8;
      tile_rows_log2 : Tguint8;
      tile_rows : Tguint8;
      tile_size_bytes : Tguint8;
    end;

{*
 * GstAV1Parser:
 *
 * #GstAV1Parser opaque structure
 *
 * Instantiante it with gst_av1_parser_new() and destroy it with
 * gst_av1_parser_free()
  }
{< private > }
{ consumed of this temporal unit  }
{ consumed of this frame unit  }
  PGstAV1Parser = ^TGstAV1Parser;
  TGstAV1Parser = record
      state : TGstAV1ParserState;
      annex_b : Tgboolean;
      temporal_unit_size : Tguint32;
      temporal_unit_consumed : Tguint32;
      frame_unit_size : Tguint32;
      frame_unit_consumed : Tguint32;
      seq_header : PGstAV1SequenceHeaderOBU;
    end;


procedure gst_av1_parser_reset(parser:PGstAV1Parser; annex_b:Tgboolean);cdecl;external;
procedure gst_av1_parser_reset_annex_b(parser:PGstAV1Parser);cdecl;external;
(* Const before type ignored *)
function gst_av1_parser_identify_one_obu(parser:PGstAV1Parser; data:Pguint8; size:Tguint32; obu:PGstAV1OBU; consumed:Pguint32):TGstAV1ParserResult;cdecl;external;
function gst_av1_parser_parse_sequence_header_obu(parser:PGstAV1Parser; obu:PGstAV1OBU; seq_header:PGstAV1SequenceHeaderOBU):TGstAV1ParserResult;cdecl;external;
function gst_av1_parser_parse_temporal_delimiter_obu(parser:PGstAV1Parser; obu:PGstAV1OBU):TGstAV1ParserResult;cdecl;external;
function gst_av1_parser_parse_metadata_obu(parser:PGstAV1Parser; obu:PGstAV1OBU; metadata:PGstAV1MetadataOBU):TGstAV1ParserResult;cdecl;external;
function gst_av1_parser_parse_tile_list_obu(parser:PGstAV1Parser; obu:PGstAV1OBU; tile_list:PGstAV1TileListOBU):TGstAV1ParserResult;cdecl;external;
function gst_av1_parser_parse_tile_group_obu(parser:PGstAV1Parser; obu:PGstAV1OBU; tile_group:PGstAV1TileGroupOBU):TGstAV1ParserResult;cdecl;external;
function gst_av1_parser_parse_frame_header_obu(parser:PGstAV1Parser; obu:PGstAV1OBU; frame_header:PGstAV1FrameHeaderOBU):TGstAV1ParserResult;cdecl;external;
function gst_av1_parser_parse_frame_obu(parser:PGstAV1Parser; obu:PGstAV1OBU; frame:PGstAV1FrameOBU):TGstAV1ParserResult;cdecl;external;
function gst_av1_parser_reference_frame_update(parser:PGstAV1Parser; frame_header:PGstAV1FrameHeaderOBU):TGstAV1ParserResult;cdecl;external;
function gst_av1_parser_set_operating_point(parser:PGstAV1Parser; operating_point:Tgint32):TGstAV1ParserResult;cdecl;external;
function gst_av1_parser_new:PGstAV1Parser;cdecl;external;
procedure gst_av1_parser_free(parser:PGstAV1Parser);cdecl;external;
{$endif}
{ __GST_AV1_PARSER_H__  }

implementation


end.
