
unit gsth266parser;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsth266parser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsth266parser.h
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
Pgsize  = ^gsize;
PGstH266ALF  = ^GstH266ALF;
PGstH266APS  = ^GstH266APS;
PGstH266APSType  = ^GstH266APSType;
PGstH266AUD  = ^GstH266AUD;
PGstH266BufferingPeriod  = ^GstH266BufferingPeriod;
PGstH266DCI  = ^GstH266DCI;
PGstH266DecoderConfigRecord  = ^GstH266DecoderConfigRecord;
PGstH266DecoderConfigRecordNalUnitArray  = ^GstH266DecoderConfigRecordNalUnitArray;
PGstH266DPBParameters  = ^GstH266DPBParameters;
PGstH266DUInfo  = ^GstH266DUInfo;
PGstH266FrameFieldInfo  = ^GstH266FrameFieldInfo;
PGstH266GeneralConstraintsInfo  = ^GstH266GeneralConstraintsInfo;
PGstH266GeneralHRDParameters  = ^GstH266GeneralHRDParameters;
PGstH266Level  = ^GstH266Level;
PGstH266LMCS  = ^GstH266LMCS;
PGstH266NalUnit  = ^GstH266NalUnit;
PGstH266NalUnitType  = ^GstH266NalUnitType;
PGstH266OLSHRDParameters  = ^GstH266OLSHRDParameters;
PGstH266OPI  = ^GstH266OPI;
PGstH266Parser  = ^GstH266Parser;
PGstH266ParserResult  = ^GstH266ParserResult;
PGstH266PicHdr  = ^GstH266PicHdr;
PGstH266PicTiming  = ^GstH266PicTiming;
PGstH266PPS  = ^GstH266PPS;
PGstH266PredWeightTable  = ^GstH266PredWeightTable;
PGstH266Profile  = ^GstH266Profile;
PGstH266ProfileTierLevel  = ^GstH266ProfileTierLevel;
PGstH266PTLRecord  = ^GstH266PTLRecord;
PGstH266RefPicLists  = ^GstH266RefPicLists;
PGstH266RefPicListStruct  = ^GstH266RefPicListStruct;
PGstH266RegisteredUserData  = ^GstH266RegisteredUserData;
PGstH266ScalableNesting  = ^GstH266ScalableNesting;
PGstH266ScalingList  = ^GstH266ScalingList;
PGstH266SEIMessage  = ^GstH266SEIMessage;
PGstH266SEIPayloadType  = ^GstH266SEIPayloadType;
PGstH266SliceHdr  = ^GstH266SliceHdr;
PGstH266SliceType  = ^GstH266SliceType;
PGstH266SPS  = ^GstH266SPS;
PGstH266SPSRangeExtensionParams  = ^GstH266SPSRangeExtensionParams;
PGstH266SubLayerHRDParameters  = ^GstH266SubLayerHRDParameters;
PGstH266SubPicLevelInfo  = ^GstH266SubPicLevelInfo;
PGstH266VPS  = ^GstH266VPS;
PGstH266VUIParams  = ^GstH266VUIParams;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Gstreamer H.266 bitstream parser
 *
 * Copyright (C) 2023 Intel Corporation
 *    Author: Zhong Hongcheng <spartazhc@gmail.com>
 *    Author: He Junyan <junyan.he@intel.com>
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
(** unsupported pragma#pragma once*)
{$include <gst/gst.h>}
{$include <gst/codecparsers/codecparsers-prelude.h>}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_H266_IS_B_SLICE(slice : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H266_IS_P_SLICE(slice : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H266_IS_I_SLICE(slice : longint) : longint;

{ 6.2 we can have 3 sample arrays  }
const
  GST_H266_MAX_SAMPLE_ARRAYS = 3;  
{ 7.4.3.3 vps_max_layers_minus1 is u(6)  }
  GST_H266_MAX_LAYERS = 64;  
{ 7.4.3.3 The value of vps_max_sublayers_minus1
 * shall be in the range of 0 to 6, inclusive  }
  GST_H266_MAX_SUBLAYERS = 7;  
{ 3-bit minus1 value, so max is 7+1  }
  GST_H266_MAX_SLI_REF_LEVELS = 8;  
{ 7.4.3.3 vps_num_output_layer_sets_minus2 is u(8)  }
  GST_H266_MAX_TOTAL_NUM_OLSS = 257;  
{ 7.4.3.3 vps_num_ptls_minus1 shall be less than TotalNumOlss,
 * which is MAX(GST_H266_MAX_LAYERS, GST_H266_MAX_TOTAL_NUM_OLSS)  }
  GST_H266_MAX_PTLS = GST_H266_MAX_TOTAL_NUM_OLSS;  
{ 7.3.2.3: vps_video_parameter_set_id is u(4).  }
  GST_H266_MAX_VPS_COUNT = 16;  
{ 7.3.2.4: sps_seq_parameter_set_id is u(4)  }
  GST_H266_MAX_SPS_COUNT = 16;  
{ 7.3.2.5: pps_pic_parameter_set_id is u(6)  }
  GST_H266_MAX_PPS_COUNT = 64;  
{ 7.3.2.7: the value of aps_adaptation_parameter_set_id shall be in
 * the range of 0 to 7 or in the range of 0 to 3 inclusive, depending
 * on the aps_params_type.  }
  GST_H266_MAX_APS_COUNT = 8;  
{ 7.4.4.1: ptl_num_sub_profiles is u(8)  }
  GST_H266_MAX_SUB_PROFILES = 256;  
{ A.4.2: MaxDpbSize is bounded above by 2*maxDpbPicBuf(8)  }
  GST_H266_MAX_DPB_SIZE = 16;  
{ 7.4.3.4: sps_num_ref_pic_lists in range [0, 64]  }
  GST_H266_MAX_REF_PIC_LISTS = 64;  
{ 7.4.3.18: NumAlfFilters is 25  }
  GST_H266_NUM_ALF_FILTERS = 25;  
{ 7.4.11: num_ref_entries in range [0, MaxDpbSize + 13]  }
  GST_H266_MAX_REF_ENTRIES = GST_H266_MAX_DPB_SIZE+13;  
{ 7.4.3.3 sps_num_points_in_qp_table_minus1[i] in range
 * [0, 36 - sps_qp_table_start_minus26[i]], and sps_qp_table_start_minus26[i]
 * in range [-26 - QpBdOffset, 36]. For 16 bits QpBdOffset is 6*8,
 * so sps_num_points_in_qp_table_minus1[i] in range [0, 110]  }
  GST_H266_MAX_POINTS_IN_QP_TABLE = 111;  
{ 7.4.6.1: hrd_cpb_cnt_minus1 is in [0, 31].  }
  GST_H266_MAX_CPB_CNT = 32;  
{ A.4.1: the highest level allows a MaxLumaPs of 35 651 584.  }
  GST_H266_MAX_LUMA_PS = 35651584;  
{ A.4.1: pic_width_in_luma_samples and pic_height_in_luma_samples are
 * constrained to be not greater than sqrt(MaxLumaPs * 8).  Hence height/
 * width are bounded above by sqrt(8 * 35651584) = 16888.2 samples.  }
  GST_H266_MAX_WIDTH = 16888;  
  GST_H266_MAX_HEIGHT = 16888;  
{ A.4.1: table A.1 allows at most 440 tiles per au for any level.  }
  GST_H266_MAX_TILES_PER_AU = 440;  
{ A.4.1: table A.1 did not define max tile rows.  }
{ in worest a case, we can have 1x440 tiles picture.  }
  GST_H266_MAX_TILE_ROWS = GST_H266_MAX_TILES_PER_AU;  
{ A.4.1: table A.1 allows at most 20 tile columns for any level.  }
  GST_H266_MAX_TILE_COLUMNS = 20;  
{ A.4.1 table A.1 allows at most 1000 slice for any level.  }
  GST_H266_MAX_SLICES_PER_AU = 1000;  
{xxxxxx #define GST_H266_MAX_ENTRY_POINTS (GST_H266_MAX_TILE_COLUMNS * 135) }
  GST_H266_MAX_CTUS_IN_PICTURE = (80216064/8)/32;  
{ Practical limit for number of decoding units per picture.
   The spec allows up to PicSizeInCtbsY which could be very large,
   but 600 is a reasonable practical limit matching the array sizes
   in GstH266PicTiming.  }
  GST_H266_MAX_DECODING_UNITS_IN_PIC_TIMING = 600;  
{*xxxxxxx
#define GST_H266_IS_NAL_TYPE_IDR(nal_type) \
  ((nal_type) == GST_H266_NAL_SLICE_IDR_N_LP || \
   (nal_type) == GST_H266_NAL_SLICE_IDR_W_RADL)
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_H266_IS_NAL_TYPE_GDR(nal_type : longint) : longint;

{*
 * GST_H266_IS_NAL_TYPE_CRA:
 * @nal_type: a #GstH266NalUnitType
 *
 * Check whether @nal_type is CRA or not.
 *
 * Since: 1.26
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H266_IS_NAL_TYPE_CRA(nal_type : longint) : longint;

{*
 * GST_H266_IS_NAL_TYPE_IRAP:
 * @nal_type: a #GstH266NalUnitType
 *
 * Check whether @nal_type is IRAP or not.
 *
 * Since: 1.26
  }
{ xxxxx #define GST_H266_IS_NAL_TYPE_IRAP(nal_type)   (GST_H266_IS_NAL_TYPE_IDR (nal_type) || GST_H266_IS_NAL_TYPE_CRA (nal_type)) }
{*
 * GST_H266_IS_NAL_TYPE_CVSS:
 * @nal_type: a #GstH266NalUnitType
 *
 * Check whether @nal_type is coded video sequence start or not.
 *
 * Since: 1.26
  }
{ xxxx #define GST_H266_IS_NAL_TYPE_CVSS(nal_type)   (GST_H266_IS_NAL_TYPE_IRAP(nal_type) || GST_H266_IS_NAL_TYPE_GDR(nal_type)) }
{*
 * GST_H266_IS_NAL_TYPE_RADL:
 * @nal_type: a #GstH266NalUnitType
 *
 * Check whether @nal_type is RADL or not.
 *
 * Since: 1.26
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H266_IS_NAL_TYPE_RADL(nal_type : longint) : longint;

{*
 * GST_H266_IS_NAL_TYPE_RASL:
 * @nal_type: a #GstH266NalUnitType
 *
 * Check whether @nal_type is RASL or not.
 *
 * Since: 1.26
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H266_IS_NAL_TYPE_RASL(nal_type : longint) : longint;

{*
 * GstH266ParserResult:
 * @GST_H266_PARSER_OK: The parsing succeeded.
 * @GST_H266_PARSER_BROKEN_DATA: The data to parse is broken.
 * @GST_H266_PARSER_BROKEN_LINK: The link to structure needed for the parsing
 *  couldn't be found.
 * @GST_H266_PARSER_ERROR: An error accured when parsing.
 * @GST_H266_PARSER_NO_NAL: No nal found during the parsing.
 * @GST_H266_PARSER_NO_NAL_END: Start of the nal found, but not the end.
 *
 * The result of parsing H266 data.
 *
 * Since: 1.26
  }
type
  PGstH266ParserResult = ^TGstH266ParserResult;
  TGstH266ParserResult =  Longint;
  Const
    GST_H266_PARSER_OK = 0;
    GST_H266_PARSER_BROKEN_DATA = 1;
    GST_H266_PARSER_BROKEN_LINK = 2;
    GST_H266_PARSER_ERROR = 3;
    GST_H266_PARSER_NO_NAL = 4;
    GST_H266_PARSER_NO_NAL_END = 5;
;
{*
 * GstH266Profile:
 * @GST_H266_PROFILE_MAIN_10: Main 10 profile (A.3.1).
 * @GST_H266_PROFILE_MAIN_10_STILL_PICTURE: Main 10 Still Picture profile (A.3.1).
 * @GST_H266_PROFILE_MULTILAYER_MAIN_10: MultiLayer Main 10 profile (A.3.3).
 * @GST_H266_PROFILE_MULTILAYER_MAIN_10_STILL_PICTURE: MultiLayer Main 10 Still
 *  Picture profile (A.3.3).
 * @GST_H266_PROFILE_MAIN_10_444: Main 10 4:4:4 profile (A.3.2).
 * @GST_H266_PROFILE_MAIN_10_444_STILL_PICTURE: Main 10 4:4:4 Still Picture
 *  profile (A.3.2).
 * @GST_H266_PROFILE_MULTILAYER_MAIN_10_444: MultiLayer Main 10 4:4:4
 *  profile (A.3.4).
 * @GST_H266_PROFILE_MULTILAYER_MAIN_10_444_STILL_PICTURE: MultiLayer Main 10
 *  4:4:4 Still Picture profile (A.3.4).
 * @GST_H266_PROFILE_MAIN_12: Main 12 profile (A.3.5).
 * @GST_H266_PROFILE_MAIN_12_444: Main 12 4:4:4 profile (A.3.5).
 * @GST_H266_PROFILE_MAIN_16_444: Main 16 4:4:4 profile (A.3.5).
 * @GST_H266_PROFILE_MAIN_12_INTRA: Main 12 Intra profile (A.3.5).
 * @GST_H266_PROFILE_MAIN_12_444_INTRA: Main 12 4:4:4 Intra profile (A.3.5).
 * @GST_H266_PROFILE_MAIN_16_444_INTRA: Main 16 4:4:4 Intra profile (A.3.5).
 * @GST_H266_PROFILE_MAIN_12_STILL_PICTURE: Main 12 Still Picture profile (A.3.5).
 * @GST_H266_PROFILE_MAIN_12_444_STILL_PICTURE: Main 12 4:4:4 Still Picture
 *  profile (A.3.5).
 * @GST_H266_PROFILE_MAIN_16_444_STILL_PICTURE: Main 16 4:4:4 Still Picture
 *  profile (A.3.5).
 *
 * H.266 Profiles.
 *
 * Since: 1.26
  }
{ end of the profiles  }
type
  PGstH266Profile = ^TGstH266Profile;
  TGstH266Profile =  Longint;
  Const
    GST_H266_PROFILE_INVALID = -(1);
    GST_H266_PROFILE_NONE = 0;
    GST_H266_PROFILE_INTRA = 8;
    GST_H266_PROFILE_STILL_PICTURE = 64;
    GST_H266_PROFILE_MAIN_10 = 1;
    GST_H266_PROFILE_MAIN_10_STILL_PICTURE = GST_H266_PROFILE_MAIN_10 or GST_H266_PROFILE_STILL_PICTURE;
    GST_H266_PROFILE_MULTILAYER_MAIN_10 = 17;
    GST_H266_PROFILE_MULTILAYER_MAIN_10_STILL_PICTURE = GST_H266_PROFILE_MULTILAYER_MAIN_10 or GST_H266_PROFILE_STILL_PICTURE;
    GST_H266_PROFILE_MAIN_10_444 = 33;
    GST_H266_PROFILE_MAIN_10_444_STILL_PICTURE = GST_H266_PROFILE_MAIN_10_444 or GST_H266_PROFILE_STILL_PICTURE;
    GST_H266_PROFILE_MULTILAYER_MAIN_10_444 = 49;
    GST_H266_PROFILE_MULTILAYER_MAIN_10_444_STILL_PICTURE = GST_H266_PROFILE_MULTILAYER_MAIN_10_444 or GST_H266_PROFILE_STILL_PICTURE;
    GST_H266_PROFILE_MAIN_12 = 2;
    GST_H266_PROFILE_MAIN_12_444 = 34;
    GST_H266_PROFILE_MAIN_16_444 = 35;
    GST_H266_PROFILE_MAIN_12_INTRA = GST_H266_PROFILE_MAIN_12 or GST_H266_PROFILE_INTRA;
    GST_H266_PROFILE_MAIN_12_444_INTRA = GST_H266_PROFILE_MAIN_12_444 or GST_H266_PROFILE_INTRA;
    GST_H266_PROFILE_MAIN_16_444_INTRA = GST_H266_PROFILE_MAIN_16_444 or GST_H266_PROFILE_INTRA;
    GST_H266_PROFILE_MAIN_12_STILL_PICTURE = GST_H266_PROFILE_MAIN_12 or GST_H266_PROFILE_STILL_PICTURE;
    GST_H266_PROFILE_MAIN_12_444_STILL_PICTURE = GST_H266_PROFILE_MAIN_12_444 or GST_H266_PROFILE_STILL_PICTURE;
    GST_H266_PROFILE_MAIN_16_444_STILL_PICTURE = GST_H266_PROFILE_MAIN_16_444 or GST_H266_PROFILE_STILL_PICTURE;
    GST_H266_PROFILE_MAX = (GST_H266_PROFILE_MAIN_16_444 or GST_H266_PROFILE_STILL_PICTURE)+1;
;
{*
 * GstH266Level:
 *
 * H.266 level.
 *
 * Since: 1.26
  }
type
  PGstH266Level = ^TGstH266Level;
  TGstH266Level =  Longint;
  Const
    GST_H266_LEVEL_L1_0 = 16;
    GST_H266_LEVEL_L2_0 = 32;
    GST_H266_LEVEL_L2_1 = 35;
    GST_H266_LEVEL_L3_0 = 48;
    GST_H266_LEVEL_L3_1 = 51;
    GST_H266_LEVEL_L4_0 = 64;
    GST_H266_LEVEL_L4_1 = 67;
    GST_H266_LEVEL_L5_0 = 80;
    GST_H266_LEVEL_L5_1 = 83;
    GST_H266_LEVEL_L5_2 = 86;
    GST_H266_LEVEL_L6_0 = 96;
    GST_H266_LEVEL_L6_1 = 99;
    GST_H266_LEVEL_L6_2 = 102;
    GST_H266_LEVEL_L6_3 = 105;
;
{*
 * GstH266NalUnitType:
 * @GST_H266_NAL_SLICE_TRAIL: Coded slice of a trailing picture or subpicture.
 * @GST_H266_NAL_SLICE_STSA: Coded slice of an STSA picture or subpicture.
 * @GST_H266_NAL_SLICE_RADL: Coded slice of a RADL picture or subpicture.
 * @GST_H266_NAL_SLICE_RASL: Coded slice of a RASL picture or subpicture.
 * @GST_H266_NAL_SLICE_IDR_W_RADL: Coded slice of an IDR picture or subpicture.
 * @GST_H266_NAL_SLICE_IDR_N_LP: Coded slice of an IDR picture or subpicture.
 * @GST_H266_NAL_SLICE_CRA: Coded slice of a CRA picture or subpicture.
 * @GST_H266_NAL_SLICE_GDR: Coded slice of a GDR picture or subpicture.
 * @GST_H266_NAL_OPI: Operating point information.
 * @GST_H266_NAL_DCI: Decoding capability information.
 * @GST_H266_NAL_VPS: Video parameter set(VPS).
 * @GST_H266_NAL_SPS: Sequence parameter set (SPS).
 * @GST_H266_NAL_PPS: Picture parameter set (PPS).
 * @GST_H266_NAL_PREFIX_APS: Prefix Adaptation parameter set (APS).
 * @GST_H266_NAL_SUFFIX_APS: Suffix Adaptation parameter set (APS).
 * @GST_H266_NAL_PH: Picture header (PH).
 * @GST_H266_NAL_AUD: AU delimiter.
 * @GST_H266_NAL_EOS: End of sequence (EOS).
 * @GST_H266_NAL_EOB: End of bitstream (EOB).
 * @GST_H266_NAL_PREFIX_SEI: Prefix Supplemental enhancement information.
 * @GST_H266_NAL_SUFFIX_SEI: Suffix Suppliemental enhancement information.
 * @GST_H266_NAL_FD: Filler data (FD).
 *
 * Indicates the types of H266 Nal Units as
 * table 5 - NAL unit type codes and NAL unit type classes.
 *
 * Since: 1.26
  }
type
  PGstH266NalUnitType = ^TGstH266NalUnitType;
  TGstH266NalUnitType =  Longint;
  Const
    GST_H266_NAL_SLICE_TRAIL = 0;
    GST_H266_NAL_SLICE_STSA = 1;
    GST_H266_NAL_SLICE_RADL = 2;
    GST_H266_NAL_SLICE_RASL = 3;
    GST_H266_NAL_SLICE_IDR_W_RADL = 7;
    GST_H266_NAL_SLICE_IDR_N_LP = 8;
    GST_H266_NAL_SLICE_CRA = 9;
    GST_H266_NAL_SLICE_GDR = 10;
    GST_H266_NAL_OPI = 12;
    GST_H266_NAL_DCI = 13;
    GST_H266_NAL_VPS = 14;
    GST_H266_NAL_SPS = 15;
    GST_H266_NAL_PPS = 16;
    GST_H266_NAL_PREFIX_APS = 17;
    GST_H266_NAL_SUFFIX_APS = 18;
    GST_H266_NAL_PH = 19;
    GST_H266_NAL_AUD = 20;
    GST_H266_NAL_EOS = 21;
    GST_H266_NAL_EOB = 22;
    GST_H266_NAL_PREFIX_SEI = 23;
    GST_H266_NAL_SUFFIX_SEI = 24;
    GST_H266_NAL_FD = 25;
;
{*
 * GstH266SEIPayloadType:
 * @GST_H266_SEI_BUF_PERIOD: Buffering Period SEI Message.
 * @GST_H266_SEI_PIC_TIMING: Picture Timing SEI Message.
 * @GST_H266_SEI_REGISTERED_USER_DATA: Registered user data.
 * @GST_H266_SEI_USER_DATA_UNREGISTERED: User data Unregistered.
 * @GST_H266_SEI_DU_INFO: DU Information SEI Message.
 * @GST_H266_SEI_SCALABLE_NETING: Scalable Nesting SEI Message.
 * @GST_H266_SEI_FRAME_FIELD_INFO: Frame Field Info SEI Message.
 * @GST_H266_SEI_SUBPIC_LEVEL_INFO: Subpicture Level Information SEI.
 *
 * The type of SEI message.
 * More other SEIs are specified in Rec.ITU-T H.274 | ISO/IEC 23002-7.
 *
 * Since: 1.26
  }
{ and more...   }
type
  PGstH266SEIPayloadType = ^TGstH266SEIPayloadType;
  TGstH266SEIPayloadType =  Longint;
  Const
    GST_H266_SEI_BUF_PERIOD = 0;
    GST_H266_SEI_PIC_TIMING = 1;
    GST_H266_SEI_REGISTERED_USER_DATA = 4;
    GST_H266_SEI_USER_DATA_UNREGISTERED = 5;
    GST_H266_SEI_DU_INFO = 130;
    GST_H266_SEI_SCALABLE_NESTING = 133;
    GST_H266_SEI_FRAME_FIELD_INFO = 168;
    GST_H266_SEI_SUBPIC_LEVEL_INFO = 203;
;
{*
 * GstH266SliceType:
 * @GST_H266_B_SLICE: B slice type.
 * @GST_H266_P_SLICE: P slice type.
 * @GST_H266_I_SLICE: I slice type.
 *
 * Types of Picture slice.
 *
 * Since: 1.26
  }
type
  PGstH266SliceType = ^TGstH266SliceType;
  TGstH266SliceType =  Longint;
  Const
    GST_H266_B_SLICE = 0;
    GST_H266_P_SLICE = 1;
    GST_H266_I_SLICE = 2;
;
{*
 * GstH266APSType:
 * @GST_H266_ALF_APS: ALF parameters.
 * @GST_H266_LMCS_APS: LMCS parameters.
 * @GST_H266_SCALING_APS: Scaling list parameters.
 *
 * Indicates the types of Adaptation parameter set (APS) as
 * Table 6 - APS parameters type codes and types of APS parameters.
 *
 * Since: 1.26
  }
{ end of the aps type  }
type
  PGstH266APSType = ^TGstH266APSType;
  TGstH266APSType =  Longint;
  Const
    GST_H266_ALF_APS = 0;
    GST_H266_LMCS_APS = 1;
    GST_H266_SCALING_APS = 2;
    GST_H266_APS_TYPE_MAX = 3;
;
type
{*
 * GstH266NalUnit:
 * @type: A #GstH266NalUnitType.
 * @layer_id: A nal unit layer id.
 * @temporal_id_plus1: A nal unit temporal identifier.
 * @size: The size of the nal unit starting from @offset.
 * @offset: The offset of the actual start of the nal unit.
 * @sc_offset:The offset of the start code of the nal unit.
 * @valid: If the nal unit is valid, which mean it has
 *  already been parsed.
 * @data: The data from which the Nalu has been parsed.
 * @header_bytes: The size of the NALU header in bytes.
 *
 * Structure defining the H266 Nal unit headers.
 *
 * Since: 1.26
  }
{ calculated values  }
  PGstH266NalUnit = ^TGstH266NalUnit;
  TGstH266NalUnit = record
      _type : Tguint8;
      layer_id : Tguint8;
      temporal_id_plus1 : Tguint8;
      size : Tguint;
      offset : Tguint;
      sc_offset : Tguint;
      valid : Tgboolean;
      data : Pguint8;
      header_bytes : Tguint8;
    end;

{*
 * GstH266GeneralConstraintsInfo:
 * @present_flag: specifies whether additional syntax elements are present.
 * @intra_only_constraint_flag: specifies whether sh_slice_type for all slices
 *  in OlsInScope shall be equal to 2.
 * @all_layers_independent_constraint_flag: specifies whether the
 *  vps_all_independent_layers_flag for all pictures in OlsInScope
 *  shall be equal to 1.
 * @one_au_only_constraint_flag: specifies whether there is only one
 *  AU in OlsInScope.
 * @sixteen_minus_max_bitdepth_constraint_idc: specifies whether
 *  sps_bitdepth_minus8 plus 8 for all pictures in OlsInScope shall be in the
 *  range of 0 to 16 - gci_sixteen_minus_max_bitdepth_constraint_idc, inclusive.
 * @three_minus_max_chroma_format_constraint_idc: specifies whether the
 *  sps_chroma_format_idc for all pictures in OlsInScope shall be in the range
 *  of 0 to 3 - gci_three_minus_max_chroma_format_constraint_idc, inclusive.
 * @no_mixed_nalu_types_in_pic_constraint_flag: specifies whether the
 *  pps_mixed_nalu_types_in_pic_flag for all pictures in OlsInScope shall
 *  be equal to 0.
 * @no_trail_constraint_flag: specifies whether there shall be no NAL unit
 *  with nuh_unit_type equal to TRAIL_NUT present in OlsInScope.
 * @no_stsa_constraint_flag: specifies whether there shall be no NAL unit with
 *  nuh_unit_type equal to STSA_NUT present in OlsInScope.
 * @no_rasl_constraint_flag: specifies whether there shall be no NAL unit with
 *  nuh_unit_type equal to RASL_NUT present in OlsInScope.
 * @no_radl_constraint_flag: specifies whether there shall be no NAL unit with
 *  nuh_unit_type equal to RADL_NUT present in OlsInScope.
 * @no_idr_constraint_flag: specifies whether there shall be no NAL unit with
 *  nuh_unit_type equal to IDR_W_RADL or IDR_N_LP present in OlsInScope.
 * @no_cra_constraint_flag: specifies whether there shall be no NAL unit with
 *  nuh_unit_type equal to CRA_NUT present in OlsInScope.
 * @no_gdr_constraint_flag: specifies whether sps_gdr_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_aps_constraint_flag: specifies whether there shall be no NAL unit with
 *  nuh_unit_type equal to PREFIX_APS_NUT or SUFFIX_APS_NUT present in
 *  OlsInScope.
 * @no_idr_rpl_constraint_flag: specifies whether sps_idr_rpl_present_flag for
 *  all pictures in OlsInScope shall be equal to 0.
 * @one_tile_per_pic_constraint_flag: specifies whether each picture in
 *  OlsInScope shall contain only one tile.
 * @pic_header_in_slice_header_constraint_flag: specifies whether each picture
 *  in OlsInScope shall contain only one slice and the value of
 *  sh_picture_header_in_slice_header_flag in each slice in OlsInScope shall
 *  be equal to 1.
 * @one_slice_per_pic_constraint_flag: specifies whether each picture in
 *  OlsInScope shall contain only one slice.
 * @no_rectangular_slice_constraint_flag: specifies whether pps_rect_slice_flag
 *  for all pictures in OlsInScope shall be equal to 0.
 * @one_slice_per_subpic_constraint_flag: specifies whether the value of
 *  pps_single_slice_per_subpic_flag for all pictures in OlsInScope shall
 *  be equal to 1.
 * @no_subpic_info_constraint_flag: specifies whether sps_subpic_info_present_flag
 *  for all pictures in OlsInScope shall be equal to 0.
 * @three_minus_max_log2_ctu_size_constraint_idc: specifies whether
 *  sps_log2_ctu_size_minus5 for all pictures in OlsInScope shall be in the
 *  range of 0 to 3-gci_three_minus_max_log2_ctu_size_constraint_idc, inclusive.
 * @no_partition_constraints_override_constraint_flag: specifies whether
 *  sps_partition_constraints_override_enabled_flag for all pictures in
 *  OlsInScope shall be equal to 0.
 * @no_mtt_constraint_flag: specifies whether
 *  sps_max_mtt_hierarchy_depth_intra_slice_luma,
 *  sps_max_mtt_hierarchy_depth_inter_slice, and
 *  sps_max_mtt_hierarchy_depth_intra_slice_chroma for all pictures in
 *  OlsInScope shall be equal to 0.
 * @no_qtbtt_dual_tree_intra_constraint_flag: specifies whether
 *  sps_qtbtt_dual_tree_intra_flag for all pictures in OlsInScope shall
 *  be equal to 0.
 * @no_palette_constraint_flag: specifies whether sps_palette_enabled_flag
 *  for all pictures in OlsInScope shall be equal to 0.
 * @no_ibc_constraint_flag: specifies whether sps_ibc_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_isp_constraint_flag: specifies whether sps_isp_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_mrl_constraint_flag: specifies whether sps_mrl_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_mip_constraint_flag: specifies whether sps_mip_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_cclm_constraint_flag: specifies whether sps_cclm_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_ref_pic_resampling_constraint_flag: specifies whether
 *  sps_ref_pic_resampling_enabled_flag for all pictures in OlsInScope shall
 *  be equal to 0.
 * @no_res_change_in_clvs_constraint_flag: specifies whether
 *  sps_res_change_in_clvs_allowed_flag for all pictures in OlsInScope shall
 *  be equal to 0.
 * @no_weighted_prediction_constraint_flag: specifies whether
 *  sps_weighted_pred_flag and sps_weighted_bipred_flag for all pictures in
 *  OlsInScope shall both be equal to 0.
 * @no_ref_wraparound_constraint_flag: specifies whether
 *  sps_ref_wraparound_enabled_flag for all pictures in OlsInScope shall be
 *  equal to 0.
 * @no_temporal_mvp_constraint_flag: specifies whether
 *  sps_temporal_mvp_enabled_flag for all pictures in OlsInScope shall be
 *  equal to 0.
 * @no_sbtmvp_constraint_flag: specifies whether sps_sbtmvp_enabled_flag
 *  for all pictures in OlsInScope shall be equal to 0.
 * @no_amvr_constraint_flag: specifies whether sps_amvr_enabled_flag for
 *  all pictures in OlsInScope shall be equal to 0.
 * @no_bdof_constraint_flag: specifies whether sps_bdof_enabled_flag for
 *  all pictures in OlsInScope shall be equal to 0.
 * @no_smvd_constraint_flag: specifies whether sps_smvd_enabled_flag for
 *  all pictures in OlsInScope shall be equal to 0.
 * @no_dmvr_constraint_flag: specifies whether sps_dmvr_enabled_flag for
 *  all pictures in OlsInScope shall be equal to 0.
 * @no_mmvd_constraint_flag: specifies whether sps_mmvd_enabled_flag for
 *  all pictures in OlsInScope shall be equal to 0.
 * @no_affine_motion_constraint_flag: specifies whether sps_affine_enabled_flag
 *  for all pictures in OlsInScope shall be equal to 0.
 * @no_prof_constraint_flag: specifies whether sps_affine_prof_enabled_flag for
 *  all pictures in OlsInScope shall be equal to 0.
 * @no_bcw_constraint_flag: specifies whether sps_bcw_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_ciip_constraint_flag: specifies whether sps_ciip_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_gpm_constraint_flag: specifies whether sps_gpm_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_luma_transform_size_64_constraint_flag: specifies whether
 *  sps_max_luma_transform_size_64_flag for all pictures in OlsInScope shall
 *  be equal to 0.
 * @no_transform_skip_constraint_flag: specifies whether
 *  sps_transform_skip_enabled_flag for all pictures in OlsInScope shall
 *  be equal to 0.
 * @no_bdpcm_constraint_flag: specifies whether sps_bdpcm_enabled_flag for
 *  all pictures in OlsInScope shall be equal to 0.
 * @no_mts_constraint_flag: specifies whether sps_mts_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_lfnst_constraint_flag: specifies whether sps_lfnst_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_joint_cbcr_constraint_flag: specifies whether sps_joint_cbcr_enabled_flag
 *  for all pictures in OlsInScope shall be equal to 0.
 * @no_sbt_constraint_flag: specifies whether sps_sbt_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_act_constraint_flag: specifies whether sps_act_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_explicit_scaling_list_constraint_flag: specifies whether
 *  sps_explicit_scaling_list_enabled_flag for all pictures in OlsInScope shall
 *  be equal to 0.
 * @no_dep_quant_constraint_flag: specifies whether sps_dep_quant_enabled_flag
 *  for all pictures in OlsInScope shall be equal to 0.
 * @no_sign_data_hiding_constraint_flag: specifies whether
 *  sps_sign_data_hiding_enabled_flag for all pictures in OlsInScope shall
 *  be equal to 0.
 * @no_cu_qp_delta_constraint_flag: specifies whether
 *  pps_cu_qp_delta_enabled_flag for all pictures in OlsInScope shall be
 *  equal to 0.
 * @no_chroma_qp_offset_constraint_flag: specifies whether
 *  pps_cu_chroma_qp_offset_list_enabled_flag for all pictures in OlsInScope
 *  shall be equal to 0.
 * @no_sao_constraint_flag: specifies whether sps_sao_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_alf_constraint_flag: specifies whether sps_alf_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_ccalf_constraint_flag: specifies whether sps_ccalf_enabled_flag for
 *  all pictures in OlsInScope shall be equal to 0.
 * @no_lmcs_constraint_flag: specifies whether sps_lmcs_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_ladf_constraint_flag: specifies whether sps_ladf_enabled_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @no_virtual_boundaries_constraint_flag: specifies whether
 *  sps_virtual_boundaries_enabled_flag for all pictures in OlsInScope shall
 *  be equal to 0.
 * @all_rap_pictures_constraint_flag: specifies whether all pictures in
 *  OlsInScope are GDR pictures with ph_recovery_poc_cnt equal to 0 or IRAP
 *  pictures.
 * @no_extended_precision_processing_constraint_flag: specifies whether
 *  sps_extended_precision_flag for all pictures in OlsInScope shall be
 *  equal to 0.
 * @no_ts_residual_coding_rice_constraint_flag: specifies whether
 *  sps_ts_residual_coding_rice_present_in_sh_flag for all pictures in
 *  OlsInScope should be equal to 0.
 * @no_rrc_rice_extension_constraint_flag: specifies whether
 *  sps_rrc_rice_extension_flag for all pictures in OlsInScope shall be
 *  equal to 0.
 * @no_persistent_rice_adaptation_constraint_flag: specifies whether
 *  sps_persistent_rice_adaptation_enabled_flag for all pictures in OlsInScope
 *  shall be equal to 0.
 * @no_reverse_last_sig_coeff_constraint_flag: specifies whether
 *  sps_reverse_last_sig_coeff_enabled_flag for all pictures in OlsInScope
 *  shall be equal to 0.
 * @reserved_zero_bit: the reserved bits.
 *
 * Structure defining the H266 general constraints info.
 *
 * Since: 1.26
  }
{ general  }
{ picture format  }
{ NAL unit type related  }
{ tile, slice, subpicture partitioning  }
{ CTU and block partitioning  }
{ intra  }
{ inter  }
{ transform, quantization, residual  }
{ loop fitler  }
{ additional bits  }
{ reserved for future use  }
  PGstH266GeneralConstraintsInfo = ^TGstH266GeneralConstraintsInfo;
  TGstH266GeneralConstraintsInfo = record
      present_flag : Tguint8;
      intra_only_constraint_flag : Tguint8;
      all_layers_independent_constraint_flag : Tguint8;
      one_au_only_constraint_flag : Tguint8;
      sixteen_minus_max_bitdepth_constraint_idc : Tguint8;
      three_minus_max_chroma_format_constraint_idc : Tguint8;
      no_mixed_nalu_types_in_pic_constraint_flag : Tguint8;
      no_trail_constraint_flag : Tguint8;
      no_stsa_constraint_flag : Tguint8;
      no_rasl_constraint_flag : Tguint8;
      no_radl_constraint_flag : Tguint8;
      no_idr_constraint_flag : Tguint8;
      no_cra_constraint_flag : Tguint8;
      no_gdr_constraint_flag : Tguint8;
      no_aps_constraint_flag : Tguint8;
      no_idr_rpl_constraint_flag : Tguint8;
      one_tile_per_pic_constraint_flag : Tguint8;
      pic_header_in_slice_header_constraint_flag : Tguint8;
      one_slice_per_pic_constraint_flag : Tguint8;
      no_rectangular_slice_constraint_flag : Tguint8;
      one_slice_per_subpic_constraint_flag : Tguint8;
      no_subpic_info_constraint_flag : Tguint8;
      three_minus_max_log2_ctu_size_constraint_idc : Tguint8;
      no_partition_constraints_override_constraint_flag : Tguint8;
      no_mtt_constraint_flag : Tguint8;
      no_qtbtt_dual_tree_intra_constraint_flag : Tguint8;
      no_palette_constraint_flag : Tguint8;
      no_ibc_constraint_flag : Tguint8;
      no_isp_constraint_flag : Tguint8;
      no_mrl_constraint_flag : Tguint8;
      no_mip_constraint_flag : Tguint8;
      no_cclm_constraint_flag : Tguint8;
      no_ref_pic_resampling_constraint_flag : Tguint8;
      no_res_change_in_clvs_constraint_flag : Tguint8;
      no_weighted_prediction_constraint_flag : Tguint8;
      no_ref_wraparound_constraint_flag : Tguint8;
      no_temporal_mvp_constraint_flag : Tguint8;
      no_sbtmvp_constraint_flag : Tguint8;
      no_amvr_constraint_flag : Tguint8;
      no_bdof_constraint_flag : Tguint8;
      no_smvd_constraint_flag : Tguint8;
      no_dmvr_constraint_flag : Tguint8;
      no_mmvd_constraint_flag : Tguint8;
      no_affine_motion_constraint_flag : Tguint8;
      no_prof_constraint_flag : Tguint8;
      no_bcw_constraint_flag : Tguint8;
      no_ciip_constraint_flag : Tguint8;
      no_gpm_constraint_flag : Tguint8;
      no_luma_transform_size_64_constraint_flag : Tguint8;
      no_transform_skip_constraint_flag : Tguint8;
      no_bdpcm_constraint_flag : Tguint8;
      no_mts_constraint_flag : Tguint8;
      no_lfnst_constraint_flag : Tguint8;
      no_joint_cbcr_constraint_flag : Tguint8;
      no_sbt_constraint_flag : Tguint8;
      no_act_constraint_flag : Tguint8;
      no_explicit_scaling_list_constraint_flag : Tguint8;
      no_dep_quant_constraint_flag : Tguint8;
      no_sign_data_hiding_constraint_flag : Tguint8;
      no_cu_qp_delta_constraint_flag : Tguint8;
      no_chroma_qp_offset_constraint_flag : Tguint8;
      no_sao_constraint_flag : Tguint8;
      no_alf_constraint_flag : Tguint8;
      no_ccalf_constraint_flag : Tguint8;
      no_lmcs_constraint_flag : Tguint8;
      no_ladf_constraint_flag : Tguint8;
      no_virtual_boundaries_constraint_flag : Tguint8;
      all_rap_pictures_constraint_flag : Tguint8;
      no_extended_precision_processing_constraint_flag : Tguint8;
      no_ts_residual_coding_rice_constraint_flag : Tguint8;
      no_rrc_rice_extension_constraint_flag : Tguint8;
      no_persistent_rice_adaptation_constraint_flag : Tguint8;
      no_reverse_last_sig_coeff_constraint_flag : Tguint8;
      reserved_zero_bit : array[0..63] of Tguint8;
    end;

{*
 * GstH266ProfileTierLevel:
 * @profile_idc: the profile id.
 * @tier_flag: specifies the main tier or high tier.
 * @level_idc: indicates a level to which OlsInScope conforms
 *  as specified in Annex A.
 * @frame_only_constraint_flag: specifies whether sps_field_seq_flag for all
 *  pictures in OlsInScope shall be equal to 0.
 * @multilayer_enabled_flag: specifies whether the CVSs of OlsInScope
 *  might contain more than one layer.
 * @general_constraints_info: the #GstH266GeneralConstraintsInfo contains
 *  the general constraints info.
 * @sublayer_level_present_flag: specifies whether level information is present
 *  in the profile_tier_level syntax structure for the sublayer representation.
 * @sublayer_level_idc: the sublayer level idc.
 * @num_sub_profiles: specifies the number of the general_sub_profile_idc[i]
 *  syntax elements.
 * @sub_profile_idc: specifies the i-th interoperability indicator registered
 *  as specified by Rec. ITU-T T.35
 *
 * Structure defining the H266 profile, tier and level.
 *
 * Since: 1.26
  }
  PGstH266ProfileTierLevel = ^TGstH266ProfileTierLevel;
  TGstH266ProfileTierLevel = record
      profile_idc : TGstH266Profile;
      tier_flag : Tguint8;
      level_idc : Tguint8;
      frame_only_constraint_flag : Tguint8;
      multilayer_enabled_flag : Tguint8;
      general_constraints_info : TGstH266GeneralConstraintsInfo;
      sublayer_level_present_flag : array[0..(GST_H266_MAX_SUBLAYERS-1)-1] of Tguint8;
      sublayer_level_idc : array[0..(GST_H266_MAX_SUBLAYERS-1)-1] of Tguint8;
      num_sub_profiles : Tguint8;
      sub_profile_idc : array[0..(GST_H266_MAX_SUB_PROFILES)-1] of TGstH266Profile;
      ptl_reserved_zero_bit : Tguint8;
    end;

{*
 * GstH266DPBParameters:
 * @max_dec_pic_buffering_minus1: specifies the maximum required size of the
 *  DPB in units of picture storage buffers.
 * @max_num_reorder_pics: specifies the maximum allowed number of pictures of
 *  the OLS that can precede any picture in the OLS in decoding order and
 *  follow that picture in output.
 * @max_latency_increase_plus1: used to compute the value of MaxLatencyPictures,
 *  which specifies the maximum number of pictures in the OLS.
 *
 * Structure defining the H266 DPB parameters.
 *
 * Since: 1.26
  }
  PGstH266DPBParameters = ^TGstH266DPBParameters;
  TGstH266DPBParameters = record
      max_dec_pic_buffering_minus1 : array[0..(GST_H266_MAX_SUBLAYERS)-1] of Tguint8;
      max_num_reorder_pics : array[0..(GST_H266_MAX_SUBLAYERS)-1] of Tguint8;
      max_latency_increase_plus1 : array[0..(GST_H266_MAX_SUBLAYERS)-1] of Tguint8;
    end;

{*
 * GstH266GeneralHRDParameters:
 * @num_units_in_tick: the number of time units of a clock operating at the
 *  frequency time_scale.
 * @time_scale: number of time units that pass in one second.
 * @general_nal_hrd_params_present_flag: specifies whether NAL HRD parameters
 *  are present in the general_timing_hrd_parameters syntax structure.
 * @general_vcl_hrd_params_present_flag: specifies whether VCL HRD parameters
 *  are present in the general_timing_hrd_parameters syntax structure.
 * @general_same_pic_timing_in_all_ols_flag: specifies whether the
 *  non-scalable-nested PT SEI message in each AU applies to the AU for any
 *  OLS in the bitstream and no scalable-nested PT SEI messages are present.
 * @general_du_hrd_params_present_flag: specifies whether DU level HRD
 *  parameters are present and the HRD could operate at the AU level or DU level.
 * @tick_divisor_minus2: specifies the clock sub-tick.
 * @bit_rate_scale: specifies the maximum input bit rate of the CPB.
 * @cpb_size_scale: specifies the CPB size of the CPB.
 * @cpb_size_du_scale: specifies the CPB size of the CPB at du level.
 * @hrd_cpb_cnt_minus1: plus 1 specifies the number of alternative CPB
 *  delivery schedules.
 *
 * Structure defining the H266 HDR parameters.
 *
 * Since: 1.26
  }
  PGstH266GeneralHRDParameters = ^TGstH266GeneralHRDParameters;
  TGstH266GeneralHRDParameters = record
      num_units_in_tick : Tguint32;
      time_scale : Tguint32;
      general_nal_hrd_params_present_flag : Tguint8;
      general_vcl_hrd_params_present_flag : Tguint8;
      general_same_pic_timing_in_all_ols_flag : Tguint8;
      general_du_hrd_params_present_flag : Tguint8;
      tick_divisor_minus2 : Tguint8;
      bit_rate_scale : Tguint8;
      cpb_size_scale : Tguint8;
      cpb_size_du_scale : Tguint8;
      hrd_cpb_cnt_minus1 : Tguint8;
    end;

{*
 * GstH266SubLayerHRDParameters:
 * @bit_rate_value_minus1: specifies the maximum input bit rate for the CPB.
 * @cpb_size_value_minus1: together with cpb_size_scale to specify the CPB size.
 * @cpb_size_du_value_minus1: together with cpb_size_du_scale to specify
 *  the CPB size.
 * @bit_rate_du_value_minus1: specifies the maximum input bit rate for the CPB.
 * @cbr_flag: specifies whether to decode this bitstream by the HRD using
 *  the CPB specification.
 * @bit_rate: the calculated bit rate.
 * @cpb_size: the calculated cpb size.
 *
 * Structure defining the H266 sub layer HDR parameters.
 *
 * Since: 1.26
  }
{ calculated values  }
  PGstH266SubLayerHRDParameters = ^TGstH266SubLayerHRDParameters;
  TGstH266SubLayerHRDParameters = record
      bit_rate_value_minus1 : array[0..(GST_H266_MAX_CPB_CNT)-1] of Tguint32;
      cpb_size_value_minus1 : array[0..(GST_H266_MAX_CPB_CNT)-1] of Tguint32;
      cpb_size_du_value_minus1 : array[0..(GST_H266_MAX_CPB_CNT)-1] of Tguint32;
      bit_rate_du_value_minus1 : array[0..(GST_H266_MAX_CPB_CNT)-1] of Tguint32;
      cbr_flag : array[0..(GST_H266_MAX_CPB_CNT)-1] of Tguint8;
      bit_rate : array[0..(GST_H266_MAX_CPB_CNT)-1] of Tguint32;
      cpb_size : array[0..(GST_H266_MAX_CPB_CNT)-1] of Tguint32;
    end;

{*
 * GstH266OLSHRDParameters:
 * @fixed_pic_rate_general_flag: indicates the temporal distance between the
 *  HRD output times of consecutive pictures in output order is constrained as
 *  specified in this clause using the variable DpbOutputElementalInterval[n].
 * @fixed_pic_rate_within_cvs_flag: indicates the temporal distance between the
 *  HRD output times of consecutive pictures in output order is constrained as
 *  specified in this clause using the variable DpbOutputElementalInterval[n].
 * @elemental_duration_in_tc_minus1: specifies the temporal distance between
 *  the elemental units that specify the HRD output times of consecutive
 *  pictures in output order.
 * @low_delay_hrd_flag: specifies the HRD operational mode as specified
 *  in Annex C.
 * @nal_sub_layer_hrd_parameters: sub layer nal #GstH266SubLayerHRDParameters.
 * @vcl_sub_layer_hrd_parameters: sub layer vcl #GstH266SubLayerHRDParameters.
 *
 * Structure defining the H266 OLS HDR parameters.
 *
 * Since: 1.26
  }
  PGstH266OLSHRDParameters = ^TGstH266OLSHRDParameters;
  TGstH266OLSHRDParameters = record
      fixed_pic_rate_general_flag : array[0..(GST_H266_MAX_SUBLAYERS)-1] of Tguint8;
      fixed_pic_rate_within_cvs_flag : array[0..(GST_H266_MAX_SUBLAYERS)-1] of Tguint8;
      elemental_duration_in_tc_minus1 : array[0..(GST_H266_MAX_SUBLAYERS)-1] of Tguint16;
      low_delay_hrd_flag : array[0..(GST_H266_MAX_SUBLAYERS)-1] of Tguint8;
      nal_sub_layer_hrd_parameters : array[0..(GST_H266_MAX_SUBLAYERS)-1] of TGstH266SubLayerHRDParameters;
      vcl_sub_layer_hrd_parameters : array[0..(GST_H266_MAX_SUBLAYERS)-1] of TGstH266SubLayerHRDParameters;
    end;

{*
 * GstH266VPS:
 * @vps_id: provides an identifier for the VPS for reference by other syntax
 *  elements.
 * @max_layers_minus1: specifies the number of layers specified by the VPS.
 * @max_sublayers_minus1: specifies the maximum number of temporal sublayers
 *  that may be present in a layer specified by the VPS.
 * @default_ptl_dpb_hrd_max_tid_flag: specifies whether the syntax elements
 *  vps_ptl_max_tid, vps_dpb_max_tid, and vps_hrd_max_tid are present.
 * @all_independent_layers_flag: specifies whether all layers specified by the
 *  VPS are independently coded without using inter-layer prediction.
 * @layer_id: specifies the nuh_layer_id value of the i-th layer.
 * @independent_layer_flag: specifies whether the layer with index i does not
 *  use inter-layer prediction.
 * @max_tid_ref_present_flag: specifies whether the syntax element
 *  vps_max_tid_il_ref_pics_plus1 could be present.
 * @direct_ref_layer_flag: specifies whether the layer with index j is not a
 *  direct reference layer for the layer with index i.
 * @max_tid_il_ref_pics_plus1: specifies whether the pictures of the j-th layer
 *  that are neither IRAP pictures nor GDR pictures with ph_recovery_poc_cnt
 *  equal to 0 are not used as ILRPs for decoding of pictures of the i-th layer.
 * @each_layer_is_an_ols_flag: specifies whether each OLS specified by the VPS
 *  contains only one layer and each layer specified by the VPS is an OLS with
 *  the single included layer being the only output layer.
 * @ols_mode_idc: specifies whether the total number of OLSs specified by the
 *  VPS is equal to vps_max_layers_minus1 + 1.
 * @total_num_olss: specifies the total number of OLSs specified by the VPS.
 * @num_multi_layer_olss: specifies the number of multi-layer OLSs (i.e., OLSs
 *  that contain more than one layer).
 * @multi_layer_ols_idx: specifies the index to the list of multi-layer OLSs
 *  for the i-th OLS.
 * @num_layers_in_ols: specifies the number of layers in the i-th OLS.
 * @layer_id_in_ols: specifies the nuh_layer_id value of the j-th layer in
 *  the i-th OLS.
 * @num_output_layer_sets_minus2: specifies the total number of OLSs
 *  specified by the VPS when vps_ols_mode_idc is equal to 2.
 * @ols_output_layer_flag: specifies whether the layer with nuh_layer_id
 *  equal to vps_layer_id[j] is an output layer of the i-th OLS when
 *  vps_ols_mode_idc is equal to 2.
 * @num_output_layers_in_ols: specifies the number of output layers in
 *  the i-th OLS.
 * @output_layer_id_in_ols: specifies the nuh_layer_id value of the j-th
 *  output layer in the i-th OLS.
 * @num_sub_layers_in_layer_in_ols: specifies the number of sublayers in the
 *  j-th layer in the i-th OLS.
 * @num_ptls_minus1: specifies the number of profile_tier_level
 *  syntax structures in the VPS.
 * @pt_present_flag: specifies whether profile, tier, and general constraints
 *  information are present in the i-th profile_tier_level syntax structure
 *  in the VPS.
 * @ptl_max_tid: specifies the TemporalId of the highest sublayer representation.
 * @profile_tier_level: specifies the profile, tier and level using
 *  #GstH266ProfileTierLevel.
 * @ols_ptl_idx: specifies the index of the profile_tier_level syntax
 *  structure that applies to the i-th OLS.
 * @num_dpb_params_minus1: specifies the number of dpb_parameters syntax
 *  strutcures in the VPS.
 * @sublayer_dpb_params_present_flag: is used to control the presence of
 *  dpb_max_dec_pic_buffering_minus1[j], dpb_max_num_reorder_pics[j], and
 *  dpb_max_latency_increase_plus1[j] syntax elements in the dpb_parameters
 *  syntax strucures in the VPS.
 * @dpb_max_tid: specifies the TemporalId of the highest sublayer representation
 *  for which the DPB parameters could be present in the i-th dpb_parameters
 *  syntax strutcure in the VPS.
 * @dpb: the DPB parameters using #GstH266DPBParameters.
 * @ols_dpb_pic_width: specifies the width of each picture storage buffer for
 *  the i-th multi-layer OLS.
 * @ols_dpb_pic_height: specifies the height of each picture storage buffer
 *  for the i-th multi-layer OLS.
 * @ols_dpb_chroma_format: specifies the greatest allowed value of
 *  sps_chroma_format_idc for all SPSs.
 * @ols_dpb_bitdepth_minus8: specifies the greatest allowed value of
 *  sps_bitdepth_minus8 for all SPSs.
 * @ols_dpb_params_idx: specifies the index of the dpb_parameters syntax
 *  structure that applies to the i-th multi-layer OLS.
 * @timing_hrd_params_present_flag: specifies whether the VPS contains a
 *  general_timing_hrd_parameters syntax structure and other HRD parameters.
 * @general_hrd_params: HRD parameters in #GstH266GeneralHRDParameters.
 * @sublayer_cpb_params_present_flag: specifies that the i-th
 *  ols_timing_hrd_parameters syntax structure in the VPS contains HRD
 *  parameters for the sublayer representations.
 * @num_ols_timing_hrd_params_minus1: specifies the number of
 *  ols_timing_hrd_parameters syntax structures present in the VPS.
 * @hrd_max_tid: specifies the TemporalId of the highest sublayer representation
 *  for which the HRD parameters are contained in the i-th
 *  ols_timing_hrd_parameters syntax structure.
 * @ols_hrd_params: OLS HRD parameters using #GstH266OLSHRDParameters.
 * @ols_timing_hrd_idx: specifies the index of the ols_timing_hrd_parameters
 *  syntax structure that applies to the i-th multi-layer OLS.
 * @extension_flag: specifies whether no vps_extension_data_flag syntax elements
 *  are present in the VPS RBSP syntax structure.
 * @extension_data: could have any value, it is not defined in this version of
 *  this Specification.
 * @valid: whether this VPS is valid.
 *
 * Structure defining the H266 VPS.
 *
 * Since: 1.26
  }
{ Reserve some data for future usage.  }
  PGstH266VPS = ^TGstH266VPS;
  TGstH266VPS = record
      vps_id : Tguint8;
      max_layers_minus1 : Tguint8;
      max_sublayers_minus1 : Tguint8;
      default_ptl_dpb_hrd_max_tid_flag : Tguint8;
      all_independent_layers_flag : Tguint8;
      layer_id : array[0..(GST_H266_MAX_LAYERS)-1] of Tguint8;
      independent_layer_flag : array[0..(GST_H266_MAX_LAYERS)-1] of Tguint8;
      max_tid_ref_present_flag : array[0..(GST_H266_MAX_LAYERS)-1] of Tguint8;
      direct_ref_layer_flag : array[0..(GST_H266_MAX_LAYERS)-1] of array[0..(GST_H266_MAX_LAYERS)-1] of Tguint8;
      max_tid_il_ref_pics_plus1 : array[0..(GST_H266_MAX_LAYERS)-1] of array[0..(GST_H266_MAX_LAYERS)-1] of Tguint8;
      each_layer_is_an_ols_flag : Tguint8;
      ols_mode_idc : Tguint8;
      total_num_olss : Tguint;
      num_multi_layer_olss : Tguint;
      multi_layer_ols_idx : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of Tguint16;
      num_layers_in_ols : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of Tguint16;
      layer_id_in_ols : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of array[0..(GST_H266_MAX_LAYERS)-1] of Tguint8;
      num_output_layer_sets_minus2 : Tguint8;
      ols_output_layer_flag : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of array[0..(GST_H266_MAX_LAYERS)-1] of Tguint8;
      num_output_layers_in_ols : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of Tguint16;
      output_layer_id_in_ols : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of array[0..(GST_H266_MAX_LAYERS)-1] of Tguint8;
      num_sub_layers_in_layer_in_ols : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of array[0..(GST_H266_MAX_LAYERS)-1] of Tguint8;
      num_ptls_minus1 : Tguint8;
      pt_present_flag : array[0..(GST_H266_MAX_PTLS)-1] of Tguint8;
      ptl_max_tid : array[0..(GST_H266_MAX_PTLS)-1] of Tguint8;
      profile_tier_level : array[0..(GST_H266_MAX_PTLS)-1] of TGstH266ProfileTierLevel;
      ols_ptl_idx : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of Tguint8;
      num_dpb_params_minus1 : Tguint8;
      sublayer_dpb_params_present_flag : Tguint8;
      dpb_max_tid : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of Tguint8;
      dpb : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of TGstH266DPBParameters;
      ols_dpb_pic_width : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of Tguint16;
      ols_dpb_pic_height : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of Tguint16;
      ols_dpb_chroma_format : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of Tguint8;
      ols_dpb_bitdepth_minus8 : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of Tguint8;
      ols_dpb_params_idx : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of Tguint8;
      timing_hrd_params_present_flag : Tguint8;
      general_hrd_params : TGstH266GeneralHRDParameters;
      sublayer_cpb_params_present_flag : Tguint8;
      num_ols_timing_hrd_params_minus1 : Tguint8;
      hrd_max_tid : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of Tguint8;
      ols_hrd_params : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of TGstH266OLSHRDParameters;
      ols_timing_hrd_idx : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of Tguint8;
      extension_flag : Tguint8;
      extension_data : array[0..63] of Tguint8;
      valid : Tgboolean;
    end;

{*
 * GstH266RefPicListStruct:
 * @num_ref_entries: specifies the number of entries in the
 *  ref_pic_list_struct(listIdx, rplsIdx) syntax structure.
 * @ltrp_in_header_flag: specifies whether the POC LSBs of the LTRP entries
 *  indicated in the ref_pic_list_struct(listIdx, rplsIdx) syntax structure
 *  are present in the same syntax structure.
 * @inter_layer_ref_pic_flag: specifies whether the i-th entry in the
 *  ref_pic_list_struct(listIdx, rplsIdx) syntax structure is an ILRP entry.
 * @st_ref_pic_flag: specifies whether the i-th entry in the
 *  ref_pic_list_struct(listIdx, rplsIdx) syntax structure is an STRP entry.
 * @abs_delta_poc_st: specifies the value of the variable
 *  AbsDeltaPocSt[listIdx][rplsIdx][i].
 * @strp_entry_sign_flag: specifies whether DeltaPocValSt[listIdx][rplsIdx]
 *  is greater than or equal to 0.
 * @rpls_poc_lsb_lt: specifies the value of the picture order count modulo
 *  MaxPicOrderCntLsb of the picture referred to.
 * @ilrp_idx: specifies the index of the ILRP entry of the i-th entry in the
 *  ref_pic_list_struct.
 * @num_short_term_pic: the number of short term reference picture.
 * @num_long_term_pic: the number long term reference picture.
 * @num_inter_layer_pic: the number of inter layer reference picture.
 * @delta_poc_val_st: the calculated DeltaPocValSt value.
 *
 * Structure defining the H266 reference picture list.
 *
 * Since: 1.26
  }
  PGstH266RefPicListStruct = ^TGstH266RefPicListStruct;
  TGstH266RefPicListStruct = record
      num_ref_entries : Tguint8;
      ltrp_in_header_flag : Tguint8;
      inter_layer_ref_pic_flag : array[0..(GST_H266_MAX_REF_ENTRIES)-1] of Tguint8;
      st_ref_pic_flag : array[0..(GST_H266_MAX_REF_ENTRIES)-1] of Tguint8;
      abs_delta_poc_st : array[0..(GST_H266_MAX_REF_ENTRIES)-1] of Tguint16;
      strp_entry_sign_flag : array[0..(GST_H266_MAX_REF_ENTRIES)-1] of Tguint8;
      rpls_poc_lsb_lt : array[0..(GST_H266_MAX_REF_ENTRIES)-1] of Tguint8;
      ilrp_idx : array[0..(GST_H266_MAX_REF_ENTRIES)-1] of Tguint8;
      num_short_term_pic : Tguint;
      num_long_term_pic : Tguint;
      num_inter_layer_pic : Tguint;
      delta_poc_val_st : array[0..(GST_H266_MAX_REF_ENTRIES)-1] of Tgint16;
    end;

{*
 * GstH266RefPicLists:
 * @rpl_sps_flag: specifies whether RPL i in ref_pic_lists is derived based
 *  on one of the ref_pic_list_struct(listIdx, rplsIdx) syntax structures
 *  with listIdx equal to i in the SPS.
 * @rpl_idx: specifies the index into the list of the
 *  ref_pic_list_struct(listIdx, rplsIdx) syntax structures.
 * @rpl_ref_list: reference list of #GstH266RefPicListStruct.
 * @poc_lsb_lt: specifies the value of the picture order count
 *  modulo MaxPicOrderCntLsb.
 * @delta_poc_msb_cycle_present_flag: specifies whether
 *  delta_poc_msb_cycle_lt[i][j] is present.
 * @delta_poc_msb_cycle_lt: specifies the value of the variable FullPocLt[i][j].
 *
 * Structure defining the H266 reference picture lists.
 *
 * Since: 1.26
  }
  PGstH266RefPicLists = ^TGstH266RefPicLists;
  TGstH266RefPicLists = record
      rpl_sps_flag : array[0..1] of Tguint8;
      rpl_idx : array[0..1] of Tguint8;
      rpl_ref_list : array[0..1] of TGstH266RefPicListStruct;
      poc_lsb_lt : array[0..1] of array[0..(GST_H266_MAX_REF_ENTRIES)-1] of Tguint16;
      delta_poc_msb_cycle_present_flag : array[0..1] of array[0..(GST_H266_MAX_REF_ENTRIES)-1] of Tguint8;
      delta_poc_msb_cycle_lt : array[0..1] of array[0..(GST_H266_MAX_REF_ENTRIES)-1] of Tguint16;
    end;

{*
 * GstH266VUIParams:
 * @progressive_source_flag: flag to indicate the progressive type of stream.
 * @interlaced_source_flag: flag to indicate the interlaced type of stream.
 * @non_packed_constraint_flag: indicate the presence of frame packing
 *  arrangement sei message
 * @non_projected_constraint_flag: flag to indicate the projected support.
 * @aspect_ratio_info_present_flag: specifies whether aspect_ratio_idc is present.
 * @aspect_ratio_constant_flag: specifies whether the ratio is constant.
 * @aspect_ratio_idc: specifies the value of the sample aspect ratio of
 *  the luma samples.
 * @sar_width: indicates the horizontal size of the sample aspect ratio.
 * @sar_height: indicates the vertical size of the sample aspect ratio.
 * @overscan_info_present_flag: specify whether the overscan_appropriate_flag
 *  is present.
 * @overscan_appropriate_flag: indicates whether the cropped decoded pictures
 *  output are suitable for display using overscan.
 * @colour_description_present_flag: specifies whether colour_primaries,
 *  transfer_characteristics and matrix_coefficients are present.
 * @colour_primaries: indicates the chromaticity coordinates of the source
 *  primaries.
 * @transfer_characteristics: indicates the opto-electronic
 *  transfer characteristic.
 * @matrix_coeffs: describes the matrix coefficients used in deriving
 *  luma and chroma signals.
 * @full_range_flag: indicates the full range of the color.
 * @chroma_loc_info_present_flag: specifies whether chroma_sample_loc_type_frame,
 *  chroma_sample_loc_type_top_field and chroma_sample_loc_type_bottom_field
 *  are present.
 * @chroma_sample_loc_type_frame: specify the location of chroma for the frame.
 * @chroma_sample_loc_type_top_field: specify the location of chroma for the
 *  top field.
 * @chroma_sample_loc_type_bottom_field: specify the location of chroma for the
 *  bottom field.
 * @par_n: calculated aspect ratio numerator value.
 * @par_d: calculated aspect ratio denominator value.
 *
 * Structure defining the H266 VUI parameters.
 *
 * Since: 1.26
  }
{ extension_data  }
{ calculated values  }
  PGstH266VUIParams = ^TGstH266VUIParams;
  TGstH266VUIParams = record
      progressive_source_flag : Tguint8;
      interlaced_source_flag : Tguint8;
      non_packed_constraint_flag : Tguint8;
      non_projected_constraint_flag : Tguint8;
      aspect_ratio_info_present_flag : Tguint8;
      aspect_ratio_constant_flag : Tguint8;
      aspect_ratio_idc : Tguint8;
      sar_width : Tguint16;
      sar_height : Tguint16;
      overscan_info_present_flag : Tguint8;
      overscan_appropriate_flag : Tguint8;
      colour_description_present_flag : Tguint8;
      colour_primaries : Tguint8;
      transfer_characteristics : Tguint8;
      matrix_coeffs : Tguint8;
      full_range_flag : Tguint8;
      chroma_loc_info_present_flag : Tguint8;
      chroma_sample_loc_type_frame : Tguint8;
      chroma_sample_loc_type_top_field : Tguint8;
      chroma_sample_loc_type_bottom_field : Tguint8;
      par_n : Tguint;
      par_d : Tguint;
    end;

{*
 * GstH266SPSRangeExtensionParams:
 * @extended_precision_flag: specifies whether an extended dynamic range is
 *  used for transform coefficients.
 * @ts_residual_coding_rice_present_in_sh_flag: specifies whether
 *  sh_ts_residual_coding_rice_idx_minus1 may be present in slice_header
 *  syntax structures referring to the SPS.
 * @rrc_rice_extension_flag: specifies whether an alternative Rice parameter
 *  derivation is used.
 * @persistent_rice_adaptation_enabled_flag: specifies whether Rice parameter
 *  derivation is initialized at the start of each TU using statistics
 *  accumulated from previous TUs.
 * @reverse_last_sig_coeff_enabled_flag: specifies whether
 *  sh_reverse_last_sig_coeff_flag is present in slice_header syntax
 *  structures referring to the SPS.
 *
 * Structure defining the H266 SPS range extension parameters.
 *
 * Since: 1.26
  }
  PGstH266SPSRangeExtensionParams = ^TGstH266SPSRangeExtensionParams;
  TGstH266SPSRangeExtensionParams = record
      extended_precision_flag : Tguint8;
      ts_residual_coding_rice_present_in_sh_flag : Tguint8;
      rrc_rice_extension_flag : Tguint8;
      persistent_rice_adaptation_enabled_flag : Tguint8;
      reverse_last_sig_coeff_enabled_flag : Tguint8;
    end;

{*
 * GstH266SPS:
 * @nuh_layer_id: specifies the identifier of the layer to which a VCL NAL unit
 *  belongs or the identifier of a layer to which a non-VCL NAL unit applies.
 * @sps_id: provides an identifier for the SPS for reference by other
 *  syntax elements.
 * @vps_id: specifies the VPS referred to by this SPS.
 * @vps: the #GstH266VPS this SPS refers to.
 * @max_sublayers_minus1: specifies the maximum number of temporal sublayers
 *  that could be present in each CLVS referring to the SPS.
 * @chroma_format_idc: specifies the chroma sampling relative to the
 *  luma sampling.
 * @log2_ctu_size_minus5: specifies the luma coding tree block size of each CTU.
 * @ctu_size: the calculated ctu size.
 * @ptl_dpb_hrd_params_present_flag: specifies whether a profile_tier_level
 *  syntax structure and a dpb_parameters syntax structure are present
 *  in the SPS.
 * @dpb: DPB parameters of #GstH266DPBParameters.
 * @profile_tier_level: the profile tier and level in #GstH266ProfileTierLevel.
 * @general_hrd_params: HRD parameters of #GstH266GeneralHRDParameters.
 * @ols_hrd_params: OLS HRD parameters of #GstH266OLSHRDParameters.
 * @gdr_enabled_flag: specifies whether GDR pictures are enabled and could
 *  be present in the CLVS.
 * @res_change_in_clvs_allowed_flag: specifies whether the picture spatial
 *  resolution might change within a CLVS.
 * @ref_pic_resampling_enabled_flag: specifies whether reference picture
 *  resampling is enabled.
 * @pic_width_max_in_luma_samples: specifies the maximum width, in units of
 *  luma samples, of each decoded picture.
 * @pic_height_max_in_luma_samples: specifies the maximum height, in units of
 *  luma samples, of each decoded picture.
 * @conformance_window_flag: indicates whether the conformance cropping window
 *  offset parameters follow next in the SPS.
 * @conf_win_left_offset: specify left offset of the cropping window that
 *  is applied to pictures.
 * @conf_win_right_offset: specify right offset of the cropping window that
 *  is applied to pictures.
 * @conf_win_top_offset: specify top offset of the cropping window that
 *  is applied to pictures.
 * @conf_win_bottom_offset: specify bottom offset of the cropping window that
 *  is applied to pictures.
 * @subpic_info_present_flag: specifies whether subpicture information is
 *  present for the CLVS and there might be one or more than one subpicture
 *  in each picture of the CLVS.
 * @num_subpics_minus1: specifies the number of subpictures in each picture
 *  in the CLVS.
 * @independent_subpics_flag: specifies whether all subpicture boundaries in
 *  the CLVS are treated as picture boundaries and there is no loop filtering
 *  across the subpicture boundaries.
 * @subpic_same_size_flag: specifies whether all subpictures in the CLVS have
 *  the same width and height.
 * @subpic_ctu_top_left_x: specifies horizontal position of top-left CTU of
 *  i-th subpicture in unit of CtbSizeY.
 * @subpic_ctu_top_left_y: specifies vertical position of top-left CTU of
 *  i-th subpicture in unit of CtbSizeY.
 * @subpic_width_minus1: specifies the width of the i-th subpicture in units
 *  of CtbSizeY.
 * @subpic_height_minus1: specifies the height of the i-th subpicture in
 *  units of CtbSizeY.
 * @subpic_treated_as_pic_flag: specifies whether the i-th subpicture of each
 *  coded picture in the CLVS is treated as a picture.
 * @loop_filter_across_subpic_enabled_flag: specifies whether in-loop filtering
 *  operations across subpicture boundaries is enabled and might be performed
 *  across the boundaries of the i-th subpicture.
 * @subpic_id: specifies the subpicture ID of the i-th subpicture.
 * @subpic_id_len_minus1: specifies the number of bits used to represent the
 *  syntax element sps_subpic_id[i].
 * @subpic_id_mapping_explicitly_signalled_flag: specifies whether the
 *  subpicture ID mapping is explicitly signalled.
 * @subpic_id_mapping_present_flag: specifies whether the subpicture ID mapping
 *  is signalled in the SPS.
 * @bitdepth_minus8: specifies the bit depth of the samples of the luma and
 *  chroma arrays.
 * @entropy_coding_sync_enabled_flag: specifies whether a specific synchronization
 *  process for context variables is invoked before decoding the CTU.
 * @entry_point_offsets_present_flag: specifies whether signalling for entry
 *  point offsets for tiles or tile-specific CTU rows could be present in the
 *  slice headers of pictures.
 * @log2_max_pic_order_cnt_lsb_minus4: specifies the value of the variable
 *  MaxPicOrderCntLsb.
 * @poc_msb_cycle_flag: specifies whether the ph_poc_msb_cycle_present_flag
 *  syntax element is present in PH syntax structures.
 * @poc_msb_cycle_len_minus1: specifies the length, in bits, of the
 *  ph_poc_msb_cycle_val syntax elements.
 * @num_extra_ph_bytes: specifies the number of bytes of extra bits in the PH
 *  syntax structure for coded pictures.
 * @extra_ph_bit_present_flag: specifies whether the i-th extra bit is present
 *  in PH syntax structures.
 * @num_extra_sh_bytes: specifies the number of bytes of extra bits in the
 *  slice headers for coded pictures.
 * @extra_sh_bit_present_flag: specifies whether the i-th extra bit is present
 *  in the slice headers of pictures.
 * @sublayer_dpb_params_flag: used to control the presence of
 *  dpb_max_dec_pic_buffering_minus1[i], dpb_max_num_reorder_pics[i],
 *  and dpb_max_latency_increase_plus1[i] syntax elements in the
 *  dpb_parameters syntax strucure.
 * @log2_min_luma_coding_block_size_minus2: specifies the minimum luma coding
 *  block size.
 * @partition_constraints_override_enabled_flag: specifies the presence of
 *  ph_partition_constraints_override_flag in PH syntax structures.
 * @log2_diff_min_qt_min_cb_intra_slice_luma: specifies the default difference
 *  between the base 2 logarithm of the minimum size in luma samples of a luma
 *  leaf block resulting from quadtree splitting of a CTU and the base 2
 *  logarithm of the minimum coding block size in luma samples.
 * @max_mtt_hierarchy_depth_intra_slice_luma: specifies the default maximum
 *  hierarchy depth for coding units resulting from multi-type tree splitting
 *  of a quadtree leaf in slices with sh_slice_type equal to 2(I).
 * @log2_diff_max_bt_min_qt_intra_slice_luma: specifies the default difference
 *  between the base 2 logarithm of the maximum size in luma samples of a luma
 *  coding block that can be split using a binary split and the base 2 logarithm
 *  of the minimum size in luma samples of a luma leaf block resulting from
 *  quadtree splitting.
 * @log2_diff_max_tt_min_qt_intra_slice_luma: specifies the default difference
 *  between the base 2 logarithm of the maximum size in luma samples of a luma
 *  coding block that can be split using a ternary split and the base 2
 *  logarithm of the minimum size in luma samples of a luma leaf block resulting
 *  from quadtree splitting.
 * @qtbtt_dual_tree_intra_flag: specifies whether each CTU is split into coding
 *  units with 64x64 luma samples using an implicit quadtree split, and these
 *  coding units are the root of two separate coding_tree syntax structure for
 *  luma and chroma.
 * @log2_diff_min_qt_min_cb_intra_slice_chroma: specifies the default difference
 *  between the base 2 logarithm of the minimum size in luma samples of a chroma
 *  leaf block resulting from quadtree splitting of a chroma CTU and the base 2
 *  logarithm of the minimum coding block size in luma samples for chroma CUs
 *  in slices with sh_slice_type equal to 2(I).
 * @max_mtt_hierarchy_depth_intra_slice_chroma: specifies the default maximum
 *  hierarchy depth for chroma coding units resulting from multi-type tree
 *  splitting of a chroma quadtree leaf in slices with sh_slice_type equal to 2(I).
 * @log2_diff_max_bt_min_qt_intra_slice_chroma: specifies the default difference
 *  between the base 2 logarithm of the maximum size in luma samples of a chroma
 *  coding block that can be split using a binary split and the base 2 logarithm
 *  of the minimum size in luma samples of a chroma leaf block resulting from
 *  quadtree splitting of a chroma CTU in slices with sh_slice_type equal to 2(I).
 * @log2_diff_max_tt_min_qt_intra_slice_chroma: specifies the default difference
 *  between the base 2 logarithm of the maximum size in luma samples of a chroma
 *  coding block that can be split using a ternary split and the base 2 logarithm
 *  of the minimum size in luma samples of a chroma leaf block resulting from
 *  quadtree splitting of a chroma CTU in slices with sh_slice_type equal to 2(I).
 * @log2_diff_min_qt_min_cb_inter_slice: specifies the default difference between
 *  the base 2 logarithm of the minimum size in luma samples of a luma leaf block
 *  resulting from quadtree splitting of a CTU and the base 2 logarithm of the
 *  minimum luma coding block size in luma samples for luma CUs in slices with
 *  sh_slice_type equal to 0(B) or 1(P).
 * @max_mtt_hierarchy_depth_inter_slice: specifies the default maximum hierarchy
 *  depth for coding units resulting from multi-type tree splitting of a quadtree
 *  leaf in slices with sh_slice_type equal to 0 (B) or 1 (P).
 * @log2_diff_max_bt_min_qt_inter_slice: specifies the default difference between
 *  the base 2 logarithm of the maximum size in luma samples of a luma coding
 *  block that can be split using a binary split and the base 2 logarithm of the
 *  minimum size in luma samples of a luma leaf block resulting from quadtree
 *  splitting of a CTU in slices with sh_slice_type equal to 0(B) or 1(P).
 * @log2_diff_max_tt_min_qt_inter_slice: specifies the default difference between
 *  the base 2 logarithm of the maximum size in luma samples of a luma coding
 *  block that can be split using a ternary split and the base 2 logarithm of
 *  the minimum size in luma samples of a luma leaf block resulting from quadtree
 *  splitting of a CTU in slices with sh_slice_type equal to 0(B) or 1(P).
 * @max_luma_transform_size_64_flag: specifies whether the maximum transform
 *  size in luma samples is equal to 64.
 * @transform_skip_enabled_flag: specifies whether transform_skip_flag could be
 *  present in the transform unit syntax.
 * @log2_transform_skip_max_size_minus2: specifies the maximum block size used
 *  for transform skip.
 * @bdpcm_enabled_flag: specifies whether intra_bdpcm_luma_flag and
 *  intra_bdpcm_chroma_flag could be present in the coding unit syntax for
 *  intra coding units.
 * @mts_enabled_flag: specifies whether sps_explicit_mts_intra_enabled_flag
 *  and sps_explicit_mts_inter_enabled_flag are present in the SPS.
 * @explicit_mts_intra_enabled_flag: specifies whether mts_idx could be present
 *  in the intra coding unit syntax of the CLVS.
 * @explicit_mts_inter_enabled_flag: specifies whether mts_idx could be present
 *  in the inter coding unit syntax of the CLVS.
 * @lfnst_enabled_flag: specifies whether lfnst_idx could be present in intra
 *  coding unit syntax.
 * @joint_cbcr_enabled_flag: specifies whether the joint coding of chroma
 *  residuals is enabled for the CLVS.
 * @same_qp_table_for_chroma_flag: specifies whether only one chroma QP mapping
 *  table is signalled and this table applies to Cb and Cr residuals and
 *  additionally to joint Cb-Cr residuals.
 * @qp_table_start_minus26: specifies the starting luma and chroma QP used to
 *  describe the i-th chroma QP mapping table.
 * @num_points_in_qp_table_minus1: specifies the number of points used to
 *  describe the i-th chroma QP mapping table.
 * @delta_qp_in_val_minus1: specifies a delta value used to derive the input
 *  coordinate of the j-th pivot point of the i-th chroma QP mapping table.
 * @delta_qp_diff_val: specifies a delta value used to derive the output
 *  coordinate of the j-th pivot point of the i-th chroma QP mapping table.
 * @sao_enabled_flag: specifies whether SAO is enabled for the CLVS.
 * @alf_enabled_flag: specifies whether ALF is enabled for the CLVS.
 * @ccalf_enabled_flag: specifies whether CCALF is enabled for the CLVS.
 * @lmcs_enabled_flag: specifies whether LMCS is enabled for the CLVS.
 * @weighted_pred_flag: specifies whether weighted prediction might be applied
 *  to P slices referring to the SPS.
 * @weighted_bipred_flag: specifies whether explicit weighted prediction might
 *  be applied to B slices referring to the SPS.
 * @guint8 long_term_ref_pics_flag: specifies whether no LTRP is used for inter
 *  prediction of any coded picture in the CLVS.
 * @inter_layer_prediction_enabled_flag: specifies whether inter-layer prediction
 *  is enabled for the CLVS and ILRPs might be used for inter prediction of one
 *  or more coded pictures in the CLVS.
 * @idr_rpl_present_flag: specifies whether RPL syntax elements could be present
 *  in slice headers of slices with nal_unit_type equal to IDR_N_LP or IDR_W_RADL.
 * @rpl1_same_as_rpl0_flag: specifies whether the syntax element
 *  sps_num_ref_pic_lists[1] and the syntax structure ref_pic_list_struct(1,
    rplsIdx) are present.
 * @num_ref_pic_lists: specifies the number of the ref_pic_list_struct(listIdx,
 *  rplsIdx) syntax structures with listIdx equal to i included in the SPS.
 * @ref_pic_list_struct: the reference list of #GstH266RefPicListStruct.
 * @ref_wraparound_enabled_flag: specifies whether horizontal wrap-around motion
 *  compensation is enabled for the CLVS.
 * @temporal_mvp_enabled_flag: specifies whether temporal motion vector
 *  predictors are enabled for the CLVS.
 * @sbtmvp_enabled_flag: specifies whether subblock-based temporal motion vector
 *  predictors are enabled and might be used in decoding of pictures with all
 *  slices having sh_slice_type not equal to I in the CLVS.
 * @amvr_enabled_flag: specifies whether adaptive motion vector difference
 *  resolution is enabled for the CVLS.
 * @bdof_enabled_flag: specifies whether the bi-directional optical flow inter
 *  prediction is enabled for the CLVS.
 * @bdof_control_present_in_ph_flag: specifies whether ph_bdof_disabled_flag
 *  could be present in PH syntax structures referring to the SPS.
 * @smvd_enabled_flag: specifies whether symmetric motion vector difference
 *  is enabled for the CLVS.
 * @dmvr_enabled_flag: specifies whether decoder motion vector refinement based
 *  inter bi-prediction is enabled for the CLVS.
 * @dmvr_control_present_in_ph_flag: specifies whether ph_dmvr_disabled_flag
 *  could be present in PH syntax structures referring to the SPS.
 * @mmvd_enabled_flag: specifies whether merge mode with motion vector
 *  difference is enabled for the CLVS.
 * @mmvd_fullpel_only_enabled_flag: specifies whether the merge mode with motion
 *  vector difference using only integer sample precision is enabled for the CLVS.
 * @six_minus_max_num_merge_cand: specifies the maximum number of merging motion
 *  vector prediction (MVP) candidates supported in the SPS.
 * @sbt_enabled_flag: specifies whether subblock transform for inter-predicted
 *  CUs is enabled for the CLVS.
 * @affine_enabled_flag: specifies whether the affine model based motion
 *  compensation is enabled for the CLVS.
 * @five_minus_max_num_subblock_merge_cand: specifies the maximum number of
 *  subblock-based merging motion vector prediction candidates supported.
 * @sps_6param_affine_enabled_flag: specifies whether the 6-parameter affine
 *  model based motion compensation is enabled for the CLVS.
 * @affine_amvr_enabled_flag: specifies whether adaptive motion vector
 *  difference resolution is enabled for the CLVS.
 * @affine_prof_enabled_flag: specifies whether the affine motion compensation
 *  refined with optical flow is enabled for the CLVS.
 * @prof_control_present_in_ph_flag: specifies whether ph_prof_disabled_flag
 *  could be present in PH syntax structures.
 * bcw_enabled_flag: specifies whether bi-prediction with CU weights is enabled
 *  for the CLVS.
 * @ciip_enabled_flag: specifies whether ciip_flag could be present in the
 *  coding unit syntax for inter coding units.
 * @gpm_enabled_flag: specifies whether the geometric partition based motion
 *  compensation is enabled for the CLVS.
 * @max_num_merge_cand_minus_max_num_gpm_cand: specifies the maximum number of
 *  geometric partitioning merge mode candidates supported in the SPS.
 * @log2_parallel_merge_level_minus2: specifies the value of the variable
 *  Log2ParMrgLevel.
 * @isp_enabled_flag: specifies whether intra prediction with subpartitions is
 *  enabled for the CLVS.
 * @mrl_enabled_flag: specifies whether intra prediction with multiple reference
 *  lines is enabled for the CLVS.
 * @mip_enabled_flag: specifies whether the matrix-based intra prediction is
 *  enabled for the CLVS.
 * @cclm_enabled_flag: specifies whether the cross-component linear model intra
 *  prediction from luma component to chroma component is enabled for the CLVS.
 * @chroma_horizontal_collocated_flag: specifies whether prediction processes
 *  operate in a manner designed for chroma sample positions that are not
 *  horizontally shifted relative to corresponding luma sample positions.
 * @chroma_vertical_collocated_flag: specifies whether prediction processes
 *  operate in a manner designed for chroma sample positions that are not
 *  vertically shifted relative to corresponding luma sample positions.
 * @palette_enabled_flag: specifies whether the palette prediction mode is
 *  enabled for the CLVS.
 * @act_enabled_flag: specifies whether the adaptive colour transform is enabled
 *  for the CLVS.
 * @min_qp_prime_ts: specifies whether minimum allowed quantization parameter
 *  for transform skip mode.
 * @ibc_enabled_flag: specifies whether the IBC prediction mode is enabled for
 *  the CLVS.
 * @six_minus_max_num_ibc_merge_cand: specifies the maximum number of IBC
 *  merging block vector prediction (BVP) candidates.
 * @ladf_enabled_flag: specifies whether sps_num_ladf_intervals_minus2,
 *  sps_ladf_lowest_interval_qp_offset, sps_ladf_qp_offset[i], and
 *  sps_ladf_delta_threshold_minus1[i] are present in the SPS.
 * @num_ladf_intervals_minus2: specifies the number of
 *  sps_ladf_delta_threshold_minus1[i] and sps_ladf_qp_offset[i] syntax
 *  elements that are present in the SPS.
 * @ladf_lowest_interval_qp_offset: specifies the offset used to derive the
 *  variable qP.
 * @ladf_qp_offset: specifies the offset array used to derive the variable qP.
 * @ladf_delta_threshold_minus1: is used to compute the values of
 *  SpsLadfIntervalLowerBound[i].
 * @explicit_scaling_list_enabled_flag: specifies whether the use of an explicit
 *  scaling list is enabled for the CLVS.
 * @scaling_matrix_for_lfnst_disabled_flag: specifies whether scaling matrices
 *  are disabled for blocks coded with LFNST for the CLVS.
 * @scaling_matrix_for_alternative_colour_space_disabled_flag: specifies whether
 *  scaling matrices are disabled and not applied to blocks of a coding unit.
 * @scaling_matrix_designated_colour_space_flag: specifies whether the colour
 *  space of the scaling matrices is the colour space that does not use a colour
 *  space conversion for the decoded residuals.
 * @dep_quant_enabled_flag: specifies whether dependent quantization is enabled
 *  for the CLVS.
 * @sign_data_hiding_enabled_flag: specifies whether sign bit hiding is enabled
 *  for the CLVS.
 * @virtual_boundaries_enabled_flag: specifies whether disabling in-loop
 *  filtering across virtual boundaries is enabled for the CLVS.
 * @virtual_boundaries_present_flag: specifies whether information of virtual
 *  boundaries is signalled in the SPS.
 * @num_ver_virtual_boundaries: specifies the number of
 *  sps_virtual_boundary_pos_x_minus1[i] syntax elements.
 * @virtual_boundary_pos_x_minus1: specifies the location of the i-th vertical
 *  virtual boundary in units of luma samples divided by 8.
 * @num_hor_virtual_boundaries: specifies the number of
 *  sps_virtual_boundary_pos_y_minus1[i] syntax elements.
 * @virtual_boundary_pos_y_minus1: specifies the location of the i-th horizontal
 *  virtual boundary in units of luma samples divided by 8.
 * @timing_hrd_params_present_flag: specifies whether the SPS contains a
 *  general_timing_hrd_parameters syntax structure and an
 *  ols_timing_hrd_parameters syntax structure.
 * @sublayer_cpb_params_present_flag: specifies whether the
 *  ols_timing_hrd_parameters syntax structure in the SPS includes HRD
 *  parameters for sublayer representations.
 * @field_seq_flag: indicates whether the CLVS conveys pictures that
 *  represent fields.
 * @vui_parameters_present_flag: specifies whether the syntax structure
 *  vui_payload is present in the SPS RBSP syntax structure.
 * @vui_payload_size_minus1: specifies the number of RBSP bytes in the
 *  vui_payload syntax structure.
 * @vui_params: VUI parameters of #GstH266VUIParams.
 * @extension_flag: specifies whether the syntax elements
 *  sps_range_extension_flag and sps_extension_7bits are present.
 * @range_extension_flag: specifies whether the sps_range_extension syntax
 *  structure is present.
 * @extension_7_flags: specifies whether no sps_extension_data_flag syntax
 *  elements are present.
 * @range_params: range parameters of #GstH266SPSRangeExtensionParams.
 * @max_width: the calculated max width of the picture.
 * @max_height: the calculated max height of the picture.
 * @crop_rect_width: the cropped width of the picture.
 * @crop_rect_height: the cropped height of the picture.
 * @crop_rect_x: the x offset of the cropped window.
 * @crop_rect_y: the y offset of the cropped window.
 * @fps_num: the calculated FPS numerator.
 * @fps_den: the calculated FPS denominator.
 * @valid: whether the SPS is valid.
 *
 * Structure defining the H266 SPS.
 *
 * Since: 1.26
  }
{ calculated values  }
  PGstH266SPS = ^TGstH266SPS;
  TGstH266SPS = record
      nuh_layer_id : Tguint8;
      sps_id : Tguint8;
      vps_id : Tguint8;
      vps : PGstH266VPS;
      max_sublayers_minus1 : Tguint8;
      chroma_format_idc : Tguint8;
      log2_ctu_size_minus5 : Tguint8;
      ctu_size : Tguint;
      ptl_dpb_hrd_params_present_flag : Tguint8;
      dpb : TGstH266DPBParameters;
      profile_tier_level : TGstH266ProfileTierLevel;
      general_hrd_params : TGstH266GeneralHRDParameters;
      ols_hrd_params : TGstH266OLSHRDParameters;
      gdr_enabled_flag : Tguint8;
      res_change_in_clvs_allowed_flag : Tguint8;
      ref_pic_resampling_enabled_flag : Tguint8;
      pic_width_max_in_luma_samples : Tguint16;
      pic_height_max_in_luma_samples : Tguint16;
      conformance_window_flag : Tguint8;
      conf_win_left_offset : Tguint16;
      conf_win_right_offset : Tguint16;
      conf_win_top_offset : Tguint16;
      conf_win_bottom_offset : Tguint16;
      subpic_info_present_flag : Tguint8;
      num_subpics_minus1 : Tguint16;
      independent_subpics_flag : Tguint8;
      subpic_same_size_flag : Tguint8;
      subpic_ctu_top_left_x : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint16;
      subpic_ctu_top_left_y : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint16;
      subpic_width_minus1 : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint16;
      subpic_height_minus1 : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint16;
      subpic_treated_as_pic_flag : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint8;
      loop_filter_across_subpic_enabled_flag : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint8;
      subpic_id : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint32;
      subpic_id_len_minus1 : Tguint8;
      subpic_id_mapping_explicitly_signalled_flag : Tguint8;
      subpic_id_mapping_present_flag : Tguint8;
      bitdepth_minus8 : Tguint8;
      entropy_coding_sync_enabled_flag : Tguint8;
      entry_point_offsets_present_flag : Tguint8;
      log2_max_pic_order_cnt_lsb_minus4 : Tguint8;
      poc_msb_cycle_flag : Tguint8;
      poc_msb_cycle_len_minus1 : Tguint8;
      num_extra_ph_bytes : Tguint8;
      extra_ph_bit_present_flag : array[0..15] of Tguint8;
      num_extra_sh_bytes : Tguint8;
      extra_sh_bit_present_flag : array[0..15] of Tguint8;
      sublayer_dpb_params_flag : Tguint8;
      log2_min_luma_coding_block_size_minus2 : Tguint8;
      partition_constraints_override_enabled_flag : Tguint8;
      log2_diff_min_qt_min_cb_intra_slice_luma : Tguint8;
      max_mtt_hierarchy_depth_intra_slice_luma : Tguint8;
      log2_diff_max_bt_min_qt_intra_slice_luma : Tguint8;
      log2_diff_max_tt_min_qt_intra_slice_luma : Tguint8;
      qtbtt_dual_tree_intra_flag : Tguint8;
      log2_diff_min_qt_min_cb_intra_slice_chroma : Tguint8;
      max_mtt_hierarchy_depth_intra_slice_chroma : Tguint8;
      log2_diff_max_bt_min_qt_intra_slice_chroma : Tguint8;
      log2_diff_max_tt_min_qt_intra_slice_chroma : Tguint8;
      log2_diff_min_qt_min_cb_inter_slice : Tguint8;
      max_mtt_hierarchy_depth_inter_slice : Tguint8;
      log2_diff_max_bt_min_qt_inter_slice : Tguint8;
      log2_diff_max_tt_min_qt_inter_slice : Tguint8;
      max_luma_transform_size_64_flag : Tguint8;
      transform_skip_enabled_flag : Tguint8;
      log2_transform_skip_max_size_minus2 : Tguint8;
      bdpcm_enabled_flag : Tguint8;
      mts_enabled_flag : Tguint8;
      explicit_mts_intra_enabled_flag : Tguint8;
      explicit_mts_inter_enabled_flag : Tguint8;
      lfnst_enabled_flag : Tguint8;
      joint_cbcr_enabled_flag : Tguint8;
      same_qp_table_for_chroma_flag : Tguint8;
      qp_table_start_minus26 : array[0..(GST_H266_MAX_SAMPLE_ARRAYS)-1] of Tgint8;
      num_points_in_qp_table_minus1 : array[0..(GST_H266_MAX_SAMPLE_ARRAYS)-1] of Tguint8;
      delta_qp_in_val_minus1 : array[0..(GST_H266_MAX_SAMPLE_ARRAYS)-1] of array[0..(GST_H266_MAX_POINTS_IN_QP_TABLE)-1] of Tguint8;
      delta_qp_diff_val : array[0..(GST_H266_MAX_SAMPLE_ARRAYS)-1] of array[0..(GST_H266_MAX_POINTS_IN_QP_TABLE)-1] of Tguint8;
      sao_enabled_flag : Tguint8;
      alf_enabled_flag : Tguint8;
      ccalf_enabled_flag : Tguint8;
      lmcs_enabled_flag : Tguint8;
      weighted_pred_flag : Tguint8;
      weighted_bipred_flag : Tguint8;
      long_term_ref_pics_flag : Tguint8;
      inter_layer_prediction_enabled_flag : Tguint8;
      idr_rpl_present_flag : Tguint8;
      rpl1_same_as_rpl0_flag : Tguint8;
      num_ref_pic_lists : array[0..1] of Tguint8;
      ref_pic_list_struct : array[0..1] of array[0..(GST_H266_MAX_REF_PIC_LISTS)-1] of TGstH266RefPicListStruct;
      ref_wraparound_enabled_flag : Tguint8;
      temporal_mvp_enabled_flag : Tguint8;
      sbtmvp_enabled_flag : Tguint8;
      amvr_enabled_flag : Tguint8;
      bdof_enabled_flag : Tguint8;
      bdof_control_present_in_ph_flag : Tguint8;
      smvd_enabled_flag : Tguint8;
      dmvr_enabled_flag : Tguint8;
      dmvr_control_present_in_ph_flag : Tguint8;
      mmvd_enabled_flag : Tguint8;
      mmvd_fullpel_only_enabled_flag : Tguint8;
      six_minus_max_num_merge_cand : Tguint8;
      sbt_enabled_flag : Tguint8;
      affine_enabled_flag : Tguint8;
      five_minus_max_num_subblock_merge_cand : Tguint8;
      sps_6param_affine_enabled_flag : Tguint8;
      affine_amvr_enabled_flag : Tguint8;
      affine_prof_enabled_flag : Tguint8;
      prof_control_present_in_ph_flag : Tguint8;
      bcw_enabled_flag : Tguint8;
      ciip_enabled_flag : Tguint8;
      gpm_enabled_flag : Tguint8;
      max_num_merge_cand_minus_max_num_gpm_cand : Tguint8;
      log2_parallel_merge_level_minus2 : Tguint8;
      isp_enabled_flag : Tguint8;
      mrl_enabled_flag : Tguint8;
      mip_enabled_flag : Tguint8;
      cclm_enabled_flag : Tguint8;
      chroma_horizontal_collocated_flag : Tguint8;
      chroma_vertical_collocated_flag : Tguint8;
      palette_enabled_flag : Tguint8;
      act_enabled_flag : Tguint8;
      min_qp_prime_ts : Tguint8;
      ibc_enabled_flag : Tguint8;
      six_minus_max_num_ibc_merge_cand : Tguint8;
      ladf_enabled_flag : Tguint8;
      num_ladf_intervals_minus2 : Tguint8;
      ladf_lowest_interval_qp_offset : Tgint8;
      ladf_qp_offset : array[0..3] of Tgint8;
      ladf_delta_threshold_minus1 : array[0..3] of Tguint16;
      explicit_scaling_list_enabled_flag : Tguint8;
      scaling_matrix_for_lfnst_disabled_flag : Tguint8;
      scaling_matrix_for_alternative_colour_space_disabled_flag : Tguint8;
      scaling_matrix_designated_colour_space_flag : Tguint8;
      dep_quant_enabled_flag : Tguint8;
      sign_data_hiding_enabled_flag : Tguint8;
      virtual_boundaries_enabled_flag : Tguint8;
      virtual_boundaries_present_flag : Tguint8;
      num_ver_virtual_boundaries : Tguint32;
      virtual_boundary_pos_x_minus1 : array[0..2] of Tguint16;
      num_hor_virtual_boundaries : Tguint32;
      virtual_boundary_pos_y_minus1 : array[0..2] of Tguint16;
      timing_hrd_params_present_flag : Tguint8;
      sublayer_cpb_params_present_flag : Tguint8;
      field_seq_flag : Tguint8;
      vui_parameters_present_flag : Tguint8;
      vui_payload_size_minus1 : Tguint16;
      vui_params : TGstH266VUIParams;
      extension_flag : Tguint8;
      range_extension_flag : Tguint8;
      extension_7_flags : array[0..6] of Tguint8;
      range_params : TGstH266SPSRangeExtensionParams;
      max_width : Tgint;
      max_height : Tgint;
      crop_rect_width : Tgint;
      crop_rect_height : Tgint;
      crop_rect_x : Tgint;
      crop_rect_y : Tgint;
      fps_num : Tgint;
      fps_den : Tgint;
      chroma_qp_table : array[0..(GST_H266_MAX_SAMPLE_ARRAYS)-1] of array[0..(GST_H266_MAX_POINTS_IN_QP_TABLE)-1] of Tgint;
      valid : Tgboolean;
    end;

{*
 * GstH266PPS:
 * @pps_id: provides an identifier for the PPS for reference by other
 *  syntax elements.
 * @sps_id: specifies the SPS referred to by this PPS.
 * @sps: the #GstH266SPS this PPS refers to.
 * @mixed_nalu_types_in_pic_flag: specifies whether each picture referring to
 *  the PPS has more than one VCL NAL unit and the VCL NAL units do not have
 *  the same value of nal_unit_type.
 * @pic_width_in_luma_samples: specifies the width of each decoded picture
 *  referring to the PPS in units of luma samples.
 * @pic_height_in_luma_samples: specifies the height of each decoded picture
 *  referring to the PPS in units of luma samples.
 * @conformance_window_flag: specifies whether the conformance cropping window
 *  offset parameters follow next in the PPS.
 * @conf_win_left_offset: specify left offset of the cropping window that
 *  is applied to pictures.
 * @conf_win_right_offset: specify right offset of the cropping window that
 *  is applied to pictures.
 * @conf_win_top_offset: specify top offset of the cropping window that
 *  is applied to pictures.
 * @conf_win_bottom_offset: specify bottom offset of the cropping window that
 *  is applied to pictures.
 * @scaling_window_explicit_signalling_flag: specifies whether the scaling
 *  window offset parameters are present in the PPS.
 * @scaling_win_left_offset: specify the left offsets that are applied to the
 *  picture size for scaling ratio calculation.
 * @scaling_win_right_offset: specify the right offsets that are applied to the
 *  picture size for scaling ratio calculation.
 * @scaling_win_top_offset: specify the top offsets that are applied to the
 *  picture size for scaling ratio calculation.
 * @scaling_win_bottom_offset: specify the bottom offsets that are applied to
 *  the picture size for scaling ratio calculation.
 * @output_flag_present_flag: specifies whether the ph_pic_output_flag syntax
 *  element could be present in PH syntax structures referring to the PPS.
 * @no_pic_partition_flag: specifies whether no picture partitioning is applied
 *  to each picture referring to the PPS.
 * @subpic_id_mapping_present_flag: specifies whether the subpicture ID mapping
 *  is signalled in the PPS.
 * @num_subpics_minus1: shall be equal to sps_num_subpics_minus1.
 * @subpic_id_len_minus1: shall be equal to sps_subpic_id_len_minus1.
 * @subpic_id: specifies the subpicture ID of the i-th subpicture.
 * @log2_ctu_size_minus5: specifies the luma coding tree block size of each CTU.
 * @num_exp_tile_columns_minus1: specifies the number of explicitly provided
 *  tile column widths.
 * @num_exp_tile_rows_minus1: specifies the number of explicitly provided tile
 *  row heights.
 * @tile_column_width_minus1: specifies the width of the i-th tile column in
 *  units of CTBs.
 * @tile_row_height_minus1: specifies the height of the i-th tile row in units
 *  of CTBs.
 * @loop_filter_across_tiles_enabled_flag: specifies whether in-loop filtering
 *  operations across tile boundaries are enabled for pictures.
 * @rect_slice_flag: specifies whether the raster-san slice mode is in use for
 *  each picture referring to the PPS.
 * @single_slice_per_subpic_flag: specifies whether each subpicture consists of
 *  one and only one rectangular slice.
 * @num_slices_in_pic_minus1: specifies the number of rectangular slices in
 *  each picture.
 * @tile_idx_delta_present_flag: specifies whether all pictures are partitioned
 *  into rectangular slice rows and rectangular slice columns in slice raster
 *  order.
 * @slice_width_in_tiles_minus1: specifies the width of the i-th rectangular
 *  slice in units of tile columns.
 * @slice_height_in_tiles_minus1: specifies the height of the i-th rectangular
 *  slice in units of tile rows.
 * @num_exp_slices_in_tile: specifies the number of explicitly provided slice
 *  heights for the slices in the containing the i-th slice.
 * @exp_slice_height_in_ctus_minus1: specifies the height of the j-th rectangular
 *  slice in the tile containing the i-th slice.
 * @tile_idx_delta_val: specifies the difference between the tile index of the
 *  tile containing the first CTU in the (i+1)-th rectangular slice and the tile
 *  index of the tile containing the first CTU in the i-th rectangular slice.
 * @loop_filter_across_slices_enabled_flag: specifies whether in-loop filtering
 *  operations across slice boundaries are enabled.
 * @cabac_init_present_flag: specifies whether sh_cabac_init_flag is present
 *  in slice headers.
 * @num_ref_idx_default_active_minus1: specifies the inferred value of the
 *  variable NumRefIdxActive[0] for P or B slices.
 * @rpl1_idx_present_flag: specifies whether rpl_sps_flag[1] and rpl_idx[1] are
 *  present in the PH.
 * @weighted_pred_flag: specifies whether weighted prediction is applied to P
 *  slices.
 * @weighted_bipred_flag: specifies whether explicit weighted prediction is
 *  applied to B slices.
 * @ref_wraparound_enabled_flag: specifies whether the horizontal wrap-around
 *  motion compensation is enabled.
 * @pic_width_minus_wraparound_offset: specifies the difference between the
 *  picture width and the offset used for computing the horizontal wrap-around
 *  position in units of MinCbSizeY luma samples.
 * @init_qp_minus26: specifies the initial value of SliceQp Y for each slice.
 * @cu_qp_delta_enabled_flag: specifies whether either or both of the
 *  ph_cu_qp_delta_subdiv_intra_slice and ph_cu_qp_delta_subdiv_inter_slice
 *  syntax elements are present in PH.
 * @chroma_tool_offsets_present_flag: specifies whether chroma tool offsets
 *  related syntax elements are present in the PPS.
 * @cb_qp_offset: specify the offsets to the luma quantization parameter Qp'Y
 *  used for deriving Qp'Cb.
 * @cr_qp_offset: specify the offsets to the luma quantization parameter Qp'Y
 *  used for deriving Qp'Cr.
 * @joint_cbcr_qp_offset_present_flag: specifies whether
 *  pps_joint_cbcr_qp_offset_value and pps_joint_cbcr_qp_offset_list[i] are
 *  present in the PPS.
 * @joint_cbcr_qp_offset_value: specifies the offset to the luma quantization
 *  parameter Qp'Y used for deriving Qp'CbCr.
 * @slice_chroma_qp_offsets_present_flag: specifies whether the sh_cb_qp_offset
 *  and sh_cr_qp_offset syntax elements are present in slice headers.
 * @cu_chroma_qp_offset_list_enabled_flag: specifies whether the
 *  ph_cu_chroma_qp_offset_subdiv_intra_slice and
 *  ph_cu_chroma_qp_offset_subdiv_inter_slice syntax elements are present in PH.
 * @chroma_qp_offset_list_len_minus1: specifies whether number of
 *  pps_cb_qp_offset_list[i], pps_cr_qp_offset_list[i],
 *  and pps_joint_cbcr_qp_offset_list[i], syntax elements that are present.
 * @cb_qp_offset_list: specify offsets used in the derivation of Qp'Cb.
 * @cr_qp_offset_list: specify offsets used in the derivation of Qp'Cr.
 * @joint_cbcr_qp_offset_list: specify offsets used in the derivation of Qp'CbCr.
 * @deblocking_filter_control_present_flag: specifies whether presence of
 *  deblocking filter control syntax elements in the PPS.
 * @deblocking_filter_override_enabled_flag: specifies whether the deblocking
 *  behaviour could be overridden in the picture level or slice level.
 * @deblocking_filter_disabled_flag: specifies whether the deblocking filter is
 *  disabled unless overridden for a picture or slice by information.
 * @dbf_info_in_ph_flag: specifies whether deblocking filter information is
 *  present in the PH syntax structure and not present in slice headers.
 * @luma_beta_offset_div2: specify the default deblocking parameter offsets
 *  for beta that are applied to the luma component.
 * @luma_tc_offset_div2: specify the default deblocking parameter offsets for
 *  tC (divided by 2) that are applied to the luma component.
 * @cb_beta_offset_div2: specify the default deblocking parameter offsets for
 *  beta and that are applied to the Cb component.
 * @cb_tc_offset_div2: specify the default deblocking parameter offsets for tC
    (divided by 2) that are applied to the Cb component.
 * @cr_beta_offset_div2: specify the default deblocking parameter offsets for
 *  beta that are applied to the Cr component.
 * @cr_tc_offset_div2: specify the default deblocking parameter offsets for tC
 *  (divided by 2) that are applied to the Cr component.
 * @rpl_info_in_ph_flag: specifies whether RPL information is present in the
 *  PH syntax structure and not present in slice headers.
 * @sao_info_in_ph_flag: specifies whether SAO filter information could be
 *  present in the PH syntax structure and not present in slice headers.
 * @alf_info_in_ph_flag: specifies whether ALF information could be present in
 *  the PH syntax structure and not present in slice headers.
 * @wp_info_in_ph_flag: specifies whether weighted prediction information could
 *  be present in the PH syntax structure and not present in slice headers.
 * @qp_delta_info_in_ph_flag: specifies whether QP delta information is present
 *  in the PH syntax structure and not present in slice headers.
 * @picture_header_extension_present_flag: specifies whether PH extension syntax
 *  elements are present in PH syntax structures.
 * @slice_header_extension_present_flag: specifies whether slice header
 *  extension syntax elements are present in the slice headers.
 * @extension_flag: specifies whether pps_extension_data_flag syntax elements
 *  are present.
 * @extension_data_flag: could have any value.
 * @width: the calculated width of the picture.
 * @height: the calculated height of the picture.
 * @crop_rect_width: the cropped width of the picture.
 * @crop_rect_height: the cropped height of the picture.
 * @crop_rect_x: the x offset of the cropped window.
 * @crop_rect_y: the y offset of the cropped window.
 * @pic_width_in_ctbs_y: PicWidthInCtbsY specify picture width count in CTBs.
 * @pic_height_in_ctbs_y: PicHeightInCtbsY specify picture height count in CTBs.
 * @pic_size_in_ctbs_y: picture size count in CTBs.
 * @num_tile_columns: total tile number in columns.
 * @num_tile_rows: total tile number in rows.
 * @num_tiles_in_pic: total tile number of the picture.
 * @tile_col_bd_val: TileColBdVal specifying the location of the i-th tile
 *  column boundary in units of CTBs
 * @tile_row_bd_val: TileRowBdVal specifying the location of the j-th tile row
 *  boundary in units of CTBs.
 * @slice_top_left_tile_idx: SliceTopLeftTileIdx specifying the tile index of
 *  the tile containing the first CTU in the slice.
 * @slice_top_left_ctu_x: specifying the top left CTU index in X direction.
 * @slice_top_left_ctu_y: specifying the top left CTU index in Y direction.
 * @slice_height_in_ctus: slice height count in CTUs.
 * @num_slices_in_subpic: slice number in subpicture.
 * @valid: whether this PPS is valid.
 *
 * Structure defining the H266 PPS.
 *
 * Since: 1.26
  }
{ extension_data  }
{ calculated value  }
  PGstH266PPS = ^TGstH266PPS;
  TGstH266PPS = record
      pps_id : Tguint8;
      sps_id : Tguint8;
      sps : PGstH266SPS;
      mixed_nalu_types_in_pic_flag : Tguint8;
      pic_width_in_luma_samples : Tguint16;
      pic_height_in_luma_samples : Tguint16;
      conformance_window_flag : Tguint8;
      conf_win_left_offset : Tguint16;
      conf_win_right_offset : Tguint16;
      conf_win_top_offset : Tguint16;
      conf_win_bottom_offset : Tguint16;
      scaling_window_explicit_signalling_flag : Tguint8;
      scaling_win_left_offset : Tgint32;
      scaling_win_right_offset : Tgint32;
      scaling_win_top_offset : Tgint32;
      scaling_win_bottom_offset : Tgint32;
      output_flag_present_flag : Tguint8;
      no_pic_partition_flag : Tguint8;
      subpic_id_mapping_present_flag : Tguint8;
      num_subpics_minus1 : Tguint32;
      subpic_id_len_minus1 : Tguint32;
      subpic_id : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint16;
      log2_ctu_size_minus5 : Tguint8;
      num_exp_tile_columns_minus1 : Tguint8;
      num_exp_tile_rows_minus1 : Tguint8;
      tile_column_width_minus1 : array[0..(GST_H266_MAX_TILE_COLUMNS)-1] of Tguint16;
      tile_row_height_minus1 : array[0..(GST_H266_MAX_TILE_ROWS)-1] of Tguint16;
      loop_filter_across_tiles_enabled_flag : Tguint8;
      rect_slice_flag : Tguint8;
      single_slice_per_subpic_flag : Tguint8;
      num_slices_in_pic_minus1 : Tguint16;
      tile_idx_delta_present_flag : Tguint8;
      slice_width_in_tiles_minus1 : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint16;
      slice_height_in_tiles_minus1 : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint16;
      num_exp_slices_in_tile : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint16;
      exp_slice_height_in_ctus_minus1 : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of array[0..(GST_H266_MAX_TILE_ROWS)-1] of Tguint16;
      tile_idx_delta_val : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tgint16;
      loop_filter_across_slices_enabled_flag : Tguint8;
      cabac_init_present_flag : Tguint8;
      num_ref_idx_default_active_minus1 : array[0..1] of Tguint8;
      rpl1_idx_present_flag : Tguint8;
      weighted_pred_flag : Tguint8;
      weighted_bipred_flag : Tguint8;
      ref_wraparound_enabled_flag : Tguint8;
      pic_width_minus_wraparound_offset : Tguint16;
      init_qp_minus26 : Tgint8;
      cu_qp_delta_enabled_flag : Tguint8;
      chroma_tool_offsets_present_flag : Tguint8;
      cb_qp_offset : Tgint8;
      cr_qp_offset : Tgint8;
      joint_cbcr_qp_offset_present_flag : Tguint8;
      joint_cbcr_qp_offset_value : Tgint8;
      slice_chroma_qp_offsets_present_flag : Tguint8;
      cu_chroma_qp_offset_list_enabled_flag : Tguint8;
      chroma_qp_offset_list_len_minus1 : Tguint8;
      cb_qp_offset_list : array[0..5] of Tguint8;
      cr_qp_offset_list : array[0..5] of Tguint8;
      joint_cbcr_qp_offset_list : array[0..5] of Tguint8;
      deblocking_filter_control_present_flag : Tguint8;
      deblocking_filter_override_enabled_flag : Tguint8;
      deblocking_filter_disabled_flag : Tguint8;
      dbf_info_in_ph_flag : Tguint8;
      luma_beta_offset_div2 : Tgint8;
      luma_tc_offset_div2 : Tgint8;
      cb_beta_offset_div2 : Tgint8;
      cb_tc_offset_div2 : Tgint8;
      cr_beta_offset_div2 : Tgint8;
      cr_tc_offset_div2 : Tgint8;
      rpl_info_in_ph_flag : Tguint8;
      sao_info_in_ph_flag : Tguint8;
      alf_info_in_ph_flag : Tguint8;
      wp_info_in_ph_flag : Tguint8;
      qp_delta_info_in_ph_flag : Tguint8;
      picture_header_extension_present_flag : Tguint8;
      slice_header_extension_present_flag : Tguint8;
      extension_flag : Tguint8;
      extension_data_flag : Tguint8;
      width : Tgint;
      height : Tgint;
      crop_rect_width : Tgint;
      crop_rect_height : Tgint;
      crop_rect_x : Tgint;
      crop_rect_y : Tgint;
      pic_width_in_ctbs_y : Tguint32;
      pic_height_in_ctbs_y : Tguint32;
      pic_size_in_ctbs_y : Tguint32;
      num_tile_columns : Tguint32;
      num_tile_rows : Tguint32;
      num_tiles_in_pic : Tguint32;
      tile_col_bd_val : array[0..(GST_H266_MAX_TILE_COLUMNS+1)-1] of Tguint32;
      tile_row_bd_val : array[0..(GST_H266_MAX_TILE_ROWS+1)-1] of Tguint32;
      slice_top_left_tile_idx : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint32;
      slice_top_left_ctu_x : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint32;
      slice_top_left_ctu_y : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint32;
      slice_height_in_ctus : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint32;
      num_slices_in_subpic : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint32;
      valid : Tgboolean;
    end;

{*
 * GstH266ALF:
 * @luma_filter_signal_flag: specifies whether a luma filter set is signalled.
 * @chroma_filter_signal_flag: specifies whether a chroma filter is signalled.
 * @cc_cb_filter_signal_flag: specifies whether cross-component filters for the
 *  Cb colour component are signalled.
 * @cc_cr_filter_signal_flag: specifies whether cross-component filters for the
 *  Cr colour component are signalled.
 * @luma_clip_flag: specifies whether linear adaptive loop filtering is applied
 *  to the luma component.
 * @luma_num_filters_signalled_minus1: specifies the number of adpative loop
 *  filter classes for which luma coefficients can be signalled.
 * @luma_coeff_delta_idx: specifies the indices of the signalled adaptive loop
 *  filter luma coefficient deltas for the filter class.
 * @luma_coeff_abs: specifies the absolute value of the j-th coefficient of
 *  the signalled luma filter.
 * @luma_coeff_sign: specifies the sign of the j-th luma coefficient of the
 *  filter.
 * @luma_clip_idx: specifies the clipping index of the clipping value to use
 *  before multiplying by the j-th coefficient of the signalled luma filter.
 * @chroma_clip_flag: specifies whether linear adaptive loop filtering is
 *  applied to chroma components.
 * @chroma_num_alt_filters_minus1: specifies the number of alternative filters
 *  for chroma components.
 * @chroma_coeff_abs: specifies the absolute value of the j-th chroma filter
 *  coefficient for the alternative chroma filter with index altIdx.
 * @chroma_coeff_sign: specifies the sign of the j-th chroma filter coefficient
 *  for the alternative chroma filter with index altIdx.
 * @chroma_clip_idx: specifies the clipping index of the clipping value to use
 *  before multiplying by the j-th coefficient of the alternative chroma filter
 *  with index altIdx.
 * @cc_cb_filters_signalled_minus1: specifies the number of cross-component
 *  filters for the Cb colour component.
 * @cc_cb_mapped_coeff_abs: specifies the absolute value of the j-th mapped
 *  coefficient of the signalled k-th cross-component filter for the Cb colour
 *  component.
 * @cc_cb_coeff_sign: specifies the sign of the j-th coefficient of the
 *  signalled k-th cross-component filter for the Cb colour component.
 * @cc_cr_filters_signalled_minus1: specifies the number of cross-component
 *  filters for the Cr colour component.
 * @cc_cr_mapped_coeff_abs: specifies the absolute value of the j-th mapped
 *  coefficient of the signalled k-th cross-component filter for the Cr colour
 *  component.
 * @cc_cr_coeff_sign: specifies the sign of the j-th coefficient of the
 *  signalled k-th cross-component filter for the Cr colour component.
 *
 * Structure defining the H266 ALF parameters.
 *
 * Since: 1.26
  }
  PGstH266ALF = ^TGstH266ALF;
  TGstH266ALF = record
      luma_filter_signal_flag : Tguint8;
      chroma_filter_signal_flag : Tguint8;
      cc_cb_filter_signal_flag : Tguint8;
      cc_cr_filter_signal_flag : Tguint8;
      luma_clip_flag : Tguint8;
      luma_num_filters_signalled_minus1 : Tguint8;
      luma_coeff_delta_idx : array[0..(GST_H266_NUM_ALF_FILTERS)-1] of Tguint8;
      luma_coeff_abs : array[0..(GST_H266_NUM_ALF_FILTERS)-1] of array[0..11] of Tguint8;
      luma_coeff_sign : array[0..(GST_H266_NUM_ALF_FILTERS)-1] of array[0..11] of Tguint8;
      luma_clip_idx : array[0..(GST_H266_NUM_ALF_FILTERS)-1] of array[0..11] of Tguint8;
      chroma_clip_flag : Tguint8;
      chroma_num_alt_filters_minus1 : Tguint8;
      chroma_coeff_abs : array[0..7] of array[0..5] of Tguint8;
      chroma_coeff_sign : array[0..7] of array[0..5] of Tguint8;
      chroma_clip_idx : array[0..7] of array[0..5] of Tguint8;
      cc_cb_filters_signalled_minus1 : Tguint8;
      cc_cb_mapped_coeff_abs : array[0..3] of array[0..6] of Tguint8;
      cc_cb_coeff_sign : array[0..3] of array[0..6] of Tguint8;
      cc_cr_filters_signalled_minus1 : Tguint8;
      cc_cr_mapped_coeff_abs : array[0..3] of array[0..6] of Tguint8;
      cc_cr_coeff_sign : array[0..3] of array[0..6] of Tguint8;
    end;

{*
 * GstH266LMCS:
 * @min_bin_idx: minimum bin index used in the luma mapping with chroma scaling
 *  construction process.
 * @delta_max_bin_idx: specifies the delta value between 15 and the maximum bin
 *  index LmcsMaxBinIdx used in the luma mapping with chroma scaling construction
 *  process.
 * @delta_cw_prec_minus1: specifies the number of bits used for the
 *  representation of the syntax lmcs_delta_abs_cw[i].
 * @delta_abs_cw: specifies the absolute delta codeword value for the ith bin.
 * @delta_sign_cw_flag: specifies the sign of the variable lmcsDeltaCW[i].
 * @delta_abs_crs: specifies the absolute codeword value of the variable
 *  lmcsDeltaCrs.
 * @delta_sign_crs_flag: specifies the sign of the variable lmcsDeltaCrs.
 *
 * Structure defining the H266 LMCS parameters.
 *
 * Since: 1.26
  }
  PGstH266LMCS = ^TGstH266LMCS;
  TGstH266LMCS = record
      min_bin_idx : Tguint8;
      delta_max_bin_idx : Tguint8;
      delta_cw_prec_minus1 : Tguint8;
      delta_abs_cw : array[0..15] of Tguint8;
      delta_sign_cw_flag : array[0..15] of Tguint8;
      delta_abs_crs : Tguint8;
      delta_sign_crs_flag : Tguint8;
    end;

{*
 * GstH266ScalingList:
 * @copy_mode_flag: specifies whether the values of the scaling list are the
 *  same as the values of a reference scaling list.
 * @pred_mode_flag: specifies whether the values of the scaling list can be
 *  predicted from a reference scaling list.
 * @pred_id_delta: specifies the reference scaling list used to derive the
 *  predicted scaling matrix scalingMatrixPred.
 * @dc_coef: used to derive the value of the variable ScalingMatrixDcRec.
 * @delta_coef: specifies the difference between the current matrix coefficient
 *  ScalingList.
 * @scaling_list_DC: the scaling list DC coef.
 * @scaling_list: the calculated scaling list coefs.
 *
 * Structure defining the H266 scaling list parameters.
 *
 * Since: 1.26
  }
  PGstH266ScalingList = ^TGstH266ScalingList;
  TGstH266ScalingList = record
      copy_mode_flag : array[0..27] of Tguint8;
      pred_mode_flag : array[0..27] of Tguint8;
      pred_id_delta : array[0..27] of Tguint8;
      dc_coef : array[0..13] of Tgint8;
      delta_coef : array[0..27] of array[0..63] of Tgint8;
      scaling_list_DC : array[0..13] of Tguint8;
      scaling_list : array[0..27] of array[0..63] of Tguint8;
    end;

{*
 * GstH266APS:
 * @params_type: specifies the type of APS parameters carried in the APS as
 *  specified in Table 6.
 * @aps_id: provides an identifier for the APS for reference by other syntax
 *  elements.
 * @chroma_present_flag: specifies whether the APS NAL unit could include
 *  chroma related syntax elements.
 * @alf: ALF parameters of #GstH266ALF when params_type is GST_H266_ALF_APS.
 * @lmcs: LMCS parameters of #GstH266LMCS when params_type is GST_H266_LMCS_APS.
 * @sl: scaling list parameters of #GstH266ScalingList when params_type is
 *  GST_H266_SCALING_APS.
 * @extension_flag: specifies whether aps_extension_data_flag syntax elements
 *  are present.
 * @extension_data_flag: could have any value and do not affect the decoding
 *  process now.
 * @valid: whether this APS is valid.
 *
 * Structure defining the H266 Adaptation Parameter Set.
 *
 * Since: 1.26
  }
  PGstH266APS = ^TGstH266APS;
  TGstH266APS = record
      params_type : TGstH266APSType;
      aps_id : Tguint8;
      chroma_present_flag : Tguint8;
      xxxxxx : record
          case longint of
            0 : ( alf : TGstH266ALF );
            1 : ( lmcs : TGstH266LMCS );
            2 : ( sl : TGstH266ScalingList );
          end;
      extension_flag : Tguint8;
      extension_data_flag : Tguint8;
      valid : Tgboolean;
    end;

{*
 * GstH266PredWeightTable:
 * @luma_log2_weight_denom: the base 2 logarithm of the denominator for all
 *  luma weighting factors.
 * @delta_chroma_log2_weight_denom: the difference of the base 2 logarithm of
 *  the denominator for all chroma weighting factors.
 * @num_l0_weights: specifies the number of weights signalled for entries in
 *  RPL 0 when pps_wp_info_in_ph_flag is equal to 1.
 * @luma_weight_l0_flag: specifies whether weighting factors for the luma
 *  component of list 0 prediction using RefPicList[0][i] are present.
 * @chroma_weight_l0_flag: specifies whether weighting factors for the chroma
 *  prediction values of list 0 prediction using RefPicList[0][i] are present.
 * @delta_luma_weight_l0: the difference of the weighting factor applied to the
 *  luma prediction value for list 0 prediction using RefPicList[0][i].
 * @luma_offset_l0: the additive offset applied to the luma prediction value
 *  for list 0 prediction using RefPicList[0][i].
 * @delta_chroma_weight_l0: the difference of the weighting factor applied to
 *  the chroma prediction values for list 0 prediction.
 * @delta_chroma_offset_l0: the difference of the additive offset applied to
 *  the chroma prediction values for list 0 prediction.
 * @num_l1_weights: specifies the number of weights signalled for entries in
 *  RPL 1.
 * @luma_weight_l1_flag: specifies whether weighting factors for the luma
 *  component of list 1 prediction using RefPicList[1][i] are present.
 * @chroma_weight_l1_flag: specifies whether weighting factors for the chroma
 *  prediction values of list 1 prediction using RefPicList[1][i] are present.
 * @delta_luma_weight_l1: the difference of the weighting factor applied to the
 *  luma prediction value for list 1 prediction using RefPicList[1][i].
 * @luma_offset_l1: the additive offset applied to the luma prediction value
 *  for list 1 prediction using RefPicList[1][i].
 * @delta_chroma_weight_l1: the difference of the weighting factor applied to
 *  the chroma prediction values for list 1 prediction.
 * @delta_chroma_offset_l1: the difference of the additive offset applied to
 *  the chroma prediction values for list 1 prediction.
 *
 * Structure defining the H266 weight table parameters.
 *
 * Since: 1.26
  }
  PGstH266PredWeightTable = ^TGstH266PredWeightTable;
  TGstH266PredWeightTable = record
      luma_log2_weight_denom : Tguint8;
      delta_chroma_log2_weight_denom : Tgint8;
      num_l0_weights : Tguint8;
      luma_weight_l0_flag : array[0..14] of Tguint8;
      chroma_weight_l0_flag : array[0..14] of Tguint8;
      delta_luma_weight_l0 : array[0..14] of Tgint8;
      luma_offset_l0 : array[0..14] of Tgint8;
      delta_chroma_weight_l0 : array[0..14] of array[0..1] of Tgint8;
      delta_chroma_offset_l0 : array[0..14] of array[0..1] of Tgint16;
      num_l1_weights : Tguint8;
      luma_weight_l1_flag : array[0..14] of Tguint8;
      chroma_weight_l1_flag : array[0..14] of Tguint8;
      delta_luma_weight_l1 : array[0..14] of Tgint8;
      luma_offset_l1 : array[0..14] of Tgint8;
      delta_chroma_weight_l1 : array[0..14] of array[0..1] of Tgint8;
      delta_chroma_offset_l1 : array[0..14] of array[0..1] of Tgint16;
    end;

{*
 * GstH266PicHdr:
 * @gdr_or_irap_pic_flag: specifies whethers the current picture is a GDR or
 *  IRAP picture.
 * @non_ref_pic_flag: specifies whether the current picture is never used as
 *  a reference picture.
 * @gdr_pic_flag: specifies whether the current picture is a GDR picture.
 * @inter_slice_allowed_flag: specifies whether all coded slices of the picture
 *  have sh_slice_type equal to 2.
 * @intra_slice_allowed_flag: specifies whether all coded slices of the picture
 *  have sh_slice_type equal to 0 or 1.
 * @pps_id: specifies the value of pps_pic_parameter_set_id for the PPS in use.
 * @pic_order_cnt_lsb: specifies the picture order count modulo
 *  MaxPicOrderCntLsb for the current picture.
 * @recovery_poc_cnt: specifies the recovery point of decoded pictures in
 *  output order.
 * @extra_bit[16]: could have any value.
 * @poc_msb_cycle_present_flag: specifies that the syntax element
 *  ph_poc_msb_cycle_val is present in the PH.
 * @poc_msb_cycle_val: specifies the value of the POC MSB cycle of the current
 *  picture.
 * @alf_enabled_flag: specifies whether the adaptive loop filter is enabled for
 *  the current picture.
 * @num_alf_aps_ids_luma: specifies the number of ALF APSs that the slices in
 *  the current picture refers to.
 * @alf_aps_id_luma: specifies the aps_adaptation_parameter_set_id of the i-th
 *  ALF APS.
 * @alf_cb_enabled_flag: specifies whether the adaptive loop filter is enabled
 *  for the Cb colour component of the current picture.
 * @alf_cr_enabled_flag: specifies whether the adaptive loop filter is enabled
 *  for the Cr colour component of the current picture.
 * @alf_aps_id_chroma;: specifies the aps_adaptation_parameter_set_id of the
 *  ALF APS.
 * @alf_cc_cb_enabled_flag: specifies whether the cross-component adaptive loop
 *  filter for the Cb colour component is enabled for the current picture
 * @alf_cc_cb_aps_id: specifies the aps_adaptation_parameter_set_id of the ALF APS
 *  that the Cb colour component of the slices in the current picture refers to.
 * @alf_cc_cr_enabled_flag: specifies that the cross-compoent adaptive loop
 *  filter for the Cr colour component is enabled for the current picture.
 * @alf_cc_cr_aps_id: specifies the aps_adaptation_parameter_set_id of the ALF APS
 *  that the Cr colour component of the slices in the current picture refers to.
 * @lmcs_enabled_flag: specifies whether LMCS is enabled for the current picture.
 * @lmcs_aps_id: specifies the aps_adaptation_parameter_set_id of the LMCS APS.
 * @chroma_residual_scale_flag: specifies whether chroma residual scaling is
 *  enabled and could be used for the current picture.
 * @explicit_scaling_list_enabled_flag: specifies that the explicit scaling list
 *  is enabled for the current picture.
 * @scaling_list_aps_id: specifies the aps_adaptation_parameter_set_id of the
 *  scaling list APS.
 * @virtual_boundaries_present_flag: specifies whether information of virtual
 *  boundaries is signalled in the PH syntax structure.
 * @num_ver_virtual_boundaries: specifies the number of
 *  ph_virtual_boundary_pos_x_minus1[i] syntax elements.
 * @virtual_boundary_pos_x_minus1: specifies the location of the i-th vertical
 *  virtual boundary in units of luma samples divided by 8.
 * @num_hor_virtual_boundaries: specifies the number of
 *  ph_virtual_boundary_pos_y_minus1[i].
 * @virtual_boundary_pos_y_minus1: specifies the location of the i-th horizontal
 *  virtual boundary in units of luma samples divided by 8.
 * @pic_output_flag: affects the decoded picture output and removal processes
 *  as specified in Annex C.
 * @ref_pic_lists: reference lists of #GstH266RefPicLists.
 * @partition_constraints_override_flag: specifies that partition constraint
 *  parameters are present.
 * @log2_diff_min_qt_min_cb_intra_slice_luma: specifies the difference between
 *  the base 2 logarithm of the minimum size in luma samples of a luma leaf
 *  block resulting from quadtree splitting of a CTU and the base 2 logarithm
 *  of the minimum coding block size in luma samples for luma CUs.
 * @max_mtt_hierarchy_depth_intra_slice_luma: specifies the maximum hierarchy
 *  depth for coding units resulting from multi-type tree splitting of a
 *  quadtree leaf.
 * @log2_diff_max_bt_min_qt_intra_slice_luma: specifies the difference between
 *  the base 2 logarithm of the maximum size in luma samples of a luma coding
 *  block that can be split using a binary split and the base 2 logarithm of
 *  the minimum size in luma samples of a luma leaf block resulting from
 *  quadtree splitting of a CTU.
 * @log2_diff_max_tt_min_qt_intra_slice_luma: specifies the difference between
 *  the base 2 logarithm of the maximum size in luma samples of a luma coding
 *  block that can be split using a ternary split and the base 2 logarithm of
 *  the minimum size in luma samples of a luma leaf block resulting from
 *  quadtree splitting of a CTU.
 * @log2_diff_min_qt_min_cb_intra_slice_chroma: specifies the difference between
 *  the base 2 logarithm of the minimum size in luma samples of a chroma leaf
 *  block resulting from quadtree splitting of a chroma CTU with treeType equal
 *  to DUAL_TREE_CHROMA and the base 2 logarithm of the minimum coding block
 *  size in luma samples for chroma CUs with treeType equal to DUAL_TREE_CHROMA.
 * @max_mtt_hierarchy_depth_intra_slice_chroma: specifies the maximum hierarchy
 *  depth for chroma coding units resulting from multi-type tree splitting of a
 *  chroma quadtree leaf with treeType equal to DUAL_TREE_CHROMA.
 * @log2_diff_max_bt_min_qt_intra_slice_chroma: specifies the difference between
 *  the base 2 logarithm of the maximum size in luma samples of a chroma coding
 *  block that can be split using a binary split and the base 2 logarithm of the
 *  minimum size in luma samples of a chroma leaf block resulting from quadtree
 *  splitting of a chroma CTU with treeType equal to DUAL_TREE_CHROMA.
 * @log2_diff_max_tt_min_qt_intra_slice_chroma: specifies the difference between
 *  the base 2 logarithm of the maximum size in luma samples of a chroma coding
 *  block that can be split using a ternary split and the base 2 logarithm of
 *  the minimum size in luma samples of a chroma leaf block resulting from
 *  quadtree splitting of a chroma CTU with treeType equal to DUAL_TREE_CHROMA.
 * @cu_qp_delta_subdiv_intra_slice: specifies the maximum cbSubdiv value of
 *  coding units in intra slice that convey cu_qp_delta_abs and
 *  cu_qp_delta_sign_flag.
 * @cu_chroma_qp_offset_subdiv_intra_slice: specifies the maximum cbSubdiv value
 *  of coding units in intra slice that convey cu_chroma_qp_offset_flag.
 * @log2_diff_min_qt_min_cb_inter_slice: specifies the difference between the
 *  base 2 logarithm of the minimum size in luma samples of a luma leaf block
 *  resulting from quadtree splitting of a CTU and the base 2 logarithm of the
 *  minimum luma coding block size in luma samples for luma CUs.
 * @max_mtt_hierarchy_depth_inter_slice: specifies the maximum hierarchy depth
 *  for coding units resulting from multi-type tree splitting of a quadtree leaf.
 * @log2_diff_max_bt_min_qt_inter_slice: specifies the difference between the
 *  base 2 logarithm of the maximum size in luma samples of a luma coding block
 *  that can be split using a binary split and the base 2 logarithm of the
 *  minimum size in luma samples of a luma leaf block resulting from quadtree
 *  splitting of a CTU.
 * @log2_diff_max_tt_min_qt_inter_slice: specifies the difference between the
 *  base 2 logarithm of the maximum size in luma samples of a luma coding block
 *  that can be split using a ternary split and the base 2 logarithm of the
 *  minimum size in luma samples of a luma leaf block resulting from quadtree
 *  splitting of a CTU.
 * @cu_qp_delta_subdiv_inter_slice: specifies the maximum cbSubdiv value of
 *  coding units that in inter slice convey cu_qp_delta_abs and
 *  cu_qp_delta_sign_flag.
 * @cu_chroma_qp_offset_subdiv_inter_slice: specifies the maximum cbSubdiv value
 *  of coding units in inter slice that convey cu_chroma_qp_offset_flag.
 * @temporal_mvp_enabled_flag: specifies whether temporal motion vector
 *  predictor is enabled for the current picture.
 * @collocated_from_l0_flag: specifies whether the collocated picture used for
 *  temporal motion vector prediction is derived from RPL 0.
 * @collocated_ref_idx: specifies the reference index of the collocated picture
 *  used for temporal motion vector prediction.
 * @mmvd_fullpel_only_flag: specifies whether the merge mode with motion vector
 *  difference uses only integer sample precision for the current picture.
 * @mvd_l1_zero_flag: specifies whether the mvd_coding syntax structure is parsed.
 * @bdof_disabled_flag: specifies that the bi-directional optical flow inter
 *  prediction based inter bi-prediction is disabled for the current picture.
 * @dmvr_disabled_flag: specifies whether the decoder motion vector refinement
 *  based inter bi-prediction is disabled for the current picture.
 * @prof_disabled_flag: specifies whether prediction refinement with optical
 *  flow is disabled for the current picture.
 * @pred_weight_table: prediction weight table of #GstH266PredWeightTable.
 * @qp_delta: specifies the initial value of QpY to be used for the coding
 *  blocks in the picture.
 * @joint_cbcr_sign_flag: specifies whether the collocated residual samples of
 *  both chroma components have inverted signs.
 * @sao_luma_enabled_flag: specifies whether SAO is enabled for the luma
 *  component of the current picture.
 * @sao_chroma_enabled_flag: specifies whether SAO is enabled for the chroma
 *  component of the current picture.
 * @deblocking_params_present_flag: specifies whether the deblocking parameters
 *  could be present in the PH syntax structure.
 * @deblocking_filter_disabled_flag: specifies whether the deblocking filter is
 *  disabled for the current picture.
 * @luma_beta_offset_div2: specify the deblocking parameter offsets for beta that
 *  are applied to the luma component for the slices in the current picture.
 * @luma_tc_offset_div2: specify the deblocking parameter offsets for tC that
 *  are applied to the luma component for the slices in the current picture.
 * @cb_beta_offset_div2: specify the deblocking parameter offsets for beta that
 *  are applied to the Cb component for the slices in the current picture.
 * @cb_tc_offset_div2: specify the deblocking parameter offsets for tC that
 *  are applied to the Cb component for the slices in the current picture.
 * @cr_beta_offset_div2: specify the deblocking parameter offsets for beta that
 *  are applied to the Cr component for the slices in the current picture.
 * @cr_tc_offset_div2: specify the deblocking parameter offsets for tC that
 *  are applied to the Cr component for the slices in the current picture.
 * @extension_length: specifies the length of the PH extension data in bytes.
 * @extension_data_byte: could have any value.
 * @valid: whether this picture header is valid.
 *
 * Structure defining the H266 picture header.
 *
 * Since: 1.26
  }
  PGstH266PicHdr = ^TGstH266PicHdr;
  TGstH266PicHdr = record
      gdr_or_irap_pic_flag : Tguint8;
      non_ref_pic_flag : Tguint8;
      gdr_pic_flag : Tguint8;
      inter_slice_allowed_flag : Tguint8;
      intra_slice_allowed_flag : Tguint8;
      pps_id : Tguint8;
      pps : PGstH266PPS;
      pic_order_cnt_lsb : Tguint16;
      recovery_poc_cnt : Tguint8;
      extra_bit : array[0..15] of Tguint8;
      poc_msb_cycle_present_flag : Tguint8;
      poc_msb_cycle_val : Tguint8;
      alf_enabled_flag : Tguint8;
      num_alf_aps_ids_luma : Tguint8;
      alf_aps_id_luma : array[0..7] of Tguint8;
      alf_cb_enabled_flag : Tguint8;
      alf_cr_enabled_flag : Tguint8;
      alf_aps_id_chroma : Tguint8;
      alf_cc_cb_enabled_flag : Tguint8;
      alf_cc_cb_aps_id : Tguint8;
      alf_cc_cr_enabled_flag : Tguint8;
      alf_cc_cr_aps_id : Tguint8;
      lmcs_enabled_flag : Tguint8;
      lmcs_aps_id : Tguint8;
      chroma_residual_scale_flag : Tguint8;
      explicit_scaling_list_enabled_flag : Tguint8;
      scaling_list_aps_id : Tguint8;
      virtual_boundaries_present_flag : Tguint8;
      num_ver_virtual_boundaries : Tguint8;
      virtual_boundary_pos_x_minus1 : array[0..2] of Tguint16;
      num_hor_virtual_boundaries : Tguint8;
      virtual_boundary_pos_y_minus1 : array[0..2] of Tguint16;
      pic_output_flag : Tguint8;
      ref_pic_lists : TGstH266RefPicLists;
      partition_constraints_override_flag : Tguint8;
      log2_diff_min_qt_min_cb_intra_slice_luma : Tguint8;
      max_mtt_hierarchy_depth_intra_slice_luma : Tguint8;
      log2_diff_max_bt_min_qt_intra_slice_luma : Tguint8;
      log2_diff_max_tt_min_qt_intra_slice_luma : Tguint8;
      log2_diff_min_qt_min_cb_intra_slice_chroma : Tguint8;
      max_mtt_hierarchy_depth_intra_slice_chroma : Tguint8;
      log2_diff_max_bt_min_qt_intra_slice_chroma : Tguint8;
      log2_diff_max_tt_min_qt_intra_slice_chroma : Tguint8;
      cu_qp_delta_subdiv_intra_slice : Tguint8;
      cu_chroma_qp_offset_subdiv_intra_slice : Tguint8;
      log2_diff_min_qt_min_cb_inter_slice : Tguint8;
      max_mtt_hierarchy_depth_inter_slice : Tguint8;
      log2_diff_max_bt_min_qt_inter_slice : Tguint8;
      log2_diff_max_tt_min_qt_inter_slice : Tguint8;
      cu_qp_delta_subdiv_inter_slice : Tguint8;
      cu_chroma_qp_offset_subdiv_inter_slice : Tguint8;
      temporal_mvp_enabled_flag : Tguint8;
      collocated_from_l0_flag : Tguint8;
      collocated_ref_idx : Tguint8;
      mmvd_fullpel_only_flag : Tguint8;
      mvd_l1_zero_flag : Tguint8;
      bdof_disabled_flag : Tguint8;
      dmvr_disabled_flag : Tguint8;
      prof_disabled_flag : Tguint8;
      pred_weight_table : TGstH266PredWeightTable;
      qp_delta : Tgint8;
      joint_cbcr_sign_flag : Tguint8;
      sao_luma_enabled_flag : Tguint8;
      sao_chroma_enabled_flag : Tguint8;
      deblocking_params_present_flag : Tguint8;
      deblocking_filter_disabled_flag : Tguint8;
      luma_beta_offset_div2 : Tgint8;
      luma_tc_offset_div2 : Tgint8;
      cb_beta_offset_div2 : Tgint8;
      cb_tc_offset_div2 : Tgint8;
      cr_beta_offset_div2 : Tgint8;
      cr_tc_offset_div2 : Tgint8;
      extension_length : Tguint8;
      extension_data_byte : array[0..255] of Tguint8;
      valid : Tgboolean;
    end;

{*
 * GstH266SliceHdr:
 * @gdr_or_irap_pic_flag: specifies that the PH syntax structure is present in
 *  the slice header.
 * @picture_header: the picture header of #GstH266PicHdr.
 * @subpic_id: specifies the subpicture ID of the subpicture.
 * @slice_address: specifies the slice address of the slice.
 * @extra_bit: could have any value.
 * @num_tiles_in_slice_minus1: specifies the number of tiles in the slice.
 * @slice_type: specifies the coding type of the slice.
 * @no_output_of_prior_pics_flag: affects the output of previously-decoded
 *  pictures in the DPB.
 * @alf_enabled_flag: specifies whether ALF is enabled for the Y, Cb, or Cr
 *  colour component of the current slice.
 * @num_alf_aps_ids_luma: specifies the number of ALF APSs.
 * @alf_aps_id_luma: specifies the aps_adaptation_parameter_set_id of the i-th
 *  ALF APS that the luma component of the slice refers to.
 * @alf_cb_enabled_flag: specifies whether ALF is enabled for the Cb colour
 *  component of the current slice.
 * @alf_cr_enabled_flag: specifies whether ALF is enabled for the Cr colour
 *  component of the current slice.
 * @alf_aps_id_chroma: specifies the aps_adaptation_parameter_set_id of the ALF
 *  APS that the chroma component of the slice refers to.
 * @alf_cc_cb_enabled_flag: specifies whether CCALF is enabled for the Cb
 *  colour component.
 * @alf_cc_cb_aps_id: specifies the aps_adaptation_parameter_set_id that the Cb
 *  colour component of the slice refers to.
 * @alf_cc_cr_enabled_flag: specifies whether CCALF is enabled for the Cr
 *  colour component of the current slice.
 * @alf_cc_cr_aps_id: specifies the aps_adaptation_parameter_set_id that the Cr
 *  colour component of the slice refers to.
 * @lmcs_used_flag: specifies that luma mapping is used for the current slice
 *  and chroma scaling could be used for the current slice.
 * @explicit_scaling_list_used_flag: specifies that the explicit scaling list
 *  is used in the scaling process for transform coefficients.
 * @ref_pic_lists: reference pictures lists of #GstH266RefPicLists.
 * @num_ref_idx_active_override_flag: specifies whether the syntax element
 *  sh_num_ref_idx_active_minus1[0] is present for P and B slices.
 * @num_ref_idx_active_minus1: is used for the derivation of the variable
 *  NumRefIdxActive[i].
 * @num_ref_idx_active: the calculated NumRefIdxActive value.
 * @cabac_init_flag: specifies the method for determining the initialization
 *  table used in the initialization process for context variables.
 * @collocated_from_l0_flag: specifies whether the collocated picture used for
 *  temporal motion vector prediction is derived from RPL 0.
 * @collocated_ref_idx: specifies the reference index of the collocated picture
 *  used for temporal motion vector prediction.
 * @pred_weight_table: prediction weight table of #GstH266PredWeightTable.
 * @qp_base: the qp base of the current slice.
 * @qp_delta: specifies the initial value of QpY to be used for the coding
 *  blocks in the slice.
 * @cb_qp_offset: specifies a difference to be added to the value of
 *  pps_cb_qp_offset when determining the value of the Qp'Cb quantization.
 * @cr_qp_offset: specifies a difference to be added to the value of
 *  pps_cr_qp_offset when determining the value of the Qp' Cr quantization.
 * @joint_cbcr_qp_offset: specifies a difference to be added to the value of
 *  pps_joint_cbcr_qp_offset_value when determining the value of the Qp'CbCr.
 * @cu_chroma_qp_offset_enabled_flag: specifies whether the
 *  cu_chroma_qp_offset_flag could be present in the transform unit and palette
 *  coding syntax of the current slice.
 * @sao_luma_used_flag: specifies whether SAO is used for the luma component
 *  in the current slice.
 * @sao_chroma_used_flag: specifies whether SAO is used for the chroma component
 *  in the current slice.
 * @deblocking_params_present_flag: specifies whether the deblocking parameters
 *  could be present in the slice header.
 * @deblocking_filter_disabled_flag: specifies whether the deblocking filter is
 *  disabled for the current slice.
 * @luma_beta_offset_div2: specify the deblocking parameter offsets for beta that
 *  are applied to the luma component for the current slice.
 * @luma_tc_offset_div2: specify the deblocking parameter offsets for tC that
 *  are applied to the luma component for the current slice.
 * @cb_beta_offset_div2: specify the deblocking parameter offsets for beta that
 *  are applied to the Cb component for the current slice.
 * @cb_tc_offset_div2: specify the deblocking parameter offsets for tC that
 *  are applied to the Cb component for the current slice.
 * @cr_beta_offset_div2: specify the deblocking parameter offsets for beta that
 *  are applied to the Cr component for the current slice.
 * @cr_tc_offset_div2: specify the deblocking parameter offsets for tC that
 *  are applied to the Cr component for the current slice.
 * @dep_quant_used_flag: specifies whether dependent quantization is used.
 * @sign_data_hiding_used_flag: specifies whether sign bit hiding is not used
 *  for the current slice.
 * @ts_residual_coding_disabled_flag: specifies whether the residual_coding
 *  syntax structure is used to parse the residual samples of a transform skip
 *  block for the current slice.
 * @ts_residual_coding_rice_idx_minus1: specifies whether Rice parameter used
 *  for the residual_ts_coding syntax structure in the current slice.
 * @reverse_last_sig_coeff_flag: specifies whether the coordinates of the last
 *  significant coefficient are coded relative to ( 0, 0 ) for each transform
 *  block of the current slice.
 * @slice_header_extension_length: specifies the length of the slice header
 *  extension data in bytes.
 * @slice_header_extension_data_byte: could have any value.
 * @num_entry_points: NumEntryPoints specifies the number of entry points in
 *  the current slice.
 * @entry_offset_len_minus1: specifies the length, in bits, of the
 *  sh_entry_point_offset_minus1[i] syntax elements.
 * @entry_point_offset_minus1: specifies the i-th entry point offset in bytes.
 * @header_size: size of the slice_header in bits.
 * @n_emulation_prevention_bytes: number of emulation prevention bytes (EPB) in
 *  this slice_header.
 *
 * Structure defining the H266 slice header.
 *
 * Since: 1.26
  }
{ Size of the slice_header() in bits  }
{ Number of emulation prevention bytes (EPB) in this slice_header()  }
  PGstH266SliceHdr = ^TGstH266SliceHdr;
  TGstH266SliceHdr = record
      picture_header_in_slice_header_flag : Tguint8;
      picture_header : TGstH266PicHdr;
      subpic_id : Tguint16;
      slice_address : Tguint16;
      extra_bit : array[0..15] of Tguint8;
      num_tiles_in_slice_minus1 : Tguint8;
      slice_type : Tguint8;
      no_output_of_prior_pics_flag : Tguint8;
      alf_enabled_flag : Tguint8;
      num_alf_aps_ids_luma : Tguint8;
      alf_aps_id_luma : array[0..7] of Tguint8;
      alf_cb_enabled_flag : Tguint8;
      alf_cr_enabled_flag : Tguint8;
      alf_aps_id_chroma : Tguint8;
      alf_cc_cb_enabled_flag : Tguint8;
      alf_cc_cb_aps_id : Tguint8;
      alf_cc_cr_enabled_flag : Tguint8;
      alf_cc_cr_aps_id : Tguint8;
      lmcs_used_flag : Tguint8;
      explicit_scaling_list_used_flag : Tguint8;
      ref_pic_lists : TGstH266RefPicLists;
      num_ref_idx_active_override_flag : Tguint8;
      num_ref_idx_active_minus1 : array[0..1] of Tguint8;
      num_ref_idx_active : array[0..1] of Tguint8;
      cabac_init_flag : Tguint8;
      collocated_from_l0_flag : Tguint8;
      collocated_ref_idx : Tguint8;
      pred_weight_table : TGstH266PredWeightTable;
      slice_qp_y : Tgint8;
      qp_delta : Tgint8;
      cb_qp_offset : Tgint8;
      cr_qp_offset : Tgint8;
      joint_cbcr_qp_offset : Tgint8;
      cu_chroma_qp_offset_enabled_flag : Tguint8;
      sao_luma_used_flag : Tguint8;
      sao_chroma_used_flag : Tguint8;
      deblocking_params_present_flag : Tguint8;
      deblocking_filter_disabled_flag : Tguint8;
      luma_beta_offset_div2 : Tgint8;
      luma_tc_offset_div2 : Tgint8;
      cb_beta_offset_div2 : Tgint8;
      cb_tc_offset_div2 : Tgint8;
      cr_beta_offset_div2 : Tgint8;
      cr_tc_offset_div2 : Tgint8;
      dep_quant_used_flag : Tguint8;
      sign_data_hiding_used_flag : Tguint8;
      ts_residual_coding_disabled_flag : Tguint8;
      ts_residual_coding_rice_idx_minus1 : Tguint8;
      reverse_last_sig_coeff_flag : Tguint8;
      slice_header_extension_length : Tguint16;
      slice_header_extension_data_byte : array[0..255] of Tguint8;
      num_entry_points : Tguint16;
      entry_point_start_ctu : array[0..(GST_H266_MAX_ENTRY_POINTS)-1] of Tguint16;
      entry_offset_len_minus1 : Tguint8;
      entry_point_offset_minus1 : array[0..(GST_H266_MAX_ENTRY_POINTS)-1] of Tguint32;
      header_size : Tguint;
      n_emulation_prevention_bytes : Tguint;
    end;

{*
 * GstH266AUD:
 * @irap_or_gdr_flag: specifies whether the AU containing the AU delimiter is
 *  an IRAP or GDR AU.
 * @pic_type: indicates sh_slice_type values that could be present in the AU.
 *
 * Structure defining the H266 AU delimiter.
 *
 * Since: 1.26
  }
  PGstH266AUD = ^TGstH266AUD;
  TGstH266AUD = record
      irap_or_gdr_flag : Tguint8;
      pic_type : Tguint8;
    end;

{*
 * GstH266OPI:
 * @ols_info_present_flag: specifies whether opi_ols_idx is present in the OPI.
 * @htid_info_present_flag: specifies whether opi_htid_plus1 is present.
 * @ols_idx: specifies that the current CVS and the next CVSs in decoding order
 *  up to and not including the next CVS for which opi_ols_idx is provided in
 *  an OPI NAL unit do not contain any other layers than those included in the
 *  OLS with OLS index equal to opi_ols_idx.
 * @htid_plus1: specifies that all the pictures in the current CVS and the next
 *  CVSs in decoding order up to and not including the next CVS for which
 *  opi_htid_plus1 is provided in an OPI NAL unit are IRAP pictures or GDR
 *  pictures with ph_recovery_poc_cnt equal to 0.
 * @extension_flag: specifies whether opi_extension_data_flag syntax elements
 *  are present.
 * @extension_data_flag: could have any value.
 *
 * Structure defining the H266 operating point information.
 *
 * Since: 1.26
  }
{ extension_data  }
  PGstH266OPI = ^TGstH266OPI;
  TGstH266OPI = record
      ols_info_present_flag : Tguint8;
      htid_info_present_flag : Tguint8;
      ols_idx : Tguint;
      htid_plus1 : Tguint8;
      extension_flag : Tguint8;
      extension_data_flag : Tguint8;
    end;

{*
 * GstH266DCI:
 * @num_ptls_minus1: specifies the number of profile_tier_level syntax
 *  structures in the DCI NAL unit.
 * @extension_flag: specifies whether dci_extension_data_flag syntax elements
 *  are present.
 * @extension_data_flag: could have any value.
 *
 * Structure defining the H266 decoding capability information.
 *
 * Since: 1.26
  }
{ extension_data  }
  PGstH266DCI = ^TGstH266DCI;
  TGstH266DCI = record
      num_ptls_minus1 : Tguint8;
      profile_tier_level : array[0..14] of TGstH266ProfileTierLevel;
      extension_flag : Tguint8;
      extension_data_flag : Tguint8;
    end;

{*
 * GstH266BufferingPeriod:
 * @nal_hrd_params_present_flag: specifies whether a list of syntax element
 *  pairs bp_nal_initial_cpb_removal_delay and bp_nal_initial_cpb_removal_offset
 *  are present in the BP SEI message.
 * @vcl_hrd_params_present_flag: specifies whether a list of syntax element
 *  pairs bp_vcl_initial_cpb_removal_delay and bp_vcl_initial_cpb_removal_offset
 *  are present in the BP SEI message.
 * @cpb_initial_removal_delay_length_minus1: specifies the length, in bits, of
 *  the initial cpb removal syntax elements.
 * @cpb_removal_delay_length_minus1: specifies the length, in bits, of the
 *  cpb removal syntax elements.
 * @dpb_output_delay_length_minus1: specifies the length, in bits, of the
 *  syntax dpb output syntax elements.
 * @du_hrd_params_present_flag: specifies whether DU level HRD parameters are
 *  present and the HRD can be operated at the AU level or DU level.
 * @du_cpb_removal_delay_increment_length_minus1: specifies the length, in bits,
 *  of the du cpb removal syntax elements.
 * @dpb_output_delay_du_length_minus1: specifies the length, in bits, of the
 *  dpb output syntax element.
 * @du_cpb_params_in_pic_timing_sei_flag: specifies whether DU level CPB removal
 *  delay parameters are present in PT SEI messages.
 * @du_dpb_params_in_pic_timing_sei_flag: specifies whether DU level DPB output
 *  delay parameters are present in PT SEI messages.
 * @concatenation_flag: indicates whether the nominal CPB removal time of the
 *  current AU is determined relative to the nominal CPB removal time of the
 *  previous AU.
 * @additional_concatenation_info_present_flag: specifies whether the syntax
 *  element bp_max_initial_removal_delay_for_concatenation is present in the BP
 *  SEI message and the syntax element pt_delay_for_concatenation_ensured_flag
 *  is present in the PT SEI messages.
 * @max_initial_removal_delay_for_concatenation: identify whether the nominal
 *  removal time from the CPB of the first AU of a following BP computed with
 *  bp_cpb_removal_delay_delta_minus1 applies.
 * @cpb_removal_delay_delta_minus1: specifies a CPB removal delay increment
 *  value relative to the nominal CPB removal time of the AU prevNonDiscardableAu.
 * @max_sublayers_minus1: specifies whether maximum number of temporal sublayers
 *  for which the initial CPB removal delay and the initial CPB removal offset
 *  are indicated in the BP SEI message.
 * @cpb_removal_delay_deltas_present_flag: specifies whether the BP SEI message
 *  contains CPB removal delay deltas.
 * @num_cpb_removal_delay_deltas_minus1: specifies the number of syntax elements
 *  bp_cpb_removal_delay_delta_val[i] in the BP SEI message.
 * @cpb_removal_delay_delta_val: specifies the i-th CPB removal delay delta.
 * @cpb_cnt_minus1: specifies the number of syntax element pairs
 *  bp_nal_initial_cpb_removal_delay and bp_nal_initial_cpb_removal_offset
 *  of the i-th temporal sublayer.
 * @sublayer_initial_cpb_removal_delay_present_flag: specifies that initial CPB
 *  removal delay related syntax elements are present for sublayer representation.
 * @nal_initial_cpb_removal_delay: specify the j-th default initial CPB removal
 *  delay for the NAL HRD in units of a 90 kHz clock of the i-th temporal sublayer.
 * @nal_initial_cpb_removal_offset: specify the j-th default initial CPB removal
 *  offset of the i-th temporal sublayer for the NAL HRD in units of a 90 kHz
 *  clock.
 * @nal_initial_alt_cpb_removal_delay: specify the j-th alternative initial CPB
 *  removal delay for the NAL HRD in units of a 90 kHz clock of the i-th
 *  temporal sublayer.
 * @nal_initial_alt_cpb_removal_offset: specify the j-th alternative initial CPB
 *  removal offset of the i-th temporal sublayer for the NAL HRD in units of a
 *  90 kHz clock.
 * @vcl_initial_cpb_removal_delay: specify the j-th default initial CPB removal
 *  delay of the i-th temporal sublayer for the VCL HRD in units of a 90 kHz clock.
 * @vcl_initial_cpb_removal_offset: specify the j-th default initial CPB removal
 *  offset of the i-th temporal sublayer for the VCL HRD in units of a 90 kHz clock.
 * @vcl_initial_alt_cpb_removal_delay: specify the j-th alternative initial CPB
 *  removal delay of the i-th temporal sublayer for the VCL HRD in units of a
 *  90 kHz clock.
 * @vcl_initial_alt_cpb_removal_offset: specify the j-th alternative initial CPB
 *  removal offset of the i-th temporal sublayer for the VCL HRD in units of a
 *  90 kHz clock.
 * @sublayer_dpb_output_offsets_present_flag: specifies whether DPB output time
 *  offsets are present for sublayer representation.
 * @dpb_output_tid_offset: specifies the difference between the DPB output times
 *  for the i-th sublayer representation.
 * @alt_cpb_params_present_flag: specifies the presence of the syntax element
 *  bp_use_alt_cpb_params_flag.
 * @use_alt_cpb_params_flag: could be used to derive the value of
 *  UseAltCpbParamsFlag.
 *
 * Structure defining the H266 buffering period.
 *
 * Since: 1.26
  }
  PGstH266BufferingPeriod = ^TGstH266BufferingPeriod;
  TGstH266BufferingPeriod = record
      nal_hrd_params_present_flag : Tguint8;
      vcl_hrd_params_present_flag : Tguint8;
      cpb_initial_removal_delay_length_minus1 : Tguint8;
      cpb_removal_delay_length_minus1 : Tguint8;
      dpb_output_delay_length_minus1 : Tguint8;
      du_hrd_params_present_flag : Tguint8;
      du_cpb_removal_delay_increment_length_minus1 : Tguint8;
      dpb_output_delay_du_length_minus1 : Tguint8;
      du_cpb_params_in_pic_timing_sei_flag : Tguint8;
      du_dpb_params_in_pic_timing_sei_flag : Tguint8;
      concatenation_flag : Tguint8;
      additional_concatenation_info_present_flag : Tguint8;
      max_initial_removal_delay_for_concatenation : Tguint8;
      cpb_removal_delay_delta_minus1 : Tguint8;
      max_sublayers_minus1 : Tguint8;
      cpb_removal_delay_deltas_present_flag : Tguint8;
      num_cpb_removal_delay_deltas_minus1 : Tguint8;
      cpb_removal_delay_delta_val : array[0..15] of Tguint8;
      cpb_cnt_minus1 : Tguint8;
      sublayer_initial_cpb_removal_delay_present_flag : Tguint8;
      nal_initial_cpb_removal_delay : array[0..7] of array[0..31] of Tguint8;
      nal_initial_cpb_removal_offset : array[0..7] of array[0..31] of Tguint8;
      nal_initial_alt_cpb_removal_delay : array[0..7] of array[0..31] of Tguint8;
      nal_initial_alt_cpb_removal_offset : array[0..7] of array[0..31] of Tguint8;
      vcl_initial_cpb_removal_delay : array[0..7] of array[0..31] of Tguint8;
      vcl_initial_cpb_removal_offset : array[0..7] of array[0..31] of Tguint8;
      vcl_initial_alt_cpb_removal_delay : array[0..7] of array[0..31] of Tguint8;
      vcl_initial_alt_cpb_removal_offset : array[0..7] of array[0..31] of Tguint8;
      sublayer_dpb_output_offsets_present_flag : Tguint8;
      dpb_output_tid_offset : array[0..7] of Tguint32;
      alt_cpb_params_present_flag : Tguint8;
      use_alt_cpb_params_flag : Tguint8;
    end;

{*
 * GstH266PicTiming:
 * @cpb_removal_delay_minus: calculate the number of clock ticks between the
 *  nominal CPB removal times of the AU associated with the PT SEI message.
 * @sublayer_delays_present_flag: specifies whether cpb removal values are
 *  present for the sublayer with TemporalId equal to i.
 * @cpb_removal_delay_delta_enabled_flag: specifies whether
 *  pt_cpb_removal_delay_delta_idx[i] is present in the PT SEI message.
 * @cpb_removal_delay_delta_idx: specifies the index of the CPB removal delta.
 * @cpb_removal_delay_minus1: is used to calculate the number of clock ticks
 *  between the nominal CPB removal times of the AU.
 * @dpb_output_delay: is used to compute the DPB output time of the AU.
 * @cpb_alt_timing_info_present_flag: specifies whether the cpb alt syntax
 *  elements could be present in the PT SEI message.
 * @nal_cpb_alt_initial_removal_delay_delta: specifies whether alternative
 *  initial CPB removal delay delta for the i-th sublayer for the j-th CPB for
 *  the NAL HRD in units of a 90 kHz clock.
 * @nal_cpb_alt_initial_removal_offset_delta: specifies whether alternative
 *  initial CPB removal offset delta for the i-th sublayer for the j-th CPB for
 *  the NAL HRD in units of a 90 kHz clock.
 * @nal_cpb_delay_offset: specifies an offset to be used in the derivation of
 *  the nominal CPB removal times of the AU.
 * @nal_dpb_delay_offset: specifies an offset to be used in the derivation of
 *  the DPB output times of the IRAP AU.
 * @vcl_cpb_alt_initial_removal_delay_delta: specifies the alternative initial
 *  CPB removal delay delta for the i-th sublayer for the j-th CPB for the VCL
 *  HRD in units of a 90 kHz clock.
 * @vcl_cpb_alt_initial_removal_offset_delta: specifies the alternative initial
 *  CPB removal offset delta for the i-th sublayer for the j-th CPB for the VCL
 *  HRD in units of a 90 kHz clock.
 * @vcl_cpb_delay_offset: specifies an offset to be used in the derivation of
 *  the nominal CPB removal times of the AU.
 * @vcl_dpb_delay_offset: specifies an offset to be used in the derivation of
 *  the DPB output times of the IRAP AU.
 * @dpb_output_du_delay: is used to compute the DPB output time of the AU when
 *  DecodingUnitHrdFlag is equal to 1.
 * @num_decoding_units_minus1: specifies the number of DUs in the AU the PT SEI
 *  message is associated with.
 * @du_common_cpb_removal_delay_flag: specifies whether the syntax elements
 *  pt_du_common_cpb_removal_delay_increment_minus1[i] are present.
 * @du_common_cpb_removal_delay_increment_minus1: specifies the duration between
 *  the nominal CPB removal times of any two consecutive DUs in decoding order
 *  in the AU.
 * @num_nalus_in_du_minus1: specifies the number of NAL units in the i-th DU of
 *  the AU the PT SEI message is associated with.
 * @du_cpb_removal_delay_increment_minus1: specifies the duration between the
 *  nominal CPB removal times of the (i + 1)-th DU and the i-th DU.
 * @delay_for_concatenation_ensured_flag: specifies that the difference between
 *  the final arrival time and the CPB removal time of the AU is present.
 * @display_elemental_periods_minus1: indicates the number of elemental picture
 *  period intervals.
 *
 * Structure defining the H266 picture timing.
 *
 * Since: 1.26
  }
{ TODO: PicSizeInCtbsY could be very large  }
  PGstH266PicTiming = ^TGstH266PicTiming;
  TGstH266PicTiming = record
      cpb_removal_delay_minus : Tguint8;
      sublayer_delays_present_flag : array[0..7] of Tguint8;
      cpb_removal_delay_delta_enabled_flag : array[0..7] of Tguint8;
      cpb_removal_delay_delta_idx : array[0..7] of Tguint8;
      cpb_removal_delay_minus1 : array[0..7] of Tguint8;
      dpb_output_delay : Tguint8;
      cpb_alt_timing_info_present_flag : Tguint8;
      nal_cpb_alt_initial_removal_delay_delta : array[0..7] of array[0..31] of Tguint8;
      nal_cpb_alt_initial_removal_offset_delta : array[0..7] of array[0..31] of Tguint8;
      nal_cpb_delay_offset : array[0..7] of Tguint8;
      nal_dpb_delay_offset : array[0..7] of Tguint8;
      vcl_cpb_alt_initial_removal_delay_delta : array[0..7] of array[0..31] of Tguint8;
      vcl_cpb_alt_initial_removal_offset_delta : array[0..7] of array[0..31] of Tguint8;
      vcl_cpb_delay_offset : array[0..7] of Tguint8;
      vcl_dpb_delay_offset : array[0..7] of Tguint8;
      dpb_output_du_delay : Tguint8;
      num_decoding_units_minus1 : Tguint32;
      du_common_cpb_removal_delay_flag : Tguint8;
      du_common_cpb_removal_delay_increment_minus1 : array[0..7] of Tguint8;
      num_nalus_in_du_minus1 : array[0..(GST_H266_MAX_DECODING_UNITS_IN_PIC_TIMING)-1] of Tguint32;
      du_cpb_removal_delay_increment_minus1 : array[0..(GST_H266_MAX_DECODING_UNITS_IN_PIC_TIMING)-1] of array[0..7] of Tguint8;
      delay_for_concatenation_ensured_flag : Tguint8;
      display_elemental_periods_minus1 : Tguint8;
    end;

{*
 * GstH266RegisteredUserData:
 * @country_code: an itu_t_t35_country_code.
 * @country_code_extension: an itu_t_t35_country_code_extension_byte.
 *   Should be ignored when @country_code is not 0xff
 * @size: the size of @data in bytes
 * @data: the data of itu_t_t35_payload_byte
 *   excluding @country_code and @country_code_extension
 *
 * The User data registered by Rec. ITU-T T.35 SEI message.
 *
 * Since: 1.28
  }
(* Const before type ignored *)
  PGstH266RegisteredUserData = ^TGstH266RegisteredUserData;
  TGstH266RegisteredUserData = record
      country_code : Tguint8;
      country_code_extension : Tguint8;
      size : Tguint;
      data : Pguint8;
    end;

{*
 * GstH266DUInfo:
 * @decoding_unit_idx: specifies the index to the list of DUs in the current AU.
 * @sublayer_delays_present_flag: specifies whether
 *  dui_du_cpb_removal_delay_increment[i] is present for the sublayer.
 * @du_cpb_removal_delay_increment: specifies the duration between the nominal
 *  CPB times of the last DU in decoding order in the current AU.
 * @dpb_output_du_delay_present_flag: specifies the presence of the
 *  dui_dpb_output_du_delay syntax element in the DUI SEI message.
 * @dpb_output_du_delay: is used to compute the DPB output time of the AU.
 *
 * Structure defining the H266 decoding unit info.
 *
 * Since: 1.26
  }
  PGstH266DUInfo = ^TGstH266DUInfo;
  TGstH266DUInfo = record
      decoding_unit_idx : Tguint32;
      sublayer_delays_present_flag : array[0..7] of Tguint8;
      du_cpb_removal_delay_increment : array[0..7] of Tguint8;
      dpb_output_du_delay_present_flag : Tguint8;
      dpb_output_du_delay : Tguint8;
    end;

{*
 * GstH266ScalableNesting:
 * @ols_flag: specifies whether the scalable-nested SEI messages apply to
 *  specific OLSs.
 * @subpic_flag: specifies whether the scalable-nested SEI messages that apply
 *  to specified OLSs or layers apply only to specific subpictures of the
 *  specified OLSs or layers.
 * @num_olss_minus1: specifies the number of OLSs to which the scalable-nested
 *  SEI messages apply.
 * @ols_idx_delta_minus1: is used to derive the variable NestingOlsIdx[i].
 * @all_layers_flag: specifies whether the scalable-nested SEI messages apply to
 *  all layers that have nuh_layer_id greater than or equal to the nuh_layer_id
 *  of the current SEI NAL unit.
 * @num_layers_minus1: specifies the number of layers to which the
 *  scalable-nested SEI messages apply.
 * @layer_id: specifies the nuh_layer_id value of the i-th layer to which the
 *  scalable-nested SEI messages apply.
 * @num_subpics_minus1: specifies the number of subpictures in each picture in
 *  the multiSubpicLayers.
 * @subpic_id_len_minus1: specifies the number of bits used to represent the
 *  syntax element sn_subpic_id[i].
 * @subpic_id: indicates the subpicture ID of the i-th subpicture in each
 *  picture in the multiSubpicLayers.
 * @num_seis_minus1: specifies the number of scalable-nested SEI messages.
 *
 * Structure defining the H266 scalable nesting.
 *
 * Since: 1.26
  }
  PGstH266ScalableNesting = ^TGstH266ScalableNesting;
  TGstH266ScalableNesting = record
      ols_flag : Tguint8;
      subpic_flag : Tguint8;
      num_olss_minus1 : Tguint8;
      ols_idx_delta_minus1 : array[0..(GST_H266_MAX_TOTAL_NUM_OLSS)-1] of Tguint8;
      all_layers_flag : Tguint8;
      num_layers_minus1 : Tguint8;
      layer_id : array[0..(GST_H266_MAX_LAYERS)-1] of Tguint8;
      num_subpics_minus1 : Tguint16;
      subpic_id_len_minus1 : Tguint8;
      subpic_id : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint8;
      num_seis_minus1 : Tguint8;
    end;

{*
 * GstH266SubPicLevelInfo:
 * @num_ref_levels_minus1: specifies the number of reference levels signalled
 *  for each subpicture sequences.
 * @cbr_constraint_flag: specifies whether to decode the sub-bitstreams
 *  resulting from extraction of any subpicture sequence.
 * @explicit_fraction_present_flag: specifies whether the syntax elements
 *  sli_ref_level_fraction_minus1[ i ] are present.
 * @num_subpics_minus1: specifies the number of subpictures in the pictures in
 *  the multiSubpicLayers in targetCvss.
 * @max_sublayers_minus1: specifies the maximum number of temporal sublayers in
 *  the subpicture sequences.
 * @sublayer_info_present_flag: specifies whether the level information for
 *  subpicture sequences is present for sublayer representation.
 * @non_subpic_layers_fraction: indicates the i-th fraction of the bitstream
 *  level limits associated with layers in targetCvss.
 * @ref_level_idc: indicates the i-th level to which each subpicture sequence
 *  conforms as specified in Annex A.
 * @ref_level_fraction_minus1: specifies the i-th fraction of the level limits
 *  for the subpictures.
 *
 * Structure defining the H266 subpicture level information.
 *
 * Since: 1.26
  }
  PGstH266SubPicLevelInfo = ^TGstH266SubPicLevelInfo;
  TGstH266SubPicLevelInfo = record
      num_ref_levels_minus1 : Tguint8;
      cbr_constraint_flag : Tguint8;
      explicit_fraction_present_flag : Tguint8;
      num_subpics_minus1 : Tguint16;
      max_sublayers_minus1 : Tguint8;
      sublayer_info_present_flag : Tguint8;
      non_subpic_layers_fraction : array[0..(GST_H266_MAX_SLI_REF_LEVELS)-1] of array[0..(GST_H266_MAX_SUBLAYERS)-1] of Tguint8;
      ref_level_idc : array[0..(GST_H266_MAX_SLI_REF_LEVELS)-1] of array[0..(GST_H266_MAX_SUBLAYERS)-1] of Tguint8;
      ref_level_fraction_minus1 : array[0..(GST_H266_MAX_SLI_REF_LEVELS)-1] of array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of array[0..(GST_H266_MAX_SUBLAYERS)-1] of Tguint8;
    end;

{*
 * GstH266FrameFieldInfo:
 * @field_pic_flag: indicates whether the display model considers the current
 *  picture as a field.
 * @bottom_field_flag: indicates whether the current picture is a bottom field.
 * @pairing_indicated_flag: indicates whether the current picture is considered
 *  paired with the next picture in output order or with the previous picture
 *  in output order as the two fields of a frame.
 * @paired_with_next_field_flag: indicates whether the current picture is
 *  considered paired with the next picture as the two fields of a frame.
 * @display_fields_from_frame_flag: indicates whether the display model operates
 *  by sequentially displaying the individual fields of the frame with
 *  alternating parity.
 * @top_field_first_flag: indicates that the first field of the frame that is
 *  displayed by the display model is the top field.
 * @display_elemental_periods_minus1: indicates the number of elemental picture
 *  period intervals that the current coded picture or field occupies for the
 *  display model.
 * @source_scan_type; indicates whether the source scan type of the associated
 *  picture should be interpreted as progressive.
 * @duplicate_flag: indicates whether the current picture is indicated to be a
 *  duplicate of a previous picture in output order.
 * @valid: whether this frame field info is valid.
 *
 * Structure defining the H266 frame field information.
 *
 * Since: 1.26
  }
  PGstH266FrameFieldInfo = ^TGstH266FrameFieldInfo;
  TGstH266FrameFieldInfo = record
      field_pic_flag : Tguint8;
      bottom_field_flag : Tguint8;
      pairing_indicated_flag : Tguint8;
      paired_with_next_field_flag : Tguint8;
      display_fields_from_frame_flag : Tguint8;
      top_field_first_flag : Tguint8;
      display_elemental_periods_minus1 : Tguint8;
      source_scan_type : Tguint8;
      duplicate_flag : Tguint8;
      valid : Tgboolean;
    end;

{*
 * GstH266SEIMessage:
 * @payloadType: the payload type of #GstH266SEIPayloadType.
 * @buffering_period: buffering period sei of #GstH266BufferingPeriod.
 * @pic_timing: picture timing sei of #GstH266PicTiming.
 * @du_info: decoding unit info sei of #GstH266DUInfo.
 * @scalable_nesting: scalable nesting sei of #GstH266ScalableNesting.
 * @subpic_level_info: subpicture level info sei of #GstH266SubPicLevelInfo.
 * @frame_field_info: frame field info sei of #GstH266FrameFieldInfo.
 * @registered_user_data: registered user data sei of #GstH266RegisteredUserData. (Since: 1.28)
 *
 * Structure defining the H266 sei message.
 *
 * Since: 1.26
  }
{*
     * GstH266SEIMessage.registered_user_data:
     *
     * Registered user data sei of #GstH266RegisteredUserData.
     *
     * Since: 1.28
      }
{ ... could implement more  }
{< private > }
  PGstH266SEIMessage = ^TGstH266SEIMessage;
  TGstH266SEIMessage = record
      payloadType : TGstH266SEIPayloadType;
      payload : record
          case longint of
            0 : ( buffering_period : TGstH266BufferingPeriod );
            1 : ( pic_timing : TGstH266PicTiming );
            2 : ( du_info : TGstH266DUInfo );
            3 : ( scalable_nesting : TGstH266ScalableNesting );
            4 : ( subpic_level_info : TGstH266SubPicLevelInfo );
            5 : ( frame_field_info : TGstH266FrameFieldInfo );
            6 : ( registered_user_data : TGstH266RegisteredUserData );
            7 : ( padding : array[0..(GST_PADDING_LARGE)-1] of Tgpointer );
          end;
    end;

{*
  * GstH266DecoderConfigRecordNalUnitArray:
  *
  * Contains NAL Unit array data as defined in ISO/IEC 14496-15
  *
  * Since: 1.26
  }
{*
   * GstH266DecoderConfigRecordNalUnitArray.array_completeness:
   *
   * 1: all NAL units of the given type are in this array and none
   *   are in the stream.
   * 0: additional NAL units of the indicated type may be in the stream
    }
{*
   * GstH266DecoderConfigRecordNalUnitArray.nal_unit_type:
   *
   * Indicates the type of the NAL units in the following array.
   * Shall be VPS, SPS, PPS, prefix APS or suffix APS
    }
{*
   * GstH266DecoderConfigRecordNalUnitArray.nalu:
   *
   * Array of identified #GstH266NalUnit
    }
  PGstH266DecoderConfigRecordNalUnitArray = ^TGstH266DecoderConfigRecordNalUnitArray;
  TGstH266DecoderConfigRecordNalUnitArray = record
      array_completeness : Tguint8;
      nal_unit_type : TGstH266NalUnitType;
      nalu : PGArray;
    end;

{*
 * GstH266PTLRecord:
 * @num_bytes_constraint_info: Number of bytes for constraint information.
 * @general_profile_idc: General profile id.
 * @general_tier_flag: General tier flag.
 * @general_level_idc: General level id.
 * @ptl_frame_only_constraint_flag: Frame-only constraint flag.
 * @ptl_multilayer_enabled_flag: Multilayer enabled flag.
 * @general_constraint_info: Array containing general constraint information.
 * @ptl_sublayer_level_present_flag: Array indicating presence of sublayer level.
 * @sublayer_level_idc: Array containing sublayer level ids.
 * @ptl_num_sub_profiles: Number of sub-profiles.
 * @general_sub_profile_idc: Array containing general sub-profile ids.
 *
 * Contains VvcPTLRecord data as defined in ISO/IEC 14496-15
 *
 * Since: 1.26
  }
  PGstH266PTLRecord = ^TGstH266PTLRecord;
  TGstH266PTLRecord = record
      num_bytes_constraint_info : Tguint8;
      general_profile_idc : Tguint8;
      general_tier_flag : Tguint8;
      general_level_idc : Tguint8;
      ptl_frame_only_constraint_flag : Tguint8;
      ptl_multilayer_enabled_flag : Tguint8;
      general_constraint_info : array[0..62] of Tguint8;
      ptl_sublayer_level_present_flag : array[0..6] of Tguint8;
      sublayer_level_idc : array[0..6] of Tguint8;
      ptl_num_sub_profiles : Tguint8;
      general_sub_profile_idc : array[0..254] of Tguint32;
    end;

{*
 * GstH266DecoderConfigRecord:
 *
 * Contains VVCDecoderConfigurationRecord data as defined in ISO/IEC 14496-15
 *
 * Since: 1.26
  }
{*
   * GstH266DecoderConfigRecord.length_size_minus_one:
   *
   * indicates the length in bytes of nal unit length field.
   * This value shall be one of 0, 1, or 3 corresponding to a length
   * encoded with 1, 2, or 4 bytes, respectively
    }
{*
   * GstH266DecoderConfigRecord.ptl_present_flag:
   *
   * true: profile, tier and level information is present
    }
{*
   * GstH266DecoderConfigRecord.ols_idx:
   *
   * Operating point layer set index
    }
{*
   * GstH266DecoderConfigRecord.num_sublayers:
   *
   * Number of sublayers
    }
{*
   * GstH266DecoderConfigRecord.constant_frame_rate:
   *
   * Indicates if the frame rate is constant
    }
{*
   * GstH266DecoderConfigRecord.chroma_format_idc:
   *
   * Chroma format indicator
    }
{*
   * GstH266DecoderConfigRecord.bit_depth_minus8:
   *
   * Bit depth minus 8
    }
{*
    * GstH266DecoderConfigRecord.native_ptl:
    *
    * Profile, tier and level information
    }
{*
   * GstH266DecoderConfigRecord.max_picture_width:
   *
   * Maximum picture width
    }
{*
   * GstH266DecoderConfigRecord.max_picture_height:
   *
   * Maximum picture height
    }
{*
   * GstH266DecoderConfigRecord.avg_frame_rate:
   *
   * Average frame rate
    }
{*
   * GstH266DecoderConfigRecord.nalu_array:
   *
   * Array of #GstH266DecoderConfigRecordNalUnitArray
    }
{< private > }
  PGstH266DecoderConfigRecord = ^TGstH266DecoderConfigRecord;
  TGstH266DecoderConfigRecord = record
      length_size_minus_one : Tguint8;
      ptl_present_flag : Tguint8;
      ols_idx : Tguint16;
      num_sublayers : Tguint8;
      constant_frame_rate : Tguint8;
      chroma_format_idc : Tguint8;
      bit_depth_minus8 : Tguint8;
      native_ptl : TGstH266PTLRecord;
      max_picture_width : Tguint16;
      max_picture_height : Tguint16;
      avg_frame_rate : Tguint16;
      nalu_array : PGArray;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstH266Parser:
 *
 * H266 NAL Parser (opaque structure).
 *
 * Since: 1.26
  }
{< private > }
  PGstH266Parser = ^TGstH266Parser;
  TGstH266Parser = record
      vps : array[0..(GST_H266_MAX_VPS_COUNT)-1] of TGstH266VPS;
      sps : array[0..(GST_H266_MAX_SPS_COUNT)-1] of TGstH266SPS;
      pps : array[0..(GST_H266_MAX_PPS_COUNT)-1] of TGstH266PPS;
      aps : array[0..(GST_H266_APS_TYPE_MAX)-1] of array[0..(GST_H266_MAX_APS_COUNT)-1] of TGstH266APS;
      last_vps : PGstH266VPS;
      last_sps : PGstH266SPS;
      last_pps : PGstH266PPS;
      last_aps : array[0..(GST_H266_APS_TYPE_MAX)-1] of PGstH266APS;
      ph : TGstH266PicHdr;
      buffering_period : TGstH266SEIMessage;
      last_buffering_period : PGstH266SEIMessage;
      active_vps : PGstH266VPS;
      active_sps : PGstH266SPS;
      active_pps : PGstH266PPS;
      ctb_addr_in_slice : array[0..(GST_H266_MAX_CTUS_IN_PICTURE)-1] of Tguint16;
      slice_start_offset : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint16;
      num_ctus_in_slice : array[0..(GST_H266_MAX_SLICES_PER_AU)-1] of Tguint16;
      ctb_to_tile_col_bd : array[0..(GST_H266_MAX_CTUS_IN_PICTURE)-1] of Tguint16;
      ctb_to_tile_row_bd : array[0..(GST_H266_MAX_CTUS_IN_PICTURE)-1] of Tguint16;
    end;


function gst_h266_parser_new:PGstH266Parser;cdecl;external;
(* Const before type ignored *)
function gst_h266_parser_identify_nalu(parser:PGstH266Parser; data:Pguint8; offset:Tguint; size:Tgsize; nalu:PGstH266NalUnit):TGstH266ParserResult;cdecl;external;
(* Const before type ignored *)
function gst_h266_parser_identify_nalu_unchecked(parser:PGstH266Parser; data:Pguint8; offset:Tguint; size:Tgsize; nalu:PGstH266NalUnit):TGstH266ParserResult;cdecl;external;
(* Const before type ignored *)
function gst_h266_parser_identify_nalu_vvc(parser:PGstH266Parser; data:Pguint8; offset:Tguint; size:Tgsize; nal_length_size:Tguint8; 
           nalu:PGstH266NalUnit):TGstH266ParserResult;cdecl;external;
(* Const before type ignored *)
function gst_h266_parser_identify_and_split_nalu_vvc(parser:PGstH266Parser; data:Pguint8; offset:Tguint; size:Tgsize; nal_length_size:Tguint8; 
           nalus:PGArray; consumed:Pgsize):TGstH266ParserResult;cdecl;external;
function gst_h266_parser_parse_nal(parser:PGstH266Parser; nalu:PGstH266NalUnit):TGstH266ParserResult;cdecl;external;
function gst_h266_parser_parse_aud(parser:PGstH266Parser; nalu:PGstH266NalUnit; aud:PGstH266AUD):TGstH266ParserResult;cdecl;external;
function gst_h266_parser_parse_opi(parser:PGstH266Parser; nalu:PGstH266NalUnit; opi:PGstH266OPI):TGstH266ParserResult;cdecl;external;
function gst_h266_parser_parse_dci(parser:PGstH266Parser; nalu:PGstH266NalUnit; dci:PGstH266DCI):TGstH266ParserResult;cdecl;external;
function gst_h266_parser_parse_picture_hdr(parser:PGstH266Parser; nalu:PGstH266NalUnit; picture:PGstH266PicHdr):TGstH266ParserResult;cdecl;external;
function gst_h266_parser_parse_slice_hdr(parser:PGstH266Parser; nalu:PGstH266NalUnit; slice:PGstH266SliceHdr):TGstH266ParserResult;cdecl;external;
function gst_h266_parser_parse_vps(parser:PGstH266Parser; nalu:PGstH266NalUnit; vps:PGstH266VPS):TGstH266ParserResult;cdecl;external;
function gst_h266_parser_parse_sps(parser:PGstH266Parser; nalu:PGstH266NalUnit; sps:PGstH266SPS):TGstH266ParserResult;cdecl;external;
function gst_h266_parser_parse_pps(parser:PGstH266Parser; nalu:PGstH266NalUnit; pps:PGstH266PPS):TGstH266ParserResult;cdecl;external;
function gst_h266_parser_parse_aps(parser:PGstH266Parser; nalu:PGstH266NalUnit; aps:PGstH266APS):TGstH266ParserResult;cdecl;external;
function gst_h266_parser_parse_sei(parser:PGstH266Parser; nalu:PGstH266NalUnit; messages:PPGArray):TGstH266ParserResult;cdecl;external;
procedure gst_h266_parser_free(parser:PGstH266Parser);cdecl;external;
function gst_h266_parse_vps(nalu:PGstH266NalUnit; vps:PGstH266VPS):TGstH266ParserResult;cdecl;external;
function gst_h266_parse_sps(parser:PGstH266Parser; nalu:PGstH266NalUnit; sps:PGstH266SPS):TGstH266ParserResult;cdecl;external;
function gst_h266_parse_pps(parser:PGstH266Parser; nalu:PGstH266NalUnit; pps:PGstH266PPS):TGstH266ParserResult;cdecl;external;
function gst_h266_parse_aps(parser:PGstH266Parser; nalu:PGstH266NalUnit; aps:PGstH266APS):TGstH266ParserResult;cdecl;external;
(* Const before type ignored *)
function gst_h266_profile_to_string(profile:TGstH266Profile):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_h266_profile_from_string(_string:Pgchar):TGstH266Profile;cdecl;external;
procedure gst_h266_decoder_config_record_free(config:PGstH266DecoderConfigRecord);cdecl;external;
(* Const before type ignored *)
function gst_h266_parser_parse_decoder_config_record(parser:PGstH266Parser; data:Pguint8; size:Tgsize; config:PPGstH266DecoderConfigRecord):TGstH266ParserResult;cdecl;external;

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H266_IS_B_SLICE(slice : longint) : longint;
begin
  GST_H266_IS_B_SLICE:=(slice^.slice_type)=GST_H266_B_SLICE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H266_IS_P_SLICE(slice : longint) : longint;
begin
  GST_H266_IS_P_SLICE:=(slice^.slice_type)=GST_H266_P_SLICE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H266_IS_I_SLICE(slice : longint) : longint;
begin
  GST_H266_IS_I_SLICE:=(slice^.slice_type)=GST_H266_I_SLICE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H266_IS_NAL_TYPE_GDR(nal_type : longint) : longint;
begin
  GST_H266_IS_NAL_TYPE_GDR:=nal_type=GST_H266_NAL_SLICE_GDR;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H266_IS_NAL_TYPE_CRA(nal_type : longint) : longint;
begin
  GST_H266_IS_NAL_TYPE_CRA:=nal_type=GST_H266_NAL_SLICE_CRA;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H266_IS_NAL_TYPE_RADL(nal_type : longint) : longint;
begin
  GST_H266_IS_NAL_TYPE_RADL:=nal_type=GST_H266_NAL_SLICE_RADL;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H266_IS_NAL_TYPE_RASL(nal_type : longint) : longint;
begin
  GST_H266_IS_NAL_TYPE_RASL:=nal_type=GST_H266_NAL_SLICE_RASL;
end;


end.
