
unit video_converter;
interface

{
  Automatically converted by H2Pas 1.0.0 from video_converter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    video_converter.h
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
PGstBuffer  = ^GstBuffer;
PGstStructure  = ^GstStructure;
PGstTaskPool  = ^GstTaskPool;
PGstVideoAlphaMode  = ^GstVideoAlphaMode;
PGstVideoChromaMode  = ^GstVideoChromaMode;
PGstVideoConverter  = ^GstVideoConverter;
PGstVideoFrame  = ^GstVideoFrame;
PGstVideoGammaMode  = ^GstVideoGammaMode;
PGstVideoInfo  = ^GstVideoInfo;
PGstVideoMatrixMode  = ^GstVideoMatrixMode;
PGstVideoPrimariesMode  = ^GstVideoPrimariesMode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Video conversion api function
 * Copyright (C) 2014 Wim Taymans <wim.taymans@gmail.com>
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
{$ifndef __GST_VIDEO_CONVERTER_H__}
{$define __GST_VIDEO_CONVERTER_H__}
{$include <gst/video/video.h>}
{*
 * GST_VIDEO_CONVERTER_OPT_RESAMPLER_METHOD:
 *
 * #GstVideoResamplerMethod, The resampler method to use for
 * resampling. Other options for the resampler can be used, see
 * the #GstVideoResampler. Default is #GST_VIDEO_RESAMPLER_METHOD_CUBIC
  }

const
  GST_VIDEO_CONVERTER_OPT_RESAMPLER_METHOD = 'GstVideoConverter.resampler-method';  
{*
 * GST_VIDEO_CONVERTER_OPT_CHROMA_RESAMPLER_METHOD:
 *
 * #GstVideoChromaMethod, The resampler method to use for
 * chroma resampling. Other options for the resampler can be used, see
 * the #GstVideoResampler. Default is #GST_VIDEO_RESAMPLER_METHOD_LINEAR
  }
  GST_VIDEO_CONVERTER_OPT_CHROMA_RESAMPLER_METHOD = 'GstVideoConverter.chroma-resampler-method';  
{*
 * GST_VIDEO_CONVERTER_OPT_RESAMPLER_TAPS:
 *
 * #G_TYPE_UINT, The number of taps for the resampler.
 * Default is 0: let the resampler choose a good value.
  }
  GST_VIDEO_CONVERTER_OPT_RESAMPLER_TAPS = 'GstVideoConverter.resampler-taps';  
{*
 * GST_VIDEO_CONVERTER_OPT_DITHER_METHOD:
 *
 * #GstVideoDitherMethod, The dither method to use when
 * changing bit depth.
 * Default is #GST_VIDEO_DITHER_BAYER.
  }
  GST_VIDEO_CONVERTER_OPT_DITHER_METHOD = 'GstVideoConverter.dither-method';  
{*
 * GST_VIDEO_CONVERTER_OPT_DITHER_QUANTIZATION:
 *
 * #G_TYPE_UINT, The quantization amount to dither to. Components will be
 * quantized to multiples of this value.
 * Default is 1
  }
  GST_VIDEO_CONVERTER_OPT_DITHER_QUANTIZATION = 'GstVideoConverter.dither-quantization';  
{*
 * GST_VIDEO_CONVERTER_OPT_SRC_X:
 *
 * #G_TYPE_INT, source x position to start conversion, default 0
  }
  GST_VIDEO_CONVERTER_OPT_SRC_X = 'GstVideoConverter.src-x';  
{*
 * GST_VIDEO_CONVERTER_OPT_SRC_Y:
 *
 * #G_TYPE_INT, source y position to start conversion, default 0
  }
  GST_VIDEO_CONVERTER_OPT_SRC_Y = 'GstVideoConverter.src-y';  
{*
 * GST_VIDEO_CONVERTER_OPT_SRC_WIDTH:
 *
 * #G_TYPE_INT, source width to convert, default source width
  }
  GST_VIDEO_CONVERTER_OPT_SRC_WIDTH = 'GstVideoConverter.src-width';  
{*
 * GST_VIDEO_CONVERTER_OPT_SRC_HEIGHT:
 *
 * #G_TYPE_INT, source height to convert, default source height
  }
  GST_VIDEO_CONVERTER_OPT_SRC_HEIGHT = 'GstVideoConverter.src-height';  
{*
 * GST_VIDEO_CONVERTER_OPT_DEST_X:
 *
 * #G_TYPE_INT, x position in the destination frame, default 0
  }
  GST_VIDEO_CONVERTER_OPT_DEST_X = 'GstVideoConverter.dest-x';  
{*
 * GST_VIDEO_CONVERTER_OPT_DEST_Y:
 *
 * #G_TYPE_INT, y position in the destination frame, default 0
  }
  GST_VIDEO_CONVERTER_OPT_DEST_Y = 'GstVideoConverter.dest-y';  
{*
 * GST_VIDEO_CONVERTER_OPT_DEST_WIDTH:
 *
 * #G_TYPE_INT, width in the destination frame, default destination width
  }
  GST_VIDEO_CONVERTER_OPT_DEST_WIDTH = 'GstVideoConverter.dest-width';  
{*
 * GST_VIDEO_CONVERTER_OPT_DEST_HEIGHT:
 *
 * #G_TYPE_INT, height in the destination frame, default destination height
  }
  GST_VIDEO_CONVERTER_OPT_DEST_HEIGHT = 'GstVideoConverter.dest-height';  
{*
 * GST_VIDEO_CONVERTER_OPT_FILL_BORDER:
 *
 * #G_TYPE_BOOLEAN, if the destination rectangle does not fill the complete
 * destination image, render a border with
 * #GST_VIDEO_CONVERTER_OPT_BORDER_ARGB. Otherwise the unusded pixels in the
 * destination are untouched. Default %TRUE.
  }
  GST_VIDEO_CONVERTER_OPT_FILL_BORDER = 'GstVideoConverter.fill-border';  
{*
 * GST_VIDEO_CONVERTER_OPT_ALPHA_VALUE:
 *
 * #G_TYPE_DOUBLE, the alpha color value to use.
 * Default to 1.0
  }
  GST_VIDEO_CONVERTER_OPT_ALPHA_VALUE = 'GstVideoConverter.alpha-value';  
{*
 * GstVideoAlphaMode:
 * @GST_VIDEO_ALPHA_MODE_COPY: When input and output have alpha, it will be copied.
 *         When the input has no alpha, alpha will be set to
 *         #GST_VIDEO_CONVERTER_OPT_ALPHA_VALUE
 * @GST_VIDEO_ALPHA_MODE_SET: set all alpha to
 *	   #GST_VIDEO_CONVERTER_OPT_ALPHA_VALUE
 * @GST_VIDEO_ALPHA_MODE_MULT:  multiply all alpha with
 *         #GST_VIDEO_CONVERTER_OPT_ALPHA_VALUE.
 *         When the input format has no alpha but the output format has, the
 *         alpha value will be set to #GST_VIDEO_CONVERTER_OPT_ALPHA_VALUE
 *
 * Different alpha modes.
 *
 * Since: 1.6
  }
type
  PGstVideoAlphaMode = ^TGstVideoAlphaMode;
  TGstVideoAlphaMode =  Longint;
  Const
    GST_VIDEO_ALPHA_MODE_COPY = 0;
    GST_VIDEO_ALPHA_MODE_SET = 1;
    GST_VIDEO_ALPHA_MODE_MULT = 2;
;
{*
 * GST_VIDEO_CONVERTER_OPT_ALPHA_MODE:
 *
 * #GstVideoAlphaMode, the alpha mode to use.
 * Default is #GST_VIDEO_ALPHA_MODE_COPY.
  }
  GST_VIDEO_CONVERTER_OPT_ALPHA_MODE = 'GstVideoConverter.alpha-mode';  
{*
 * GST_VIDEO_CONVERTER_OPT_BORDER_ARGB:
 *
 * #G_TYPE_UINT, the border color to use if #GST_VIDEO_CONVERTER_OPT_FILL_BORDER
 * is set to %TRUE. The color is in ARGB format.
 * Default 0xff000000
  }
  GST_VIDEO_CONVERTER_OPT_BORDER_ARGB = 'GstVideoConverter.border-argb';  
{*
 * GstVideoChromaMode:
 * @GST_VIDEO_CHROMA_MODE_FULL: do full chroma up and down sampling
 * @GST_VIDEO_CHROMA_MODE_UPSAMPLE_ONLY: only perform chroma upsampling
 * @GST_VIDEO_CHROMA_MODE_DOWNSAMPLE_ONLY: only perform chroma downsampling
 * @GST_VIDEO_CHROMA_MODE_NONE: disable chroma resampling
 *
 * Different chroma downsampling and upsampling modes
 *
 * Since: 1.6
  }
type
  PGstVideoChromaMode = ^TGstVideoChromaMode;
  TGstVideoChromaMode =  Longint;
  Const
    GST_VIDEO_CHROMA_MODE_FULL = 0;
    GST_VIDEO_CHROMA_MODE_UPSAMPLE_ONLY = 1;
    GST_VIDEO_CHROMA_MODE_DOWNSAMPLE_ONLY = 2;
    GST_VIDEO_CHROMA_MODE_NONE = 3;
;
{*
 * GST_VIDEO_CONVERTER_OPT_CHROMA_MODE:
 *
 * #GstVideoChromaMode, set the chroma resample mode subsampled
 * formats. Default is #GST_VIDEO_CHROMA_MODE_FULL.
  }
  GST_VIDEO_CONVERTER_OPT_CHROMA_MODE = 'GstVideoConverter.chroma-mode';  
{*
 *GstVideoMatrixMode:
 * @GST_VIDEO_MATRIX_MODE_FULL: do conversion between color matrices
 * @GST_VIDEO_MATRIX_MODE_INPUT_ONLY:  use the input color matrix to convert
 *	  to and from R'G'B
 * @GST_VIDEO_MATRIX_MODE_OUTPUT_ONLY: use the output color matrix to convert
 *	  to and from R'G'B
 * @GST_VIDEO_MATRIX_MODE_NONE: disable color matrix conversion.
 *
 * Different color matrix conversion modes
 *
 * Since: 1.6
  }
type
  PGstVideoMatrixMode = ^TGstVideoMatrixMode;
  TGstVideoMatrixMode =  Longint;
  Const
    GST_VIDEO_MATRIX_MODE_FULL = 0;
    GST_VIDEO_MATRIX_MODE_INPUT_ONLY = 1;
    GST_VIDEO_MATRIX_MODE_OUTPUT_ONLY = 2;
    GST_VIDEO_MATRIX_MODE_NONE = 3;
;
{*
 * GST_VIDEO_CONVERTER_OPT_MATRIX_MODE:
 *
 * #GstVideoMatrixMode, set the color matrix conversion mode for
 *	converting between Y'PbPr and non-linear RGB (R'G'B').
 * Default is #GST_VIDEO_MATRIX_MODE_FULL.
  }
  GST_VIDEO_CONVERTER_OPT_MATRIX_MODE = 'GstVideoConverter.matrix-mode';  
{*
 * GstVideoGammaMode:
 * @GST_VIDEO_GAMMA_MODE_NONE: disable gamma handling
 * @GST_VIDEO_GAMMA_MODE_REMAP: convert between input and output gamma
 * Different gamma conversion modes
 *
 * Since: 1.6
  }
type
  PGstVideoGammaMode = ^TGstVideoGammaMode;
  TGstVideoGammaMode =  Longint;
  Const
    GST_VIDEO_GAMMA_MODE_NONE = 0;
    GST_VIDEO_GAMMA_MODE_REMAP = 1;
;
{*
 * GST_VIDEO_CONVERTER_OPT_GAMMA_MODE:
 *
 * #GstVideoGammaMode, set the gamma mode.
 * Default is #GST_VIDEO_GAMMA_MODE_NONE.
  }
  GST_VIDEO_CONVERTER_OPT_GAMMA_MODE = 'GstVideoConverter.gamma-mode';  
{*
 * GstVideoPrimariesMode:
 * @GST_VIDEO_PRIMARIES_MODE_NONE: disable conversion between primaries
 * @GST_VIDEO_PRIMARIES_MODE_MERGE_ONLY: do conversion between primaries only
 *	  when it can be merged with color matrix conversion.
 * @GST_VIDEO_PRIMARIES_MODE_FAST: fast conversion between primaries
 *
 * Different primaries conversion modes
 *
 * Since: 1.6
  }
type
  PGstVideoPrimariesMode = ^TGstVideoPrimariesMode;
  TGstVideoPrimariesMode =  Longint;
  Const
    GST_VIDEO_PRIMARIES_MODE_NONE = 0;
    GST_VIDEO_PRIMARIES_MODE_MERGE_ONLY = 1;
    GST_VIDEO_PRIMARIES_MODE_FAST = 2;
;
{*
 * GST_VIDEO_CONVERTER_OPT_PRIMARIES_MODE:
 *
 * #GstVideoPrimariesMode, set the primaries conversion mode.
 * Default is #GST_VIDEO_PRIMARIES_MODE_NONE.
  }
  GST_VIDEO_CONVERTER_OPT_PRIMARIES_MODE = 'GstVideoConverter.primaries-mode';  
{*
 * GST_VIDEO_CONVERTER_OPT_THREADS:
 *
 * #G_TYPE_UINT, maximum number of threads to use. Default 1, 0 for the number
 * of cores.
  }
  GST_VIDEO_CONVERTER_OPT_THREADS = 'GstVideoConverter.threads';  
{*
 * GST_VIDEO_CONVERTER_OPT_ASYNC_TASKS:
 *
 * #G_TYPE_BOOLEAN, whether gst_video_converter_frame() will return immediately
 * without waiting for the conversion to complete.  A subsequent
 * gst_video_converter_frame_finish() must be performed to ensure completion of the
 * conversion before subsequent use.  Default %FALSE
 *
 * Since: 1.20
  }
  GST_VIDEO_CONVERTER_OPT_ASYNC_TASKS = 'GstVideoConverter.async-tasks';  
type
(* Const before type ignored *)
(* Const before type ignored *)

function gst_video_converter_new(in_info:PGstVideoInfo; out_info:PGstVideoInfo; config:PGstStructure):PGstVideoConverter;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_video_converter_new_with_pool(in_info:PGstVideoInfo; out_info:PGstVideoInfo; config:PGstStructure; pool:PGstTaskPool):PGstVideoConverter;cdecl;external;
procedure gst_video_converter_free(convert:PGstVideoConverter);cdecl;external;
function gst_video_converter_set_config(convert:PGstVideoConverter; config:PGstStructure):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_video_converter_get_config(convert:PGstVideoConverter):PGstStructure;cdecl;external;
(* Const before type ignored *)
procedure gst_video_converter_frame(convert:PGstVideoConverter; src:PGstVideoFrame; dest:PGstVideoFrame);cdecl;external;
procedure gst_video_converter_frame_finish(convert:PGstVideoConverter);cdecl;external;
(* Const before type ignored *)
function gst_video_converter_get_in_info(convert:PGstVideoConverter):PGstVideoInfo;cdecl;external;
(* Const before type ignored *)
function gst_video_converter_get_out_info(convert:PGstVideoConverter):PGstVideoInfo;cdecl;external;
function gst_video_converter_transform_metas(convert:PGstVideoConverter; src:PGstBuffer; dest:PGstBuffer):Tgboolean;cdecl;external;
{$endif}
{ __GST_VIDEO_CONVERTER_H__  }

implementation


end.
