
unit codestream_header;
interface

{
  Automatically converted by H2Pas 1.0.0 from codestream_header.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    codestream_header.h
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
PJxlAnimationHeader  = ^JxlAnimationHeader;
PJxlBasicInfo  = ^JxlBasicInfo;
PJxlBlendInfo  = ^JxlBlendInfo;
PJxlBlendMode  = ^JxlBlendMode;
PJxlExtraChannelInfo  = ^JxlExtraChannelInfo;
PJxlExtraChannelType  = ^JxlExtraChannelType;
PJxlFrameHeader  = ^JxlFrameHeader;
PJxlHeaderExtensions  = ^JxlHeaderExtensions;
PJxlIntrinsicSizeHeader  = ^JxlIntrinsicSizeHeader;
PJxlLayerInfo  = ^JxlLayerInfo;
PJxlOrientation  = ^JxlOrientation;
PJxlPreviewHeader  = ^JxlPreviewHeader;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (c) the JPEG XL Project Authors. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
  }
{* @addtogroup libjxl_common
 * @
 * @file codestream_header.h
 * @brief Definitions of structs and enums for the metadata from the JPEG XL
 * codestream headers (signature, metadata, preview dimensions, ...), excluding
 * color encoding which is in color_encoding.h.
  }
{$ifndef JXL_CODESTREAM_HEADER_H_}
{$define JXL_CODESTREAM_HEADER_H_}
{$include <stddef.h>}
{$include <stdint.h>}
{$include "jxl/types.h"}
{* Image orientation metadata.
 * Values 1..8 match the EXIF definitions.
 * The name indicates the operation to perform to transform from the encoded
 * image to the display image.
  }
type
  PJxlOrientation = ^TJxlOrientation;
  TJxlOrientation =  Longint;
  Const
    JXL_ORIENT_IDENTITY = 1;
    JXL_ORIENT_FLIP_HORIZONTAL = 2;
    JXL_ORIENT_ROTATE_180 = 3;
    JXL_ORIENT_FLIP_VERTICAL = 4;
    JXL_ORIENT_TRANSPOSE = 5;
    JXL_ORIENT_ROTATE_90_CW = 6;
    JXL_ORIENT_ANTI_TRANSPOSE = 7;
    JXL_ORIENT_ROTATE_90_CCW = 8;
;
{* Given type of an extra channel.
  }
type
  PJxlExtraChannelType = ^TJxlExtraChannelType;
  TJxlExtraChannelType =  Longint;
  Const
    JXL_CHANNEL_ALPHA = 0;
    JXL_CHANNEL_DEPTH = 1;
    JXL_CHANNEL_SPOT_COLOR = 2;
    JXL_CHANNEL_SELECTION_MASK = 3;
    JXL_CHANNEL_BLACK = 4;
    JXL_CHANNEL_CFA = 5;
    JXL_CHANNEL_THERMAL = 6;
    JXL_CHANNEL_RESERVED0 = 7;
    JXL_CHANNEL_RESERVED1 = 8;
    JXL_CHANNEL_RESERVED2 = 9;
    JXL_CHANNEL_RESERVED3 = 10;
    JXL_CHANNEL_RESERVED4 = 11;
    JXL_CHANNEL_RESERVED5 = 12;
    JXL_CHANNEL_RESERVED6 = 13;
    JXL_CHANNEL_RESERVED7 = 14;
    JXL_CHANNEL_UNKNOWN = 15;
    JXL_CHANNEL_OPTIONAL = 16;
;
{* The codestream preview header  }
{* Preview width in pixels  }
{* Preview height in pixels  }
type
  PJxlPreviewHeader = ^TJxlPreviewHeader;
  TJxlPreviewHeader = record
      xsize : Tuint32_t;
      ysize : Tuint32_t;
    end;
{* The intrinsic size header  }
{* Intrinsic width in pixels  }
{* Intrinsic height in pixels  }

  PJxlIntrinsicSizeHeader = ^TJxlIntrinsicSizeHeader;
  TJxlIntrinsicSizeHeader = record
      xsize : Tuint32_t;
      ysize : Tuint32_t;
    end;
{* The codestream animation header, optionally present in the beginning of
 * the codestream, and if it is it applies to all animation frames, unlike
 * JxlFrameHeader which applies to an individual frame.
  }
{* Numerator of ticks per second of a single animation frame time unit  }
{* Denominator of ticks per second of a single animation frame time unit  }
{* Amount of animation loops, or 0 to repeat infinitely  }
{* Whether animation time codes are present at animation frames in the
   * codestream  }

  PJxlAnimationHeader = ^TJxlAnimationHeader;
  TJxlAnimationHeader = record
      tps_numerator : Tuint32_t;
      tps_denominator : Tuint32_t;
      num_loops : Tuint32_t;
      have_timecodes : TJXL_BOOL;
    end;
{* Basic image information. This information is available from the file
 * signature and first part of the codestream header.
  }
{ TODO(lode): need additional fields for (transcoded) JPEG? For reusable
   * fields orientation must be read from Exif APP1. For has_icc_profile: must
   * look up where ICC profile is guaranteed to be in a JPEG file to be able to
   * indicate this.  }
{ TODO(lode): make struct packed, and/or make this opaque struct with getter
   * functions (still separate struct from opaque decoder)  }
{* Whether the codestream is embedded in the container format. If true,
   * metadata information and extensions may be available in addition to the
   * codestream.
    }
{* Width of the image in pixels, before applying orientation.
    }
{* Height of the image in pixels, before applying orientation.
    }
{* Original image color channel bit depth.
    }
{* Original image color channel floating point exponent bits, or 0 if they
   * are unsigned integer. For example, if the original data is half-precision
   * (binary16) floating point, bits_per_sample is 16 and
   * exponent_bits_per_sample is 5, and so on for other floating point
   * precisions.
    }
{* Upper bound on the intensity level present in the image in nits. For
   * unsigned integer pixel encodings, this is the brightness of the largest
   * representable value. The image does not necessarily contain a pixel
   * actually this bright. An encoder is allowed to set 255 for SDR images
   * without computing a histogram.
   * Leaving this set to its default of 0 lets libjxl choose a sensible default
   * value based on the color encoding.
    }
{* Lower bound on the intensity level present in the image. This may be
   * loose, i.e. lower than the actual darkest pixel. When tone mapping, a
   * decoder will map [min_nits, intensity_target] to the display range.
    }
{* See the description of @see linear_below.
    }
{* The tone mapping will leave unchanged (linear mapping) any pixels whose
   * brightness is strictly below this. The interpretation depends on
   * relative_to_max_display. If true, this is a ratio [0, 1] of the maximum
   * display brightness [nits], otherwise an absolute brightness [nits].
    }
{* Whether the data in the codestream is encoded in the original color
   * profile that is attached to the codestream metadata header, or is
   * encoded in an internally supported absolute color space (which the decoder
   * can always convert to linear or non-linear sRGB or to XYB). If the original
   * profile is used, the decoder outputs pixel data in the color space matching
   * that profile, but doesn't convert it to any other color space. If the
   * original profile is not used, the decoder only outputs the data as sRGB
   * (linear if outputting to floating point, nonlinear with standard sRGB
   * transfer function if outputting to unsigned integers) but will not convert
   * it to to the original color profile. The decoder also does not convert to
   * the target display color profile. To convert the pixel data produced by
   * the decoder to the original color profile, one of the JxlDecoderGetColor*
   * functions needs to be called with @ref JXL_COLOR_PROFILE_TARGET_DATA to get
   * the color profile of the decoder output, and then an external CMS can be
   * used for conversion.
   * Note that for lossy compression, this should be set to false for most use
   * cases, and if needed, the image should be converted to the original color
   * profile after decoding, as described above.
    }
{* Indicates a preview image exists near the beginning of the codestream.
   * The preview itself or its dimensions are not included in the basic info.
    }
{* Indicates animation frames exist in the codestream. The animation
   * information is not included in the basic info.
    }
{* Image orientation, value 1-8 matching the values used by JEITA CP-3451C
   * (Exif version 2.3).
    }
{* Number of color channels encoded in the image, this is either 1 for
   * grayscale data, or 3 for colored data. This count does not include
   * the alpha channel or other extra channels. To check presence of an alpha
   * channel, such as in the case of RGBA color, check alpha_bits != 0.
   * If and only if this is 1, the JxlColorSpace in the JxlColorEncoding is
   * JXL_COLOR_SPACE_GRAY.
    }
{* Number of additional image channels. This includes the main alpha channel,
   * but can also include additional channels such as depth, additional alpha
   * channels, spot colors, and so on. Information about the extra channels
   * can be queried with JxlDecoderGetExtraChannelInfo. The main alpha channel,
   * if it exists, also has its information available in the alpha_bits,
   * alpha_exponent_bits and alpha_premultiplied fields in this JxlBasicInfo.
    }
{* Bit depth of the encoded alpha channel, or 0 if there is no alpha channel.
   * If present, matches the alpha_bits value of the JxlExtraChannelInfo
   * associated with this alpha channel.
    }
{* Alpha channel floating point exponent bits, or 0 if they are unsigned. If
   * present, matches the alpha_bits value of the JxlExtraChannelInfo associated
   * with this alpha channel. integer.
    }
{* Whether the alpha channel is premultiplied. Only used if there is a main
   * alpha channel. Matches the alpha_premultiplied value of the
   * JxlExtraChannelInfo associated with this alpha channel.
    }
{* Dimensions of encoded preview image, only used if have_preview is
   * JXL_TRUE.
    }
{* Animation header with global animation properties for all frames, only
   * used if have_animation is JXL_TRUE.
    }
{* Intrinsic width of the image.
   * The intrinsic size can be different from the actual size in pixels
   * (as given by xsize and ysize) and it denotes the recommended dimensions
   * for displaying the image, i.e. applications are advised to resample the
   * decoded image to the intrinsic dimensions.
    }
{* Intrinsic heigth of the image.
   * The intrinsic size can be different from the actual size in pixels
   * (as given by xsize and ysize) and it denotes the recommended dimensions
   * for displaying the image, i.e. applications are advised to resample the
   * decoded image to the intrinsic dimensions.
    }
{* Padding for forwards-compatibility, in case more fields are exposed
   * in a future version of the library.
    }

  PJxlBasicInfo = ^TJxlBasicInfo;
  TJxlBasicInfo = record
      have_container : TJXL_BOOL;
      xsize : Tuint32_t;
      ysize : Tuint32_t;
      bits_per_sample : Tuint32_t;
      exponent_bits_per_sample : Tuint32_t;
      intensity_target : single;
      min_nits : single;
      relative_to_max_display : TJXL_BOOL;
      linear_below : single;
      uses_original_profile : TJXL_BOOL;
      have_preview : TJXL_BOOL;
      have_animation : TJXL_BOOL;
      orientation : TJxlOrientation;
      num_color_channels : Tuint32_t;
      num_extra_channels : Tuint32_t;
      alpha_bits : Tuint32_t;
      alpha_exponent_bits : Tuint32_t;
      alpha_premultiplied : TJXL_BOOL;
      preview : TJxlPreviewHeader;
      animation : TJxlAnimationHeader;
      intrinsic_xsize : Tuint32_t;
      intrinsic_ysize : Tuint32_t;
      padding : array[0..99] of Tuint8_t;
    end;
{* Information for a single extra channel.
  }
{* Given type of an extra channel.
    }
{* Total bits per sample for this channel.
    }
{* Floating point exponent bits per channel, or 0 if they are unsigned
   * integer.
    }
{* The exponent the channel is downsampled by on each axis.
   * TODO(lode): expand this comment to match the JPEG XL specification,
   * specify how to upscale, how to round the size computation, and to which
   * extra channels this field applies.
    }
{* Length of the extra channel name in bytes, or 0 if no name.
   * Excludes null termination character.
    }
{* Whether alpha channel uses premultiplied alpha. Only applicable if
   * type is JXL_CHANNEL_ALPHA.
    }
{* Spot color of the current spot channel in linear RGBA. Only applicable if
   * type is JXL_CHANNEL_SPOT_COLOR.
    }
{* Only applicable if type is JXL_CHANNEL_CFA.
   * TODO(lode): add comment about the meaning of this field.
    }

  PJxlExtraChannelInfo = ^TJxlExtraChannelInfo;
  TJxlExtraChannelInfo = record
      _type : TJxlExtraChannelType;
      bits_per_sample : Tuint32_t;
      exponent_bits_per_sample : Tuint32_t;
      dim_shift : Tuint32_t;
      name_length : Tuint32_t;
      alpha_premultiplied : TJXL_BOOL;
      spot_color : array[0..3] of single;
      cfa_channel : Tuint32_t;
    end;
{ TODO(lode): add API to get the codestream header extensions.  }
{* Extensions in the codestream header.  }
{* Extension bits.  }

  PJxlHeaderExtensions = ^TJxlHeaderExtensions;
  TJxlHeaderExtensions = record
      extensions : Tuint64_t;
    end;
{* Frame blend modes.
 * When decoding, if coalescing is enabled (default), this can be ignored.
  }

  PJxlBlendMode = ^TJxlBlendMode;
  TJxlBlendMode =  Longint;
  Const
    JXL_BLEND_REPLACE = 0;
    JXL_BLEND_ADD = 1;
    JXL_BLEND_BLEND = 2;
    JXL_BLEND_MULADD = 3;
    JXL_BLEND_MUL = 4;
;
{* The information about blending the color channels or a single extra channel.
 * When decoding, if coalescing is enabled (default), this can be ignored and
 * the blend mode is considered to be JXL_BLEND_REPLACE.
 * When encoding, these settings apply to the pixel data given to the encoder.
  }
{* Blend mode.
    }
{* Reference frame ID to use as the 'bottom' layer (0-3).
    }
{* Which extra channel to use as the 'alpha' channel for blend modes
   * JXL_BLEND_BLEND and JXL_BLEND_MULADD.
    }
{* Clamp values to [0,1] for the purpose of blending.
    }
type
  PJxlBlendInfo = ^TJxlBlendInfo;
  TJxlBlendInfo = record
      blendmode : TJxlBlendMode;
      source : Tuint32_t;
      alpha : Tuint32_t;
      clamp : TJXL_BOOL;
    end;
{* The information about layers.
 * When decoding, if coalescing is enabled (default), this can be ignored.
 * When encoding, these settings apply to the pixel data given to the encoder,
 * the encoder could choose an internal representation that differs.
  }
{* Whether cropping is applied for this frame. When decoding, if false,
   * crop_x0 and crop_y0 are set to zero, and xsize and ysize to the main
   * image dimensions. When encoding and this is false, those fields are
   * ignored. When decoding, if coalescing is enabled (default), this is always
   * false, regardless of the internal encoding in the JPEG XL codestream.
    }
{* Horizontal offset of the frame (can be negative).
    }
{* Vertical offset of the frame (can be negative).
    }
{* Width of the frame (number of columns).
    }
{* Height of the frame (number of rows).
    }
{* The blending info for the color channels. Blending info for extra channels
   * has to be retrieved separately using JxlDecoderGetExtraChannelBlendInfo.
    }
{* After blending, save the frame as reference frame with this ID (0-3).
   * Special case: if the frame duration is nonzero, ID 0 means "will not be
   * referenced in the future". This value is not used for the last frame.
    }

  PJxlLayerInfo = ^TJxlLayerInfo;
  TJxlLayerInfo = record
      have_crop : TJXL_BOOL;
      crop_x0 : Tint32_t;
      crop_y0 : Tint32_t;
      xsize : Tuint32_t;
      ysize : Tuint32_t;
      blend_info : TJxlBlendInfo;
      save_as_reference : Tuint32_t;
    end;
{* The header of one displayed frame or non-coalesced layer.  }
{* How long to wait after rendering in ticks. The duration in seconds of a
   * tick is given by tps_numerator and tps_denominator in JxlAnimationHeader.
    }
{* SMPTE timecode of the current frame in form 0xHHMMSSFF, or 0. The bits are
   * interpreted from most-significant to least-significant as hour, minute,
   * second, and frame. If timecode is nonzero, it is strictly larger than that
   * of a previous frame with nonzero duration. These values are only available
   * if have_timecodes in JxlAnimationHeader is JXL_TRUE.
   * This value is only used if have_timecodes in JxlAnimationHeader is
   * JXL_TRUE.
    }
{* Length of the frame name in bytes, or 0 if no name.
   * Excludes null termination character. This value is set by the decoder.
   * For the encoder, this value is ignored and @ref JxlEncoderSetFrameName is
   * used instead to set the name and the length.
    }
{* Indicates this is the last animation frame. This value is set by the
   * decoder to indicate no further frames follow. For the encoder, it is not
   * required to set this value and it is ignored, @ref JxlEncoderCloseFrames is
   * used to indicate the last frame to the encoder instead.
    }
{* Information about the layer in case of no coalescing.
    }

  PJxlFrameHeader = ^TJxlFrameHeader;
  TJxlFrameHeader = record
      duration : Tuint32_t;
      timecode : Tuint32_t;
      name_length : Tuint32_t;
      is_last : TJXL_BOOL;
      layer_info : TJxlLayerInfo;
    end;
{* @ }

implementation


end.
