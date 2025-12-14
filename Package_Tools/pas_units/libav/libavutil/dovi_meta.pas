unit dovi_meta;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2020 Vacing Fang <vacingfang@tencent.com>
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
{*
 * @file
 * DOVI configuration
  }
{$ifndef AVUTIL_DOVI_META_H}
{$define AVUTIL_DOVI_META_H}
{$include <stdint.h>}
{$include <stddef.h>}
{$include "rational.h"}
{
 * DOVI configuration
 * ref: dolby-vision-bitstreams-within-the-iso-base-media-file-format-v2.1.2
        dolby-vision-bitstreams-in-mpeg-2-transport-stream-multiplex-v1.2
 * @code
 * uint8_t  dv_version_major, the major version number that the stream complies with
 * uint8_t  dv_version_minor, the minor version number that the stream complies with
 * uint8_t  dv_profile, the Dolby Vision profile
 * uint8_t  dv_level, the Dolby Vision level
 * uint8_t  rpu_present_flag
 * uint8_t  el_present_flag
 * uint8_t  bl_present_flag
 * uint8_t  dv_bl_signal_compatibility_id
 * @endcode
 *
 * @note The struct must be allocated with av_dovi_alloc() and
 *       its size is not a part of the public ABI.
  }
type
  PAVDOVIDecoderConfigurationRecord = ^TAVDOVIDecoderConfigurationRecord;
  TAVDOVIDecoderConfigurationRecord = record
      dv_version_major : Tuint8_t;
      dv_version_minor : Tuint8_t;
      dv_profile : Tuint8_t;
      dv_level : Tuint8_t;
      rpu_present_flag : Tuint8_t;
      el_present_flag : Tuint8_t;
      bl_present_flag : Tuint8_t;
      dv_bl_signal_compatibility_id : Tuint8_t;
    end;
{*
 * Allocate a AVDOVIDecoderConfigurationRecord structure and initialize its
 * fields to default values.
 *
 * @return the newly allocated struct or NULL on failure
  }

function av_dovi_alloc(size:Psize_t):PAVDOVIDecoderConfigurationRecord;cdecl;external libavutil;
{*
 * Dolby Vision RPU data header.
 *
 * @note sizeof(AVDOVIRpuDataHeader) is not part of the public ABI.
  }
{ informative, lavc always converts to fixed  }
{ [8, 16]  }
{ [8, 16]  }
{ [8, 16]  }
type
  PAVDOVIRpuDataHeader = ^TAVDOVIRpuDataHeader;
  TAVDOVIRpuDataHeader = record
      rpu_type : Tuint8_t;
      rpu_format : Tuint16_t;
      vdr_rpu_profile : Tuint8_t;
      vdr_rpu_level : Tuint8_t;
      chroma_resampling_explicit_filter_flag : Tuint8_t;
      coef_data_type : Tuint8_t;
      coef_log2_denom : Tuint8_t;
      vdr_rpu_normalized_idc : Tuint8_t;
      bl_video_full_range_flag : Tuint8_t;
      bl_bit_depth : Tuint8_t;
      el_bit_depth : Tuint8_t;
      vdr_bit_depth : Tuint8_t;
      spatial_resampling_filter_flag : Tuint8_t;
      el_spatial_resampling_filter_flag : Tuint8_t;
      disable_residual_flag : Tuint8_t;
    end;
  TAVDOVIMappingMethod =  Longint;
  Const
    AV_DOVI_MAPPING_POLYNOMIAL = 0;
    AV_DOVI_MAPPING_MMR = 1;

{*
 * Coefficients of a piece-wise function. The pieces of the function span the
 * value ranges between two adjacent pivot values.
  }
  AV_DOVI_MAX_PIECES = 8;  
{ [2, 9]  }
{ sorted ascending  }
{ AV_DOVI_MAPPING_POLYNOMIAL  }
{ [1, 2]  }
{ x^0, x^1, x^2  }
{ AV_DOVI_MAPPING_MMR  }
{ [1, 3]  }
{ order - 1  }type
  PAVDOVIReshapingCurve = ^TAVDOVIReshapingCurve;
  TAVDOVIReshapingCurve = record
      num_pivots : Tuint8_t;
      pivots : array[0..(AV_DOVI_MAX_PIECES+1)-1] of Tuint16_t;
      mapping_idc : array[0..(AV_DOVI_MAX_PIECES)-1] of TAVDOVIMappingMethod;
      poly_order : array[0..(AV_DOVI_MAX_PIECES)-1] of Tuint8_t;
      poly_coef : array[0..(AV_DOVI_MAX_PIECES)-1] of array[0..2] of Tint64_t;
      mmr_order : array[0..(AV_DOVI_MAX_PIECES)-1] of Tuint8_t;
      mmr_constant : array[0..(AV_DOVI_MAX_PIECES)-1] of Tint64_t;
      mmr_coef : array[0..(AV_DOVI_MAX_PIECES)-1] of array[0..2] of array[0..6] of Tint64_t;
    end;
  TAVDOVINLQMethod =  Longint;
  Const
    AV_DOVI_NLQ_NONE = -(1);
    AV_DOVI_NLQ_LINEAR_DZ = 0;

{*
 * Coefficients of the non-linear inverse quantization. For the interpretation
 * of these, see ETSI GS CCM 001.
  }
{ AV_DOVI_NLQ_LINEAR_DZ  }
type
  PAVDOVINLQParams = ^TAVDOVINLQParams;
  TAVDOVINLQParams = record
      nlq_offset : Tuint16_t;
      vdr_in_max : Tuint64_t;
      linear_deadzone_slope : Tuint64_t;
      linear_deadzone_threshold : Tuint64_t;
    end;
{*
 * Dolby Vision RPU data mapping parameters.
 *
 * @note sizeof(AVDOVIDataMapping) is not part of the public ABI.
  }
{ per component  }
{ Non-linear inverse quantization  }
{ per component  }

  PAVDOVIDataMapping = ^TAVDOVIDataMapping;
  TAVDOVIDataMapping = record
      vdr_rpu_id : Tuint8_t;
      mapping_color_space : Tuint8_t;
      mapping_chroma_format_idc : Tuint8_t;
      curves : array[0..2] of TAVDOVIReshapingCurve;
      nlq_method_idc : TAVDOVINLQMethod;
      num_x_partitions : Tuint32_t;
      num_y_partitions : Tuint32_t;
      nlq : array[0..2] of TAVDOVINLQParams;
    end;
{*
 * Dolby Vision RPU colorspace metadata parameters.
 *
 * @note sizeof(AVDOVIColorMetadata) is not part of the public ABI.
  }
{*
     * Coefficients of the custom Dolby Vision IPT-PQ matrices. These are to be
     * used instead of the matrices indicated by the frame's colorspace tags.
     * The output of rgb_to_lms_matrix is to be fed into a BT.2020 LMS->RGB
     * matrix based on a Hunt-Pointer-Estevez transform, but without any
     * crosstalk. (See the definition of the ICtCp colorspace for more
     * information.)
      }
{ before PQ linearization  }
{ input offset of neutral value  }
{ after PQ linearization  }
{*
     * Extra signal metadata (see Dolby patents for more info).
      }
{ [0, 3]  }

  PAVDOVIColorMetadata = ^TAVDOVIColorMetadata;
  TAVDOVIColorMetadata = record
      dm_metadata_id : Tuint8_t;
      scene_refresh_flag : Tuint8_t;
      ycc_to_rgb_matrix : array[0..8] of TAVRational;
      ycc_to_rgb_offset : array[0..2] of TAVRational;
      rgb_to_lms_matrix : array[0..8] of TAVRational;
      signal_eotf : Tuint16_t;
      signal_eotf_param0 : Tuint16_t;
      signal_eotf_param1 : Tuint16_t;
      signal_eotf_param2 : Tuint32_t;
      signal_bit_depth : Tuint8_t;
      signal_color_space : Tuint8_t;
      signal_chroma_format : Tuint8_t;
      signal_full_range_flag : Tuint8_t;
      source_min_pq : Tuint16_t;
      source_max_pq : Tuint16_t;
      source_diagonal : Tuint16_t;
    end;
{*
 * Combined struct representing a combination of header, mapping and color
 * metadata, for attaching to frames as side data.
 *
 * @note The struct must be allocated with av_dovi_metadata_alloc() and
 *       its size is not a part of the public ABI.
  }
{*
     * Offset in bytes from the beginning of this structure at which the
     * respective structs start.
      }
{ AVDOVIRpuDataHeader  }
{ AVDOVIDataMapping  }
{ AVDOVIColorMetadata  }

  PAVDOVIMetadata = ^TAVDOVIMetadata;
  TAVDOVIMetadata = record
      header_offset : Tsize_t;
      mapping_offset : Tsize_t;
      color_offset : Tsize_t;
    end;
{*
 * Allocate an AVDOVIMetadata structure and initialize its
 * fields to default values.
 *
 * @param size If this parameter is non-NULL, the size in bytes of the
 *             allocated struct will be written here on success
 *
 * @return the newly allocated struct or NULL on failure
  }

function av_dovi_metadata_alloc(size:Psize_t):PAVDOVIMetadata;cdecl;external libavutil;
{$endif}
{ AVUTIL_DOVI_META_H  }

// === Konventiert am: 14-12-25 17:00:35 ===


implementation



end.
