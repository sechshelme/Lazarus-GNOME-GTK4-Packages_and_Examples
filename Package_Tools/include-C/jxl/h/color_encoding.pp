
unit color_encoding;
interface

{
  Automatically converted by H2Pas 1.0.0 from color_encoding.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    color_encoding.h
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
PJxlColorEncoding  = ^JxlColorEncoding;
PJxlColorSpace  = ^JxlColorSpace;
PJxlPrimaries  = ^JxlPrimaries;
PJxlRenderingIntent  = ^JxlRenderingIntent;
PJxlTransferFunction  = ^JxlTransferFunction;
PJxlWhitePoint  = ^JxlWhitePoint;
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
 * @file color_encoding.h
 * @brief Color Encoding definitions used by JPEG XL.
 * All CIE units are for the standard 1931 2 degree observer.
  }
{$ifndef JXL_COLOR_ENCODING_H_}
{$define JXL_COLOR_ENCODING_H_}
{$include <stdint.h>}
{* Color space of the image data.  }
{* Tristimulus RGB  }
{* Luminance based, the primaries in JxlColorEncoding must be ignored. This
   * value implies that num_color_channels in JxlBasicInfo is 1, any other value
   * implies num_color_channels is 3.  }
{* XYB (opsin) color space  }
{* None of the other table entries describe the color space appropriately  }
type
  PJxlColorSpace = ^TJxlColorSpace;
  TJxlColorSpace =  Longint;
  Const
    JXL_COLOR_SPACE_RGB = 0;
    JXL_COLOR_SPACE_GRAY = 1;
    JXL_COLOR_SPACE_XYB = 2;
    JXL_COLOR_SPACE_UNKNOWN = 3;
;
{* Built-in whitepoints for color encoding. When decoding, the numerical xy
 * whitepoint value can be read from the JxlColorEncoding white_point field
 * regardless of the enum value. When encoding, enum values except
 * JXL_WHITE_POINT_CUSTOM override the numerical fields. Some enum values match
 * a subset of CICP (Rec. ITU-T H.273 | ISO/IEC 23091-2:2019(E)), however the
 * white point and RGB primaries are separate enums here.
  }
{* CIE Standard Illuminant D65: 0.3127, 0.3290  }
{* White point must be read from the JxlColorEncoding white_point field, or
   * as ICC profile. This enum value is not an exact match of the corresponding
   * CICP value.  }
{* CIE Standard Illuminant E (equal-energy): 1/3, 1/3  }
{* DCI-P3 from SMPTE RP 431-2: 0.314, 0.351  }
type
  PJxlWhitePoint = ^TJxlWhitePoint;
  TJxlWhitePoint =  Longint;
  Const
    JXL_WHITE_POINT_D65 = 1;
    JXL_WHITE_POINT_CUSTOM = 2;
    JXL_WHITE_POINT_E = 10;
    JXL_WHITE_POINT_DCI = 11;
;
{* Built-in primaries for color encoding. When decoding, the primaries can be
 * read from the JxlColorEncoding primaries_red_xy, primaries_green_xy and
 * primaries_blue_xy fields regardless of the enum value. When encoding, the
 * enum values except JXL_PRIMARIES_CUSTOM override the numerical fields. Some
 * enum values match a subset of CICP (Rec. ITU-T H.273 | ISO/IEC
 * 23091-2:2019(E)), however the white point and RGB primaries are separate
 * enums here.
  }
{* The CIE xy values of the red, green and blue primaries are: 0.639998686,
     0.330010138; 0.300003784, 0.600003357; 0.150002046, 0.059997204  }
{* Primaries must be read from the JxlColorEncoding primaries_red_xy,
   * primaries_green_xy and primaries_blue_xy fields, or as ICC profile. This
   * enum value is not an exact match of the corresponding CICP value.  }
{* As specified in Rec. ITU-R BT.2100-1  }
{* As specified in SMPTE RP 431-2  }
type
  PJxlPrimaries = ^TJxlPrimaries;
  TJxlPrimaries =  Longint;
  Const
    JXL_PRIMARIES_SRGB = 1;
    JXL_PRIMARIES_CUSTOM = 2;
    JXL_PRIMARIES_2100 = 9;
    JXL_PRIMARIES_P3 = 11;
;
{* Built-in transfer functions for color encoding. Enum values match a subset
 * of CICP (Rec. ITU-T H.273 | ISO/IEC 23091-2:2019(E)) unless specified
 * otherwise.  }
{* As specified in SMPTE RP 431-2  }
{* None of the other table entries describe the transfer function.  }
{* The gamma exponent is 1  }
{* As specified in IEC 61966-2-1 sRGB  }
{* As specified in SMPTE ST 2084  }
{* As specified in SMPTE ST 428-1  }
{* As specified in Rec. ITU-R BT.2100-1 (HLG)  }
{* Transfer function follows power law given by the gamma value in
     JxlColorEncoding. Not a CICP value.  }
type
  PJxlTransferFunction = ^TJxlTransferFunction;
  TJxlTransferFunction =  Longint;
  Const
    JXL_TRANSFER_FUNCTION_709 = 1;
    JXL_TRANSFER_FUNCTION_UNKNOWN = 2;
    JXL_TRANSFER_FUNCTION_LINEAR = 8;
    JXL_TRANSFER_FUNCTION_SRGB = 13;
    JXL_TRANSFER_FUNCTION_PQ = 16;
    JXL_TRANSFER_FUNCTION_DCI = 17;
    JXL_TRANSFER_FUNCTION_HLG = 18;
    JXL_TRANSFER_FUNCTION_GAMMA = 65535;
;
{* Renderig intent for color encoding, as specified in ISO 15076-1:2010  }
{* vendor-specific  }
{* media-relative  }
{* vendor-specific  }
{* ICC-absolute  }
type
  PJxlRenderingIntent = ^TJxlRenderingIntent;
  TJxlRenderingIntent =  Longint;
  Const
    JXL_RENDERING_INTENT_PERCEPTUAL = 0;
    JXL_RENDERING_INTENT_RELATIVE = 1;
    JXL_RENDERING_INTENT_SATURATION = 2;
    JXL_RENDERING_INTENT_ABSOLUTE = 3;
;
{* Color encoding of the image as structured information.
  }
{* Color space of the image data.
    }
{* Built-in white point. If this value is JXL_WHITE_POINT_CUSTOM, must
   * use the numerical whitepoint values from white_point_xy.
    }
{* Numerical whitepoint values in CIE xy space.  }
{* Built-in RGB primaries. If this value is JXL_PRIMARIES_CUSTOM, must
   * use the numerical primaries values below. This field and the custom values
   * below are unused and must be ignored if the color space is
   * JXL_COLOR_SPACE_GRAY or JXL_COLOR_SPACE_XYB.
    }
{* Numerical red primary values in CIE xy space.  }
{* Numerical green primary values in CIE xy space.  }
{* Numerical blue primary values in CIE xy space.  }
{* Transfer function if have_gamma is 0  }
{* Gamma value used when transfer_function is JXL_TRANSFER_FUNCTION_GAMMA
    }
{* Rendering intent defined for the color profile.  }
type
  PJxlColorEncoding = ^TJxlColorEncoding;
  TJxlColorEncoding = record
      color_space : TJxlColorSpace;
      white_point : TJxlWhitePoint;
      white_point_xy : array[0..1] of Tdouble;
      primaries : TJxlPrimaries;
      primaries_red_xy : array[0..1] of Tdouble;
      primaries_green_xy : array[0..1] of Tdouble;
      primaries_blue_xy : array[0..1] of Tdouble;
      transfer_function : TJxlTransferFunction;
      gamma : Tdouble;
      rendering_intent : TJxlRenderingIntent;
    end;
{* @ }

implementation


end.
