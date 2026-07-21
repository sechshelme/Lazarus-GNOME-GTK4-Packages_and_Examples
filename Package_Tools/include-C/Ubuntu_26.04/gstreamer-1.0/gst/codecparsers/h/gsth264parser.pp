
unit gsth264parser;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsth264parser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsth264parser.h
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
PGArray  = ^GArray;
Pgchar  = ^gchar;
Pgint  = ^gint;
Pgsize  = ^gsize;
PGstBuffer  = ^GstBuffer;
PGstCtType  = ^GstCtType;
PGstH264BufferingPeriod  = ^GstH264BufferingPeriod;
PGstH264ClockTimestamp  = ^GstH264ClockTimestamp;
PGstH264ContentLightLevel  = ^GstH264ContentLightLevel;
PGstH264DecoderConfigRecord  = ^GstH264DecoderConfigRecord;
PGstH264DecRefPicMarking  = ^GstH264DecRefPicMarking;
PGstH264FramePacking  = ^GstH264FramePacking;
PGstH264FramePackingType  = ^GstH264FramePackingType;
PGstH264HRDParams  = ^GstH264HRDParams;
PGstH264Level  = ^GstH264Level;
PGstH264MasteringDisplayColourVolume  = ^GstH264MasteringDisplayColourVolume;
PGstH264NalParser  = ^GstH264NalParser;
PGstH264NalUnit  = ^GstH264NalUnit;
PGstH264NalUnitExtensionMVC  = ^GstH264NalUnitExtensionMVC;
PGstH264NalUnitExtensionType  = ^GstH264NalUnitExtensionType;
PGstH264NalUnitType  = ^GstH264NalUnitType;
PGstH264ParserResult  = ^GstH264ParserResult;
PGstH264PicTiming  = ^GstH264PicTiming;
PGstH264PPS  = ^GstH264PPS;
PGstH264PredWeightTable  = ^GstH264PredWeightTable;
PGstH264Profile  = ^GstH264Profile;
PGstH264RecoveryPoint  = ^GstH264RecoveryPoint;
PGstH264RefPicListModification  = ^GstH264RefPicListModification;
PGstH264RefPicMarking  = ^GstH264RefPicMarking;
PGstH264RegisteredUserData  = ^GstH264RegisteredUserData;
PGstH264SEIMessage  = ^GstH264SEIMessage;
PGstH264SEIPayloadType  = ^GstH264SEIPayloadType;
PGstH264SEIPicStructType  = ^GstH264SEIPicStructType;
PGstH264SEIUnhandledPayload  = ^GstH264SEIUnhandledPayload;
PGstH264SliceHdr  = ^GstH264SliceHdr;
PGstH264SliceType  = ^GstH264SliceType;
PGstH264SPS  = ^GstH264SPS;
PGstH264SPSExtMVC  = ^GstH264SPSExtMVC;
PGstH264SPSExtMVCLevelValue  = ^GstH264SPSExtMVCLevelValue;
PGstH264SPSExtMVCLevelValueOp  = ^GstH264SPSExtMVCLevelValueOp;
PGstH264SPSExtMVCView  = ^GstH264SPSExtMVCView;
PGstH264StereoVideoInfo  = ^GstH264StereoVideoInfo;
PGstH264UserDataUnregistered  = ^GstH264UserDataUnregistered;
PGstH264VUIParams  = ^GstH264VUIParams;
PGstMemory  = ^GstMemory;
Pguint16  = ^guint16;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Gstreamer
 * Copyright (C) <2011> Intel Corporation
 * Copyright (C) <2011> Collabora Ltd.
 * Copyright (C) <2011> Thibault Saunier <thibault.saunier@collabora.com>
 *
 * Some bits C-c,C-v'ed and s/4/3 from h264parse and videoparsers/h264parse.c:
 *    Copyright (C) <2010> Mark Nauwelaerts <mark.nauwelaerts@collabora.co.uk>
 *    Copyright (C) <2010> Collabora Multimedia
 *    Copyright (C) <2010> Nokia Corporation
 *
 *    (C) 2005 Michal Benes <michal.benes@itonis.tv>
 *    (C) 2008 Wim Taymans <wim.taymans@gmail.com>
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
{$ifndef __GST_H264_PARSER_H__}
{$define __GST_H264_PARSER_H__}
{$include <gst/gst.h>}
{$include <gst/codecparsers/codecparsers-prelude.h>}

const
  GST_H264_MAX_SPS_COUNT = 32;  
  GST_H264_MAX_PPS_COUNT = 256;  
  GST_H264_MAX_VIEW_COUNT = 1024;  
  GST_H264_MAX_VIEW_ID = GST_H264_MAX_VIEW_COUNT-1;  
{xxxxxxxx
#define GST_H264_IS_P_SLICE(slice)  (((slice)->type % 5) == GST_H264_P_SLICE)
#define GST_H264_IS_B_SLICE(slice)  (((slice)->type % 5) == GST_H264_B_SLICE)
#define GST_H264_IS_I_SLICE(slice)  (((slice)->type % 5) == GST_H264_I_SLICE)
#define GST_H264_IS_SP_SLICE(slice) (((slice)->type % 5) == GST_H264_SP_SLICE)
#define GST_H264_IS_SI_SLICE(slice) (((slice)->type % 5) == GST_H264_SI_SLICE)

  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_H264_IS_SVC_NALU(nalu : longint) : longint;

{*
 * GST_H264_IS_MVC_NALU:
 * @nalu: a #GstH264NalUnit
 *
 * Check if @nalu is a multiview extension NAL unit.
 *
 * Since: 1.6
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H264_IS_MVC_NALU(nalu : longint) : longint;

{*
 * GstH264Profile:
 * @GST_H264_PROFILE_BASELINE: Baseline profile (A.2.1)
 * @GST_H264_PROFILE_MAIN: Main profile (A.2.2)
 * @GST_H264_PROFILE_EXTENDED: Extended profile (A.2.3)
 * @GST_H264_PROFILE_HIGH: High profile (A.2.4),
 * or Progressive High profile (A.2.4.1), or Constrained High profile (A.2.4.2)
 * depending on constraint_set4_flag and constraint_set5_flag
 * @GST_H264_PROFILE_HIGH10: High 10 profile (A.2.5) or High 10 Intra
 *   profile (A.2.8), or Progressive High 10 profile (A.2.5.1) depending on
 *   constraint_set3_flag and constraint_set4_flag
 * @GST_H264_PROFILE_HIGH_422: High 4:2:2 profile (A.2.6) or High
 *   4:2:2 Intra profile (A.2.9), depending on constraint_set3_flag
 * @GST_H264_PROFILE_HIGH_444: High 4:4:4 Predictive profile (A.2.7)
 *   or High 4:4:4 Intra profile (A.2.10), depending on the value of
 *   constraint_set3_flag
 * @GST_H264_PROFILE_MULTIVIEW_HIGH: Multiview High profile (H.10.1.1)
 * @GST_H264_PROFILE_STEREO_HIGH: Stereo High profile (H.10.1.2)
 * @GST_H264_PROFILE_SCALABLE_BASELINE: Scalable Baseline profile (G.10.1.1)
 * @GST_H264_PROFILE_SCALABLE_HIGH: Scalable High profile (G.10.1.2)
 *   or Scalable High Intra profile (G.10.1.3), depending on the value
 *   of constraint_set3_flag
 *
 * H.264 Profiles.
 *
 * Since: 1.2
  }
{*
   * GST_H264_PROFILE_INVALID:
   *
   * Invalid H264 profile
   *
   * Since: 1.24
    }
type
  PGstH264Profile = ^TGstH264Profile;
  TGstH264Profile =  Longint;
  Const
    GST_H264_PROFILE_BASELINE = 66;
    GST_H264_PROFILE_MAIN = 77;
    GST_H264_PROFILE_EXTENDED = 88;
    GST_H264_PROFILE_HIGH = 100;
    GST_H264_PROFILE_HIGH10 = 110;
    GST_H264_PROFILE_HIGH_422 = 122;
    GST_H264_PROFILE_HIGH_444 = 244;
    GST_H264_PROFILE_MULTIVIEW_HIGH = 118;
    GST_H264_PROFILE_STEREO_HIGH = 128;
    GST_H264_PROFILE_SCALABLE_BASELINE = 83;
    GST_H264_PROFILE_SCALABLE_HIGH = 86;
    GST_H264_PROFILE_INVALID = -(1);
;
{*
 * GstH264NalUnitType:
 * @GST_H264_NAL_UNKNOWN: Unknown nal type
 * @GST_H264_NAL_SLICE: Slice nal
 * @GST_H264_NAL_SLICE_DPA: DPA slice nal
 * @GST_H264_NAL_SLICE_DPB: DPB slice nal
 * @GST_H264_NAL_SLICE_DPC: DPC slice nal
 * @GST_H264_NAL_SLICE_IDR: DPR slice nal
 * @GST_H264_NAL_SEI: Supplemental enhancement information (SEI) nal unit
 * @GST_H264_NAL_SPS: Sequence parameter set (SPS) nal unit
 * @GST_H264_NAL_PPS: Picture parameter set (PPS) nal unit
 * @GST_H264_NAL_AU_DELIMITER: Access unit (AU) delimiter nal unit
 * @GST_H264_NAL_SEQ_END: End of sequence nal unit
 * @GST_H264_NAL_STREAM_END: End of stream nal unit
 * @GST_H264_NAL_FILLER_DATA: Filler data nal lunit
 * @GST_H264_NAL_SPS_EXT: Sequence parameter set (SPS) extension NAL unit
 * @GST_H264_NAL_PREFIX_UNIT: Prefix NAL unit
 * @GST_H264_NAL_SUBSET_SPS: Subset sequence parameter set (SSPS) NAL unit
 * @GST_H264_NAL_DEPTH_SPS: Depth parameter set (DPS) NAL unit
 * @GST_H264_NAL_RSV_1: First reserved parameter
 * @GST_H264_NAL_RSV_2: Second reserved parameter
 * @GST_H264_NAL_SLICE_AUX: Auxiliary coded picture without partitioning NAL unit
 * @GST_H264_NAL_SLICE_EXT: Coded slice extension NAL unit
 * @GST_H264_NAL_SLICE_DEPTH: Coded slice extension for depth or 3D-AVC texture view
 *
 * Indicates the type of H264 Nal Units
  }
{*
   * GST_H264_NAL_RSV_1:
   *
   * First reserved parameter
   *
   * Since: 1.24
    }
{*
   * GST_H264_NAL_RSV_2:
   *
   * Second reserved parameter
   *
   * Since: 1.24
    }
type
  PGstH264NalUnitType = ^TGstH264NalUnitType;
  TGstH264NalUnitType =  Longint;
  Const
    GST_H264_NAL_UNKNOWN = 0;
    GST_H264_NAL_SLICE = 1;
    GST_H264_NAL_SLICE_DPA = 2;
    GST_H264_NAL_SLICE_DPB = 3;
    GST_H264_NAL_SLICE_DPC = 4;
    GST_H264_NAL_SLICE_IDR = 5;
    GST_H264_NAL_SEI = 6;
    GST_H264_NAL_SPS = 7;
    GST_H264_NAL_PPS = 8;
    GST_H264_NAL_AU_DELIMITER = 9;
    GST_H264_NAL_SEQ_END = 10;
    GST_H264_NAL_STREAM_END = 11;
    GST_H264_NAL_FILLER_DATA = 12;
    GST_H264_NAL_SPS_EXT = 13;
    GST_H264_NAL_PREFIX_UNIT = 14;
    GST_H264_NAL_SUBSET_SPS = 15;
    GST_H264_NAL_DEPTH_SPS = 16;
    GST_H264_NAL_RSV_1 = 17;
    GST_H264_NAL_RSV_2 = 18;
    GST_H264_NAL_SLICE_AUX = 19;
    GST_H264_NAL_SLICE_EXT = 20;
    GST_H264_NAL_SLICE_DEPTH = 21;
;
{*
 * GstH264NalUnitExtensionType:
 * @GST_H264_NAL_EXTENSION_NONE: No NAL unit header extension is available
 * @GST_H264_NAL_EXTENSION_SVC: NAL unit header extension for SVC (Annex G)
 * @GST_H264_NAL_EXTENSION_MVC: NAL unit header extension for MVC (Annex H)
 *
 * Indicates the type of H.264 NAL unit extension.
 *
 * Since: 1.6
  }
type
  PGstH264NalUnitExtensionType = ^TGstH264NalUnitExtensionType;
  TGstH264NalUnitExtensionType =  Longint;
  Const
    GST_H264_NAL_EXTENSION_NONE = 0;
    GST_H264_NAL_EXTENSION_SVC = 1;
    GST_H264_NAL_EXTENSION_MVC = 2;
;
{*
 * GstH264ParserResult:
 * @GST_H264_PARSER_OK: The parsing succeeded
 * @GST_H264_PARSER_BROKEN_DATA: The data to parse is broken
 * @GST_H264_PARSER_BROKEN_LINK: The link to structure needed for the parsing couldn't be found
 * @GST_H264_PARSER_ERROR: An error occurred when parsing
 * @GST_H264_PARSER_NO_NAL: No NAL unit found during the parsing
 * @GST_H264_PARSER_NO_NAL_END: Start of the NAL unit found, but not the end.
 *     This will be returned if no start/sync marker for the next NAL unit was
 *     found. In this case the parser will assume that the end of the data is
 *     also the end of the NAL unit. Whether this assumption is correct or not
 *     depends on the context, which only the caller can know, which is why a
 *     special result value is returned in this case. If the data is NAL-aligned
 *     then #GST_H264_PARSER_NO_NAL_END can be treated just like
 *     #GST_H264_PARSER_OK. If the data is not guaranteed to be NAL-aligned,
 *     then the caller probably wants to collect more data until there's another
 *     sync marker or the end of the stream has been reached.
 *
 * The result of parsing H264 data.
  }
type
  PGstH264ParserResult = ^TGstH264ParserResult;
  TGstH264ParserResult =  Longint;
  Const
    GST_H264_PARSER_OK = 0;
    GST_H264_PARSER_BROKEN_DATA = 1;
    GST_H264_PARSER_BROKEN_LINK = 2;
    GST_H264_PARSER_ERROR = 3;
    GST_H264_PARSER_NO_NAL = 4;
    GST_H264_PARSER_NO_NAL_END = 5;
;
{*
 * GstH264FramePackingType:
 * @GST_H264_FRAME_PACKING_NONE: A complete 2D frame without any frame packing
 * @GST_H264_FRAME_PACKING_CHECKERBOARD_INTERLEAVING: Checkerboard
 *   based interleaving
 * @GST_H264_FRAME_PACKING_COLUMN_INTERLEAVING: Column based interleaving
 * @GST_H264_FRAME_PACKING_ROW_INTERLEAVING: Row based interleaving
 * @GST_H264_FRAME_PACKING_SIDE_BY_SIDE: Side-by-side packing
 * @GST_H264_FRMAE_PACKING_TOP_BOTTOM: Deprecated; use GST_H264_FRAME_PACKING_TOP_BOTTOM instead
 * @GST_H264_FRAME_PACKING_TOP_BOTTOM: Top-Bottom packing (Since: 1.22)
 * @GST_H264_FRAME_PACKING_TEMPORAL_INTERLEAVING: Temporal interleaving
 *
 * Frame packing arrangement types.
 *
 * Since: 1.6
  }
{*
   * GST_H264_FRAME_PACKING_TOP_BOTTOM:
   *
   * Top-Bottom packing
   *
   * Since: 1.22
    }
type
  PGstH264FramePackingType = ^TGstH264FramePackingType;
  TGstH264FramePackingType =  Longint;
  Const
    GST_H264_FRAME_PACKING_NONE = 6;
    GST_H264_FRAME_PACKING_CHECKERBOARD_INTERLEAVING = 0;
    GST_H264_FRAME_PACKING_COLUMN_INTERLEAVING = 1;
    GST_H264_FRAME_PACKING_ROW_INTERLEAVING = 2;
    GST_H264_FRAME_PACKING_SIDE_BY_SIDE = 3;
    GST_H264_FRMAE_PACKING_TOP_BOTTOM = 4;
    GST_H264_FRAME_PACKING_TOP_BOTTOM = 4;
    GST_H264_FRAME_PACKING_TEMPORAL_INTERLEAVING = 5;
;
{*
 * GstH264SEIPayloadType:
 * @GST_H264_SEI_BUF_PERIOD: Buffering Period SEI Message
 * @GST_H264_SEI_PIC_TIMING: Picture Timing SEI Message
 * @GST_H264_SEI_REGISTERED_USER_DATA: Registered user data (D.2.5)
 * @GST_H264_SEI_RECOVERY_POINT: Recovery Point SEI Message (D.2.7)
 * @GST_H264_SEI_STEREO_VIDEO_INFO: stereo video info SEI message (Since: 1.6)
 * @GST_H264_SEI_FRAME_PACKING: Frame Packing Arrangement (FPA) message that
 *     contains the 3D arrangement for stereoscopic 3D video (Since: 1.6)
 * @GST_H264_SEI_MASTERING_DISPLAY_COLOUR_VOLUME: Mastering display colour volume information SEI message (D.2.29) (Since: 1.18)
 * @GST_H264_SEI_CONTENT_LIGHT_LEVEL: Content light level information SEI message (D.2.31) (Since: 1.18)
 * @GST_H264_SEI_UNHANDLED_PAYLOAD: Unhandled SEI message. This may or may not
 *     be defined by spec (Since 1.18)
 * ...
 *
 * The type of SEI message.
  }
{*
 * GST_H264_SEI_USER_DATA_UNREGISTERED:
 *
 * User Data Unregistered (D.2.6)
 *
 * Since: 1.22
  }
{ and more...   }
{ Unhandled SEI type  }
type
  PGstH264SEIPayloadType = ^TGstH264SEIPayloadType;
  TGstH264SEIPayloadType =  Longint;
  Const
    GST_H264_SEI_BUF_PERIOD = 0;
    GST_H264_SEI_PIC_TIMING = 1;
    GST_H264_SEI_REGISTERED_USER_DATA = 4;
    GST_H264_SEI_USER_DATA_UNREGISTERED = 5;
    GST_H264_SEI_RECOVERY_POINT = 6;
    GST_H264_SEI_STEREO_VIDEO_INFO = 21;
    GST_H264_SEI_FRAME_PACKING = 45;
    GST_H264_SEI_MASTERING_DISPLAY_COLOUR_VOLUME = 137;
    GST_H264_SEI_CONTENT_LIGHT_LEVEL = 144;
    GST_H264_SEI_UNHANDLED_PAYLOAD = -(1);
;
{*
 * GstH264SEIPicStructType:
 * @GST_H264_SEI_PIC_STRUCT_FRAME: Picture is a frame
 * @GST_H264_SEI_PIC_STRUCT_TOP_FIELD: Top field of frame
 * @GST_H264_SEI_PIC_STRUCT_BOTTOM_FIELD: Bottom field of frame
 * @GST_H264_SEI_PIC_STRUCT_TOP_BOTTOM: Top bottom field of frame
 * @GST_H264_SEI_PIC_STRUCT_BOTTOM_TOP: bottom top field of frame
 * @GST_H264_SEI_PIC_STRUCT_TOP_BOTTOM_TOP: top bottom top field of frame
 * @GST_H264_SEI_PIC_STRUCT_BOTTOM_TOP_BOTTOM: bottom top bottom field of frame
 * @GST_H264_SEI_PIC_STRUCT_FRAME_DOUBLING: indicates that the frame should
 *  be displayed two times consecutively
 * @GST_H264_SEI_PIC_STRUCT_FRAME_TRIPLING: indicates that the frame should be
 *  displayed three times consecutively
 *
 * SEI pic_struct type
  }
type
  PGstH264SEIPicStructType = ^TGstH264SEIPicStructType;
  TGstH264SEIPicStructType =  Longint;
  Const
    GST_H264_SEI_PIC_STRUCT_FRAME = 0;
    GST_H264_SEI_PIC_STRUCT_TOP_FIELD = 1;
    GST_H264_SEI_PIC_STRUCT_BOTTOM_FIELD = 2;
    GST_H264_SEI_PIC_STRUCT_TOP_BOTTOM = 3;
    GST_H264_SEI_PIC_STRUCT_BOTTOM_TOP = 4;
    GST_H264_SEI_PIC_STRUCT_TOP_BOTTOM_TOP = 5;
    GST_H264_SEI_PIC_STRUCT_BOTTOM_TOP_BOTTOM = 6;
    GST_H264_SEI_PIC_STRUCT_FRAME_DOUBLING = 7;
    GST_H264_SEI_PIC_STRUCT_FRAME_TRIPLING = 8;
;
{*
 * GstH264SliceType:
 *
 * Type of Picture slice
  }
type
  PGstH264SliceType = ^TGstH264SliceType;
  TGstH264SliceType =  Longint;
  Const
    GST_H264_P_SLICE = 0;
    GST_H264_B_SLICE = 1;
    GST_H264_I_SLICE = 2;
    GST_H264_SP_SLICE = 3;
    GST_H264_SI_SLICE = 4;
    GST_H264_S_P_SLICE = 5;
    GST_H264_S_B_SLICE = 6;
    GST_H264_S_I_SLICE = 7;
    GST_H264_S_SP_SLICE = 8;
    GST_H264_S_SI_SLICE = 9;
;
{*
 * GstH264CtType
 *
 * Mapping of ct_type to source picture scan
 *
 * Since: 1.16
  }
type
  PGstCtType = ^TGstCtType;
  TGstCtType =  Longint;
  Const
    GST_H264_CT_TYPE_PROGRESSIVE = 0;
    GST_H264_CT_TYPE_INTERLACED = 1;
    GST_H264_CT_TYPE_UNKNOWN = 2;
;
{*
 * GstH264Level:
 * @GST_H264_LEVEL_L1: Level 1
 * @GST_H264_LEVEL_L1B: Level 1b
 * @GST_H264_LEVEL_L1_1: Level 1.1
 * @GST_H264_LEVEL_L1_2: Level 1.2
 * @GST_H264_LEVEL_L1_3: Level 1.3
 * @GST_H264_LEVEL_L2: Level 2
 * @GST_H264_LEVEL_L2_1: Level 2.1
 * @GST_H264_LEVEL_L2_2: Level 2.2
 * @GST_H264_LEVEL_L3: Level 3
 * @GST_H264_LEVEL_L3_1: Level 3.1
 * @GST_H264_LEVEL_L3_2: Level 3.2
 * @GST_H264_LEVEL_L4: Level 4
 * @GST_H264_LEVEL_L4_1: Level 4.1
 * @GST_H264_LEVEL_L4_2: Level 4.2
 * @GST_H264_LEVEL_L5: Level 5
 * @GST_H264_LEVEL_L5_1: Level 5.1
 * @GST_H264_LEVEL_L5_2: Level 5.2
 * @GST_H264_LEVEL_L6: Level 6
 * @GST_H264_LEVEL_L6_1: Level 6.1
 * @GST_H264_LEVEL_L6_2: Level 6.2
 *
 * H.264 level
 *
 * Since: 1.24
  }
type
  PGstH264Level = ^TGstH264Level;
  TGstH264Level =  Longint;
  Const
    GST_H264_LEVEL_L1 = 10;
    GST_H264_LEVEL_L1B = 9;
    GST_H264_LEVEL_L1_1 = 11;
    GST_H264_LEVEL_L1_2 = 12;
    GST_H264_LEVEL_L1_3 = 13;
    GST_H264_LEVEL_L2 = 20;
    GST_H264_LEVEL_L2_1 = 21;
    GST_H264_LEVEL_L2_2 = 22;
    GST_H264_LEVEL_L3 = 30;
    GST_H264_LEVEL_L3_1 = 31;
    GST_H264_LEVEL_L3_2 = 32;
    GST_H264_LEVEL_L4 = 40;
    GST_H264_LEVEL_L4_1 = 41;
    GST_H264_LEVEL_L4_2 = 42;
    GST_H264_LEVEL_L5 = 50;
    GST_H264_LEVEL_L5_1 = 51;
    GST_H264_LEVEL_L5_2 = 52;
    GST_H264_LEVEL_L6 = 60;
    GST_H264_LEVEL_L6_1 = 61;
    GST_H264_LEVEL_L6_2 = 62;
;
type
{*
 * GstH264NalUnitExtensionMVC:
 * @non_idr_flag: If equal to 0, it specifies that the current access
 *   unit is an IDR access unit
 * @priority_id: The priority identifier for the NAL unit
 * @view_id: The view identifier for the NAL unit
 * @temporal_id: The temporal identifier for the NAL unit
 * @anchor_pic_flag: If equal to 1, it specifies that the current
 *   access unit is an anchor access unit
 * @inter_view_flag: If equal to 0, it specifies that the current view
 *   component is not used for inter-view prediction by any other view
 *   component in the current access unit
 *
 * Since: 1.6
  }
  PGstH264NalUnitExtensionMVC = ^TGstH264NalUnitExtensionMVC;
  TGstH264NalUnitExtensionMVC = record
      non_idr_flag : Tguint8;
      priority_id : Tguint8;
      view_id : Tguint16;
      temporal_id : Tguint8;
      anchor_pic_flag : Tguint8;
      inter_view_flag : Tguint8;
    end;

{*
 * GstH264NalUnit:
 * @ref_idc: not equal to 0 specifies that the content of the NAL unit
 *  contains a sequence parameter set, a sequence parameter set
 *  extension, a subset sequence parameter set, a picture parameter
 *  set, a slice of a reference picture, a slice data partition of a
 *  reference picture, or a prefix NAL unit preceding a slice of a
 *  reference picture.
 * @type: A #GstH264NalUnitType
 * @idr_pic_flag: calculated idr_pic_flag
 * @size: The size of the NAL unit starting from @offset, thus
 *  including the header bytes. e.g. @type (nal_unit_type),
 *  but not the start code.
 * @offset: The offset of the first byte of the NAL unit header,
 *  just after the start code.
 * @sc_offset: The offset of the first byte of the start code of
 *  the NAL unit.
 * @valid: If the NAL unit is valid, which means it has
 *  already been parsed
 * @data: The data array from which the NAL unit has been parsed,
 *  into which the offset and sc_offset apply.
 * @header_bytes: The size of the NALU header in bytes. The NALU
 *  header is the 1-byte type code, and for extension / prefix NALs
 *  includes the extension header bytes. @offset + @header_bytes is
 *  therefore the first byte of the actual packet payload.
 *  (Since: 1.6)
 * @extension_type: the extension type for prefix NAL/MVC/SVC
 *  (Since: 1.6)
 *
 * Structure defining the NAL unit headers
  }
{ calculated values  }
  PGstH264NalUnit = ^TGstH264NalUnit;
  TGstH264NalUnit = record
      ref_idc : Tguint16;
      _type : Tguint16;
      idr_pic_flag : Tguint8;
      size : Tguint;
      offset : Tguint;
      sc_offset : Tguint;
      valid : Tgboolean;
      data : Pguint8;
      header_bytes : Tguint8;
      extension_type : Tguint8;
      extension : record
          case longint of
            0 : ( mvc : TGstH264NalUnitExtensionMVC );
          end;
    end;

{*
 * GstH264HRDParams:
 * @cpb_cnt_minus1: plus 1 specifies the number of alternative
 *    CPB specifications in the bitstream
 * @bit_rate_scale: specifies the maximum input bit rate of the
 * SchedSelIdx-th CPB
 * @cpb_size_scale: specifies the CPB size of the SchedSelIdx-th CPB
 * @guint32 bit_rate_value_minus1: specifies the maximum input bit rate for the
 * SchedSelIdx-th CPB
 * @cpb_size_value_minus1: is used together with cpb_size_scale to specify the
 * SchedSelIdx-th CPB size
 * @cbr_flag: Specifies if running in constant or intermittent bit rate mode
 * @initial_cpb_removal_delay_length_minus1: specifies the length in bits of
 * the cpb_removal_delay syntax element
 * @cpb_removal_delay_length_minus1: specifies the length in bits of the
 * dpb_output_delay syntax element
 * @dpb_output_delay_length_minus1: >0 specifies the length in bits of the time_offset syntax element.
 * =0 specifies that the time_offset syntax element is not present
 * @time_offset_length: Length of the time offset
 *
 * Defines the HRD parameters
  }
  PGstH264HRDParams = ^TGstH264HRDParams;
  TGstH264HRDParams = record
      cpb_cnt_minus1 : Tguint8;
      bit_rate_scale : Tguint8;
      cpb_size_scale : Tguint8;
      bit_rate_value_minus1 : array[0..31] of Tguint32;
      cpb_size_value_minus1 : array[0..31] of Tguint32;
      cbr_flag : array[0..31] of Tguint8;
      initial_cpb_removal_delay_length_minus1 : Tguint8;
      cpb_removal_delay_length_minus1 : Tguint8;
      dpb_output_delay_length_minus1 : Tguint8;
      time_offset_length : Tguint8;
    end;

{*
 * GstH264VUIParams:
 * @aspect_ratio_info_present_flag: %TRUE specifies that aspect_ratio_idc is present.
 *  %FALSE specifies that aspect_ratio_idc is not present
 * @aspect_ratio_idc specifies the value of the sample aspect ratio of the luma samples
 * @sar_width indicates the horizontal size of the sample aspect ratio
 * @sar_height indicates the vertical size of the sample aspect ratio
 * @overscan_info_present_flag: %TRUE overscan_appropriate_flag is present %FALSE otherwise
 * @overscan_appropriate_flag: %TRUE indicates that the cropped decoded pictures
 *  output are suitable for display using overscan. %FALSE the cropped decoded pictures
 *  output contain visually important information
 * @video_signal_type_present_flag: %TRUE specifies that video_format, video_full_range_flag and
 *  colour_description_present_flag are present.
 * @video_format: indicates the representation of the picture
 * @video_full_range_flag: indicates the black level and range of the luma and chroma signals
 * @colour_description_present_flag: %TRUE specifies that colour_primaries,
 *  transfer_characteristics and matrix_coefficients are present
 * @colour_primaries: indicates the chromaticity coordinates of the source primaries
 * @transfer_characteristics: indicates the opto-electronic transfer characteristic
 * @matrix_coefficients: describes the matrix coefficients used in deriving luma and chroma signals
 * @chroma_loc_info_present_flag: %TRUE specifies that chroma_sample_loc_type_top_field and
 *  chroma_sample_loc_type_bottom_field are present, %FALSE otherwise
 * @chroma_sample_loc_type_top_field: specify the location of chroma for top field
 * @chroma_sample_loc_type_bottom_field specify the location of chroma for bottom field
 * @timing_info_present_flag: %TRUE specifies that num_units_in_tick,
 *  time_scale and fixed_frame_rate_flag are present in the bitstream
 * @num_units_in_tick: is the number of time units of a clock operating at the frequency time_scale Hz
 * time_scale: is the number of time units that pass in one second
 * @fixed_frame_rate_flag: %TRUE indicates that the temporal distance between the HRD output times
 *  of any two consecutive pictures in output order is constrained as specified in the spec, %FALSE
 *  otherwise.
 * @nal_hrd_parameters_present_flag: %TRUE if NAL HRD parameters exist in the bitstream
 * @vcl_hrd_parameters_present_flag: %TRUE if VCL HRD parameters exist in the bitstream
 * @low_delay_hrd_flag: specifies the HRD operational mode
 * @pic_struct_present_flag: %TRUE specifies that picture timing SEI messages are present or not
 * @bitstream_restriction_flag: %TRUE specifies that the following coded video sequence bitstream restriction
 * parameters are present
 * @motion_vectors_over_pic_boundaries_flag: %FALSE indicates that no sample outside the
 *  picture boundaries and no sample at a fractional sample position, %TRUE indicates that one or more
 *  samples outside picture boundaries may be used in inter prediction
 * @max_bytes_per_pic_denom: indicates a number of bytes not exceeded by the sum of the sizes of
 *  the VCL NAL units associated with any coded picture in the coded video sequence.
 * @max_bits_per_mb_denom: indicates the maximum number of coded bits of macroblock_layer
 * @log2_max_mv_length_horizontal: indicate the maximum absolute value of a decoded horizontal
 * motion vector component
 * @log2_max_mv_length_vertical: indicate the maximum absolute value of a decoded vertical
 *  motion vector component
 * @num_reorder_frames: indicates the maximum number of frames, complementary field pairs,
 *  or non-paired fields that precede any frame,
 * @max_dec_frame_buffering: specifies the required size of the HRD decoded picture buffer in
 *  units of frame buffers.
 *
 * The structure representing the VUI parameters.
  }
{ if aspect_ratio_idc == 255  }
{ if overscan_info_present_flag  }
{ if timing_info_present_flag  }
{ if nal_hrd_parameters_present_flag  }
{ if vcl_hrd_parameters_present_flag  }
{  if bitstream_restriction_flag  }
{ calculated values  }
  PGstH264VUIParams = ^TGstH264VUIParams;
  TGstH264VUIParams = record
      aspect_ratio_info_present_flag : Tguint8;
      aspect_ratio_idc : Tguint8;
      sar_width : Tguint16;
      sar_height : Tguint16;
      overscan_info_present_flag : Tguint8;
      overscan_appropriate_flag : Tguint8;
      video_signal_type_present_flag : Tguint8;
      video_format : Tguint8;
      video_full_range_flag : Tguint8;
      colour_description_present_flag : Tguint8;
      colour_primaries : Tguint8;
      transfer_characteristics : Tguint8;
      matrix_coefficients : Tguint8;
      chroma_loc_info_present_flag : Tguint8;
      chroma_sample_loc_type_top_field : Tguint8;
      chroma_sample_loc_type_bottom_field : Tguint8;
      timing_info_present_flag : Tguint8;
      num_units_in_tick : Tguint32;
      time_scale : Tguint32;
      fixed_frame_rate_flag : Tguint8;
      nal_hrd_parameters_present_flag : Tguint8;
      nal_hrd_parameters : TGstH264HRDParams;
      vcl_hrd_parameters_present_flag : Tguint8;
      vcl_hrd_parameters : TGstH264HRDParams;
      low_delay_hrd_flag : Tguint8;
      pic_struct_present_flag : Tguint8;
      bitstream_restriction_flag : Tguint8;
      motion_vectors_over_pic_boundaries_flag : Tguint8;
      max_bytes_per_pic_denom : Tguint32;
      max_bits_per_mb_denom : Tguint32;
      log2_max_mv_length_horizontal : Tguint32;
      log2_max_mv_length_vertical : Tguint32;
      num_reorder_frames : Tguint32;
      max_dec_frame_buffering : Tguint32;
      par_n : Tguint;
      par_d : Tguint;
    end;

{*
 * GstH264SPSExtMVCView:
 * @num_anchor_refs_l0: specifies the number of view components for
 *   inter-view prediction in the initialized RefPicList0 in decoding
 *   anchor view components.
 * @anchor_ref_l0: specifies the view_id for inter-view prediction in
 *   the initialized RefPicList0 in decoding anchor view components.
 * @num_anchor_refs_l1: specifies the number of view components for
 *   inter-view prediction in the initialized RefPicList1 in decoding
 *   anchor view components.
 * @anchor_ref_l1: specifies the view_id for inter-view prediction in
 *   the initialized RefPicList1 in decoding anchor view components.
 * @num_non_anchor_refs_l0: specifies the number of view components
 *   for inter-view prediction in the initialized RefPicList0 in
 *   decoding non-anchor view components.
 * @non_anchor_ref_l0: specifies the view_id for inter-view prediction
 *   in the initialized RefPicList0 in decoding non-anchor view
 *   components.
 * @num_non_anchor_refs_l1: specifies the number of view components
 *   for inter-view prediction in the initialized RefPicList1 in
 *   decoding non-anchor view components.
 * @non_anchor_ref_l1: specifies the view_id for inter-view prediction
 *   in the initialized RefPicList1 in decoding non-anchor view
 *   components.
 *
 * Represents inter-view dependency relationships for the coded video
 * sequence.
 *
 * Since: 1.6
  }
  PGstH264SPSExtMVCView = ^TGstH264SPSExtMVCView;
  TGstH264SPSExtMVCView = record
      view_id : Tguint16;
      num_anchor_refs_l0 : Tguint8;
      anchor_ref_l0 : array[0..14] of Tguint16;
      num_anchor_refs_l1 : Tguint8;
      anchor_ref_l1 : array[0..14] of Tguint16;
      num_non_anchor_refs_l0 : Tguint8;
      non_anchor_ref_l0 : array[0..14] of Tguint16;
      num_non_anchor_refs_l1 : Tguint8;
      non_anchor_ref_l1 : array[0..14] of Tguint16;
    end;

{*
 * GstH264SPSExtMVCLevelValueOp:
 *
 * Represents an operation point for the coded video sequence.
 *
 * Since: 1.6
  }
  PGstH264SPSExtMVCLevelValueOp = ^TGstH264SPSExtMVCLevelValueOp;
  TGstH264SPSExtMVCLevelValueOp = record
      temporal_id : Tguint8;
      num_target_views_minus1 : Tguint16;
      target_view_id : Pguint16;
      num_views_minus1 : Tguint16;
    end;

{*
 * GstH264SPSExtMVCLevelValue:
 * @level_idc: specifies the level value signalled for the coded video
 *   sequence
 * @num_applicable_ops_minus1: plus 1 specifies the number of
 *   operation points to which the level indicated by level_idc applies
 * @applicable_op: specifies the applicable operation point
 *
 * Represents level values for a subset of the operation points for
 * the coded video sequence.
 *
 * Since: 1.6
  }
  PGstH264SPSExtMVCLevelValue = ^TGstH264SPSExtMVCLevelValue;
  TGstH264SPSExtMVCLevelValue = record
      level_idc : Tguint8;
      num_applicable_ops_minus1 : Tguint16;
      applicable_op : PGstH264SPSExtMVCLevelValueOp;
    end;

{*
 * GstH264SPSExtMVC:
 * @num_views_minus1: plus 1 specifies the maximum number of coded
 *   views in the coded video sequence
 * @view: array of #GstH264SPSExtMVCView
 * @num_level_values_signalled_minus1: plus 1 specifies the number of
 *   level values signalled for the coded video sequence.
 * @level_value: array of #GstH264SPSExtMVCLevelValue
 *
 * Represents the parsed `seq_parameter_set_mvc_extension()`.
 *
 * Since: 1.6
	  }
  PGstH264SPSExtMVC = ^TGstH264SPSExtMVC;
  TGstH264SPSExtMVC = record
      num_views_minus1 : Tguint16;
      view : PGstH264SPSExtMVCView;
      num_level_values_signalled_minus1 : Tguint8;
      level_value : PGstH264SPSExtMVCLevelValue;
    end;

{*
 * GstH264SPS:
 * @id: The ID of the sequence parameter set
 * @profile_idc: indicate the profile to which the coded video sequence conforms
 *
 * H264 Sequence Parameter Set (SPS)
  }
{ if pic_order_cnt_type == 0  }
{ else if pic_order_cnt_type == 1  }
{ FIXME rename according to spec, max_num_ref_frames  }
{ if frame_cropping_flag  }
{ if vui_parameters_present_flag  }
{ calculated values  }
{ FIXME: remove  }
{ Subset SPS extensions  }
  PGstH264SPS = ^TGstH264SPS;
  TGstH264SPS = record
      id : Tgint;
      profile_idc : Tguint8;
      constraint_set0_flag : Tguint8;
      constraint_set1_flag : Tguint8;
      constraint_set2_flag : Tguint8;
      constraint_set3_flag : Tguint8;
      constraint_set4_flag : Tguint8;
      constraint_set5_flag : Tguint8;
      level_idc : Tguint8;
      chroma_format_idc : Tguint8;
      separate_colour_plane_flag : Tguint8;
      bit_depth_luma_minus8 : Tguint8;
      bit_depth_chroma_minus8 : Tguint8;
      qpprime_y_zero_transform_bypass_flag : Tguint8;
      scaling_matrix_present_flag : Tguint8;
      scaling_lists_4x4 : array[0..5] of array[0..15] of Tguint8;
      scaling_lists_8x8 : array[0..5] of array[0..63] of Tguint8;
      log2_max_frame_num_minus4 : Tguint8;
      pic_order_cnt_type : Tguint8;
      log2_max_pic_order_cnt_lsb_minus4 : Tguint8;
      delta_pic_order_always_zero_flag : Tguint8;
      offset_for_non_ref_pic : Tgint32;
      offset_for_top_to_bottom_field : Tgint32;
      num_ref_frames_in_pic_order_cnt_cycle : Tguint8;
      offset_for_ref_frame : array[0..254] of Tgint32;
      num_ref_frames : Tguint32;
      gaps_in_frame_num_value_allowed_flag : Tguint8;
      pic_width_in_mbs_minus1 : Tguint32;
      pic_height_in_map_units_minus1 : Tguint32;
      frame_mbs_only_flag : Tguint8;
      mb_adaptive_frame_field_flag : Tguint8;
      direct_8x8_inference_flag : Tguint8;
      frame_cropping_flag : Tguint8;
      frame_crop_left_offset : Tguint32;
      frame_crop_right_offset : Tguint32;
      frame_crop_top_offset : Tguint32;
      frame_crop_bottom_offset : Tguint32;
      vui_parameters_present_flag : Tguint8;
      vui_parameters : TGstH264VUIParams;
      chroma_array_type : Tguint8;
      max_frame_num : Tguint32;
      width : Tgint;
      height : Tgint;
      crop_rect_width : Tgint;
      crop_rect_height : Tgint;
      crop_rect_x : Tgint;
      crop_rect_y : Tgint;
      fps_num_removed : Tgint;
      fps_den_removed : Tgint;
      valid : Tgboolean;
      extension_type : Tguint8;
      extension : record
          case longint of
            0 : ( mvc : TGstH264SPSExtMVC );
          end;
    end;

{*
 * GstH264PPS:
 *
 * H264 Picture Parameter Set
  }
{ if num_slice_groups_minus1 > 0  }
{ and if slice_group_map_type == 0  }
{ or if slice_group_map_type == 2  }
{ or if slice_group_map_type == (3, 4, 5)  }
{ or if slice_group_map_type == 6  }
{ FIXME rename to num_ref_idx_l0,1_default_active_minus1  }
{ Since: 1.18  }
{*
   * _GstH264PPS.sps_id:
   *
   * SPS id
   *
   * Since: 1.28
    }
  PGstH264PPS = ^TGstH264PPS;
  TGstH264PPS = record
      id : Tgint;
      sequence : PGstH264SPS;
      entropy_coding_mode_flag : Tguint8;
      pic_order_present_flag : Tguint8;
      num_slice_groups_minus1 : Tguint32;
      slice_group_map_type : Tguint8;
      run_length_minus1 : array[0..7] of Tguint32;
      top_left : array[0..7] of Tguint32;
      bottom_right : array[0..7] of Tguint32;
      slice_group_change_direction_flag : Tguint8;
      slice_group_change_rate_minus1 : Tguint32;
      pic_size_in_map_units_minus1 : Tguint32;
      slice_group_id : Pguint8;
      num_ref_idx_l0_active_minus1 : Tguint8;
      num_ref_idx_l1_active_minus1 : Tguint8;
      weighted_pred_flag : Tguint8;
      weighted_bipred_idc : Tguint8;
      pic_init_qp_minus26 : Tgint8;
      pic_init_qs_minus26 : Tgint8;
      chroma_qp_index_offset : Tgint8;
      deblocking_filter_control_present_flag : Tguint8;
      constrained_intra_pred_flag : Tguint8;
      redundant_pic_cnt_present_flag : Tguint8;
      transform_8x8_mode_flag : Tguint8;
      scaling_lists_4x4 : array[0..5] of array[0..15] of Tguint8;
      scaling_lists_8x8 : array[0..5] of array[0..63] of Tguint8;
      second_chroma_qp_index_offset : Tgint8;
      valid : Tgboolean;
      pic_scaling_matrix_present_flag : Tguint8;
      sps_id : Tguint;
    end;

{ if modification_of_pic_nums_idc == 0 || 1  }
{ if modification_of_pic_nums_idc == 2  }
{ if modification_of_pic_nums_idc == 4 || 5  }
  PGstH264RefPicListModification = ^TGstH264RefPicListModification;
  TGstH264RefPicListModification = record
      modification_of_pic_nums_idc : Tguint8;
      value : record
          case longint of
            0 : ( abs_diff_pic_num_minus1 : Tguint32 );
            1 : ( long_term_pic_num : Tguint32 );
            2 : ( abs_diff_view_idx_minus1 : Tguint32 );
          end;
    end;

{ if seq->ChromaArrayType != 0  }
{ if slice->slice_type % 5 == 1  }
{ and if seq->ChromaArrayType != 0  }
  PGstH264PredWeightTable = ^TGstH264PredWeightTable;
  TGstH264PredWeightTable = record
      luma_log2_weight_denom : Tguint8;
      chroma_log2_weight_denom : Tguint8;
      luma_weight_l0 : array[0..31] of Tgint16;
      luma_offset_l0 : array[0..31] of Tgint8;
      chroma_weight_l0 : array[0..31] of array[0..1] of Tgint16;
      chroma_offset_l0 : array[0..31] of array[0..1] of Tgint8;
      luma_weight_l1 : array[0..31] of Tgint16;
      luma_offset_l1 : array[0..31] of Tgint8;
      chroma_weight_l1 : array[0..31] of array[0..1] of Tgint16;
      chroma_offset_l1 : array[0..31] of array[0..1] of Tgint8;
    end;

  PGstH264RefPicMarking = ^TGstH264RefPicMarking;
  TGstH264RefPicMarking = record
      memory_management_control_operation : Tguint8;
      difference_of_pic_nums_minus1 : Tguint32;
      long_term_pic_num : Tguint32;
      long_term_frame_idx : Tguint32;
      max_long_term_frame_idx_plus1 : Tguint32;
    end;

{ if slice->nal_unit.IdrPicFlag  }
{ Size of the dec_ref_pic_marking() syntax element in bits (Since: 1.18)  }
  PGstH264DecRefPicMarking = ^TGstH264DecRefPicMarking;
  TGstH264DecRefPicMarking = record
      no_output_of_prior_pics_flag : Tguint8;
      long_term_reference_flag : Tguint8;
      adaptive_ref_pic_marking_mode_flag : Tguint8;
      ref_pic_marking : array[0..9] of TGstH264RefPicMarking;
      n_ref_pic_marking : Tguint8;
      bit_size : Tguint;
    end;

{ if seq->separate_colour_plane_flag  }
{ if nal_unit.type == 5  }
{ if seq->pic_order_cnt_type == 0  }
{ if seq->pic_order_present_flag && !field_pic_flag  }
{ if slice_type == B_SLICE  }
{ if nal_unit.ref_idc != 0  }
{ calculated values  }
{ Size of the slice_header() in bits  }
{ Number of emulation prevention bytes (EPB) in this slice_header()  }
{ Since: 1.18  }
{
   * Size of the pic_order_cnt related syntax elements pic_order_cnt_lsb,
   * delta_pic_order_cnt_bottom, delta_pic_order_cnt[0], and
   * delta_pic_order_cnt[1]. (Since: 1.18)
    }
{*
  * _GstH264SliceHdr.pps_id:
  *
  * PPS id
  *
  * Since: 1.28
   }
  PGstH264SliceHdr = ^TGstH264SliceHdr;
  TGstH264SliceHdr = record
      first_mb_in_slice : Tguint32;
      _type : Tguint32;
      pps : PGstH264PPS;
      colour_plane_id : Tguint8;
      frame_num : Tguint16;
      field_pic_flag : Tguint8;
      bottom_field_flag : Tguint8;
      idr_pic_id : Tguint16;
      pic_order_cnt_lsb : Tguint16;
      delta_pic_order_cnt_bottom : Tgint32;
      delta_pic_order_cnt : array[0..1] of Tgint32;
      redundant_pic_cnt : Tguint8;
      direct_spatial_mv_pred_flag : Tguint8;
      num_ref_idx_l0_active_minus1 : Tguint8;
      num_ref_idx_l1_active_minus1 : Tguint8;
      ref_pic_list_modification_flag_l0 : Tguint8;
      n_ref_pic_list_modification_l0 : Tguint8;
      ref_pic_list_modification_l0 : array[0..31] of TGstH264RefPicListModification;
      ref_pic_list_modification_flag_l1 : Tguint8;
      n_ref_pic_list_modification_l1 : Tguint8;
      ref_pic_list_modification_l1 : array[0..31] of TGstH264RefPicListModification;
      pred_weight_table : TGstH264PredWeightTable;
      dec_ref_pic_marking : TGstH264DecRefPicMarking;
      cabac_init_idc : Tguint8;
      slice_qp_delta : Tgint8;
      slice_qs_delta : Tgint8;
      disable_deblocking_filter_idc : Tguint8;
      slice_alpha_c0_offset_div2 : Tgint8;
      slice_beta_offset_div2 : Tgint8;
      slice_group_change_cycle : Tguint16;
      max_pic_num : Tguint32;
      valid : Tgboolean;
      header_size : Tguint;
      n_emulation_prevention_bytes : Tguint;
      num_ref_idx_active_override_flag : Tguint8;
      sp_for_switch_flag : Tguint8;
      pic_order_cnt_bit_size : Tguint;
      pps_id : Tguint;
    end;

{*
 * GstH264ClockTimestamp:
 * @ct_type: indicates the scan type, 0: progressive, 1: interlaced, 2: unknown,
 *   3: reserved
 * @nuit_field_based_flag: used in calculating clockTimestamp
 * @counting_type: specifies the method of dropping values of the n_frames
 * @full_timestamp_flag: equal to 1 specifies that the n_frames syntax element
 *   is followed by seconds_value, minutes_value, and hours_value (Since 1.18)
 * @discontinuity_flag: indicates whether the difference between the current
 *   value of clockTimestamp and the value of clockTimestamp computed from the
 *   previous clock timestamp can be interpreted as the time difference or not.
 * @cnt_dropped_flag: specifies the skipping of one or more values of n_frames
 *   using the counting method specified by counting_type
 * @n_frames: specifies the value of nFrames used to compute clockTimestamp
 * @seconds_flag: equal to 1 specifies that @seconds_value and minutes_flag are
 *   present when @full_timestamp_flag is equal to 0
 * @seconds_value: specifies the value of seconds to compute clockTimestamp
 * @minutes_flag: equal to 1 specifies that @minutes_value and hours_flag are
 *   present when @full_timestamp_flag is equal to 0 and @seconds_flag is
 *   equal to 1
 * @minutes_value: specifies the value of minutes to compute clockTimestamp
 * @hours_flag: equal to 1 specifies that @hours_value is present when
 *   @full_timestamp_flag is equal to 0 and @seconds_flag is equal to 1 and
 *   @minutes_flag is equal to 1
 * @time_offset: specifies the value of tOffset used to compute clockTimestamp
  }
  PGstH264ClockTimestamp = ^TGstH264ClockTimestamp;
  TGstH264ClockTimestamp = record
      ct_type : Tguint8;
      nuit_field_based_flag : Tguint8;
      counting_type : Tguint8;
      full_timestamp_flag : Tguint8;
      discontinuity_flag : Tguint8;
      cnt_dropped_flag : Tguint8;
      n_frames : Tguint8;
      seconds_flag : Tguint8;
      seconds_value : Tguint8;
      minutes_flag : Tguint8;
      minutes_value : Tguint8;
      hours_flag : Tguint8;
      hours_value : Tguint8;
      time_offset : Tguint32;
    end;

{*
 * GstH264FramePacking:
 *
 * Since: 1.6
  }
{ GstH264FramePackingType  }
  PGstH264FramePacking = ^TGstH264FramePacking;
  TGstH264FramePacking = record
      frame_packing_id : Tguint32;
      frame_packing_cancel_flag : Tguint8;
      frame_packing_type : Tguint8;
      quincunx_sampling_flag : Tguint8;
      content_interpretation_type : Tguint8;
      spatial_flipping_flag : Tguint8;
      frame0_flipped_flag : Tguint8;
      field_views_flag : Tguint8;
      current_frame_is_frame0_flag : Tguint8;
      frame0_self_contained_flag : Tguint8;
      frame1_self_contained_flag : Tguint8;
      frame0_grid_position_x : Tguint8;
      frame0_grid_position_y : Tguint8;
      frame1_grid_position_x : Tguint8;
      frame1_grid_position_y : Tguint8;
      frame_packing_repetition_period : Tguint16;
    end;

{*
 * GstH264StereoVideoInfo:
 *
 * Since: 1.6
  }
  PGstH264StereoVideoInfo = ^TGstH264StereoVideoInfo;
  TGstH264StereoVideoInfo = record
      field_views_flag : Tguint8;
      top_field_is_left_view_flag : Tguint8;
      current_frame_is_left_view_flag : Tguint8;
      next_frame_is_second_view_flag : Tguint8;
      left_view_self_contained_flag : Tguint8;
      right_view_self_contained_flag : Tguint8;
    end;

{*
 * GstH264PicTiming:
 * @CpbDpbDelaysPresentFlag: non-zero if linked
 *   GstH264VUIParams::nal_hrd_parameters_present_flag or
 *   GstH264VUIParams::vcl_hrd_parameters_present_flag is non-zero (Since: 1.18)
 * @cpb_removal_delay_length_minus1: specifies the length of @cpb_removal_delay
 *   in bits (Since 1.18)
 * @dpb_output_delay_length_minus1: specifies the length of @dpb_output_delay
 *   in bits (Since 1.18)
 * @cpb_removal_delay: specifies how many clock ticks to wait after removal from
 *   the CPB of the access unit associated with the most recent buffering period
 *   SEI message in a preceding access unit before removing from the
 *   buffer the access unit data associated with the picture timing SEI message
 * @dpb_output_delay: used to compute the DPB output time of the picture
 * @pic_struct_present_flag: GstH264VUIParams::pic_struct_present_flag
 * @pic_struct: indicates whether a picture should be displayed as a frame or
 *   one or more fields
 * @clock_timestamp_flag: equal to 1 indicates that a number of clock timestamp
 *   syntax elements are present
 * @clock_timestamp: a #GstH264ClockTimestamp
 * @time_offset_length: specifies the length time_offset of
 *   #GstH264ClockTimestamp in bits (Since 1.18)
  }
{ from vui  }
{ if CpbDpbDelaysPresentFlag  }
{ if pic_struct_present_flag  }
  PGstH264PicTiming = ^TGstH264PicTiming;
  TGstH264PicTiming = record
      CpbDpbDelaysPresentFlag : Tguint8;
      cpb_removal_delay_length_minus1 : Tguint8;
      dpb_output_delay_length_minus1 : Tguint8;
      cpb_removal_delay : Tguint32;
      dpb_output_delay : Tguint32;
      pic_struct_present_flag : Tguint8;
      pic_struct : Tguint8;
      clock_timestamp_flag : array[0..2] of Tguint8;
      clock_timestamp : array[0..2] of TGstH264ClockTimestamp;
      time_offset_length : Tguint8;
    end;

{*
 * GstH264RegisteredUserData:
 * The User data registered by Rec. ITU-T T.35 SEI messag.
 * @country_code: an itu_t_t35_country_code.
 * @country_code_extension: an itu_t_t35_country_code_extension_byte.
 *   Should be ignored when @country_code is not 0xff
 * @data: the data of itu_t_t35_payload_byte
 *   excluding @country_code and @country_code_extension
 * @size: the size of @data in bytes
 *
 * Since: 1.16
  }
(* Const before type ignored *)
  PGstH264RegisteredUserData = ^TGstH264RegisteredUserData;
  TGstH264RegisteredUserData = record
      country_code : Tguint8;
      country_code_extension : Tguint8;
      data : Pguint8;
      size : Tguint;
    end;

{*
 * GstH264UserDataUnregistered:
 * @uuid: an uuid_iso_iec_11578.
 * @data: the data of user_data_payload_byte
 * @size: the size of @data in bytes
 *
 * The User data unregistered SEI message syntax.
 *
 * Since: 1.22
  }
(* Const before type ignored *)
  PGstH264UserDataUnregistered = ^TGstH264UserDataUnregistered;
  TGstH264UserDataUnregistered = record
      uuid : array[0..15] of Tguint8;
      data : Pguint8;
      size : Tguint;
    end;

{ seq->vui_parameters->nal_hrd_parameters_present_flag  }
{ seq->vui_parameters->vcl_hrd_parameters_present_flag  }
  PGstH264BufferingPeriod = ^TGstH264BufferingPeriod;
  TGstH264BufferingPeriod = record
      sps : PGstH264SPS;
      nal_initial_cpb_removal_delay : array[0..31] of Tguint32;
      nal_initial_cpb_removal_delay_offset : array[0..31] of Tguint32;
      vcl_initial_cpb_removal_delay : array[0..31] of Tguint32;
      vcl_initial_cpb_removal_delay_offset : array[0..31] of Tguint32;
    end;

  PGstH264RecoveryPoint = ^TGstH264RecoveryPoint;
  TGstH264RecoveryPoint = record
      recovery_frame_cnt : Tguint32;
      exact_match_flag : Tguint8;
      broken_link_flag : Tguint8;
      changing_slice_group_idc : Tguint8;
    end;

{*
 * GstH264MasteringDisplayColourVolume:
 * The colour volume (primaries, white point and luminance range) of display
 * defined by SMPTE ST 2086.
 *
 * D.2.29
 *
 * Since: 1.18
  }
  PGstH264MasteringDisplayColourVolume = ^TGstH264MasteringDisplayColourVolume;
  TGstH264MasteringDisplayColourVolume = record
      display_primaries_x : array[0..2] of Tguint16;
      display_primaries_y : array[0..2] of Tguint16;
      white_point_x : Tguint16;
      white_point_y : Tguint16;
      max_display_mastering_luminance : Tguint32;
      min_display_mastering_luminance : Tguint32;
    end;

{*
 * GstH264ContentLightLevel:
 * The upper bounds for the nominal target brightness light level
 * as specified in CEA-861.3
 *
 * D.2.31
 *
 * Since: 1.18
  }
  PGstH264ContentLightLevel = ^TGstH264ContentLightLevel;
  TGstH264ContentLightLevel = record
      max_content_light_level : Tguint16;
      max_pic_average_light_level : Tguint16;
    end;

{*
 * GstH264SEIUnhandledPayload:
 * @payloadType: Payload type
 * @data: payload raw data excluding payload type and payload size byte
 * @size: the size of @data
 *
 * Contains unhandled SEI payload data. This SEI may or may not
 * be defined by spec
 *
 * Since: 1.18
  }
  PGstH264SEIUnhandledPayload = ^TGstH264SEIUnhandledPayload;
  TGstH264SEIUnhandledPayload = record
      payloadType : Tguint;
      data : Pguint8;
      size : Tguint;
    end;

{*
 * GstH264SEIMessage:
 * @payloadType: #GstH264SEIPayloadType
 * @payload: union of all possible SEI message data types
 *
 * Constains information about SEI message. The content depends on the
 * @payloadType.
  }
{*
     * GstH264SEIMessage.user_data_unregistered:
     *
     * User Data Unregistered
     *
     * Since: 1.22
      }
{ ... could implement more  }
  PGstH264SEIMessage = ^TGstH264SEIMessage;
  TGstH264SEIMessage = record
      payloadType : TGstH264SEIPayloadType;
      payload : record
          case longint of
            0 : ( buffering_period : TGstH264BufferingPeriod );
            1 : ( pic_timing : TGstH264PicTiming );
            2 : ( registered_user_data : TGstH264RegisteredUserData );
            3 : ( recovery_point : TGstH264RecoveryPoint );
            4 : ( stereo_video_info : TGstH264StereoVideoInfo );
            5 : ( frame_packing : TGstH264FramePacking );
            6 : ( mastering_display_colour_volume : TGstH264MasteringDisplayColourVolume );
            7 : ( content_light_level : TGstH264ContentLightLevel );
            8 : ( unhandled_payload : TGstH264SEIUnhandledPayload );
            9 : ( user_data_unregistered : TGstH264UserDataUnregistered );
          end;
    end;

{*
 * GstH264DecoderConfigRecord:
 *
 * Contains AVCDecoderConfigurationRecord data as defined in ISO/IEC 14496-15
 *
 * Since: 1.22
  }
{*
   * GstH264DecoderConfigRecord.configuration_version:
   *
   * Indicates configurationVersion, must be 1
    }
{*
   * GstH264DecoderConfigRecord.profile_indication:
   *
   * H.264 profile indication
    }
{*
   * GstH264DecoderConfigRecord.profile_compatibility:
   *
   * H.264 profile compatibility
    }
{*
   * GstH264DecoderConfigRecord.level_indication:
   *
   * H.264 level indiction
    }
{*
   * GstH264DecoderConfigRecord.length_size_minus_one:
   *
   * Indicates the length in bytes of the NAL unit length field
    }
{*
   * GstH264DecoderConfigRecord.sps
   *
   * Array of identified #GstH264NalUnit from sequenceParameterSetNALUnit.
   * This array may contain non-SPS nal units such as SEI message
    }
{*
   * GstH264DecoderConfigRecord.pps
   *
   * Array of identified #GstH264NalUnit from pictureParameterSetNALUnit.
   * This array may contain non-PPS nal units such as SEI message
    }
{*
   * GstH264DecoderConfigRecord.chroma_format_present
   *
   * %TRUE if chroma information is present. Otherwise below values
   * have no meaning
    }
{*
   * GstH264DecoderConfigRecord.chroma_format
   *
   * chroma_format_idc defined in ISO/IEC 14496-10
    }
{*
   * GstH264DecoderConfigRecord.bit_depth_luma_minus8
   *
   * Indicates bit depth of luma component
    }
{*
   * GstH264DecoderConfigRecord.bit_depth_chroma_minus8
   *
   * Indicates bit depth of chroma component
    }
{*
   * GstH264DecoderConfigRecord.sps_ext
   *
   * Array of identified #GstH264NalUnit from sequenceParameterSetExtNALUnit.
    }
{< private > }
  PGstH264DecoderConfigRecord = ^TGstH264DecoderConfigRecord;
  TGstH264DecoderConfigRecord = record
      configuration_version : Tguint8;
      profile_indication : Tguint8;
      profile_compatibility : Tguint8;
      level_indication : Tguint8;
      length_size_minus_one : Tguint8;
      sps : PGArray;
      pps : PGArray;
      chroma_format_present : Tgboolean;
      chroma_format : Tguint8;
      bit_depth_luma_minus8 : Tguint8;
      bit_depth_chroma_minus8 : Tguint8;
      sps_ext : PGArray;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstH264NalParser:
 *
 * H264 NAL Parser (opaque structure).
  }
{< private > }
  PGstH264NalParser = ^TGstH264NalParser;
  TGstH264NalParser = record
      sps : array[0..(GST_H264_MAX_SPS_COUNT)-1] of TGstH264SPS;
      pps : array[0..(GST_H264_MAX_PPS_COUNT)-1] of TGstH264PPS;
      last_sps : PGstH264SPS;
      last_pps : PGstH264PPS;
    end;


function gst_h264_nal_parser_new:PGstH264NalParser;cdecl;external;
(* Const before type ignored *)
function gst_h264_parser_identify_nalu(nalparser:PGstH264NalParser; data:Pguint8; offset:Tguint; size:Tgsize; nalu:PGstH264NalUnit):TGstH264ParserResult;cdecl;external;
(* Const before type ignored *)
function gst_h264_parser_identify_nalu_unchecked(nalparser:PGstH264NalParser; data:Pguint8; offset:Tguint; size:Tgsize; nalu:PGstH264NalUnit):TGstH264ParserResult;cdecl;external;
(* Const before type ignored *)
function gst_h264_parser_identify_nalu_avc(nalparser:PGstH264NalParser; data:Pguint8; offset:Tguint; size:Tgsize; nal_length_size:Tguint8; 
           nalu:PGstH264NalUnit):TGstH264ParserResult;cdecl;external;
(* Const before type ignored *)
function gst_h264_parser_identify_and_split_nalu_avc(nalparser:PGstH264NalParser; data:Pguint8; offset:Tguint; size:Tgsize; nal_length_size:Tguint8; 
           nalus:PGArray; consumed:Pgsize):TGstH264ParserResult;cdecl;external;
function gst_h264_parser_parse_nal(nalparser:PGstH264NalParser; nalu:PGstH264NalUnit):TGstH264ParserResult;cdecl;external;
function gst_h264_parser_parse_slice_hdr(nalparser:PGstH264NalParser; nalu:PGstH264NalUnit; slice:PGstH264SliceHdr; parse_pred_weight_table:Tgboolean; parse_dec_ref_pic_marking:Tgboolean):TGstH264ParserResult;cdecl;external;
function gst_h264_parser_parse_subset_sps(nalparser:PGstH264NalParser; nalu:PGstH264NalUnit; sps:PGstH264SPS):TGstH264ParserResult;cdecl;external;
function gst_h264_parser_parse_sps(nalparser:PGstH264NalParser; nalu:PGstH264NalUnit; sps:PGstH264SPS):TGstH264ParserResult;cdecl;external;
function gst_h264_parser_parse_pps(nalparser:PGstH264NalParser; nalu:PGstH264NalUnit; pps:PGstH264PPS):TGstH264ParserResult;cdecl;external;
function gst_h264_parser_parse_sei(nalparser:PGstH264NalParser; nalu:PGstH264NalUnit; messages:PPGArray):TGstH264ParserResult;cdecl;external;
function gst_h264_parser_update_sps(nalparser:PGstH264NalParser; sps:PGstH264SPS):TGstH264ParserResult;cdecl;external;
function gst_h264_parser_update_pps(nalparser:PGstH264NalParser; pps:PGstH264PPS):TGstH264ParserResult;cdecl;external;
procedure gst_h264_nal_parser_free(nalparser:PGstH264NalParser);cdecl;external;
function gst_h264_parse_subset_sps(nalu:PGstH264NalUnit; sps:PGstH264SPS):TGstH264ParserResult;cdecl;external;
function gst_h264_parse_sps(nalu:PGstH264NalUnit; sps:PGstH264SPS):TGstH264ParserResult;cdecl;external;
function gst_h264_parse_pps(nalparser:PGstH264NalParser; nalu:PGstH264NalUnit; pps:PGstH264PPS):TGstH264ParserResult;cdecl;external;
procedure gst_h264_sps_clear(sps:PGstH264SPS);cdecl;external;
procedure gst_h264_pps_clear(pps:PGstH264PPS);cdecl;external;
procedure gst_h264_sei_clear(sei:PGstH264SEIMessage);cdecl;external;
(* Const before type ignored *)
procedure gst_h264_quant_matrix_8x8_get_zigzag_from_raster(out_quant:array[0..63] of Tguint8; quant:array[0..63] of Tguint8);cdecl;external;
(* Const before type ignored *)
procedure gst_h264_quant_matrix_8x8_get_raster_from_zigzag(out_quant:array[0..63] of Tguint8; quant:array[0..63] of Tguint8);cdecl;external;
(* Const before type ignored *)
procedure gst_h264_quant_matrix_4x4_get_zigzag_from_raster(out_quant:array[0..15] of Tguint8; quant:array[0..15] of Tguint8);cdecl;external;
(* Const before type ignored *)
procedure gst_h264_quant_matrix_4x4_get_raster_from_zigzag(out_quant:array[0..15] of Tguint8; quant:array[0..15] of Tguint8);cdecl;external;
(* Const before type ignored *)
procedure gst_h264_video_calculate_framerate(sps:PGstH264SPS; field_pic_flag:Tguint; pic_struct:Tguint; fps_num:Pgint; fps_den:Pgint);cdecl;external;
function gst_h264_create_sei_memory(start_code_prefix_length:Tguint8; messages:PGArray):PGstMemory;cdecl;external;
function gst_h264_create_sei_memory_avc(nal_length_size:Tguint8; messages:PGArray):PGstMemory;cdecl;external;
function gst_h264_parser_insert_sei(nalparser:PGstH264NalParser; au:PGstBuffer; sei:PGstMemory):PGstBuffer;cdecl;external;
function gst_h264_parser_insert_sei_avc(nalparser:PGstH264NalParser; nal_length_size:Tguint8; au:PGstBuffer; sei:PGstMemory):PGstBuffer;cdecl;external;
procedure gst_h264_decoder_config_record_free(config:PGstH264DecoderConfigRecord);cdecl;external;
(* Const before type ignored *)
function gst_h264_parser_parse_decoder_config_record(nalparser:PGstH264NalParser; data:Pguint8; size:Tgsize; config:PPGstH264DecoderConfigRecord):TGstH264ParserResult;cdecl;external;
(* Const before type ignored *)
function gst_h264_profile_from_string(profile:Pgchar):TGstH264Profile;cdecl;external;
(* Const before type ignored *)
function gst_h264_slice_type_to_string(slice_type:TGstH264SliceType):Pgchar;cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H264_IS_SVC_NALU(nalu : longint) : longint;
begin
  GST_H264_IS_SVC_NALU:=(nalu^.extension_type)=GST_H264_NAL_EXTENSION_SVC;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H264_IS_MVC_NALU(nalu : longint) : longint;
begin
  GST_H264_IS_MVC_NALU:=(nalu^.extension_type)=GST_H264_NAL_EXTENSION_MVC;
end;


end.
