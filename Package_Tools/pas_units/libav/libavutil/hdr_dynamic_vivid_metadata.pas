unit hdr_dynamic_vivid_metadata;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2021 Limin Wang <lance.lmwang at gmail.com>
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{$ifndef AVUTIL_HDR_DYNAMIC_VIVID_METADATA_H}
{$define AVUTIL_HDR_DYNAMIC_VIVID_METADATA_H}
{$include "frame.h"}
{$include "rational.h"}
{*
 * HDR Vivid three spline params.
  }
{*
     * The mode of three Spline. the value shall be in the range
     * of 0 to 3, inclusive.
      }
{*
     * three_Spline_TH_enable_MB is in the range of 0.0 to 1.0, inclusive
     * and in multiples of 1.0/255.
     *
      }
{*
     * 3Spline_TH_enable of three Spline.
     * The value shall be in the range of 0.0 to 1.0, inclusive.
     * and in multiples of 1.0/4095.
      }
{*
     * 3Spline_TH_Delta1 of three Spline.
     * The value shall be in the range of 0.0 to 0.25, inclusive,
     * and in multiples of 0.25/1023.
      }
{*
     * 3Spline_TH_Delta2 of three Spline.
     * The value shall be in the range of 0.0 to 0.25, inclusive,
     * and in multiples of 0.25/1023.
      }
{*
     * 3Spline_enable_Strength of three Spline.
     * The value shall be in the range of 0.0 to 1.0, inclusive,
     * and in multiples of 1.0/255.
      }
type
  PAVHDRVivid3SplineParams = ^TAVHDRVivid3SplineParams;
  TAVHDRVivid3SplineParams = record
      th_mode : longint;
      th_enable_mb : TAVRational;
      th_enable : TAVRational;
      th_delta1 : TAVRational;
      th_delta2 : TAVRational;
      enable_strength : TAVRational;
    end;
{*
 * Color tone mapping parameters at a processing window in a dynamic metadata for
 * CUVA 005.1:2021.
  }

  PAVHDRVividColorToneMappingParams = ^TAVHDRVividColorToneMappingParams;
  TAVHDRVividColorToneMappingParams = record
      xxxxxxx : Tcccc;
    end;
{*
 * Color transform parameters at a processing window in a dynamic metadata for
 * CUVA 005.1:2021.
  }
{*
     * Indicates the minimum brightness of the displayed content.
     * The values should be in the range of 0.0 to 1.0,
     * inclusive and in multiples of 1/4095.
      }
{*
     * Indicates the average brightness of the displayed content.
     * The values should be in the range of 0.0 to 1.0,
     * inclusive and in multiples of 1/4095.
      }
{*
     * Indicates the variance brightness of the displayed content.
     * The values should be in the range of 0.0 to 1.0,
     * inclusive and in multiples of 1/4095.
      }
{*
     * Indicates the maximum brightness of the displayed content.
     * The values should be in the range of 0.0 to 1.0, inclusive
     * and in multiples of 1/4095.
      }
{*
     * This flag indicates that the metadata for the tone mapping function in
     * the processing window is present (for value of 1).
      }
{*
     * The number of tone mapping param. The value shall be in the range
     * of 1 to 2, inclusive.
      }
{*
     * The color tone mapping parameters.
      }
{*
     * This flag indicates that the metadata for the color saturation mapping in
     * the processing window is present (for value of 1).
      }
{*
     * The number of color saturation param. The value shall be in the range
     * of 0 to 7, inclusive.
      }
{*
     * Indicates the color correction strength parameter.
     * The values should be in the range of 0.0 to 2.0, inclusive
     * and in multiples of 1/128.
      }

  PAVHDRVividColorTransformParams = ^TAVHDRVividColorTransformParams;
  TAVHDRVividColorTransformParams = record
      minimum_maxrgb : TAVRational;
      average_maxrgb : TAVRational;
      variance_maxrgb : TAVRational;
      maximum_maxrgb : TAVRational;
      tone_mapping_mode_flag : longint;
      tone_mapping_param_num : longint;
      tm_params : array[0..1] of TAVHDRVividColorToneMappingParams;
      color_saturation_mapping_flag : longint;
      color_saturation_num : longint;
      color_saturation_gain : array[0..7] of TAVRational;
    end;
{*
 * This struct represents dynamic metadata for color volume transform -
 * CUVA 005.1:2021 standard
 *
 * To be used as payload of a AVFrameSideData or AVPacketSideData with the
 * appropriate type.
 *
 * @note The struct should be allocated with
 * av_dynamic_hdr_vivid_alloc() and its size is not a part of
 * the public ABI.
  }
{*
     * The system start code. The value shall be set to 0x01.
      }
{*
     * The number of processing windows. The value shall be set to 0x01
     * if the system_start_code is 0x01.
      }
{*
     * The color transform parameters for every processing window.
      }

  PAVDynamicHDRVivid = ^TAVDynamicHDRVivid;
  TAVDynamicHDRVivid = record
      system_start_code : Tuint8_t;
      num_windows : Tuint8_t;
      params : array[0..2] of TAVHDRVividColorTransformParams;
    end;
{*
 * Allocate an AVDynamicHDRVivid structure and set its fields to
 * default values. The resulting struct can be freed using av_freep().
 *
 * @return An AVDynamicHDRVivid filled with default values or NULL
 *         on failure.
  }

function av_dynamic_hdr_vivid_alloc(size:Psize_t):PAVDynamicHDRVivid;cdecl;external libavutil;
{*
 * Allocate a complete AVDynamicHDRVivid and add it to the frame.
 * @param frame The frame which side data is added to.
 *
 * @return The AVDynamicHDRVivid structure to be filled by caller or NULL
 *         on failure.
  }
function av_dynamic_hdr_vivid_create_side_data(frame:PAVFrame):PAVDynamicHDRVivid;cdecl;external libavutil;
{$endif}
{ AVUTIL_HDR_DYNAMIC_VIVID_METADATA_H  }

// === Konventiert am: 14-12-25 17:15:23 ===


implementation



end.
