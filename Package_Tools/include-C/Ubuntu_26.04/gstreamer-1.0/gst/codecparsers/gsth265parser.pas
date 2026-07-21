unit gsth265parser;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Gstreamer H.265 bitstream parser
 * Copyright (C) 2013 Intel Corporation
 * Copyright (C) 2013 Sreerenj Balachandran <sreerenj.balachandran@intel.com>
 *
 *  Contact: Sreerenj Balachandran <sreerenj.balachandran@intel.com>
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
{$ifndef __GST_H265_PARSER_H__}
{$define __GST_H265_PARSER_H__}
{$include <gst/gst.h>}
{$include <gst/codecparsers/codecparsers-prelude.h>}

const
  GST_H265_MAX_SUB_LAYERS = 8;  
  GST_H265_MAX_VPS_COUNT = 16;  
  GST_H265_MAX_SPS_COUNT = 16;  
  GST_H265_MAX_PPS_COUNT = 64;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_H265_IS_B_SLICE(slice : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H265_IS_P_SLICE(slice : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H265_IS_I_SLICE(slice : longint) : longint;

{*
 * GST_H265_IS_NAL_TYPE_IDR:
 * @nal_type: a #GstH265NalUnitType
 *
 * Check whether @nal_type is IDR or not
 *
 * Since: 1.18
  }
{xxxx  #define GST_H265_IS_NAL_TYPE_IDR(nal_type)   ((nal_type) == GST_H265_NAL_SLICE_IDR_W_RADL || (nal_type) == GST_H265_NAL_SLICE_IDR_N_LP) }
{*
 * GST_H265_IS_NAL_TYPE_IRAP:
 * @nal_type: a #GstH265NalUnitType
 *
 * Check whether @nal_type is IRAP or not
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H265_IS_NAL_TYPE_IRAP(nal_type : longint) : longint;

{*
 * GST_H265_IS_NAL_TYPE_BLA:
 * @nal_type: a #GstH265NalUnitType
 *
 * Check whether @nal_type is BLA or not
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H265_IS_NAL_TYPE_BLA(nal_type : longint) : longint;

{*
 * GST_H265_IS_NAL_TYPE_CRA:
 * @nal_type: a #GstH265NalUnitType
 *
 * Check whether @nal_type is CRA or not
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H265_IS_NAL_TYPE_CRA(nal_type : longint) : longint;

{*
 * GST_H265_IS_NAL_TYPE_RADL:
 * @nal_type: a #GstH265NalUnitType
 *
 * Check whether @nal_type is RADL or not
 *
 * Since: 1.18
  }
{xxxxxxxxx #define GST_H265_IS_NAL_TYPE_RADL(nal_type) \  ((nal_type) == GST_H265_NAL_SLICE_RADL_N || (nal_type) == GST_H265_NAL_SLICE_RADL_R) }
{*
 * GST_H265_IS_NAL_TYPE_RASL:
 * @nal_type: a #GstH265NalUnitType
 *
 * Check whether @nal_type is RASL or not
 *
 * Since: 1.18
  }
{xxxx #define GST_H265_IS_NAL_TYPE_RASL(nal_type) \  ((nal_type) == GST_H265_NAL_SLICE_RASL_N || (nal_type) == GST_H265_NAL_SLICE_RASL_R) }
{*
 * GstH265Profile:
 * @GST_H265_PROFILE_MAIN: Main profile (A.3.2)
 * @GST_H265_PROFILE_MAIN_10: Main 10 profile (A.3.3)
 * @GST_H265_PROFILE_MAIN_STILL_PICTURE: Main Still Picture profile (A.3.4)
 * @GST_H265_PROFILE_MONOCHROME: Monochrome profile (A.3.4)
 * @GST_H265_PROFILE_MONOCHROME_12: Monochrome 12-bits profile (A.3.4)
 * @GST_H265_PROFILE_MONOCHROME_16: Monochrome 16-bits profile (A.3.4)
 * @GST_H265_PROFILE_MAIN_12: Main profile 12-bits (A.3.4)
 * @GST_H265_PROFILE_MAIN_422_10: Main 4:2:2 profile 10-bits (A.3.4)
 * @GST_H265_PROFILE_MAIN_422_12: Main 4:2:2 profile 12-bits (A.3.4)
 * @GST_H265_PROFILE_MAIN_444: Main 4:4:4 profile (A.3.4)
 * @GST_H265_PROFILE_MAIN_444_10: Main 4:4:4 10-bits profile (A.3.4)
 * @GST_H265_PROFILE_MAIN_444_12: Main 4:4:4 12-bits profile (A.3.4)
 * @GST_H265_PROFILE_MAIN_INTRA: Main Intra profile (A.3.4)
 * @GST_H265_PROFILE_MAIN_10_INTRA: Main Intra 10-bits profile (A.3.4)
 * @GST_H265_PROFILE_MAIN_12_INTRA: Main Intra 12-bits profile (A.3.4)
 * @GST_H265_PROFILE_MAIN_422_10_INTRA: Main Intra 4:2:2 10-bits profile (A.3.4)
 * @GST_H265_PROFILE_MAIN_422_12_INTRA: Main Intra 4:2:2 12-bits profile (A.3.4)
 * @GST_H265_PROFILE_MAIN_444_INTRA: Main Intra 4:4:4 profile (A.3.4)
 * @GST_H265_PROFILE_MAIN_444_10_INTRA: Main Intra 4:4:4 10-bits profile (A.3.4)
 * @GST_H265_PROFILE_MAIN_444_12_INTRA: Main Intra 4:4:4 12-bits profile (A.3.4)
 * @GST_H265_PROFILE_MAIN_444_16_INTRA: Main Intra 4:4:4 16-bits profile (A.3.4)
 * @GST_H265_PROFILE_MAIN_444_STILL_PICTURE: Main 4:4:4 Still Picture profile (A.3.4)
 * @GST_H265_PROFILE_MAIN_444_16_STILL_PICTURE: Main 4:4:4 16-bits Still Picture profile (A.3.4)
 * @GST_H265_PROFILE_MONOCHROME_10:  Monochrome 10-bits profile (A.3.5) (Since: 1.18)
 * @GST_H265_PROFILE_HIGH_THROUGHPUT_444: High Throughput 4:4:4 profile (A.3.6) (Since: 1.18)
 * @GST_H265_PROFILE_HIGH_THROUGHPUT_444_10: High Throughput 4:4:4 10-bits profile (A.3.6) (Since: 1.18)
 * @GST_H265_PROFILE_HIGH_THROUGHPUT_444_14: High Throughput 4:4:4 14-bits profile (A.3.6) (Since: 1.18)
 * @GST_H265_PROFILE_HIGH_THROUGHPUT_444_16_INTRA: High Throughput 4:4:4 16-bits Intra profile (A.3.6) (Since: 1.18)
 * @GST_H265_PROFILE_SCREEN_EXTENDED_MAIN: Screen-Extended Main profile (A.3.7) (Since: 1.18)
 * @GST_H265_PROFILE_SCREEN_EXTENDED_MAIN_10: Screen-Extended Main 10-bits profile (A.3.7) (Since: 1.18)
 * @GST_H265_PROFILE_SCREEN_EXTENDED_MAIN_444: Screen-Extended Main 4:4:4 profile (A.3.7) (Since: 1.18)
 * @GST_H265_PROFILE_SCREEN_EXTENDED_MAIN_444_10: Screen-Extended Main 4:4:4 10-bits profile (A.3.7) (Since: 1.18)
 * @GST_H265_PROFILE_SCREEN_EXTENDED_HIGH_THROUGHPUT_444: Screen-Extended High Throughput 4:4:4 profile (A.3.7) (Since: 1.18)
 * @GST_H265_PROFILE_SCREEN_EXTENDED_HIGH_THROUGHPUT_444_10: Screen-Extended High Throughput 4:4:4 10-bits profile (A.3.7) (Since: 1.18)
 * @GST_H265_PROFILE_SCREEN_EXTENDED_HIGH_THROUGHPUT_444_14: Screen-Extended High Throughput 4:4:4 14-bits profile (A.3.7) (Since: 1.18)
 * @GST_H265_PROFILE_MULTIVIEW_MAIN: Multiview Main profile (G.11.1) (Since: 1.18)
 * @GST_H265_PROFILE_SCALABLE_MAIN: Scalable Main profile (H.11.1) (Since: 1.18)
 * @GST_H265_PROFILE_SCALABLE_MAIN_10: Scalable Main 10-bits profile (H.11.1) (Since: 1.18)
 * @GST_H265_PROFILE_SCALABLE_MONOCHROME: Scalable Monochrome profile (H.11.1) (Since: 1.18)
 * @GST_H265_PROFILE_SCALABLE_MONOCHROME_12: Scalable Monochrome 12-bits profile (H.11.1) (Since: 1.18)
 * @GST_H265_PROFILE_SCALABLE_MONOCHROME_16: Scalable Monochrome 16-bits profile (H.11.1) (Since: 1.18)
 * @GST_H265_PROFILE_SCALABLE_MAIN_444: Scalable Main 4:4:4 profile (H.11.1) (Since: 1.18)
 * @GST_H265_PROFILE_3D_MAIN: 3D Main 4:4:4 profile (I.11.1) (Since: 1.18)
 *
 * H.265 Profiles.
 *
  }
{ end of the profiles  }
type
  PGstH265Profile = ^TGstH265Profile;
  TGstH265Profile =  Longint;
  Const
    GST_H265_PROFILE_INVALID = -(1);
    GST_H265_PROFILE_MAIN = 1;
    GST_H265_PROFILE_MAIN_10 = 2;
    GST_H265_PROFILE_MAIN_STILL_PICTURE = 3;
    GST_H265_PROFILE_MONOCHROME = 4;
    GST_H265_PROFILE_MONOCHROME_12 = 5;
    GST_H265_PROFILE_MONOCHROME_16 = 6;
    GST_H265_PROFILE_MAIN_12 = 7;
    GST_H265_PROFILE_MAIN_422_10 = 8;
    GST_H265_PROFILE_MAIN_422_12 = 9;
    GST_H265_PROFILE_MAIN_444 = 10;
    GST_H265_PROFILE_MAIN_444_10 = 11;
    GST_H265_PROFILE_MAIN_444_12 = 12;
    GST_H265_PROFILE_MAIN_INTRA = 13;
    GST_H265_PROFILE_MAIN_10_INTRA = 14;
    GST_H265_PROFILE_MAIN_12_INTRA = 15;
    GST_H265_PROFILE_MAIN_422_10_INTRA = 16;
    GST_H265_PROFILE_MAIN_422_12_INTRA = 17;
    GST_H265_PROFILE_MAIN_444_INTRA = 18;
    GST_H265_PROFILE_MAIN_444_10_INTRA = 19;
    GST_H265_PROFILE_MAIN_444_12_INTRA = 20;
    GST_H265_PROFILE_MAIN_444_16_INTRA = 21;
    GST_H265_PROFILE_MAIN_444_STILL_PICTURE = 22;
    GST_H265_PROFILE_MAIN_444_16_STILL_PICTURE = 23;
    GST_H265_PROFILE_MONOCHROME_10 = 24;
    GST_H265_PROFILE_HIGH_THROUGHPUT_444 = 25;
    GST_H265_PROFILE_HIGH_THROUGHPUT_444_10 = 26;
    GST_H265_PROFILE_HIGH_THROUGHPUT_444_14 = 27;
    GST_H265_PROFILE_HIGH_THROUGHPUT_444_16_INTRA = 28;
    GST_H265_PROFILE_SCREEN_EXTENDED_MAIN = 29;
    GST_H265_PROFILE_SCREEN_EXTENDED_MAIN_10 = 30;
    GST_H265_PROFILE_SCREEN_EXTENDED_MAIN_444 = 31;
    GST_H265_PROFILE_SCREEN_EXTENDED_MAIN_444_10 = 32;
    GST_H265_PROFILE_SCREEN_EXTENDED_HIGH_THROUGHPUT_444 = 33;
    GST_H265_PROFILE_SCREEN_EXTENDED_HIGH_THROUGHPUT_444_10 = 34;
    GST_H265_PROFILE_SCREEN_EXTENDED_HIGH_THROUGHPUT_444_14 = 35;
    GST_H265_PROFILE_MULTIVIEW_MAIN = 36;
    GST_H265_PROFILE_SCALABLE_MAIN = 37;
    GST_H265_PROFILE_SCALABLE_MAIN_10 = 38;
    GST_H265_PROFILE_SCALABLE_MONOCHROME = 39;
    GST_H265_PROFILE_SCALABLE_MONOCHROME_12 = 40;
    GST_H265_PROFILE_SCALABLE_MONOCHROME_16 = 41;
    GST_H265_PROFILE_SCALABLE_MAIN_444 = 42;
    GST_H265_PROFILE_3D_MAIN = 43;
    GST_H265_PROFILE_MAX = 44;
;
{*
 * GstH265ProfileIDC:
 * @GST_H265_PROFILE_IDC_MAIN: Main profile (A.3.2)
 * @GST_H265_PROFILE_IDC_MAIN_10: Main 10 profile (A.3.3)
 * @GST_H265_PROFILE_IDC_MAIN_STILL_PICTURE: Main Still Picture profile (A.3.4)
 * @GST_H265_PROFILE_IDC_FORMAT_RANGE_EXTENSION: Format range extensions profile (A.3.5)
 * @GST_H265_PROFILE_IDC_HIGH_THROUGHPUT: High throughput profiles (A.3.6)
 * @GST_H265_PROFILE_IDC_MULTIVIEW_MAIN: Multiview Main profiles (G.11.1) (Since: 1.18)
 * @GST_H265_PROFILE_IDC_SCALABLE_MAIN: Scalable Main and Scalable Main 10 profile (H.11.1) (Since: 1.18)
 * @GST_H265_PROFILE_IDC_SCREEN_CONTENT_CODING: Screen content coding extensions profiles (A.3.7)
 * @GST_H265_PROFILE_IDC_3D_MAIN: 3D Main profile (I.11.1) (Since: 1.18)
 * @GST_H265_PROFILE_IDC_SCALABLE_FORMAT_RANGE_EXTENSION: Scalable Format range extensions profiles (H.11.1) (Since: 1.18)
 * @GST_H265_PROFILE_IDC_HIGH_THROUGHPUT_SCREEN_CONTENT_CODING_EXTENSION: High throughput screen content coding extensions profiles (A.3.8) (Since: 1.18)
 *
 * Valid values for the profile_idc field. This is different from
 * #GstH265Profile as an extension idc can be used to encode a whole variety of
 * profiles.
 *
  }
type
  PGstH265ProfileIDC = ^TGstH265ProfileIDC;
  TGstH265ProfileIDC =  Longint;
  Const
    GST_H265_PROFILE_IDC_MAIN = 1;
    GST_H265_PROFILE_IDC_MAIN_10 = 2;
    GST_H265_PROFILE_IDC_MAIN_STILL_PICTURE = 3;
    GST_H265_PROFILE_IDC_FORMAT_RANGE_EXTENSION = 4;
    GST_H265_PROFILE_IDC_HIGH_THROUGHPUT = 5;
    GST_H265_PROFILE_IDC_MULTIVIEW_MAIN = 6;
    GST_H265_PROFILE_IDC_SCALABLE_MAIN = 7;
    GST_H265_PROFILE_IDC_3D_MAIN = 8;
    GST_H265_PROFILE_IDC_SCREEN_CONTENT_CODING = 9;
    GST_H265_PROFILE_IDC_SCALABLE_FORMAT_RANGE_EXTENSION = 10;
    GST_H265_PROFILE_IDC_HIGH_THROUGHPUT_SCREEN_CONTENT_CODING_EXTENSION = 11;
;
{*
 * GstH265NalUnitType:
 * @GST_H265_NAL_SLICE_TRAIL_N: Slice nal of a non-TSA, non-STSA trailing picture
 * @GST_H265_NAL_SLICE_TRAIL_R: Slice nal of a non-TSA, non-STSA trailing picture
 * @GST_H265_NAL_SLICE_TSA_N: Slice nal of a TSA picture
 * @GST_H265_NAL_SLICE_TSA_R: Slice nal of a TSA picture
 * @GST_H265_NAL_SLICE_STSA_N: Slice nal of a STSA picture
 * @GST_H265_NAL_SLICE_STSA_R: Slice nal of a STSA picture
 * @GST_H265_NAL_SLICE_RADL_N: Slice nal of a RADL picture
 * @GST_H265_NAL_SLICE_RADL_R: Slice nal of a RADL piicture
 * @GST_H265_NAL_SLICE_RASL_N: Slice nal of a RASL picture
 * @GST_H265_NAL_SLICE_RASL_R: Slice nal of a RASL picture
 * @GST_H265_NAL_SLICE_BLA_W_LP: Slice nal of a BLA picture
 * @GST_H265_NAL_SLICE_BLA_W_RADL: Slice nal of a BLA picture
 * @GST_H265_NAL_SLICE_BLA_N_LP: Slice nal of a BLA picture
 * @GST_H265_NAL_SLICE_IDR_W_RADL: Slice nal of an IDR picture
 * @GST_H265_NAL_SLICE_IDR_N_LP: Slice nal of an IDR picture
 * @GST_H265_NAL_SLICE_CRA_NUT: Slice nal of a CRA picture
 * @GST_H265_NAL_VPS: Video parameter set(VPS) nal unit
 * @GST_H265_NAL_SPS: Sequence parameter set (SPS) nal unit
 * @GST_H265_NAL_PPS: Picture parameter set (PPS) nal unit
 * @GST_H265_NAL_AUD: Access unit (AU) delimiter nal unit
 * @GST_H265_NAL_EOS: End of sequence (EOS) nal unit
 * @GST_H265_NAL_EOB: End of bitstream (EOB) nal unit
 * @GST_H265_NAL_FD: Filler data (FD) nal lunit
 * @GST_H265_NAL_PREFIX_SEI: Supplemental enhancement information prefix nal unit
 * @GST_H265_NAL_SUFFIX_SEI: Suppliemental enhancement information suffix nal unit
 *
 * Indicates the type of H265 Nal Units
  }
type
  PGstH265NalUnitType = ^TGstH265NalUnitType;
  TGstH265NalUnitType =  Longint;
  Const
    GST_H265_NAL_SLICE_TRAIL_N = 0;
    GST_H265_NAL_SLICE_TRAIL_R = 1;
    GST_H265_NAL_SLICE_TSA_N = 2;
    GST_H265_NAL_SLICE_TSA_R = 3;
    GST_H265_NAL_SLICE_STSA_N = 4;
    GST_H265_NAL_SLICE_STSA_R = 5;
    GST_H265_NAL_SLICE_RADL_N = 6;
    GST_H265_NAL_SLICE_RADL_R = 7;
    GST_H265_NAL_SLICE_RASL_N = 8;
    GST_H265_NAL_SLICE_RASL_R = 9;
    GST_H265_NAL_SLICE_BLA_W_LP = 16;
    GST_H265_NAL_SLICE_BLA_W_RADL = 17;
    GST_H265_NAL_SLICE_BLA_N_LP = 18;
    GST_H265_NAL_SLICE_IDR_W_RADL = 19;
    GST_H265_NAL_SLICE_IDR_N_LP = 20;
    GST_H265_NAL_SLICE_CRA_NUT = 21;
    GST_H265_NAL_VPS = 32;
    GST_H265_NAL_SPS = 33;
    GST_H265_NAL_PPS = 34;
    GST_H265_NAL_AUD = 35;
    GST_H265_NAL_EOS = 36;
    GST_H265_NAL_EOB = 37;
    GST_H265_NAL_FD = 38;
    GST_H265_NAL_PREFIX_SEI = 39;
    GST_H265_NAL_SUFFIX_SEI = 40;
;
  GST_H265_RESERVED_NON_IRAP_SUBLAYER_NAL_TYPE_MIN = 10;  
  GST_H265_RESERVED_NON_IRAP_SUBLAYER_NAL_TYPE_MAX = 15;  
  GST_H265_RESERVED_IRAP_NAL_TYPE_MIN = 22;  
  GST_H265_RESERVED_IRAP_NAL_TYPE_MAX = 23;  
  GST_H265_RESERVED_NON_IRAP_NAL_TYPE_MIN = 24;  
  GST_H265_RESERVED_NON_IRAP_NAL_TYPE_MAX = 31;  
  GST_H265_RESERVED_NON_VCL_NAL_TYPE_MIN = 41;  
  GST_H265_RESERVED_NON_VCL_NAL_TYPE_MAX = 47;  
  GST_H265_UNSPECIFIED_NON_VCL_NAL_TYPE_MIN = 48;  
  GST_H265_UNSPECIFIED_NON_VCL_NAL_TYPE_MAX = 63;  
{*
 * GstH265ParserResult:
 * @GST_H265_PARSER_OK: The parsing succeeded
 * @GST_H265_PARSER_BROKEN_DATA: The data to parse is broken
 * @GST_H265_PARSER_BROKEN_LINK: The link to structure needed for the parsing couldn't be found
 * @GST_H265_PARSER_ERROR: An error accured when parsing
 * @GST_H265_PARSER_NO_NAL: No nal found during the parsing
 * @GST_H265_PARSER_NO_NAL_END: Start of the nal found, but not the end.
 *
 * The result of parsing H265 data.
  }
type
  PGstH265ParserResult = ^TGstH265ParserResult;
  TGstH265ParserResult =  Longint;
  Const
    GST_H265_PARSER_OK = 0;
    GST_H265_PARSER_BROKEN_DATA = 1;
    GST_H265_PARSER_BROKEN_LINK = 2;
    GST_H265_PARSER_ERROR = 3;
    GST_H265_PARSER_NO_NAL = 4;
    GST_H265_PARSER_NO_NAL_END = 5;
;
{*
 * GstH265SEIPayloadType:
 * @GST_H265_SEI_BUF_PERIOD: Buffering Period SEI Message
 * @GST_H265_SEI_PIC_TIMING: Picture Timing SEI Message
 * @GST_H265_SEI_REGISTERED_USER_DATA: Registered user data (D.2.5)
 * @GST_H265_SEI_RECOVERY_POINT: Recovery Point SEI Message (D.3.8)
 * @GST_H265_SEI_TIME_CODE: Time code SEI message (D.2.27) (Since: 1.16)
 * @GST_H265_SEI_MASTERING_DISPLAY_COLOUR_VOLUME: Mastering display colour volume information SEI message (D.2.28) (Since: 1.18)
 * @GST_H265_SEI_CONTENT_LIGHT_LEVEL: Content light level information SEI message (D.2.35) (Since: 1.18)
 * ...
 *
 * The type of SEI message.
  }
{*
 * GST_H265_SEI_USER_DATA_UNREGISTERED
 *
 * User data unregistered (D.2.7)
 *
 * Since: 1.24
  }
{ and more...   }
type
  PGstH265SEIPayloadType = ^TGstH265SEIPayloadType;
  TGstH265SEIPayloadType =  Longint;
  Const
    GST_H265_SEI_BUF_PERIOD = 0;
    GST_H265_SEI_PIC_TIMING = 1;
    GST_H265_SEI_REGISTERED_USER_DATA = 4;
    GST_H265_SEI_USER_DATA_UNREGISTERED = 5;
    GST_H265_SEI_RECOVERY_POINT = 6;
    GST_H265_SEI_TIME_CODE = 136;
    GST_H265_SEI_MASTERING_DISPLAY_COLOUR_VOLUME = 137;
    GST_H265_SEI_CONTENT_LIGHT_LEVEL = 144;
;
{*
 * GstH265SEIPicStructType:
 * @GST_H265_SEI_PIC_STRUCT_FRAME: Picture is a frame
 * @GST_H265_SEI_PIC_STRUCT_TOP_FIELD: Top field of frame
 * @GST_H265_SEI_PIC_STRUCT_BOTTOM_FIELD: Botom field of frame
 * @GST_H265_SEI_PIC_STRUCT_TOP_BOTTOM: Top bottom field of frame
 * @GST_H265_SEI_PIC_STRUCT_BOTTOM_TOP: bottom top field of frame
 * @GST_H265_SEI_PIC_STRUCT_TOP_BOTTOM_TOP: top bottom top field of frame
 * @GST_H265_SEI_PIC_STRUCT_BOTTOM_TOP_BOTTOM: bottom top bottom field of frame
 * @GST_H265_SEI_PIC_STRUCT_FRAME_DOUBLING: indicates that the frame should
 *  be displayed two times consecutively
 * @GST_H265_SEI_PIC_STRUCT_FRAME_TRIPLING: indicates that the frame should be
 *  displayed three times consecutively
 * @GST_H265_SEI_PIC_STRUCT_TOP_PAIRED_PREVIOUS_BOTTOM: top field paired with
 *  previous bottom field in output order
 * @GST_H265_SEI_PIC_STRUCT_BOTTOM_PAIRED_PREVIOUS_TOP: bottom field paried with
 *  previous top field in output order
 * @GST_H265_SEI_PIC_STRUCT_TOP_PAIRED_NEXT_BOTTOM: top field paired with next
 *  bottom field in output order
 * @GST_H265_SEI_PIC_STRUCT_BOTTOM_PAIRED_NEXT_TOP: bottom field paired with
 *  next top field in output order
 *
 * SEI pic_struct type
  }
type
  PGstH265SEIPicStructType = ^TGstH265SEIPicStructType;
  TGstH265SEIPicStructType =  Longint;
  Const
    GST_H265_SEI_PIC_STRUCT_FRAME = 0;
    GST_H265_SEI_PIC_STRUCT_TOP_FIELD = 1;
    GST_H265_SEI_PIC_STRUCT_BOTTOM_FIELD = 2;
    GST_H265_SEI_PIC_STRUCT_TOP_BOTTOM = 3;
    GST_H265_SEI_PIC_STRUCT_BOTTOM_TOP = 4;
    GST_H265_SEI_PIC_STRUCT_TOP_BOTTOM_TOP = 5;
    GST_H265_SEI_PIC_STRUCT_BOTTOM_TOP_BOTTOM = 6;
    GST_H265_SEI_PIC_STRUCT_FRAME_DOUBLING = 7;
    GST_H265_SEI_PIC_STRUCT_FRAME_TRIPLING = 8;
    GST_H265_SEI_PIC_STRUCT_TOP_PAIRED_PREVIOUS_BOTTOM = 9;
    GST_H265_SEI_PIC_STRUCT_BOTTOM_PAIRED_PREVIOUS_TOP = 10;
    GST_H265_SEI_PIC_STRUCT_TOP_PAIRED_NEXT_BOTTOM = 11;
    GST_H265_SEI_PIC_STRUCT_BOTTOM_PAIRED_NEXT_TOP = 12;
;
{*
 * GstH265SliceType:
 *
 * Type of Picture slice
  }
type
  PGstH265SliceType = ^TGstH265SliceType;
  TGstH265SliceType =  Longint;
  Const
    GST_H265_B_SLICE = 0;
    GST_H265_P_SLICE = 1;
    GST_H265_I_SLICE = 2;
;
type
  PGstH265QuantMatrixSize = ^TGstH265QuantMatrixSize;
  TGstH265QuantMatrixSize =  Longint;
  Const
    GST_H265_QUANT_MATIX_4X4 = 0;
    GST_H265_QUANT_MATIX_8X8 = 1;
    GST_H265_QUANT_MATIX_16X16 = 2;
    GST_H265_QUANT_MATIX_32X32 = 3;
;
{*
 * GstH265Level:
 * @GST_H265_LEVEL_L1: Level 1
 * @GST_H265_LEVEL_L2: Level 2
 * @GST_H265_LEVEL_L2_1: Level 2.1
 * @GST_H265_LEVEL_L3: Level 3
 * @GST_H265_LEVEL_L3_1: Level 3.1
 * @GST_H265_LEVEL_L4: Level 4
 * @GST_H265_LEVEL_L4_1: Level 4.1
 * @GST_H265_LEVEL_L5: Level 5
 * @GST_H265_LEVEL_L5_1: Level 5.1
 * @GST_H265_LEVEL_L5_2: Level 5.2
 * @GST_H265_LEVEL_L6: Level 6
 * @GST_H265_LEVEL_L6_1: Level 6.1
 * @GST_H265_LEVEL_L6_2: Level 6.2
 *
 * H.265 level
 *
 * Since: 1.24
  }
type
  PGstH265Level = ^TGstH265Level;
  TGstH265Level =  Longint;
  Const
    GST_H265_LEVEL_L1 = 30;
    GST_H265_LEVEL_L2 = 60;
    GST_H265_LEVEL_L2_1 = 63;
    GST_H265_LEVEL_L3 = 90;
    GST_H265_LEVEL_L3_1 = 93;
    GST_H265_LEVEL_L4 = 120;
    GST_H265_LEVEL_L4_1 = 123;
    GST_H265_LEVEL_L5 = 150;
    GST_H265_LEVEL_L5_1 = 153;
    GST_H265_LEVEL_L5_2 = 156;
    GST_H265_LEVEL_L6 = 180;
    GST_H265_LEVEL_L6_1 = 183;
    GST_H265_LEVEL_L6_2 = 186;
;
type
{*
 * GstH265NalUnit:
 * @type: A #GstH265NalUnitType
 * @layer_id: A nal unit layer id
 * @temporal_id_plus1: A nal unit temporal identifier
 * @size: The size of the nal unit starting from @offset
 * @offset: The offset of the actual start of the nal unit
 * @sc_offset:The offset of the start code of the nal unit
 * @valid: If the nal unit is valid, which mean it has
 * already been parsed
 * @data: The data from which the Nalu has been parsed
 *
 * Structure defining the Nal unit headers
  }
{ calculated values  }
  PGstH265NalUnit = ^TGstH265NalUnit;
  TGstH265NalUnit = record
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
 * GstH265ProfileTierLevel:
 * @profile_space: specifies the context for the interpretation of
 *   general_profile_idc and general_profile_combatibility_flag
 * @tier_flag: the tier context for the interpretation of general_level_idc
 * @profile_idc: profile id
 * @profile_compatibility_flag: compatibility flags
 * @progressive_source_flag: flag to indicate the type of stream
 * @interlaced_source_flag: flag to indicate the type of stream
 * @non_packed_constraint_flag: indicate the presence of frame packing
 *   arrangement sei message
 * @frame_only_constraint_flag: recognize the field_seq_flag
 * @max_12bit_constraint_flag: used to define profile extensions, see Annex A
 * @max_10bit_constraint_flag: used to define profile extensions, see Annex A
 * @max_8bit_constraint_flag: used to define profile extensions, see Annex A
 * @max_422chroma_constraint_flag: used to define profile extensions, see Annex A
 * @max_420chroma_constraint_flag: used to define profile extensions, see Annex A
 * @max_monochrome_constraint_flag: used to define profile extensions, see Annex A
 * @intra_constraint_flag: used to define profile extensions, see Annex A
 * @one_picture_only_constraint_flag: used to define profile extensions, see Annex A
 * @lower_bit_rate_constraint_flag: used to define profile extensions, see Annex A
 * @max_14bit_constraint_flag: used to define profile extensions, see Annex A
 * @level idc: indicate the level which the CVS confirms
 * @sub_layer_profile_present_flag: sublayer profile presence ind
 * @sub_layer_level_present_flag:sublayer level presence indicator.
 * @sub_layer_profile_space: profile space for sublayers
 * @sub_layer_tier_flag: tier flags for sublayers.
 * @sub_layer_profile_idc: conformant profile indicator for sublayers.
 * @sub_layer_profile_compatibility_flag[6][32]: compatibility flags for sublayers
 * @sub_layer_progressive_source_flag:progressive stream indicator for sublayer
 * @sub_layer_interlaced_source_flag: interlaced stream indicator for sublayer
 * @sub_layer_non_packed_constraint_flag: indicate the presence of
 *   frame packing arrangement sei message with in sublayers
 * @sub_layer_frame_only_constraint_flag:recognize the sublayer
 *   specific field_seq_flag
 * @sub_layer_level_idc:indicate the sublayer specific level
 *
 * Define ProfileTierLevel parameters
  }
  PGstH265ProfileTierLevel = ^TGstH265ProfileTierLevel;
  TGstH265ProfileTierLevel = record
      profile_space : Tguint8;
      tier_flag : Tguint8;
      profile_idc : Tguint8;
      profile_compatibility_flag : array[0..31] of Tguint8;
      progressive_source_flag : Tguint8;
      interlaced_source_flag : Tguint8;
      non_packed_constraint_flag : Tguint8;
      frame_only_constraint_flag : Tguint8;
      max_12bit_constraint_flag : Tguint8;
      max_10bit_constraint_flag : Tguint8;
      max_8bit_constraint_flag : Tguint8;
      max_422chroma_constraint_flag : Tguint8;
      max_420chroma_constraint_flag : Tguint8;
      max_monochrome_constraint_flag : Tguint8;
      intra_constraint_flag : Tguint8;
      one_picture_only_constraint_flag : Tguint8;
      lower_bit_rate_constraint_flag : Tguint8;
      max_14bit_constraint_flag : Tguint8;
      level_idc : Tguint8;
      sub_layer_profile_present_flag : array[0..5] of Tguint8;
      sub_layer_level_present_flag : array[0..5] of Tguint8;
      sub_layer_profile_space : array[0..5] of Tguint8;
      sub_layer_tier_flag : array[0..5] of Tguint8;
      sub_layer_profile_idc : array[0..5] of Tguint8;
      sub_layer_profile_compatibility_flag : array[0..5] of array[0..31] of Tguint8;
      sub_layer_progressive_source_flag : array[0..5] of Tguint8;
      sub_layer_interlaced_source_flag : array[0..5] of Tguint8;
      sub_layer_non_packed_constraint_flag : array[0..5] of Tguint8;
      sub_layer_frame_only_constraint_flag : array[0..5] of Tguint8;
      sub_layer_level_idc : array[0..5] of Tguint8;
    end;

{*
 * GstH265SubLayerHRDParams:
 * @bit_rate_value_minus1:togeter with bit_rate_scale, it specifies
 *   the maximum input bitrate when the CPB operates at the access
 *   unit level
 * @cpb_size_value_minus1: is used together with cpb_size_scale to
 *   specify the CPB size when the CPB operates at the access unit
 *   level
 * @cpb_size_du_value_minus1: is used together with cpb_size_du_scale
 *   to specify the CPB size when the CPB operates at sub-picture
 *   level
 * @bit_rate_du_value_minus1: together with bit_rate_scale, it
 *   specifies the maximum input bit rate when the CPB operates at the
 *   sub-picture level
 * @cbr_flag: indicate whether HSS operates in intermittent bit rate
 *   mode or constant bit rate mode.
 *
 * Defines the Sublayer HRD parameters
  }
  PGstH265SubLayerHRDParams = ^TGstH265SubLayerHRDParams;
  TGstH265SubLayerHRDParams = record
      bit_rate_value_minus1 : array[0..31] of Tguint32;
      cpb_size_value_minus1 : array[0..31] of Tguint32;
      cpb_size_du_value_minus1 : array[0..31] of Tguint32;
      bit_rate_du_value_minus1 : array[0..31] of Tguint32;
      cbr_flag : array[0..31] of Tguint8;
    end;

{*
 * GstH265HRDParams:
 * @nal_hrd_parameters_present_flag: indicate the presence of NAL HRD parameters
 * @vcl_hrd_parameters_present_flag: indicate the presence of VCL HRD parameters
 * @sub_pic_hrd_params_present_flag: indicate the presence of sub_pic_hrd_params
 * @tick_divisor_minus2: is used to specify the clock sub-tick
 * @du_cpb_removal_delay_increment_length_minus1: specifies the length,
 *   in bits, of the nal_initial_cpb_removal_delay
 * @sub_pic_cpb_params_in_pic_timing_sei_flag: specifies the length, in bits, of
 *   the cpb_delay_offset and the au_cpb_removal_delay_minus1 syntax elements.
 * @dpb_output_delay_du_length_minu1: specifies the length, in bits, of the
 *   dpb_delay_offset and the pic_dpb_output_delay syntax elements
 * @bit_rate_scale: maximum input bitrate
 * @cpb_size_scale: CPB size when operates in access unit level
 * @cpb_size_du_scale: CPB size when operates in sub-picture level
 * @initial_cpb_removal_delay_length_minus1: specifies the length, in bits, of the
 *   nal_initial_cpb_removal_delay, nal_initial_cpb_removal_offset,
 *   vcl_initial_cpb_removal_delay and vcl_initial_cpb_removal_offset.
 * @au_cpb_removal_delay_length_minus1: specifies the length, in bits, of the
 *   cpb_delay_offset and the au_cpb_removal_delay_minus1 syntax elements
 * @dpb_output_delay_length_minus1: specifies the length, in bits, of the
 *   dpb_delay_offset and the pic_dpb_output_delay syntax elements
 * @fixed_pic_rate_general_flag: flag to indicate the presence of constraint
 *   on the temporal distance between the HRD output times of consecutive
 *   pictures in output order
 * @fixed_pic_rate_within_cvs_flag: same as fixed_pic_rate_general_flag
 * @elemental_duration_in_tc_minus1: temporal distance in clock ticks
 * @low_delay_hrd_flag: specifies the HRD operational mode
 * @cpb_cnt_minus1:specifies the number of alternative CPS specifications.
 * @sublayer_hrd_params: Sublayer HRD parameters.
 *
 * Defines the HRD parameters
  }
  PGstH265HRDParams = ^TGstH265HRDParams;
  TGstH265HRDParams = record
      nal_hrd_parameters_present_flag : Tguint8;
      vcl_hrd_parameters_present_flag : Tguint8;
      sub_pic_hrd_params_present_flag : Tguint8;
      tick_divisor_minus2 : Tguint8;
      du_cpb_removal_delay_increment_length_minus1 : Tguint8;
      sub_pic_cpb_params_in_pic_timing_sei_flag : Tguint8;
      dpb_output_delay_du_length_minus1 : Tguint8;
      bit_rate_scale : Tguint8;
      cpb_size_scale : Tguint8;
      cpb_size_du_scale : Tguint8;
      initial_cpb_removal_delay_length_minus1 : Tguint8;
      au_cpb_removal_delay_length_minus1 : Tguint8;
      dpb_output_delay_length_minus1 : Tguint8;
      fixed_pic_rate_general_flag : array[0..6] of Tguint8;
      fixed_pic_rate_within_cvs_flag : array[0..6] of Tguint8;
      elemental_duration_in_tc_minus1 : array[0..6] of Tguint16;
      low_delay_hrd_flag : array[0..6] of Tguint8;
      cpb_cnt_minus1 : array[0..6] of Tguint8;
      sublayer_hrd_params : array[0..6] of TGstH265SubLayerHRDParams;
    end;

{*
 * GstH265VPS:
 * @id: vps id
 * @base_layer_internal_flag and @base_layer_available_flag:
 *   specify availability of base layer
 * @max_layers_minus1: should be zero, but can be other values in future
 * @max_sub_layers_minus1:specifies the maximum number of temporal sub-layers
 * @temporal_id_nesting_flag: specifies whether inter prediction is
 *   additionally restricted
 * @profile_tier_level: ProfileTierLevel info
 * @sub_layer_ordering_info_present_flag: indicates the presence of
 *   vps_max_dec_pic_buffering_minus1, vps_max_num_reorder_pics and
 *   vps_max_latency_increase_plus1
 * @max_dec_pic_buffering_minus1: specifies the maximum required size
 *   of the decoded picture buffer
 * @max_num_reorder_pics: indicates the maximum allowed number of
 *   pictures that can precede any picture in the CVS in decoding
 *   order
 * @max_latency_increase_plus1: is used to compute the value of
 *   VpsMaxLatencyPictures
 * @max_layer_id: specifies the maximum allowed value of nuh_layer_id
 * @num_layer_sets_minus1: specifies the number of layer sets
 * @layer_id_included_flag: specifies whether a nuh_layer_id included
 *   in the layer identifier list
 * @timing_info_present_flag: indicate the presence of
 *   num_units_in_tick, time_scale, poc_proportional_to_timing_flag
 *   and num_hrd_parameters
 * @num_units_in_tick: number of time units in a tick
 * @time_scale: number of time units that pass in one second
 * @poc_proportional_to_timing_flag: indicate whether the picture
 *   order count is proportional to output timin
 * @num_ticks_poc_diff_one_minus1: specifies the number of clock ticks
 *   corresponding to a difference of picture order count values equal
 *   to 1
 * @num_hrd_parameters: number of hrd_parameters present
 * @hrd_layer_set_idx: index to the list of layer hrd params.
 * @hrd_params: the GstH265HRDParams list
 *
 * Defines the VPS parameters
  }
{ FIXME: following HRD related info should be an array  }
  PGstH265VPS = ^TGstH265VPS;
  TGstH265VPS = record
      id : Tguint8;
      base_layer_internal_flag : Tguint8;
      base_layer_available_flag : Tguint8;
      max_layers_minus1 : Tguint8;
      max_sub_layers_minus1 : Tguint8;
      temporal_id_nesting_flag : Tguint8;
      profile_tier_level : TGstH265ProfileTierLevel;
      sub_layer_ordering_info_present_flag : Tguint8;
      max_dec_pic_buffering_minus1 : array[0..(GST_H265_MAX_SUB_LAYERS)-1] of Tguint8;
      max_num_reorder_pics : array[0..(GST_H265_MAX_SUB_LAYERS)-1] of Tguint8;
      max_latency_increase_plus1 : array[0..(GST_H265_MAX_SUB_LAYERS)-1] of Tguint32;
      max_layer_id : Tguint8;
      num_layer_sets_minus1 : Tguint16;
      timing_info_present_flag : Tguint8;
      num_units_in_tick : Tguint32;
      time_scale : Tguint32;
      poc_proportional_to_timing_flag : Tguint8;
      num_ticks_poc_diff_one_minus1 : Tguint32;
      num_hrd_parameters : Tguint16;
      hrd_layer_set_idx : Tguint16;
      cprms_present_flag : Tguint8;
      hrd_params : TGstH265HRDParams;
      vps_extension : Tguint8;
      valid : Tgboolean;
    end;

{*
 * GstH265ShortTermRefPicSet:
 * @inter_ref_pic_set_prediction_flag: %TRUE specifies that the stRpsIdx-th candidate
 *  short-term RPS is predicted from another candidate short-term RPS
 * @delta_idx_minus1: plus 1 specifies the difference between the value of source and
 *  candidate short term RPS.
 * @delta_rps_sign: delta_rps_sign and abs_delta_rps_minus1 together specify
 *  the value of the variable deltaRps.
 * @abs_delta_rps_minus1: delta_rps_sign and abs_delta_rps_minus1 together specify
 *  the value of the variable deltaRps
 * @NumDeltaPocs: sum of @NumNegativePics and @NumPositivePics.
 * @NumNegativePics: Derived value depending on inter_ref_pic_set_prediction_flag.
 *  If inter_ref_pic_set_prediction_flag is equal to 0, this specifies
 *  the number of entries in the stRpsIdx-th candidate
 *  short-term RPS that have poc values less than the poc of the current picture.
 * @NumPositivePics: Derived value depending on inter_ref_pic_set_prediction_flag.
 *  If inter_ref_pic_set_prediction_flag is equal to 0, this specifies
 *  the number of entires in the stRpsIdx-th candidate
 *  short-term RPS that have poc values greater than the poc value of the current picture.
 * @UsedByCurrPicS0: Derived value depending on inter_ref_pic_set_prediction_flag.
 *  If inter_ref_pic_set_prediction_flag is equal to 0,
 *  equal to zero specifies that the i-th entry in the stRpsIdx-th
 *  candidate short-term RPS that has poc value less than of the current picture
 *  is not used for reference by the current picture
 * @UsedByCurrPicS1: Derived value depending on inter_ref_pic_set_prediction_flag.
 *  If inter_ref_pic_set_prediction_flag is equal to 0,
 *  equal to zero specifies that the i-th entry in the current
 *  candidate short-term RPS that has poc value greater than that of the current picture
 *  is not used for reference by the current picture.
 * @DeltaPocS0: Derived value depending on inter_ref_pic_set_prediction_flag.
 *  See 7.4.8 Short-term reference picture set semantics
 * @DeltaPocS1: Derived value depending on inter_ref_pic_set_prediction_flag.
 *  See 7.4.8 Short-term reference picture set semantics
 * @NumDeltaPocsOfRefRpsIdx: The value of NumDeltaPocs[RefRpsIdx].
 *  If inter_ref_pic_set_prediction_flag is equal to 0,
 *  this value should be ignored (Since: 1.18)
 *
 * Defines the #GstH265ShortTermRefPicSet params
  }
{ calculated values  }
  PGstH265ShortTermRefPicSet = ^TGstH265ShortTermRefPicSet;
  TGstH265ShortTermRefPicSet = record
      inter_ref_pic_set_prediction_flag : Tguint8;
      delta_idx_minus1 : Tguint8;
      delta_rps_sign : Tguint8;
      abs_delta_rps_minus1 : Tguint16;
      NumDeltaPocs : Tguint8;
      NumNegativePics : Tguint8;
      NumPositivePics : Tguint8;
      UsedByCurrPicS0 : array[0..15] of Tguint8;
      UsedByCurrPicS1 : array[0..15] of Tguint8;
      DeltaPocS0 : array[0..15] of Tgint32;
      DeltaPocS1 : array[0..15] of Tgint32;
      NumDeltaPocsOfRefRpsIdx : Tguint8;
    end;

{*
 * GstH265ShortTermRefPicSetExt:
 * @use_delta_flag: Bit j equals to 1 specifies that the j-th entry in the source candidate
 *  short-term RPS is included in this candidate short-term RPS.
 * @used_by_curr_pic: Bit j specifies if short-term RPS j is used by the current picture.
 * @delta_poc_s0_minus1: Specifies the negative picture order count delta for the i-th
 *  entry in the short-term RPS. See details in section 7.4.8 "Short-term reference
 *  picture set semantics" of the specification.
 * @delta_poc_s1_minus1: Specifies the positive picture order count delta for the i-th
 *  entry in the short-term RPS. See details in section 7.4.8 "Short-term reference
 *  picture set semantics" of the specification.
 *
 * Defines the extended #GstH265ShortTermRefPicSetExt params
 *
 * Since: 1.28
  }
  PGstH265ShortTermRefPicSetExt = ^TGstH265ShortTermRefPicSetExt;
  TGstH265ShortTermRefPicSetExt = record
      use_delta_flag : array[0..15] of Tguint8;
      used_by_curr_pic_flag : array[0..15] of Tguint8;
      delta_poc_s0_minus1 : array[0..15] of Tguint32;
      delta_poc_s1_minus1 : array[0..15] of Tguint32;
    end;

{*
 * GstH265VUIParams:
 * @parsed: %TRUE indicate that VUI parameters have been parsed (Since: 1.22)
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
 * @neutral_chroma_indication_flag: %TRUE indicate that the value of chroma samples is equla
 *  to 1<<(BitDepthchrom-1).
 * @field_seq_flag: %TRUE indicate field and %FALSE indicate frame
 * @frame_field_info_present_flag: %TRUE indicate picture timing SEI messages are present for every
 *   picture and include the pic_struct, source_scan_type, and duplicate_flag syntax elements.
 * @default_display_window_flag: %TRUE indicate that the default display window parameters present
 * def_disp_win_left_offset:left offset of display rect
 * def_disp_win_right_offset: right offset of display rect
 * def_disp_win_top_offset: top offset of display rect
 * def_disp_win_bottom_offset: bottom offset of display rect
 * @timing_info_present_flag: %TRUE specifies that num_units_in_tick,
 *  time_scale and fixed_frame_rate_flag are present in the bitstream
 * @num_units_in_tick: is the number of time units of a clock operating at the frequency time_scale Hz
 * @time_scale: is the number of time units that pass in one second
 * @poc_proportional_to_timing_flag: %TRUE indicates that the picture order count value for each picture
 *  in the CVS that is not the first picture in the CVS, in decoding order, is proportional to the output
 *  time of the picture relative to the output time of the first picture in the CVS.
 * @num_ticks_poc_diff_one_minus1: plus 1 specifies the number of clock ticks corresponding to a
 *  difference of picture order count values equal to 1
 * @hrd_parameters_present_flag: %TRUE if hrd parameters present in the bitstream
 * @bitstream_restriction_flag: %TRUE specifies that the following coded video sequence bitstream restriction
 * parameters are present
 * @tiles_fixed_structure_flag: %TRUE indicates that each PPS that is active in the CVS has the same value
 *   of the syntax elements num_tile_columns_minus1, num_tile_rows_minus1, uniform_spacing_flag,
 *   column_width_minus1, row_height_minus1 and loop_filter_across_tiles_enabled_flag, when present
 * @motion_vectors_over_pic_boundaries_flag: %FALSE indicates that no sample outside the
 *  picture boundaries and no sample at a fractional sample position, %TRUE indicates that one or more
 *  samples outside picture boundaries may be used in inter prediction
 * @restricted_ref_pic_list_flag: %TRUE indicates that all P and B slices (when present) that belong to
 *  the same picture have an identical reference picture list 0, and that all B slices (when present)
 *   that belong to the same picture have an identical reference picture list 1
 * @min_spatial_segmentation_idc: when not equal to 0, establishes a bound on the maximum possible size
 *  of distinct coded spatial segmentation regions in the pictures of the CVS
 * @max_bytes_per_pic_denom: indicates a number of bytes not exceeded by the sum of the sizes of
 *  the VCL NAL units associated with any coded picture in the coded video sequence.
 * @max_bits_per_min_cu_denom: indicates an upper bound for the number of coded bits of coding_unit
 *  data for any coding block in any picture of the CVS
 * @log2_max_mv_length_horizontal: indicate the maximum absolute value of a decoded horizontal
 * motion vector component
 * @log2_max_mv_length_vertical: indicate the maximum absolute value of a decoded vertical
 *  motion vector component
 *
 * The structure representing the VUI parameters.
  }
{*
   * _GstH265VUIParams.parsed:
   *
   * %TRUE indicate that VUI parameters have been parsed.
   *
   * Since: 1.22
    }
{ if aspect_ratio_idc == 255  }
{ if overscan_info_present_flag  }
{ if timing_info_present_flag  }
{ if poc_proportional_to_timing_flag  }
{if hrd_parameters_present_flat  }
{  if bitstream_restriction_flag  }
{ calculated values  }
  PGstH265VUIParams = ^TGstH265VUIParams;
  TGstH265VUIParams = record
      parsed : Tgboolean;
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
      neutral_chroma_indication_flag : Tguint8;
      field_seq_flag : Tguint8;
      frame_field_info_present_flag : Tguint8;
      default_display_window_flag : Tguint8;
      def_disp_win_left_offset : Tguint32;
      def_disp_win_right_offset : Tguint32;
      def_disp_win_top_offset : Tguint32;
      def_disp_win_bottom_offset : Tguint32;
      timing_info_present_flag : Tguint8;
      num_units_in_tick : Tguint32;
      time_scale : Tguint32;
      poc_proportional_to_timing_flag : Tguint8;
      num_ticks_poc_diff_one_minus1 : Tguint32;
      hrd_parameters_present_flag : Tguint8;
      hrd_params : TGstH265HRDParams;
      bitstream_restriction_flag : Tguint8;
      tiles_fixed_structure_flag : Tguint8;
      motion_vectors_over_pic_boundaries_flag : Tguint8;
      restricted_ref_pic_lists_flag : Tguint8;
      min_spatial_segmentation_idc : Tguint16;
      max_bytes_per_pic_denom : Tguint8;
      max_bits_per_min_cu_denom : Tguint8;
      log2_max_mv_length_horizontal : Tguint8;
      log2_max_mv_length_vertical : Tguint8;
      par_n : Tguint;
      par_d : Tguint;
    end;

{*
 * GstH265SPSExtensionParams:
 * @transform_skip_rotation_enabled_flag: %TRUE specifies that a rotation is applied to
 *   the residual data block from intra 4X4 blocks coded using a transform skip operation.
 * @transform_skip_context_enabled_flag: %TRUE specifies tspecifies that a particular
 *   context is used for the parsing of the sig_coeff_flag for transform blocks with a skipped
 *   transform.
 * @implicit_residual_dpcm_enabled_flag: %TRUE specifies that  the residual modification process
 *   for blocks using a transform bypass may be used for intra blocks in the CVS
 * @explicit_residual_dpcm_enabled_flag: %TRUE specifies that the residual modification process
 *   for blocks using a transform bypass may be used for inter blocks in the CVS
 * @extended_precision_processing_flag: %TRUE specifies that an extended dynamic range is used
 *   for coefficient parsing and inverse transform processing
 * @intra_smoothing_disabled_flag: %TRUE specifies that  the filtering process of neighbouring
 *   samples is unconditionally disabled for intra prediction
 * @high_precision_offsets_enabled_flag: %TRUE specifies that weighted prediction offset values
 *   are signalled using a bit-depth-dependent precision.
 * @persistent_rice_adaptation_enabled_flag: %TRUE specifies that the Rice parameter derivation
 *   for the binarization of coeff_abs_level_remaining[] is initialized at the start of each
 *   sub-block using mode dependent statistics accumulated from previous sub-blocks.
 * @cabac_bypass_alignment_enabled_flag: %TRUE specifies that a context-based adaptive binary
 *   arithmetic coding (CABAC) alignment process is used prior to bypass decoding of the syntax
 *   elements coeff_sign_flag[] and coeff_abs_level_remaining[]
 *
 * Defines the GstH265SPSExtensionParams
  }
  PGstH265SPSExtensionParams = ^TGstH265SPSExtensionParams;
  TGstH265SPSExtensionParams = record
      transform_skip_rotation_enabled_flag : Tguint8;
      transform_skip_context_enabled_flag : Tguint8;
      implicit_rdpcm_enabled_flag : Tguint8;
      explicit_rdpcm_enabled_flag : Tguint8;
      extended_precision_processing_flag : Tguint8;
      intra_smoothing_disabled_flag : Tguint8;
      high_precision_offsets_enabled_flag : Tguint8;
      persistent_rice_adaptation_enabled_flag : Tguint8;
      cabac_bypass_alignment_enabled_flag : Tguint8;
    end;

{*
 * GstH265SPSSccExtensionParams:
 * @sps_curr_pic_ref_enabled_flag: equal to 1 specifies that a picture in the CVS may be
 *   included in a reference picture list of a slice of the picture itself.
 * @palette_mode_enabled_flag: equal to 1 specifies that the decoding process for palette mode
 *   may be used for intra blocks. Equal to 0 specifies that the decoding process for palette
 *   mode is not applied.
 * @palette_max_size: specifies the maximum allowed palette size.
 * @delta_palette_max_predictor_size: specifies the difference between the maximum allowed
 *   palette predictor size and the maximum allowed palette size.
 * @sps_palette_predictor_initializers_present_flag: equal to 1 specifies that the sequence
 *   palette predictors are initialized using the sps_palette_predictor_initializer specified
 *   in clause 7.3.2.2.3.
 * @sps_num_palette_predictor_initializer_minus1: plus 1 specifies the number of entries in
 *   the sequence palette predictor initializer.
 * @sps_palette_predictor_initializer: specifies the value of the comp-th component of the
 *   i-th palette entry in the SPS that is used to initialize the array PredictorPaletteEntries.
 * @motion_vector_resolution_control_idc: controls the presence and inference of the
 *   use_integer_mv_flag that specifies the resolution of motion vectors for inter prediction.
 * @intra_boundary_filtering_disabled_flag: equal to 1 specifies that the intra boundary
 *   filtering process is unconditionally disabled for intra prediction.
 * Defines the _GstH265SPSSccExtensionParams
 *
 * Since: 1.18
  }
  PGstH265SPSSccExtensionParams = ^TGstH265SPSSccExtensionParams;
  TGstH265SPSSccExtensionParams = record
      sps_curr_pic_ref_enabled_flag : Tguint8;
      palette_mode_enabled_flag : Tguint8;
      palette_max_size : Tguint8;
      delta_palette_max_predictor_size : Tguint8;
      sps_palette_predictor_initializers_present_flag : Tguint8;
      sps_num_palette_predictor_initializer_minus1 : Tguint8;
      sps_palette_predictor_initializer : array[0..2] of array[0..127] of Tguint32;
      motion_vector_resolution_control_idc : Tguint8;
      intra_boundary_filtering_disabled_flag : Tguint8;
    end;

{*
 * GstH265PPSExtensionParams:
 * @log2_max_transform_skip_block_size_minus2: plus 2 specifies the maximum transform block size for which
 *   transform_skip_flag may be present in coded pictures referring to the PPS.
 * @cross_component_prediction_enabled_flag: equal to 1 specifies that log2_res_scale_abs_plus1 and
 *   res_scale_sign_flag may be present in the transform unit syntax for pictures referring to the PPS.
 * @chroma_qp_offset_list_enabled_flag: equal to 1 specifies that the cu_chroma_qp_offset_flag may be
 *   present in the transform unit syntax.
 * @diff_cu_chroma_qp_offset_depth: specifies the difference between the luma coding tree block size and
 *   the minimum luma coding block size of coding units that convey cu_chroma_qp_offset_flag.
 * @chroma_qp_offset_list_len_minus1: plus 1 specifies the number of cb_qp_offset_list[] and
 *   cr_qp_offset_list[] syntax elements that are present in the PPS.
 * @cb_qp_offset_list: specify offsets used in the derivation of qp cb.
 * @cr_qp_offset_list: specify offsets used in the derivation of qp cr.
 * @log2_sao_offset_scale_luma: the base 2 logarithm of the scaling parameter that is used to scale sample
 *   adaptive offset (SAO) offset values for luma samples.
 * @log2_sao_offset_scale_chroma: the base 2 logarithm of the scaling parameter that is used to scale SAO
 *   offset values for chroma samples.
 *
 * Defines the GstH265SPSExtensionParams
  }
  PGstH265PPSExtensionParams = ^TGstH265PPSExtensionParams;
  TGstH265PPSExtensionParams = record
      log2_max_transform_skip_block_size_minus2 : Tguint32;
      cross_component_prediction_enabled_flag : Tguint8;
      chroma_qp_offset_list_enabled_flag : Tguint8;
      diff_cu_chroma_qp_offset_depth : Tguint8;
      chroma_qp_offset_list_len_minus1 : Tguint8;
      cb_qp_offset_list : array[0..5] of Tgint8;
      cr_qp_offset_list : array[0..5] of Tgint8;
      log2_sao_offset_scale_luma : Tguint8;
      log2_sao_offset_scale_chroma : Tguint8;
    end;

{*
 * GstH265PPSSccExtensionParams:
 * @pps_curr_pic_ref_enabled_flag: equal to 1 specifies that a picture referring to the PPS may
 *   be included in a reference picture list of a slice of the picture itself.
 * @residual_adaptive_colour_transform_enabled_flag: equal to 1 specifies that an adaptive
 *   colour transform may be applied to the residual in the decoding process.
 * @pps_slice_act_qp_offsets_present_flag: equal to 1 specifies that slice_act_y_qp_offset,
 *   slice_act_cb_qp_offset, slice_act_cr_qp_offset are present in the slice header.
 * @pps_act_y_qp_offset_plus5 @pps_act_cb_qp_offset_plus5 @pps_act_cr_qp_offset_plus3:
 *   are used to determine the offsets that are applied to the quantization parameter values
 *   qp derived in clause 8.6.2 for the luma, Cb and Cr components, respectively, when
 *   tu_residual_act_flag[ xTbY ][ yTbY ] is equal to 1.
 * @pps_palette_predictor_initializers_present_flag: equal to 1 specifies that the palette
 *   predictor initializers used for the pictures referring to the PPS are derived based on
 *   the palette predictor initializers specified by the PPS.
 * @pps_num_palette_predictor_initializer: specifies the number of entries in the picture
 *   palette predictor initializer.
 * @monochrome_palette_flag: equal to 1 specifies that the pictures that refer to this PPS
 *   are monochrome. Equal to 0 specifies that the pictures that refer to this PPS have
 *   multiple components.
 * @luma_bit_depth_entry_minus8: plus 8 specifies the bit depth of the luma component of the
 *   entries of the palette predictor initializer.
 * @chroma_bit_depth_entry_minus8: plus 8 specifies the bit depth of the chroma components of
 *   the entries of the palette predictor initializer.
 * @pps_palette_predictor_initializer: specifies the value of the comp-th component of the
 *   i-th palette entry in the PPS that is used to initialize the array PredictorPaletteEntries.
 * Defines the _GstH265PPSSccExtensionParams
 *
 * Since: 1.18
  }
  PGstH265PPSSccExtensionParams = ^TGstH265PPSSccExtensionParams;
  TGstH265PPSSccExtensionParams = record
      pps_curr_pic_ref_enabled_flag : Tguint8;
      residual_adaptive_colour_transform_enabled_flag : Tguint8;
      pps_slice_act_qp_offsets_present_flag : Tguint8;
      pps_act_y_qp_offset_plus5 : Tguint8;
      pps_act_cb_qp_offset_plus5 : Tguint8;
      pps_act_cr_qp_offset_plus3 : Tguint8;
      pps_palette_predictor_initializers_present_flag : Tguint8;
      pps_num_palette_predictor_initializer : Tguint8;
      monochrome_palette_flag : Tguint8;
      luma_bit_depth_entry_minus8 : Tguint8;
      chroma_bit_depth_entry_minus8 : Tguint32;
      pps_palette_predictor_initializer : array[0..2] of array[0..127] of Tguint32;
    end;

{*
 * GstH265ScalingList:
 * @scaling_list_dc_coef_minus8_16x16: this plus 8 specifies the DC
 *   Coefficient values for 16x16 scaling list
 * @scaling_list_dc_coef_minus8_32x32: this plus 8 specifies the DC
 *   Coefficient values for 32x32 scaling list
 * @scaling_lists_4x4: 4x4 scaling list
 * @scaling_lists_8x8: 8x8 scaling list
 * @scaling_lists_16x16: 16x16 scaling list
 * @guint8 scaling_lists_32x32: 32x32 scaling list
 *
 * Defines the GstH265ScalingList
  }
  PGstH265ScalingList = ^TGstH265ScalingList;
  TGstH265ScalingList = record
      scaling_list_dc_coef_minus8_16x16 : array[0..5] of Tgint16;
      scaling_list_dc_coef_minus8_32x32 : array[0..1] of Tgint16;
      scaling_lists_4x4 : array[0..5] of array[0..15] of Tguint8;
      scaling_lists_8x8 : array[0..5] of array[0..63] of Tguint8;
      scaling_lists_16x16 : array[0..5] of array[0..63] of Tguint8;
      scaling_lists_32x32 : array[0..1] of array[0..63] of Tguint8;
    end;

{*
 * GstH265SPS:
 * @id: The ID of the sequence parameter set
 * @profile_idc: indicate the profile to which the coded video sequence conforms
 *
 * H265 Sequence Parameter Set (SPS)
  }
{*
   * _GstH265SPS.vps_id:
   *
   * The ID of the VPS. This is used to store the ID until the VPS is
   * parsed in case its placed after the SPS.
   * Since: 1.22
    }
{ if conformance_window_flag  }
{ if scaling_list_enabled_flag  }
{ if pcm_enabled_flag  }
{ if long_term_ref_pics_present_flag  }
{ if vui_parameters_present_flag  }
{ if sps_extension_present_flag  }
{ if sps_range_extension_flag  }
{*
   * _GstH265SPS.sps_extension_params:
   *
   * Since: 1.22
    }
{ if sps_scc_extension_flag  }
{ calculated values  }
  PGstH265SPS = ^TGstH265SPS;
  TGstH265SPS = record
      id : Tguint8;
      vps_id : Tguint8;
      vps : PGstH265VPS;
      max_sub_layers_minus1 : Tguint8;
      temporal_id_nesting_flag : Tguint8;
      profile_tier_level : TGstH265ProfileTierLevel;
      chroma_format_idc : Tguint8;
      separate_colour_plane_flag : Tguint8;
      pic_width_in_luma_samples : Tguint16;
      pic_height_in_luma_samples : Tguint16;
      conformance_window_flag : Tguint8;
      conf_win_left_offset : Tguint32;
      conf_win_right_offset : Tguint32;
      conf_win_top_offset : Tguint32;
      conf_win_bottom_offset : Tguint32;
      bit_depth_luma_minus8 : Tguint8;
      bit_depth_chroma_minus8 : Tguint8;
      log2_max_pic_order_cnt_lsb_minus4 : Tguint8;
      sub_layer_ordering_info_present_flag : Tguint8;
      max_dec_pic_buffering_minus1 : array[0..(GST_H265_MAX_SUB_LAYERS)-1] of Tguint8;
      max_num_reorder_pics : array[0..(GST_H265_MAX_SUB_LAYERS)-1] of Tguint8;
      max_latency_increase_plus1 : array[0..(GST_H265_MAX_SUB_LAYERS)-1] of Tguint8;
      log2_min_luma_coding_block_size_minus3 : Tguint8;
      log2_diff_max_min_luma_coding_block_size : Tguint8;
      log2_min_transform_block_size_minus2 : Tguint8;
      log2_diff_max_min_transform_block_size : Tguint8;
      max_transform_hierarchy_depth_inter : Tguint8;
      max_transform_hierarchy_depth_intra : Tguint8;
      scaling_list_enabled_flag : Tguint8;
      scaling_list_data_present_flag : Tguint8;
      scaling_list : TGstH265ScalingList;
      amp_enabled_flag : Tguint8;
      sample_adaptive_offset_enabled_flag : Tguint8;
      pcm_enabled_flag : Tguint8;
      pcm_sample_bit_depth_luma_minus1 : Tguint8;
      pcm_sample_bit_depth_chroma_minus1 : Tguint8;
      log2_min_pcm_luma_coding_block_size_minus3 : Tguint8;
      log2_diff_max_min_pcm_luma_coding_block_size : Tguint8;
      pcm_loop_filter_disabled_flag : Tguint8;
      num_short_term_ref_pic_sets : Tguint8;
      short_term_ref_pic_set : array[0..64] of TGstH265ShortTermRefPicSet;
      long_term_ref_pics_present_flag : Tguint8;
      num_long_term_ref_pics_sps : Tguint8;
      lt_ref_pic_poc_lsb_sps : array[0..31] of Tguint16;
      used_by_curr_pic_lt_sps_flag : array[0..31] of Tguint8;
      temporal_mvp_enabled_flag : Tguint8;
      strong_intra_smoothing_enabled_flag : Tguint8;
      vui_parameters_present_flag : Tguint8;
      vui_params : TGstH265VUIParams;
      sps_extension_flag : Tguint8;
      sps_range_extension_flag : Tguint8;
      sps_multilayer_extension_flag : Tguint8;
      sps_3d_extension_flag : Tguint8;
      sps_scc_extension_flag : Tguint8;
      sps_extension_4bits : Tguint8;
      sps_extension_params : TGstH265SPSExtensionParams;
      sps_scc_extension_params : TGstH265SPSSccExtensionParams;
      chroma_array_type : Tguint8;
      width : Tgint;
      height : Tgint;
      crop_rect_width : Tgint;
      crop_rect_height : Tgint;
      crop_rect_x : Tgint;
      crop_rect_y : Tgint;
      fps_num : Tgint;
      fps_den : Tgint;
      valid : Tgboolean;
    end;

{*
 * GstH265SPSEXT:
 *
 * H265 Sequence Parameter Set extension
 *
 * Since: 1.28
  }
  PGstH265SPSEXT = ^TGstH265SPSEXT;
  TGstH265SPSEXT = record
      short_term_ref_pic_set_ext : array[0..64] of TGstH265ShortTermRefPicSetExt;
    end;

{*
 * GstH265PPS:
 *
 * H265 Picture Parameter Set
  }
{*
   * _GstH265PPS.sps_id:
   *
   * The ID of the SPS. This is used to store the ID until the SPS is
   * parsed in case its placed after the PPS.
   *
   * Since: 1.22
    }
{if cu_qp_delta_enabled_flag  }
{ if pps_extension_flag }
{ if pps_range_extension_flag }
{ if pps_scc_extension_flag }
{ calculated values  }
  PGstH265PPS = ^TGstH265PPS;
  TGstH265PPS = record
      id : Tguint;
      sps_id : Tguint;
      sps : PGstH265SPS;
      dependent_slice_segments_enabled_flag : Tguint8;
      output_flag_present_flag : Tguint8;
      num_extra_slice_header_bits : Tguint8;
      sign_data_hiding_enabled_flag : Tguint8;
      cabac_init_present_flag : Tguint8;
      num_ref_idx_l0_default_active_minus1 : Tguint8;
      num_ref_idx_l1_default_active_minus1 : Tguint8;
      init_qp_minus26 : Tgint8;
      constrained_intra_pred_flag : Tguint8;
      transform_skip_enabled_flag : Tguint8;
      cu_qp_delta_enabled_flag : Tguint8;
      diff_cu_qp_delta_depth : Tguint8;
      cb_qp_offset : Tgint8;
      cr_qp_offset : Tgint8;
      slice_chroma_qp_offsets_present_flag : Tguint8;
      weighted_pred_flag : Tguint8;
      weighted_bipred_flag : Tguint8;
      transquant_bypass_enabled_flag : Tguint8;
      tiles_enabled_flag : Tguint8;
      entropy_coding_sync_enabled_flag : Tguint8;
      num_tile_columns_minus1 : Tguint8;
      num_tile_rows_minus1 : Tguint8;
      uniform_spacing_flag : Tguint8;
      column_width_minus1 : array[0..19] of Tguint32;
      row_height_minus1 : array[0..21] of Tguint32;
      loop_filter_across_tiles_enabled_flag : Tguint8;
      loop_filter_across_slices_enabled_flag : Tguint8;
      deblocking_filter_control_present_flag : Tguint8;
      deblocking_filter_override_enabled_flag : Tguint8;
      deblocking_filter_disabled_flag : Tguint8;
      beta_offset_div2 : Tgint8;
      tc_offset_div2 : Tgint8;
      scaling_list_data_present_flag : Tguint8;
      scaling_list : TGstH265ScalingList;
      lists_modification_present_flag : Tguint8;
      log2_parallel_merge_level_minus2 : Tguint8;
      slice_segment_header_extension_present_flag : Tguint8;
      pps_extension_flag : Tguint8;
      pps_range_extension_flag : Tguint8;
      pps_multilayer_extension_flag : Tguint8;
      pps_3d_extension_flag : Tguint8;
      pps_scc_extension_flag : Tguint8;
      pps_extension_4bits : Tguint8;
      pps_extension_params : TGstH265PPSExtensionParams;
      pps_scc_extension_params : TGstH265PPSSccExtensionParams;
      PicWidthInCtbsY : Tguint32;
      PicHeightInCtbsY : Tguint32;
      valid : Tgboolean;
    end;

  PGstH265RefPicListModification = ^TGstH265RefPicListModification;
  TGstH265RefPicListModification = record
      ref_pic_list_modification_flag_l0 : Tguint8;
      list_entry_l0 : array[0..14] of Tguint32;
      ref_pic_list_modification_flag_l1 : Tguint8;
      list_entry_l1 : array[0..14] of Tguint32;
    end;

  PGstH265PredWeightTable = ^TGstH265PredWeightTable;
  TGstH265PredWeightTable = record
      luma_log2_weight_denom : Tguint8;
      delta_chroma_log2_weight_denom : Tgint8;
      luma_weight_l0_flag : array[0..14] of Tguint8;
      chroma_weight_l0_flag : array[0..14] of Tguint8;
      delta_luma_weight_l0 : array[0..14] of Tgint8;
      luma_offset_l0 : array[0..14] of Tgint8;
      delta_chroma_weight_l0 : array[0..14] of array[0..1] of Tgint8;
      delta_chroma_offset_l0 : array[0..14] of array[0..1] of Tgint16;
      luma_weight_l1_flag : array[0..14] of Tguint8;
      chroma_weight_l1_flag : array[0..14] of Tguint8;
      delta_luma_weight_l1 : array[0..14] of Tgint8;
      luma_offset_l1 : array[0..14] of Tgint8;
      delta_chroma_weight_l1 : array[0..14] of array[0..1] of Tgint8;
      delta_chroma_offset_l1 : array[0..14] of array[0..1] of Tgint16;
    end;

{*
 * GstH265SliceHdr:
 * @first_slice_segment_in_pic_flag: equal to 1 if this slice segment is
 *   the first slice segment of the picture in decoding order
 * @no_output_of_prior_pics_flag: affects the output of previously-decoded pictures
 *   in the decoded picture buffer after the decoding of an IDR or a BLA picture
 *   that is not the first picture in the bitstream as specified in Annex C
 * @pps: a #GstH265PPS
 * @dependent_slice_segment_flag: equal to 1 if the value of each slice segment header
 *   syntax element that is not present is inferred to be equal to the value of corresponding
 *   slice segment header syntax element in the slice header.
 * @segment_address: the address of the first CTB in the slice segment
 * @type: slice type (B, P, or I)
 * @pic_output_flag: affects the decoded picture output and removal processes
 *   as specified in Annex C.
 * @colour_plane_id: specifies the colour plane associated with the current slice RBSP
 *   when separate_colour_plane_flag is equal to 1
 * @pic_order_cnt_lsb: the picture order count modulo MaxPicOrderCntLsb for the current picture
 * @short_term_ref_pic_set_sps_flag: equal to 1 specifies that the short-term RPS
 *   of the current picture is derived based on the active SPS.
 * @short_term_ref_pic_sets: a #GstH265ShortTermRefPicSet structure
 * @short_term_ref_pic_set_idx: the index of st_ref_pic_set syntax structure
 *   that is used for derivation of the short-term RPS of the current picture.
 * @num_long_term_sps: the number of entries in the long-term RPS of current picture
 *   that are derived based on the syntax in active SPS.
 * @num_long_term_pics: the number of entries in the long-term RPS of the current picture
 *   that are directly signalled in the slice header.
 * @lt_idx_sps: the index of candidate long-term reference pictures
 *   specified in the active SPS.
 * @poc_lsb_lt: the value of the picture order count modulo MaxPicOrderCntLsb
 *   of the each entry in the long-term RPS of the current picture.
 * @used_by_curr_pic_lt_flag: equal to 0 if the entry in the long-term RPS
 *   of the current picture is not used for reference by the current picture.
 * @delta_poc_msb_present_flag: equal to 1 if i-th delta_poc_msb_cycle_lt[] is present.
 * @delta_poc_msb_cycle_lt: used to determine the value of the most significant bits
 *   of the picture order count value of the i-th entry in the long-term RPS of the current picture.
 * @temporal_mvp_enabled_flag: whether temporal motion vector predictors can be used for inter prediction.
 * @sao_luma_flag: equal to 1 if SAO is enabled for the luma component in the current slice.
 * @sao_chroma_flag: equal to 1 if SAO is enabled for the chroma component in the current slice.
 * @num_ref_idx_active_override_flag: equal to 1 specifies that the syntax elements
 *   num_ref_idx_l0_active_minus1 and num_ref_idx_l1_active_minus1 are present.
 * @num_ref_idx_l0_active_minus1: the maximum reference index for reference picture list 0
 *   that may be used to decode the slice.
 * @num_ref_idx_l1_active_minus1: the maximum reference index for reference picture list 1
 *   that may be used to decode the slice.
 * @ref_pic_list_modification: a #GstH265RefPicListModification
 * @mvd_l1_zero_flag: equal to 1 if the mvd_coding sytanx structure is not parsed
 * @cabac_init_flag: specifies the method for determining the initialization table
 *   used in the initialization process for context variables.
 * @collocated_from_l0_flag: equal to 1 specifies that the collocated picture
 *   used for temporal motion vector prediction is derived from reference picture list 0.
 * @collocated_ref_idx: the reference index of the collocated picture
 *   used for temporal motion vector prediction.
 * @pred_weight_table: a #GstH265PredWeightTable
 * @five_minus_max_num_merge_cand: specifies the maximum number of merging motion vector prediction (MVP)
 *   candidates supported in the slice.
 * @use_integer_mv_flag: equal to 1 specifies that the resolution of motion vectors for inter
 *   prediction in the current slice is integer. (Since: 1.18)
 * @qp_delta: specifies the inital value of QPy to be used for the coding blocks in the slice.
 * @cb_qp_offset: a difference to be added to the value of pps_cb_qp_offset.
 * @cr_qp_offset: a difference to be added to the value of pps_cr_qp_offset.
 * @slice_act_y_qp_offset: specify offsets to the quantization parameter values qP derived in
 *   clause 8.6.2 for luma components. (Since: 1.18)
 * @slice_act_cb_qp_offset: specify offsets to the quantization parameter values qP derived in
 *   clause 8.6.2 for Cb components. (Since: 1.18)
 * @slice_act_cr_qp_offset: specify offsets to the quantization parameter values qP derived in
 *   clause 8.6.2 for Cr components. (Since: 1.18)
 * @cu_chroma_qp_offset_enabled_flag: equal to 1 if the cu_chroma_qp_offset_flag
 *   may be present in the transform unit syntax. (Since: 1.18)
 * @deblocking_filter_override_flag: equal to 1 if deblocking paramertes are present in the slice header.
 * @deblocking_filter_disabled_flag: equal to 1 specifies that the operation of
 *   the deblocking filter is not applied for the current slice.
 * @beta_offset_div2: deblocking parameter offset for beta divided by 2 for the current slice.
 * @tc_offset_div2: deblocking parameter offset for tC divided by 2 for the current slice.
 * @loop_filter_across_slices_enabled_flag: equal to 1 specifies that in-loop filtering
 *   operation may be performed across the left and upper boundaries of the current slice.
 * @num_entry_point_offsets: specifies the number of entry_point_offset_minus1 syntax elements
 *   in the slice header.
 * @offset_len_minus1: specifies the length of the entry_point_minus1 syntax elements
 *   in bits.
 * @entry_point_offset_minus1: the entry point offset in bytes.
 * @NumPocTotalCurr: calculated NumPocTotalCurr which is used for
 *   decoding process for reference picture set
 * @header_size: the calculated size of the slice_header\() in bits.
 * @n_emulation_prevention_bytes: number of emulation prevention bytes (EPB)
 *   in this slice_header\()
 * @short_term_ref_pic_set_size: the calculated size of short_term_ref_pic_set\()
 *   in bits. (Since: 1.18)
 * @long_term_ref_pic_set_size: the calculated size of the branch
 *   `if( long_term_ref_pics_present_flag )` `inside slice_segment_header()` syntax
 *   in bits. (Since: 1.22)
  }
{ calculated values  }
{ Size of the slice_header() in bits  }
{ Number of emulation prevention bytes (EPB) in this slice_header()  }
{ Size of short_term_ref_pic_set() after emulation preventation bytes are
   * removed, in bits  }
{*
   * _GstH265SliceHdr.long_term_ref_pic_set_size:
   *
   * The calculated size of the branch `if( long_term_ref_pics_present_flag )`
   * inside `slice_segment_header()` syntax in bits.
   *
   * Since: 1.22
    }
{*
   * _GstH265SliceHdr.pps_id:
   *
   * PPS id
   *
   * Since: 1.28
    }
  PGstH265SliceHdr = ^TGstH265SliceHdr;
  TGstH265SliceHdr = record
      first_slice_segment_in_pic_flag : Tguint8;
      no_output_of_prior_pics_flag : Tguint8;
      pps : PGstH265PPS;
      dependent_slice_segment_flag : Tguint8;
      segment_address : Tguint32;
      _type : Tguint8;
      pic_output_flag : Tguint8;
      colour_plane_id : Tguint8;
      pic_order_cnt_lsb : Tguint16;
      short_term_ref_pic_set_sps_flag : Tguint8;
      short_term_ref_pic_sets : TGstH265ShortTermRefPicSet;
      short_term_ref_pic_set_idx : Tguint8;
      num_long_term_sps : Tguint8;
      num_long_term_pics : Tguint8;
      lt_idx_sps : array[0..15] of Tguint8;
      poc_lsb_lt : array[0..15] of Tguint32;
      used_by_curr_pic_lt_flag : array[0..15] of Tguint8;
      delta_poc_msb_present_flag : array[0..15] of Tguint8;
      delta_poc_msb_cycle_lt : array[0..15] of Tguint32;
      temporal_mvp_enabled_flag : Tguint8;
      sao_luma_flag : Tguint8;
      sao_chroma_flag : Tguint8;
      num_ref_idx_active_override_flag : Tguint8;
      num_ref_idx_l0_active_minus1 : Tguint8;
      num_ref_idx_l1_active_minus1 : Tguint8;
      ref_pic_list_modification : TGstH265RefPicListModification;
      mvd_l1_zero_flag : Tguint8;
      cabac_init_flag : Tguint8;
      collocated_from_l0_flag : Tguint8;
      collocated_ref_idx : Tguint8;
      pred_weight_table : TGstH265PredWeightTable;
      five_minus_max_num_merge_cand : Tguint8;
      use_integer_mv_flag : Tguint8;
      qp_delta : Tgint8;
      cb_qp_offset : Tgint8;
      cr_qp_offset : Tgint8;
      slice_act_y_qp_offset : Tgint8;
      slice_act_cb_qp_offset : Tgint8;
      slice_act_cr_qp_offset : Tgint8;
      cu_chroma_qp_offset_enabled_flag : Tguint8;
      deblocking_filter_override_flag : Tguint8;
      deblocking_filter_disabled_flag : Tguint8;
      beta_offset_div2 : Tgint8;
      tc_offset_div2 : Tgint8;
      loop_filter_across_slices_enabled_flag : Tguint8;
      num_entry_point_offsets : Tguint32;
      offset_len_minus1 : Tguint8;
      entry_point_offset_minus1 : Pguint32;
      NumPocTotalCurr : Tgint;
      header_size : Tguint;
      n_emulation_prevention_bytes : Tguint;
      short_term_ref_pic_set_size : Tguint;
      long_term_ref_pic_set_size : Tguint;
      pps_id : Tguint;
    end;

  PGstH265PicTiming = ^TGstH265PicTiming;
  TGstH265PicTiming = record
      pic_struct : Tguint8;
      source_scan_type : Tguint8;
      duplicate_flag : Tguint8;
      au_cpb_removal_delay_minus1 : Tguint8;
      pic_dpb_output_delay : Tguint8;
      pic_dpb_output_du_delay : Tguint8;
      num_decoding_units_minus1 : Tguint32;
      du_common_cpb_removal_delay_flag : Tguint8;
      du_common_cpb_removal_delay_increment_minus1 : Tguint8;
      num_nalus_in_du_minus1 : Pguint32;
      du_cpb_removal_delay_increment_minus1 : Pguint8;
    end;

{ seq->vui_parameters->nal_hrd_parameters_present_flag  }
{ seq->vui_parameters->vcl_hrd_parameters_present_flag  }
  PGstH265BufferingPeriod = ^TGstH265BufferingPeriod;
  TGstH265BufferingPeriod = record
      sps : PGstH265SPS;
      irap_cpb_params_present_flag : Tguint8;
      cpb_delay_offset : Tguint8;
      dpb_delay_offset : Tguint8;
      concatenation_flag : Tguint8;
      au_cpb_removal_delay_delta_minus1 : Tguint8;
      nal_initial_cpb_removal_delay : array[0..31] of Tguint8;
      nal_initial_cpb_removal_offset : array[0..31] of Tguint8;
      nal_initial_alt_cpb_removal_delay : array[0..31] of Tguint8;
      nal_initial_alt_cpb_removal_offset : array[0..31] of Tguint8;
      vcl_initial_cpb_removal_delay : array[0..31] of Tguint8;
      vcl_initial_cpb_removal_offset : array[0..31] of Tguint8;
      vcl_initial_alt_cpb_removal_delay : array[0..31] of Tguint8;
      vcl_initial_alt_cpb_removal_offset : array[0..31] of Tguint8;
    end;

  PGstH265RecoveryPoint = ^TGstH265RecoveryPoint;
  TGstH265RecoveryPoint = record
      recovery_poc_cnt : Tgint32;
      exact_match_flag : Tguint8;
      broken_link_flag : Tguint8;
    end;

{*
 * GstH265RegisteredUserData:
 * The User data registered by Rec. ITU-T T.35 SEI message.
 * @country_code: an itu_t_t35_country_code.
 * @country_code_extension: an itu_t_t35_country_code_extension_byte.
 *   Should be ignored when @country_code is not 0xff
 * @data: the data of itu_t_t35_payload_byte
 *   excluding @country_code and @country_code_extension
 * @size: the size of @data in bytes
 *
 * Since: 1.18
  }
  PGstH265RegisteredUserData = ^TGstH265RegisteredUserData;
  TGstH265RegisteredUserData = record
      country_code : Tguint8;
      country_code_extension : Tguint8;
      data : Pguint8;
      size : Tguint;
    end;

{*
 * GstH265UserDataUnregistered:
 * @uuid: an uuid_iso_iec_11578.
 * @data: the data of user_data_payload_byte
 * @size: the size of @data in bytes
 *
 * The User data unregistered SEI message syntax.
 *
 * Since: 1.24
  }
  PGstH265UserDataUnregistered = ^TGstH265UserDataUnregistered;
  TGstH265UserDataUnregistered = record
      uuid : array[0..15] of Tguint8;
      data : Pguint8;
      size : Tguint;
    end;

{*
 * GstH265TimeCode:
 * The time code SEI message provides time code information similar to that
 * defined by SMPTE ST 12-1 (2014) for field(s) or frame(s) of the current
 * picture.
 *
 * D.2.27
 *
 * Since: 1.16
  }
  PGstH265TimeCode = ^TGstH265TimeCode;
  TGstH265TimeCode = record
      num_clock_ts : Tguint8;
      clock_timestamp_flag : array[0..2] of Tguint8;
      units_field_based_flag : array[0..2] of Tguint8;
      counting_type : array[0..2] of Tguint8;
      full_timestamp_flag : array[0..2] of Tguint8;
      discontinuity_flag : array[0..2] of Tguint8;
      cnt_dropped_flag : array[0..2] of Tguint8;
      n_frames : array[0..2] of Tguint16;
      seconds_flag : array[0..2] of Tguint8;
      seconds_value : array[0..2] of Tguint8;
      minutes_flag : array[0..2] of Tguint8;
      minutes_value : array[0..2] of Tguint8;
      hours_flag : array[0..2] of Tguint8;
      hours_value : array[0..2] of Tguint8;
      time_offset_length : array[0..2] of Tguint8;
      time_offset_value : array[0..2] of Tguint32;
    end;

{*
 * GstH265MasteringDisplayColourVolume:
 * The colour volume (primaries, white point and luminance range) of display
 * defined by SMPTE ST 2086.
 *
 * D.2.28
 *
 * Since: 1.18
  }
  PGstH265MasteringDisplayColourVolume = ^TGstH265MasteringDisplayColourVolume;
  TGstH265MasteringDisplayColourVolume = record
      display_primaries_x : array[0..2] of Tguint16;
      display_primaries_y : array[0..2] of Tguint16;
      white_point_x : Tguint16;
      white_point_y : Tguint16;
      max_display_mastering_luminance : Tguint32;
      min_display_mastering_luminance : Tguint32;
    end;

{*
 * GstH265ContentLightLevel:
 * The upper bounds for the nominal target brightness light level
 * as specified in CEA-861.3
 *
 * D.2.35
 *
 * Since: 1.18
  }
  PGstH265ContentLightLevel = ^TGstH265ContentLightLevel;
  TGstH265ContentLightLevel = record
      max_content_light_level : Tguint16;
      max_pic_average_light_level : Tguint16;
    end;

{*
 * GstH265SEIMessage:
 * @payloadType: #GstH265SEIPayloadType
 * @payload: union of all possible SEI message data types
 *
 * Constains information about SEI message. The content depends on the
 * @payloadType.
  }
{*
     * GstH265SEIMessage.user_data_unregistered:
     *
     * User Data Unregistered
     *
     * Since: 1.24
      }
{ ... could implement more  }
  PGstH265SEIMessage = ^TGstH265SEIMessage;
  TGstH265SEIMessage = record
      payloadType : TGstH265SEIPayloadType;
      payload : record
          case longint of
            0 : ( buffering_period : TGstH265BufferingPeriod );
            1 : ( pic_timing : TGstH265PicTiming );
            2 : ( registered_user_data : TGstH265RegisteredUserData );
            3 : ( recovery_point : TGstH265RecoveryPoint );
            4 : ( time_code : TGstH265TimeCode );
            5 : ( mastering_display_colour_volume : TGstH265MasteringDisplayColourVolume );
            6 : ( content_light_level : TGstH265ContentLightLevel );
            7 : ( user_data_unregistered : TGstH265UserDataUnregistered );
          end;
    end;

{*
 * GstH265DecoderConfigRecordNalUnitArray:
 *
 * Contains NAL Unit array data as defined in ISO/IEC 14496-15
 *
 * Since: 1.24
  }
{*
   * GstH265DecoderConfigRecordNalUnitArray.array_completeness:
   *
   * 1: all NAL units of the given type are in this array and none
   *   are in the stream.
   * 0: additional NAL units of the indicated type may be in the stream
    }
{*
   * GstH265DecoderConfigRecordNalUnitArray.nal_unit_type:
   *
   * Indicates the type of the NAL units in the following array.
   * Shall be VPS, SPS, PPS, prefix SEI or suffix SEI
    }
{*
   * GstH265DecoderConfigRecordNalUnitArray.nalu:
   *
   * Array of identified #GstH265NalUnit
    }
  PGstH265DecoderConfigRecordNalUnitArray = ^TGstH265DecoderConfigRecordNalUnitArray;
  TGstH265DecoderConfigRecordNalUnitArray = record
      array_completeness : Tguint8;
      nal_unit_type : TGstH265NalUnitType;
      nalu : PGArray;
    end;

{*
 * GstH265DecoderConfigRecord:
 *
 * Contains HEVCDecoderConfigurationRecord data as defined in ISO/IEC 14496-15
 *
 * Since: 1.24
  }
{*
   * GstH265DecoderConfigRecord.configuration_version:
   *
   * Indicates configurationVersion, must be 1
    }
{*
   * GstH265DecoderConfigRecord.general_profile_space:
   *
   * general profile space
    }
{*
   * GstH265DecoderConfigRecord.general_tier_flag:
   *
   * general tier flag
    }
{*
   * GstH265DecoderConfigRecord.general_profile_idc:
   *
   * general profile indiction
    }
{*
   * GstH265DecoderConfigRecord.general_profile_compatibility_flags:
   *
   * general profile compatibility flags
    }
{*
   * GstH265DecoderConfigRecord.general_progressive_source_flag:
   *
   * general_progressive_source_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_interlaced_source_flag:
   *
   * general_interlaced_source_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_non_packed_constraint_flag:
   *
   * general_non_packed_constraint_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_frame_only_constraint_flag:
   *
   * general_frame_only_constraint_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_max_12bit_constraint_flag:
   *
   * general_max_12bit_constraint_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_max_10bit_constraint_flag:
   *
   * general_max_10bit_constraint_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_max_8bit_constraint_flag:
   *
   * general_max_8bit_constraint_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_max_422chroma_constraint_flag:
   *
   * general_max_422chroma_constraint_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_max_420chroma_constraint_flag:
   *
   * general_max_420chroma_constraint_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_max_monochrome_constraint_flag:
   *
   * general_max_monochrome_constraint_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_intra_constraint_flag:
   *
   * general_intra_constraint_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_one_picture_only_constraint_flag:
   *
   * general_one_picture_only_constraint_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_lower_bit_rate_constraint_flag:
   *
   * general_lower_bit_rate_constraint_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_max_14bit_constraint_flag:
   *
   * general_max_14bit_constraint_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_inbld_flag:
   *
   * general_inbld_flag parsed from
   * HEVCDecoderConfigurationRecord.general_constraint_indicator_flags
    }
{*
   * GstH265DecoderConfigRecord.general_level_idc:
   *
   * general level indication
    }
{*
   * GstH265DecoderConfigRecord.min_spatial_segmentation_idc:
   *
   * min spatial segmentation indication
    }
{*
   * GstH265DecoderConfigRecord.parallelism_type:
   *
   * parallelism type
    }
{*
   * GstH265DecoderConfigRecord.chroma_format_idc:
   *
   * chroma format indication
    }
{*
   * GstH265DecoderConfigRecord.bit_depth_luma_minus8:
   *
   * bit depth luma minus 8
    }
{*
   * GstH265DecoderConfigRecord.bit_depth_chroma_minus8:
   *
   * bit depth chroma minus 8
    }
{*
   * GstH265DecoderConfigRecord.avg_frame_rate:
   *
   * average frame rate in units of frames per 256 seconds,
   * or 0 when unspecified
    }
{*
   * GstH265DecoderConfigRecord.constant_frame_rate:
   *
   * constant frame rate.
   * 1: stream to which this configuration record applies is constante frame rate
   * 2: representation of each temporal layer in the stream is constant frame rate
   * 0: unspecified
    }
{*
   * GstH265DecoderConfigRecord.num_temporal_layers:
   *
   * 0: unknown whether the stream is temporally scalable
   * otherwise: the number of temporal layers
    }
{*
   * GstH265DecoderConfigRecord.temporal_id_nested:
   *
   * 1: all SPSs that activated when the stream to this configuration record
   *   applies is decoded have sps_temporal_id_nesting_flags equal to 1
   *   and temporal sub-layer up-switching to any higher temporal layer can
   *   be performed at any semple
   * 0: unknown
    }
{*
   * GstH265DecoderConfigRecord.length_size_minus_one:
   *
   * indicates the length in bytes of nal unit length field.
   * This value shall be one of 0, 1, or 3 corresponding to a length
   * encoded with 1, 2, or 4 bytes, respectively
    }
{*
   * GstH265DecoderConfigRecord.nalu_array:
   *
   * Array of #GstH265DecoderConfigRecordNalUnitArray
    }
{< private > }
  PGstH265DecoderConfigRecord = ^TGstH265DecoderConfigRecord;
  TGstH265DecoderConfigRecord = record
      configuration_version : Tguint8;
      general_profile_space : Tguint8;
      general_tier_flag : Tguint8;
      general_profile_idc : Tguint8;
      general_profile_compatibility_flags : array[0..31] of Tguint8;
      general_progressive_source_flag : Tguint8;
      general_interlaced_source_flag : Tguint8;
      general_non_packed_constraint_flag : Tguint8;
      general_frame_only_constraint_flag : Tguint8;
      general_max_12bit_constraint_flag : Tguint8;
      general_max_10bit_constraint_flag : Tguint8;
      general_max_8bit_constraint_flag : Tguint8;
      general_max_422chroma_constraint_flag : Tguint8;
      general_max_420chroma_constraint_flag : Tguint8;
      general_max_monochrome_constraint_flag : Tguint8;
      general_intra_constraint_flag : Tguint8;
      general_one_picture_only_constraint_flag : Tguint8;
      general_lower_bit_rate_constraint_flag : Tguint8;
      general_max_14bit_constraint_flag : Tguint8;
      general_inbld_flag : Tguint8;
      general_level_idc : Tguint8;
      min_spatial_segmentation_idc : Tguint16;
      parallelism_type : Tguint8;
      chroma_format_idc : Tguint8;
      bit_depth_luma_minus8 : Tguint8;
      bit_depth_chroma_minus8 : Tguint8;
      avg_frame_rate : Tguint16;
      constant_frame_rate : Tguint8;
      num_temporal_layers : Tguint8;
      temporal_id_nested : Tguint8;
      length_size_minus_one : Tguint8;
      nalu_array : PGArray;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstH265Parser:
 *
 * H265 NAL Parser (opaque structure).
  }
{< private > }
  PGstH265Parser = ^TGstH265Parser;
  TGstH265Parser = record
      vps : array[0..(GST_H265_MAX_VPS_COUNT)-1] of TGstH265VPS;
      sps : array[0..(GST_H265_MAX_SPS_COUNT)-1] of TGstH265SPS;
      pps : array[0..(GST_H265_MAX_PPS_COUNT)-1] of TGstH265PPS;
      last_vps : PGstH265VPS;
      last_sps : PGstH265SPS;
      last_pps : PGstH265PPS;
    end;


function gst_h265_parser_new:PGstH265Parser;cdecl;external libgstcodecparsers;
function gst_h265_parser_identify_nalu(parser:PGstH265Parser; data:Pguint8; offset:Tguint; size:Tgsize; nalu:PGstH265NalUnit):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_identify_nalu_unchecked(parser:PGstH265Parser; data:Pguint8; offset:Tguint; size:Tgsize; nalu:PGstH265NalUnit):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_identify_nalu_hevc(parser:PGstH265Parser; data:Pguint8; offset:Tguint; size:Tgsize; nal_length_size:Tguint8; 
           nalu:PGstH265NalUnit):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_identify_and_split_nalu_hevc(parser:PGstH265Parser; data:Pguint8; offset:Tguint; size:Tgsize; nal_length_size:Tguint8; 
           nalus:PGArray; consumed:Pgsize):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_parse_nal(parser:PGstH265Parser; nalu:PGstH265NalUnit):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_parse_slice_hdr(parser:PGstH265Parser; nalu:PGstH265NalUnit; slice:PGstH265SliceHdr):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_parse_slice_hdr_ext(parser:PGstH265Parser; nalu:PGstH265NalUnit; slice:PGstH265SliceHdr; sps_ext:PGstH265SPSEXT):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_parse_vps(parser:PGstH265Parser; nalu:PGstH265NalUnit; vps:PGstH265VPS):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_parse_sps(parser:PGstH265Parser; nalu:PGstH265NalUnit; sps:PGstH265SPS; parse_vui_params:Tgboolean):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_parse_sps_ext(parser:PGstH265Parser; nalu:PGstH265NalUnit; sps:PGstH265SPS; sps_ext:PGstH265SPSEXT; parse_vui_params:Tgboolean):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_parse_pps(parser:PGstH265Parser; nalu:PGstH265NalUnit; pps:PGstH265PPS):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_parse_sei(parser:PGstH265Parser; nalu:PGstH265NalUnit; messages:PPGArray):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_update_vps(parser:PGstH265Parser; vps:PGstH265VPS):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_update_sps(parser:PGstH265Parser; sps:PGstH265SPS):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_update_pps(parser:PGstH265Parser; pps:PGstH265PPS):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parser_link_slice_hdr(parser:PGstH265Parser; slice:PGstH265SliceHdr):TGstH265ParserResult;cdecl;external libgstcodecparsers;
procedure gst_h265_parser_free(parser:PGstH265Parser);cdecl;external libgstcodecparsers;
function gst_h265_parse_vps(nalu:PGstH265NalUnit; vps:PGstH265VPS):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parse_sps(parser:PGstH265Parser; nalu:PGstH265NalUnit; sps:PGstH265SPS; parse_vui_params:Tgboolean):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parse_sps_ext(parser:PGstH265Parser; nalu:PGstH265NalUnit; sps:PGstH265SPS; sps_ext:PGstH265SPSEXT; parse_vui_params:Tgboolean):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_parse_pps(parser:PGstH265Parser; nalu:PGstH265NalUnit; pps:PGstH265PPS):TGstH265ParserResult;cdecl;external libgstcodecparsers;
function gst_h265_slice_hdr_copy(dst_slice:PGstH265SliceHdr; src_slice:PGstH265SliceHdr):Tgboolean;cdecl;external libgstcodecparsers;
procedure gst_h265_slice_hdr_free(slice_hdr:PGstH265SliceHdr);cdecl;external libgstcodecparsers;
function gst_h265_sei_copy(dest_sei:PGstH265SEIMessage; src_sei:PGstH265SEIMessage):Tgboolean;cdecl;external libgstcodecparsers;
procedure gst_h265_sei_free(sei:PGstH265SEIMessage);cdecl;external libgstcodecparsers;
procedure gst_h265_quant_matrix_4x4_get_zigzag_from_raster(out_quant:array[0..15] of Tguint8; quant:array[0..15] of Tguint8);cdecl;external libgstcodecparsers;
procedure gst_h265_quant_matrix_4x4_get_raster_from_zigzag(out_quant:array[0..15] of Tguint8; quant:array[0..15] of Tguint8);cdecl;external libgstcodecparsers;
procedure gst_h265_quant_matrix_8x8_get_zigzag_from_raster(out_quant:array[0..63] of Tguint8; quant:array[0..63] of Tguint8);cdecl;external libgstcodecparsers;
procedure gst_h265_quant_matrix_8x8_get_raster_from_zigzag(out_quant:array[0..63] of Tguint8; quant:array[0..63] of Tguint8);cdecl;external libgstcodecparsers;
const
  gst_h265_quant_matrix_16x16_get_zigzag_from_raster = gst_h265_quant_matrix_8x8_get_zigzag_from_raster;  
  gst_h265_quant_matrix_16x16_get_raster_from_zigzag = gst_h265_quant_matrix_8x8_get_raster_from_zigzag;  
  gst_h265_quant_matrix_32x32_get_zigzag_from_raster = gst_h265_quant_matrix_8x8_get_zigzag_from_raster;  
  gst_h265_quant_matrix_32x32_get_raster_from_zigzag = gst_h265_quant_matrix_8x8_get_raster_from_zigzag;  

procedure gst_h265_quant_matrix_4x4_get_uprightdiagonal_from_raster(out_quant:array[0..15] of Tguint8; quant:array[0..15] of Tguint8);cdecl;external libgstcodecparsers;
procedure gst_h265_quant_matrix_4x4_get_raster_from_uprightdiagonal(out_quant:array[0..15] of Tguint8; quant:array[0..15] of Tguint8);cdecl;external libgstcodecparsers;
procedure gst_h265_quant_matrix_8x8_get_uprightdiagonal_from_raster(out_quant:array[0..63] of Tguint8; quant:array[0..63] of Tguint8);cdecl;external libgstcodecparsers;
procedure gst_h265_quant_matrix_8x8_get_raster_from_uprightdiagonal(out_quant:array[0..63] of Tguint8; quant:array[0..63] of Tguint8);cdecl;external libgstcodecparsers;
const
  gst_h265_quant_matrix_16x16_get_uprightdiagonal_from_raster = gst_h265_quant_matrix_8x8_get_uprightdiagonal_from_raster;  
  gst_h265_quant_matrix_16x16_get_raster_from_uprightdiagonal = gst_h265_quant_matrix_8x8_get_raster_from_uprightdiagonal;  
  gst_h265_quant_matrix_32x32_get_uprightdiagonal_from_raster = gst_h265_quant_matrix_8x8_get_uprightdiagonal_from_raster;  
  gst_h265_quant_matrix_32x32_get_raster_from_uprightdiagonal = gst_h265_quant_matrix_8x8_get_raster_from_uprightdiagonal;  

function gst_h265_profile_tier_level_get_profile(ptl:PGstH265ProfileTierLevel):TGstH265Profile;cdecl;external libgstcodecparsers;
function gst_h265_profile_to_string(profile:TGstH265Profile):Pgchar;cdecl;external libgstcodecparsers;
function gst_h265_profile_from_string(_string:Pgchar):TGstH265Profile;cdecl;external libgstcodecparsers;
function gst_h265_slice_type_to_string(slice_type:TGstH265SliceType):Pgchar;cdecl;external libgstcodecparsers;
function gst_h265_create_sei_memory(layer_id:Tguint8; temporal_id_plus1:Tguint8; start_code_prefix_length:Tguint8; messages:PGArray):PGstMemory;cdecl;external libgstcodecparsers;
function gst_h265_create_sei_memory_hevc(layer_id:Tguint8; temporal_id_plus1:Tguint8; nal_length_size:Tguint8; messages:PGArray):PGstMemory;cdecl;external libgstcodecparsers;
function gst_h265_parser_insert_sei(parser:PGstH265Parser; au:PGstBuffer; sei:PGstMemory):PGstBuffer;cdecl;external libgstcodecparsers;
function gst_h265_parser_insert_sei_hevc(parser:PGstH265Parser; nal_length_size:Tguint8; au:PGstBuffer; sei:PGstMemory):PGstBuffer;cdecl;external libgstcodecparsers;
function gst_h265_get_profile_from_sps(sps:PGstH265SPS):TGstH265Profile;cdecl;external libgstcodecparsers;
procedure gst_h265_decoder_config_record_free(config:PGstH265DecoderConfigRecord);cdecl;external libgstcodecparsers;
function gst_h265_parser_parse_decoder_config_record(parser:PGstH265Parser; data:Pguint8; size:Tgsize; config:PPGstH265DecoderConfigRecord):TGstH265ParserResult;cdecl;external libgstcodecparsers;
{$endif}

// === Konventiert am: 21-7-26 17:02:08 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H265_IS_B_SLICE(slice : longint) : longint;
begin
  GST_H265_IS_B_SLICE:=(slice^._type)=GST_H265_B_SLICE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H265_IS_P_SLICE(slice : longint) : longint;
begin
  GST_H265_IS_P_SLICE:=(slice^._type)=GST_H265_P_SLICE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H265_IS_I_SLICE(slice : longint) : longint;
begin
  GST_H265_IS_I_SLICE:=(slice^._type)=GST_H265_I_SLICE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H265_IS_NAL_TYPE_IRAP(nal_type : longint) : longint;
begin
  GST_H265_IS_NAL_TYPE_IRAP:=(nal_type>=(GST_H265_NAL_SLICE_BLA_W_LP and (@(nal_type))))<=GST_H265_RESERVED_IRAP_NAL_TYPE_MAX;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H265_IS_NAL_TYPE_BLA(nal_type : longint) : longint;
begin
  GST_H265_IS_NAL_TYPE_BLA:=(nal_type>=(GST_H265_NAL_SLICE_BLA_W_LP and (@(nal_type))))<=GST_H265_NAL_SLICE_BLA_N_LP;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_H265_IS_NAL_TYPE_CRA(nal_type : longint) : longint;
begin
  GST_H265_IS_NAL_TYPE_CRA:=nal_type=GST_H265_NAL_SLICE_CRA_NUT;
end;


end.
