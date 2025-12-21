/*
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
 */

#ifndef AVUTIL_HDR_DYNAMIC_VIVID_METADATA_H
#define AVUTIL_HDR_DYNAMIC_VIVID_METADATA_H

#include "frame.h"
#include "rational.h"

/**
 * HDR Vivid three spline params.
 */
typedef struct AVHDRVivid3SplineParams {
    /**
     * The mode of three Spline. the value shall be in the range
     * of 0 to 3, inclusive.
     */
    int th_mode;

    /**
     * three_Spline_TH_enable_MB is in the range of 0.0 to 1.0, inclusive
     * and in multiples of 1.0/255.
     *
     */
    AVRational th_enable_mb;

    /**
     * 3Spline_TH_enable of three Spline.
     * The value shall be in the range of 0.0 to 1.0, inclusive.
     * and in multiples of 1.0/4095.
     */
    AVRational th_enable;

    /**
     * 3Spline_TH_Delta1 of three Spline.
     * The value shall be in the range of 0.0 to 0.25, inclusive,
     * and in multiples of 0.25/1023.
     */
    AVRational th_delta1;

    /**
     * 3Spline_TH_Delta2 of three Spline.
     * The value shall be in the range of 0.0 to 0.25, inclusive,
     * and in multiples of 0.25/1023.
     */
    AVRational th_delta2;

    /**
     * 3Spline_enable_Strength of three Spline.
     * The value shall be in the range of 0.0 to 1.0, inclusive,
     * and in multiples of 1.0/255.
     */
    AVRational enable_strength;
} AVHDRVivid3SplineParams;

/**
 * Color tone mapping parameters at a processing window in a dynamic metadata for
 * CUVA 005.1:2021.
 */
typedef struct AVHDRVividColorToneMappingParams {
  cccc xxxxxxx;
} AVHDRVividColorToneMappingParams;


/**
 * Color transform parameters at a processing window in a dynamic metadata for
 * CUVA 005.1:2021.
 */
typedef struct AVHDRVividColorTransformParams {
    /**
     * Indicates the minimum brightness of the displayed content.
     * The values should be in the range of 0.0 to 1.0,
     * inclusive and in multiples of 1/4095.
     */
    AVRational minimum_maxrgb;

    /**
     * Indicates the average brightness of the displayed content.
     * The values should be in the range of 0.0 to 1.0,
     * inclusive and in multiples of 1/4095.
     */
    AVRational average_maxrgb;

    /**
     * Indicates the variance brightness of the displayed content.
     * The values should be in the range of 0.0 to 1.0,
     * inclusive and in multiples of 1/4095.
     */
    AVRational variance_maxrgb;

    /**
     * Indicates the maximum brightness of the displayed content.
     * The values should be in the range of 0.0 to 1.0, inclusive
     * and in multiples of 1/4095.
     */
    AVRational maximum_maxrgb;

    /**
     * This flag indicates that the metadata for the tone mapping function in
     * the processing window is present (for value of 1).
     */
    int tone_mapping_mode_flag;

    /**
     * The number of tone mapping param. The value shall be in the range
     * of 1 to 2, inclusive.
     */
    int tone_mapping_param_num;

    /**
     * The color tone mapping parameters.
     */
    AVHDRVividColorToneMappingParams tm_params[2];

    /**
     * This flag indicates that the metadata for the color saturation mapping in
     * the processing window is present (for value of 1).
     */
    int color_saturation_mapping_flag;

    /**
     * The number of color saturation param. The value shall be in the range
     * of 0 to 7, inclusive.
     */
    int color_saturation_num;

    /**
     * Indicates the color correction strength parameter.
     * The values should be in the range of 0.0 to 2.0, inclusive
     * and in multiples of 1/128.
     */
    AVRational color_saturation_gain[8];
} AVHDRVividColorTransformParams;

/**
 * This struct represents dynamic metadata for color volume transform -
 * CUVA 005.1:2021 standard
 *
 * To be used as payload of a AVFrameSideData or AVPacketSideData with the
 * appropriate type.
 *
 * @note The struct should be allocated with
 * av_dynamic_hdr_vivid_alloc() and its size is not a part of
 * the public ABI.
 */
typedef struct AVDynamicHDRVivid {
    /**
     * The system start code. The value shall be set to 0x01.
     */
    uint8_t system_start_code;

    /**
     * The number of processing windows. The value shall be set to 0x01
     * if the system_start_code is 0x01.
     */
    uint8_t num_windows;

    /**
     * The color transform parameters for every processing window.
     */
    AVHDRVividColorTransformParams params[3];
} AVDynamicHDRVivid;

/**
 * Allocate an AVDynamicHDRVivid structure and set its fields to
 * default values. The resulting struct can be freed using av_freep().
 *
 * @return An AVDynamicHDRVivid filled with default values or NULL
 *         on failure.
 */
AVDynamicHDRVivid *av_dynamic_hdr_vivid_alloc(size_t *size);

/**
 * Allocate a complete AVDynamicHDRVivid and add it to the frame.
 * @param frame The frame which side data is added to.
 *
 * @return The AVDynamicHDRVivid structure to be filled by caller or NULL
 *         on failure.
 */
AVDynamicHDRVivid *av_dynamic_hdr_vivid_create_side_data(AVFrame *frame);

#endif /* AVUTIL_HDR_DYNAMIC_VIVID_METADATA_H */
