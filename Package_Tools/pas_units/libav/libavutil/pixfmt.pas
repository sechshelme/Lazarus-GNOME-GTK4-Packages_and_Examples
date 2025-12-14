unit pixfmt;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at>
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
{$ifndef AVUTIL_PIXFMT_H}
{$define AVUTIL_PIXFMT_H}
{*
 * @file
 * pixel format definitions
  }
{$include "libavutil/avconfig.h"}
{$include "version.h"}

const
  AVPALETTE_SIZE = 1024;  
  AVPALETTE_COUNT = 256;  
{*
 * Pixel format.
 *
 * @note
 * AV_PIX_FMT_RGB32 is handled in an endian-specific manner. An RGBA
 * color is put together as:
 *  (A << 24) | (R << 16) | (G << 8) | B
 * This is stored as BGRA on little-endian CPU architectures and ARGB on
 * big-endian CPUs.
 *
 * @note
 * If the resolution is not a multiple of the chroma subsampling factor
 * then the chroma plane resolution must be rounded up.
 *
 * @par
 * When the pixel format is palettized RGB32 (AV_PIX_FMT_PAL8), the palettized
 * image data is stored in AVFrame.data[0]. The palette is transported in
 * AVFrame.data[1], is 1024 bytes long (256 4-byte entries) and is
 * formatted the same as in AV_PIX_FMT_RGB32 described above (i.e., it is
 * also endian-specific). Note also that the individual RGB32 palette
 * components stored in AVFrame.data[1] should be in the range 0..255.
 * This is important as many custom PAL8 video codecs that were designed
 * to run on the IBM VGA graphics adapter use 6-bit palette components.
 *
 * @par
 * For all the 8 bits per pixel formats, an RGB32 palette is in data[1] like
 * for pal8. This palette is filled in automatically by the function
 * allocating the picture.
  }
{/< planar YUV 4:2:0, 12bpp, (1 Cr & Cb sample per 2x2 Y samples) }
{/< packed YUV 4:2:2, 16bpp, Y0 Cb Y1 Cr }
{/< packed RGB 8:8:8, 24bpp, RGBRGB... }
{/< packed RGB 8:8:8, 24bpp, BGRBGR... }
{/< planar YUV 4:2:2, 16bpp, (1 Cr & Cb sample per 2x1 Y samples) }
{/< planar YUV 4:4:4, 24bpp, (1 Cr & Cb sample per 1x1 Y samples) }
{/< planar YUV 4:1:0,  9bpp, (1 Cr & Cb sample per 4x4 Y samples) }
{/< planar YUV 4:1:1, 12bpp, (1 Cr & Cb sample per 4x1 Y samples) }
{/<        Y        ,  8bpp }
{/<        Y        ,  1bpp, 0 is white, 1 is black, in each byte pixels are ordered from the msb to the lsb }
{/<        Y        ,  1bpp, 0 is black, 1 is white, in each byte pixels are ordered from the msb to the lsb }
{/< 8 bits with AV_PIX_FMT_RGB32 palette }
{/< planar YUV 4:2:0, 12bpp, full scale (JPEG), deprecated in favor of AV_PIX_FMT_YUV420P and setting color_range }
{/< planar YUV 4:2:2, 16bpp, full scale (JPEG), deprecated in favor of AV_PIX_FMT_YUV422P and setting color_range }
{/< planar YUV 4:4:4, 24bpp, full scale (JPEG), deprecated in favor of AV_PIX_FMT_YUV444P and setting color_range }
{/< packed YUV 4:2:2, 16bpp, Cb Y0 Cr Y1 }
{/< packed YUV 4:1:1, 12bpp, Cb Y0 Y1 Cr Y2 Y3 }
{/< packed RGB 3:3:2,  8bpp, (msb)2B 3G 3R(lsb) }
{/< packed RGB 1:2:1 bitstream,  4bpp, (msb)1B 2G 1R(lsb), a byte contains two pixels, the first pixel in the byte is the one composed by the 4 msb bits }
{/< packed RGB 1:2:1,  8bpp, (msb)1B 2G 1R(lsb) }
{/< packed RGB 3:3:2,  8bpp, (msb)2R 3G 3B(lsb) }
{/< packed RGB 1:2:1 bitstream,  4bpp, (msb)1R 2G 1B(lsb), a byte contains two pixels, the first pixel in the byte is the one composed by the 4 msb bits }
{/< packed RGB 1:2:1,  8bpp, (msb)1R 2G 1B(lsb) }
{/< planar YUV 4:2:0, 12bpp, 1 plane for Y and 1 plane for the UV components, which are interleaved (first byte U and the following byte V) }
{/< as above, but U and V bytes are swapped }
{/< packed ARGB 8:8:8:8, 32bpp, ARGBARGB... }
{/< packed RGBA 8:8:8:8, 32bpp, RGBARGBA... }
{/< packed ABGR 8:8:8:8, 32bpp, ABGRABGR... }
{/< packed BGRA 8:8:8:8, 32bpp, BGRABGRA... }
{/<        Y        , 16bpp, big-endian }
{/<        Y        , 16bpp, little-endian }
{/< planar YUV 4:4:0 (1 Cr & Cb sample per 1x2 Y samples) }
{/< planar YUV 4:4:0 full scale (JPEG), deprecated in favor of AV_PIX_FMT_YUV440P and setting color_range }
{/< planar YUV 4:2:0, 20bpp, (1 Cr & Cb sample per 2x2 Y & A samples) }
{/< packed RGB 16:16:16, 48bpp, 16R, 16G, 16B, the 2-byte value for each R/G/B component is stored as big-endian }
{/< packed RGB 16:16:16, 48bpp, 16R, 16G, 16B, the 2-byte value for each R/G/B component is stored as little-endian }
{/< packed RGB 5:6:5, 16bpp, (msb)   5R 6G 5B(lsb), big-endian }
{/< packed RGB 5:6:5, 16bpp, (msb)   5R 6G 5B(lsb), little-endian }
{/< packed RGB 5:5:5, 16bpp, (msb)1X 5R 5G 5B(lsb), big-endian   , X=unused/undefined }
{/< packed RGB 5:5:5, 16bpp, (msb)1X 5R 5G 5B(lsb), little-endian, X=unused/undefined }
{/< packed BGR 5:6:5, 16bpp, (msb)   5B 6G 5R(lsb), big-endian }
{/< packed BGR 5:6:5, 16bpp, (msb)   5B 6G 5R(lsb), little-endian }
{/< packed BGR 5:5:5, 16bpp, (msb)1X 5B 5G 5R(lsb), big-endian   , X=unused/undefined }
{/< packed BGR 5:5:5, 16bpp, (msb)1X 5B 5G 5R(lsb), little-endian, X=unused/undefined }
{*
     *  Hardware acceleration through VA-API, data[3] contains a
     *  VASurfaceID.
      }
{/< planar YUV 4:2:0, 24bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian }
{/< planar YUV 4:2:0, 24bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian }
{/< planar YUV 4:2:2, 32bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian }
{/< planar YUV 4:2:2, 32bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian }
{/< planar YUV 4:4:4, 48bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian }
{/< planar YUV 4:4:4, 48bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian }
{/< HW decoding through DXVA2, Picture.data[3] contains a LPDIRECT3DSURFACE9 pointer }
{/< packed RGB 4:4:4, 16bpp, (msb)4X 4R 4G 4B(lsb), little-endian, X=unused/undefined }
{/< packed RGB 4:4:4, 16bpp, (msb)4X 4R 4G 4B(lsb), big-endian,    X=unused/undefined }
{/< packed BGR 4:4:4, 16bpp, (msb)4X 4B 4G 4R(lsb), little-endian, X=unused/undefined }
{/< packed BGR 4:4:4, 16bpp, (msb)4X 4B 4G 4R(lsb), big-endian,    X=unused/undefined }
{/< 8 bits gray, 8 bits alpha }
{/< alias for AV_PIX_FMT_YA8 }
{/< alias for AV_PIX_FMT_YA8 }
{/< packed RGB 16:16:16, 48bpp, 16B, 16G, 16R, the 2-byte value for each R/G/B component is stored as big-endian }
{/< packed RGB 16:16:16, 48bpp, 16B, 16G, 16R, the 2-byte value for each R/G/B component is stored as little-endian }
{*
     * The following 12 formats have the disadvantage of needing 1 format for each bit depth.
     * Notice that each 9/10 bits sample is stored in 16 bits with extra padding.
     * If you want to support multiple bit depths, then using AV_PIX_FMT_YUV420P16* with the bpp stored separately is better.
      }
{/< planar YUV 4:2:0, 13.5bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian }
{/< planar YUV 4:2:0, 13.5bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian }
{/< planar YUV 4:2:0, 15bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian }
{/< planar YUV 4:2:0, 15bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian }
{/< planar YUV 4:2:2, 20bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian }
{/< planar YUV 4:2:2, 20bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian }
{/< planar YUV 4:4:4, 27bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian }
{/< planar YUV 4:4:4, 27bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian }
{/< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian }
{/< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian }
{/< planar YUV 4:2:2, 18bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian }
{/< planar YUV 4:2:2, 18bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian }
{/< planar GBR 4:4:4 24bpp }
{ alias for #AV_PIX_FMT_GBRP }
{/< planar GBR 4:4:4 27bpp, big-endian }
{/< planar GBR 4:4:4 27bpp, little-endian }
{/< planar GBR 4:4:4 30bpp, big-endian }
{/< planar GBR 4:4:4 30bpp, little-endian }
{/< planar GBR 4:4:4 48bpp, big-endian }
{/< planar GBR 4:4:4 48bpp, little-endian }
{/< planar YUV 4:2:2 24bpp, (1 Cr & Cb sample per 2x1 Y & A samples) }
{/< planar YUV 4:4:4 32bpp, (1 Cr & Cb sample per 1x1 Y & A samples) }
{/< planar YUV 4:2:0 22.5bpp, (1 Cr & Cb sample per 2x2 Y & A samples), big-endian }
{/< planar YUV 4:2:0 22.5bpp, (1 Cr & Cb sample per 2x2 Y & A samples), little-endian }
{/< planar YUV 4:2:2 27bpp, (1 Cr & Cb sample per 2x1 Y & A samples), big-endian }
{/< planar YUV 4:2:2 27bpp, (1 Cr & Cb sample per 2x1 Y & A samples), little-endian }
{/< planar YUV 4:4:4 36bpp, (1 Cr & Cb sample per 1x1 Y & A samples), big-endian }
{/< planar YUV 4:4:4 36bpp, (1 Cr & Cb sample per 1x1 Y & A samples), little-endian }
{/< planar YUV 4:2:0 25bpp, (1 Cr & Cb sample per 2x2 Y & A samples, big-endian) }
{/< planar YUV 4:2:0 25bpp, (1 Cr & Cb sample per 2x2 Y & A samples, little-endian) }
{/< planar YUV 4:2:2 30bpp, (1 Cr & Cb sample per 2x1 Y & A samples, big-endian) }
{/< planar YUV 4:2:2 30bpp, (1 Cr & Cb sample per 2x1 Y & A samples, little-endian) }
{/< planar YUV 4:4:4 40bpp, (1 Cr & Cb sample per 1x1 Y & A samples, big-endian) }
{/< planar YUV 4:4:4 40bpp, (1 Cr & Cb sample per 1x1 Y & A samples, little-endian) }
{/< planar YUV 4:2:0 40bpp, (1 Cr & Cb sample per 2x2 Y & A samples, big-endian) }
{/< planar YUV 4:2:0 40bpp, (1 Cr & Cb sample per 2x2 Y & A samples, little-endian) }
{/< planar YUV 4:2:2 48bpp, (1 Cr & Cb sample per 2x1 Y & A samples, big-endian) }
{/< planar YUV 4:2:2 48bpp, (1 Cr & Cb sample per 2x1 Y & A samples, little-endian) }
{/< planar YUV 4:4:4 64bpp, (1 Cr & Cb sample per 1x1 Y & A samples, big-endian) }
{/< planar YUV 4:4:4 64bpp, (1 Cr & Cb sample per 1x1 Y & A samples, little-endian) }
{/< HW acceleration through VDPAU, Picture.data[3] contains a VdpVideoSurface }
{/< packed XYZ 4:4:4, 36 bpp, (msb) 12X, 12Y, 12Z (lsb), the 2-byte value for each X/Y/Z is stored as little-endian, the 4 lower bits are set to 0 }
{/< packed XYZ 4:4:4, 36 bpp, (msb) 12X, 12Y, 12Z (lsb), the 2-byte value for each X/Y/Z is stored as big-endian, the 4 lower bits are set to 0 }
{/< interleaved chroma YUV 4:2:2, 16bpp, (1 Cr & Cb sample per 2x1 Y samples) }
{/< interleaved chroma YUV 4:2:2, 20bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian }
{/< interleaved chroma YUV 4:2:2, 20bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian }
{/< packed RGBA 16:16:16:16, 64bpp, 16R, 16G, 16B, 16A, the 2-byte value for each R/G/B/A component is stored as big-endian }
{/< packed RGBA 16:16:16:16, 64bpp, 16R, 16G, 16B, 16A, the 2-byte value for each R/G/B/A component is stored as little-endian }
{/< packed RGBA 16:16:16:16, 64bpp, 16B, 16G, 16R, 16A, the 2-byte value for each R/G/B/A component is stored as big-endian }
{/< packed RGBA 16:16:16:16, 64bpp, 16B, 16G, 16R, 16A, the 2-byte value for each R/G/B/A component is stored as little-endian }
{/< packed YUV 4:2:2, 16bpp, Y0 Cr Y1 Cb }
{/< 16 bits gray, 16 bits alpha (big-endian) }
{/< 16 bits gray, 16 bits alpha (little-endian) }
{/< planar GBRA 4:4:4:4 32bpp }
{/< planar GBRA 4:4:4:4 64bpp, big-endian }
{/< planar GBRA 4:4:4:4 64bpp, little-endian }
{*
     * HW acceleration through QSV, data[3] contains a pointer to the
     * mfxFrameSurface1 structure.
     *
     * Before FFmpeg 5.0:
     * mfxFrameSurface1.Data.MemId contains a pointer when importing
     * the following frames as QSV frames:
     *
     * VAAPI:
     * mfxFrameSurface1.Data.MemId contains a pointer to VASurfaceID
     *
     * DXVA2:
     * mfxFrameSurface1.Data.MemId contains a pointer to IDirect3DSurface9
     *
     * FFmpeg 5.0 and above:
     * mfxFrameSurface1.Data.MemId contains a pointer to the mfxHDLPair
     * structure when importing the following frames as QSV frames:
     *
     * VAAPI:
     * mfxHDLPair.first contains a VASurfaceID pointer.
     * mfxHDLPair.second is always MFX_INFINITE.
     *
     * DXVA2:
     * mfxHDLPair.first contains IDirect3DSurface9 pointer.
     * mfxHDLPair.second is always MFX_INFINITE.
     *
     * D3D11:
     * mfxHDLPair.first contains a ID3D11Texture2D pointer.
     * mfxHDLPair.second contains the texture array index of the frame if the
     * ID3D11Texture2D is an array texture, or always MFX_INFINITE if it is a
     * normal texture.
      }
{*
     * HW acceleration though MMAL, data[3] contains a pointer to the
     * MMAL_BUFFER_HEADER_T structure.
      }
{/< HW decoding through Direct3D11 via old API, Picture.data[3] contains a ID3D11VideoDecoderOutputView pointer }
{*
     * HW acceleration through CUDA. data[i] contain CUdeviceptr pointers
     * exactly as for system memory frames.
      }
{/< packed RGB 8:8:8, 32bpp, XRGBXRGB...   X=unused/undefined }
{/< packed RGB 8:8:8, 32bpp, RGBXRGBX...   X=unused/undefined }
{/< packed BGR 8:8:8, 32bpp, XBGRXBGR...   X=unused/undefined }
{/< packed BGR 8:8:8, 32bpp, BGRXBGRX...   X=unused/undefined }
{/< planar YUV 4:2:0,18bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian }
{/< planar YUV 4:2:0,18bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian }
{/< planar YUV 4:2:0,21bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian }
{/< planar YUV 4:2:0,21bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian }
{/< planar YUV 4:2:2,24bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian }
{/< planar YUV 4:2:2,24bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian }
{/< planar YUV 4:2:2,28bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian }
{/< planar YUV 4:2:2,28bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian }
{/< planar YUV 4:4:4,36bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian }
{/< planar YUV 4:4:4,36bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian }
{/< planar YUV 4:4:4,42bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian }
{/< planar YUV 4:4:4,42bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian }
{/< planar GBR 4:4:4 36bpp, big-endian }
{/< planar GBR 4:4:4 36bpp, little-endian }
{/< planar GBR 4:4:4 42bpp, big-endian }
{/< planar GBR 4:4:4 42bpp, little-endian }
{/< planar YUV 4:1:1, 12bpp, (1 Cr & Cb sample per 4x1 Y samples) full scale (JPEG), deprecated in favor of AV_PIX_FMT_YUV411P and setting color_range }
{/< bayer, BGBG..(odd line), GRGR..(even line), 8-bit samples }
{/< bayer, RGRG..(odd line), GBGB..(even line), 8-bit samples }
{/< bayer, GBGB..(odd line), RGRG..(even line), 8-bit samples }
{/< bayer, GRGR..(odd line), BGBG..(even line), 8-bit samples }
{/< bayer, BGBG..(odd line), GRGR..(even line), 16-bit samples, little-endian }
{/< bayer, BGBG..(odd line), GRGR..(even line), 16-bit samples, big-endian }
{/< bayer, RGRG..(odd line), GBGB..(even line), 16-bit samples, little-endian }
{/< bayer, RGRG..(odd line), GBGB..(even line), 16-bit samples, big-endian }
{/< bayer, GBGB..(odd line), RGRG..(even line), 16-bit samples, little-endian }
{/< bayer, GBGB..(odd line), RGRG..(even line), 16-bit samples, big-endian }
{/< bayer, GRGR..(odd line), BGBG..(even line), 16-bit samples, little-endian }
{/< bayer, GRGR..(odd line), BGBG..(even line), 16-bit samples, big-endian }
{$if FF_API_XVMC}
{/< XVideo Motion Acceleration via common packet passing }
{$endif}
{/< planar YUV 4:4:0,20bpp, (1 Cr & Cb sample per 1x2 Y samples), little-endian }
{/< planar YUV 4:4:0,20bpp, (1 Cr & Cb sample per 1x2 Y samples), big-endian }
{/< planar YUV 4:4:0,24bpp, (1 Cr & Cb sample per 1x2 Y samples), little-endian }
{/< planar YUV 4:4:0,24bpp, (1 Cr & Cb sample per 1x2 Y samples), big-endian }
{/< packed AYUV 4:4:4,64bpp (1 Cr & Cb sample per 1x1 Y & A samples), little-endian }
{/< packed AYUV 4:4:4,64bpp (1 Cr & Cb sample per 1x1 Y & A samples), big-endian }
{/< hardware decoding through Videotoolbox }
{/< like NV12, with 10bpp per component, data in the high bits, zeros in the low bits, little-endian }
{/< like NV12, with 10bpp per component, data in the high bits, zeros in the low bits, big-endian }
{/< planar GBR 4:4:4:4 48bpp, big-endian }
{/< planar GBR 4:4:4:4 48bpp, little-endian }
{/< planar GBR 4:4:4:4 40bpp, big-endian }
{/< planar GBR 4:4:4:4 40bpp, little-endian }
{/< hardware decoding through MediaCodec }
{/<        Y        , 12bpp, big-endian }
{/<        Y        , 12bpp, little-endian }
{/<        Y        , 10bpp, big-endian }
{/<        Y        , 10bpp, little-endian }
{/< like NV12, with 16bpp per component, little-endian }
{/< like NV12, with 16bpp per component, big-endian }
{*
     * Hardware surfaces for Direct3D11.
     *
     * This is preferred over the legacy AV_PIX_FMT_D3D11VA_VLD. The new D3D11
     * hwaccel API and filtering support AV_PIX_FMT_D3D11 only.
     *
     * data[0] contains a ID3D11Texture2D pointer, and data[1] contains the
     * texture array index of the frame as intptr_t if the ID3D11Texture2D is
     * an array texture (or always 0 if it's a normal texture).
      }
{/<        Y        , 9bpp, big-endian }
{/<        Y        , 9bpp, little-endian }
{/< IEEE-754 single precision planar GBR 4:4:4,     96bpp, big-endian }
{/< IEEE-754 single precision planar GBR 4:4:4,     96bpp, little-endian }
{/< IEEE-754 single precision planar GBRA 4:4:4:4, 128bpp, big-endian }
{/< IEEE-754 single precision planar GBRA 4:4:4:4, 128bpp, little-endian }
{*
     * DRM-managed buffers exposed through PRIME buffer sharing.
     *
     * data[0] points to an AVDRMFrameDescriptor.
      }
{*
     * Hardware surfaces for OpenCL.
     *
     * data[i] contain 2D image objects (typed in C as cl_mem, used
     * in OpenCL as image2d_t) for each plane of the surface.
      }
{/<        Y        , 14bpp, big-endian }
{/<        Y        , 14bpp, little-endian }
{/< IEEE-754 single precision Y, 32bpp, big-endian }
{/< IEEE-754 single precision Y, 32bpp, little-endian }
{/< planar YUV 4:2:2,24bpp, (1 Cr & Cb sample per 2x1 Y samples), 12b alpha, big-endian }
{/< planar YUV 4:2:2,24bpp, (1 Cr & Cb sample per 2x1 Y samples), 12b alpha, little-endian }
{/< planar YUV 4:4:4,36bpp, (1 Cr & Cb sample per 1x1 Y samples), 12b alpha, big-endian }
{/< planar YUV 4:4:4,36bpp, (1 Cr & Cb sample per 1x1 Y samples), 12b alpha, little-endian }
{/< planar YUV 4:4:4, 24bpp, 1 plane for Y and 1 plane for the UV components, which are interleaved (first byte U and the following byte V) }
{/< as above, but U and V bytes are swapped }
{*
     * Vulkan hardware images.
     *
     * data[0] points to an AVVkFrame
      }
{/< packed YUV 4:2:2 like YUYV422, 20bpp, data in the high bits, big-endian }
{/< packed YUV 4:2:2 like YUYV422, 20bpp, data in the high bits, little-endian }
{/< packed RGB 10:10:10, 30bpp, (msb)2X 10R 10G 10B(lsb), little-endian, X=unused/undefined }
{/< packed RGB 10:10:10, 30bpp, (msb)2X 10R 10G 10B(lsb), big-endian, X=unused/undefined }
{/< packed BGR 10:10:10, 30bpp, (msb)2X 10B 10G 10R(lsb), little-endian, X=unused/undefined }
{/< packed BGR 10:10:10, 30bpp, (msb)2X 10B 10G 10R(lsb), big-endian, X=unused/undefined }
{/< interleaved chroma YUV 4:2:2, 20bpp, data in the high bits, big-endian }
{/< interleaved chroma YUV 4:2:2, 20bpp, data in the high bits, little-endian }
{/< interleaved chroma YUV 4:4:4, 30bpp, data in the high bits, big-endian }
{/< interleaved chroma YUV 4:4:4, 30bpp, data in the high bits, little-endian }
{/< interleaved chroma YUV 4:2:2, 32bpp, big-endian }
{/< interleaved chroma YUV 4:2:2, 32bpp, little-endian }
{/< interleaved chroma YUV 4:4:4, 48bpp, big-endian }
{/< interleaved chroma YUV 4:4:4, 48bpp, little-endian }
{/< packed VUYA 4:4:4, 32bpp, VUYAVUYA... }
{/< IEEE-754 half precision packed RGBA 16:16:16:16, 64bpp, RGBARGBA..., big-endian }
{/< IEEE-754 half precision packed RGBA 16:16:16:16, 64bpp, RGBARGBA..., little-endian }
{/< packed VUYX 4:4:4, 32bpp, Variant of VUYA where alpha channel is left undefined }
{/< like NV12, with 12bpp per component, data in the high bits, zeros in the low bits, little-endian }
{/< like NV12, with 12bpp per component, data in the high bits, zeros in the low bits, big-endian }
{/< packed YUV 4:2:2 like YUYV422, 24bpp, data in the high bits, zeros in the low bits, big-endian }
{/< packed YUV 4:2:2 like YUYV422, 24bpp, data in the high bits, zeros in the low bits, little-endian }
{/< packed XVYU 4:4:4, 32bpp, (msb)2X 10V 10Y 10U(lsb), big-endian, variant of Y410 where alpha channel is left undefined }
{/< packed XVYU 4:4:4, 32bpp, (msb)2X 10V 10Y 10U(lsb), little-endian, variant of Y410 where alpha channel is left undefined }
{/< packed XVYU 4:4:4, 48bpp, data in the high bits, zeros in the low bits, big-endian, variant of Y412 where alpha channel is left undefined }
{/< packed XVYU 4:4:4, 48bpp, data in the high bits, zeros in the low bits, little-endian, variant of Y412 where alpha channel is left undefined }
{/< IEEE-754 single precision packed RGB 32:32:32, 96bpp, RGBRGB..., big-endian }
{/< IEEE-754 single precision packed RGB 32:32:32, 96bpp, RGBRGB..., little-endian }
{/< IEEE-754 single precision packed RGBA 32:32:32:32, 128bpp, RGBARGBA..., big-endian }
{/< IEEE-754 single precision packed RGBA 32:32:32:32, 128bpp, RGBARGBA..., little-endian }
{/< interleaved chroma YUV 4:2:2, 24bpp, data in the high bits, big-endian }
{/< interleaved chroma YUV 4:2:2, 24bpp, data in the high bits, little-endian }
{/< interleaved chroma YUV 4:4:4, 36bpp, data in the high bits, big-endian }
{/< interleaved chroma YUV 4:4:4, 36bpp, data in the high bits, little-endian }
{/< planar GBR 4:4:4:4 56bpp, big-endian }
{/< planar GBR 4:4:4:4 56bpp, little-endian }
{/< number of pixel formats, DO NOT USE THIS if you want to link with shared libav* because the number of formats might differ between versions }
type
  TAVPixelFormat =  Longint;
  Const
    AV_PIX_FMT_NONE = -(1);
    AV_PIX_FMT_YUV420P = (-(1))+1;
    AV_PIX_FMT_YUYV422 = (-(1))+2;
    AV_PIX_FMT_RGB24 = (-(1))+3;
    AV_PIX_FMT_BGR24 = (-(1))+4;
    AV_PIX_FMT_YUV422P = (-(1))+5;
    AV_PIX_FMT_YUV444P = (-(1))+6;
    AV_PIX_FMT_YUV410P = (-(1))+7;
    AV_PIX_FMT_YUV411P = (-(1))+8;
    AV_PIX_FMT_GRAY8 = (-(1))+9;
    AV_PIX_FMT_MONOWHITE = (-(1))+10;
    AV_PIX_FMT_MONOBLACK = (-(1))+11;
    AV_PIX_FMT_PAL8 = (-(1))+12;
    AV_PIX_FMT_YUVJ420P = (-(1))+13;
    AV_PIX_FMT_YUVJ422P = (-(1))+14;
    AV_PIX_FMT_YUVJ444P = (-(1))+15;
    AV_PIX_FMT_UYVY422 = (-(1))+16;
    AV_PIX_FMT_UYYVYY411 = (-(1))+17;
    AV_PIX_FMT_BGR8 = (-(1))+18;
    AV_PIX_FMT_BGR4 = (-(1))+19;
    AV_PIX_FMT_BGR4_BYTE = (-(1))+20;
    AV_PIX_FMT_RGB8 = (-(1))+21;
    AV_PIX_FMT_RGB4 = (-(1))+22;
    AV_PIX_FMT_RGB4_BYTE = (-(1))+23;
    AV_PIX_FMT_NV12 = (-(1))+24;
    AV_PIX_FMT_NV21 = (-(1))+25;
    AV_PIX_FMT_ARGB = (-(1))+26;
    AV_PIX_FMT_RGBA = (-(1))+27;
    AV_PIX_FMT_ABGR = (-(1))+28;
    AV_PIX_FMT_BGRA = (-(1))+29;
    AV_PIX_FMT_GRAY16BE = (-(1))+30;
    AV_PIX_FMT_GRAY16LE = (-(1))+31;
    AV_PIX_FMT_YUV440P = (-(1))+32;
    AV_PIX_FMT_YUVJ440P = (-(1))+33;
    AV_PIX_FMT_YUVA420P = (-(1))+34;
    AV_PIX_FMT_RGB48BE = (-(1))+35;
    AV_PIX_FMT_RGB48LE = (-(1))+36;
    AV_PIX_FMT_RGB565BE = (-(1))+37;
    AV_PIX_FMT_RGB565LE = (-(1))+38;
    AV_PIX_FMT_RGB555BE = (-(1))+39;
    AV_PIX_FMT_RGB555LE = (-(1))+40;
    AV_PIX_FMT_BGR565BE = (-(1))+41;
    AV_PIX_FMT_BGR565LE = (-(1))+42;
    AV_PIX_FMT_BGR555BE = (-(1))+43;
    AV_PIX_FMT_BGR555LE = (-(1))+44;
    AV_PIX_FMT_VAAPI = (-(1))+45;
    AV_PIX_FMT_YUV420P16LE = (-(1))+46;
    AV_PIX_FMT_YUV420P16BE = (-(1))+47;
    AV_PIX_FMT_YUV422P16LE = (-(1))+48;
    AV_PIX_FMT_YUV422P16BE = (-(1))+49;
    AV_PIX_FMT_YUV444P16LE = (-(1))+50;
    AV_PIX_FMT_YUV444P16BE = (-(1))+51;
    AV_PIX_FMT_DXVA2_VLD = (-(1))+52;
    AV_PIX_FMT_RGB444LE = (-(1))+53;
    AV_PIX_FMT_RGB444BE = (-(1))+54;
    AV_PIX_FMT_BGR444LE = (-(1))+55;
    AV_PIX_FMT_BGR444BE = (-(1))+56;
    AV_PIX_FMT_YA8 = (-(1))+57;
    AV_PIX_FMT_Y400A = AV_PIX_FMT_YA8;
    AV_PIX_FMT_GRAY8A = AV_PIX_FMT_YA8;
    AV_PIX_FMT_BGR48BE = (AV_PIX_FMT_YA8)+1;
    AV_PIX_FMT_BGR48LE = (AV_PIX_FMT_YA8)+2;
    AV_PIX_FMT_YUV420P9BE = (AV_PIX_FMT_YA8)+3;
    AV_PIX_FMT_YUV420P9LE = (AV_PIX_FMT_YA8)+4;
    AV_PIX_FMT_YUV420P10BE = (AV_PIX_FMT_YA8)+5;
    AV_PIX_FMT_YUV420P10LE = (AV_PIX_FMT_YA8)+6;
    AV_PIX_FMT_YUV422P10BE = (AV_PIX_FMT_YA8)+7;
    AV_PIX_FMT_YUV422P10LE = (AV_PIX_FMT_YA8)+8;
    AV_PIX_FMT_YUV444P9BE = (AV_PIX_FMT_YA8)+9;
    AV_PIX_FMT_YUV444P9LE = (AV_PIX_FMT_YA8)+10;
    AV_PIX_FMT_YUV444P10BE = (AV_PIX_FMT_YA8)+11;
    AV_PIX_FMT_YUV444P10LE = (AV_PIX_FMT_YA8)+12;
    AV_PIX_FMT_YUV422P9BE = (AV_PIX_FMT_YA8)+13;
    AV_PIX_FMT_YUV422P9LE = (AV_PIX_FMT_YA8)+14;
    AV_PIX_FMT_GBRP = (AV_PIX_FMT_YA8)+15;
    AV_PIX_FMT_GBR24P = AV_PIX_FMT_GBRP;
    AV_PIX_FMT_GBRP9BE = (AV_PIX_FMT_GBRP)+1;
    AV_PIX_FMT_GBRP9LE = (AV_PIX_FMT_GBRP)+2;
    AV_PIX_FMT_GBRP10BE = (AV_PIX_FMT_GBRP)+3;
    AV_PIX_FMT_GBRP10LE = (AV_PIX_FMT_GBRP)+4;
    AV_PIX_FMT_GBRP16BE = (AV_PIX_FMT_GBRP)+5;
    AV_PIX_FMT_GBRP16LE = (AV_PIX_FMT_GBRP)+6;
    AV_PIX_FMT_YUVA422P = (AV_PIX_FMT_GBRP)+7;
    AV_PIX_FMT_YUVA444P = (AV_PIX_FMT_GBRP)+8;
    AV_PIX_FMT_YUVA420P9BE = (AV_PIX_FMT_GBRP)+9;
    AV_PIX_FMT_YUVA420P9LE = (AV_PIX_FMT_GBRP)+10;
    AV_PIX_FMT_YUVA422P9BE = (AV_PIX_FMT_GBRP)+11;
    AV_PIX_FMT_YUVA422P9LE = (AV_PIX_FMT_GBRP)+12;
    AV_PIX_FMT_YUVA444P9BE = (AV_PIX_FMT_GBRP)+13;
    AV_PIX_FMT_YUVA444P9LE = (AV_PIX_FMT_GBRP)+14;
    AV_PIX_FMT_YUVA420P10BE = (AV_PIX_FMT_GBRP)+15;
    AV_PIX_FMT_YUVA420P10LE = (AV_PIX_FMT_GBRP)+16;
    AV_PIX_FMT_YUVA422P10BE = (AV_PIX_FMT_GBRP)+17;
    AV_PIX_FMT_YUVA422P10LE = (AV_PIX_FMT_GBRP)+18;
    AV_PIX_FMT_YUVA444P10BE = (AV_PIX_FMT_GBRP)+19;
    AV_PIX_FMT_YUVA444P10LE = (AV_PIX_FMT_GBRP)+20;
    AV_PIX_FMT_YUVA420P16BE = (AV_PIX_FMT_GBRP)+21;
    AV_PIX_FMT_YUVA420P16LE = (AV_PIX_FMT_GBRP)+22;
    AV_PIX_FMT_YUVA422P16BE = (AV_PIX_FMT_GBRP)+23;
    AV_PIX_FMT_YUVA422P16LE = (AV_PIX_FMT_GBRP)+24;
    AV_PIX_FMT_YUVA444P16BE = (AV_PIX_FMT_GBRP)+25;
    AV_PIX_FMT_YUVA444P16LE = (AV_PIX_FMT_GBRP)+26;
    AV_PIX_FMT_VDPAU = (AV_PIX_FMT_GBRP)+27;
    AV_PIX_FMT_XYZ12LE = (AV_PIX_FMT_GBRP)+28;
    AV_PIX_FMT_XYZ12BE = (AV_PIX_FMT_GBRP)+29;
    AV_PIX_FMT_NV16 = (AV_PIX_FMT_GBRP)+30;
    AV_PIX_FMT_NV20LE = (AV_PIX_FMT_GBRP)+31;
    AV_PIX_FMT_NV20BE = (AV_PIX_FMT_GBRP)+32;
    AV_PIX_FMT_RGBA64BE = (AV_PIX_FMT_GBRP)+33;
    AV_PIX_FMT_RGBA64LE = (AV_PIX_FMT_GBRP)+34;
    AV_PIX_FMT_BGRA64BE = (AV_PIX_FMT_GBRP)+35;
    AV_PIX_FMT_BGRA64LE = (AV_PIX_FMT_GBRP)+36;
    AV_PIX_FMT_YVYU422 = (AV_PIX_FMT_GBRP)+37;
    AV_PIX_FMT_YA16BE = (AV_PIX_FMT_GBRP)+38;
    AV_PIX_FMT_YA16LE = (AV_PIX_FMT_GBRP)+39;
    AV_PIX_FMT_GBRAP = (AV_PIX_FMT_GBRP)+40;
    AV_PIX_FMT_GBRAP16BE = (AV_PIX_FMT_GBRP)+41;
    AV_PIX_FMT_GBRAP16LE = (AV_PIX_FMT_GBRP)+42;
    AV_PIX_FMT_QSV = (AV_PIX_FMT_GBRP)+43;
    AV_PIX_FMT_MMAL = (AV_PIX_FMT_GBRP)+44;
    AV_PIX_FMT_D3D11VA_VLD = (AV_PIX_FMT_GBRP)+45;
    AV_PIX_FMT_CUDA = (AV_PIX_FMT_GBRP)+46;
    AV_PIX_FMT_0RGB = (AV_PIX_FMT_GBRP)+47;
    AV_PIX_FMT_RGB0 = (AV_PIX_FMT_GBRP)+48;
    AV_PIX_FMT_0BGR = (AV_PIX_FMT_GBRP)+49;
    AV_PIX_FMT_BGR0 = (AV_PIX_FMT_GBRP)+50;
    AV_PIX_FMT_YUV420P12BE = (AV_PIX_FMT_GBRP)+51;
    AV_PIX_FMT_YUV420P12LE = (AV_PIX_FMT_GBRP)+52;
    AV_PIX_FMT_YUV420P14BE = (AV_PIX_FMT_GBRP)+53;
    AV_PIX_FMT_YUV420P14LE = (AV_PIX_FMT_GBRP)+54;
    AV_PIX_FMT_YUV422P12BE = (AV_PIX_FMT_GBRP)+55;
    AV_PIX_FMT_YUV422P12LE = (AV_PIX_FMT_GBRP)+56;
    AV_PIX_FMT_YUV422P14BE = (AV_PIX_FMT_GBRP)+57;
    AV_PIX_FMT_YUV422P14LE = (AV_PIX_FMT_GBRP)+58;
    AV_PIX_FMT_YUV444P12BE = (AV_PIX_FMT_GBRP)+59;
    AV_PIX_FMT_YUV444P12LE = (AV_PIX_FMT_GBRP)+60;
    AV_PIX_FMT_YUV444P14BE = (AV_PIX_FMT_GBRP)+61;
    AV_PIX_FMT_YUV444P14LE = (AV_PIX_FMT_GBRP)+62;
    AV_PIX_FMT_GBRP12BE = (AV_PIX_FMT_GBRP)+63;
    AV_PIX_FMT_GBRP12LE = (AV_PIX_FMT_GBRP)+64;
    AV_PIX_FMT_GBRP14BE = (AV_PIX_FMT_GBRP)+65;
    AV_PIX_FMT_GBRP14LE = (AV_PIX_FMT_GBRP)+66;
    AV_PIX_FMT_YUVJ411P = (AV_PIX_FMT_GBRP)+67;
    AV_PIX_FMT_BAYER_BGGR8 = (AV_PIX_FMT_GBRP)+68;
    AV_PIX_FMT_BAYER_RGGB8 = (AV_PIX_FMT_GBRP)+69;
    AV_PIX_FMT_BAYER_GBRG8 = (AV_PIX_FMT_GBRP)+70;
    AV_PIX_FMT_BAYER_GRBG8 = (AV_PIX_FMT_GBRP)+71;
    AV_PIX_FMT_BAYER_BGGR16LE = (AV_PIX_FMT_GBRP)+72;
    AV_PIX_FMT_BAYER_BGGR16BE = (AV_PIX_FMT_GBRP)+73;
    AV_PIX_FMT_BAYER_RGGB16LE = (AV_PIX_FMT_GBRP)+74;
    AV_PIX_FMT_BAYER_RGGB16BE = (AV_PIX_FMT_GBRP)+75;
    AV_PIX_FMT_BAYER_GBRG16LE = (AV_PIX_FMT_GBRP)+76;
    AV_PIX_FMT_BAYER_GBRG16BE = (AV_PIX_FMT_GBRP)+77;
    AV_PIX_FMT_BAYER_GRBG16LE = (AV_PIX_FMT_GBRP)+78;
    AV_PIX_FMT_BAYER_GRBG16BE = (AV_PIX_FMT_GBRP)+79;
    AV_PIX_FMT_XVMC = (AV_PIX_FMT_GBRP)+80;
    AV_PIX_FMT_YUV440P10LE = (AV_PIX_FMT_GBRP)+81;
    AV_PIX_FMT_YUV440P10BE = (AV_PIX_FMT_GBRP)+82;
    AV_PIX_FMT_YUV440P12LE = (AV_PIX_FMT_GBRP)+83;
    AV_PIX_FMT_YUV440P12BE = (AV_PIX_FMT_GBRP)+84;
    AV_PIX_FMT_AYUV64LE = (AV_PIX_FMT_GBRP)+85;
    AV_PIX_FMT_AYUV64BE = (AV_PIX_FMT_GBRP)+86;
    AV_PIX_FMT_VIDEOTOOLBOX = (AV_PIX_FMT_GBRP)+87;
    AV_PIX_FMT_P010LE = (AV_PIX_FMT_GBRP)+88;
    AV_PIX_FMT_P010BE = (AV_PIX_FMT_GBRP)+89;
    AV_PIX_FMT_GBRAP12BE = (AV_PIX_FMT_GBRP)+90;
    AV_PIX_FMT_GBRAP12LE = (AV_PIX_FMT_GBRP)+91;
    AV_PIX_FMT_GBRAP10BE = (AV_PIX_FMT_GBRP)+92;
    AV_PIX_FMT_GBRAP10LE = (AV_PIX_FMT_GBRP)+93;
    AV_PIX_FMT_MEDIACODEC = (AV_PIX_FMT_GBRP)+94;
    AV_PIX_FMT_GRAY12BE = (AV_PIX_FMT_GBRP)+95;
    AV_PIX_FMT_GRAY12LE = (AV_PIX_FMT_GBRP)+96;
    AV_PIX_FMT_GRAY10BE = (AV_PIX_FMT_GBRP)+97;
    AV_PIX_FMT_GRAY10LE = (AV_PIX_FMT_GBRP)+98;
    AV_PIX_FMT_P016LE = (AV_PIX_FMT_GBRP)+99;
    AV_PIX_FMT_P016BE = (AV_PIX_FMT_GBRP)+100;
    AV_PIX_FMT_D3D11 = (AV_PIX_FMT_GBRP)+101;
    AV_PIX_FMT_GRAY9BE = (AV_PIX_FMT_GBRP)+102;
    AV_PIX_FMT_GRAY9LE = (AV_PIX_FMT_GBRP)+103;
    AV_PIX_FMT_GBRPF32BE = (AV_PIX_FMT_GBRP)+104;
    AV_PIX_FMT_GBRPF32LE = (AV_PIX_FMT_GBRP)+105;
    AV_PIX_FMT_GBRAPF32BE = (AV_PIX_FMT_GBRP)+106;
    AV_PIX_FMT_GBRAPF32LE = (AV_PIX_FMT_GBRP)+107;
    AV_PIX_FMT_DRM_PRIME = (AV_PIX_FMT_GBRP)+108;
    AV_PIX_FMT_OPENCL = (AV_PIX_FMT_GBRP)+109;
    AV_PIX_FMT_GRAY14BE = (AV_PIX_FMT_GBRP)+110;
    AV_PIX_FMT_GRAY14LE = (AV_PIX_FMT_GBRP)+111;
    AV_PIX_FMT_GRAYF32BE = (AV_PIX_FMT_GBRP)+112;
    AV_PIX_FMT_GRAYF32LE = (AV_PIX_FMT_GBRP)+113;
    AV_PIX_FMT_YUVA422P12BE = (AV_PIX_FMT_GBRP)+114;
    AV_PIX_FMT_YUVA422P12LE = (AV_PIX_FMT_GBRP)+115;
    AV_PIX_FMT_YUVA444P12BE = (AV_PIX_FMT_GBRP)+116;
    AV_PIX_FMT_YUVA444P12LE = (AV_PIX_FMT_GBRP)+117;
    AV_PIX_FMT_NV24 = (AV_PIX_FMT_GBRP)+118;
    AV_PIX_FMT_NV42 = (AV_PIX_FMT_GBRP)+119;
    AV_PIX_FMT_VULKAN = (AV_PIX_FMT_GBRP)+120;
    AV_PIX_FMT_Y210BE = (AV_PIX_FMT_GBRP)+121;
    AV_PIX_FMT_Y210LE = (AV_PIX_FMT_GBRP)+122;
    AV_PIX_FMT_X2RGB10LE = (AV_PIX_FMT_GBRP)+123;
    AV_PIX_FMT_X2RGB10BE = (AV_PIX_FMT_GBRP)+124;
    AV_PIX_FMT_X2BGR10LE = (AV_PIX_FMT_GBRP)+125;
    AV_PIX_FMT_X2BGR10BE = (AV_PIX_FMT_GBRP)+126;
    AV_PIX_FMT_P210BE = (AV_PIX_FMT_GBRP)+127;
    AV_PIX_FMT_P210LE = (AV_PIX_FMT_GBRP)+128;
    AV_PIX_FMT_P410BE = (AV_PIX_FMT_GBRP)+129;
    AV_PIX_FMT_P410LE = (AV_PIX_FMT_GBRP)+130;
    AV_PIX_FMT_P216BE = (AV_PIX_FMT_GBRP)+131;
    AV_PIX_FMT_P216LE = (AV_PIX_FMT_GBRP)+132;
    AV_PIX_FMT_P416BE = (AV_PIX_FMT_GBRP)+133;
    AV_PIX_FMT_P416LE = (AV_PIX_FMT_GBRP)+134;
    AV_PIX_FMT_VUYA = (AV_PIX_FMT_GBRP)+135;
    AV_PIX_FMT_RGBAF16BE = (AV_PIX_FMT_GBRP)+136;
    AV_PIX_FMT_RGBAF16LE = (AV_PIX_FMT_GBRP)+137;
    AV_PIX_FMT_VUYX = (AV_PIX_FMT_GBRP)+138;
    AV_PIX_FMT_P012LE = (AV_PIX_FMT_GBRP)+139;
    AV_PIX_FMT_P012BE = (AV_PIX_FMT_GBRP)+140;
    AV_PIX_FMT_Y212BE = (AV_PIX_FMT_GBRP)+141;
    AV_PIX_FMT_Y212LE = (AV_PIX_FMT_GBRP)+142;
    AV_PIX_FMT_XV30BE = (AV_PIX_FMT_GBRP)+143;
    AV_PIX_FMT_XV30LE = (AV_PIX_FMT_GBRP)+144;
    AV_PIX_FMT_XV36BE = (AV_PIX_FMT_GBRP)+145;
    AV_PIX_FMT_XV36LE = (AV_PIX_FMT_GBRP)+146;
    AV_PIX_FMT_RGBF32BE = (AV_PIX_FMT_GBRP)+147;
    AV_PIX_FMT_RGBF32LE = (AV_PIX_FMT_GBRP)+148;
    AV_PIX_FMT_RGBAF32BE = (AV_PIX_FMT_GBRP)+149;
    AV_PIX_FMT_RGBAF32LE = (AV_PIX_FMT_GBRP)+150;
    AV_PIX_FMT_P212BE = (AV_PIX_FMT_GBRP)+151;
    AV_PIX_FMT_P212LE = (AV_PIX_FMT_GBRP)+152;
    AV_PIX_FMT_P412BE = (AV_PIX_FMT_GBRP)+153;
    AV_PIX_FMT_P412LE = (AV_PIX_FMT_GBRP)+154;
    AV_PIX_FMT_GBRAP14BE = (AV_PIX_FMT_GBRP)+155;
    AV_PIX_FMT_GBRAP14LE = (AV_PIX_FMT_GBRP)+156;
    AV_PIX_FMT_NB = (AV_PIX_FMT_GBRP)+157;

{xxxxxxxxxx
#if AV_HAVE_BIGENDIAN
#   define AV_PIX_FMT_NE(be, le) AV_PIX_FMT_##be
#else
#   define AV_PIX_FMT_NE(be, le) AV_PIX_FMT_##le
#endif

#define AV_PIX_FMT_RGB32   AV_PIX_FMT_NE(ARGB, BGRA)
#define AV_PIX_FMT_RGB32_1 AV_PIX_FMT_NE(RGBA, ABGR)
#define AV_PIX_FMT_BGR32   AV_PIX_FMT_NE(ABGR, RGBA)
#define AV_PIX_FMT_BGR32_1 AV_PIX_FMT_NE(BGRA, ARGB)
#define AV_PIX_FMT_0RGB32  AV_PIX_FMT_NE(0RGB, BGR0)
#define AV_PIX_FMT_0BGR32  AV_PIX_FMT_NE(0BGR, RGB0)

#define AV_PIX_FMT_GRAY9  AV_PIX_FMT_NE(GRAY9BE,  GRAY9LE)
#define AV_PIX_FMT_GRAY10 AV_PIX_FMT_NE(GRAY10BE, GRAY10LE)
#define AV_PIX_FMT_GRAY12 AV_PIX_FMT_NE(GRAY12BE, GRAY12LE)
#define AV_PIX_FMT_GRAY14 AV_PIX_FMT_NE(GRAY14BE, GRAY14LE)
#define AV_PIX_FMT_GRAY16 AV_PIX_FMT_NE(GRAY16BE, GRAY16LE)
#define AV_PIX_FMT_YA16   AV_PIX_FMT_NE(YA16BE,   YA16LE)
#define AV_PIX_FMT_RGB48  AV_PIX_FMT_NE(RGB48BE,  RGB48LE)
#define AV_PIX_FMT_RGB565 AV_PIX_FMT_NE(RGB565BE, RGB565LE)
#define AV_PIX_FMT_RGB555 AV_PIX_FMT_NE(RGB555BE, RGB555LE)
#define AV_PIX_FMT_RGB444 AV_PIX_FMT_NE(RGB444BE, RGB444LE)
#define AV_PIX_FMT_RGBA64 AV_PIX_FMT_NE(RGBA64BE, RGBA64LE)
#define AV_PIX_FMT_BGR48  AV_PIX_FMT_NE(BGR48BE,  BGR48LE)
#define AV_PIX_FMT_BGR565 AV_PIX_FMT_NE(BGR565BE, BGR565LE)
#define AV_PIX_FMT_BGR555 AV_PIX_FMT_NE(BGR555BE, BGR555LE)
#define AV_PIX_FMT_BGR444 AV_PIX_FMT_NE(BGR444BE, BGR444LE)
#define AV_PIX_FMT_BGRA64 AV_PIX_FMT_NE(BGRA64BE, BGRA64LE)

#define AV_PIX_FMT_YUV420P9  AV_PIX_FMT_NE(YUV420P9BE , YUV420P9LE)
#define AV_PIX_FMT_YUV422P9  AV_PIX_FMT_NE(YUV422P9BE , YUV422P9LE)
#define AV_PIX_FMT_YUV444P9  AV_PIX_FMT_NE(YUV444P9BE , YUV444P9LE)
#define AV_PIX_FMT_YUV420P10 AV_PIX_FMT_NE(YUV420P10BE, YUV420P10LE)
#define AV_PIX_FMT_YUV422P10 AV_PIX_FMT_NE(YUV422P10BE, YUV422P10LE)
#define AV_PIX_FMT_YUV440P10 AV_PIX_FMT_NE(YUV440P10BE, YUV440P10LE)
#define AV_PIX_FMT_YUV444P10 AV_PIX_FMT_NE(YUV444P10BE, YUV444P10LE)
#define AV_PIX_FMT_YUV420P12 AV_PIX_FMT_NE(YUV420P12BE, YUV420P12LE)
#define AV_PIX_FMT_YUV422P12 AV_PIX_FMT_NE(YUV422P12BE, YUV422P12LE)
#define AV_PIX_FMT_YUV440P12 AV_PIX_FMT_NE(YUV440P12BE, YUV440P12LE)
#define AV_PIX_FMT_YUV444P12 AV_PIX_FMT_NE(YUV444P12BE, YUV444P12LE)
#define AV_PIX_FMT_YUV420P14 AV_PIX_FMT_NE(YUV420P14BE, YUV420P14LE)
#define AV_PIX_FMT_YUV422P14 AV_PIX_FMT_NE(YUV422P14BE, YUV422P14LE)
#define AV_PIX_FMT_YUV444P14 AV_PIX_FMT_NE(YUV444P14BE, YUV444P14LE)
#define AV_PIX_FMT_YUV420P16 AV_PIX_FMT_NE(YUV420P16BE, YUV420P16LE)
#define AV_PIX_FMT_YUV422P16 AV_PIX_FMT_NE(YUV422P16BE, YUV422P16LE)
#define AV_PIX_FMT_YUV444P16 AV_PIX_FMT_NE(YUV444P16BE, YUV444P16LE)

#define AV_PIX_FMT_GBRP9     AV_PIX_FMT_NE(GBRP9BE ,    GBRP9LE)
#define AV_PIX_FMT_GBRP10    AV_PIX_FMT_NE(GBRP10BE,    GBRP10LE)
#define AV_PIX_FMT_GBRP12    AV_PIX_FMT_NE(GBRP12BE,    GBRP12LE)
#define AV_PIX_FMT_GBRP14    AV_PIX_FMT_NE(GBRP14BE,    GBRP14LE)
#define AV_PIX_FMT_GBRP16    AV_PIX_FMT_NE(GBRP16BE,    GBRP16LE)
#define AV_PIX_FMT_GBRAP10   AV_PIX_FMT_NE(GBRAP10BE,   GBRAP10LE)
#define AV_PIX_FMT_GBRAP12   AV_PIX_FMT_NE(GBRAP12BE,   GBRAP12LE)
#define AV_PIX_FMT_GBRAP14   AV_PIX_FMT_NE(GBRAP14BE,   GBRAP14LE)
#define AV_PIX_FMT_GBRAP16   AV_PIX_FMT_NE(GBRAP16BE,   GBRAP16LE)

#define AV_PIX_FMT_BAYER_BGGR16 AV_PIX_FMT_NE(BAYER_BGGR16BE,    BAYER_BGGR16LE)
#define AV_PIX_FMT_BAYER_RGGB16 AV_PIX_FMT_NE(BAYER_RGGB16BE,    BAYER_RGGB16LE)
#define AV_PIX_FMT_BAYER_GBRG16 AV_PIX_FMT_NE(BAYER_GBRG16BE,    BAYER_GBRG16LE)
#define AV_PIX_FMT_BAYER_GRBG16 AV_PIX_FMT_NE(BAYER_GRBG16BE,    BAYER_GRBG16LE)

#define AV_PIX_FMT_GBRPF32    AV_PIX_FMT_NE(GBRPF32BE,  GBRPF32LE)
#define AV_PIX_FMT_GBRAPF32   AV_PIX_FMT_NE(GBRAPF32BE, GBRAPF32LE)

#define AV_PIX_FMT_GRAYF32    AV_PIX_FMT_NE(GRAYF32BE, GRAYF32LE)

#define AV_PIX_FMT_YUVA420P9  AV_PIX_FMT_NE(YUVA420P9BE , YUVA420P9LE)
#define AV_PIX_FMT_YUVA422P9  AV_PIX_FMT_NE(YUVA422P9BE , YUVA422P9LE)
#define AV_PIX_FMT_YUVA444P9  AV_PIX_FMT_NE(YUVA444P9BE , YUVA444P9LE)
#define AV_PIX_FMT_YUVA420P10 AV_PIX_FMT_NE(YUVA420P10BE, YUVA420P10LE)
#define AV_PIX_FMT_YUVA422P10 AV_PIX_FMT_NE(YUVA422P10BE, YUVA422P10LE)
#define AV_PIX_FMT_YUVA444P10 AV_PIX_FMT_NE(YUVA444P10BE, YUVA444P10LE)
#define AV_PIX_FMT_YUVA422P12 AV_PIX_FMT_NE(YUVA422P12BE, YUVA422P12LE)
#define AV_PIX_FMT_YUVA444P12 AV_PIX_FMT_NE(YUVA444P12BE, YUVA444P12LE)
#define AV_PIX_FMT_YUVA420P16 AV_PIX_FMT_NE(YUVA420P16BE, YUVA420P16LE)
#define AV_PIX_FMT_YUVA422P16 AV_PIX_FMT_NE(YUVA422P16BE, YUVA422P16LE)
#define AV_PIX_FMT_YUVA444P16 AV_PIX_FMT_NE(YUVA444P16BE, YUVA444P16LE)

#define AV_PIX_FMT_XYZ12      AV_PIX_FMT_NE(XYZ12BE, XYZ12LE)
#define AV_PIX_FMT_NV20       AV_PIX_FMT_NE(NV20BE,  NV20LE)
#define AV_PIX_FMT_AYUV64     AV_PIX_FMT_NE(AYUV64BE, AYUV64LE)
#define AV_PIX_FMT_P010       AV_PIX_FMT_NE(P010BE,  P010LE)
#define AV_PIX_FMT_P012       AV_PIX_FMT_NE(P012BE,  P012LE)
#define AV_PIX_FMT_P016       AV_PIX_FMT_NE(P016BE,  P016LE)

#define AV_PIX_FMT_Y210       AV_PIX_FMT_NE(Y210BE,  Y210LE)
#define AV_PIX_FMT_Y212       AV_PIX_FMT_NE(Y212BE,  Y212LE)
#define AV_PIX_FMT_XV30       AV_PIX_FMT_NE(XV30BE,  XV30LE)
#define AV_PIX_FMT_XV36       AV_PIX_FMT_NE(XV36BE,  XV36LE)
#define AV_PIX_FMT_X2RGB10    AV_PIX_FMT_NE(X2RGB10BE, X2RGB10LE)
#define AV_PIX_FMT_X2BGR10    AV_PIX_FMT_NE(X2BGR10BE, X2BGR10LE)

#define AV_PIX_FMT_P210       AV_PIX_FMT_NE(P210BE, P210LE)
#define AV_PIX_FMT_P410       AV_PIX_FMT_NE(P410BE, P410LE)
#define AV_PIX_FMT_P212       AV_PIX_FMT_NE(P212BE, P212LE)
#define AV_PIX_FMT_P412       AV_PIX_FMT_NE(P412BE, P412LE)
#define AV_PIX_FMT_P216       AV_PIX_FMT_NE(P216BE, P216LE)
#define AV_PIX_FMT_P416       AV_PIX_FMT_NE(P416BE, P416LE)

#define AV_PIX_FMT_RGBAF16    AV_PIX_FMT_NE(RGBAF16BE, RGBAF16LE)

#define AV_PIX_FMT_RGBF32     AV_PIX_FMT_NE(RGBF32BE, RGBF32LE)
#define AV_PIX_FMT_RGBAF32    AV_PIX_FMT_NE(RGBAF32BE, RGBAF32LE)

 }
{*
  * Chromaticity coordinates of the source primaries.
  * These values match the ones defined by ISO/IEC 23091-2_2019 subclause 8.1 and ITU-T H.273.
   }
{/< also ITU-R BT1361 / IEC 61966-2-4 / SMPTE RP 177 Annex B }
{/< also FCC Title 47 Code of Federal Regulations 73.682 (a)(20) }
{/< also ITU-R BT601-6 625 / ITU-R BT1358 625 / ITU-R BT1700 625 PAL & SECAM }
{/< also ITU-R BT601-6 525 / ITU-R BT1358 525 / ITU-R BT1700 NTSC }
{/< identical to above, also called "SMPTE C" even though it uses D65 }
{/< colour filters using Illuminant C }
{/< ITU-R BT2020 }
{/< SMPTE ST 428-1 (CIE 1931 XYZ) }
{/< SMPTE ST 431-2 (2011) / DCI P3 }
{/< SMPTE ST 432-1 (2010) / P3 D65 / Display P3 }
{/< EBU Tech. 3213-E (nothing there) / one of JEDEC P22 group phosphors }
{/< Not part of ABI }
type
  TAVColorPrimaries =  Longint;
  Const
    AVCOL_PRI_RESERVED0 = 0;
    AVCOL_PRI_BT709 = 1;
    AVCOL_PRI_UNSPECIFIED = 2;
    AVCOL_PRI_RESERVED = 3;
    AVCOL_PRI_BT470M = 4;
    AVCOL_PRI_BT470BG = 5;
    AVCOL_PRI_SMPTE170M = 6;
    AVCOL_PRI_SMPTE240M = 7;
    AVCOL_PRI_FILM = 8;
    AVCOL_PRI_BT2020 = 9;
    AVCOL_PRI_SMPTE428 = 10;
    AVCOL_PRI_SMPTEST428_1 = AVCOL_PRI_SMPTE428;
    AVCOL_PRI_SMPTE431 = 11;
    AVCOL_PRI_SMPTE432 = 12;
    AVCOL_PRI_EBU3213 = 22;
    AVCOL_PRI_JEDEC_P22 = AVCOL_PRI_EBU3213;
    AVCOL_PRI_NB = (AVCOL_PRI_EBU3213)+1;

{*
 * Color Transfer Characteristic.
 * These values match the ones defined by ISO/IEC 23091-2_2019 subclause 8.2.
  }
{/< also ITU-R BT1361 }
{/< also ITU-R BT470M / ITU-R BT1700 625 PAL & SECAM }
{/< also ITU-R BT470BG }
{/< also ITU-R BT601-6 525 or 625 / ITU-R BT1358 525 or 625 / ITU-R BT1700 NTSC }
{/< "Linear transfer characteristics" }
{/< "Logarithmic transfer characteristic (100:1 range)" }
{/< "Logarithmic transfer characteristic (100 * Sqrt(10) : 1 range)" }
{/< IEC 61966-2-4 }
{/< ITU-R BT1361 Extended Colour Gamut }
{/< IEC 61966-2-1 (sRGB or sYCC) }
{/< ITU-R BT2020 for 10-bit system }
{/< ITU-R BT2020 for 12-bit system }
{/< SMPTE ST 2084 for 10-, 12-, 14- and 16-bit systems }
{/< SMPTE ST 428-1 }
{/< ARIB STD-B67, known as "Hybrid log-gamma" }
{/< Not part of ABI }
type
  TAVColorTransferCharacteristic =  Longint;
  Const
    AVCOL_TRC_RESERVED0 = 0;
    AVCOL_TRC_BT709 = 1;
    AVCOL_TRC_UNSPECIFIED = 2;
    AVCOL_TRC_RESERVED = 3;
    AVCOL_TRC_GAMMA22 = 4;
    AVCOL_TRC_GAMMA28 = 5;
    AVCOL_TRC_SMPTE170M = 6;
    AVCOL_TRC_SMPTE240M = 7;
    AVCOL_TRC_LINEAR = 8;
    AVCOL_TRC_LOG = 9;
    AVCOL_TRC_LOG_SQRT = 10;
    AVCOL_TRC_IEC61966_2_4 = 11;
    AVCOL_TRC_BT1361_ECG = 12;
    AVCOL_TRC_IEC61966_2_1 = 13;
    AVCOL_TRC_BT2020_10 = 14;
    AVCOL_TRC_BT2020_12 = 15;
    AVCOL_TRC_SMPTE2084 = 16;
    AVCOL_TRC_SMPTEST2084 = AVCOL_TRC_SMPTE2084;
    AVCOL_TRC_SMPTE428 = 17;
    AVCOL_TRC_SMPTEST428_1 = AVCOL_TRC_SMPTE428;
    AVCOL_TRC_ARIB_STD_B67 = 18;
    AVCOL_TRC_NB = 19;

{*
 * YUV colorspace type.
 * These values match the ones defined by ISO/IEC 23091-2_2019 subclause 8.3.
  }
{/< order of coefficients is actually GBR, also IEC 61966-2-1 (sRGB), YZX and ST 428-1 }
{/< also ITU-R BT1361 / IEC 61966-2-4 xvYCC709 / derived in SMPTE RP 177 Annex B }
{/< reserved for future use by ITU-T and ISO/IEC just like 15-255 are }
{/< FCC Title 47 Code of Federal Regulations 73.682 (a)(20) }
{/< also ITU-R BT601-6 625 / ITU-R BT1358 625 / ITU-R BT1700 625 PAL & SECAM / IEC 61966-2-4 xvYCC601 }
{/< also ITU-R BT601-6 525 / ITU-R BT1358 525 / ITU-R BT1700 NTSC / functionally identical to above }
{/< derived from 170M primaries and D65 white point, 170M is derived from BT470 System M's primaries }
{/< used by Dirac / VC-2 and H.264 FRext, see ITU-T SG16 }
{/< ITU-R BT2020 non-constant luminance system }
{/< ITU-R BT2020 constant luminance system }
{/< SMPTE 2085, Y'D'zD'x }
{/< Chromaticity-derived non-constant luminance system }
{/< Chromaticity-derived constant luminance system }
{/< ITU-R BT.2100-0, ICtCp }
{/< Not part of ABI }
type
  TAVColorSpace =  Longint;
  Const
    AVCOL_SPC_RGB = 0;
    AVCOL_SPC_BT709 = 1;
    AVCOL_SPC_UNSPECIFIED = 2;
    AVCOL_SPC_RESERVED = 3;
    AVCOL_SPC_FCC = 4;
    AVCOL_SPC_BT470BG = 5;
    AVCOL_SPC_SMPTE170M = 6;
    AVCOL_SPC_SMPTE240M = 7;
    AVCOL_SPC_YCGCO = 8;
    AVCOL_SPC_YCOCG = AVCOL_SPC_YCGCO;
    AVCOL_SPC_BT2020_NCL = 9;
    AVCOL_SPC_BT2020_CL = 10;
    AVCOL_SPC_SMPTE2085 = 11;
    AVCOL_SPC_CHROMA_DERIVED_NCL = 12;
    AVCOL_SPC_CHROMA_DERIVED_CL = 13;
    AVCOL_SPC_ICTCP = 14;
    AVCOL_SPC_NB = 15;

{*
 * Visual content value range.
 *
 * These values are based on definitions that can be found in multiple
 * specifications, such as ITU-T BT.709 (3.4 - Quantization of RGB, luminance
 * and colour-difference signals), ITU-T BT.2020 (Table 5 - Digital
 * Representation) as well as ITU-T BT.2100 (Table 9 - Digital 10- and 12-bit
 * integer representation). At the time of writing, the BT.2100 one is
 * recommended, as it also defines the full range representation.
 *
 * Common definitions:
 *   - For RGB and luma planes such as Y in YCbCr and I in ICtCp,
 *     'E' is the original value in range of 0.0 to 1.0.
 *   - For chroma planes such as Cb,Cr and Ct,Cp, 'E' is the original
 *     value in range of -0.5 to 0.5.
 *   - 'n' is the output bit depth.
 *   - For additional definitions such as rounding and clipping to valid n
 *     bit unsigned integer range, please refer to BT.2100 (Table 9).
  }
{*
     * Narrow or limited range content.
     *
     * - For luma planes:
     *
     *       (219 * E + 16) * 2^(n-8)
     *
     *   F.ex. the range of 16-235 for 8 bits
     *
     * - For chroma planes:
     *
     *       (224 * E + 128) * 2^(n-8)
     *
     *   F.ex. the range of 16-240 for 8 bits
      }
{*
     * Full range content.
     *
     * - For RGB and luma planes:
     *
     *       (2^n - 1) * E
     *
     *   F.ex. the range of 0-255 for 8 bits
     *
     * - For chroma planes:
     *
     *       (2^n - 1) * E + 2^(n - 1)
     *
     *   F.ex. the range of 1-255 for 8 bits
      }
{/< Not part of ABI }
type
  TAVColorRange =  Longint;
  Const
    AVCOL_RANGE_UNSPECIFIED = 0;
    AVCOL_RANGE_MPEG = 1;
    AVCOL_RANGE_JPEG = 2;
    AVCOL_RANGE_NB = 3;

{*
 * Location of chroma samples.
 *
 * Illustration showing the location of the first (top left) chroma sample of the
 * image, the left shows only luma, the right
 * shows the location of the chroma sample, the 2 could be imagined to overlay
 * each other but are drawn separately due to limitations of ASCII
 *
 *                1st 2nd       1st 2nd horizontal luma sample positions
 *                 v   v         v   v
 *                 ______        ______
 *1st luma line > |X   X ...    |3 4 X ...     X are luma samples,
 *                |             |1 2           1-6 are possible chroma positions
 *2nd luma line > |X   X ...    |5 6 X ...     0 is undefined/unknown position
  }
{/< MPEG-2/4 4:2:0, H.264 default for 4:2:0 }
{/< MPEG-1 4:2:0, JPEG 4:2:0, H.263 4:2:0 }
{/< ITU-R 601, SMPTE 274M 296M S314M(DV 4:1:1), mpeg2 4:2:2 }
{/< Not part of ABI }
type
  TAVChromaLocation =  Longint;
  Const
    AVCHROMA_LOC_UNSPECIFIED = 0;
    AVCHROMA_LOC_LEFT = 1;
    AVCHROMA_LOC_CENTER = 2;
    AVCHROMA_LOC_TOPLEFT = 3;
    AVCHROMA_LOC_TOP = 4;
    AVCHROMA_LOC_BOTTOMLEFT = 5;
    AVCHROMA_LOC_BOTTOM = 6;
    AVCHROMA_LOC_NB = 7;

{$endif}
{ AVUTIL_PIXFMT_H  }

// === Konventiert am: 14-12-25 17:36:59 ===


implementation



end.
