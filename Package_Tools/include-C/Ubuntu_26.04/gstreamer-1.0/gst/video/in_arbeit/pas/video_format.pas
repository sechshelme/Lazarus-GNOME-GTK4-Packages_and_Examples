unit video_format;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2011> Wim Taymans <wim.taymans@gmail.com>
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
{$ifndef __GST_VIDEO_FORMAT_H__}
{$define __GST_VIDEO_FORMAT_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-enumtypes.h>}
{$include <gst/video/video-tile.h>}
{*
 * GstVideoFormat:
 * @GST_VIDEO_FORMAT_UNKNOWN: Unknown or unset video format id
 * @GST_VIDEO_FORMAT_ENCODED: Encoded video format. Only ever use that in caps for
 *                            special video formats in combination with non-system
 *                            memory GstCapsFeatures where it does not make sense
 *                            to specify a real video format.
 * @GST_VIDEO_FORMAT_I420: planar 4:2:0 YUV
 * @GST_VIDEO_FORMAT_YV12: planar 4:2:0 YVU (like I420 but UV planes swapped)
 * @GST_VIDEO_FORMAT_YUY2: packed 4:2:2 YUV (Y0-U0-Y1-V0 Y2-U2-Y3-V2 Y4 ...)
 * @GST_VIDEO_FORMAT_UYVY: packed 4:2:2 YUV (U0-Y0-V0-Y1 U2-Y2-V2-Y3 U4 ...)
 * @GST_VIDEO_FORMAT_VYUY: packed 4:2:2 YUV (V0-Y0-U0-Y1 V2-Y2-U2-Y3 V4 ...)
 * @GST_VIDEO_FORMAT_AYUV: packed 4:4:4 YUV with alpha channel (A0-Y0-U0-V0 ...)
 * @GST_VIDEO_FORMAT_RGBx: sparse rgb packed into 32 bit, space last
 * @GST_VIDEO_FORMAT_BGRx: sparse reverse rgb packed into 32 bit, space last
 * @GST_VIDEO_FORMAT_xRGB: sparse rgb packed into 32 bit, space first
 * @GST_VIDEO_FORMAT_xBGR: sparse reverse rgb packed into 32 bit, space first
 * @GST_VIDEO_FORMAT_RGBA: rgb with alpha channel last
 * @GST_VIDEO_FORMAT_BGRA: reverse rgb with alpha channel last
 * @GST_VIDEO_FORMAT_ARGB: rgb with alpha channel first
 * @GST_VIDEO_FORMAT_ABGR: reverse rgb with alpha channel first
 * @GST_VIDEO_FORMAT_RGB: RGB packed into 24 bits without padding (`R-G-B-R-G-B`)
 * @GST_VIDEO_FORMAT_BGR: reverse RGB packed into 24 bits without padding (`B-G-R-B-G-R`)
 * @GST_VIDEO_FORMAT_Y41B: planar 4:1:1 YUV
 * @GST_VIDEO_FORMAT_Y42B: planar 4:2:2 YUV
 * @GST_VIDEO_FORMAT_YVYU: packed 4:2:2 YUV (Y0-V0-Y1-U0 Y2-V2-Y3-U2 Y4 ...)
 * @GST_VIDEO_FORMAT_Y444: planar 4:4:4 YUV
 * @GST_VIDEO_FORMAT_v210: packed 4:2:2 10-bit YUV, complex format
 * @GST_VIDEO_FORMAT_v216: packed 4:2:2 16-bit YUV, Y0-U0-Y1-V1 order
 * @GST_VIDEO_FORMAT_NV12: planar 4:2:0 YUV with interleaved UV plane
 * @GST_VIDEO_FORMAT_NV21: planar 4:2:0 YUV with interleaved VU plane
 * @GST_VIDEO_FORMAT_NV12_10LE32: 10-bit variant of @GST_VIDEO_FORMAT_NV12, packed into 32bit words (MSB 2 bits padding) (Since: 1.14)
 * @GST_VIDEO_FORMAT_GRAY8: 8-bit grayscale
 * @GST_VIDEO_FORMAT_GRAY10_LE32: 10-bit grayscale, packed into 32bit words (2 bits padding) (Since: 1.14)
 * @GST_VIDEO_FORMAT_GRAY16_BE: 16-bit grayscale, most significant byte first
 * @GST_VIDEO_FORMAT_GRAY16_LE: 16-bit grayscale, least significant byte first
 * @GST_VIDEO_FORMAT_v308: packed 4:4:4 YUV (Y-U-V ...)
 * @GST_VIDEO_FORMAT_IYU2: packed 4:4:4 YUV (U-Y-V ...) (Since: 1.10)
 * @GST_VIDEO_FORMAT_RGB16: rgb 5-6-5 bits per component
 * @GST_VIDEO_FORMAT_BGR16: reverse rgb 5-6-5 bits per component
 * @GST_VIDEO_FORMAT_RGB15: rgb 5-5-5 bits per component
 * @GST_VIDEO_FORMAT_BGR15: reverse rgb 5-5-5 bits per component
 * @GST_VIDEO_FORMAT_UYVP: packed 10-bit 4:2:2 YUV (U0-Y0-V0-Y1 U2-Y2-V2-Y3 U4 ...)
 * @GST_VIDEO_FORMAT_A420: planar 4:4:2:0 AYUV
 * @GST_VIDEO_FORMAT_RGB8P: 8-bit paletted RGB
 * @GST_VIDEO_FORMAT_YUV9: planar 4:1:0 YUV
 * @GST_VIDEO_FORMAT_YVU9: planar 4:1:0 YUV (like YUV9 but UV planes swapped)
 * @GST_VIDEO_FORMAT_IYU1: packed 4:1:1 YUV (Cb-Y0-Y1-Cr-Y2-Y3 ...)
 * @GST_VIDEO_FORMAT_ARGB64: rgb with alpha channel first, 16 bits (native endianness) per channel
 * @GST_VIDEO_FORMAT_AYUV64: packed 4:4:4 YUV with alpha channel, 16 bits (native endianness) per channel (A0-Y0-U0-V0 ...)
 * @GST_VIDEO_FORMAT_r210: packed 4:4:4 RGB, 10 bits per channel
 * @GST_VIDEO_FORMAT_I420_10BE: planar 4:2:0 YUV, 10 bits per channel
 * @GST_VIDEO_FORMAT_I420_10LE: planar 4:2:0 YUV, 10 bits per channel
 * @GST_VIDEO_FORMAT_I422_10BE: planar 4:2:2 YUV, 10 bits per channel
 * @GST_VIDEO_FORMAT_I422_10LE: planar 4:2:2 YUV, 10 bits per channel
 * @GST_VIDEO_FORMAT_Y444_10BE: planar 4:4:4 YUV, 10 bits per channel (Since: 1.2)
 * @GST_VIDEO_FORMAT_Y444_10LE: planar 4:4:4 YUV, 10 bits per channel (Since: 1.2)
 * @GST_VIDEO_FORMAT_GBR: planar 4:4:4 RGB, 8 bits per channel (Since: 1.2)
 * @GST_VIDEO_FORMAT_GBR_10BE: planar 4:4:4 RGB, 10 bits per channel (Since: 1.2)
 * @GST_VIDEO_FORMAT_GBR_10LE: planar 4:4:4 RGB, 10 bits per channel (Since: 1.2)
 * @GST_VIDEO_FORMAT_NV16: planar 4:2:2 YUV with interleaved UV plane (Since: 1.2)
 * @GST_VIDEO_FORMAT_NV16_10LE32: 10-bit variant of @GST_VIDEO_FORMAT_NV16, packed into 32bit words (MSB 2 bits padding) (Since: 1.14)
 * @GST_VIDEO_FORMAT_NV24: planar 4:4:4 YUV with interleaved UV plane (Since: 1.2)
 * @GST_VIDEO_FORMAT_NV12_64Z32: NV12 with 64x32 tiling in zigzag pattern (Since: 1.4)
 * @GST_VIDEO_FORMAT_A420_10BE: planar 4:4:2:0 YUV, 10 bits per channel (Since: 1.6)
 * @GST_VIDEO_FORMAT_A420_10LE: planar 4:4:2:0 YUV, 10 bits per channel (Since: 1.6)
 * @GST_VIDEO_FORMAT_A422_10BE: planar 4:4:2:2 YUV, 10 bits per channel (Since: 1.6)
 * @GST_VIDEO_FORMAT_A422_10LE: planar 4:4:2:2 YUV, 10 bits per channel (Since: 1.6)
 * @GST_VIDEO_FORMAT_A444_10BE: planar 4:4:4:4 YUV, 10 bits per channel (Since: 1.6)
 * @GST_VIDEO_FORMAT_A444_10LE: planar 4:4:4:4 YUV, 10 bits per channel (Since: 1.6)
 * @GST_VIDEO_FORMAT_NV61: planar 4:2:2 YUV with interleaved VU plane (Since: 1.6)
 * @GST_VIDEO_FORMAT_P010_10BE: planar 4:2:0 YUV with interleaved UV plane, 10 bits per channel (Since: 1.10)
 * @GST_VIDEO_FORMAT_P010_10LE: planar 4:2:0 YUV with interleaved UV plane, 10 bits per channel (Since: 1.10)
 * @GST_VIDEO_FORMAT_GBRA: planar 4:4:4:4 ARGB, 8 bits per channel (Since: 1.12)
 * @GST_VIDEO_FORMAT_GBRA_10BE: planar 4:4:4:4 ARGB, 10 bits per channel (Since: 1.12)
 * @GST_VIDEO_FORMAT_GBRA_10LE: planar 4:4:4:4 ARGB, 10 bits per channel (Since: 1.12)
 * @GST_VIDEO_FORMAT_GBR_12BE: planar 4:4:4 RGB, 12 bits per channel (Since: 1.12)
 * @GST_VIDEO_FORMAT_GBR_12LE: planar 4:4:4 RGB, 12 bits per channel (Since: 1.12)
 * @GST_VIDEO_FORMAT_GBRA_12BE: planar 4:4:4:4 ARGB, 12 bits per channel (Since: 1.12)
 * @GST_VIDEO_FORMAT_GBRA_12LE: planar 4:4:4:4 ARGB, 12 bits per channel (Since: 1.12)
 * @GST_VIDEO_FORMAT_I420_12BE: planar 4:2:0 YUV, 12 bits per channel (Since: 1.12)
 * @GST_VIDEO_FORMAT_I420_12LE: planar 4:2:0 YUV, 12 bits per channel (Since: 1.12)
 * @GST_VIDEO_FORMAT_I422_12BE: planar 4:2:2 YUV, 12 bits per channel (Since: 1.12)
 * @GST_VIDEO_FORMAT_I422_12LE: planar 4:2:2 YUV, 12 bits per channel (Since: 1.12)
 * @GST_VIDEO_FORMAT_Y444_12BE: planar 4:4:4 YUV, 12 bits per channel (Since: 1.12)
 * @GST_VIDEO_FORMAT_Y444_12LE: planar 4:4:4 YUV, 12 bits per channel (Since: 1.12)
 * @GST_VIDEO_FORMAT_NV12_10LE40: Fully packed variant of NV12_10LE32 (Since: 1.16)
 * @GST_VIDEO_FORMAT_Y210: packed 4:2:2 YUV, 10 bits per channel (Since: 1.16)
 * @GST_VIDEO_FORMAT_Y410: packed 4:4:4 YUV, 10 bits per channel(A-V-Y-U...) (Since: 1.16)
 * @GST_VIDEO_FORMAT_VUYA: packed 4:4:4 YUV with alpha channel (V0-U0-Y0-A0...) (Since: 1.16)
 * @GST_VIDEO_FORMAT_BGR10A2_LE: packed 4:4:4 RGB with alpha channel(B-G-R-A), 10 bits for R/G/B channel and MSB 2 bits for alpha channel (Since: 1.16)
 * @GST_VIDEO_FORMAT_RGB10A2_LE: packed 4:4:4 RGB with alpha channel(R-G-B-A), 10 bits for R/G/B channel and MSB 2 bits for alpha channel (Since: 1.18)
 * @GST_VIDEO_FORMAT_Y444_16BE: planar 4:4:4 YUV, 16 bits per channel (Since: 1.18)
 * @GST_VIDEO_FORMAT_Y444_16LE: planar 4:4:4 YUV, 16 bits per channel (Since: 1.18)
 * @GST_VIDEO_FORMAT_P016_BE: planar 4:2:0 YUV with interleaved UV plane, 16 bits per channel (Since: 1.18)
 * @GST_VIDEO_FORMAT_P016_LE: planar 4:2:0 YUV with interleaved UV plane, 16 bits per channel (Since: 1.18)
 * @GST_VIDEO_FORMAT_P012_BE: planar 4:2:0 YUV with interleaved UV plane, 12 bits per channel (Since: 1.18)
 * @GST_VIDEO_FORMAT_P012_LE: planar 4:2:0 YUV with interleaved UV plane, 12 bits per channel (Since: 1.18)
 * @GST_VIDEO_FORMAT_Y212_BE: packed 4:2:2 YUV, 12 bits per channel (Y-U-Y-V) (Since: 1.18)
 * @GST_VIDEO_FORMAT_Y212_LE: packed 4:2:2 YUV, 12 bits per channel (Y-U-Y-V) (Since: 1.18)
 * @GST_VIDEO_FORMAT_Y412_BE: packed 4:4:4:4 YUV, 12 bits per channel(U-Y-V-A...) (Since: 1.18)
 * @GST_VIDEO_FORMAT_Y412_LE: packed 4:4:4:4 YUV, 12 bits per channel(U-Y-V-A...) (Since: 1.18)
 * @GST_VIDEO_FORMAT_NV12_4L4: NV12 with 4x4 tiles in linear order (Since: 1.18)
 * @GST_VIDEO_FORMAT_NV12_32L32: NV12 with 32x32 tiles in linear order (Since: 1.18)
 * @GST_VIDEO_FORMAT_RGBP: planar 4:4:4 RGB, 8 bits per channel (Since: 1.20)
 * @GST_VIDEO_FORMAT_BGRP: planar 4:4:4 RGB, 8 bits per channel (Since: 1.20)
 * @GST_VIDEO_FORMAT_AV12: Planar 4:2:0 YUV with interleaved UV plane with alpha as 3rd plane (Since: 1.20)
 * @GST_VIDEO_FORMAT_ARGB64_LE: RGB with alpha channel first, 16 bits per channel
 * @GST_VIDEO_FORMAT_ARGB64_BE: RGB with alpha channel first, 16 bits per channel
 * @GST_VIDEO_FORMAT_RGBA64_LE: RGB with alpha channel last, 16 bits per channel
 * @GST_VIDEO_FORMAT_RGBA64_BE: RGB with alpha channel last, 16 bits per channel
 * @GST_VIDEO_FORMAT_BGRA64_LE: reverse RGB with alpha channel last, 16 bits per channel
 * @GST_VIDEO_FORMAT_BGRA64_BE: reverse RGB with alpha channel last, 16 bits per channel
 * @GST_VIDEO_FORMAT_ABGR64_LE: reverse RGB with alpha channel first, 16 bits per channel
 * @GST_VIDEO_FORMAT_ABGR64_BE: reverse RGB with alpha channel first, 16 bits per channel
 * @GST_VIDEO_FORMAT_NV12_16L32S: NV12 with 16x32 Y tiles and 16x16 UV tiles. (Since: 1.22)
 * @GST_VIDEO_FORMAT_NV12_8L128 : NV12 with 8x128 tiles in linear order (Since: 1.22)
 * @GST_VIDEO_FORMAT_NV12_10BE_8L128 : NV12 10bit big endian with 8x128 tiles in linear order (Since: 1.22)
 * @GST_VIDEO_FORMAT_NV12_10LE40_4L4: @GST_VIDEO_FORMAT_NV12_10LE40 with 4x4 pixels tiles (5 bytes per tile row) (Since: 1.24)
 * @GST_VIDEO_FORMAT_DMA_DRM: DMA DRM special format. It's only used with
 *                            memory:DMABuf #GstCapsFeatures, where an extra
 *                            parameter (drm-format) is required to define the
 *                            image format and its memory layout.
 * @GST_VIDEO_FORMAT_MT2110T : Mediatek 10bit NV12 little endian with 16x32 tiles in linear order, tiled 2 bits (Since: 1.24)
 * @GST_VIDEO_FORMAT_MT2110R : Mediatek 10bit NV12 little endian with 16x32 tiles in linear order, raster 2 bits (Since: 1.24)
 * @GST_VIDEO_FORMAT_A422: planar 4:4:2:2 YUV, 8 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_A444: planar 4:4:4:4 YUV, 8 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_A444_12LE: planar 4:4:4:4 YUV, 12 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_A444_12BE: planar 4:4:4:4 YUV, 12 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_A422_12LE: planar 4:4:2:2 YUV, 12 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_A422_12BE: planar 4:4:2:2 YUV, 12 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_A420_12LE: planar 4:4:2:0 YUV, 12 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_A420_12BE: planar 4:4:2:0 YUV, 12 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_A444_16LE: planar 4:4:4:4 YUV, 16 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_A444_16BE: planar 4:4:4:4 YUV, 16 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_A422_16LE: planar 4:4:2:2 YUV, 16 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_A422_16BE: planar 4:4:2:2 YUV, 16 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_A420_16LE: planar 4:4:2:0 YUV, 16 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_A420_16BE: planar 4:4:2:0 YUV, 16 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_GBR_16LE: planar 4:4:4 RGB, 16 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_GBR_16BE: planar 4:4:4 RGB, 16 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_RBGA: packed RGB with alpha, 8 bits per channel (Since: 1.24)
 * @GST_VIDEO_FORMAT_Y216_LE: packed 4:2:2 YUV, 16 bits per channel (Y-U-Y-V) (Since: 1.26)
 * @GST_VIDEO_FORMAT_Y216_BE: packed 4:2:2 YUV, 16 bits per channel (Y-U-Y-V) (Since: 1.26)
 * @GST_VIDEO_FORMAT_Y416_LE: packed 4:4:4:4 YUV, 16 bits per channel(U-Y-V-A) (Since: 1.26)
 * @GST_VIDEO_FORMAT_Y416_BE: packed 4:4:4:4 YUV, 16 bits per channel(U-Y-V-A) (Since: 1.26)
 * @GST_VIDEO_FORMAT_GRAY10_LE16: 10-bit grayscale, packed into 16bit words (6 bits padding) (Since: 1.26)
 * @GST_VIDEO_FORMAT_NV16_10LE40: Fully packed variant of NV16_10LE32 (Since: 1.28)
 * @GST_VIDEO_FORMAT_BGR10x2_LE: packed 4:4:4 RGB (B-G-R-x), 10 bits for R/G/B channel and MSB 2 bits for padding (Since: 1.28)
 * @GST_VIDEO_FORMAT_RGB10x2_LE: packed 4:4:4 RGB (R-G-B-x), 10 bits for R/G/B channel and MSB 2 bits for padding (Since: 1.28)
 *
 * Enum value describing the most common video formats.
 *
 * See the [GStreamer raw video format design document](https://gstreamer.freedesktop.org/documentation/additional/design/mediatype-video-raw.html#formats)
 * for details about the layout and packing of these formats in memory.
  }
{*
   * GST_VIDEO_FORMAT_NV12_4L4:
   *
   * NV12 with 4x4 tiles in linear order.
   *
   * Since: 1.18
    }
{*
   * GST_VIDEO_FORMAT_NV12_32L32:
   *
   * NV12 with 32x32 tiles in linear order.
   *
   * Since: 1.18
    }
{*
   * GST_VIDEO_FORMAT_RGBP:
   *
   * Planar 4:4:4 RGB, R-G-B order
   *
   * Since: 1.20
    }
{*
   * GST_VIDEO_FORMAT_BGRP:
   *
   * Planar 4:4:4 RGB, B-G-R order
   *
   * Since: 1.20
    }
{*
   * GST_VIDEO_FORMAT_AV12:
   *
   * Planar 4:2:0 YUV with interleaved UV plane with alpha as
   * 3rd plane.
   *
   * Since: 1.20
    }
{*
   * GST_VIDEO_FORMAT_ARGB64_LE:
   *
   * RGB with alpha channel first, 16 bits (little endian)
   * per channel.
   *
   * Since: 1.20
    }
{*
   * GST_VIDEO_FORMAT_ARGB64_BE:
   *
   * RGB with alpha channel first, 16 bits (big endian)
   * per channel.
   *
   * Since: 1.20
    }
{*
   * GST_VIDEO_FORMAT_RGBA64_LE:
   *
   * RGB with alpha channel last, 16 bits (little endian)
   * per channel.
   *
   * Since: 1.20
    }
{*
   * GST_VIDEO_FORMAT_RGBA64_BE:
   *
   * RGB with alpha channel last, 16 bits (big endian)
   * per channel.
   *
   * Since: 1.20
    }
{*
   * GST_VIDEO_FORMAT_BGRA64_LE:
   *
   * Reverse RGB with alpha channel last, 16 bits (little endian)
   * per channel.
   *
   * Since: 1.20
    }
{*
   * GST_VIDEO_FORMAT_BGRA64_BE:
   *
   * Reverse RGB with alpha channel last, 16 bits (big endian)
   * per channel.
   *
   * Since: 1.20
    }
{*
   * GST_VIDEO_FORMAT_ABGR64_LE:
   *
   * Reverse RGB with alpha channel first, 16 bits (little endian)
   * per channel.
   *
   * Since: 1.20
    }
{*
   * GST_VIDEO_FORMAT_ABGR64_BE:
   *
   * Reverse RGB with alpha channel first, 16 bits (big endian)
   * per channel.
   *
   * Since: 1.20
    }
{*
   * GST_VIDEO_FORMAT_NV12_16L32S:
   *
   * NV12 with 16x32 Y tiles and 16x16 UV tiles.
   *
   * Since: 1.22
    }
{*
   * GST_VIDEO_FORMAT_NV12_8L128:
   *
   * NV12 with 8x128 tiles in linear order.
   *
   * Since: 1.22
    }
{*
   * GST_VIDEO_FORMAT_NV12_10BE_8L128:
   *
   * NV12 10bit big endian with 8x128 tiles in linear order.
   *
   * Since: 1.22
    }
{*
   * GST_VIDEO_FORMAT_NV12_10LE40_4L4:
   *
   *  @GST_VIDEO_FORMAT_NV12_10LE40 with 4x4 pixels tiles (5 bytes
   *  per tile row). This format is produced by Verisilicon/Hantro decoders.
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_DMA_DRM:
   *
   * @GST_VIDEO_FORMAT_DMA_DRM represent the DMA DRM special format. It's
   * only used with memory:DMABuf #GstCapsFeatures, where an extra
   * parameter (drm-format) is required to define the image format and
   * its memory layout.
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_MT2110T:
   *
   * Mediatek 10bit NV12 little endian with 16x32 tiles in linear order, tile 2
   * bits.
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_MT2110R:
   *
   * Mediatek 10bit NV12 little endian with 16x32 tiles in linear order, raster
   * 2 bits.
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_A422:
   *
   * planar 4:4:2:2 YUV, 8 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_A444:
   *
   * planar 4:4:4:4 YUV, 8 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_A444_12LE:
   *
   * planar 4:4:4:4 YUV, 12 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_A444_12BE:
   *
   * planar 4:4:4:4 YUV, 12 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_A422_12LE:
   *
   * planar 4:4:2:2 YUV, 12 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_A422_12BE:
   *
   * planar 4:4:2:2 YUV, 12 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_A420_12LE:
   *
   * planar 4:4:2:0 YUV, 12 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_A420_12BE:
   *
   * planar 4:4:2:0 YUV, 12 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_A444_16LE:
   *
   * planar 4:4:4:4 YUV, 16 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_A444_16BE:
   *
   * planar 4:4:4:4 YUV, 16 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_A422_16LE:
   *
   * planar 4:4:2:2 YUV, 16 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_A422_16BE:
   *
   * planar 4:4:2:2 YUV, 16 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_A420_16LE:
   *
   * planar 4:4:2:0 YUV, 16 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_A420_16BE:
   *
   * planar 4:4:2:0 YUV, 16 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_GBR_16LE:
   *
   * planar 4:4:4 RGB, 16 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_GBR_16BE:
   *
   * planar 4:4:4 RGB, 16 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_RBGA:
   *
   * packed RGB with alpha, 8 bits per channel
   *
   * Since: 1.24
    }
{*
   * GST_VIDEO_FORMAT_Y216_LE:
   *
   * packed 4:2:2 YUV, 16 bits per channel (Y-U-Y-V)
   *
   * Since: 1.26
    }
{*
   * GST_VIDEO_FORMAT_Y216_BE:
   *
   * packed 4:2:2 YUV, 16 bits per channel (Y-U-Y-V)
   *
   * Since: 1.26
    }
{*
   * GST_VIDEO_FORMAT_Y416_LE:
   *
   * packed 4:4:4:4 YUV, 16 bits per channel(U-Y-V-A)
   *
   * Since: 1.26
    }
{*
   * GST_VIDEO_FORMAT_Y416_BE:
   *
   * packed 4:4:4:4 YUV, 16 bits per channel(U-Y-V-A)
   *
   * Since: 1.26
    }
{*
   * GST_VIDEO_FORMAT_GRAY10_LE16:
   *
   * 10-bit grayscale, packed into 16bit words (6 bits left padding)
   *
   * Since: 1.26
    }
{*
   * GST_VIDEO_FORMAT_NV16_10LE40:
   *
   * Fully packed variant of NV16_10LE32
   *
   * Since: 1.28
    }
{*
   * GST_VIDEO_FORMAT_BGR10x2_LE:
   *
   * packed 4:4:4 RGB (B-G-R-x), 10 bits for R/G/B channel and MSB 2 bits for padding.
   *
   * Since: 1.28
    }
{*
   * GST_VIDEO_FORMAT_RGB10x2_LE:
   *
   * packed 4:4:4 RGB (R-G-B-x), 10 bits for R/G/B channel and MSB 2 bits for padding.
   *
   * Since: 1.28
    }
{ Update GST_VIDEO_FORMAT_LAST below when adding more formats here  }
type
  PGstVideoFormat = ^TGstVideoFormat;
  TGstVideoFormat =  Longint;
  Const
    GST_VIDEO_FORMAT_UNKNOWN = 0;
    GST_VIDEO_FORMAT_ENCODED = 1;
    GST_VIDEO_FORMAT_I420 = 2;
    GST_VIDEO_FORMAT_YV12 = 3;
    GST_VIDEO_FORMAT_YUY2 = 4;
    GST_VIDEO_FORMAT_UYVY = 5;
    GST_VIDEO_FORMAT_AYUV = 6;
    GST_VIDEO_FORMAT_RGBx = 7;
    GST_VIDEO_FORMAT_BGRx = 8;
    GST_VIDEO_FORMAT_xRGB = 9;
    GST_VIDEO_FORMAT_xBGR = 10;
    GST_VIDEO_FORMAT_RGBA = 11;
    GST_VIDEO_FORMAT_BGRA = 12;
    GST_VIDEO_FORMAT_ARGB = 13;
    GST_VIDEO_FORMAT_ABGR = 14;
    GST_VIDEO_FORMAT_RGB = 15;
    GST_VIDEO_FORMAT_BGR = 16;
    GST_VIDEO_FORMAT_Y41B = 17;
    GST_VIDEO_FORMAT_Y42B = 18;
    GST_VIDEO_FORMAT_YVYU = 19;
    GST_VIDEO_FORMAT_Y444 = 20;
    GST_VIDEO_FORMAT_v210 = 21;
    GST_VIDEO_FORMAT_v216 = 22;
    GST_VIDEO_FORMAT_NV12 = 23;
    GST_VIDEO_FORMAT_NV21 = 24;
    GST_VIDEO_FORMAT_GRAY8 = 25;
    GST_VIDEO_FORMAT_GRAY16_BE = 26;
    GST_VIDEO_FORMAT_GRAY16_LE = 27;
    GST_VIDEO_FORMAT_v308 = 28;
    GST_VIDEO_FORMAT_RGB16 = 29;
    GST_VIDEO_FORMAT_BGR16 = 30;
    GST_VIDEO_FORMAT_RGB15 = 31;
    GST_VIDEO_FORMAT_BGR15 = 32;
    GST_VIDEO_FORMAT_UYVP = 33;
    GST_VIDEO_FORMAT_A420 = 34;
    GST_VIDEO_FORMAT_RGB8P = 35;
    GST_VIDEO_FORMAT_YUV9 = 36;
    GST_VIDEO_FORMAT_YVU9 = 37;
    GST_VIDEO_FORMAT_IYU1 = 38;
    GST_VIDEO_FORMAT_ARGB64 = 39;
    GST_VIDEO_FORMAT_AYUV64 = 40;
    GST_VIDEO_FORMAT_r210 = 41;
    GST_VIDEO_FORMAT_I420_10BE = 42;
    GST_VIDEO_FORMAT_I420_10LE = 43;
    GST_VIDEO_FORMAT_I422_10BE = 44;
    GST_VIDEO_FORMAT_I422_10LE = 45;
    GST_VIDEO_FORMAT_Y444_10BE = 46;
    GST_VIDEO_FORMAT_Y444_10LE = 47;
    GST_VIDEO_FORMAT_GBR = 48;
    GST_VIDEO_FORMAT_GBR_10BE = 49;
    GST_VIDEO_FORMAT_GBR_10LE = 50;
    GST_VIDEO_FORMAT_NV16 = 51;
    GST_VIDEO_FORMAT_NV24 = 52;
    GST_VIDEO_FORMAT_NV12_64Z32 = 53;
    GST_VIDEO_FORMAT_A420_10BE = 54;
    GST_VIDEO_FORMAT_A420_10LE = 55;
    GST_VIDEO_FORMAT_A422_10BE = 56;
    GST_VIDEO_FORMAT_A422_10LE = 57;
    GST_VIDEO_FORMAT_A444_10BE = 58;
    GST_VIDEO_FORMAT_A444_10LE = 59;
    GST_VIDEO_FORMAT_NV61 = 60;
    GST_VIDEO_FORMAT_P010_10BE = 61;
    GST_VIDEO_FORMAT_P010_10LE = 62;
    GST_VIDEO_FORMAT_IYU2 = 63;
    GST_VIDEO_FORMAT_VYUY = 64;
    GST_VIDEO_FORMAT_GBRA = 65;
    GST_VIDEO_FORMAT_GBRA_10BE = 66;
    GST_VIDEO_FORMAT_GBRA_10LE = 67;
    GST_VIDEO_FORMAT_GBR_12BE = 68;
    GST_VIDEO_FORMAT_GBR_12LE = 69;
    GST_VIDEO_FORMAT_GBRA_12BE = 70;
    GST_VIDEO_FORMAT_GBRA_12LE = 71;
    GST_VIDEO_FORMAT_I420_12BE = 72;
    GST_VIDEO_FORMAT_I420_12LE = 73;
    GST_VIDEO_FORMAT_I422_12BE = 74;
    GST_VIDEO_FORMAT_I422_12LE = 75;
    GST_VIDEO_FORMAT_Y444_12BE = 76;
    GST_VIDEO_FORMAT_Y444_12LE = 77;
    GST_VIDEO_FORMAT_GRAY10_LE32 = 78;
    GST_VIDEO_FORMAT_NV12_10LE32 = 79;
    GST_VIDEO_FORMAT_NV16_10LE32 = 80;
    GST_VIDEO_FORMAT_NV12_10LE40 = 81;
    GST_VIDEO_FORMAT_Y210 = 82;
    GST_VIDEO_FORMAT_Y410 = 83;
    GST_VIDEO_FORMAT_VUYA = 84;
    GST_VIDEO_FORMAT_BGR10A2_LE = 85;
    GST_VIDEO_FORMAT_RGB10A2_LE = 86;
    GST_VIDEO_FORMAT_Y444_16BE = 87;
    GST_VIDEO_FORMAT_Y444_16LE = 88;
    GST_VIDEO_FORMAT_P016_BE = 89;
    GST_VIDEO_FORMAT_P016_LE = 90;
    GST_VIDEO_FORMAT_P012_BE = 91;
    GST_VIDEO_FORMAT_P012_LE = 92;
    GST_VIDEO_FORMAT_Y212_BE = 93;
    GST_VIDEO_FORMAT_Y212_LE = 94;
    GST_VIDEO_FORMAT_Y412_BE = 95;
    GST_VIDEO_FORMAT_Y412_LE = 96;
    GST_VIDEO_FORMAT_NV12_4L4 = 97;
    GST_VIDEO_FORMAT_NV12_32L32 = 98;
    GST_VIDEO_FORMAT_RGBP = 99;
    GST_VIDEO_FORMAT_BGRP = 100;
    GST_VIDEO_FORMAT_AV12 = 101;
    GST_VIDEO_FORMAT_ARGB64_LE = 102;
    GST_VIDEO_FORMAT_ARGB64_BE = 103;
    GST_VIDEO_FORMAT_RGBA64_LE = 104;
    GST_VIDEO_FORMAT_RGBA64_BE = 105;
    GST_VIDEO_FORMAT_BGRA64_LE = 106;
    GST_VIDEO_FORMAT_BGRA64_BE = 107;
    GST_VIDEO_FORMAT_ABGR64_LE = 108;
    GST_VIDEO_FORMAT_ABGR64_BE = 109;
    GST_VIDEO_FORMAT_NV12_16L32S = 110;
    GST_VIDEO_FORMAT_NV12_8L128 = 111;
    GST_VIDEO_FORMAT_NV12_10BE_8L128 = 112;
    GST_VIDEO_FORMAT_NV12_10LE40_4L4 = 113;
    GST_VIDEO_FORMAT_DMA_DRM = 114;
    GST_VIDEO_FORMAT_MT2110T = 115;
    GST_VIDEO_FORMAT_MT2110R = 116;
    GST_VIDEO_FORMAT_A422 = 117;
    GST_VIDEO_FORMAT_A444 = 118;
    GST_VIDEO_FORMAT_A444_12LE = 119;
    GST_VIDEO_FORMAT_A444_12BE = 120;
    GST_VIDEO_FORMAT_A422_12LE = 121;
    GST_VIDEO_FORMAT_A422_12BE = 122;
    GST_VIDEO_FORMAT_A420_12LE = 123;
    GST_VIDEO_FORMAT_A420_12BE = 124;
    GST_VIDEO_FORMAT_A444_16LE = 125;
    GST_VIDEO_FORMAT_A444_16BE = 126;
    GST_VIDEO_FORMAT_A422_16LE = 127;
    GST_VIDEO_FORMAT_A422_16BE = 128;
    GST_VIDEO_FORMAT_A420_16LE = 129;
    GST_VIDEO_FORMAT_A420_16BE = 130;
    GST_VIDEO_FORMAT_GBR_16LE = 131;
    GST_VIDEO_FORMAT_GBR_16BE = 132;
    GST_VIDEO_FORMAT_RBGA = 133;
    GST_VIDEO_FORMAT_Y216_LE = 134;
    GST_VIDEO_FORMAT_Y216_BE = 135;
    GST_VIDEO_FORMAT_Y416_LE = 136;
    GST_VIDEO_FORMAT_Y416_BE = 137;
    GST_VIDEO_FORMAT_GRAY10_LE16 = 138;
    GST_VIDEO_FORMAT_NV16_10LE40 = 139;
    GST_VIDEO_FORMAT_BGR10x2_LE = 140;
    GST_VIDEO_FORMAT_RGB10x2_LE = 141;
;
{*
 * GST_VIDEO_FORMAT_LAST:
 *
 * Number of video formats in #GstVideoFormat.
 *
 * Since: 1.26
  }
  GST_VIDEO_FORMAT_LAST = GST_VIDEO_FORMAT_RGB10x2_LE+1;  
  GST_VIDEO_MAX_PLANES = 4;  
  GST_VIDEO_MAX_COMPONENTS = 4;  
type
{*
 * GstVideoFormatFlags:
 * @GST_VIDEO_FORMAT_FLAG_YUV: The video format is YUV, components are numbered
 *   0=Y, 1=U, 2=V.
 * @GST_VIDEO_FORMAT_FLAG_RGB: The video format is RGB, components are numbered
 *   0=R, 1=G, 2=B.
 * @GST_VIDEO_FORMAT_FLAG_GRAY: The video is gray, there is one gray component
 *   with index 0.
 * @GST_VIDEO_FORMAT_FLAG_ALPHA: The video format has an alpha components with
 *   the number 3.
 * @GST_VIDEO_FORMAT_FLAG_LE: The video format has data stored in little
 *   endianness.
 * @GST_VIDEO_FORMAT_FLAG_PALETTE: The video format has a palette. The palette
 *   is stored in the second plane and indexes are stored in the first plane.
 * @GST_VIDEO_FORMAT_FLAG_COMPLEX: The video format has a complex layout that
 *   can't be described with the usual information in the #GstVideoFormatInfo.
 * @GST_VIDEO_FORMAT_FLAG_UNPACK: This format can be used in a
 *   #GstVideoFormatUnpack and #GstVideoFormatPack function.
 * @GST_VIDEO_FORMAT_FLAG_TILED: The format is tiled, there is tiling information
 *   in the last plane.
 * @GST_VIDEO_FORMAT_FLAG_SUBTILES: The tile size varies per plane
 *   according to the subsampling. (Since: 1.22)
 *
 * The different video flags that a format info can have.
  }
{*
   * GST_VIDEO_FORMAT_FLAG_SUBTILES:
   *
   * The tile size varies per plane according to the subsampling.
   *
   * Since: 1.22
    }

  PGstVideoFormatFlags = ^TGstVideoFormatFlags;
  TGstVideoFormatFlags =  Longint;
  Const
    GST_VIDEO_FORMAT_FLAG_YUV = 1 shl 0;
    GST_VIDEO_FORMAT_FLAG_RGB = 1 shl 1;
    GST_VIDEO_FORMAT_FLAG_GRAY = 1 shl 2;
    GST_VIDEO_FORMAT_FLAG_ALPHA = 1 shl 3;
    GST_VIDEO_FORMAT_FLAG_LE = 1 shl 4;
    GST_VIDEO_FORMAT_FLAG_PALETTE = 1 shl 5;
    GST_VIDEO_FORMAT_FLAG_COMPLEX = 1 shl 6;
    GST_VIDEO_FORMAT_FLAG_UNPACK = 1 shl 7;
    GST_VIDEO_FORMAT_FLAG_TILED = 1 shl 8;
    GST_VIDEO_FORMAT_FLAG_SUBTILES = 1 shl 9;
;
{ YUV components  }
  GST_VIDEO_COMP_Y = 0;  
  GST_VIDEO_COMP_U = 1;  
  GST_VIDEO_COMP_V = 2;  
{ RGB components  }
  GST_VIDEO_COMP_R = 0;  
  GST_VIDEO_COMP_G = 1;  
  GST_VIDEO_COMP_B = 2;  
{ alpha component  }
  GST_VIDEO_COMP_A = 3;  
{ palette components  }
  GST_VIDEO_COMP_INDEX = 0;  
  GST_VIDEO_COMP_PALETTE = 1;  
{$include <gst/video/video-chroma.h>}
{*
 * GstVideoPackFlags:
 * @GST_VIDEO_PACK_FLAG_NONE: No flag
 * @GST_VIDEO_PACK_FLAG_TRUNCATE_RANGE: When the source has a smaller depth
 *   than the target format, set the least significant bits of the target
 *   to 0. This is likely slightly faster but less accurate. When this flag
 *   is not specified, the most significant bits of the source are duplicated
 *   in the least significant bits of the destination.
 * @GST_VIDEO_PACK_FLAG_INTERLACED: The source is interlaced. The unpacked
 *   format will be interlaced as well with each line containing
 *   information from alternating fields. (Since: 1.2)
 *
 * The different flags that can be used when packing and unpacking.
  }
type
  PGstVideoPackFlags = ^TGstVideoPackFlags;
  TGstVideoPackFlags =  Longint;
  Const
    GST_VIDEO_PACK_FLAG_NONE = 0;
    GST_VIDEO_PACK_FLAG_TRUNCATE_RANGE = 1 shl 0;
    GST_VIDEO_PACK_FLAG_INTERLACED = 1 shl 1;
;
{*
 * GstVideoFormatUnpack:
 * @info: a #GstVideoFormatInfo
 * @flags: flags to control the unpacking
 * @dest: a destination array
 * @data: pointers to the data planes
 * @stride: strides of the planes
 * @x: the x position in the image to start from
 * @y: the y position in the image to start from
 * @width: the amount of pixels to unpack.
 *
 * Unpacks @width pixels from the given planes and strides containing data of
 * format @info. The pixels will be unpacked into @dest with each component
 * interleaved as per @info's unpack_format, which will usually be one of
 * #GST_VIDEO_FORMAT_ARGB, #GST_VIDEO_FORMAT_AYUV, #GST_VIDEO_FORMAT_ARGB64 or
 * #GST_VIDEO_FORMAT_AYUV64 depending on the format to unpack.
 * @dest should at least be big enough to hold @width * bytes_per_pixel bytes
 * where bytes_per_pixel relates to the unpack format and will usually be
 * either 4 or 8 depending on the unpack format. bytes_per_pixel will be
 * the same as the pixel stride for plane 0 for the above formats.
 *
 * For subsampled formats, the components will be duplicated in the destination
 * array. Reconstruction of the missing components can be performed in a
 * separate step after unpacking.
  }
type

  TGstVideoFormatUnpack = procedure (info:PGstVideoFormatInfo; flags:TGstVideoPackFlags; dest:Tgpointer; data:array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgpointer; stride:array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgint; 
                x:Tgint; y:Tgint; width:Tgint);cdecl;
{*
 * GstVideoFormatPack:
 * @info: a #GstVideoFormatInfo
 * @flags: flags to control the packing
 * @src: a source array
 * @sstride: the source array stride
 * @data: pointers to the destination data planes
 * @stride: strides of the destination planes
 * @chroma_site: the chroma siting of the target when subsampled (not used)
 * @y: the y position in the image to pack to
 * @width: the amount of pixels to pack.
 *
 * Packs @width pixels from @src to the given planes and strides in the
 * format @info. The pixels from source have each component interleaved
 * and will be packed into the planes in @data.
 *
 * This function operates on pack_lines lines, meaning that @src should
 * contain at least pack_lines lines with a stride of @sstride and @y
 * should be a multiple of pack_lines.
 *
 * Subsampled formats will use the horizontally and vertically cosited
 * component from the source. Subsampling should be performed before
 * packing.
 *
 * Because this function does not have a x coordinate, it is not possible to
 * pack pixels starting from an unaligned position. For tiled images this
 * means that packing should start from a tile coordinate. For subsampled
 * formats this means that a complete pixel needs to be packed.
  }
{ FIXME(2.0): remove the chroma_site, it is unused and is not relevant for
 * packing, chroma subsampling based on chroma-site should be done in a separate
 * step before packing }

  TGstVideoFormatPack = procedure (info:PGstVideoFormatInfo; flags:TGstVideoPackFlags; src:Tgpointer; sstride:Tgint; data:array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgpointer; 
                stride:array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgint; chroma_site:TGstVideoChromaSite; y:Tgint; width:Tgint);cdecl;
{*
 * GstVideoFormatInfo:
 * @format: #GstVideoFormat
 * @name: string representation of the format
 * @description: use readable description of the format
 * @flags: #GstVideoFormatFlags
 * @bits: The number of bits used to pack data items. This can be less than 8
 *    when multiple pixels are stored in a byte. for values > 8 multiple bytes
 *    should be read according to the endianness flag before applying the shift
 *    and mask.
 * @n_components: the number of components in the video format.
 * @shift: (array fixed-size=4): the number of bits to shift away to get the component data
 * @depth: (array fixed-size=4): the depth in bits for each component
 * @pixel_stride: (array fixed-size=4): the pixel stride of each component. This is the amount of
 *    bytes to the pixel immediately to the right. When bits < 8, the stride is
 *    expressed in bits. For 24-bit RGB, this would be 3 bytes, for example,
 *    while it would be 4 bytes for RGBx or ARGB.
 * @n_planes: the number of planes for this format. The number of planes can be
 *    less than the amount of components when multiple components are packed into
 *    one plane.
 * @plane: (array fixed-size=4): the plane number where a component can be found
 * @poffset: (array fixed-size=4): the offset in the plane where the first pixel of the components
 *    can be found.
 * @w_sub: (array fixed-size=4): subsampling factor of the width for the component. Use
 *     GST_VIDEO_SUB_SCALE to scale a width.
 * @h_sub: (array fixed-size=4): subsampling factor of the height for the component. Use
 *     GST_VIDEO_SUB_SCALE to scale a height.
 * @unpack_format: the format of the unpacked pixels. This format must have the
 *     #GST_VIDEO_FORMAT_FLAG_UNPACK flag set.
 * @unpack_func: an unpack function for this format
 * @pack_lines: the amount of lines that will be packed
 * @pack_func: an pack function for this format
 * @tile_mode: The tiling mode
 * @tile_ws: The width of a tile, in bytes, represented as a shift. DEPRECATED,
 * use tile_info[] array instead.
 * @tile_hs: The height of a tile, in bytes, represented as a shift. DEPREACTED,
 * use tile_info[] array instead.
 * @tile_info: (array fixed-size=4): Per-plane tile information
 *
 * Information for a video format.
  }
{*
   * GstVideoFormatInfo.tile_info:
   *
   * Information about the tiles for each of the planes.
   *
   * Since: 1.22
    }
  PGstVideoFormatInfo = ^TGstVideoFormatInfo;
  TGstVideoFormatInfo = record
      format : TGstVideoFormat;cdecl;
      name : Pgchar;
      description : Pgchar;
      flags : TGstVideoFormatFlags;
      bits : Tguint;
      n_components : Tguint;
      shift : array[0..(GST_VIDEO_MAX_COMPONENTS)-1] of Tguint;
      depth : array[0..(GST_VIDEO_MAX_COMPONENTS)-1] of Tguint;
      pixel_stride : array[0..(GST_VIDEO_MAX_COMPONENTS)-1] of Tgint;
      n_planes : Tguint;
      plane : array[0..(GST_VIDEO_MAX_COMPONENTS)-1] of Tguint;
      poffset : array[0..(GST_VIDEO_MAX_COMPONENTS)-1] of Tguint;
      w_sub : array[0..(GST_VIDEO_MAX_COMPONENTS)-1] of Tguint;
      h_sub : array[0..(GST_VIDEO_MAX_COMPONENTS)-1] of Tguint;
      unpack_format : TGstVideoFormat;
      unpack_func : TGstVideoFormatUnpack;
      pack_lines : Tgint;
      pack_func : TGstVideoFormatPack;
      tile_mode : TGstVideoTileMode;
      tile_ws : Tguint;
      tile_hs : Tguint;
      tile_info : array[0..(GST_VIDEO_MAX_PLANES)-1] of TGstVideoTileInfo;
    end;

{*
 * GST_VIDEO_FORMAT_INFO_IS_VALID_RAW:
 *
 * Tests that the given #GstVideoFormatInfo represents a valid un-encoded
 * format.
 *
 * Since: 1.22
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_VIDEO_FORMAT_INFO_IS_VALID_RAW(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_FORMAT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_NAME(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_FLAGS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_IS_YUV(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_IS_RGB(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_IS_GRAY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_HAS_ALPHA(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_IS_LE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_HAS_PALETTE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_IS_COMPLEX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_IS_TILED(obj : longint) : longint;

{*
 * GST_VIDEO_FORMAT_INFO_HAS_SUBTILES:
 * @info: a #GstVideoFormatInfo
 *
 * This macro checks if %GST_VIDEO_FORMAT_FLAG_SUBTILES is set. When this
 * flag is set, it means that the tile sizes must be scaled as per the
 * subsampling.
 *
 * Returns: %TRUE if the format uses subsampled tile sizes.
 *
 * Since: 1.22
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_HAS_SUBTILES(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_BITS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_N_COMPONENTS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_SHIFT(info,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_DEPTH(info,c : longint) : longint;

{*
 * GST_VIDEO_FORMAT_INFO_PSTRIDE:
 * @info: a #GstVideoFormatInfo
 * @c: the component index
 *
 * pixel stride for the given component. This is the amount of bytes to the
 * pixel immediately to the right, so basically bytes from one pixel to the
 * next. When bits < 8, the stride is expressed in bits.
 *
 * Examples: for 24-bit RGB, the pixel stride would be 3 bytes, while it
 * would be 4 bytes for RGBx or ARGB, and 8 bytes for ARGB64 or AYUV64.
 * For planar formats such as I420 the pixel stride is usually 1. For
 * YUY2 it would be 2 bytes.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_PSTRIDE(info,c : longint) : longint;

{*
 * GST_VIDEO_FORMAT_INFO_N_PLANES:
 * @info: a #GstVideoFormatInfo
 *
 * Number of planes. This is the number of planes the pixel layout is
 * organized in in memory. The number of planes can be less than the
 * number of components (e.g. Y,U,V,A or R, G, B, A) when multiple
 * components are packed into one plane.
 *
 * Examples: RGB/RGBx/RGBA: 1 plane, 3/3/4 components;
 * I420: 3 planes, 3 components; NV21/NV12: 2 planes, 3 components.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_N_PLANES(obj : longint) : longint;

{*
 * GST_VIDEO_FORMAT_INFO_PLANE:
 * @info: a #GstVideoFormatInfo
 * @c: the component index
 *
 * Plane number where the given component can be found. A plane may
 * contain data for multiple components.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_PLANE(info,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_POFFSET(info,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_W_SUB(info,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_H_SUB(info,c : longint) : longint;

{ rounds up  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_SUB_SCALE(scale,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_SCALE_WIDTH(info,c,w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_SCALE_HEIGHT(info,c,h : longint) : longint;

{*
 * GST_VIDEO_FORMAT_INFO_TILE_WIDTH:
 * @info: a #GstVideoFormatInfo
 * @plane: the plane index
 *
 * See #GstVideoTileInfo.width.
 *
 * Return the width of one tile in pixels, zero if its not an integer.
 *
 * Since: 1.22
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_TILE_WIDTH(info,plane : longint) : longint;

{*
 * GST_VIDEO_FORMAT_INFO_TILE_HEIGHT:
 * @info: a #GstVideoFormatInfo
 * @plane: the plane index
 *
 * See #GstVideoTileInfo.height.
 *
 * Returns the tile height.
 *
 * Since: 1.22
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_TILE_HEIGHT(info,plane : longint) : longint;

{*
 * GST_VIDEO_FORMAT_INFO_TILE_STRIDE:
 * @info: a #GstVideoFormatInfo
 * @plane: the plane index
 *
 * See #GstVideoTileInfo.stride.
 *
 * Returns the stride of one tile, regardless of the internal details of the
 * tile (could be a complex system with subtile) the tiles size should alway
 * match the tile width multiplied by the tile stride.
 *
 * Since: 1.22
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_TILE_STRIDE(info,plane : longint) : longint;

procedure gst_video_format_info_component(info:PGstVideoFormatInfo; plane:Tguint; components:array[0..(GST_VIDEO_MAX_COMPONENTS)-1] of Tgint);cdecl;external libgstvideo;
function gst_video_format_info_extrapolate_stride(finfo:PGstVideoFormatInfo; plane:Tgint; stride:Tgint):Tgint;cdecl;external libgstvideo;
{ format properties  }
function gst_video_format_from_masks(depth:Tgint; bpp:Tgint; endianness:Tgint; red_mask:Tguint; green_mask:Tguint; 
           blue_mask:Tguint; alpha_mask:Tguint):TGstVideoFormat;cdecl;external libgstvideo;
function gst_video_format_from_fourcc(fourcc:Tguint32):TGstVideoFormat;cdecl;external libgstvideo;
function gst_video_format_from_string(format:Pgchar):TGstVideoFormat;cdecl;external libgstvideo;
function gst_video_format_to_fourcc(format:TGstVideoFormat):Tguint32;cdecl;external libgstvideo;
function gst_video_format_to_string(format:TGstVideoFormat):Pgchar;cdecl;external libgstvideo;
function gst_video_format_get_info(format:TGstVideoFormat):PGstVideoFormatInfo;cdecl;external libgstvideo;
function gst_video_format_get_palette(format:TGstVideoFormat; size:Pgsize):Tgconstpointer;cdecl;external libgstvideo;
const
  GST_VIDEO_SIZE_RANGE = '(int) [ 1, max ]';  
  GST_VIDEO_FPS_RANGE = '(fraction) [ 0, max ]';  
{*
 * GST_VIDEO_FORMATS_ALL_STR:
 *
 * Declare all video formats as a string.
 *
 * Formats are sorted by decreasing "quality", using these criteria by priority:
 *   - number of components
 *   - depth
 *   - subsampling factor of the width
 *   - subsampling factor of the height
 *   - number of planes
 *   - native endianness preferred
 *   - pixel stride
 *   - poffset
 *   - prefer non-complex formats
 *   - prefer YUV formats over RGB ones
 *   - prefer I420 over YV12
 *   - format name
 *
 * Since: 1.24
  }
{*
 * GST_VIDEO_FORMATS_ANY_STR:
 *
 * This is similar to %GST_VIDEO_FORMATS_ALL_STR but includes formats like
 * DMA_DRM for which no software converter exists. This should be used for
 * passthrough template caps.
 *
 * Since: 1.24
  }

function gst_video_formats_raw(len:Pguint):PGstVideoFormat;cdecl;external libgstvideo;
function gst_video_formats_any(len:Pguint):PGstVideoFormat;cdecl;external libgstvideo;
function gst_video_make_raw_caps(formats:PGstVideoFormat; len:Tguint):PGstCaps;cdecl;external libgstvideo;
function gst_video_make_raw_caps_with_features(formats:PGstVideoFormat; len:Tguint; features:PGstCapsFeatures):PGstCaps;cdecl;external libgstvideo;
{$endif}
{ __GST_VIDEO_FORMAT_H__  }

// === Konventiert am: 15-7-26 13:35:59 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_IS_VALID_RAW(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_IS_VALID_RAW:=(info<>(NULL and (@(info^.format))))>GST_VIDEO_FORMAT_ENCODED;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_FORMAT(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_FORMAT:=info^.format;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_NAME(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_NAME:=info^.name;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_FLAGS(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_FLAGS:=info^.flags;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_IS_YUV(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_IS_YUV:=((info^.flags) and GST_VIDEO_FORMAT_FLAG_YUV)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_IS_RGB(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_IS_RGB:=((info^.flags) and GST_VIDEO_FORMAT_FLAG_RGB)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_IS_GRAY(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_IS_GRAY:=((info^.flags) and GST_VIDEO_FORMAT_FLAG_GRAY)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_HAS_ALPHA(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_HAS_ALPHA:=((info^.flags) and GST_VIDEO_FORMAT_FLAG_ALPHA)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_IS_LE(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_IS_LE:=((info^.flags) and GST_VIDEO_FORMAT_FLAG_LE)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_HAS_PALETTE(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_HAS_PALETTE:=((info^.flags) and GST_VIDEO_FORMAT_FLAG_PALETTE)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_IS_COMPLEX(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_IS_COMPLEX:=((info^.flags) and GST_VIDEO_FORMAT_FLAG_COMPLEX)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_IS_TILED(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_IS_TILED:=((info^.flags) and GST_VIDEO_FORMAT_FLAG_TILED)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_HAS_SUBTILES(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_HAS_SUBTILES:=((info^.flags) and GST_VIDEO_FORMAT_FLAG_SUBTILES)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_BITS(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_BITS:=info^.bits;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_N_COMPONENTS(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_N_COMPONENTS:=info^.n_components;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_SHIFT(info,c : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_SHIFT:=info^.(shift[c]);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_DEPTH(info,c : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_DEPTH:=info^.(depth[c]);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_PSTRIDE(info,c : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_PSTRIDE:=info^.(pixel_stride[c]);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_N_PLANES(obj : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_N_PLANES:=info^.n_planes;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_PLANE(info,c : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_PLANE:=info^.(plane[c]);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_POFFSET(info,c : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_POFFSET:=info^.(poffset[c]);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_W_SUB(info,c : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_W_SUB:=info^.(w_sub[c]);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_H_SUB(info,c : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_H_SUB:=info^.(h_sub[c]);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_SUB_SCALE(scale,val : longint) : longint;
begin
  GST_VIDEO_SUB_SCALE:=-((-(Tgint(val))) shr scale);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_SCALE_WIDTH(info,c,w : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_SCALE_WIDTH:=GST_VIDEO_SUB_SCALE(info^.(w_sub[c]),w);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_SCALE_HEIGHT(info,c,h : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_SCALE_HEIGHT:=GST_VIDEO_SUB_SCALE(info^.(h_sub[c]),h);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_TILE_WIDTH(info,plane : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_TILE_WIDTH:=info^.((tile_info[plane]).width);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_TILE_HEIGHT(info,plane : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_TILE_HEIGHT:=info^.((tile_info[plane]).height);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FORMAT_INFO_TILE_STRIDE(info,plane : longint) : longint;
begin
  GST_VIDEO_FORMAT_INFO_TILE_STRIDE:=info^.((tile_info[plane]).stride);
end;


end.
